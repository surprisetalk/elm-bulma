
module Bulma.Grid.Tiles exposing ( Width
                                 , size
                                 )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Devices )

import Html exposing ( Html, Attribute )
import Html.Attributes exposing ( classList )


-- HELPERS ---------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)


-- TILE ------------------------------------------------------------------------

type Tile msg = Tile { helps : Helpers
                     , attrs : List (Attribute msg)
                     , htmls : List (Html msg)
                     }

tile : List (Attribute msg) -> List (Html msg) -> Tile msg

-- tileWithHelpers : Helpers -> List (Attribute msg) -> List (Html msg) -> Tile msg

toTile : Box msg -> Tile msg
-- TODO: move to box?

toTile : Notification msg -> Tile msg
-- TODO: move to notification?

toTile : Card msg -> Tile msg
-- TODO: move to card?

-- TODO: more tile types


-- TILES -----------------------------------------------------------------------

type Content msg = Ancestor                 (List (Tiles msg))
                 | Parent Width Orientation (List (Tile  msg))

type Tiles msg = Tiles { helps   : Helpers
                       , attrs   : List (Attribute msg)
                       , content : Content
                       }
  
easyTiles : List (Maybe (List (Maybe (Tile msg)))) -> Tiles msg

-- easyTiles : List (Bool, Maybe Int, List (Tile msg)) -> Tiles msg
            
tiles   : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles1  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles2  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles3  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles4  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles5  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles6  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles7  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles8  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles9  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles10 : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles11 : List (Attribute msg) -> List (Tile msg) -> Tiles msg

tiles12 : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles   : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles1  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles2  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles3  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles4  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles5  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles6  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles7  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles8  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles9  : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles10 : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles11 : List (Attribute msg) -> List (Tile msg) -> Tiles msg

verticalTiles12 : List (Attribute msg) -> List (Tile msg) -> Tiles msg

nestTiles : List (Tiles msg) -> Tiles msg


-- -- ORIENTATION --

-- horizontal : Tiles msg -> Tiles msg
-- horizontal (Tiles tiles)
--   = { tiles | vertical = True }

-- vertical : Tiles msg -> Tiles msg
-- vertical (Tiles tiles)
--   = { tiles | vertical = False }


-- -- WIDTH --

-- type Width = Auto
--            | Width01
--            | Width02
--            | Width03
--            | Width04
--            | Width05
--            | Width06
--            | Width07
--            | Width08
--            | Width09
--            | Width10
--            | Width11
--            | Width12

-- setWidth : Int -> Tiles msg -> Tiles msg
-- setWidth n (Tiles tiles)
--   = let width_ : Width
--         width_ = case clamp 0 12 n of
--                    00 -> Auto
--                    01 -> Width01
--                    02 -> Width02
--                    03 -> Width03
--                    04 -> Width04
--                    05 -> Width05
--                    06 -> Width06
--                    07 -> Width07
--                    08 -> Width08
--                    09 -> Width09
--                    10 -> Width10
--                    11 -> Width11
--                    12 -> Width12

--     in Tiles { tiles | width = width_ }

-- widthAuto : Tiles msg -> Tiles msg
-- widthAuto = setWidth 0

-- width1  : Tiles msg -> Tiles msg
-- width1  = setWidth 1

-- width2  : Tiles msg -> Tiles msg
-- width2  = setWidth 2

-- width3  : Tiles msg -> Tiles msg
-- width3  = setWidth 3

-- width4  : Tiles msg -> Tiles msg
-- width4  = setWidth 4

-- width5  : Tiles msg -> Tiles msg
-- width5  = setWidth 5

-- width6  : Tiles msg -> Tiles msg
-- width6  = setWidth 6

-- width7  : Tiles msg -> Tiles msg
-- width7  = setWidth 7

-- width8  : Tiles msg -> Tiles msg
-- width8  = setWidth 8

-- width9  : Tiles msg -> Tiles msg
-- width9  = setWidth 9

-- width10 : Tiles msg -> Tiles msg
-- width10 = setWidth 10

-- width11 : Tiles msg -> Tiles msg
-- width11 = setWidth 11

-- width12 : Tiles msg -> Tiles msg
-- width12 = setWidth 12



-- TRANSFORMS ------------------------------------------------------------------

toHtml : Tiles msg -> Html msg
toHtml (Tiles {helps,attrs,content})
  = let parents : List (Html msg)
        parents = 

    in node helps "div" [ "tile is-ancestor" ] attrs parents

-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Tiles msg -> Tiles msg
setHelpers helps_ (Tiles tiles) = { tiles | helps = helps_ }
