----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

function goCategories (event)
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

	logo = display.newImageRect ( "images/brandMaterials/gnomeAndAwayLogo.png",240, 180)
	logo.x = display.contentWidth/2
	logo.y = 40 + (logo.height / 2)
	logo.alpha = .9
	group:insert(logo)

	navButtonCategories = display.newImageRect ( "images/navigation/navButtonProducts.png",240, 40)
	navButtonCategories.x = display.contentWidth/2
	navButtonCategories.y = 260 + (navButtonCategories.height / 2)
	navButtonCategories.alpha = .9
	group:insert(navButtonCategories)

	navButtonInfo = display.newImageRect ( "images/navigation/navButtonInfo.png",240, 40)
	navButtonInfo.x = display.contentWidth/2
	navButtonInfo.y = 330 + (navButtonInfo.height / 2)
	navButtonInfo.alpha = .9
	group:insert(navButtonInfo)

	navButtonContact = display.newImageRect ( "images/navigation/navButtonContact.png",240, 40)
	navButtonContact.x = display.contentWidth/2
	navButtonContact.y = 400 + (navButtonContact.height / 2)
	navButtonContact.alpha = .9
	group:insert(navButtonContact)
	
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view


	navButtonCategories:addEventListener ("touch", goCategories)
	navButtonInfo:addEventListener ("touch", goInfo)
	navButtonContact:addEventListener ("touch", goContact)

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