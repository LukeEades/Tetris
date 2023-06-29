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
        {0,255,255},
        {255,255,0},
        {128,0,128},
        {0,255,0},
        {255,0,0},
        {0,0,255},
        {255,127,0}
    }
    self.data[2][2] = 2;
    self.pieceType = 1; 
    self.rotation = 2; 
end

function Board:update()

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
            local piece = self.blockTypes[self.pieceType][self.rotation][x][y]; 
            self:drawBlock(piece, x, y);
        end
    end
end
function Board:drawBlock(block,x,y)
    local color = self.colors[block]; 
    love.graphics.setColor(color); 
    love.graphics.rectangle('fill', (x-1) * cellSize, (y-1) * cellSize, cellSize -1, cellSize -1);
end