class CommandFactory
  class << self
    def get_instance(name, options)
      cls = eval "Command#{name}"
      cls.new(options)
    end
  end
end