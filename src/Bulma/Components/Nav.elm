
module Bulma.Components.Nav exposing ( Nav
                                     , nav
                                     , toHtml
                                     , addClass
                                     , setHelpers
                                     )

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Layout.Container as Container exposing ( container )
import Bulma.Components.Nav.Item as Item exposing ( Item )

import Html exposing ( Html, Attribute, text, div )
import Html.Events as Event

import Maybe.Extra as Maybe_ exposing ( unwrap )


-- NAV -----------------------------------------------------------------------

type alias Body msg = ( List (Item msg)
                      , List (Item msg)
                      , List (Item msg)
                      )

type alias Nav msg = Entity Bool { menu : Bool, full : Bool, toggle : Maybe msg, body : Body msg } msg

nav : Attrs msg -> List (Item msg) -> List (Item msg) -> List (Item msg) -> Nav msg
nav attrs left center right
  = entity "nav" [ "nav" ] False attrs
    { menu   = False
    , full   = True
    , toggle = Nothing
    , body   = (left,center,right)
    }

-- fromLevel : Level msg -> Level msg
-- -- TODO

-- FULL --

full : Nav msg -> Nav msg
full = mapBody <| \body -> { body | full = True }

contained : Nav msg -> Nav msg
contained = mapBody <| \body -> { body | full = False }


-- MOBILE --

mobileMenuToggle : msg -> Nav msg -> Nav msg
mobileMenuToggle msg = mapBody <| \body -> { body | toggle = Just msg }
-- KLUDGE: i don't like this name


-- MENU --

showMobileMenu : Bool -> Nav msg -> Nav msg
showMobileMenu open = mapBody <| \body -> { body | menu = open }
-- KLUDGE: i don't like this name

-- SHADOW --

shadow : Nav msg -> Nav msg
shadow = mapMods <| y True

noShadow : Nav msg -> Nav msg
noShadow = mapMods <| y False

shadowClass : Bool -> String
shadowClass shadow = if   shadow
                     then "has-shadow"
                     else ""


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
navToggle : Html msg
navToggle
  = span [ class <| "nav-toggle" ++ if menu then "is-active" else "" ]
    [ span [] []
    , span [] []
    , span [] []
    ]

{-| TODO
-}
toHtml : Nav msg -> Html msg
toHtml = Entity.toHtml (shadowClass >> ls) (y [])
       <| \{full,toggle,body,menu} ->
         identity
         -- if   full
         -- then identity
         -- else (container >> Container.toHtml >> ls)
         <| mvalues
           [ body.left   |> div [ class "nav-left"   ] |> Just
           , body.center |> div [ class "nav-center" ] |> Just
           , toggle      |> Maybe.map (y <| navToggle menu)
           , body.right  |> div [ class <| "nav-right" ++ if menu then "nav-right" else "" ] |> Just
           ]

{-| TODO
-}
addClass : String -> Nav msg -> Nav msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Nav msg -> Nav msg
setHelpers = Entity.setHelpers
