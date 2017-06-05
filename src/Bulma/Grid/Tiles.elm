
module Bulma.Grid.Tiles exposing ( Size
                                 , size
                                 )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Devices )

import Html exposing ( Html, Attribute )
import Html.Attributes exposing ( classList )


-- HELPERS ---------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)


-- MODIFIERS -------------------------------------------------------------------

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

auto : Size
auto = Auto

size : Int -> Size
size n = case clamp 1 12 n of
           01 -> Size01
           02 -> Size02
           03 -> Size03
           04 -> Size04
           05 -> Size05
           06 -> Size06
           07 -> Size07
           08 -> Size08
           09 -> Size09
           10 -> Size10
           11 -> Size11
           12 -> Size12
           _  -> Auto


-- TILES -----------------------------------------------------------------------

-- TODO: we need two layers
-- TODO:   or we can do some fancy trickery that automagically wraps...

type Tile msg = Tile (Html msg)
  
tiles : Orientation -> List (Tile msg) -> Tile msg

tile : Orientation -> Size -> List (Attribute msg) -> List (Html msg) -> Tile msg
tile ori size attrs htmls

-- TODO: we need something like Tile.fromElement, Tile.fromComponent etc.
-- TODO:   we could do tileBox, tileContent, etc.


-- TRANSFORMS ------------------------------------------------------------------

toHtml -> Orientation -> List (Tile msg) -> Html msg

