import "statesGame"
import "CoreLibs/animation"
import "CoreLibs/animator"
local pd <const> = playdate
local gfx <const> = pd.graphics

class("ViewCorrectAnswerStates").extends(gfx.sprite)

function ViewCorrectAnswerStates:init(images, state)
    self.images = images
    self.state = state
    self.imageBlinker = gfx.animation.blinker.new()
    self.imageBlinker.cycles = 3
    self.imageBlinker.onDuration = 200
    self.imageBlinker.offDuration = 200
    self.animating = true
    self.imageBlinker:start()
    self.mapSprite = gfx.sprite.new(images[1])
    self.mapSprite:moveTo(200,133)
    self.mapSprite:add()
end

function ViewCorrectAnswerStates:toggleImage()
    if(self.imageBlinker.on)then
        self.mapSprite:setImage(images[2])
    else
        self.mapSprite:setImage(images[1])
    end
    if(self.imageBlinker.counter == 0) then
        self.animating = false
    end
    self.mapSprite:update()
end

function ViewCorrectAnswerStates:update()
    if(self.animating) then
        self:toggleImage()
    end
end