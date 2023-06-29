require "class"; 
require "Brick"; 
require "Board";

function love.load() 
    WIDTH = 1080; 
    HEIGHT = 720; 
    love.window.setTitle('Tetris'); 
    love.window.setMode(WIDTH, HEIGHT, {fullscreen = false,resizable = false, vsync = true});
    board = Board();
    love.graphics.setBackgroundColor(255,255,255,255);
    cellSize = 20; 
end

function love.update()

end

function love.draw()
   board:render(); 
end
function love.keypressed(key) 
    if key == 'escape' then
        love.window.close(); 
    end
end