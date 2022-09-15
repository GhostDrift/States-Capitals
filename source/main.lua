import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/sprites"
import "CoreLibs/crank"
import "CoreLibs/nineslice"

local pd <const> = playdate
local gfx <const> = playdate.graphics
local mapSprite = nil
local mapImages = nil
local imageIndex = 1
local correctState = 0
local life = 3
local lifeImages = {}
local stateNames = {}
gfx.setImageDrawMode(gfx.kDrawModeCopy)
--create the backgroud image
--local backgroundImage= gfx.image.new("images/background")
--gfx.sprite.setBackgroundDrawingCallback (
--	function(x,y,width, height)
--		gfx.setClipRect(x,y,width,height)
--		backgroundImage:draw(0,0) -- draws the backgroud image in the upper corner
--		gfx.clearClipRect()
--	end
--)

function initialize()
    --local backgroundImage= gfx.image.new("images/map") --make sure the image is a png, jpgs don't work
	--gfx.sprite.setBackgroundDrawingCallback (
	--	function(x,y,width, height)
	--		gfx.setClipRect(x,y,width,height)
	--		backgroundImage:draw(0,0) -- draws the backgroud image in the upper corner
	--		gfx.clearClipRect()
	--	end
	--)
	
	gfx.setBackgroundColor(gfx.kColorWhite)
	intiializeMapImages()
	lifeImages[1] = gfx.image.new("images/emptyHeart")
	lifeImages[2] = gfx.image.new("images/fullHeart")
	updateMap()
	updateUi()
	--mapSprite = gfx.sprite.new(mapImages[imageIndex])
	--mapSprite:moveTo(200,135)
	--mapSprite:add()
	
	
end
function intiializeMapImages()
	mapImages = {}
	mapImages[1] = gfx.image.new("images/map")
	mapImages[2] = gfx.image.new("images/map(Alabama)")
	mapImages[3] = gfx.image.new("images/map(Alaska)")
	mapImages[4] = gfx.image.new("images/map(Arazona)")
	mapImages[5] = gfx.image.new("images/map(Arkansas)")
	mapImages[6] = gfx.image.new("images/map(Califorina)")
	mapImages[7] = gfx.image.new("images/map(Colorado)")
	mapImages[8] = gfx.image.new("images/map(Connecticut)")
	mapImages[9] = gfx.image.new("images/map(Delaware)")
	mapImages[10] = gfx.image.new("images/map(Florida)")
	mapImages[11] = gfx.image.new("images/map(Georgia)")
	mapImages[12] = gfx.image.new("images/map(Hawaii)")
	mapImages[13] = gfx.image.new("images/map(Idaho)")
	mapImages[14] = gfx.image.new("images/map(Illinois)")
	mapImages[15] = gfx.image.new("images/map(Indiana)")
	mapImages[16] = gfx.image.new("images/map(Iowa)")
	mapImages[17] = gfx.image.new("images/map(Kansas)")
	mapImages[18] = gfx.image.new("images/map(Kentucky)")
	mapImages[19] = gfx.image.new("images/map(Louisiana)")
	mapImages[20] = gfx.image.new("images/map(Maine)")
	mapImages[21] = gfx.image.new("images/map(Maryland)")
	mapImages[22] = gfx.image.new("images/map(Massachusetts)")
	mapImages[23] = gfx.image.new("images/map(Michigan)")
	mapImages[24] = gfx.image.new("images/map(Minnesota)")
	mapImages[25] = gfx.image.new("images/map(Mississippi)")
	mapImages[26] = gfx.image.new("images/map(Missouri)")
	mapImages[27] = gfx.image.new("images/map(Montana)")
	mapImages[28] = gfx.image.new("images/map(Nebraska)")
	mapImages[29] = gfx.image.new("images/map(Nevada)")
	mapImages[30] = gfx.image.new("images/map(New Hampshire)")
	mapImages[31] = gfx.image.new("images/map(New Jersey)")
	mapImages[32] = gfx.image.new("images/map(New Mexico)")
	mapImages[33] = gfx.image.new("images/map(New York)")
	mapImages[34] = gfx.image.new("images/map(North Carolina)")
	mapImages[35] = gfx.image.new("images/map(North Dakota)")
	mapImages[36] = gfx.image.new("images/map(Ohio)")
	mapImages[37] = gfx.image.new("images/map(Oklahoma)")
	mapImages[38] = gfx.image.new("images/map(Oregon)")
	mapImages[39] = gfx.image.new("images/map(Pennsylvania)")
	mapImages[40] = gfx.image.new("images/map(Rhode Island)")
	mapImages[41] = gfx.image.new("images/map(South Carolina)")
	mapImages[42] = gfx.image.new("images/map(South Dakota)")
	mapImages[43] = gfx.image.new("images/map(Tennessee)")
	mapImages[44] = gfx.image.new("images/map(Texas)")
	mapImages[45] = gfx.image.new("images/map(Utah)")
	mapImages[46] = gfx.image.new("images/map(Vermont)")
	mapImages[47] = gfx.image.new("images/map(Virginia)")
	mapImages[48] = gfx.image.new("images/map(Washington)")
	mapImages[49] = gfx.image.new("images/map(West Virginia)")
	mapImages[50] = gfx.image.new("images/map(Wisconsin)")
	mapImages[51] = gfx.image.new("images/map(Wyoming)")
	--mapImages[52] = gfx.image.new("images/map-1")
			
end
function initializeStateNames()
	stateNames[1] = "Alabama"
	stateNames[2] = "Alaska"
	stateNames[3] = "Arazona"
	stateNames[4] = "Arkansas"
	stateNames[5] = "Califorina"
	stateNames[6] = "Colorado"
	stateNames[7] = "Connecticut"
	stateNames[8] = "Delaware"
	stateNames[9] = "Florida"
	stateNames[10] = "Georgia"
	stateNames[11] = "Hawaii"
	stateNames[12] = "Idaho"
end
function updateMap()
	gfx.clear()
	mapImages[imageIndex]:drawCentered(200,133)
	updateUi()
end
function updateUi()
	lifeImages[2]:drawCentered(330,20)
	--gfx.drawRect(320,10,20,20)
	--gfx.drawRect(345,10,20,20)
	lifeImages[2]:drawCentered(355,20)
	lifeImages[2]:drawCentered(380,20)
	--gfx.drawRect(370,10,20,20)
	gfx.drawText("Find:",20,10)
end
initialize()

function pd.update()
	if(pd.buttonJustPressed(pd.kButtonLeft)) then
		if(imageIndex == 1) then
			imageIndex = #mapImages
		else
			imageIndex -= 1
		end
		updateMap()
	elseif(pd.buttonJustPressed(pd.kButtonRight))then
		if(imageIndex == #mapImages) then
			imageIndex = 1
		else
			imageIndex += 1
		end
		updateMap()
	end
    gfx.sprite.update()
end