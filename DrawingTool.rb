load 'UInput.rb'
load 'Canvas.rb'

class DrawingTool
  def initialize
    @UInput = UInput.new()
    @continue = true
    @boardCreated = false
  end

  def run
    while @continue
      puts command = @UInput.read
      if command[0] == 'C'
        @canvas = Canvas.new(command)
        @boardCreated = true
      elsif command[0] == 'Q'
        @continue = false
      else
        @boardCreated ? @canvas.execute(command) : puts("Cree un tablero primero.")
      end
    end
  end
end
