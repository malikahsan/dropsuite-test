files = Dir["**/*"]

arr, arr_2d = [], []
files.each do |file_name|
  if !File.directory? file_name
    next if file_name == 'main.rb'
    puts file_name
    File.open(file_name) do |file|
      file.each_line do |line|
        arr << line
        puts "Found: #{line}"
      end
    end
  end
end

arr.uniq.each do |content|
  arr_2d << [content, arr.count(content)]
end
puts "--------------------------"
arr_2d.map{|result| puts "#{result[0]}: #{result[1]}" }