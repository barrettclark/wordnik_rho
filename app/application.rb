require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    @@toolbar = [
      { :action => :back,    :icon => '/public/images/back_btn.png' },
      { :action => :forward, :icon => '/public/images/forward_btn.png' },
      { :action => :separator },
      { :action => :home },
      { :action => '/app/Wordnik/random', :icon => '/public/images/whiteButton.png' },
      { :action => '/app/Wordnik/lookup', :icon => '/public/images/grayButton.png' }
    ]
    super
  end
end
