require './src/command/command'
require './src/util/at_coder_problems'
require './src/util/record_util'

class CommandCount < Command
  def initialize(options)
    super(options, 'count', [:group])
  end

  def execute_all
    res = get_record(@options[:group])
    return res unless @options.key?(:userid)
    res.select {|c| c['user_id'] == @options[:userid]}
  end

  private

  def get_record(group)
    case group
    when 'accept'
      AtCoderProblems::get_accepted_cont
    when 'short'
      AtCoderProblems::get_short_code_count
    when 'fastest'
      AtCoderProblems::get_fastest_code_count
    when 'first'
      AtCoderProblems::get_fastest_code_count
    when 'point'
      AtCoderProblems::get_rated_point_sum
    when 'lang'
      AtCoderProblems::get_accepted_count_for_lang
    end
  end
end