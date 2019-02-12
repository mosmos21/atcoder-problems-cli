require './src/writer/writer'

class TableWriter < Writer

  def write_result(result)
    header = result[0].keys
    write_one(header, result[0]) if result.length == 1
    write_all(header, result)
  end

  private

  def write_one(header, result)
    max1 = header.map(&:length).max
    max2 = header.map {|h| result[h].to_s}.map(&:length).max
    lines = create_line([max1, max2])
    puts lines
    header.each {|column|
      puts "|#{column.ljust(max1)}|#{result[column].to_s.ljust(max2)}|"
      puts lines
    }
  end

  def write_all(header, result)
    nums = header.map {|column| [column.length, result.map {|r| r[column].to_s.length}.max].max}
    lines = create_line(nums)
    puts lines
    puts "|#{header.map.with_index{|c, i| c.ljust(nums[i])}.join('|')}|"
    puts lines
    result.each{|r|
      puts "|#{header.map.with_index{|c, i| r[c].to_s.ljust(nums[i])}.join('|')}|"
      puts lines
    }
  end

  def create_line(nums)
    "+#{nums.map {|n| '-' * n}.join('+')}+"
  end
end