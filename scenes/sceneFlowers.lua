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
	
	-----------------------------------------------------------------------------
		
--import the table view library
local tableView = require("tableView")



--initial values

local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight 
-- used for offsetting buttons
-- display.viewableContentWidth = A read-only property that contains the width of the viewable screen area in content coordinates.
-- In cases where you use scaling sometimes content is scaled where some appears off screen. Only viewable content gets considered here

local myList

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

	-- text

	flowersSectionText = display.newText( "FLOWERS SECTION", 0, 0, Helvetica, 20)
	flowersSectionText:setTextColor(43, 96, 50)
	flowersSectionText.align = "center"
	flowersSectionText.x = 160
	flowersSectionText.y = 80
	group:insert(flowersSectionText)



	-- Navigation event listeners
	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)
 
--setup the table
local data = {}  

-- --setup a color fill for selected items
-- local selected = display.newRect(0, 0, 100, 100)  --add acolor fill to show the selected item

-- selected:setFillColor(90, 90, 90)  --set the color fill to light blue
-- selected.isVisible = false  --hide color fill until needed

--setup functions to execute on touch of the list view items
function listButtonRelease( event )
	self = event.target -- the target is the row 
	local id = self.id  -- this is the row id in the table

	print(self.data.title) -- the rows data.title
    print(self.data.subtitle) -- the rows data.subtitle
    print(self.data.image) -- the rows data.image
    print(self.data.category)
		
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
data[1].title = "Bouvardia"
data[1].subtitle = "The genus is named in honor of Charles Bouvard (1572–1658), physician to Louis XIII."
data[1].image = "./images/flowers/flowersListBouvardia.jpg"
data[1].category = "scenes.sceneFlowers"

data[2] = {}
data[2].title = "Carnation"
data[2].subtitle = "Carnations require well-drained, neutral to slightly alkaline soil, and full sun."
data[2].image = "./images/flowers/flowersListCarnation.jpg"
data[2].category = "scenes.sceneFlowers"

data[3] = {}
data[3].title = "Orchid"
data[3].subtitle = "The name in Ancient Greek literally means 'testicle', because of the shape of the root."
data[3].image = "./images/flowers/flowersListOrchid.jpg"
data[3].category = "scenes.sceneFlowers"

data[4] = {}
data[4].title = "Sunflower"
data[4].subtitle = "The flower of a sunflower is actually several flowers, which is why it is considered an inflorescence."
data[4].image = "./images/flowers/flowersListSunflower.jpg"
data[4].category = "scenes.sceneFlowers"

data[5] = {}
data[5].title = "Chrysanthemum"
data[5].subtitle = "The flower's yellow or white chrysanthemum petals are boiled to make a sweet drink in some parts of Asia."
data[5].image = "./images/flowers/flowersListChrysanthemum.jpg"
data[5].category = "scenes.sceneFlowers"

data[6] = {}
data[6].title = "Daffodil"
data[6].subtitle = "Daffodil or 'Narcissus' seeds are black, round and swollen with a hard coat."
data[6].image = "./images/flowers/flowersListDaffodil.jpg"
data[6].category = "scenes.sceneFlowers"

data[7] = {}
data[7].title = "Rose"
data[7].subtitle = "The majority of ornamental roses are hybrids that were bred for their flowers."
data[7].image = "./images/flowers/flowersListRose.jpg"
data[7].category = "scenes.sceneFlowers"

data[8] = {}
data[8].title = "Sweet Pea"
data[8].subtitle = "The sweet pea plant does suffer from some pests, the most common being aphids."
data[8].image = "./images/flowers/flowersListSweetPea.jpg"
data[8].category = "scenes.sceneFlowers"

data[9] = {}
data[9].title = "Pansy"
data[9].subtitle = "Plants grow well in sunny or partially sunny positions in well-draining soils."
data[9].image = "./images/flowers/flowersListPansy.jpg"
data[9].category = "scenes.sceneFlowers"

data[10] = {}
data[10].title = "Iris"
data[10].subtitle = "Irises are extensively grown as ornamental plants in home and botanical gardens."
data[10].image = "./images/flowers/flowersListIris.jpg"
data[10].category = "scenes.sceneFlowers"



local topBoundary = display.screenOriginY + 140
local bottomBoundary = display.screenOriginY + 0

-- create the list of items

	myList = tableView.newList{
	data=data, --A table containing elements that the list can iterate through to display in each row.
	default="images/defaultListBar.png", --An image for the row background. Defines the hit area for the touch.
	over="defaultListBar.png", --An image that will show on touch.
	onRelease=listButtonRelease, --A function name that defines the action to take after a row is tapped.
	top=topBoundary, --The upper boundary of the list. The list will start and snap back to this position.
	bottom=bottomBoundary, --The bottom boundary of the list. The list will snap back to this position when scrolled upward.
	
	-- callback = A function that defines how to display the data in each row. Each element in the data table will be used in place of the 
    -- argument ("item")  assigned to the callback function. 
    callback = function( row ) 
                         local g = display.newGroup()

                         local img = display.newImage(row.image)
                         g:insert(img)
                         img.x = math.floor(img.width*0.5 + 6)
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

-- local function scrollToTop()
-- 	myList:scrollTo(topBoundary)
-- end

-- myList:addOnTop(flowersSectionText, 100, 0)



--Add a white background to the list.  

local listBackground = display.newRect( 0, 0, myList.width, myList.height )
listBackground:setFillColor(255,255,255)
myList:insert(1,listBackground)


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