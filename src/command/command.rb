require './src/command/command_contest'

class Command

  def self.get_instance(name, options)
    cls = eval "Command#{name.capitalize}"
    cls.new(options)
  end

  def self.validate_args(args, name, required)
    unless required.all?{|r| args.keys.include?(r.to_sym)}
      options = required.map{|s| "--#{s}"}.join(", ")
      msg = "[ERROR] #{name}コマンドに必須のオプションが不足しています。必須オプションは[#{options}]です。"
      raise Exception.new(msg)
    end
  end
end