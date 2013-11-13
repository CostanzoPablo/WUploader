load './lib/data_object.rb'
require 'net/http'
require 'time'
require 'json'
require 'yaml'
require 'sinatra/activerecord'

environment = ENV['RAKE_ENV'] || 'development'


class CollectData
	def initialize()
		puts "Initialized"
		@data_list = Hash.new
		#miniconfig...
		@station = YAML.load(ERB.new(File.read('config/station.yml')).result) || {}

	end

	def sendData
    last = IO::readlines(@station['path_last'])[0].to_i
    
   
    puts "Last sended: #{last} Sending #{@data_list.length}"

		if (@data_list.length >= 1) then
			postData = Net::HTTP.post_form(URI.parse(@station['url_post']), {'data'=>@data_list.to_json, 'token'=>@station['token']})
				
			if (postData.body == 'ok') then
				last = @data_list.keys.last
				File.open(@station['path_last'], 'w') { |file| file.write(last) }			
				@data_list = Hash.new
				puts "Data sended. Status: OK"
			else
				puts "ERROR. Fail for send."
				puts postData.body
			end
		end
	end

	def read()
    last = IO::readlines(@station['path_last'])

    lines = IO::readlines(@station['path_data'])
    lines.slice!(0,3)

    lines.each do | line |
      fields = line.split 
      fecha = Time.strptime("#{fields[0]} #{fields[1]}m", "%d/%m/%y %I:%M%P").to_i
      if (fecha > last[0].to_i) then
	      @data_list[fecha] = DataObject.new 	
	      @data_list[fecha].save(fecha, @station['id'], fields, @station['name'], @station['adress'], @station['url'], @station['lat'], @station['long'])
	    end
    end
	end
end