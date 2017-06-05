
module Bulma.Layout.Hero exposing ( Hero
                                  , hero
                                  , toHtml
                                  , setHelpers
                                  )
                                  
-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- HERO -----------------------------------------------------------------------

type Hero msg = Hero Helpers (List (Attribute msg))

-- TODO: easyHero

easyHero : Title msg -> Title msg -> Hero msg

hero : List (Attribute msg) -> List (Html msg) -> Hero msg

fromContainer : List (Attribute msg) -> Container msg -> Hero msg


-- HEAD --

unsetHead : Hero msg -> Hero msg

setHeadFromNav : List (Attribute msg) -> Nav msg -> Hero msg -> Hero msg

setHeadFromTabs : List (Attribute msg) -> Tabs msg -> Hero msg -> Hero msg

setHead : List (Attribute msg) -> List (Html msg) Hero msg -> Hero msg


-- FOOT --

unsetFoot : Hero msg -> Hero msg

setFootFromNav : List (Attribute msg) -> Nav msg -> Hero msg -> Hero msg

setFootFromTabs : List (Attribute msg) -> Tabs msg -> Hero msg -> Hero msg

setFoot : List (Attribute msg) -> List (Html msg) Hero msg -> Hero msg



-- COLOR --

unsetColor : Hero msg -> Hero msg

type Color = Primary
           | Info
           | Success
           | Warning
           | Danger
           | Dark
           | Light

unsetColor : Hero msg -> Hero msg

setPrimary : Hero msg -> Hero msg

setInfo : Hero msg -> Hero msg

setSuccess : Hero msg -> Hero msg

setWarning : Hero msg -> Hero msg

setDanger : Hero msg -> Hero msg

setDark : Hero msg -> Hero msg

setLight : Hero msg -> Hero msg


-- BOLD --

unsetBold : Hero msg -> Hero msg

setBold : Hero msg -> Hero msg


-- SIZE --

type Size = Medium
          | Large
          | FullHeight

unsetSize : Hero msg -> Hero msg

setMedium : Hero msg -> Hero msg

setLarge : Hero msg -> Hero msg

setFullHeight : Hero msg -> Hero msg



-- TRANSFORMS ------------------------------------------------------------------

toHtml : Hero msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Hero msg -> Hero msg
