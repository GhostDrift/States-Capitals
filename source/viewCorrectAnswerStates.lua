import "statesGame"
import "CoreLibs/animation"
import "CoreLibs/animator"
local pd <const> = playdate
local gfx <const> = pd.graphics

class("ViewCorrectAnswerStates").extends(gfx.sprite)

function ViewCorrectAnswerStates:init(stateIndex)
    self.stateIndex = stateIndex
    self.state = state
    self:initializeAnimationAssets()
    self:add()
end
--function to initialize sprites, blinkers, and animators
function ViewCorrectAnswerStates:initializeAnimationAssets()
    --initialize the blinker for the highlighted state
    self.imageBlinker = gfx.animation.blinker.new()
    self.imageBlinker.cycles = 6
    self.imageBlinker.onDuration = 400
    self.imageBlinker.offDuration = 200
    self.animating = true
    --initialize the map sprite
    self.mapSprite = gfx.sprite.new(MAP_IMAGES[self.stateIndex])
    self.mapSprite:moveTo(-400,133)
    self.mapSprite:add()
    --initialize the info sprite
    gfx.setFont(fontNontendoBoldOutline1AndOneHalfX)
    local infoImage = gfx.image.new(gfx.getTextSize(STATE_NAMES[self.stateIndex]))
    gfx.pushContext(infoImage)
        gfx.drawText(STATE_NAMES[self.stateIndex],0,0)
    gfx.popContext()
    self.infoSprite = gfx.sprite.new(infoImage)
    self.infoSprite:moveTo(595,15)
    self.infoSprite:add()
    --initialize the newGame sprite
    gfx.setFont(fontMiniSans2X)
    local newGameText = "Press A to play again"
    local newGameImage = gfx.image.new(gfx.getTextSize(newGameText))
    gfx.pushContext(newGameImage)
        gfx.drawText(newGameText,0,0)
    gfx.popContext()
    self.newGameSprite = gfx.sprite.new(newGameImage)
    self.newGameSprite:moveTo(260,465)
    self.newGameSprite:add()
    --initialize the animators for the sprites
    self.mapAnimator = gfx.animator.new(1000,-400,200,pd.easingFunctions.inOutQuart,1000)
    self.infoAnimator = gfx.animator.new(1000,595,195,pd.easingFunctions.inOutQuart,500)
    self.newGameAnimator = gfx.animator.new(500,465,225,pd.easingFunctions.outQuart,4150)
    --intitialize boolean variables
    self.blinkerFinished = false
end

-- function to animate the sprites
function ViewCorrectAnswerStates:Animate()
    if(not self.infoAnimator:ended())then
        self.infoSprite:moveTo(self.infoAnimator:currentValue(),15)
    elseif(not self.mapAnimator:ended())then
        self.mapSprite:moveTo(self.mapAnimator:currentValue(),133)
    else
        if(not self.imageBlinker.running)then
            self.imageBlinker:start()
        else
            if(self.imageBlinker.counter == 0) then
                self.imageBlinker:stop()
                self.blinkerFinished = true
            elseif(not self.blinkerFinished)then
                local imageIndex = 0
                if(self.imageBlinker.on)then
                    imageIndex = 51
                else
                    imageIndex = self.stateIndex
                end
                self.mapSprite:setImage(MAP_IMAGES[imageIndex])
                self.imageBlinker:update()
            else
                if(not self.newGameAnimator:ended())then
                    self.newGameSprite:moveTo(260,self.newGameAnimator:currentValue())
                else
                    self.animating = false
                end

            end
        end
    end
    
end

function ViewCorrectAnswerStates:update()
    if(self.animating) then
        self:Animate()
    else
        if(pd.buttonJustPressed(pd.kButtonA))then
            SCENE_MANAGER:switchScene(StatesGame,"wipe")
        end
    end
end