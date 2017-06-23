
module Bulma.Components.Nav exposing ( Nav, nav
                                     , full, contained
                                     , mobileMenuToggle
                                     , showMobileMenu
                                     , shadow, noShadow
                                     , toHtml, addClass, setHelpers
                                     )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Nav
@docs nav

@docs full, contained
@docs mobileMenuToggle
@docs showMobileMenu
@docs shadow, noShadow

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Layout.Container as Container exposing ( Container, container )
import Bulma.Components.Nav.Item as Item exposing ( Item )

import Html exposing ( Html, Attribute, text, div, span )
import Html.Attributes as Attr exposing ( class )

import List exposing ( map )


-- NAV -----------------------------------------------------------------------

type alias Body msg = { left   : List (Item msg)
                      , center : List (Item msg)
                      , right  : List (Item msg)
                      }

{-| TODO
-}
type alias Nav msg = Entity Bool { menu : Bool, full : Bool, toggle : Maybe msg, body : Body msg } msg

{-| TODO
-}
nav : Attrs msg -> List (Item msg) -> List (Item msg) -> List (Item msg) -> Nav msg
nav attrs left center right
  = entity "nav" [ "nav" ] False attrs
    { menu   = False
    , full   = True
    , toggle = Nothing
    , body   = { left   = left
               , center = center
               , right  = right
               } 
    }

-- fromLevel : Level msg -> Level msg
-- -- TODO

-- FULL --

{-| TODO
-}
full : Nav msg -> Nav msg
full = mapBody <| \body -> { body | full = True }

{-| TODO
-}
contained : Nav msg -> Nav msg
contained = mapBody <| \body -> { body | full = False }


-- MOBILE --

{-| TODO
-}
mobileMenuToggle : msg -> Nav msg -> Nav msg
mobileMenuToggle msg = mapBody <| \body -> { body | toggle = Just msg }
-- KLUDGE: i don't like this name


-- MENU --

{-| TODO
-}
showMobileMenu : Bool -> Nav msg -> Nav msg
showMobileMenu open = mapBody <| \body -> { body | menu = open }
-- KLUDGE: i don't like this name

-- SHADOW --

{-| TODO
-}
shadow : Nav msg -> Nav msg
shadow = mapMods <| y True

{-| TODO
-}
noShadow : Nav msg -> Nav msg
noShadow = mapMods <| y False

{-| TODO
-}
shadowClass : Bool -> String
shadowClass shadow = if   shadow
                     then "has-shadow"
                     else ""


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
navToggle : Bool -> Html msg
navToggle menu
  = span [ class <| "nav-toggle" ++ if menu then " is-active" else "" ]
    [ span [] []
    , span [] []
    , span [] []
    ]

{-| TODO
-}
toHtml : Nav msg -> Html msg
toHtml = Entity.toHtml (shadowClass >> ls) (y [])
       <| \{full,toggle,body,menu} ->
         ( if   full
           then identity
           else (container [] >> Container.toHtml >> ls))
         <| mvalues
           [ body.left   |> map Item.toHtml |> div [ class "nav-left"   ] |> Just
           , body.center |> map Item.toHtml |> div [ class "nav-center" ] |> Just
           , toggle      |> Maybe.map (y <| navToggle menu)
           , case toggle of
               Just _  -> body.right |> map Item.toHtml |> div [ class <| "nav-right" ++ if menu then " is-active" else "" ] |> Just
               Nothing -> body.right |> map Item.toHtml |> div [ class <| "nav-right"                                      ] |> Just
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
