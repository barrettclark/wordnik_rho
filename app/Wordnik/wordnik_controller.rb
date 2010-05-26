require 'rho/rhocontroller'

class WordnikController < Rho::RhoController

  # GET /Wordnik
  def index
    res = api_call("wordoftheday.json")
    @word = res['body']
  end
  def random
    res1 = api_call("words.json/randomWord?hasDictionaryDef=true")
    # puts "\n\n#{res1}\n\n"
    @word = urlencode(res1['body']['wordstring'])
    res2 = api_call("word.json/#{@word}/definitions")
    @definitions = res2['body']
    # puts "\n\n>>> #{@definitions.class} #{@definitions} <<<\n\n"
    if @definitions.class == String
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
    res = api_call("word.json/#{@params['word']}/definitions")
    @definitions = res['body']
    puts "#{@definitions}"
    render :action => :random
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
