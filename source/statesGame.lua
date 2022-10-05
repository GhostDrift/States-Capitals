--import statements

--local variables
local pd <const> = playdate
local gfx <const> = pd.graphics


class("StatesGame").extends(gfx.sprite)
function StatesGame:init()
    self.life = 3
    self.score = 0
    math.randomseed(pd.getCurrentTimeMilliseconds())
    self.correctState = math.random(1,50)
    self.imageIndex = 50
    self.mapSprite = gfx.sprite.new()
    self.mapSprite:moveTo(200,133)
    self.mapSprite:add()
	self.infoSprite = gfx.sprite.new()
	self.infoSprite:moveTo(195,15)
	self.infoSprite:add()
	gfx.clear()
	self.mapSprite:setImage(BLANK_MAP)
   	--self:updateUI()
	self:updateInfo()

    self:add()
end

--function to update the ui
function StatesGame:updateUI()
    gfx.clear()
    --self.mapSprite:setImage(MAP_IMAGES[self.imageIndex])
	self.mapSprite:setImage(STATES[self.imageIndex]:getMapImage())
end
--function to create the info sprite
function StatesGame:updateInfo()
	gfx.setFont(fontNontendoBoldOutline1AndOneHalfX)
	local infoImage = gfx.image.new(400,40)
	gfx.pushContext(infoImage)
		gfx.drawText("Find: " .. STATES[self.correctState]:getName(),20,10)
		--gfx.drawText("Find: ".. STATE_NAMES[self.correctState],20,10)
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
		local sceneArgs = {"Score: "..self.score, self.correctState}
		SCENE_MANAGER:switchScene(GameOverStates,"fade",sceneArgs)	
		--SCENE_MANAGER:switchScene(GameOverStates,"fade","Score: "..self.score, self.correctState)	
		--SCENE_MANAGER:switchScene(ViewCorrectAnswerStates,"wipe", self.correctState)	
	end
		
end
--function to move between the states
function StatesGame:moveStates(direction)
	if(direction == "U") then
		self.imageIndex = STATES[self.imageIndex]:getStateAbove()
	elseif(direction == "D") then
		self.imageIndex = STATES[self.imageIndex]:getStateBelow()
	elseif(direction == "L") then
		self.imageIndex = STATES[self.imageIndex]:getStateLeft()
	elseif(direction == "R") then
		self.imageIndex = STATES[self.imageIndex]:getStateRight()
	end
end

function StatesGame:update()
    if(pd.buttonJustPressed(pd.kButtonLeft)) then
		--if(self.imageIndex == 1) then
			--self.imageIndex = #MAP_IMAGES
			--self.imageIndex = #STATES
		--else
			--self.imageIndex -= 1
		--end
		self:moveStates("L")
		self:updateUI()
	elseif(pd.buttonJustPressed(pd.kButtonRight))then
		--if(self.imageIndex == #MAP_IMAGES) then
		--if(self.imageIndex == #STATES) then
			--self.imageIndex = 1
		--else
		--	self.imageIndex += 1
		--end
		self:moveStates("R")
		self:updateUI()
	elseif(pd.buttonJustPressed(pd.kButtonUp))then
		--if(self.imageIndex == #MAP_IMAGES) then
		--if(self.imageIndex == #STATES) then
			--self.imageIndex = 1
		--else
		--	self.imageIndex += 1
		--end
		self:moveStates("U")
		self:updateUI()
	elseif(pd.buttonJustPressed(pd.kButtonDown))then
		--if(self.imageIndex == #MAP_IMAGES) then
		--if(self.imageIndex == #STATES) then
			--self.imageIndex = 1
		--else
		--	self.imageIndex += 1
		--end
		self:moveStates("D")
		self:updateUI()
	elseif(pd.buttonJustPressed(pd.kButtonA))then
		self:checkState()
	end
end