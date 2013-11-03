----------------------------------------------------------------------------------
--
-- sceneContact.lua
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
--  http://docs.coronalabs.com/api/library/system/openURL.html
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

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

-- This should open the phone's phone.
function callUs (event)
	if event.phase == "ended" then
	system.openURL( "tel:00353 86 1651664")
	print("tel")
	end
end

function mailUs (event)
	if event.phase == "ended" then
	system.openURL( "mailto:help@gnomeandaway.com")
	print("mail")
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------

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

	navBarContactGreen = display.newImageRect ( "images/navigation/navBar/navBarContactGreen.png", 32, 32)
	navBarContactGreen.x = 280
	navBarContactGreen.y = 5 + (navBarContactGreen.height / 2)
	navBarContactGreen.alpha = .9
	group:insert(navBarContactGreen)

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

	navBarContactGreen = display.newImageRect ( "images/navigation/navBar/navBarContactGreen.png", 32, 32)
	navBarContactGreen.x = 280
	navBarContactGreen.y = 5 + (navBarContactGreen.height / 2)
	navBarContactGreen.alpha = .9
	group:insert(navBarContactGreen)

	--Contact objects

	contactHeadingText = display.newText( "CONTACT US", 0, 0, Helvetica, 20)
	contactHeadingText:setTextColor(43, 96, 50)
	contactHeadingText.align = "center"
	contactHeadingText.x = 160
	contactHeadingText.y = 80
	group:insert(contactHeadingText)

	phone = display.newImageRect( "images/navigation/phone.png", 64, 64)
	phone.x = 160
	phone.y = 150
	group:insert(phone)

	contactPhoneNumber = display.newText( "00353 86 1651664", 0, 0, Helvetica, 14)
	contactPhoneNumber:setTextColor(69, 69, 69)
	contactPhoneNumber.align = "center"
	contactPhoneNumber.x = 160
	contactPhoneNumber.y = 190
	group:insert(contactPhoneNumber)

	web = display.newImageRect( "images/navigation/web.png", 64, 64)
	web.x = 160
	web.y = 260
	group:insert(web)

	emailAddress = display.newText( "Email: help@gnomeandaway.com", 0, 0, Helvetica, 14)
	emailAddress:setTextColor(69, 69, 69)
	emailAddress.align = "center"
	emailAddress.x = 160
	emailAddress.y = 300
	group:insert(emailAddress)

	webAddress = display.newText( "Web: www.gnomeandaway.com", 0, 0, Helvetica, 14)
	webAddress:setTextColor(69, 69, 69)
	webAddress.align = "center"
	webAddress.x = 160
	webAddress.y = 320
	group:insert(webAddress)

	shop = display.newImageRect( "images/navigation/shop.png", 64, 64)
	shop.x = 160
	shop.y = 385
	group:insert(shop)

	physicalAddress = display.newText( "Location: 123 Fake Street, Dublin 8", 0, 0, Helvetica, 14)
	physicalAddress:setTextColor(69, 69, 69)
	physicalAddress.align = "center"
	physicalAddress.x = 160
	physicalAddress.y = 425
	group:insert(physicalAddress)



end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	

	

	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContactGreen:addEventListener ("touch", goContact)

	phone:addEventListener ("touch", callUs)
	web:addEventListener ("touch", mailUs)
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