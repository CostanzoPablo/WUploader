require 'time'

class DataObject

	def initialize
		@data = Hash.new
	end

	def save(fecha, id_station, fields, name, adress, url, lat, long)
	  @data['id_station'] = id_station	
	  @data['name'] = name	
	  @data['adress'] = adress
	  @data['url'] = url
	  @data['lat'] = lat
	  @data['long'] = long			
	  @data['captured_at'] = fecha
	  @data['temperature'] = fields[2]
	  @data['high_temperature'] = fields[3]
	  @data['low_temperature'] = fields[4]
	  @data['humidity'] = fields[5]
	  @data['dew'] = fields[6]
	  @data['wind_speed'] = fields[7]
	  @data['wind_direction'] = fields[8]
	  @data['wind_run'] = fields[9]
	  @data['hi_speed'] = fields[10]
	  @data['hi_dir'] = fields[11]
	  @data['wind_chill'] = fields[12]
	  @data['heat'] = fields[13]
	  @data['thw'] = fields[14]
	  @data['thsw'] = fields[15]
	  @data['bar'] = fields[16]
	  @data['rain'] = fields[17]
	  @data['rain_rate'] = fields[18]
	  @data['solar_radiation'] = fields[19]
	  @data['solar_energy'] = fields[20]
	  @data['hi_solar_radiation'] = fields[21]
	  @data['uv'] = fields[22]
	  @data['uv_dose'] = fields[23]
	  @data['hi_uv'] = fields[24]
	  @data['heat_d_d'] = fields[25]
	  @data['in_temperature'] = fields[26]
	  @data['in_humidity'] = fields[27]
	  @data['in_dew'] = fields[28]
	  @data['in_heat'] = fields[29]
	  @data['in_emc'] = fields[30]
	  @data['in_air_density'] = fields[31]
	  @data['et'] = fields[32]
	  @data['wind_samp'] = fields[33]
	  @data['wind_tx'] = fields[34]
	  @data['iss_recept'] = fields[35]
	  @data['arc_int'] = fields[36]
	end

	def to_json(*args)
		@data.to_json
	end
end