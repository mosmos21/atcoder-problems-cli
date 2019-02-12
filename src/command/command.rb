def create_message(option, values)
  "[ERROR] #{option}オプションに指定できない文字が含まれています。指定可能なタイプは[#{values.join(', ')}]です。"
end

class Command
  def initialize(options, name, required = [])
    validate_args(options, name, required)
    @options = options
  end

  private
  def validate_args(args, name, required)
    unless required.all? {|r| args.keys.include?(r.to_sym)}
      options = required.map {|s| "--#{s}"}.join(", ")
      msg = "[ERROR] #{name}コマンドに必須のオプションが不足しています。必須オプションは[#{options}]です。"
      raise Exception.new(msg)
    end

    types = %w(text json csv)
    if args.key?(:type) && types.none? {|v| args[:type] == v}
      msg = create_message('--type', types)
      raise Exception.new(msg)
    end

    if args.key?(:nums) && (args[:nums] =~ /^[0-9]+$/).nil?
      msg = '[ERROR] --numsオプションは数字のみ指定することができます。'
      raise Exception.new(msg)
    end

    results = %w(CE MLE TLE RE OLE IE WA AC)
    if args.key?(:result) && results.none? {|v| args[:result] == v}
      msg = create_message('--result', results)
      raise Exception.new(msg)
    end

    orders = %w(asc desc)
    if args.key?(:order) && orders.none? {|v| args[:result] == v}
      msg = create_message('--order', orders)
      raise Exception.new(msg)
    end
  end
end