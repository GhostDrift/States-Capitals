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