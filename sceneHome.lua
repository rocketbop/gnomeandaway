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

function categories (event)
	if event.phase == "ended" then
	-- storyboard.gotoScene( "scenes.sceneCategories" )
	print ("hello")
    end
end



-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	background = display.newImageRect ( "images/backgrounds/grassBackground.jpg", 320, 480)
	background.x = display.contentWidth/2
	background.y = display.contentHeight/2
	
	group:insert(background)

	logo = display.newImageRect ( "images/brandMaterials/logoWhite180H.png",240, 180)
	logo.x = display.contentWidth/2
	logo.y = 40 + (logo.height / 2)
	logo.alpha = .9
	group:insert(logo)

	navButtonCategories = display.newImageRect ( "images/navigation/navButtonFlowers.png",240, 50)
	navButtonCategories.x = display.contentWidth/2
	navButtonCategories.y = 250 + (navButtonCategories.height / 2)
	navButtonCategories.alpha = .9
	group:insert(navButtonCategories)

	navButtonCategories = display.newImageRect ( "images/navigation/navButtonFlowers.png",240, 50)
	navButtonCategories.x = display.contentWidth/2
	navButtonCategories.y = 320 + (navButtonCategories.height / 2)
	navButtonCategories.alpha = .9
	group:insert(navButtonCategories)

	navButtonCategories = display.newImageRect ( "images/navigation/navButtonFlowers.png",240, 50)
	navButtonCategories.x = display.contentWidth/2
	navButtonCategories.y = 390 + (navButtonCategories.height / 2)
	navButtonCategories.alpha = .9
	group:CategoriesnavButtonCategories)
	
	


end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
	-- navButtonCategories:addEventListener ("touch", categories)
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
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