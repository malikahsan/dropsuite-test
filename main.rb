if ARGV.length < 1
  puts "Please provide a folder path"
  exit
elsif ARGV.length > 1
  puts "No more than one the folder path"
  exit
end

require_relative 'loader'

class ReadContent
  def initialize(path: "")
    @path = path
  end

  def count_same_content
    horizontal_loading(20)
    @path = @path.to_s.chars.last == '/' ? "#{@path}**/*" : "#{@path}/**/*"
    files = Dir["#{@path}"]
    if files.empty?
      puts "The forlder is empty"
      exit
    end

    arr, arr_2d = [], []
    files.each do |file_name|
      if !File.directory? file_name
        puts file_name
        File.open(file_name) do |file|
          file.each_line do |line|
            arr << line
            puts "Found: #{line}"
          end
          file.close
        end
      end
    end

    arr.uniq.each do |content|
      arr_2d << [content, arr.count(content)]
    end
    puts "\n=====SCAN RESULT====="
    arr_2d.map{|result| puts "#{result[0]}: #{result[1]}" }
  end
end

obj = ReadContent.new(path: "#{ARGV.first}")
return obj.count_same_content
