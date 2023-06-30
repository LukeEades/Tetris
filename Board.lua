Board = class{}

function Board:init() 
    self.x = 0;
    self.y = 0; 
    self.h = 20; 
    self.w = 10;
    self.data = {};
    for y = 1, self.h do 
        self.data[y] = {};
        for x = 1, self.w do 
            self.data[y][x] = 1; 
        end
    end
    self.blockTypes = {
        {
            {
            {1,1,1,1},
            {2,2,2,2},
            {1,1,1,1},
            {1,1,1,1},
        },
        {
            {1,2,1,1},
            {1,2,1,1},
            {1,2,1,1},
            {1,2,1,1},
        },
        },
        {
        {
            {1,1,1,1},
            {1,3,3,1},
            {1,3,3,1},
            {1,1,1,1},
        },
        },
        {
        {
            {1,1,1,1},
            {4,4,4,1},
            {1,1,4,1},
            {1,1,1,1},
        },
        {
            {1,4,1,1},
            {1,4,1,1},
            {4,4,1,1},
            {1,1,1,1},
        },
        {
            {4,1,1,1},
            {4,4,4,1},
            {1,1,1,1},
            {1,1,1,1},
        },
        {
            {1,4,4,1},
            {1,4,1,1},
            {1,4,1,1},
            {1,1,1,1},
        },
        },
        {
        {
            {1,1,1,1},
            {5,5,5,1},
            {5,1,1,1},
            {1,1,1,1},
        },
        {
            {1,5,1,1},
            {1,5,1,1},
            {1,5,5,1},
            {1,1,1,1},
        },
        {
            {1,1,5,1},
            {5,5,5,1},
            {1,1,1,1},
            {1,1,1,1},
        },
        {
            {5,5,1,1},
            {1,5,1,1},
            {1,5,1,1},
            {1,1,1,1},
        },
        },
        {
        {
            {1,1,1,1},
            {6,6,6,1},
            {1,6,1,1},
            {1,1,1,1},
        },
        {
            {1,6,1,1},
            {1,6,6,1},
            {1,6,1,1},
            {1,1,1,1},
        },
        {
            {1,6,1,1},
            {6,6,6,1},
            {1,1,1,1},
            {1,1,1,1},
        },
        {
            {1,6,1,1},
            {6,6,1,1},
            {1,6,1,1},
            {1,1,1,1},
        },
        },
        {
        {
            {1,1,1,1},
            {1,7,7,1},
            {7,7,1,1},
            {1,1,1,1},
        },
        {
            {7,1,1,1},
            {7,7,1,1},
            {1,7,1,1},
            {1,1,1,1},
        },
        },
        {
        {
            {1,1,1,1},
            {8,8,1,1},
            {1,8,8,1},
            {1,1,1,1},
        },
        {
            {1,8,1,1},
            {8,8,1,1},
            {8,1,1,1},
            {1,1,1,1},
        },
        },
    }
    self.colors = {
        {0,0,0},
        {0,255/255,255/255},
        {255/255,255/255,0},
        {128/255,0,128/255},
        {0,255/255,0},
        {255/255,0,0},
        {0,0,255/255},
        {255/255,140/255,0}
    }
    self.pieceType = math.random(1,7); 
    self.rotation = 1; 
    self.blockX = 3; 
    self.blockY = 1; 
    self.level = 1; 
    self.timer = 1; 
end

function Board:update(dt)
    self.timer = self.timer - .01 * self.level;
    if self.timer < 0 then
        if self:checkBlock(self.blockX,self.blockY, self.rotation) then
            self.blockY = self.blockY + 1;
        end 
        self.timer = 1; 
    end
end

function Board:render()
    for y = 1,self.h do 
        for x = 1, self.w do
            local index = self.data[y][x]
            self:drawBlock(index, x,y);
        end
    end
    for y = 1, 4 do 
        for x = 1, 4 do 
            local piece = self.blockTypes[self.pieceType][self.rotation][y][x]; 
            if piece ~= 1 then
                local locX = x + self.blockX;
                local locY = y + self.blockY;
                self:drawBlock(piece,locX,locY);
            end
        end
    end
end

function Board:drawBlock(block,x,y)
    local color = self.colors[block]; 
    love.graphics.setColor(color); 
    love.graphics.rectangle('fill', (x-1) * cellSize, (y-1) * cellSize, cellSize -1, cellSize -1);
end
function Board:checkBlock(anX,anY,rotation)
    for y = 1, 4 do
        for x = 1, 4 do 
            if self.blockTypes[self.pieceType][rotation][y][x] ~= 1 and ((anX + x) < 1 or (anX + x) > 10) then
                return false; 
            end
            if self.blockTypes[self.pieceType][rotation][y][x] ~= 1 and (anY + y) > 19 then
                self:turnStatic(); 
                return false; 
            end
        end
    end
    return true; 
end
function Board:turnStatic()

end

function Board:checkRotate(anX,anY,rotation)
    return self:checkBlock(anX, anY, rotation); 
    -- for y = 1, 4 do
    --     for x = 1, 4 do
    --         local item = self.blockTypes[self.pieceType][rotation][y][x]; 
    --         if item ~= 1 and 
    --         -- if self.data[anY + y][anX + x] ~= 1 then
    --         --     print(tostring(y)); 
    --         --     return false; 
    --         -- end
    --     end
    -- end
    -- return true; 
end