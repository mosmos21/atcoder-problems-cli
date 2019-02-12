require './src/command/command'
require './src/util/at_coder_problems'
require './src/util/record_util'

class CommandContest < Command
  def initialize(options)
    super(options, 'contest')
  end

  def execute
    res = AtCoderProblems::get_contests
    return res if res.length == 0
    return res.select{|c| c['id'] == @options[:contestid]} if @options.key?(:contestid)

    # ソート
    RecordUtil::sort!(res, @options[:sort],
                      @options.fetch(:order, 'asc')) if @options.key?(:sort)

    count = @options[:nums].to_i
    return res if count == -1
    # レコード数を制限して返す
    res.slice(0, count)
  end
end