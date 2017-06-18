
module Bulma.Components.Nav.Item exposing ( Item
                                          , item
                                          , easyItem
                                          , fromImage
                                          , fromTitle
                                          , fromButton
                                          , fromIcon
                                          , fromField
                                          , onClick
                                          , active
                                          , inactive
                                          , tab
                                          , toHtml
                                          , addClass
                                          , setHelpers
                                          )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Item
@docs item, easyItem
@docs fromImage, fromTitle, fromButton, fromIcon, fromField

@docs onClick

@docs active, inactive
@docs tab

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Button as Button exposing ( Button )
import Bulma.Elements.Image  as Image  exposing ( Image  )
import Bulma.Elements.Title  as Title  exposing ( Title  )
import Bulma.Elements.Icon   as Icon   exposing ( Icon   )
import Bulma.Elements.Form   as Form   exposing ( Field  )

import Html exposing ( Html, Attribute, text, div )
import Html.Events as Event

import Tuple exposing ( first, second )

import Maybe.Extra as Maybe_ exposing ( unwrap )


-- NAV ITEM ------------------------------------------------------------------

-- TODO: search

{-| TODO
-}
type alias Item msg = Entity Modifiers (Maybe msg, Htmls msg) msg

{-| TODO
-}
item : Attrs msg -> Htmls msg -> Item msg
item attrs = (,) Nothing >> entity "a" [ "nav-item" ] defaultModifiers attrs

{-| TODO
-}
easyItem : msg -> String -> Item msg
easyItem msg label = item [] [ text label ] |> onClick msg

{-| TODO
-}
fromImage : Attrs msg -> Image msg -> Item msg
fromImage attrs = Image.toHtml >> ls >> item attrs

{-| TODO
-}
fromTitle : Attrs msg -> Title msg -> Item msg
fromTitle attrs = Title.toHtml >> ls >> item attrs

{-| TODO
-}
fromButton : Attrs msg -> Button msg -> Item msg
fromButton attrs = Button.toHtml >> ls >> item attrs

{-| TODO
-}
fromIcon : Attrs msg -> Icon msg -> Item msg
fromIcon attrs = Icon.toHtml >> ls >> item attrs

{-| TODO
-}
fromField : Attrs msg -> Field msg -> Item msg
fromField attrs = Form.toHtml >> ls >> item attrs


-- EVENTS --------------------------------------------------------------------

{-| TODO
-}
onClick : msg -> Item msg -> Item msg
onClick = mapBody << setFirst << Just


-- MODIFIERS -----------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { active : Bool
                       , tab    : Bool
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { active = False
                   , tab    = False
                   } 

modsClasses : Modifiers -> List String
modsClasses {active,tab}
  = [ if active then "is-active" else ""
    , if tab    then "is-tab"    else ""
    ]


-- ACTIVE --

{-| TODO
-}
inactive : Item msg -> Item msg
inactive = mapMods <| \mods -> { mods | active = False }

{-| TODO
-}
active : Item msg -> Item msg
active = mapMods <| \mods -> { mods | active = True }


-- TABS --

{-| TODO
-}
tab : Item msg -> Item msg
tab = mapMods <| \mods -> { mods | tab = True }


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Item msg -> Html msg
toHtml = Entity.toHtml
         modsClasses
         (first >> unwrap [] (Event.onClick >> ls))
         second

{-| TODO
-}
addClass : String -> Item msg -> Item msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Item msg -> Item msg
setHelpers = Entity.setHelpers
