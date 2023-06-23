require "class"; 
require "Brick"; 

function love.load() 
    WIDTH = 1080; 
    HEIGHT = 720; 
    love.window.setMode(WIDTH, HEIGHT, {fullscreen = false,resizable = false, vsync = true});
    brick = Brick(WIDTH/2, HEIGHT/2, 30,30,{255,255,255,255});
end

function love.update()

end

function love.draw()
   brick:render(); 
end
function love.keypressed(key) 
    if key == 'escape' then
        love.window.close(); 
    end
end