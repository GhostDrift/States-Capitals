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
import "gameSelect"

--constants
local gfx <const> = playdate.graphics
local pd <const> = playdate
fontNontendoBoldOutline6X = gfx.font.new('font/Nontendo-Bold-outline-6x')
fontNontendoBoldOutline1AndOneHalfX = gfx.font.new('font/Nontendo-Bold-1.5x')
fontNontendoBold4X = gfx.font.new("font/Nontendo-Bold-4x")
fontMiniSans2X = gfx.font.new("font/Mini-Sans-2X")
fontMiniSans3X = gfx.font.new("font/Mini-Sans-3X")
local statesFileName = "states_scores"
local capitolsFileName = "capitols_scores"
--test code for table sorting
--testTable = {5,2,7,3,9}
--table.sort(testTable,function(a,b) return a > b end)
--for i = 1,#testTable,1 do
	--print(testTable[i])
--end

gfx.setImageDrawMode(gfx.kDrawModeCopy)

--global singlton object
SCENE_MANAGER = SceneManager()
SCREEN_SHAKE = ScreenShake()
LIFE_IMAGES = {gfx.image.new("images/emptyHeart"),gfx.image.new("images/fullHeart")}
STATES = {}
STATES_SCORES = nil
CAPITOLS_SCORES = nil
BLANK_MAP = gfx.image.new("images/map")
--function to initialize the states table
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
	states[35] = State("Ohio","Columbus",gfx.image.new("images/map(Ohio)"),gfx.image.new("images/map(Ohio)"),22,17,14,38)
	states[36] = State("Oklahoma","Oklahoma City",gfx.image.new("images/map(Oklahoma)"),gfx.image.new("images/map(Oklahoma)"),16,43,31,4)
	states[37] = State("Oregon","Salem",gfx.image.new("images/map(Oregon)"),gfx.image.new("images/map(Oregon)"),47,5,0,12)
	states[38] = State("Pennsylvania","Harrisburg",gfx.image.new("images/map(Pennsylvania)"),gfx.image.new("images/map(Pennsylvania)"),32,20,35,30)
	states[39] = State("Rhode Island","Providence",gfx.image.new("images/map(Rhode Island)"),gfx.image.new("images/map(Rhode Island)"),21,32,7,21)
	states[40] = State("South Carolina","Columbia",gfx.image.new("images/map(South Carolina)"),gfx.image.new("images/map(South Carolina)"),33,10,10,0)
	states[41] = State("South Dakota","Pierre",gfx.image.new("images/map(South Dakota)"),gfx.image.new("images/map(South Dakota)"),34,27,50,23)
	states[42] = State("Tennessee","Nashville",gfx.image.new("images/map(Tennessee)"),gfx.image.new("images/map(Tennessee)"),17,1,4,33)
	states[43] = State("Texas","Austin",gfx.image.new("images/map(Texas)"),gfx.image.new("images/map(Texas)"),36,0,31,18)
	states[44] = State("Utah","Salt Lake City",gfx.image.new("images/map(Utah)"),gfx.image.new("images/map(Utah)"),12,3,28,6)
	states[45] = State("Vermont","Montpelier",gfx.image.new("images/map(Vermont)"),gfx.image.new("images/map(Vermont)"),0,21,32,29)
	states[46] = State("Virginia","Richmond",gfx.image.new("images/map(Virginia)"),gfx.image.new("images/map(Virginia)"),48,33,17,0)
	states[47] = State("Washington","Olympia",gfx.image.new("images/map(Washington)"),gfx.image.new("images/map(Washington)"),0,37,0,12)
	states[48] = State("West Virginia","Charleston",gfx.image.new("images/map(West Virginia)"),gfx.image.new("images/map(West Virginia)"),38,46,35,20)
	states[49] = State("Wisconsin","Madison",gfx.image.new("images/map(Wisconsin)"),gfx.image.new("images/map(Wisconsin)"),22,13,23,22)
	states[50] = State("Wyoming","Cheyenne",gfx.image.new("images/map(Wyoming)"),gfx.image.new("images/map(Wyoming)"),26,6,12,41) 
	return states
end
--function to load the scores lists
local function loadScores()
	local statesFileName = "states_scores"
	local capitolsFileName = "capitols_scores"
	STATES_SCORES = pd.datastore.read(statesFileName)
	if(STATES_SCORES == nil)then
		STATES_SCORES = {}
		pd.datastore.write(STATES_SCORES,statesFileName,true)
	end
	CAPITOLS_SCORES = pd.datastore.read(capitolsFileName)
	if(CAPITOLS_SCORES == nil)then
		CAPITOLS_SCORES = {}
		pd.datastore.write(CAPITOLS_SCORES,capitolsFileName,true)
	end
end
--functions to add scores to the highscore lists
function addStatesScore(score)
	STATES_SCORES[#STATES_SCORES+1] = score
	table.sort(STATES_SCORES,function(a,b) return a > b end)
	pd.datastore.write(STATES_SCORES,statesFileName,true)
end
function addCapitolsScore(score)
	CAPITOLS_SCORES[#CAPITOLS_SCORES+1] = score
	table.sort(CAPITOLS_SCORES,function(a,b) return a > b end)
	pd.datastore.write(CAPITOLS_SCORES,capitolsFileName,true)
end
local function initialize()
   STATES = initializeStates()
   loadScores()
   GameSelect()
end

initialize()
--update function
function playdate.update()
   pd.timer.updateTimers()
   gfx.sprite.update()
   SCREEN_SHAKE:update()
end
