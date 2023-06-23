Brick = class{}; 

function Brick:init(x,y,w,h,color) 
    self.x = x; 
    self.y = y; 
    self.w = w; 
    self.h = h; 
    self.color = color; 
end

function Brick:update(dt) 

end

function Brick:render() 
    love.graphics.setColor(self.color); 
    love.graphics.rectangle("fill", self.x, self.y, self.w,self.h);
end