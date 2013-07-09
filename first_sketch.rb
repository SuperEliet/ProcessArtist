require 'ruby-processing'

class FirstSketch < Processing::App
	def setup
		background(255, 255, 255)
	end

	def draw(stroke, stroke_weight, fill)
		stroke(254, 254, 254)
		stroke_weight(34,43,53)
		fill(243+rand(32), 243+rand(32), 243+rand(32), 243+rand(32))
		rect(rand(400), rand(400), rand(400), rand(400))

		if @i.nil? || @i == 300
			@i = 0
		end
		@i = @i + 2

			fill(255, 110, 75)
			rect(90, @i, @i, 70)
		end

	def key_pressed
  warn "A key was pressed! #{key.inspect}"
 		if @queue.nil?
  	 	@queue = ""
 		end
 		if key != "\n"
 		 	@queue = @queue + key
 		else
   		warn "Time to run the command: #{@queue}"
   		run_command(@queue)
   		@queue = ""
 		end
  end

  def run_command(command)
 	puts "Running Command #{command}"
 	command_slice = command.slice(1, command.length - 1)
 	com_slice_split = command_slice.split(",")
 		if command.start_with?("b") || command.start_with?("B")
 			background(com_slice_split[0].to_i,com_slice_split[1].to_i,com_slice_split[2].to_i)
 		end
	end
end

FirstSketch.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)