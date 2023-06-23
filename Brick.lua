Brick = class{}; 

function Brick:init(color)
    self.y_index = 0; 
    self.color = color; 
end

function Brick:update(dt) 
    self.y_index = self.y_index + 1; 
end

function Brick:render() 
    love.graphics.setColor(self.color); 
    love.graphics.rectangle("fill", 30, 30, 30,30); 
end