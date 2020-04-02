class RestaurantsController < ApplicationController
	require "pry"

	def index
		p params
	end
	
	def create

	end
	
	def search
		@prefs = pref_lists
	end
	
	def result
		# binding.pry
		base_url='https://api.gnavi.co.jp/RestSearchAPI/v3'
      
	    parameters = {
	      'keyid' => 'b35ede964272d8030ce8cbf69c942bb8',
		  'category_l' => 'RSFST16000',
		  'freeword' => params[:search],
	      'pref' => 'PREF13',
	      'hit_per_page' => 10
	    }
	      
	    uri = URI(base_url + '?' + parameters.to_param)
	    response_json = Net::HTTP.get(uri)
		response_data = JSON.parse(response_json)
		
		@rests = response_data['rest']
		p @rests
		# @result = []
		# shop = {}

		# if rests
		# 	rests.each do |rest|
		# 		shop[:shop_name] = rest['name']
		# 		shop[:tel] =rest['tel']
		# 	end
		# end
		# p shop
	end

	private
	  
	  def pref_lists
		base_url = 'https://api.gnavi.co.jp/master/PrefSearchAPI/v3/'
			
		parameters = {
		  'keyid' => 'b35ede964272d8030ce8cbf69c942bb8',
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

	#   def search_params
	# 	base_url = 'https://api.gnavi.co.jp/master/PrefSearchAPI/v3/?keyid='

	# 	keyid = 'b35ede964272d8030ce8cbf69c942bb8'
	# 	parameters = {
	# 	  'lang' =>'ja',
	# 	  'freeword' => params[:freeword],
	# 	  'category_l' => 'RSFST16000',
	# 	#   'hit_per_page' => 10
	# 	}
	# 	 uri = URI(base_url + keyid + parameters.to_param)
    #     response_json = Net::HTTP.get(uri)
    #   	response_data = JSON.parse(response_json)
	# 	end
end