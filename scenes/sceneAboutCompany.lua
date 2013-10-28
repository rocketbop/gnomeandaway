----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

function goHome (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneHome" )
    end
end

function goBrowse (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneCategories" )
    end
end

function goInfo (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneAboutCompany" )
    end
end

function goContact (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneContact" )
    end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	local backgroundWhite = display.newRect(0, 0, 320, 480)
	backgroundWhite:setFillColor(255, 255, 255)
	group:insert(backgroundWhite)

	-- navbar

	navBarHome = display.newImageRect ( "images/navigation/navBar/navBarHome.png", 32, 32)
	navBarHome.x = 40
	navBarHome.y = 5 + (navBarHome.height / 2)
	navBarHome.alpha = .9
	group:insert(navBarHome)

	navBarBrowseProducts = display.newImageRect ( "images/navigation/navBar/navBarBrowseProducts.png", 32, 32)
	navBarBrowseProducts.x = 120
	navBarBrowseProducts.y = 5 + (navBarBrowseProducts.height / 2)
	navBarBrowseProducts.alpha = .9
	group:insert(navBarBrowseProducts)

	navBarInfoGreen = display.newImageRect ( "images/navigation/navBar/navBarInfoGreen.png", 32, 32)
	navBarInfoGreen.x = 200
	navBarInfoGreen.y = 5 + (navBarInfoGreen.height / 2)
	navBarInfoGreen.alpha = .9
	group:insert(navBarInfoGreen)

	navBarContact = display.newImageRect ( "images/navigation/navBar/navBarContact.png", 32, 32)
	navBarContact.x = 280
	navBarContact.y = 5 + (navBarContact.height / 2)
	navBarContact.alpha = .9
	group:insert(navBarContact)
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfoGreen:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene