require "class"; 
require "Brick"; 
require "Board";

function love.load() 
    math.randomseed(os.time()); 
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
    if key == "right" then
        if board.blockTypes[board.pieceType][board.rotation + 1] ~= nil then
            board.rotation = board.rotation + 1;
        else
            board.rotation = 1; 
        end 
    end
    if key == "left" then
        if board.blockTypes[board.pieceType][board.rotation - 1] ~= nil then
            board.rotation = board.rotation - 1;
        else
            board.rotation = #board.blockTypes[board.pieceType]; 
        end 
    end
end