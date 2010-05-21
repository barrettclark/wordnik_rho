require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # icons by Joseph Wain / glyphish.com
    @@toolbar = [
      { :action => :home },
      { :action => :separator },
      { :action => '/app/Wordnik/random', :icon => '/public/images/05-shuffle.png' },
      { :action => '/app/Wordnik/lookup', :icon => '/public/images/96-book.png' }
    ]
    super
  end
end
