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
    # @matrix = Array.new(@width, [])
    @matrix = []
    for columna in (0..@width-1)
      @matrix << []
      @height.times do
        @matrix[columna] << " "
      end
    end
  end

  def drawLine comand
    # "C 20 4"
    # "L 1 2 6 2"
    x1 = comand[1].to_i - 1
    y1 = comand[2].to_i - 1
    x2 = comand[3].to_i - 1
    y2 = comand[4].to_i - 1
    # drawCanvas
    # matrix = []
    # matrix.replace(@matrix)
    # puts matrix.inspect
    # puts "matriz: #{matrix.inspect}"
    # puts "matriz0: #{matrix[0].inspect}"
    # @matrix[1][2] = "X"
    # array = @matrix[1]
    # puts "array: #{array}"
    # puts @matrix.inspect
    # array[2] = "X"
    # puts matrix.inspect
    # puts "array: #{array}"
    # puts @matrix.inspect
    # @matrix[1] = array
    # puts @matrix.inspect
    # puts "matriz0: #{matrix[0].inspect}"
    # puts "matriz1: #{matrix[1].inspect}"
    # puts "matriz1: #{matrix[1][2].inspect}"
    # matrix[1][2] = "X"
    # puts matrix.inspect
    # drawCanvas
    # @matrix[2][2] = "X"
    # # matrix[2][2] = "X"
    # # puts matrix.inspect
    # # drawCanvas
    # @matrix[3][2] = "X"
    # # drawCanvas
    # @matrix[4][2] = "X"
    # # drawCanvas
    # @matrix[5][2] = "X"
    # # drawCanvas
    # @matrix[6][2] = "X"
    # drawCanvas
    # puts @matrix.inspect
    for i in (x1..x2)
      # puts "i: #{i}"
      for j in (y1..y2)
        # puts "i: #{i}"
        # puts "j: #{j}"
        # puts "valor: #{@matrix[i][j]}"
        @matrix[i][j] = "X"
        # puts "valor: #{@matrix[i][j]}"
        # drawCanvas
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
      # puts "filai: #{fila}"
      for j in(0..@width-1)
        # puts @matrix[j][i]
        # puts @matrix[i][j]
        fila += @matrix[j][i].to_s
        # puts "filaj: #{fila}"
      end
      puts "|" + fila + "|"
    end
    puts rayas
  end
end

puts "Iniciamos"
drawingTool = DrawingTool.new()
puts "Corremos"
drawingTool.run

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
# ancho = 5
# alto = 7
# matrix = Array.new(ancho, [])
# for i in (0..alto-1)
#   matrix[0] << " "
# end
# puts "matrix: #{matrix}"
# matrix[3] = [" "," ","X"," "," "," "," "]
# puts "matrix[3]: #{matrix[3]}"
# puts "matrix[3][0]: ,#{matrix[3][0]},"
# puts "matrix[3][2]: #{matrix[3][2]}"
# matrix[3][2] = "Y"
# puts "matrix[3]: #{matrix[3]}"
# puts "matrix[3][0]: ,#{matrix[3][0]},"
# puts "matrix[3][2]: #{matrix[3][2]}"
# #IMPRIMIR
# filas = alto
# columnas = ancho
# rayas = "--"
# for n in (1..columnas)
#   rayas+="-"
# end
# puts rayas
# for i in(0..filas - 1)
#   fila = ""
#   for j in(0..columnas-1)
#     fila += matrix[j][i].to_s
#   end
#   puts "|"+fila+"|"
# end
# puts rayas
#
# matrix.each do |item|
#   puts item.inspect
# end
#
# #Imprimir
# for i in(0..filas - 1)
#   fila = ""
#   for j in(0..columnas-1)
#     fila += matrix[j][i].to_s
#   end
#   puts "|"+fila+"|"
# end
