----------------------------------------------------------------------------------
--
--
-- sceneFlowers.lua
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
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	--import the table view library, set up the list and create the data table
	local tableView = require("tableView")
	local myList
	local data = {}  

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

	-- The title of the section
	shrubsSectionText = display.newText( "SHRUBS SECTION", 0, 0, Helvetica, 20)
	shrubsSectionText:setTextColor(43, 96, 50)
	shrubsSectionText.align = "center"
	shrubsSectionText.x = 160
	shrubsSectionText.y = 80
	group:insert(shrubsSectionText)

	-- Navigation event listeners
	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)

	--setup functions to execute on touch of the list view items
	function listButtonRelease( event )
		self = event.target -- the target is the row 
		local id = self.id  -- this is the row id in the table
			
			-- The data from the list is can be used in the sceneProductDetail scene
		local options =
		{
	    params =
	   		 {
	      	  var1 = self.data.title,
	      	  var2 = self.data.subtitle,
	      	  var3 = self.data.image,
	      	  var4 = self.data.category
	  		 }
		}
		storyboard.gotoScene( "scenes.sceneProductDetail", options )
	end

	--setup each row as a new table, then add title, subtitle, and image
	data[1] = {}
	data[1].title = "Bamboo"
	data[1].subtitle = "Bamboos are some of the fastest-growing plants in the world, due to a unique rhizome-dependent system."
	data[1].image = "./images/shrubs/shrubsListBamboo.jpg"
	data[1].category = "scenes.sceneShrubs"

	data[2] = {}
	data[2].title = "Thuja"
	data[2].subtitle = "Thuja species are used as food by the larvae of the Autumnal Moth, The Engrailed and Juniper Pug. "
	data[2].image = "./images/shrubs/shrubsListThuja.jpg"
	data[2].category = "scenes.sceneShrubs"

	data[3] = {}
	data[3].title = "Grape Holly"
	data[3].subtitle = "Resistant to summer drought, tolerates poor soils, and does not create excessive leaf litter."
	data[3].image = "./images/shrubs/shrubsListGrapeHolly.jpg"
	data[3].category = "scenes.sceneShrubs"

	data[4] = {}
	data[4].title = "Witch Hazel"
	data[4].subtitle = "Often used as a natural remedy for psoriasis, eczema, ingrown nails, and dry skin."
	data[4].image = "./images/shrubs/shrubsListWitchHazel.jpg"
	data[4].category = "scenes.sceneShrubs"

	data[5] = {}
	data[5].title = "Teaberry"
	data[5].subtitle = "Teaberry is also an ice cream flavor in regions where the plant grows."
	data[5].image = "./images/shrubs/shrubsListTeaberry.jpg"
	data[5].category = "scenes.sceneShrubs"

	data[6] = {}
	data[6].title = "Lavender"
	data[6].subtitle = "Lavender essential oil has antiseptic and anti-inflammatory properties."
	data[6].image = "./images/shrubs/shrubsListLavender.jpg"
	data[6].category = "scenes.sceneShrubs"

	data[7] = {}
	data[7].title = "Boxwood"
	data[7].subtitle = "The most common Boxwood in Ireland is Buxus."
	data[7].image = "./images/shrubs/shrubsListBoxwood.jpg"
	data[7].category = "scenes.sceneShrubs"

	data[8] = {}
	data[8].title = "Sago Palm"
	data[8].subtitle = "Sago palm was a staple food source for the ancient Chinese, before rice cultivation."
	data[8].image = "./images/shrubs/shrubsListSagoPalm.jpg"
	data[8].category = "scenes.sceneShrubs"

	data[9] = {}
	data[9].title = "Cotoneaster"
	data[9].subtitle = "The red berries are highly attractive to blackbirds and other thrushes."
	data[9].image = "./images/shrubs/shrubsListCotoneaster.jpg"
	data[9].category = "scenes.sceneShrubs"

	data[10] = {}
	data[10].title = "Damianita"
	data[10].subtitle = "Plant it near walls, driveways, and other areas where reflective heat is intense."
	data[10].image = "./images/shrubs/shrubsListDamianita.jpg"
	data[10].category = "scenes.sceneShrubs"

	-- Define where the of the table will be begin.
	local topBoundary = display.screenOriginY + 140
	local bottomBoundary = display.screenOriginY + 0

	-- create the list of items

		myList = tableView.newList{
		data=data, --A table containing elements that the list can iterate through to display in each row.
		default="images/defaultListBar.png", --An image for the row background. Defines the hit area for the touch.
		over="images/defaultListBarTouch.png", --An image that will show on touch.
		onRelease=listButtonRelease, --A function name that defines the action to take after a row is tapped.
		top=topBoundary, --The upper boundary of the list. The list will start and snap back to this position.
		bottom=bottomBoundary, --The bottom boundary of the list. The list will snap back to this position when scrolled upward.
		
		-- callback = A function that defines how to display the data in each row. Each element in the data table will be used in place of the 
	    -- argument ("item")  assigned to the callback function. 
	    callback = function( row ) 
	                         local g = display.newGroup()

	                         local img = display.newImage(row.image)
	                         g:insert(img)
	                         img.x = math.floor(img.width*0.5 + 6) --Move the image slightly away from the side
	                         img.y = math.floor(img.height*0.5) 

	                         local title =  display.newText( row.title, 0, 0, Helvetica, 14 )
	                         title:setTextColor(43, 96, 50)
	                         g:insert(title)
	                         title.x = title.width*0.5 + img.width + 10
	                         title.y = 10

	                         local subtitle =  display.newText( row.subtitle, 0, 50, 170, 90, Helvetica, 12 )
	                         subtitle:setTextColor( 69, 69, 69 )
	                         g:insert(subtitle)
	                         subtitle.x = subtitle.width*0.5 + img.width + 10
	                         subtitle.y = title.y + title.height + 40

	                         return g  
	                  end 
	}
	group:insert(myList)


	-- To hide the Navbar and text once table rolls over them.  

	local listBackground = display.newRect( 0, 0, myList.width, myList.height )
	listBackground:setFillColor(255,255,255)
	myList:insert(1,listBackground)

		
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