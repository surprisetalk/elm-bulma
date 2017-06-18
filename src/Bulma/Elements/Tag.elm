
module Bulma.Elements.Tag exposing ( Tag
                                   , tag
                                   , easyTag
                                   , tagWithDelete
                                   , easyTagWithDelete
                                   , easierTagWithDelete
                                   , small
                                   , medium
                                   , large
                                   , default
                                   , white
                                   , light
                                   , dark
                                   , black
                                   , primary
                                   , info
                                   , success
                                   , warning
                                   , danger
                                   , toHtml
                                   , addClass
                                   , setHelpers
                                   )

                                        
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Tag, tag, easyTag, tagWithDelete, easyTagWithDelete, easierTagWithDelete

@docs small, medium, large

@docs default, white, light, dark, black, primary, info, success, warning, danger

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Delete as Delete exposing ( Delete, easyDelete )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text )


-- TAGS ------------------------------------------------------------------------

{-| TODO
-}
type alias Tag msg = Entity Modifiers (Htmls msg) msg

{-| TODO
-}
tag : Attrs msg -> Htmls msg -> Tag msg
tag = entity "span" [ "tag" ] defaultModifiers

{-| TODO
-}
easyTag : String -> Tag msg
easyTag = tag [] |~-> text >> ls

{-| TODO
-}
tagWithDelete : Attrs msg -> Delete msg -> Htmls msg -> Tag msg
tagWithDelete attrs delete = tag attrs << (::) (Delete.toHtml delete)

{-| TODO
-}
easyTagWithDelete : msg -> Htmls msg -> Tag msg
easyTagWithDelete = easyDelete >> tagWithDelete []

{-| TODO
-}
easierTagWithDelete : msg -> String -> Tag msg
easierTagWithDelete = easyTagWithDelete |-~-> text >> ls


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size  : Size
                       , color : Color
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { size  = Small
                   , color = Default
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,color}
  = [ size  |> sizeClass
    , color |> colorClass
    ]

                       
-- COLOR --

{-| TODO
-}
type Color = Default
           | White
           | Light
           | Dark
           | Black
           | Primary
           | Info
           | Success
           | Warning
           | Danger

{-| TODO
 -}
setColor : Color -> Modifiers -> Modifiers
setColor color_ mods = { mods | color = color_ }

{-| TODO
 -}
default : Tag msg -> Tag msg
default = mapMods <| setColor Default

{-| TODO
-}
black : Tag msg -> Tag msg
black = mapMods <| setColor Black

{-| TODO
-}
dark : Tag msg -> Tag msg
dark = mapMods <| setColor Dark
       
{-| TODO
-}
light : Tag msg -> Tag msg
light = mapMods <| setColor Light

{-| TODO
-}
white : Tag msg -> Tag msg
white = mapMods <| setColor White

{-| TODO
-}
primary : Tag msg -> Tag msg
primary = mapMods <| setColor Primary

{-| TODO
-}
info : Tag msg -> Tag msg
info = mapMods <| setColor Info

{-| TODO
-}
success : Tag msg -> Tag msg
success = mapMods <| setColor Success

{-| TODO
-}
warning : Tag msg -> Tag msg
warning = mapMods <| setColor Warning

{-| TODO
-}
danger : Tag msg -> Tag msg
danger = mapMods <| setColor Danger
                           
{-| TODO
-}
colorClass : Color -> String
colorClass color
  = case color of
      Default -> ""
      White   -> "is-white"
      Light   -> "is-light"
      Dark    -> "is-dark"
      Black   -> "is-black"
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"

-- SIZE --

{-| TODO
-}
type Size = Small
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Modifiers -> Modifiers
setSize size_ mods = { mods | size = size_ }

{-| TODO
-}
small : Tag msg -> Tag msg
small = mapMods <| setSize Small

{-| TODO
-}
medium : Tag msg -> Tag msg
medium = mapMods <| setSize Medium

{-| TODO
-}
large : Tag msg -> Tag msg
large = mapMods <| setSize Large

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Small  -> ""
      Medium -> "is-medium"
      Large  -> "is-large"


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Tag msg -> Html msg
toHtml = Entity.toHtml modsClasses (y []) identity

{-| TODO
-}
addClass : String -> Tag msg -> Tag msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tag msg -> Tag msg
setHelpers = Entity.setHelpers
