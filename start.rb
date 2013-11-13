require_relative 'script.rb'

c = CollectData.new

while (true) do
	sleep 5#*60
	c.read
	c.sendData
end