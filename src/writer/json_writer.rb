require 'json'
class JsonWriter
  def write(result)
    puts JSON.generate(result)
  end
end