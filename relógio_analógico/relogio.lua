function love.load()
  love.window.setMode(949, 472) 
  love.window.setTitle("Relógio Analógico")
  
  sound = love.audio.newSource("brillion. - dreaming of bigger things.mp3", "stream")
  love.audio.play(sound)
  lofi = love.graphics.newImage("lofi.png")
end



function love.draw()
  -- background
  love.graphics.setColor(1,1,1)
  lofi = love.graphics.newImage("lofi.png")
  love.graphics.draw(lofi, 0,0)
  
  -- localização do ponteiro das horas
  local w,h = love.graphics.getDimensions()
  local ponteirox1 , ponteiroy1, ponteirox2,ponteiroy2 = 475,236,475,156
  
  
  -- relógio
  love.graphics.setColor(1, 1, 1)
  love.graphics.setLineWidth( 4 )
  love.graphics.circle('line',475,236,100,1000)   


  -- posta o tempo
  local data = os.date("*t")
  love.graphics.print ("Dia ".. data.day, 455, 356)
  

  

  --desenhando horas
  love.graphics.push()
  love.graphics.translate(475,236)
  love.graphics.setColor(1,1,1)
  for i = 1, 12 do 
    local angulo = 1/12*i*2*math.pi
    love.graphics.push()
    love.graphics.rotate(angulo)
    love.graphics.line(0,-80,0,-100) 
    love.graphics.pop()
  end
  love.graphics.pop()
  
  
  -- ponteiro dos segundos
  love.graphics.setColor(0.5, 0.05, 0.1)
  love.graphics.push()
  love.graphics.translate(475,236)
  love.graphics.rotate( (1/30*math.pi)*  data.sec)
  love.graphics.line(0,0,0,-80)   
  love.graphics.pop()
  
  -- ponteiro dos minutos
  love.graphics.setColor(0, 0, 0)
  love.graphics.push()
  love.graphics.translate(475,236)
  love.graphics.rotate( (1/30*math.pi)*  data.min)
  love.graphics.line(0,0,0,-70)  
  love.graphics.pop()
  
  -- ponteiro das horas
  love.graphics.setColor(1, 1, 1)
  love.graphics.push()
  love.graphics.translate(475,236)
  love.graphics.rotate( (1/6*math.pi)*  data.hour)
  love.graphics.line(0,0,0,-50)  
  love.graphics.pop()
  
end



-- fazer ponteiro
-- fazer as paradas das horas
-- fazer ponteiro andar com bibilioteca do tempo