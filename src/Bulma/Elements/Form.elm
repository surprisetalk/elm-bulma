
module Bulma.Elements.Form exposing ( Field
                                    , field
                                    , horizontalField
                                    , toHtml
                                    , setGlued
                                    , setGluedLeft
                                    , setGluedCenter
                                    , setGluedRight
                                    , setGrouped
                                    , setGroupedLeft
                                    , setGroupedCenter
                                    , setGroupedRight
                                    , setSeparate
                                    , setHelpers
                                    )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Bulma.Elements.Form.Control exposing ( Control )

import Html exposing ( Html, Attribute )


-- FIELDS ------------------------------------------------------------------------

type Field msg = Field Helpers Grouping (List (Attribute msg)) (List (Html msg))

field : List (Attribute msg) -> List (Control msg) -> Field msg
field = Field defaultHelpers Separate

horizontalField : List (Attribute msg) -> Label msg -> Field msg -> Field msg
-- TODO: make sure to set the label size equal to the field size


-- TRANSFORMS --------------------------------------------------------------------

toHtml : Field msg -> Html msg
toHtml (Field helps group attrs htmls)
  = let classes : List String
        classes = (::) "field"
                <| Maybe_.unwrap [] singleton
                <| groupingClass
                <| group

    in node helps "div" classes attrs htmls


-- GROUPING --------------------------------------------------------------------

type Alignment = Default
               | Left
               | Center
               | Right

type Grouping = Glued    Alignment
              | Grouped  Alignment
              | Separate

setGlued : Field msg -> Field msg
setGlued (Field helps _ attrs htmls)
  = Field helps (Glued Default) attrs htmls

setGluedLeft : Field msg -> Field msg
setGluedLeft (Field helps _ attrs htmls)
  = Field helps (Glued Left) attrs htmls

setGluedCenter : Field msg -> Field msg
setGluedCenter (Field helps _ attrs htmls)
  = Field helps (Glued Center) attrs htmls

setGluedRight : Field msg -> Field msg
setGluedRight (Field helps _ attrs htmls)
  = Field helps (Glued Right) attrs htmls

setGrouped : Field msg -> Field msg
setGrouped (Field helps _ attrs htmls)
  = Field helps (Grouped Default) attrs htmls

setGroupedLeft : Field msg -> Field msg
setGroupedLeft (Field helps _ attrs htmls)
  = Field helps (Grouped Left) attrs htmls

setGroupedCenter : Field msg -> Field msg
setGroupedCenter (Field helps _ attrs htmls)
  = Field helps (Grouped Center) attrs htmls

setGroupedRight : Field msg -> Field msg
setGroupedRight (Field helps _ attrs htmls)
  = Field helps (Grouped Right) attrs htmls

setSeparate : Field msg -> Field msg
setSeparate (Field helps _ attrs htmls)
  = Field helps Separate attrs htmls

groupingClass : Grouping -> Maybe String
groupingClass group
  = case group of
      Glued   Default -> Just "has-addons"
      Glued   Left    -> Just "has-addons"
      Glued   Center  -> Just "has-addons-centered"
      Glued   Right   -> Just "has-addons-right"
      Grouped Default -> Just "is-grouped"
      Grouped Left    -> Just "is-grouped"
      Grouped Center  -> Just "is-grouped-centered"
      Grouped Right   -> Just "is-grouped-right"
      Separate        -> Nothing
                

-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Field msg -> Field msg
setHelpers helps_ (Field _ group attrs htmls)
  = Field helps_ group attrs htmls
