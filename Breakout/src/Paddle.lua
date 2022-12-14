Paddle = Class{}

function Paddle:init(skin, size)
    self.x = VIRTUAL_WIDTH / 2 - 32
    self.y = VIRTUAL_HEIGHT - 32
    self.dx = 0
    self.width = 32 * size
    self.height = 16
    self.skin = skin
    self.size = size
end

function Paddle:update(dt)
    if love.keyboard.isDown('left') then
        self.dx = -PADDLE_SPEED
    elseif love.keyboard.isDown('right') then
        self.dx = PADDLE_SPEED
    else
        self.dx = 0
    end

    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    elseif self.dx > 0 then
        self.x = math.min(self.x + self.dx * dt, VIRTUAL_WIDTH - self.width)
    end
end

function Paddle:render()
    love.graphics.draw(gTextures['main'], gFrames['paddles'][self.size + 4 * (self.skin - 1)],
        self.x, self.y)
end
