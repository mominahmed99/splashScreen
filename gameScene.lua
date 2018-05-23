local composer = require( "composer" )
local physics = require("physics")
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- start physics
    physics.start()
    physics.setGravity(0, 10)
    physics.setDrawMode("hybrid")
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        local theGround1 = display.newImage( "./assets/sprites/land.png" )
        theGround1.x = 520
        theGround1.y = display.contentHeight
        theGround1.id = "the ground"
        physics.addBody( theGround1, "static", { 
            friction = 0.5, 
            bounce = 0.3 
            } )
        sceneGroup:insert( theGround1 )

        local theGround2 = display.newImage( "./assets/sprites/land.png" )
        theGround2.x = 1520
        theGround2.y = display.contentHeight
        theGround2.id = "the ground" -- notice I called this the same thing
        physics.addBody( theGround2, "static", { 
            friction = 0.5, 
            bounce = 0.3 
            } )
        sceneGroup:insert( theGround2 )

        local bird = display.newImage( "./assets/sprites/bird.png" )
        bird.x = display.contentWidth / 2
        bird.y = 0
        bird.id = "bird"
        physics.addBody( bird, "dynamic", { 
            friction = 0.5, 
            bounce = 0.3 
            } )
        sceneGroup:insert( bird )
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene