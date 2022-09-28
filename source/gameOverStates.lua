import "statesGame"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("GameOverStates").extends(gfx.sprite)

function GameOverStates:init(text)
    print(text)
    gfx.setFont(fontNontendoBoldOutline1X)
    local finalScoreImage = gfx.image.new(gfx.getTextSize(text))
    gfx.pushContext(finalScoreImage)
        --gfx.setFont(fontNontendoBoldOutline6X)
        --gfx.drawTextAligned("Game Over",200,50,kTextAlignment.center)
        gfx.drawText(text,0,0)
        --gfx.drawTextAligned("Press A to play again",200,180,kTextAlignment.center)
    gfx.popContext()
    self.finalScoreSprite = gfx.sprite.new(finalScoreImage)
    self.finalScoreSprite:moveTo(200,170)
    self.finalScoreSprite:add()
    local continueText = "Press A to play again"
    local continueTextImage = gfx.image.new(gfx.getTextSize(continueText))
    gfx.pushContext(continueTextImage)
        gfx.drawText(continueText,0,0)
    gfx.popContext()
    self.continueTextSprite = gfx.sprite.new(continueTextImage)
    self.continueTextSprite:moveTo(200,200)
    self.continueTextSprite:add()
    gfx.setFont(fontNontendoBoldOutline6X)
    local gameOverImage = gfx.image.new(gfx.getTextSize("Game Over"))
    gfx.pushContext(gameOverImage)
        gfx.drawText("Game Over",0,0)
    gfx.popContext()
    self.gameOverSprite = gfx.sprite.new(gameOverImage)
    --self.gameOverSprite:moveTo(200,100)
    self.gameOverSprite:moveTo(200,-100)
    self.gameOverSprite:add()
    self.gameOverAnimator = gfx.animator.new(1000,-100,100,pd.easingFunctions.outBounce)

    self:add()
end

function GameOverStates:update()
    self.gameOverSprite:moveTo(200,self.gameOverAnimator:currentValue())
    if(pd.buttonJustPressed(pd.kButtonA))then
        SCENE_MANAGER:switchScene(StatesGame,"wipe")
    end
end