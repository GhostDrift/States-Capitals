import "statesGame"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("GameOverStates").extends(gfx.sprite)

function GameOverStates:init(text)
    print(text)
    local gameOverImage = gfx.image.new(400,240)
    gfx.pushContext(gameOverImage)
        gfx.setFont(fontNontendoBoldOutline6X)
        gfx.drawTextAligned("Game Over",200,50,kTextAlignment.center)
        gfx.setFont(fontNontendoBoldOutline1X)
        gfx.drawTextAligned("Score: ".. text, 200,140,kTextAlignment.center)
        gfx.drawTextAligned("Press A to play again",200,180,kTextAlignment.center)
    gfx.popContext()
    local gameOverSprite = gfx.sprite.new(gameOverImage)
    gameOverSprite:moveTo(200,120)
    gameOverSprite:add()

    self:add()
end

function GameOverStates:update()
    if(pd.buttonJustPressed(pd.kButtonA))then
        SCENE_MANAGER:switchScene(StatesGame,"wipe")
    end
end