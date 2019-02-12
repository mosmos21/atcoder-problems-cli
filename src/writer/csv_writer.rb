require './src/writer/writer'

class CsvWriter < Writer
  def write_result(result)
    header = result[0].keys
    puts header.join(',')
    puts result.map{|r| header.map{|h| r[h]}.join(',')}
  end
end