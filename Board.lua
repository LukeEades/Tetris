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
            self.data[y][x] = ' '; 
        end
    end
    self.colors = {
        {0,0,0,255},
        {0,255,255,255},
        {255,255,0,255},
        {128,0,128,255},
        {0,255,0,255},
        {255,0,0,255},
        {0,0,255,255},
        {255,127,0,255}
    }
end

function Board:update()

end

function Board:render()
    for y = 1,self.h do 
        for x = 1, self.w do
            color = self.colors[self.data[x][y]];
            love.graphics.setColor(0,0,0,255); 
            love.graphics.rectangle('fill', (x-1) * cellSize, (y-1) * cellSize, cellSize -1, cellSize -1); 
        end
    end
end