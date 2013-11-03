----------------------------------------------------------------------------------
--
-- scenetemplate.lua
-- http://www.coronalabs.com/blog/2011/10/13/multiple-lines-in-display-newtext/
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





-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
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

	navBarBrowseProducts = display.newImageRect ( "images/navigation/navBar/navBarBrowseProducts.png", 32, 32)
	navBarBrowseProducts.x = 120
	navBarBrowseProducts.y = 5 + (navBarBrowseProducts.height / 2)
	navBarBrowseProducts.alpha = .9
	group:insert(navBarBrowseProducts)

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



	-- Navigation event listeners
	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)


	params = event.params
      	  print(params.var1)
      	  print(params.var2)
      	  print(params.var3)
      	  print(params.var4)

 --    message = display.newText( "You Tapped: " .. params.var1, 160, 50, nil, 20, "Helvetica" )
	-- message.x = display.contentWidth/2
	-- message.y = display.contentHeight/2 - 100
	-- group:insert(message)

	productDetailItemName = display.newText( params.var1, 10, 10, Helvetica, 24)
	productDetailItemName:setTextColor(43, 96, 50)
	productDetailItemName.align = "center"
	productDetailItemName.x = 160
	productDetailItemName.y = 80
	group:insert(productDetailItemName)

	productDetailItemSubInfo = display.newText( params.var2, 10, 100, 240, 100, Helvetica, 14)
	productDetailItemSubInfo:setTextColor(68, 68, 68)
	productDetailItemSubInfo.align = "center"
	productDetailItemSubInfo.x = 160
	productDetailItemSubInfo.y = 160
	group:insert(productDetailItemSubInfo)


	itemImage = display.newImage( params.var3 )
	itemImage.x = 160
	itemImage.y = 280
	itemImage.height = 180
	itemImage.width = 250
	group:insert(itemImage)

	backButton = display.newImage( "images/navigation/backButton.png", 32, 32)
	backButton.x = 160
	backButton.y = 420
	backButton.height = 32
	backButton.width = 32
	group:insert(backButton)

	function goBackToCategory (event)
		if event.phase == "ended" then
		storyboard.gotoScene( params.var4 )
	    end
	end

 	-- Navigation event listeners
	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)
	backButton:addEventListener( "touch", goBackToCategory)

	-----------------------------------------------------------------------------
	
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