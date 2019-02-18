class RecordUtil

  def self.sort!(record, column, order)
    unless record[0].key?(column)
      columns = record[0].keys.join(', ')
      raise Exception.new("[ERROR] ソートするキーが存在しません。指定可能な値は[#{columns}]です。")
    end
    record.sort_by!{|c| c[column]}
    record.reverse! if order == 'desc'
  end
end