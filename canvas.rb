# require 'matrix'

class DrawingTool
  def initialize
    @UInput = UInput.new()
    @continue = true
  end

  # attr_reader :continue

  def run
    while @continue
      puts command = @UInput.read
      if command[0] == 'C'
        @canvas = Canvas.new(command)
      elsif command[0] == 'Q'
        @continue = false
      else
        @canvas.execute command
        # @continue = false
      end
    end
  end
end

class UInput
  # def initialize
  # end

  def read
    puts "Ingrese commando"
    entrada = gets.chomp.split(" ")
  end

  # def validate
  #
  # end
end

class Canvas
  def initialize command
    @width = command[1].to_i
    @height = command[2].to_i
    createMatrix
    drawCanvas
  end

  def execute command
    case command[0]
    when "L"
      drawLine command
    when "R"
      drawRectangle command
    when "B"
      paintArea command
    else
      puts "Nones"
    end
    drawCanvas
  end

  private

  def createMatrix
    @matrix = []
    for columna in (0..@width-1)
      @matrix << []
      @height.times do
        @matrix[columna] << " "
      end
    end
  end

  def drawLine command
    # puts command.inspect
    x1 = command[1].to_i - 1
    y1 = command[2].to_i - 1
    x2 = command[3].to_i - 1
    y2 = command[4].to_i - 1
    for i in (x1..x2)
      for j in (y1..y2)
        @matrix[i][j] = "X"
      end
    end
  end

  def drawRectangle command
    x1 = command[1].to_i
    y1 = command[2].to_i
    x2 = command[3].to_i
    y2 = command[4].to_i

    drawLine ["" ,x1, y1  , x2, y1  ]
    drawLine ["" ,x1, y2  , x2, y2  ]
    drawLine ["" ,x1, y1+1, x1, y2-1]
    drawLine ["" ,x2, y1+1, x2, y2-1]
  end

  def drawCanvas
    rayas = "--"
    for n in (1..@width)
      rayas+="-"
    end
    puts rayas
    for i in(0..@height - 1)
      fila = ""
      for j in(0..@width-1)
        fila += @matrix[j][i].to_s
      end
      puts "|" + fila + "|"
    end
    puts rayas
  end

  # def paintArea
  #
  # end

end

puts "Iniciamos"
drawingTool = DrawingTool.new()
puts "Corremos"
drawingTool.run
