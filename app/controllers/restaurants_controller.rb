class RestaurantsController < ApplicationController
	def index
	end
	
	def search
		@prefs = pref_lists
	end
	
	private
	  
	  def pref_lists
		base_url = 'https://api.gnavi.co.jp/master/PrefSearchAPI/v3/'
			
		parameters = {
		  'keyid' => '282619479f7052e7c6a53ddb3dde2f25',
		  'lang' =>'ja'
		}
			
		uri = URI(base_url + '?' + parameters.to_param)
			
		response_json = Net::HTTP.get(uri)
		response_data = JSON.parse(response_json)
		
		# p response_data
	  prefs = response_data['pref']
	  pref_names = []
	  prefs.each do |prefecture_data|
		pref_names << prefecture_data["pref_name"]
	  end
	
	  p pref_names
	  # prefs = prefs.each{|id,(pref_code, pref_name)| puts "#{id}: #{pref_code}, #{pref_name}"}
	  end
end
