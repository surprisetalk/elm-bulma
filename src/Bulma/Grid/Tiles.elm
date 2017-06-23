
module Bulma.Grid.Tiles exposing ( Width
                                 , size
                                 )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Tile
@docs boxTile, cardTile, notificationTile

@docs Tiles
@docs tiles 
@docs verticalTiles
@docs nestTiles

@docs tiles1, tiles2, tiles3, tiles4, tiles5, tiles6, tiles7, tiles8, tiles9, tiles10, tiles11, tiles12
@docs verticalTiles1, verticalTiles2, verticalTiles3, verticalTiles4, verticalTiles5, verticalTiles6, verticalTiles7, verticalTiles8, verticalTiles9, verticalTiles10, verticalTiles11, verticalTiles12

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers, defaultHelpers )

import Bulma.Elements.Box as Box exposing ( Box )
import Bulma.Components.Card as Card exposing ( Card )
import Bulma.Elements.Notification as Notification exposing ( Notification )

import Html exposing ( Html, Attribute )

import List exposing ( map, singleton )


-- TILE ------------------------------------------------------------------------

type Tile msg = TileBox   (Box          msg)
              | TileNotif (Notification msg)
              | TileCard  (Card         msg)

boxTile : Box msg -> Tile msg
boxTile = Box.addClass "tile" >> TileBox

notificationTile : Notification msg -> Tile msg
notificationTile = Notification.addClass "tile" >> TileNotif

cardTile : Card msg -> Tile msg
cardTile = Card.addClass "tile" >> TileCard

-- TODO: more tile types


-- TILES -----------------------------------------------------------------------

type Body msg = Ancestor                 (List (Tiles msg))
              | Parent Width Orientation (List (Tile  msg))

type Tiles msg = Entity Modifiers (Body msg) msg

tiles_ : Attrs msg -> Body msg -> Tiles msg
tiles_ = entity "div" [ "tile" ] ()
  
parentTiles_ : Width -> Orientation -> Attrs msg -> List (Tile msg) -> Tiles msg
parentTiles_ width orientation attrs
  = Parent width orientation
  >> tiles_ attrs
  >> addClass "is-parent"

tiles : Attrs msg -> List (Tile msg) -> Tiles msg
tiles = parentTiles_ Auto Horizontal

-- easyTiles : List (Maybe (List (Maybe (Tile msg)))) -> Tiles msg

nestTiles : Attrs msg -> List (Tiles msg) -> Tiles msg
nestTiles = tiles_ |-~-> Ancestor


tiles1  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles1  = parentTiles_ Size01 Horizontal

tiles2  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles2  = parentTiles_ Size02 Horizontal

tiles3  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles3  = parentTiles_ Size03 Horizontal

tiles4  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles4  = parentTiles_ Size04 Horizontal

tiles5  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles5  = parentTiles_ Size05 Horizontal

tiles6  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles6  = parentTiles_ Size06 Horizontal

tiles7  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles7  = parentTiles_ Size07 Horizontal

tiles8  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles8  = parentTiles_ Size08 Horizontal

tiles9  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles9  = parentTiles_ Size09 Horizontal

tiles10 : Attrs msg -> List (Tile msg) -> Tiles msg
tiles10  = parentTiles_ Size010 Horizontal

tiles11 : Attrs msg -> List (Tile msg) -> Tiles msg
tiles11  = parentTiles_ Size011 Horizontal

tiles12 : Attrs msg -> List (Tile msg) -> Tiles msg
tiles12  = parentTiles_ Size012 Horizontal


verticalTiles   : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles   = parentTiles_ Auto Vertical

verticalTiles1  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles1  = parentTiles_ Size01 Vertical

verticalTiles2  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles2  = parentTiles_ Size02 Vertical

verticalTiles3  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles3  = parentTiles_ Size03 Vertical

verticalTiles4  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles4  = parentTiles_ Size04 Vertical

verticalTiles5  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles5  = parentTiles_ Size05 Vertical

verticalTiles6  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles6  = parentTiles_ Size06 Vertical

verticalTiles7  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles7  = parentTiles_ Size07 Vertical

verticalTiles8  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles8  = parentTiles_ Size08 Vertical

verticalTiles9  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles9  = parentTiles_ Size09 Vertical

verticalTiles10 : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles10 = parentTiles_ Size10 Vertical

verticalTiles11 : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles11 = parentTiles_ Size11 Vertical

verticalTiles12 : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles12 = parentTiles_ Size12 Vertical


-- MODIFIERS -------------------------------------------------------------------


-- ORIENTATION --

{-| TODO
-}
type Orientation = Horizontal
                 | Vertical


-- SIZE --

{-| TODO
-}
type Size = Auto
          | Size01
          | Size02
          | Size03
          | Size04
          | Size05
          | Size06
          | Size07
          | Size08
          | Size09
          | Size10
          | Size11
          | Size12


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Tiles msg -> Html msg
toHtml = Entity.toHtml modsClasses (y [])
       <| map
       <| toHtml_

{-| TODO
-}
toHtml_ : Tile msg -> Html msg
toHtml_ = Nothing

{-| TODO
-}
addClass : String -> Tiles msg -> Tiles msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tiles msg -> Tiles msg
setHelpers = Entity.setHelpers
