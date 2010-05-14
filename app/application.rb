require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    @@toolbar = [
      { :action => '/app/WordnikController/index' },
      { :action => '/app/WordnikController/random' },
      { :action => '/app/WordnikController/lookup' }
    ]
  end
end
