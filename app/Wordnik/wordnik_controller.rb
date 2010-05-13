require 'rho/rhocontroller'

class WordnikController < Rho::RhoController

  # GET /Wordnik
  def index
    res = api_call("wordoftheday.json")
    @word = res['body']
    render
  end
  def random
    res = api_call("words.json/randomWord?hasDictionaryDef=true")
    @word = res['body']
    render
  end
  
  protected
  
  def api_call(from)
    Rho::AsyncHttp.get(
      :url => "http://api.wordnik.com/api/#{from}",
      :headers => {'api_key' => ''}
    )
  end

end
