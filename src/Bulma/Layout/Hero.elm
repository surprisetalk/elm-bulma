
module Bulma.Layout.Hero exposing ( Hero, hero, titleHero
                                  , head, navHead, tabsHead
                                  , foot, navFoot, tabsFoot
                                  , normal, medium, large, fullHeight
                                  , default, light, dark, primary, info, success, warning, danger
                                  , toHtml, addClass, setHelpers
                                  )
                                  
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Hero, hero, titleHero

@docs head, navHead, tabsHead
@docs foot, navFoot, tabsFoot

@docs normal, medium, large, fullHeight
@docs default, light, dark, primary, info, success, warning, danger

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Title as Title exposing ( Title  )

import Bulma.Components.Nav  as Nav  exposing ( Nav  )
import Bulma.Components.Tabs as Tabs exposing ( Tabs )

import Bulma.Layout.Container as Container exposing ( Container, container )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, div )
import Html.Attributes exposing ( class )


-- HERO -----------------------------------------------------------------------

{-| TODO
-}
type Body msg = BodyContainer (Container msg)
              | BodyTitle     { title    : Title msg
                              , subtitle : Maybe (Title msg)
                              }

{-| TODO
-}
type Edge msg = EdgeContainer (Container msg)
              | EdgeNav       (Nav       msg)
              | EdgeTabs      (Tabs      msg)

{-| TODO
-}
type alias Content msg = { head : Maybe (Edge msg)
                         , body :       (Body msg)
                         , foot : Maybe (Edge msg)
                         }

{-| TODO
-}
type alias Hero msg = Entity Modifiers (Content msg) msg

{-| TODO
-}
hero_ : Attrs msg -> Body msg -> Hero msg
hero_ attrs body
  = entity "section" [ "hero" ] defaultModifiers attrs
    { head = Nothing
    , body = body
    , foot = Nothing
    }

{-| TODO
-}
hero : Attrs msg -> Container msg -> Hero msg
hero = hero_ |-~-> BodyContainer

{-| TODO
-}
titleHero : Attrs msg -> Title msg -> Maybe (Title msg) -> Hero msg
titleHero attrs title subtitle
  = hero_ attrs
  <| BodyTitle
  <| { title    = title
    , subtitle = subtitle
    }


-- HEAD --

{-| TODO
-}
head_ : Edge msg -> Hero msg -> Hero msg
head_ edge_ = mapBody <| \body -> { body | head = Just edge_ }

{-| TODO
-}
head : Container msg -> Hero msg -> Hero msg
head = EdgeContainer >> head_

{-| TODO
-}
navHead : Nav msg -> Hero msg -> Hero msg
navHead = EdgeNav >> head_

{-| TODO
-}
tabsHead : Tabs msg -> Hero msg -> Hero msg
tabsHead = EdgeTabs >> head_


-- FOOT --

{-| TODO
-}
foot_ : Edge msg -> Hero msg -> Hero msg
foot_ edge_ = mapBody <| \body -> { body | foot = Just edge_ }

{-| TODO
-}
foot : Container msg -> Hero msg -> Hero msg
foot = EdgeContainer >> foot_

{-| TODO
-}
navFoot : Nav msg -> Hero msg -> Hero msg
navFoot = EdgeNav >> foot_

{-| TODO
-}
tabsFoot : Tabs msg -> Hero msg -> Hero msg
tabsFoot = EdgeTabs >> foot_


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { bold  : Bool
                       , size  : Size
                       , color : Color
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { bold  = False
                   , size  = Normal
                   , color = Default
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {bold,size,color}
  = [ size  |> sizeClass
    , color |> colorClass
    , if bold then "is-bold" else ""
    ]
                       

-- COLOR --

type Color = Default
           | Primary
           | Info
           | Success
           | Warning
           | Danger
           | Dark
           | Light

{-| TODO
 -}
setColor : Color -> Modifiers -> Modifiers
setColor color_ mods = { mods | color = color_ }

{-| TODO
 -}
default : Hero msg -> Hero msg
default = mapMods <| setColor Default

{-| TODO
-}
dark : Hero msg -> Hero msg
dark = mapMods <| setColor Dark
       
{-| TODO
-}
light : Hero msg -> Hero msg
light = mapMods <| setColor Light

{-| TODO
-}
primary : Hero msg -> Hero msg
primary = mapMods <| setColor Primary

{-| TODO
-}
info : Hero msg -> Hero msg
info = mapMods <| setColor Info

{-| TODO
-}
success : Hero msg -> Hero msg
success = mapMods <| setColor Success

{-| TODO
-}
warning : Hero msg -> Hero msg
warning = mapMods <| setColor Warning

{-| TODO
-}
danger : Hero msg -> Hero msg
danger = mapMods <| setColor Danger
                           
{-| TODO
-}
colorClass : Color -> String
colorClass color
  = case color of
      Default -> ""
      Light   -> "is-light"
      Dark    -> "is-dark"
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"


-- SIZE --

{-| TODO
-}
type Size = Normal
          | Medium
          | Large
          | FullHeight

{-| TODO
-}
setSize : Size -> Modifiers -> Modifiers
setSize size_ mods = { mods | size = size_ }

{-| TODO
-}
normal : Hero msg -> Hero msg
normal = mapMods <| setSize Normal

{-| TODO
-}
medium : Hero msg -> Hero msg
medium = mapMods <| setSize Medium

{-| TODO
-}
large : Hero msg -> Hero msg
large = mapMods <| setSize Large

{-| TODO
-}
fullHeight : Hero msg -> Hero msg
fullHeight = mapMods <| setSize FullHeight

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Normal     -> ""
      Medium     -> "is-medium"
      Large      -> "is-large"
      FullHeight -> "is-fullheight"


-- BOLD --

{-| TODO
-}
weak : Hero msg -> Hero msg
weak = mapMods <| \mods -> { mods | bold = False }

{-| TODO
-}
bold : Hero msg -> Hero msg
bold = mapMods <| \mods -> { mods | bold = True }


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Hero msg -> Html msg
toHtml = Entity.toHtml modsClasses (y [])
       <| \{head,body,foot} ->

         mvalues

         [ head |> Maybe.map (toHtml_ "hero-head")

         , Just
           <| div [ class "hero-body" ]
           <| ls
           <| case body of

               BodyContainer container ->
                 
                 container |> Container.toHtml

               BodyTitle {title,subtitle} ->

                 Container.toHtml
                 <| container []
                 <| case ( title, subtitle ) of
                   ( title, Just subtitle ) -> ( title, subtitle ) |> Title.toHtmls
                   ( title, Nothing       ) -> ( title           ) |> Title.toHtml |> ls
             
         , foot |> Maybe.map (toHtml_ "hero-foot")

         ]

{-| TODO
-}
toHtml_ : String -> Edge msg -> Html msg
toHtml_ c edge
  = div [ class c ]
  <| ls
  <| case edge of
      EdgeContainer container -> container |> Container.toHtml
      EdgeNav       nav       -> nav       |>       Nav.toHtml
      EdgeTabs      tabs      -> tabs      |>      Tabs.toHtml

{-| TODO
-}
addClass : String -> Hero msg -> Hero msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Hero msg -> Hero msg
setHelpers = Entity.setHelpers
