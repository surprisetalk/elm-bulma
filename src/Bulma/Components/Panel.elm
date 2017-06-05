
module Bulma.Components.Panel exposing ( Panel
                                            , panel
                                            , toHtml
                                            , setHelpers
                                            )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- PANEL -----------------------------------------------------------------------

type Panel msg = Panel Helpers (List (Attribute msg)) (Maybe (List (Attribute msg), List (Html msg))) (List (Block msg))

-- TODO: easyPanel

panel : List (Attribute msg) -> Panel msg

setHeading : List (Attribute msg) -> List (Html msg) -> Panel msg -> Panel msg

addTabs : Tabs msg -> Panel msg -> Panel msg

addBlock : Block msg -> Panel msg -> Panel msg


-- BLOCK -----------------------------------------------------------------------

easyBlock : msg -> Icon msg -> String -> Bool -> Block msg

fromControl : Control msg -> Block msg

fromButton : Button msg -> Block msg

-- TODO: from... various elements


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Panel msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Panel msg -> Panel msg
