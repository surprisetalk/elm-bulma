
module Bulma.Elements.Button exposing ( Button
                                      , button
                                      , iconButton
                                      , easyButton
                                      , easierButton
                                      , outlined
                                      , filled
                                      , inverted
                                      , natural
                                      , small
                                      , normal
                                      , medium
                                      , large
                                      , blur
                                      , hover
                                      , focus
                                      , active
                                      , loading
                                      , static
                                      , default
                                      , white
                                      , light
                                      , dark
                                      , black
                                      , link
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

@docs Button, button, iconButton, easyButton, easierButton

-- @docs buttonGroup, connectedButtonGroup

@docs outlined, filled

@docs inverted, natural

@docs small, normal, medium, large

@docs blur, hover, focus, active, loading, static

@docs default, white, light, dark, black, link, primary, info, success, warning, danger

@docs toHtml, addClass, setHelpers

-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Icon as Icon exposing ( Icon )

import Html exposing ( Html, Attribute, text )
import Html.Events exposing ( onClick )


-- BUTTON ----------------------------------------------------------------------

{-| TODO
-}
type Body msg = BodyHtml            (Htmls msg)
              | BodyIcon (Icon msg) (Htmls msg)

{-| TODO
-}
type alias Button msg = Entity Modifiers (Body msg) msg

{-| TODO
-}
button : List (Attribute msg) -> List (Html msg) -> Button msg
button attrs = BodyHtml >> entity "a" [ "button" ] defaultModifiers attrs

{-| TODO
-}
iconButton : List (Attribute msg) -> Icon msg -> List (Html msg) -> Button msg
iconButton attrs = BodyIcon >>> entity "a" [ "button" ] defaultModifiers   attrs

{-| TODO
-}
easyButton : msg -> Icon msg -> String -> Button msg
easyButton msg icon = text >> ls >> iconButton [ onClick msg ] icon

{-| TODO
-}
easierButton : msg -> String -> Button msg
easierButton icon = text >> ls >> button []


-- GROUPS ----------------------------------------------------------------------

-- {-| TODO
-- -}
-- buttonGroup : List (Button msg) -> Field msg

-- {-| TODO
-- -}
-- connectedButtonGroup : List (Button msg) -> Field msg


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { outlined : Bool
                       , inverted : Bool
                       , size     : Size
                       , state    : State
                       , color    : Color
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { outlined = False
                   , inverted = False
                   , size     = Normal
                   , state    = Blur
                   , color    = Default
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {outlined,inverted,size,state,color}
  = [ outlined |> outlineClass
    , inverted |> invertClass
    , size     |> sizeClass
    , state    |> stateClass
    , color    |> colorClass
    ]

                       
-- OUTLINE --

{-| TODO
-}
filled : Button msg -> Button msg
filled = mapMods <| \mods -> { mods | outlined = False }

{-| TODO
-}
outlined : Button msg -> Button msg
outlined = mapMods <| \mods -> { mods | outlined = True }

{-| TODO
-}
outlineClass : Bool -> String
outlineClass outline = if   outline
                       then "is-outlined"
                       else ""


-- INVERT --

{-| TODO
-}
natural : Button msg -> Button msg
natural = mapMods <| \mods -> { mods | inverted = False }

{-| TODO
-}
inverted : Button msg -> Button msg
inverted = mapMods <| \mods -> { mods | inverted = True }

{-| TODO
-}
invertClass : Bool -> String
invertClass invert = if   invert
                     then "is-inverted"
                     else ""
                     
-- SIZE --

{-| TODO
-}
type Size = Small
          | Normal
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Modifiers -> Modifiers
setSize size_ mods = { mods | size = size_ }

{-| TODO
-}
small : Button msg -> Button msg
small = mapMods <| setSize Small

{-| TODO
-}
normal : Button msg -> Button msg
normal = mapMods <| setSize Normal

{-| TODO
-}
medium : Button msg -> Button msg
medium = mapMods <| setSize Medium

{-| TODO
-}
large : Button msg -> Button msg
large = mapMods <| setSize Large

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Small  -> "is-small"
      Normal -> ""
      Medium -> "is-medium"
      Large  -> "is-large"


-- STATE --

{-| TODO
-}
type State = Blur
           | Hover
           | Focus
           | Active
           | Loading
           | Static

{-| TODO
-}
setState : State -> Modifiers -> Modifiers
setState state_ mods = { mods | state = state_ }

{-| TODO
-}
blur : Button msg -> Button msg
blur = mapMods <| setState Blur

{-| TODO
-}
hover : Button msg -> Button msg
hover = mapMods <| setState Hover

{-| TODO
-}
focus : Button msg -> Button msg
focus = mapMods <| setState Focus

{-| TODO
-}
active : Button msg -> Button msg
active = mapMods <| setState Active

{-| TODO
-}
loading : Button msg -> Button msg
loading = mapMods <| setState Loading

{-| TODO
-}
static : Button msg -> Button msg
static = mapMods <| setState Static

{-| TODO
-}
stateClass : State -> String
stateClass state
  = case state of
      Blur    -> ""
      Hover   -> "is-hover"
      Focus   -> "is-focus"
      Active  -> "is-active"
      Loading -> "is-loading"
      Static  -> "is-static"


-- COLOR --

{-| TODO
-}
type Color = Default
           | White
           | Light
           | Dark
           | Black
           | Link
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
default : Button msg -> Button msg
default = mapMods <| setColor Default

{-| TODO
-}
black : Button msg -> Button msg
black = mapMods <| setColor Black

{-| TODO
-}
dark : Button msg -> Button msg
dark = mapMods <| setColor Dark
       
{-| TODO
-}
light : Button msg -> Button msg
light = mapMods <| setColor Light

{-| TODO
-}
white : Button msg -> Button msg
white = mapMods <| setColor White

{-| TODO
-}
link : Button msg -> Button msg
link = mapMods <| setColor Link

{-| TODO
-}
primary : Button msg -> Button msg
primary = mapMods <| setColor Primary

{-| TODO
-}
info : Button msg -> Button msg
info = mapMods <| setColor Info

{-| TODO
-}
success : Button msg -> Button msg
success = mapMods <| setColor Success

{-| TODO
-}
warning : Button msg -> Button msg
warning = mapMods <| setColor Warning

{-| TODO
-}
danger : Button msg -> Button msg
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
      Link    -> "is-link"
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Button msg -> Html msg
toHtml = Entity.toHtml modsClasses
       <| \body ->
         case body of
           BodyHtml      htmls ->                     htmls
           BodyIcon icon htmls -> Icon.toHtml icon :: htmls
           

{-| TODO
-}
addClass : String -> Button msg -> Button msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Button msg -> Button msg
setHelpers = Entity.setHelpers
