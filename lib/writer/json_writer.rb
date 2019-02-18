require 'json'
require './src/writer/writer'
class JsonWriter < Writer
  def write_result(result)
    puts JSON.generate(result)
  end
end