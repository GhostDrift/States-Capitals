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
--function to create the sprites that will make up the elements of the game select screen
function GameSelect:prepareSprites()
    --making the image for the headerSprite
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
    --making the unselected image for the statesSprite
    gfx.setFont(fontMiniSans3X)
    local statesText = "States"
    self.statesImageUnselected = gfx.image.new(140,150)
    gfx.setLineWidth(3)
    gfx.pushContext(self.statesImageUnselected)
        gfx.drawRoundRect(2,2,116,35,5)
        gfx.drawTextAligned(statesText,59,10,kTextAlignment.center)
        --gfx.drawRoundRect(2,45,100,100,5)
    gfx.popContext()
    --making the selected image for the statesSprite
    self.statesImageSelected = gfx.image.new(140,150)
    gfx.pushContext(self.statesImageSelected)
        gfx.drawRoundRect(2,2,116,35,5)
        gfx.drawTextAligned(statesText,59,10,kTextAlignment.center)
        --gfx.drawRoundRect(2,45,100,100,5)
        gfx.setLineWidth(5)
        gfx.drawLine(6,40,101,40)
        --gfx.drawLine(102,32,102,6)
    gfx.popContext()
    self.statesSprite = gfx.sprite.new(self.statesImageUnselected)
    self.statesSprite:moveTo(95,150)
    self.statesSprite:add()
    self.selectedGame = 0
end
--function to switch which game is selected
function GameSelect:switchGames()
    if(self.selectedGame == 0)then
        self.statesSprite:setImage(self.statesImageSelected)
        self.selectedGame = 1
    else
        self.statesSprite:setImage(self.statesImageUnselected)
        self.selectedGame = 0
    end
end

function GameSelect:update()
    if(pd.buttonJustPressed(pd.kButtonA))then
        self:switchGames()
    end
end
