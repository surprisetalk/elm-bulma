
module Bulma.Components.Tabs exposing ( Tabs
                                      , tabs
                                      , toHtml
                                      , setHelpers
                                      )
                                      
-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- TABS -----------------------------------------------------------------------

type Tabs msg = Tabs Helpers (List (Attribute msg)) (List (Tab msg))

easyTabs : List (msg, String, Bool) -> Tabs msg

easyIconTabs : List (msg, Icon, String, Bool) -> Tabs msg

tabs : List (Attribute msg) -> List (Tab msg) -> Tabs msg


-- ALIGNMENT --

unsetAlignment : Tabs msg -> Tabs msg

setCentered : Tabs msg -> Tabs msg

setRight : Tabs msg -> Tabs msg


-- SIZE --

unsetSize : Tabs msg -> Tabs msg

setSmall : Tabs msg -> Tabs msg

setMedium : Tabs msg -> Tabs msg

setLarge : Tabs msg -> Tabs msg


-- STYLE --

unsetStyle : Tabs msg -> Tabs msg

setBoxed : Tabs msg -> Tabs msg

setToggle : Tabs msg -> Tabs msg


-- WIDTH --

unsetFullWidth : Tabs msg -> Tabs msg

setFullWidth : Tabs msg -> Tabs msg


-- TAB -------------------------------------------------------------------------

easyTab : msg -> String -> Bool -> Tab msg

tab : List (Attribute msg) -> List (Html msg) -> Tab msg

easyIconTab : msg -> Icon msg -> String -> Bool -> Tab msg

iconTab : List (Attribute msg) -> Icon msg -> List (Html msg) -> Tab msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Tabs msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Tabs msg -> Tabs msg
