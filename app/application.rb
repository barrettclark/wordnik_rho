require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    @@toolbar = [
      { :action => :home },
      { :action => :separator },
      { :action => '/app/Wordnik/random', :icon => '/public/images/crystal_clear_kblackbox.png' },
      { :action => '/app/Wordnik/lookup', :icon => '/public/images/crystal_clear_find.png' }
    ]
    super
  end
end
