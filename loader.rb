BARS_COUNT = 1
SYMBOLS = %w|.|
PINWHEEL = %w{. / -  \\}
BARS = ['']

BARS_COUNT.times { puts } # prepare the space

def horizontal_loading(time)
  time.times do |i| 
    print "\033[#{BARS_COUNT}A"
    BARS_COUNT.times do |pos|
      puts "SCANNING"+"\033[#{i * SYMBOLS[pos].length}C#{SYMBOLS[pos]}"+PINWHEEL.rotate!.first
    end 
    sleep 0.1 
  end
end
