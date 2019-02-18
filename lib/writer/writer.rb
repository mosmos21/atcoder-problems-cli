class Writer

  class << self
    def get_instance(type)
      cls = eval "#{type}Writer"
      cls.new
    end
  end

  def write(result)
    if result.length == 0
      puts '結果レコードは0件でした。'
    elsif write_result(result)
    end
  end

  def write_result(_)
    raise Exception.new('[ERROR] 未実装のメソッドが呼ばれています。')
  end
end