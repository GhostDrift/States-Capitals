import "statesGame"
import "CoreLibs/animation"
import "CoreLibs/animator"
local pd <const> = playdate
local gfx <const> = pd.graphics

class("ViewCorrectAnswerStates").extends(gfx.sprite)

function ViewCorrectAnswerStates:init(stateIndex)
    print("Initializing correct answer")
    self.stateIndex = stateIndex
    self.state = state
    self.imageBlinker = gfx.animation.blinker.new()
    self.imageBlinker.cycles = 7
    self.imageBlinker.onDuration = 400
    self.imageBlinker.offDuration = 200
    self.animating = true
    self.imageBlinker:start()
    self.mapSprite = gfx.sprite.new(MAP_IMAGES[self.stateIndex])
    self.mapSprite:moveTo(200,133)
    self.mapSprite:add()
    self:add()
end

function ViewCorrectAnswerStates:toggleImage()
    print(self.imageBlinker.counter)
    local imageIndex = 0
    if(self.imageBlinker.on)then
        imageIndex = 51
    else
        imageIndex = self.stateIndex
    end
    self.mapSprite:setImage(MAP_IMAGES[imageIndex])
    --if(self.imageBlinker.on)then
      --  self.mapSprite:setImage(MAP_IMAGES[51])
    --else
      --  self.mapSprite:setImage(images[1])
    --end
    if(self.imageBlinker.counter == 0) then
        self.animating = false
    end
    self.imageBlinker:update()
end

function ViewCorrectAnswerStates:update()
    if(self.animating) then
        self:toggleImage()
    end
end