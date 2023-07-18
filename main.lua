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
    theme = love.audio.newSource("theme.mp3", "stream");
    move = love.audio.newSource("brickmove.wav", "static"); 
    clear = love.audio.newSource("clear.wav", "static");
    theme:play(); 
    theme:setLooping(true); 
    gamestate = "start"; 
    love.graphics.setDefaultFilter("nearest", "nearest",1); 
end

function love.update(dt)
    board:update(dt); 
end

function love.draw()
    love.graphics.setColor(255,0,0);
    love.graphics.print("SCORE:"..tostring(board.score),220,20);
    love.graphics.print("Rows Cleared:"..tostring(board.rowsCleared),220,40);
    love.graphics.print("LEVEL:"..tostring(board.level),220,60);
    board:render(); 
    if gamestate == "start" then
        love.graphics.print("Press enter\n to start",35,150,0,2,2);
    end
    if gamestate == "game over" then
        love.graphics.print("Game Over!",35,150,0,2,2);
    end
end
function love.keypressed(key) 
    if gamestate == "game" then
        if key == 'escape' then
            love.window.close(); 
        end
        if key == "x" then
            if board.blockTypes[board.pieceType][board.rotation + 1] ~= nil then
                if board:checkBlock(board.blockX, board.blockY, board.rotation + 1) then
                    board.rotation = board.rotation + 1;
                end
            else
                if board:checkBlock(board.blockX, board.blockY, 1) then
                    board.rotation = 1; 
                end
            end 
        end
        if key == "z" then
            if board.blockTypes[board.pieceType][board.rotation - 1] ~= nil then
                if board:checkBlock(board.blockX, board.blockY, board.rotation - 1) then
                    board.rotation = board.rotation - 1;
                end
            else
                if board:checkBlock(board.blockX, board.blockY, #board.blockTypes[board.pieceType]) then
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
            if gamestate == "game" then
                if board:checkBlock(board.blockX, board.blockY + 1, board.rotation) then
                    board.blockY = board.blockY + 1; 
                    move:stop(); 
                    move:play(); 
                elseif board:checkBlock(board.blockX, board.blockY + 1, board.rotation) == false then
                    board:turnStatic(board.blockX,board.blockY, board.rotation); 
                    board:checkRowFull(); 
                    if gamestate == "game" then
                        board:spawnNew();
                    end
                end
            end
        end
    end
    
    if key == "return" then
        if gamestate == "start" then 
            gamestate = "game"; 
        end
    end
end