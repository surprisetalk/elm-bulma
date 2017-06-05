
module Bulma.Components.Level exposing ( Level
                                       , level
                                       , toHtml
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- LEVEL -----------------------------------------------------------------------

type Level msg = Level Helpers (List (Attribute msg)) (List (Item msg)) (List (Item msg))

-- TODO: easyLevel

level : List (Attribute msg) -> List (Item msg) -> List (Item msg) -> Level msg

setMobileVertical : Level msg -> Level msg

setMobileHorizontal : Level msg -> Level msg


-- LEVEL ITEM ------------------------------------------------------------------

type Item msg = Item Helpers (List (Attribute msg)) (List (Html msg))

item : List (Attribute msg) -> (List (Html msg)) -> Item msg

fromImage : Image msg -> Item msg

fromTitle : Title msg -> Item msg

fromButton : Button msg -> Item msg

fromIcon : Icon msg -> Item msg

fromField : Field msg -> Item msg

addHeading : String -> Item msg -> Item msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Level msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Level msg -> Level msg
