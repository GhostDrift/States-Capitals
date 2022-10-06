--import statements
import "Corelibs/graphics"
--local variables
local pd <const> = playdate
local gfx <const> = pd.graphics

class("GameSelect").extends(gfx.sprite)

function GameSelect:init()
    gfx.setLineCapStyle(gfx.kLineCapStyleRound)
    gfx.setLineWidth(5)
    self:prepareSprites()
    self:add()
end

function GameSelect:prepareSprites()
    gfx.setFont(fontNontendoBold4X)
    local headerText = "Game Select"
    local headerImage = gfx.image.new(gfx.getTextSize(headerText))
    gfx.setLineCapStyle(gfx.kLineCapStyleRound)
    gfx.setLineWidth(5)
    gfx.pushContext(headerImage)
        gfx.drawText(headerText,0,0)
        gfx.drawLine(2,50,245,50)
    gfx.popContext()
    self.headerSprite = gfx.sprite.new(headerImage)
    self.headerSprite:moveTo(200,35)
    self.headerSprite:add()
end
