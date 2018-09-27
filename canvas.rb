require 'matrix'

class DrawingTool
  def initialize
    @UInput = UInput.new()
    @continue = true
  end

  # attr_reader :continue

  def run
    while @continue
      puts comand = @UInput.read
      if comand[0] == 'C'
        @canvas = Canvas.new(comand)
      elsif comand[0] == 'Q'
        @continue = false
      else
        puts "dibujando"
        @canvas.execute comand
        # @continue = false
      end
    end
  end
end

class UInput
  # def initialize
  # end

  def read
    puts "Ingrese comando"
    entrada = gets.chomp.split(" ")
    # entrada = "C 6 3".split(" ")
    # entrada = "C 6 3".split(" ")
  end

  # def validate
  #
  # end
end

class Canvas
  def initialize comand
    @width = comand[1].to_i
    @height = comand[2].to_i
    createMatrix
    drawCanvas
  end

  def execute comand
    case comand[0]
    when "L"
      drawLine comand
    when "R"
      drawRectangle comand
    when "B"
      paintArea comand
    else
      puts "Nones"
    end
    drawCanvas
  end

  private

  def createMatrix
    @matrix = Array.new(@width, [])
    for i in (0..@height-1)
      @matrix[0] << " "
    end
  end

  def drawLine comand
    # "C 20 4"
    # "L 1 2 6 2"
    x1 = comand[1].to_i
    x2 = comand[2].to_i
    y1 = comand[3].to_i
    y2 = comand[4].to_i
    for i in (x1..y1)
      puts "i: #{i}"
      drawCanvas
      for j in (x2..y2)
        puts "j: #{j}"
        @matrix[i][j] = "X"
        drawCanvas
      end
    end
  end
  #
  # def drawRectangle
  #
  # end
  #
  # def paintArea
  #
  # end

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
end

puts "Iniciamos"
drawingTool = DrawingTool.new()
puts "Corremos"
# drawingTool.run

# MATRICES
# puts Matrix.build(3) { rand }
# matrix = Matrix.build(2, 2) {|row, col| 0 }
# puts matrix
# puts matrix[0]
# matrix.each do |filas|
#   puts filas
#   # filas.each do |colum|
#   #   puts colum
#   # end
# end

# ARRAYS
# array = Array.new(2, [" "," "])
# array = Array.new(5, ["X","X"])

#Hacer matrix
ancho = 5
alto = 7
matrix = Array.new(ancho, [])
for i in (0..alto-1)
  matrix[0] << " "
end
puts "matrix: #{matrix}"
matrix[3] = [" "," ","X"," "," "," "," "]
puts "matrix[3]: #{matrix[3]}"
puts "matrix[3][0]: ,#{matrix[3][0]},"
puts "matrix[3][2]: #{matrix[3][2]}"
matrix[3][2] = "Y"
puts "matrix[3]: #{matrix[3]}"
puts "matrix[3][0]: ,#{matrix[3][0]},"
puts "matrix[3][2]: #{matrix[3][2]}"
#IMPRIMIR
filas = alto
columnas = ancho
rayas = "--"
for n in (1..columnas)
  rayas+="-"
end
puts rayas
for i in(0..filas - 1)
  fila = ""
  for j in(0..columnas-1)
    fila += matrix[j][i].to_s
  end
  puts "|"+fila+"|"
end
puts rayas

matrix.each do |item|
  puts item.inspect
end

#Imprimir
for i in(0..filas - 1)
  fila = ""
  for j in(0..columnas-1)
    fila += matrix[j][i].to_s
  end
  puts "|"+fila+"|"
end
