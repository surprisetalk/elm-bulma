
module Bulma.Grid.Tiles exposing ( Tile
                                 , boxTile, cardTile, notificationTile
                                 , Tiles
                                 , tiles 
                                 , verticalTiles
                                 , nestTiles
                                 , tiles1, tiles2, tiles3, tiles4, tiles5, tiles6, tiles7, tiles8, tiles9, tiles10, tiles11, tiles12
                                 , verticalTiles1, verticalTiles2, verticalTiles3, verticalTiles4, verticalTiles5, verticalTiles6, verticalTiles7, verticalTiles8, verticalTiles9, verticalTiles10, verticalTiles11, verticalTiles12
                                 , toHtml, addClass, setHelpers
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

{-| TODO
-}
type Tile msg = TileBox   (Box          msg)
              | TileNotif (Notification msg)
              | TileCard  (Card         msg)

{-| TODO
-}
boxTile : Box msg -> Tile msg
boxTile = Box.addClass "tile" >> TileBox

{-| TODO
-}
notificationTile : Notification msg -> Tile msg
notificationTile = Notification.addClass "tile" >> TileNotif

{-| TODO
-}
cardTile : Card msg -> Tile msg
cardTile = Card.addClass "tile" >> TileCard

-- TODO: more tile types


-- TILES -----------------------------------------------------------------------

{-| TODO
-}
type Tiles msg = Ancestor (Entity (       ) (List (Tiles msg)) msg)
               | Parent   (Entity Modifiers (List (Tile  msg)) msg)

{-| TODO
-}
parent_ : Width -> Orientation -> Attrs msg -> List (Tile msg) -> Tiles msg
parent_ width orientation attrs
  = Parent << entity "div" [ "tile", "is-parent" ] { width = width, orientation = orientation } attrs

{-| TODO
-}
tiles : Attrs msg -> List (Tile msg) -> Tiles msg
tiles = parent_ Auto Horizontal

-- easyTiles : List (Maybe (List (Maybe (Tile msg)))) -> Tiles msg

{-| TODO
-}
nestTiles : Attrs msg -> List (Tiles msg) -> Tiles msg
nestTiles attrs = Ancestor << entity "div" [ "tile" ] () attrs


{-| TODO
-}
tiles1  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles1  = parent_ Size01 Horizontal

{-| TODO
-}
tiles2  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles2  = parent_ Size02 Horizontal

{-| TODO
-}
tiles3  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles3  = parent_ Size03 Horizontal

{-| TODO
-}
tiles4  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles4  = parent_ Size04 Horizontal

{-| TODO
-}
tiles5  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles5  = parent_ Size05 Horizontal

{-| TODO
-}
tiles6  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles6  = parent_ Size06 Horizontal

{-| TODO
-}
tiles7  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles7  = parent_ Size07 Horizontal

{-| TODO
-}
tiles8  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles8  = parent_ Size08 Horizontal

{-| TODO
-}
tiles9  : Attrs msg -> List (Tile msg) -> Tiles msg
tiles9  = parent_ Size09 Horizontal

{-| TODO
-}
tiles10 : Attrs msg -> List (Tile msg) -> Tiles msg
tiles10  = parent_ Size10 Horizontal
{-| TODO
-}

tiles11 : Attrs msg -> List (Tile msg) -> Tiles msg
tiles11  = parent_ Size11 Horizontal

{-| TODO
-}
tiles12 : Attrs msg -> List (Tile msg) -> Tiles msg
tiles12  = parent_ Size12 Horizontal


{-| TODO
-}
verticalTiles   : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles   = parent_ Auto Vertical

{-| TODO
-}
verticalTiles1  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles1  = parent_ Size01 Vertical

{-| TODO
-}
verticalTiles2  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles2  = parent_ Size02 Vertical

{-| TODO
-}
verticalTiles3  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles3  = parent_ Size03 Vertical

{-| TODO
-}
verticalTiles4  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles4  = parent_ Size04 Vertical

{-| TODO
-}
verticalTiles5  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles5  = parent_ Size05 Vertical

{-| TODO
-}
verticalTiles6  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles6  = parent_ Size06 Vertical

{-| TODO
-}
verticalTiles7  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles7  = parent_ Size07 Vertical

{-| TODO
-}
verticalTiles8  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles8  = parent_ Size08 Vertical

{-| TODO
-}
verticalTiles9  : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles9  = parent_ Size09 Vertical

{-| TODO
-}
verticalTiles10 : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles10 = parent_ Size10 Vertical

{-| TODO
-}
verticalTiles11 : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles11 = parent_ Size11 Vertical

{-| TODO
-}
verticalTiles12 : Attrs msg -> List (Tile msg) -> Tiles msg
verticalTiles12 = parent_ Size12 Vertical


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { orientation : Orientation
                       , width       : Width
                       }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {orientation,width}
  = [ case orientation of
        Horizontal -> ""
        Vertical   -> "is-vertical"
    , case width of
        Auto   -> ""
        Size01 -> "is-1"
        Size02 -> "is-2"
        Size03 -> "is-3"
        Size04 -> "is-4"
        Size05 -> "is-5"
        Size06 -> "is-6"
        Size07 -> "is-7"
        Size08 -> "is-8"
        Size09 -> "is-9"
        Size10 -> "is-10"
        Size11 -> "is-11"
        Size12 -> "is-12"
    ]


-- ORIENTATION --

{-| TODO
-}
type Orientation = Horizontal
                 | Vertical


-- SIZE --

{-| TODO
-}
type Width = Auto
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
toHtml = addClass "is-ancestor" >> toHtml_

{-| TODO
-}
toHtml_ : Tiles msg -> Html msg
toHtml_ tiles
  = case tiles of
      Ancestor ancestor -> ancestor |> Entity.toHtml (y [])      (y []) (map toHtml_ )
      Parent   parent   -> parent   |> Entity.toHtml modsClasses (y []) (map toHtml__)

{-| TODO
-}
toHtml__ : Tile msg -> Html msg
toHtml__ tile
  = case tile of
      TileBox   c -> c |>          Box.toHtml
      TileCard  c -> c |>         Card.toHtml
      TileNotif c -> c |> Notification.toHtml

{-| TODO
-}
addClass : String -> Tiles msg -> Tiles msg
addClass c tiles
  = case tiles of
      Ancestor ancestor -> ancestor |> Entity.addClass c |> Ancestor
      Parent   parent   -> parent   |> Entity.addClass c |> Parent


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tiles msg -> Tiles msg
setHelpers helpers tiles
  = case tiles of
      Ancestor ancestor -> ancestor |> Entity.setHelpers helpers |> Ancestor
      Parent   parent   -> parent   |> Entity.setHelpers helpers |> Parent
