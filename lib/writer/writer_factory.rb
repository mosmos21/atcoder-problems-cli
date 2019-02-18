class WriterFactory
  def self.get_instance(type)
    cls = eval "#{type}Writer"
    cls.new
  end
end