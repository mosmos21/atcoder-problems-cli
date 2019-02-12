class Writer

  def write(result)
    if result.length  == 0
      puts '結果レコードは0件でした。'
    elsif
      write_result(result)
    end
  end

  def write_result(result)
    raise Exception.new('[ERROR] 未実装のメソッドが呼ばれています。')
  end
end