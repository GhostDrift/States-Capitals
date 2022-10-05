--import statements
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "ScreenShake"
import "sceneManager"
import "statesGame"
import "gameOverStates"
import "viewCorrectAnswerStates"
import "State"

--constants
local gfx <const> = playdate.graphics
local pd <const> = playdate
fontNontendoBoldOutline6X = gfx.font.new('font/Nontendo-Bold-outline-6x')
fontNontendoBoldOutline1AndOneHalfX = gfx.font.new('font/Nontendo-Bold-1.5x')
fontMiniSans2X = gfx.font.new("font/Mini-Sans-2X")

gfx.setImageDrawMode(gfx.kDrawModeCopy)

--global singlton object
SCENE_MANAGER = SceneManager()
SCREEN_SHAKE = ScreenShake()
MAP_IMAGES = {}
LIFE_IMAGES = {}
STATE_NAMES = {}



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
--function to initialize the state names list
function initializeStateNames()
	STATE_NAMES[1] = "Alabama"
	STATE_NAMES[2] = "Alaska"
	STATE_NAMES[3] = "Arazona"
	STATE_NAMES[4] = "Arkansas"
	STATE_NAMES[5] = "Califorina"
	STATE_NAMES[6] = "Colorado"
	STATE_NAMES[7] = "Connecticut"
	STATE_NAMES[8] = "Delaware"
	STATE_NAMES[9] = "Florida"
	STATE_NAMES[10] = "Georgia"
	STATE_NAMES[11] = "Hawaii"
	STATE_NAMES[12] = "Idaho"
	STATE_NAMES[13] = "Illinois"
	STATE_NAMES[14] = "Indiana"
	STATE_NAMES[15] = "Iowa"
	STATE_NAMES[16] = "Kansas"
	STATE_NAMES[17] = "Kentucky"
	STATE_NAMES[18] = "Louisiana"
	STATE_NAMES[19] = "Maine"
	STATE_NAMES[20] = "Maryland"
	STATE_NAMES[21] = "Massachusetts"
	STATE_NAMES[22] = "Michigan"
	STATE_NAMES[23] = "Minnesota"
	STATE_NAMES[24] = "Mississippi"
	STATE_NAMES[25] = "Missouri"
	STATE_NAMES[26] = "Montana"
	STATE_NAMES[27] = "Nebraska"
	STATE_NAMES[28] = "Nevada"
	STATE_NAMES[29] = "New Hampshire"
	STATE_NAMES[30] = "New Jersey"
	STATE_NAMES[31] = "New Mexico"
	STATE_NAMES[32] = "New York"
	STATE_NAMES[33] = "North Carolina"
	STATE_NAMES[34] = "North Dakota"
	STATE_NAMES[35] = "Ohio"
	STATE_NAMES[36] = "Oklahoma"
	STATE_NAMES[37] = "Oregon"
	STATE_NAMES[38] = "Pennsylvania"
	STATE_NAMES[39] = "Rhode Island"
	STATE_NAMES[40] = "South Carolina"
	STATE_NAMES[41] = "South Dakota"
	STATE_NAMES[42] = "Tennessee"
	STATE_NAMES[43] = "Texas"
	STATE_NAMES[44] = "Utah"
	STATE_NAMES[45] = "Vermont"
	STATE_NAMES[46] = "Virginia"
	STATE_NAMES[47] = "Washington"
	STATE_NAMES[48] = "West Virginia"
	STATE_NAMES[49] = "Wisconsin"
	STATE_NAMES[50] = "Wyoming"
	STATE_NAMES[51] = " "
end
local function initializeStates()
	local states = {}
	states[1] = State("Alabama","Montgomery",gfx.image.new("images/map(Alabama)"), gfx.image.new("images/map(Alabama)"),42,9,24,10)
	states[2] = State("Alaska","Juneau",gfx.image.new("images/map(Alaska)"),gfx.image.new("images/map(Alaska)"),5,0,0,11)
	states[3] = State("Arazona","Phoenix",gfx.image.new("images/map(Arazona)"),gfx.image.new("images/map(Arazona)"),44,11,5,31)
	states[4] = State("Arkansas","Little Rock",gfx.image.new("images/map(Arkansas)"),gfx.image.new("images/map(Arkansas)"),25,18,36,42)
	states[5] = State("Califorina","Sacramento",gfx.image.new("images/map(Califorina)"),gfx.image.new("images/map(Califorina)"),37,2,0,28)
	states[6] = State("Colorado","Denver",gfx.image.new("images/map(Colorado)"),gfx.image.new("images/map(Colorado)"),50,31,44,16)
	states[7] = State("Connecticut","Hartford",gfx.image.new("images/map(Connecticut)"),gfx.image.new("images/map(Connecticut)"),21,32,32,39)
	states[8] = State("Delaware","Dover",gfx.image.new("images/map(Delaware)"),gfx.image.new("images/map(Delaware)"),38,46,20,30)
	states[9] = State("Florida","Tallahassee",gfx.image.new("images/map(Florida)"),gfx.image.new("images/map(Florida)"),10,0,1,0)
	states[10] = State("Georgia","Atlanta",gfx.image.new("images/map(Georgia)"),gfx.image.new("images/map(Georgia)"),42,9,1,40)
	states[11] = State("Hawaii","Honolulu",gfx.image.new("images/map(Hawaii)"),gfx.image.new("images/map(Hawaii)"),3,0,2,43)
	states[12] = State("Idaho","Boise",gfx.image.new("images/map(Idaho)"),gfx.image.new("images/map(Idaho)"),0,28,37,26)
	states[13] = State("Illinois","Springfield",gfx.image.new("images/map(Illinois)"),gfx.image.new("images/map(Illinois)"),49,17,25,14)
	states[14] = State("Indiana","Indianapolis",gfx.image.new("images/map(Indiana)"),gfx.image.new("images/map(Indiana)"),22,17,13,35)
	states[15] = State("Iowa","Des Moines",gfx.image.new("images/map(Iowa)"),gfx.image.new("images/map(Iowa)"),23,25,41,13)
	states[16] = State("Kansas","Topeka",gfx.image.new("images/map(Kansas)"),gfx.image.new("images/map(Kansas)"),27,36,6,25)
	states[17] = State("Kentucky","Frankfort",gfx.image.new("images/map(Kentucky)"),gfx.image.new("images/map(Kentucky)"),14,42,13,46)
	states[18] = State("Louisiana","Baton Rouge",gfx.image.new("images/map(Louisiana)"),gfx.image.new("images/map(Louisiana)"),4,0,43,24)
	states[19] = State("Maine","Augusta",gfx.image.new("images/map(Maine)"),gfx.image.new("images/map(Maine)"),0,21,29,0)
	states[20] = State("Maryland","Annapolis",gfx.image.new("images/map(Maryland)"),gfx.image.new("images/map(Maryland)"),38,46,48,8)
	states[21] = State("Massachusetts","Boston",gfx.image.new("images/map(Massachusetts)"),gfx.image.new("images/map(Massachusetts)"),29,39,32,0)
	states[22] = State("Michigan","Lansing",gfx.image.new("images/map(Michigan)"),gfx.image.new("images/map(Michigan)"),0,14,49,32)
	states[23] = State("Minnesota","Saint Paul",gfx.image.new("images/map(Minnesota)"),gfx.image.new("images/map(Minnesota)"),0,15,34,49)
	states[24] = State("Mississippi","Jackson",gfx.image.new("images/map(Mississippi)"),gfx.image.new("images/map(Mississippi)"),42,18,4,1)
	states[25] = State("Missouri","Jefferson City",gfx.image.new("images/map(Missouri)"),gfx.image.new("images/map(Missouri)"),15,4,16,13)
	states[26] = State("Montana","Helena",gfx.image.new("images/map(Montana)"),gfx.image.new("images/map(Montana)"),0,50,12,34)
	states[27] = State("Nebraska","Lincoln",gfx.image.new("images/map(Nebraska)"),gfx.image.new("images/map(Nebraska)"),41,16,50,15)
	states[28] = State("Nevada","Carson City",gfx.image.new("images/map(Nevada)"),gfx.image.new("images/map(Nevada)"),37,3,5,44)
	states[29] = State("New Hampshire","Concord",gfx.image.new("images/map(New Hampshire)"),gfx.image.new("images/map(New Hampshire)"),0,21,45,19)
	states[30] = State("New Jersey","Trenton",gfx.image.new("images/map(New Jersey)"),gfx.image.new("images/map(New Jersey)"),38,0,8,32)
	states[31] = State("New Mexico","Santa Fe",gfx.image.new("images/map(New Mexico)"),gfx.image.new("images/map(New Mexico)"),6,43,3,43)
	states[32] = State("New York","Albany",gfx.image.new("images/map(New York)"),gfx.image.new("images/map(New York)"),0,38,0,21)
	states[33] = State("North Carolina","Raleigh",gfx.image.new("images/map(North Carolina)"),gfx.image.new("images/map(North Carolina)"),46,40,42,0)
	states[34] = State("North Dakota","Bismarck",gfx.image.new("images/map(North Dakota)"),gfx.image.new("images/map(North Dakota)"),0,41,26,23)
	
 
end
local function initialize()
   intiializeImages()
   initializeStateNames()
   StatesGame()
end

initialize()
--update function
function playdate.update()
   pd.timer.updateTimers()
   gfx.sprite.update()
   SCREEN_SHAKE:update()
end
