import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/timer"
import "CoreLibs/ui"
import "CoreLibs/sprites"
import "CoreLibs/crank"
import "CoreLibs/nineslice"

local pd <const> = playdate
local gfx <const> = playdate.graphics
local backgroudnSprite = nil

function initialize()
    local backgroundImage= gfx.image.new("images/map") --make sure the image is a png, jpgs don't work
	gfx.sprite.setBackgroundDrawingCallback (
		function(x,y,width, height)
			gfx.setClipRect(x,y,width,height)
			backgroundImage:draw(0,0) -- draws the backgroud image in the upper corner
			gfx.clearClipRect()
		end
	)
end
initialize()

function pd.update()
    gfx.sprite.update()
end