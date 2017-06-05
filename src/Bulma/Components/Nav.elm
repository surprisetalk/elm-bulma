
module Bulma.Components.Nav exposing ( Nav
                                       , nav
                                       , toHtml
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- NAV -----------------------------------------------------------------------

type Nav msg = Nav Helpers (List (Attribute msg)) (List (Item msg)) (List (Item msg)) (List (Item msg))

-- TODO: easyNav

nav : List (Attribute msg) -> List (Item msg) -> List (Item msg) -> List (Item msg) -> Nav msg

fromLevel : Level msg -> Level msg


-- MOBILE MENU --

unsetMobileMenu : Nav msg -> Nav msg

setMobileMenu : List (Item msg) -> Nav msg -> Nav msg


-- SHADOW --

setShadow : Nav msg -> Nav msg

unsetShadow : Nav msg -> Nav msg


-- NAV ITEM ------------------------------------------------------------------

type Item msg = Item Helpers (List (Attribute msg)) (List (Html msg))

item : List (Attribute msg) -> (List (Html msg)) -> Item msg

fromImage : Image msg -> Item msg

fromTitle : Title msg -> Item msg

fromButton : Button msg -> Item msg

fromIcon : Icon msg -> Item msg

fromField : Field msg -> Item msg

addHeading : String -> Item msg -> Item msg


-- ACTIVE --

setActive : Item msg -> Item msg

setInactive : Item msg -> Item msg


-- TABS --

unsetTab : Item msg -> Item msg

setTab : Item msg -> Item msg

unsetTabs : List (Item msg) -> List (Item msg)

setTabs : List (Item msg) -> List (Item msg)


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Nav msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Nav msg -> Nav msg
