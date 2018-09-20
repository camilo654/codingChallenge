require "tk"

canvas = TkCanvas.new
TkcRectangle.new(canvas, '1c', '2c', '3c', '3c', 'outline' => 'black', 'fill' => 'blue')
TkcLine.new(canvas, 0, 0, 100, 100, 'width' => '2', 'fill' => 'red')
canvas.pack

Tk.mainloop
