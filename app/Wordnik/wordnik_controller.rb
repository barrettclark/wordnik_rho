require 'rho/rhocontroller'

class WordnikController < Rho::RhoController

  def index
    @word = api_call("wordoftheday.json")['body']
  end
  
  def random
    res1 = api_call("words.json/randomWord?hasDictionaryDef=true")
    @word = urlencode(res1['body']['wordstring'])
    @definitions = api_call("word.json/#{@word}/definitions")['body']
    if @definitions.class == String || @definitions == Array.new
      render :action => 'unfound'
    else
      render
    end
  end

  def lookup
  end
  def suggest
  end
  def unfound
  end
  
  def definition
    @word = @params['word']
    @definitions = api_call("word.json/#{@word}/definitions")['body']
    if @definitions == Array.new
      @suggestions = api_call("word.json/#{@word}?useSuggest=true&literal=false")['body']
      if @suggestions['suggestions']
        render :action => 'suggest'
      else
        @definitions = api_call("word.json/#{@suggestions['wordstring']}/definitions")['body']
        if @definitions.size > 0
          render :action => 'random'
        else
          render :action => 'unfound'
        end
      end
    elsif @definitions.class == String
      render :action => 'unfound'
    else
      render :action => 'random'
    end
  end
  
  protected
  def api_call(from)
    Rho::AsyncHttp.get(
      :url => "http://api.wordnik.com/api/#{from}",
      :headers => {'api_key' => '93258932a2cf8104dce2604abe90708fa097c4d18b9a26e52'}
    )
  end

  def urlencode(str)
    str.gsub!(/ /, '+')
    str.gsub!(/'/, '%27')
    str
  end
end
