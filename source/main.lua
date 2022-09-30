--import statements
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "ScreenShake"
import "sceneManager"
import "statesGame"
import "gameOverStates"

--constants
local gfx <const> = playdate.graphics
local pd <const> = playdate
fontNontendoBoldOutline6X = gfx.font.new('font/Nontendo-Bold-outline-6x')
fontNontendoBoldOutline1AndOneHalfX = gfx.font.new('font/Nontendo-Bold-1.5x')

gfx.setImageDrawMode(gfx.kDrawModeCopy)

--global singlton object
SCENE_MANAGER = SceneManager()
SCREEN_SHAKE = ScreenShake()
MAP_IMAGES = {}
LIFE_IMAGES = {}



--fucntion to initialize the game images
local function intiializeImages()
	MAP_IMAGES[1] = gfx.image.new("images/map(Alabama)")
	MAP_IMAGES[2] = gfx.image.new("images/map(Alaska)")
	MAP_IMAGES[3] = gfx.image.new("images/map(Arazona)")
	MAP_IMAGES[4] = gfx.image.new("images/map(Arkansas)")
	MAP_IMAGES[5] = gfx.image.new("images/map(Califorina)")
	MAP_IMAGES[6] = gfx.image.new("images/map(Colorado)")
	MAP_IMAGES[7] = gfx.image.new("images/map(Connecticut)")
	MAP_IMAGES[8] = gfx.image.new("images/map(Delaware)")
	MAP_IMAGES[9] = gfx.image.new("images/map(Florida)")
	MAP_IMAGES[10] = gfx.image.new("images/map(Georgia)")
	MAP_IMAGES[11] = gfx.image.new("images/map(Hawaii)")
	MAP_IMAGES[12] = gfx.image.new("images/map(Idaho)")
	MAP_IMAGES[13] = gfx.image.new("images/map(Illinois)")
	MAP_IMAGES[14] = gfx.image.new("images/map(Indiana)")
	MAP_IMAGES[15] = gfx.image.new("images/map(Iowa)")
	MAP_IMAGES[16] = gfx.image.new("images/map(Kansas)")
	MAP_IMAGES[17] = gfx.image.new("images/map(Kentucky)")
	MAP_IMAGES[18] = gfx.image.new("images/map(Louisiana)")
	MAP_IMAGES[19] = gfx.image.new("images/map(Maine)")
	MAP_IMAGES[20] = gfx.image.new("images/map(Maryland)")
	MAP_IMAGES[21] = gfx.image.new("images/map(Massachusetts)")
	MAP_IMAGES[22] = gfx.image.new("images/map(Michigan)")
	MAP_IMAGES[23] = gfx.image.new("images/map(Minnesota)")
	MAP_IMAGES[24] = gfx.image.new("images/map(Mississippi)")
	MAP_IMAGES[25] = gfx.image.new("images/map(Missouri)")
	MAP_IMAGES[26] = gfx.image.new("images/map(Montana)")
	MAP_IMAGES[27] = gfx.image.new("images/map(Nebraska)")
	MAP_IMAGES[28] = gfx.image.new("images/map(Nevada)")
	MAP_IMAGES[29] = gfx.image.new("images/map(New Hampshire)")
	MAP_IMAGES[30] = gfx.image.new("images/map(New Jersey)")
	MAP_IMAGES[31] = gfx.image.new("images/map(New Mexico)")
	MAP_IMAGES[32] = gfx.image.new("images/map(New York)")
	MAP_IMAGES[33] = gfx.image.new("images/map(North Carolina)")
	MAP_IMAGES[34] = gfx.image.new("images/map(North Dakota)")
	MAP_IMAGES[35] = gfx.image.new("images/map(Ohio)")
	MAP_IMAGES[36] = gfx.image.new("images/map(Oklahoma)")
	MAP_IMAGES[37] = gfx.image.new("images/map(Oregon)")
	MAP_IMAGES[38] = gfx.image.new("images/map(Pennsylvania)")
	MAP_IMAGES[39] = gfx.image.new("images/map(Rhode Island)")
	MAP_IMAGES[40] = gfx.image.new("images/map(South Carolina)")
	MAP_IMAGES[41] = gfx.image.new("images/map(South Dakota)")
	MAP_IMAGES[42] = gfx.image.new("images/map(Tennessee)")
	MAP_IMAGES[43] = gfx.image.new("images/map(Texas)")
	MAP_IMAGES[44] = gfx.image.new("images/map(Utah)")
	MAP_IMAGES[45] = gfx.image.new("images/map(Vermont)")
	MAP_IMAGES[46] = gfx.image.new("images/map(Virginia)")
	MAP_IMAGES[47] = gfx.image.new("images/map(Washington)")
	MAP_IMAGES[48] = gfx.image.new("images/map(West Virginia)")
	MAP_IMAGES[49] = gfx.image.new("images/map(Wisconsin)")
	MAP_IMAGES[50] = gfx.image.new("images/map(Wyoming)")
	MAP_IMAGES[51] = gfx.image.new("images/map")
   LIFE_IMAGES[1] = gfx.image.new("images/emptyHeart")
   LIFE_IMAGES[2] = gfx.image.new("images/fullHeart")
end
local function initialize()
   intiializeImages()
   StatesGame()
end

initialize()
--update function
function playdate.update()
   pd.timer.updateTimers()
   gfx.sprite.update()
   SCREEN_SHAKE:update()
end
