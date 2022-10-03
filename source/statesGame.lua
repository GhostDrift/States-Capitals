--import statements

--local variables
local pd <const> = playdate
local gfx <const> = pd.graphics


class("StatesGame").extends(gfx.sprite)
function StatesGame:init()
    self.life = 3
    self.score = 0
    --self.stateNames = {}
    math.randomseed(pd.getCurrentTimeMilliseconds())
    self.correctState = math.random(1,50)
    self.imageIndex = 51
    self:initializeStateNames()
    self.mapSprite = gfx.sprite.new()
    self.mapSprite:moveTo(200,133)
    self.mapSprite:add()
	self.infoSprite = gfx.sprite.new()
	self.infoSprite:moveTo(195,15)
	self.infoSprite:add()
    self:updateUI()
	self:updateInfo()

    self:add()
end

function StatesGame:initializeStateNames()
	self.stateNames[1] = "Alabama"
	self.stateNames[2] = "Alaska"
	self.stateNames[3] = "Arazona"
	self.stateNames[4] = "Arkansas"
	self.stateNames[5] = "Califorina"
	self.stateNames[6] = "Colorado"
	self.stateNames[7] = "Connecticut"
	self.stateNames[8] = "Delaware"
	self.stateNames[9] = "Florida"
	self.stateNames[10] = "Georgia"
	self.stateNames[11] = "Hawaii"
	self.stateNames[12] = "Idaho"
	self.stateNames[13] = "Illinois"
	self.stateNames[14] = "Indiana"
	self.stateNames[15] = "Iowa"
	self.stateNames[16] = "Kansas"
	self.stateNames[17] = "Kentucky"
	self.stateNames[18] = "Louisiana"
	self.stateNames[19] = "Maine"
	self.stateNames[20] = "Maryland"
	self.stateNames[21] = "Massachusetts"
	self.stateNames[22] = "Michigan"
	self.stateNames[23] = "Minnesota"
	self.stateNames[24] = "Mississippi"
	self.stateNames[25] = "Missouri"
	self.stateNames[26] = "Montana"
	self.stateNames[27] = "Nebraska"
	self.stateNames[28] = "Nevada"
	self.stateNames[29] = "New Hampshire"
	self.stateNames[30] = "New Jersey"
	self.stateNames[31] = "New Mexico"
	self.stateNames[32] = "New York"
	self.stateNames[33] = "North Carolina"
	self.stateNames[34] = "North Dakota"
	self.stateNames[35] = "Ohio"
	self.stateNames[36] = "Oklahoma"
	self.stateNames[37] = "Oregon"
	self.stateNames[38] = "Pennsylvania"
	self.stateNames[39] = "Rhode Island"
	self.stateNames[40] = "South Carolina"
	self.stateNames[41] = "South Dakota"
	self.stateNames[42] = "Tennessee"
	self.stateNames[43] = "Texas"
	self.stateNames[44] = "Utah"
	self.stateNames[45] = "Vermont"
	self.stateNames[46] = "Virginia"
	self.stateNames[47] = "Washington"
	self.stateNames[48] = "West Virginia"
	self.stateNames[49] = "Wisconsin"
	self.stateNames[50] = "Wyoming"
	self.stateNames[51] = " "
end
--function to update the ui
function StatesGame:updateUI()
    gfx.clear()
    self.mapSprite:setImage(MAP_IMAGES[self.imageIndex])
end
--function to create the info sprite
function StatesGame:updateInfo()
	gfx.setFont(fontNontendoBoldOutline1AndOneHalfX)
	local infoImage = gfx.image.new(400,40)
	gfx.pushContext(infoImage)
		gfx.drawText("Find: ".. self.stateNames[self.correctState],20,10)
		gfx.drawText("Score: ".. self.score,200,10)
		if(self.life == 3) then
			LIFE_IMAGES[2]:drawCentered(330,20)
			LIFE_IMAGES[2]:drawCentered(355,20)
			LIFE_IMAGES[2]:drawCentered(380,20)
		elseif(self.life == 2) then
			LIFE_IMAGES[2]:drawCentered(330,20)
			LIFE_IMAGES[2]:drawCentered(355,20)
			LIFE_IMAGES[1]:drawCentered(380,20)
		elseif(self.life == 1) then
			LIFE_IMAGES[2]:drawCentered(330,20)
			LIFE_IMAGES[1]:drawCentered(355,20)
			LIFE_IMAGES[1]:drawCentered(380,20)
		elseif(self.life <1 ) then
			LIFE_IMAGES[1]:drawCentered(330,20)
			LIFE_IMAGES[1]:drawCentered(355,20)
			LIFE_IMAGES[1]:drawCentered(380,20)
		end
	gfx.popContext()
	self.infoSprite:setImage(infoImage)
end
--function to get the next state
function StatesGame:getNextState()
	self.correctState = math.random(1,50)
	self:updateInfo()
end
--function to check if the user selected the correct state
function StatesGame:checkState()
	if(self.imageIndex == self.correctState) then
		self.score += 1
		self:getNextState()
	else
		self.life-= 1
		SCREEN_SHAKE:setShakeAmount(10)
		self:checkLife()
	end
end	
--function to check weather the user still has life left
function StatesGame:checkLife()
	self:updateInfo()
	if(self.life == 0) then
		SCENE_MANAGER:switchScene(GameOverStates,"fade","Score: "..self.score)		
	end
		
end

function StatesGame:update()
    if(pd.buttonJustPressed(pd.kButtonLeft)) then
		if(self.imageIndex == 1) then
			self.imageIndex = #MAP_IMAGES
		else
			self.imageIndex -= 1
		end
		self:updateUI()
	elseif(pd.buttonJustPressed(pd.kButtonRight))then
		if(self.imageIndex == #MAP_IMAGES) then
			self.imageIndex = 1
		else
			self.imageIndex += 1
		end
		self:updateUI()
	elseif(pd.buttonJustPressed(pd.kButtonA))then
		self:checkState()
	end
end