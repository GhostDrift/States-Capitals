import "statesGame"

local pd <const> = playdate
local gfx <const> = pd.graphics

class("GameOverStates").extends(gfx.sprite)

function GameOverStates:init(text)
    local gameOverImage = gfx.image.new(40,240)
    gfx.pushContext(gameOverImage)
        gfx.setFont(fontNontendoBoldOutline6X)
        gfx.drawText("Game Over",200,50)
        gfx.drawText(text,200,140)
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