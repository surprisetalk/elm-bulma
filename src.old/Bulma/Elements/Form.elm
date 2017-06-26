
module Bulma.Elements.Form exposing ( Field
                                    , field
                                    , horizontalField
                                    , setLabel
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

{-| TODO 

@docs Field, field, horizontalField, setLabel

@docs Label, label, easyLabel

@docs glued, gluedLeft, gluedCenter, gluedRight, grouped, groupedLeft, groupedCenter, groupedRight, separate

@docs toHtml, addClass, setHelpers

-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Form.Control as Control exposing ( Control )

import Html exposing ( Html, Attribute, text, div )
import Html.Attributes as Attr exposing ( class )

import List exposing ( map )


-- FIELD -------------------------------------------------------------------------

-- TODO: is-narrow!

{-| TODO
-}
type alias FieldBody msg = { label      : Maybe (Label msg)
                           , controls   : List (Control msg)
                           , horizontal : Bool
                           }

{-| TODO
-}
type alias Field msg = Entity Grouping (FieldBody msg) msg

{-| TODO
-}
field : List (Attribute msg) -> List (Control msg) -> Field msg
field attrs controls
  = entity "div" [ "field" ] Separate attrs
    { label      = Nothing
    , controls   = controls
    , horizontal = False
    }

{-| TODO
-}
horizontalField : List (Attribute msg) -> List (Control msg) -> Field msg
horizontalField attrs controls
-- TODO: make sure to set the label size equal to the field size when horizontal
  = entity "div" [ "field", "is-horizontal" ] Separate attrs
    { label      = Nothing
    , controls   = controls
    , horizontal = True
    }

{-| TODO
-}
setLabel : Label msg -> Field msg -> Field msg
setLabel label_ = mapBody <| \body -> { body | label = Just label_ }


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

{-| TODO
-}
print : Label msg -> Html msg
print = Entity.toHtml (y []) (y []) identity



-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type Alignment = Default
               | Left
               | Center
               | Right

{-| TODO
-}
type Grouping = Glued    Alignment
              | Grouped  Alignment
              | Separate

{-| TODO
-}
setGrouping : Grouping -> Field msg -> Field msg
setGrouping = mapMods << y

{-| TODO
-}
separate : Field msg -> Field msg
separate = setGrouping Separate

{-| TODO
-}
glued : Field msg -> Field msg
glued = setGrouping <| Glued Default

{-| TODO
-}
gluedLeft : Field msg -> Field msg
gluedLeft = setGrouping <| Glued Left

{-| TODO
-}
gluedCenter : Field msg -> Field msg
gluedCenter = setGrouping <| Glued Center

{-| TODO
-}
gluedRight : Field msg -> Field msg
gluedRight = setGrouping <| Glued Right

{-| TODO
-}
grouped : Field msg -> Field msg
grouped = setGrouping <| Grouped Default

{-| TODO
-}
groupedLeft : Field msg -> Field msg
groupedLeft = setGrouping <| Grouped Left

{-| TODO
-}
groupedCenter : Field msg -> Field msg
groupedCenter = setGrouping <| Grouped Center

{-| TODO
-}
groupedRight : Field msg -> Field msg
groupedRight = setGrouping <| Grouped Right

{-| TODO
-}
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
toHtml = Entity.toHtml (groupingClass >> ls) (y [])
       <| \{label,controls,horizontal} -> 
         case (label,horizontal) of

           (Nothing, False) ->

             map Control.toHtml controls

           (Nothing, True) ->

             [ div [ class "field-label" ] []
             , div [ class "field-body"  ] <| map Control.toHtml controls
             ]
             
           (Just label, False) ->

             print label :: map Control.toHtml controls

           (Just label, True) ->

             [ div [ class "field-label" ] [ print label ]
             , div [ class "field-body"  ] <| map Control.toHtml controls
             ]
             

{-| TODO
-}
addClass : String -> Field msg -> Field msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Field msg -> Field msg
setHelpers helps = Entity.setHelpers helps
