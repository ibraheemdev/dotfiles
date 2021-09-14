require 'optparse'

class AudioManager
  def watch
    first = true
  
    IO.popen("pactl subscribe") do |pipe|
      loop do
        if first
          first = false
        else
          event = pipe.gets
          if event =~ /on card|on sink|on server/
            continue
          end
        end
  
        output
      end
    end
  end
  
  def output
  end
  
  def volume
    @volume = `pactl list sinks | grep -A 15 -E "^Sink #$1\$" | grep 'Volume:' | grep -E -v 'Base Volume:' | awk -F : '{print $3; exit}' | grep -o -P '.{0,3}%' | sed 's/.$//' | tr -d ' '`
  end
end

manager = AudioManager.new
OptionParser.new do |opts|
  opts.on("--watch") do
    manager.watch
  end
end.parse!

