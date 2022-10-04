--containter class to hold all of the relevent data for each state

class(State).extends()

--consturctor
function State:init(name,capitol,mapImage,stateImage,stateAbove,stateBelow,stateLeft,stateRight)
    self.name = name
    self.capitol = capitol
    self.mapImage = mapImage
    self.stateImage = stateImage
    self.stateAbove = stateAbove
    self.stateBelow = stateBelow
    self.stateLeft = stateLeft
    self.stateRight = stateRight
end
-- getters and setters for variables
function State:getName()
    return self.name
end
function State:getCapitol()
    return self.capitol
end
function State:getMapImage()
    return self.mapImage
end
function State:getStateImage()
    return self.stateImage
end
function State:getStateAbove()
    return self.stateAbove
end
function State:getStateBelow()
    return self.stateBelow
end
function State:getStateRight()
    return self.stateRight
end
function State:getStateLeft()
    return self.stateLeft
end
