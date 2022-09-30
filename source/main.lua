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

StatesGame()



--update function
function playdate.update()
   pd.timer.updateTimers()
   gfx.sprite.update()
   SCREEN_SHAKE:update()
end
