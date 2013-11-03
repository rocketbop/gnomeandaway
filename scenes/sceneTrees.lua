----------------------------------------------------------------------------------
--
--
-- sceneFlowers.lua
--
-- Iconography courtesy of http://www.jigsoaricons.com, Creative Commons
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
	treesSectionText = display.newText( "TREES SECTION", 0, 0, Helvetica, 20)
	treesSectionText:setTextColor(43, 96, 50)
	treesSectionText.align = "center"
	treesSectionText.x = 160
	treesSectionText.y = 80
	group:insert(treesSectionText)

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
	data[1].title = "Oak"
	data[1].subtitle = "Japanese oak is used in the making of professional drums from manufacturer Yamaha Drums."
	data[1].image = "./images/trees/treesListOak.jpg"
	data[1].category = "scenes.sceneTrees"

	data[2] = {}
	data[2].title = "Ash"
	data[2].subtitle = "The seeds, popularly known as keys or helicopter seeds, are a type of fruit known as a samara."
	data[2].image = "./images/trees/treesListAsh.jpg"
	data[2].category = "scenes.sceneTrees"

	data[3] = {}
	data[3].title = "Sycamore"
	data[3].subtitle = "The name derives from the Greek language συκόμορος (sukomoros) meaning fig-mulberry."
	data[3].image = "./images/trees/treesListSycamore.jpg"
	data[3].category = "scenes.sceneTrees"

	data[4] = {}
	data[4].title = "Plum"
	data[4].subtitle = "The outstanding variety for garden use is still 'Victoria', which has been grown for over a century"
	data[4].image = "./images/trees/treesListPlum.jpg"
	data[4].category = "scenes.sceneTrees"

	data[5] = {}
	data[5].title = "Orange"
	data[5].subtitle = "Oranges have been the most cultivated tree fruit in the world since 1987."
	data[5].image = "./images/trees/treesListOrange.jpg"
	data[5].category = "scenes.sceneTrees"

	data[6] = {}
	data[6].title = "Cherry"
	data[6].subtitle = "Cherry trees also provide food for the caterpillars of several Lepidoptera."
	data[6].image = "./images/trees/treesListCherry.jpg"
	data[6].category = "scenes.sceneTrees"

	data[7] = {}
	data[7].title = "Silver Birch"
	data[7].subtitle = "Birch will grow in poor soils, but likes a sunny position."
	data[7].image = "./images/trees/treesListSilverBirch.jpg"
	data[7].category = "scenes.sceneTrees"

	data[8] = {}
	data[8].title = "Lemon"
	data[8].subtitle = "In ancient Jerusalem, Jews would pelt errant high priests with lemons during festivals."
	data[8].image = "./images/trees/treesListLemon.jpg"
	data[8].category = "scenes.sceneTrees"

	data[9] = {}
	data[9].title = "Jasmine"
	data[9].subtitle = "Jasmines are widely cultivated for the characteristic fragrance of their flowers."
	data[9].image = "./images/trees/treesListJasmine.jpg"
	data[9].category = "scenes.sceneTrees"

	data[10] = {}
	data[10].title = "Conifer"
	data[10].subtitle = "Although the total number of species is relatively small, conifers are of immense ecological importance."
	data[10].image = "./images/trees/treesListConifer.jpg"
	data[10].category = "scenes.sceneTrees"

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