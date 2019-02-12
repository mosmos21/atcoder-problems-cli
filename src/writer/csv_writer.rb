class CsvWriter
  def write(result)
    return if result.length == 0
    header = result[0].keys
    puts header.join(',')
    puts result.map{|r| header.map{|h| r[h]}.join(',')}
  end
end