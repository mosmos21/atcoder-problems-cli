require './src/writer/csv_writer'
require './src/writer/json_writer'
require './src/writer/table_writer'

class WriterFactory
  def self.get_instance(type)
    cls = eval "#{type}Writer"
    cls.new
  end
end