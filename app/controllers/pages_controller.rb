class PagesController < ApplicationController
  def index
    @prefs = pref
    
  end

  # p params
private
  
  def pref
    base_url = 'https://api.gnavi.co.jp/master/PrefSearchAPI/v3/'
	    
	  parameters = {
	    'keyid' => '282619479f7052e7c6a53ddb3dde2f25',
	    'lang' =>'ja'
	  }
	    
	  uri = URI(base_url + '?' + parameters.to_param)
	    
	  response_json = Net::HTTP.get(uri)
	  response_data = JSON.parse(response_json)
	    
	  prefs = response_data['pref']
    prefs = prefs.each{|id,(pref_code, pref_name)| puts "#{id}: #{pref_code}, #{pref_name}"}
  end

  # def search
  #   base_url='https://api.gnavi.co.jp/RestSearchAPI/v3'

  #   parameters = {
  #     'keyid' => '282619479f7052e7c6a53ddb3dde2f25',
  #     'freeword' => params[:freeword],
  #   }
  # end
end