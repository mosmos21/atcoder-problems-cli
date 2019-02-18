class FileLoader

  def self.load(path)
    lines = []
    File.open(path){|f| lines = f.readlines }
    return lines
  end
end