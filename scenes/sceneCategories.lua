----------------------------------------------------------------------------------
--
-- sceneCategories.lua
--
-- Iconography courtesy of https://www.iconfinder.com/search/?q=iconset%3Ajigsoar-icons, Creative Commons
-- Text alignment tips from: http://docs.coronalabs.com/api/library/display/newText.html
-- ... and ... http://docs.coronalabs.com/api/type/TextField/align.html
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

-- navigation functions

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


function goFlowers (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneFlowers" )
    end
end

function goHerbs (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneHerbs" )
    end
end

function goTrees (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneTrees" )
    end
end

function goShrubs (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scenes.sceneShrubs" )
    end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------


	local backgroundWhite = display.newRect(0, 0, 320, 480)
	backgroundWhite:setFillColor(255, 255, 255)
	group:insert(backgroundWhite)

	-- navbar

	navBarHome = display.newImageRect ( "images/navigation/navBar/navBarHome.png", 32, 32)
	navBarHome.x = 40
	navBarHome.y = 5 + (navBarHome.height / 2)
	navBarHome.alpha = .9
	group:insert(navBarHome)

	navBarBrowseProductsGreen = display.newImageRect ( "images/navigation/navBar/navBarBrowseProductsGreen.png", 32, 32)
	navBarBrowseProductsGreen.x = 120
	navBarBrowseProductsGreen.y = 5 + (navBarBrowseProductsGreen.height / 2)
	navBarBrowseProductsGreen.alpha = .9
	group:insert(navBarBrowseProductsGreen)

	navBarInfo = display.newImageRect ( "images/navigation/navBar/navBarInfo.png", 32, 32)
	navBarInfo.x = 200
	navBarInfo.y = 5 + (navBarInfo.height / 2)
	navBarInfo.alpha = .9
	group:insert(navBarInfo)

	navBarContact = display.newImageRect ( "images/navigation/navBar/navBarContact.png", 32, 32)
	navBarContact.x = 280
	navBarContact.y = 5 + (navBarContact.height / 2)
	navBarContact.alpha = .9
	group:insert(navBarContact)

	-- text



	categorySectionText = display.newText( "PRODUCT CATEGORIES", 0, 0, Helvetica, 20)
	categorySectionText:setTextColor(68, 68, 68)
	categorySectionText.align = "center"
	categorySectionText.x = 160
	categorySectionText.y = 80
	group:insert(categorySectionText)

	flowersButtonText = display.newText( "FLOWERS", 0, 0, Helvetica, 14)
	flowersButtonText:setTextColor(68, 68, 68)
	flowersButtonText.align = "center"
	flowersButtonText.x = 85
	flowersButtonText.y = 265
	group:insert(flowersButtonText)

	herbsButtonText = display.newText( "HERBS", 0, 0, Helvetica, 14)
	herbsButtonText:setTextColor(68, 68, 68)
	herbsButtonText.align = "center"
	herbsButtonText.x = 235
	herbsButtonText.y = 265
	group:insert(herbsButtonText)

	treesButtonText = display.newText( "TREES", 0, 0, Helvetica, 14)
	treesButtonText:setTextColor(68, 68, 68)
	treesButtonText.align = "center"
	treesButtonText.x = 85
	treesButtonText.y = 435
	group:insert(treesButtonText)

	shrubsButtonText = display.newText( "SHRUBS", 0, 0, Helvetica, 14)
	shrubsButtonText:setTextColor(68, 68, 68)
	shrubsButtonText.align = "center"
	shrubsButtonText.x = 235
	shrubsButtonText.y = 435
	group:insert(shrubsButtonText)



	-- Category boxes
	categoryFlowersButton = display.newImageRect ( "images/navigation/categories/categoryFlowers2.png", 130, 130)
	categoryFlowersButton.x = 20 + (categoryFlowersButton.width / 2)
	categoryFlowersButton.y = 120 + (categoryFlowersButton.height / 2)
	categoryFlowersButton.alpha = .9
	group:insert(categoryFlowersButton)

	categoryHerbsButton = display.newImageRect ( "images/navigation/categories/categoryHerbs.png", 130, 130)
	categoryHerbsButton.x = 170 + (categoryHerbsButton.width / 2)
	categoryHerbsButton.y = 120 + (categoryHerbsButton.height / 2)
	categoryHerbsButton.alpha = .9
	group:insert(categoryHerbsButton)

	categoryTreesButton = display.newImageRect ( "images/navigation/categories/categoryTrees.png", 130, 130)
	categoryTreesButton.x = 20 + (categoryTreesButton.width / 2)
	categoryTreesButton.y = 290 + (categoryTreesButton.height / 2)
	categoryTreesButton.alpha = .9
	group:insert(categoryTreesButton)

	categoryShrubsButton = display.newImageRect ( "images/navigation/categories/categoryFurniture.png", 130, 130)
	categoryShrubsButton.x = 170 + (categoryShrubsButton.width / 2)
	categoryShrubsButton.y = 290 + (categoryShrubsButton.height / 2)
	categoryShrubsButton.alpha = .9
	group:insert(categoryShrubsButton)






end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
	-- Navigation event listeners
	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProductsGreen:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)

	categoryFlowersButton:addEventListener ("touch", goFlowers)
	categoryHerbsButton:addEventListener ("touch", goHerbs)
	categoryTreesButton:addEventListener ("touch", goTrees)
	categoryShrubsButton:addEventListener ("touch", goShrubs)

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