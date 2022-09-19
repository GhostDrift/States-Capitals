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
local imageIndex = 51
local correctState = 0
local life = 3
local score = 0
local lifeImages = {}
local stateNames = {}
local fontNontendoBoldOutline6X = gfx.font.new('font/Nontendo-Bold-outline-6x')
local fontNontendoBoldOutline2X = gfx.font.new('font/Nontendo-Bold-Outline-2x')
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
	gfx.setFont()
	math.randomseed(pd.getCurrentTimeMilliseconds())
	correctState = math.random(1,50)
	gfx.setBackgroundColor(gfx.kColorWhite)
	intiializeMapImages()
	initializeStateNames()
	lifeImages[1] = gfx.image.new("images/emptyHeart")
	lifeImages[2] = gfx.image.new("images/fullHeart")
	updateUi()
	--mapSprite = gfx.sprite.new(mapImages[imageIndex])
	--mapSprite:moveTo(200,135)
	--mapSprite:add()
	
	
end
function intiializeMapImages()
	mapImages = {}
	mapImages[1] = gfx.image.new("images/map(Alabama)")
	mapImages[2] = gfx.image.new("images/map(Alaska)")
	mapImages[3] = gfx.image.new("images/map(Arazona)")
	mapImages[4] = gfx.image.new("images/map(Arkansas)")
	mapImages[5] = gfx.image.new("images/map(Califorina)")
	mapImages[6] = gfx.image.new("images/map(Colorado)")
	mapImages[7] = gfx.image.new("images/map(Connecticut)")
	mapImages[8] = gfx.image.new("images/map(Delaware)")
	mapImages[9] = gfx.image.new("images/map(Florida)")
	mapImages[10] = gfx.image.new("images/map(Georgia)")
	mapImages[11] = gfx.image.new("images/map(Hawaii)")
	mapImages[12] = gfx.image.new("images/map(Idaho)")
	mapImages[13] = gfx.image.new("images/map(Illinois)")
	mapImages[14] = gfx.image.new("images/map(Indiana)")
	mapImages[15] = gfx.image.new("images/map(Iowa)")
	mapImages[16] = gfx.image.new("images/map(Kansas)")
	mapImages[17] = gfx.image.new("images/map(Kentucky)")
	mapImages[18] = gfx.image.new("images/map(Louisiana)")
	mapImages[19] = gfx.image.new("images/map(Maine)")
	mapImages[20] = gfx.image.new("images/map(Maryland)")
	mapImages[21] = gfx.image.new("images/map(Massachusetts)")
	mapImages[22] = gfx.image.new("images/map(Michigan)")
	mapImages[23] = gfx.image.new("images/map(Minnesota)")
	mapImages[24] = gfx.image.new("images/map(Mississippi)")
	mapImages[25] = gfx.image.new("images/map(Missouri)")
	mapImages[26] = gfx.image.new("images/map(Montana)")
	mapImages[27] = gfx.image.new("images/map(Nebraska)")
	mapImages[28] = gfx.image.new("images/map(Nevada)")
	mapImages[29] = gfx.image.new("images/map(New Hampshire)")
	mapImages[30] = gfx.image.new("images/map(New Jersey)")
	mapImages[31] = gfx.image.new("images/map(New Mexico)")
	mapImages[32] = gfx.image.new("images/map(New York)")
	mapImages[33] = gfx.image.new("images/map(North Carolina)")
	mapImages[34] = gfx.image.new("images/map(North Dakota)")
	mapImages[35] = gfx.image.new("images/map(Ohio)")
	mapImages[36] = gfx.image.new("images/map(Oklahoma)")
	mapImages[37] = gfx.image.new("images/map(Oregon)")
	mapImages[38] = gfx.image.new("images/map(Pennsylvania)")
	mapImages[39] = gfx.image.new("images/map(Rhode Island)")
	mapImages[40] = gfx.image.new("images/map(South Carolina)")
	mapImages[41] = gfx.image.new("images/map(South Dakota)")
	mapImages[42] = gfx.image.new("images/map(Tennessee)")
	mapImages[43] = gfx.image.new("images/map(Texas)")
	mapImages[44] = gfx.image.new("images/map(Utah)")
	mapImages[45] = gfx.image.new("images/map(Vermont)")
	mapImages[46] = gfx.image.new("images/map(Virginia)")
	mapImages[47] = gfx.image.new("images/map(Washington)")
	mapImages[48] = gfx.image.new("images/map(West Virginia)")
	mapImages[49] = gfx.image.new("images/map(Wisconsin)")
	mapImages[50] = gfx.image.new("images/map(Wyoming)")
	mapImages[51] = gfx.image.new("images/map")
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
	stateNames[13] = "Illinois"
	stateNames[14] = "Indiana"
	stateNames[15] = "Iowa"
	stateNames[16] = "Kansas"
	stateNames[17] = "Kentucky"
	stateNames[18] = "Louisiana"
	stateNames[19] = "Maine"
	stateNames[20] = "Maryland"
	stateNames[21] = "Massachusetts"
	stateNames[22] = "Michigan"
	stateNames[23] = "Minnesota"
	stateNames[24] = "Mississippi"
	stateNames[25] = "Missouri"
	stateNames[26] = "Montana"
	stateNames[27] = "Nebraska"
	stateNames[28] = "Nevada"
	stateNames[29] = "New Hampshire"
	stateNames[30] = "New Jersey"
	stateNames[31] = "New Mexico"
	stateNames[32] = "New York"
	stateNames[33] = "North Carolina"
	stateNames[34] = "North Dakota"
	stateNames[35] = "Ohio"
	stateNames[36] = "Oklahoma"
	stateNames[37] = "Oregon"
	stateNames[38] = "Pennsylvania"
	stateNames[39] = "Rhode Island"
	stateNames[40] = "South Carolina"
	stateNames[41] = "South Dakota"
	stateNames[42] = "Tennessee"
	stateNames[43] = "Texas"
	stateNames[44] = "Utah"
	stateNames[45] = "Vermont"
	stateNames[46] = "Virginia"
	stateNames[47] = "Washington"
	stateNames[48] = "West Virginia"
	stateNames[49] = "Wisconsin"
	stateNames[50] = "Wyoming"
	stateNames[51] = " "

end
function updateMap()
	
	updateUi()
end
--updates the ui
function updateUi()
	gfx.clear()
	mapImages[imageIndex]:drawCentered(200,133)
	if(life== 3) then
		lifeImages[2]:drawCentered(330,20)
		lifeImages[2]:drawCentered(355,20)
		lifeImages[2]:drawCentered(380,20)
	elseif(life == 2) then
		lifeImages[2]:drawCentered(330,20)
		lifeImages[2]:drawCentered(355,20)
		lifeImages[1]:drawCentered(380,20)
	elseif(life == 1) then
		lifeImages[2]:drawCentered(330,20)
		lifeImages[1]:drawCentered(355,20)
		lifeImages[1]:drawCentered(380,20)
	elseif(life <1 ) then
		lifeImages[1]:drawCentered(330,20)
		lifeImages[1]:drawCentered(355,20)
		lifeImages[1]:drawCentered(380,20)
	end
	
	--gfx.drawRect(370,10,20,20)
	gfx.drawText("Find: ".. stateNames[correctState],20,10)
	gfx.drawText("Score: ".. score,200,10)
end
--function to get the next state for the user to find
function getNextState()
	correctState = math.random(1,50)
	updateUi()
end
--function to check if the user selected the correct state
function checkState()
	if(imageIndex == correctState) then
		score += 1
		getNextState()
	else
		life-= 1
		checkLife()
	end
end	
--function to check weather the user still has life left
function checkLife()
	if(life == 0) then
		gameOver()
	else
		updateUi()
	end
end
--function to display the gameOver Screen
function gameOver()
	gfx.clear()
	gfx.setFont(fontNontendoBoldOutline6X)
	gfx.drawTextAligned("Game Over",200,50,kTextAlignment.center)

end
initialize()

function pd.update()
	if(pd.buttonJustPressed(pd.kButtonLeft)) then
		if(imageIndex == 1) then
			imageIndex = #mapImages
		else
			imageIndex -= 1
		end
		updateUi()
	elseif(pd.buttonJustPressed(pd.kButtonRight))then
		if(imageIndex == #mapImages) then
			imageIndex = 1
		else
			imageIndex += 1
		end
		updateUi()
	elseif(pd.buttonJustPressed(pd.kButtonA))then
		checkState()
	end
end