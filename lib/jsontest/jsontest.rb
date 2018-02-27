require 'HTTParty'
require 'json'

class Jsontest
  include HTTParty

  def initialize
  end

  def all
    
  end

end

type_form = Jsontest.new
puts type_form.all
