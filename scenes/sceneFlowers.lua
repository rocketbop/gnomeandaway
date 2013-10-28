----------------------------------------------------------------------------------
--
-- sceneFlowers.lua
--
-- Iconography courtesy of http://www.jigsoaricons.com, Creative Commons
-- Text alignment tips from: http://docs.coronalabs.com/api/library/display/newText.html
-- ... and ... http://docs.coronalabs.com/api/type/TextField/align.html
--
-- Tableview help from http://masteringcoronasdk.com
-- ... and http://www.youtube.com/watch?v=ZMh1VNbZ7z8
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

-- Tableview functions

	-- -- render the rows
	-- local function renderRow ( event )
	-- end

	-- -- touch handler
	-- local function rowTouched( event )
	-- end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view


	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
		

--import the table view library
local tableView = require("tableView")

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
	flowersSectionText:setTextColor(68, 68, 68)
	flowersSectionText.align = "center"
	flowersSectionText.x = 160
	flowersSectionText.y = 80
	group:insert(flowersSectionText)

	-- Navigation event listeners
	navBarHome:addEventListener ("touch", goHome)
	navBarBrowseProducts:addEventListener ("touch", goBrowse)
	navBarInfo:addEventListener ("touch", goInfo)
	navBarContact:addEventListener ("touch", goContact)

	--import the widget library
	-- local widget = require("widget")

	-- create a tableView object
	-- tableView = widget.newTableView
	-- {
	-- 	left = 0,
	-- 	top = 100,
	-- 	width = 320,
	-- 	height = 380,
	-- 	onRowRender = renderRow,
	-- 	onRowtouch = rowTouched

	-- }

	-- for i = 1, 10 do
	-- 	tableView: insertRow
	-- 	{
	-- 		isCategory = false,
	-- 		rowHeight = 100,
	-- 		rowColor = { default = { 255, 255, 255}, },
	-- 		lineColor = { 100, 220, 200}
	-- 	}
	-- end




local myList
local data = {}  




--setup each row as a new table, then add title, subtitle, and image
data[1] = {}
data[1].title = "Bouvardia"
data[1].subtitle = "The genus is named in honor of Charles Bouvard (1572–1658), physician to Louis XIII."
data[1].image = "./images/flowers/flowersListBouvardia.jpg"

data[2] = {}
data[2].title = "Carnation"
data[2].subtitle = "Carnations require well-drained, neutral to slightly alkaline soil, and full sun."
data[2].image = "./images/flowers/flowersListCarnation.jpg"

data[3] = {}
data[3].title = "Orchid"
data[3].subtitle = "The name in Ancient Greek literally means 'testicle', because of the shape of the root."
data[3].image = "./images/flowers/flowersListOrchid.jpg"

data[4] = {}
data[4].title = "Sunflower"
data[4].subtitle = "The flower of a sunflower is actually several flowers, which is why it is considered an inflorescence."
data[4].image = "./images/flowers/flowersListSunflower.jpg"

data[5] = {}
data[5].title = "Chrysanthemum"
data[5].subtitle = "Yellow or white chrysanthemum flowers of the species C. morifolium are boiled to make a sweet drink in some parts of Asia."
data[5].image = "./images/flowers/flowersListChrysanthemum.jpg"

data[6] = {}
data[6].title = "Daffodil"
data[6].subtitle = "Daffodil or 'Narcissus' seeds are black, round and swollen with a hard coat."
data[6].image = "./images/flowers/flowersListDaffodil.jpg"

data[7] = {}
data[7].title = "Rose"
data[7].subtitle = "The majority of ornamental roses are hybrids that were bred for their flowers."
data[7].image = "./images/flowers/flowersListRose.jpg"

data[8] = {}
data[8].title = "Sweet Pea"
data[8].subtitle = "The sweet pea plant does suffer from some pests, the most common being aphids."
data[8].image = "./images/flowers/flowersListSweetPea.jpg"

data[9] = {}
data[9].title = "Pansy"
data[9].subtitle = "Plants grow well in sunny or partially sunny positions in well-draining soils."
data[9].image = "./images/flowers/flowersListPansy.jpg"

data[10] = {}
data[10].title = "Iris"
data[10].subtitle = "Irises are extensively grown as ornamental plants in home and botanical gardens."
data[10].image = "./images/flowers/flowersListIris.jpg"



local topBoundary = display.screenOriginY + 100
local bottomBoundary = display.screenOriginY + 0

	myList = tableView.newList{
	data=data, --A table containing elements that the list can iterate through to display in each row.
	default="defaultListBar.png", --An image for the row background. Defines the hit area for the touch.
	over="defaultListBarTouch.png", --An image that will show on touch.
	
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

                         local title =  display.newText( row.title, 0, 0, native.systemFontBold, 14 )
                         title:setTextColor(0, 0, 0)
                         g:insert(title)
                         title.x = title.width*0.5 + img.width + 6
                         title.y = 30

                         local subtitle =  display.newText( row.subtitle, 0, 0, native.systemFont, 12 )
                         subtitle:setTextColor(80,80,80)
                         g:insert(subtitle)
                         subtitle.x = subtitle.width*0.5 + img.width + 6
                         subtitle.y = title.y + title.height + 6

                         return g  


                  end 
}
group:insert(myList)

	
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