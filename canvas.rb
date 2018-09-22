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
        @canvas = Canvas.new(comand[1], comand[2])
      elsif comand[0] == 'Q'
        continue = false
      else
        puts "dibujando"
        # @canvas.execute comand
      end
      @continue = false
    end
  end
end

class UInput
  # def initialize
  # end

  def read
    puts "Ingrese comando"
    entrada = "C 2 2".split(" ")
  end

  # def validate
  #
  # end
end

class Canvas
  def initialize width, height
    @width = width
    @height = height
    createMatrix
    drawCanvas
  end

  # def execute comand
  #   case comand[0]
  #   when "L"
  #     drawLine comand
  #   when "R"
  #     drawRectangle comand
  #   when "B"
  #     paintArea comand
  #   else
  #     puts "Nones"
  #   end
  # end

  private
  # def drawLine
  #
  # end
  #
  # def drawRectangle
  #
  # end
  #
  # def paintArea
  #
  # end

  def createMatrix
    @matrix = Array.new(@width.to_i, [])
    @matrix.each do |column|
      column = Array.new(@height.to_i, [1])
    end
    puts @matrix
  end

  def drawCanvas
    puts "matriz de #{@width} * #{@height}"
    @matrix.each do |column|
      # @colum.each do |item|
        puts item
      # end
    end
  end
end

puts "Iniciamos"
drawingTool = DrawingTool.new()
puts "Corremos"
# drawingTool.run

# MATRICES
# puts Matrix.build(3) { rand }
# matriz = Matrix.build(2, 2) {|row, col| 0 }
# puts matriz
# puts matriz[0]
# matriz.each do |filas|
#   puts filas
#   # filas.each do |colum|
#   #   puts colum
#   # end
# end

# ARRAYS
array = Array.new(2, [" "," "])
array = Array.new(5, ["X","X"])

#Hacer Matriz
ancho = 5
alto = 7
matriz = Array.new(ancho, [])
puts matriz.length
puts matriz[0].class
for i in (0..alto-1)
  puts "i: #{i}"
  # for j in (0..alto-1)
    # puts "  j: #{j}"
    matriz[0] << "X"
    # puts matriz[i][j]
  # end
  # puts matriz[i].length
end
puts "Matriz: #{matriz}"
#IMPRIMIR
filas = alto
puts filas
# filas = 5
# columnas = array.length
columnas = ancho
rayas = "--"
for n in (1..columnas)
  rayas+="-"
end
puts rayas
for i in(0..filas - 1)
  # puts "i: #{i}"
  fila = ""
  for j in(0..columnas-1)
    fila += matriz[j][i].to_s
  end
  puts "|"+fila+"|"
end
puts rayas
