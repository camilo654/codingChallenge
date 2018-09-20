banderaTerminar = false

class Interprete
  def initialize
    @canvas = Canvas.new()
  end

  # attr_accessor :archivo

  def leer entrada
    if entrada != "Q"
      @entrada = entrada
    else
      banderaTerminar = true
    end
  end

  def Validar

  end

  def ejecutar
    if @entrada[0] == "C"
      @canvas.crearTablero @entrada.split(" ")[1] @entrada.split(" ")[2]
    end

  end
end

class Canvas

  # attr_accessor :archivo

  def crearTablero width height
    @tablero = " ---
                |xxx|
                |   |
                 ---"
  end

  def dibujarLinea

  end

  def dibujarRectangulo

  end

  def pintarArea

  end
end

interprete = Interprete.new()
interprete.leer
while banderaTerminar
  interprete.ejecutar
  interprete.leer
end
