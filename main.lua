require "class"; 
require "Brick"; 
require "Board";
require "conf"; 
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

function love.update(dt)
    board:update(dt); 
end

function love.draw()
   board:render(); 
end
function love.keypressed(key) 
    if key == 'escape' then
        love.window.close(); 
    end
    if key == "x" then
        if board.blockTypes[board.pieceType][board.rotation + 1] ~= nil then
            if board:checkRotate(board.blockX, board.blockY, board.rotation + 1) then
                board.rotation = board.rotation + 1;
            end
        else
            if board:checkRotate(board.blockX, board.blockY, 1) then
                board.rotation = 1; 
            end
        end 
    end
    if key == "z" then
        if board.blockTypes[board.pieceType][board.rotation - 1] ~= nil then
            if board:checkRotate(board.blockX, board.blockY, board.rotation - 1) then
                board.rotation = board.rotation - 1;
            end
        else
            if board:checkRotate(board.blockX, board.blockY, #board.blockTypes[board.pieceType]) then
                board.rotation = #board.blockTypes[board.pieceType]; 
            end
        end 
    end
    if key == "right" then
        if board:checkBlock(board.blockX + 1, board.blockY,board.rotation) then
            board.blockX = board.blockX + 1; 
        end
    end
    if key == "left" then 
        if board:checkBlock(board.blockX - 1, board.blockY, board.rotation) then
            board.blockX = board.blockX - 1; 
        end
    end
    if key == "down" then
        if board:checkBlock(board.blockX, board.blockY + 1, board.rotation) then
            board.blockY = board.blockY + 1; 
        end
    end
end