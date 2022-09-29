import "statesGame"
import "CoreLibs/animation"
import "CoreLibs/animator"
local pd <const> = playdate
local gfx <const> = pd.graphics

class("GameOverStates").extends(gfx.sprite)

local animating = true;
local count = 0;

function GameOverStates:init(text)
    animating = true;
    gfx.setFont(fontNontendoBoldOutline1AndOneHalfX)
    local finalScoreImage = gfx.image.new(gfx.getTextSize(text))
    gfx.pushContext(finalScoreImage)
        --gfx.setFont(fontNontendoBoldOutline6X)
        --gfx.drawTextAligned("Game Over",200,50,kTextAlignment.center)
        gfx.drawText(text,0,0)
        --gfx.drawTextAligned("Press A to play again",200,180,kTextAlignment.center)
    gfx.popContext()
    self.finalScoreSprite = gfx.sprite.new(finalScoreImage)
    --self.finalScoreSprite:moveTo(200,170)
    self.finalScoreSprite:moveTo(-200,170)
    self.finalScoreSprite:add()
    local continueText = "Press A to play again"
    local continueTextImage = gfx.image.new(gfx.getTextSize(continueText))
    gfx.pushContext(continueTextImage)
        gfx.drawText(continueText,0,0)
    gfx.popContext()
    self.continueTextSprite = gfx.sprite.new(continueTextImage)
    self.continueTextSprite:moveTo(200,200)
    --self.continueTextSprite:add()
    gfx.setFont(fontNontendoBoldOutline6X)
    local gameOverImage = gfx.image.new(gfx.getTextSize("Game Over"))
    gfx.pushContext(gameOverImage)
        gfx.drawText("Game Over",0,0)
    gfx.popContext()
    self.gameOverSprite = gfx.sprite.new(gameOverImage)
    --self.gameOverSprite:moveTo(200,100)
    self.gameOverSprite:moveTo(200,-100)
    self.gameOverSprite:add()
    self.gameOverAnimator = gfx.animator.new(1500,-100,100,pd.easingFunctions.outBounce,500)
    self.scoreAnimator = gfx.animator.new(1000,-200,200,pd.easingFunctions.outQuint,1500)
    self.continueTextBlinker = gfx.animation.blinker.new()
    self.continueTextBlinker.cycles = 3
    self.continueTextBlinker.onDuration = 400
    self.continueTextBlinker.offDuration = 200

    self:add()
end
--function to animate sprites
function GameOverStates:animateSprites()
    if(not self.gameOverAnimator:ended())then
        self.gameOverSprite:moveTo(200,self.gameOverAnimator:currentValue())
    end
    if(not self.scoreAnimator:ended())then
        self.finalScoreSprite:moveTo(self.scoreAnimator:currentValue(),170)
    else
        if(not self.continueTextBlinker.running)then
            self.continueTextBlinker:start()
        else
            if(self.continueTextBlinker.counter == 0)then
                self.continueTextBlinker:stop()
                animating = false
            elseif(self.continueTextBlinker.on)then
                self.continueTextSprite:add()
            else
                self.continueTextSprite:remove()
            end
        end
    end 

end

function GameOverStates:update()
    if(animating) then
        self:animateSprites()
    else  
        if(pd.buttonJustPressed(pd.kButtonA))then
        SCENE_MANAGER:switchScene(StatesGame,"wipe")
        end
    end
    gfx.animation.blinker.updateAll()
end