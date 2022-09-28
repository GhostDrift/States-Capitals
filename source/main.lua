--import statements
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "sceneManager"
import "statesGame"
import "gameOverStates"

--constants
local gfx <const> = playdate.graphics
local pd <const> = playdate
fontNontendoBoldOutline6X = gfx.font.new('font/Nontendo-Bold-outline-6x')
fontNontendoBoldOutline1X = gfx.font.new('font/Nontendo-Bold-1x')

gfx.setImageDrawMode(gfx.kDrawModeCopy)

--global singlton object
SCENE_MANAGER = SceneManager()

StatesGame()

--update function
function playdate.update()
   pd.timer.updateTimers()
   gfx.sprite.update()
end
