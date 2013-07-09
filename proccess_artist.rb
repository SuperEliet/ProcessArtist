require 'ruby-processing'

class ProcessArtist < Processing::App
  def setup
    background(150, 50, 50)
    fill(123,123,123)
    ellipse_mode CENTER
    rect_mode CENTER
    @size = 100
    @queue = ""
  end
  
  def draw
    # Do Stuff
  end

  def mouse_dragged
    # warn "MouseX: #{mouse_x}, MouseY: #{mouse_y}"
    rect(mouse_x, mouse_y, 20, 20)
    # oval(mouse_x, mouse_y, 10, 10)
    # triangle(mouse_x, mouse_y, mouse_x + 50, mouse_y + 50, mouse_x - 50, mouse_y + 50)
    case @shape
    when "s1" then rect(mouse_x, mouse_y, @size, @size)
    when "s2" then rect(mouse_x, mouse_y, @size * 2, @size * 4)
    when "s3" then oval(mouse_x, mouse_y, @size, @size)
    when "s4" then oval(mouse_x, mouse_y, @size / 2, @size / 4)
    when "s5" then triangle(mouse_x, mouse_y, @size, @size, @size, @size)
    when  "s6" then stroke(rand(255), rand(255), rand(255), rand(255))
     fill(rand(255), rand(255), rand(255))

    else
      warn "I don't know that command"
    end

  end
  
  def mouse_releaseds1
    warn "The mouse was released!"
    !mouse_dragged
  end 

  def key_pressed
  	warn "A key was pressed! #{key.inspect}"
  	@queue ||= ""
   #  if key != "\n" && key.is_a?(String)
   #    warn "Adding #{key} to the queue"
   #  	@queue += key
  	# elsif key == "\n"
   #  	warn "Time to run the command: #{@queue}"
   #  	run_command(@queue)
   #  	@queue = ""
  	# end

    if !key.is_a?(String)
      warn "That wasn't a string"
      return
    end 

    if key == "="
      @size += 100
    elsif key == "-"
      @size -= 100
    elsif key != "\n" && key.is_a?(String)
      warn "Adding #{key} to the queue"
      @queue += key
    elsif key == "\n"
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
    elsif command.start_with?("f") || command.start_with?("F")
      fill(com_slice_split[0].to_i,com_slice_split[1].to_i,com_slice_split[2].to_i)
    elsif command.start_with?("s") || command.start_with?("S")
      @shape = command
    end
  end
end

ProcessArtist.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)