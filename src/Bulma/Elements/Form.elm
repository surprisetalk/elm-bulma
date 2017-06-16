
module Bulma.Elements.Form exposing ( Field
                                    , field
                                    , horizontalField
                                    , Label
                                    , label
                                    , easyLabel
                                    , glued
                                    , gluedLeft
                                    , gluedCenter
                                    , gluedRight
                                    , grouped
                                    , groupedLeft
                                    , groupedCenter
                                    , groupedRight
                                    , separate
                                    , toHtml
                                    , addClass
                                    , setHelpers
                                    )

-- DOCS ------------------------------------------------------------------------


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Form.Control exposing ( Control )

import Html exposing ( Html, Attribute, text )


-- FIELD -------------------------------------------------------------------------

-- TODO: is-narrow!

type FieldBody msg = Vertical (List (Control msg))
                   | Horizontal (List (Field msg))

type alias Field msg = Entity Grouping (Maybe (Label msg), FieldBody msg) msg

field : List (Attribute msg) -> List (Control msg) -> Field msg
field attrs = entity "div" [ "field" ] Separate attrs << (,) Nothing << Vertical

horizontalField : List (Attribute msg) -> List (Field msg) -> Field msg
horizontalField attrs = entity "div" [ "field", "is-horizontal" ] Separate attrs << (,) Nothing << Horizontal
-- TODO: make sure to set the label size equal to the field size when horizontal

setLabel : Label msg -> Field msg -> Field msg
setLabel = mapBody << setFirst << Just


-- LABEL -------------------------------------------------------------------------

{-| TODO
-}
type alias Label msg = Entity () (Htmls msg) msg

{-| TODO
-}
label : Attrs msg -> Htmls msg -> Label msg
label = entity "label" [] ()

{-| TODO
-}
easyLabel : String -> Label msg
easyLabel = label [] << ls << text



-- MODIFIERS -------------------------------------------------------------------

type Alignment = Default
               | Left
               | Center
               | Right

type Grouping = Glued    Alignment
              | Grouped  Alignment
              | Separate

setGrouping : Grouping -> Field msg -> Field msg
setGrouping = mapMods

separate : Field msg -> Field msg
separate = setGrouping Separate

glued : Field msg -> Field msg
glued = setGrouping <| Glued Default

gluedLeft : Field msg -> Field msg
gluedLeft = setGrouping <| Glued Left

gluedCenter : Field msg -> Field msg
gluedCenter = setGrouping <| Glued Center

gluedRight : Field msg -> Field msg
gluedRight = setGrouping <| Glued Right

grouped : Field msg -> Field msg
grouped = setGrouping <| Grouped Default

groupedLeft : Field msg -> Field msg
groupedLeft = setGrouping <| Grouped Left

groupedCenter : Field msg -> Field msg
groupedCenter = setGrouping <| Grouped Center

groupedRight : Field msg -> Field msg
groupedRight = setGrouping <| Grouped Right

groupingClass : Grouping -> String
groupingClass group
  = case group of
      Glued   Default -> "has-addons"
      Glued   Left    -> "has-addons"
      Glued   Center  -> "has-addons-centered"
      Glued   Right   -> "has-addons-right"
      Grouped Default -> "is-grouped"
      Grouped Left    -> "is-grouped"
      Grouped Center  -> "is-grouped-centered"
      Grouped Right   -> "is-grouped-right"
      Separate        -> ""
                

-- TRANSFORMS --------------------------------------------------------------------

{-| TODO
-}
toHtml : Field msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) identity

{-| TODO
-}
addClass : String -> Field msg -> Field msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Field msg -> Field msg
setHelpers helps = Entity.setHelpers helps
