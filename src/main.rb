require './src/util/file_loader'
require './src/util/at_coder_problems'
require './src/command/command_factory'
require './src/writer/writer_factory'

COMMANDS = %w(contest problem count user submission)

OPTIONS = %w(type contestid problemid group nums userid result sort order)
OPTIONS_FULL = OPTIONS.map {|s| "--#{s}"}
OPTIONS_SHORT = OPTIONS.map {|s| "-#{s[0]}"}

def get_key(key)
  return key[2..] if 2 < key.length
  OPTIONS[OPTIONS.index {|cmd| cmd[0] == key[1]}]
end

args = ARGV.map(&:downcase)
if args.length == 0 || args.include?('--help')
  puts FileLoader.load './help.txt'
elsif args.include?('--version')
  puts FileLoader.load './version.txt'
else

  if COMMANDS.none? {|cmd| args.include?(cmd)}
    puts '[ERROR] コマンドが指定されていません。指定可能なコマンドは--helpを参照してください。'
    exit!
  end

  # コマンドの特定とオプションの連想配列化
  command_str = ''
  options = {:type => 'table', :nums => '10'}
  until args.empty?
    if COMMANDS.include?(args[0]) && command_str.empty?
      command_str = args.shift.capitalize
    else
      arg = args.shift
      if OPTIONS_FULL.include?(arg) || OPTIONS_SHORT.include?(arg)
        if args.empty? || COMMANDS.include?(args[0])
          puts "[ERROR] オプションに引数がありません。[#{arg}]"
          exit!
        end
        options[get_key(arg).to_sym] = args.shift
      else
        puts "[ERROR] 無効なオプションです。[#{arg}]"
        exit!
      end
    end
  end

  # 実行
  begin
    cmd = CommandFactory.get_instance(command_str, options)
    writer = WriterFactory.get_instance(options[:type].capitalize)
    result = cmd.execute
    writer.write(result)
  rescue NameError => e
    puts "[ERROR] #{command_str}コマンドのインスタンスの作成に失敗しました。"
    puts e
  rescue Exception => e
    puts e.message
  end
end