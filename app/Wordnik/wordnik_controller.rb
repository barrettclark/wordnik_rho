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

  def lookup    
  end
  def definition
    res = definitions(@params['word'])
    @word = res['body']
    render
  end
  
  protected
  def api_call(from)
    Rho::AsyncHttp.get(
      :url => "http://api.wordnik.com/api/#{from}",
      :headers => {'api_key' => '93258932a2cf8104dce2604abe90708fa097c4d18b9a26e52'}
    )
  end

  def definitions(word)
    api_call("word.json/#{word}/definitions")
  end
end
