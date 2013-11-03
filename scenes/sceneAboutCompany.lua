----------------------------------------------------------------------------------
--
-- sceneAboutCompany.lua
--
-- Iconography courtesy of https://www.iconfinder.com/search/?q=iconset%3Aflat-ui-icons-24-px, Creative Commons
-- Text alignment tips from: http://docs.coronalabs.com/api/library/display/newText.html
-- ... and ... http://docs.coronalabs.com/api/type/TextField/align.html
--
-- Tableview help from http://masteringcoronasdk.com
-- ... and http://www.youtube.com/watch?v=ZMh1VNbZ7z8
--
-- http://www.coronalabs.com/blog/2011/10/13/multiple-lines-in-display-newtext/
--

-- Thanks to http://hex2rgba.devoth.com Converter
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


	headingText = display.newText( "WHO WE ARE", 0, 0, Helvetica, 20)
	headingText:setTextColor(43, 96, 50)
	headingText.align = "center"
	headingText.x = 160
	headingText.y = 80
	group:insert(headingText)

	bodyTextString = "At Gnome and Away Garden Centre, we believe that the plants we surround ourselves " ..
						"with reflect our personalities, and help us keep in touch with the universe. " ..
						"Because choosing the right trees, shrubs or flowers for your home is so important, " ..
						"we'll make sure you get the best advice."

	bodyTextString2 = "That's our promise!"
						

	bodyText = display.newText( bodyTextString, 10, 100, 240, 220, Helvetica, 14)
	bodyText:setTextColor(68, 68, 68)
	bodyText.align = "center"
	bodyText.x = 160
	bodyText.y = 230
	group:insert(bodyText)

	bodyText2 = display.newText( bodyTextString2, 10, 100, 240, 220, Helvetica, 14)
	bodyText2:setTextColor(68, 68, 68)
	bodyText2.align = "center"
	bodyText2.x = 160
	bodyText2.y = 420
	group:insert(bodyText2)

	handsShaking = display.newImageRect ( "images/brandMaterials/handsShaking.jpg", 200, 114)
	handsShaking.x = 160
	handsShaking.y = 400
	group:insert(handsShaking)





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