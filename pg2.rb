
require 'colorize'

begin

logo = %{
  ██████╗     ██╗    ███╗   ██╗     ██████╗     ███████╗    ██████╗
  ██╔══██╗    ██║    ████╗  ██║    ██╔════╝     ██╔════╝    ██╔══██╗
  ██████╔╝    ██║    ██╔██╗ ██║    ██║  ███╗    █████╗      ██████╔╝
  ██╔═══╝     ██║    ██║╚██╗██║    ██║   ██║    ██╔══╝      ██╔══██╗
  ██║         ██║    ██║ ╚████║    ╚██████╔╝    ███████╗    ██║  ██║
  ╚═╝         ╚═╝    ╚═╝  ╚═══╝     ╚═════╝     ╚══════╝    ╚═╝  ╚═╝

}

puts logo.colorize(:white)

sleep 0.4
print "Checking connection".colorize(:white)
"..........".each_char do |c|
  sleep 0.1
  print c.colorize(:white)
end
print "\n"

isOnline = system("ping -c 1 -t 1 #{ARGV[0]} > /dev/null 2>&1")
print "\n"


sleep 0.3
#binding.pry
if isOnline == true
        puts "Connectivity check sucessful!".colorize(:green)
        print "\n"
        print "Cancel with Ctr C at any time.".colorize(:white)
        print "\n"
        loop do
        a = 1
        b = 0

        while a > b
          isOnline = system("ping -c 1 -t 1 #{ARGV[0]} > /dev/null 2>&1")
          if isOnline == true
        ping = `ping -c 1 #{ARGV[0]} | grep byte | tail -n 1`
        dateTime = `echo $(date)`
        responseArr = ping.split(" ")
        responseTime = "#{responseArr[6]}" + "#{responseArr[7]}"
        exactTimeArr = responseTime.split("=")
        exactTime = exactTimeArr[1].to_s.gsub("ms", "").to_i

        if exactTime <= 50
          puts "#{dateTime.gsub("\n", "").colorize(:green)} #{ping.gsub("\n", "").colorize(:green)} 🤗👍"
          sleep 1
        elsif exactTime > 60
          puts "#{dateTime.gsub("\n", "").colorize(:red)} #{ping.gsub("\n", "").colorize(:red)} 🤬"
          sleep 1
        else
          puts "#{dateTime.gsub("\n", "").colorize(:yellow)} #{ping.gsub("\n", "").colorize(:yellow)} 💩"
          sleep 1
        end
      else
        puts "ERROR: No route to host".colorize(:red)
        sleep 2
      end
        b += 1
        a += 1
        end
      end
 else
   puts "ERROR: No route to host".colorize(:red)

 end


rescue SystemExit, Interrupt
  # ...will cause this code to run
  print "\n"
  puts "Interuption/Exit Detected".colorize(:red)
  print "\n"
end
#end
