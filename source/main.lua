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

function initialize()
    --local backgroundImage= gfx.image.new("images/map") --make sure the image is a png, jpgs don't work
	--gfx.sprite.setBackgroundDrawingCallback (
	--	function(x,y,width, height)
	--		gfx.setClipRect(x,y,width,height)
	--		backgroundImage:draw(0,0) -- draws the backgroud image in the upper corner
	--		gfx.clearClipRect()
	--	end
	--)
	intiializeMapImages()
	mapSprite = gfx.sprite.new(mapImages[imageIndex])
	mapSprite:moveTo(200,135)
	mapSprite:add()
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
	
end
function updateMap()
	mapSprite:setImage(mapImages[imageIndex])
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