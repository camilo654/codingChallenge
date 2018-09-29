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
      puts "Comando erroneo."
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

  def drawCanvas
    rayas = "--"
    for n in (1..@width)
      rayas += "-"
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

  def drawLine command
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

  def paintArea command
    x = command[1].to_i - 1
    y = command[2].to_i - 1
    color = command[3]
    if validCoordinate x, y, "X"
      queue = Array.new
      queue.push([x,y])
      while !queue.empty?
        if validCoordinate x-1, y, color
          queue.push([x-1, y])
        end
        if validCoordinate x+1, y, color
          queue.push([x+1, y])
        end
        if validCoordinate x, y-1, color
          queue.push([x, y-1])
        end
        if validCoordinate x, y+1, color
          queue.push([x, y+1])
        end
        @matrix[x][y] = color
        queue.shift()
        coordinate = queue.first if !queue.empty?
        x = coordinate[0]
        y = coordinate[1]
      end
    end
  end

  def validCoordinate x, y, color
    if x < 0 || y < 0 || x > @width - 1 || y > @height - 1 || @matrix[x][y] == color || @matrix[x][y] == "X"
      return false
    end
    return true
  end
end
