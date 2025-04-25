local shader
local canvas
local time = 0

function love.load(arg)
    -- Load the shader from the file we generated
    shader = love.graphics.newShader('MetaHexaBalls.glsl')
    -- Create a new Canvas to draw to
    canvas = love.graphics.newCanvas(800, 600)
end

function love.update(dt)
    -- increment our pseudo time variable
    time = dt + time;
    -- When converting, the following variables were requested from the shader...
    shader:send('iResolution', { love.graphics.getWidth(), love.graphics.getHeight(), 1 })
    shader:send('iGlobalTime', time)
    shader:send('iMouse', { love.mouse.getX(), love.mouse.getY(), love.mouse.getX(), love.mouse.getY() })
end

function love.draw()
  love.graphics.setShader(shader)
  love.graphics.draw(canvas,0,0,0,1,1,0,0)
end
