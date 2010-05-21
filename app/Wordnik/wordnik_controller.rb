require 'rho/rhocontroller'

class WordnikController < Rho::RhoController

  # GET /Wordnik
  def index
    res = api_call("wordoftheday.json")
    @word = res['body']
  end
  def random
    res1 = api_call("words.json/randomWord?hasDictionaryDef=true")
    word = res1['body']
    res2 = api_call("word.json/#{word['wordstring']}/definitions")
    @definitions = res2['body']
    puts "#{@definitions}"
  end

  def lookup    
  end
  def definition
    res = api_call("word.json/#{@params['word']}/definitions")
    @definitions = res['body']
    puts "#{@definitions}"
    render :action => :random
  end
  
  protected
  def api_call(from)
    Rho::AsyncHttp.get(
      :url => "http://api.wordnik.com/api/#{from}",
      :headers => {'api_key' => 'my_api_key'}
    )
  end
end
