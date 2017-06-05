
module Bulma.Components.Menu exposing ( Menu
                                      , menu
                                      , toHtml
                                      , setHelpers
                                      )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- MENU -----------------------------------------------------------------------

type Menu msg = Menu Helpers (List (Attribute msg)) (Maybe (Label msg)) (List (Item msg))

-- TODO: easyMenu

menu : List (Attribute msg) -> List (Item msg) -> Menu msg

labeledMenu : List (Attribute msg) -> Label msg -> List (Item msg) -> Menu msg


-- MENU ITEM ------------------------------------------------------------------

type Item msg = Item Helpers (List (Attribute msg)) (List (Html msg))

easyItem : msg -> Icon -> String -> Bool -> Item msg

easierItem : msg -> String -> Bool -> Item msg

easiestItem : msg -> String -> Item msg

item : List (Attribute msg) -> (List (Html msg)) -> Item msg

fromMenu : Menu msg -> Item msg

setInactive : Menu msg -> Menu msg

setActive : Menu msg -> Menu msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Menu msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Menu msg -> Menu msg
