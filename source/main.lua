--import statements
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "sceneManager"
import "statesGame"

--constants
local gfx <const> = playdate.graphics
local pd <const> = playdate

--global singlton object
SCENE_MANAGER = SceneManager()

StatesGame()

--update function
function playdate.update()
   pd.timer.updateTimers()
   gfx.sprite.update()
end
