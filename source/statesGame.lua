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
    self.imageIndex = 51
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
		gfx.drawText("Find: ".. STATE_NAMES[self.correctState],20,10)
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
		--SCENE_MANAGER:switchScene(GameOverStates,"fade","Score: "..self.score)	
		SCENE_MANAGER:switchScene(ViewCorrectAnswerStates,"wipe", self.correctState)	
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