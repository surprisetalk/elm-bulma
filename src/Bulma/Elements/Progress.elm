
module Bulma.Elements.Progress exposing ( Progress
                                        , progress
                                        , small
                                        , normal
                                        , medium
                                        , large
                                        , default
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

@docs Progress, progress

@docs small, normal, medium, large

@docs default, primary, info, success, warning, danger

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute )
import Html.Attributes as Attr exposing ( max, value )


-- PROGRESS ---------------------------------------------------------------------

{-| TODO
-}
type alias Progress msg = Entity Modifiers () msg

{-| TODO
-}
progress : List (Attribute msg) -> Float -> Progress msg
progress attrs val
  = entity "progress" [ "progress" ]
    { size = Normal, color = Default }
    (attrs ++ [ Attr.max "100", value (toString val) ])
    ()


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size  : Size
                       , color : Color
                       }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,color} = [ sizeClass size, colorClass color ]

-- SIZE ---

{-| TODO
-}
type Size = Small
          | Normal
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Progress msg -> Progress msg
setSize size_ = mapMods <| \mods -> { mods | size = size_ }

{-| TODO
-}
small : Progress msg -> Progress msg
small = setSize Small

{-| TODO
-}
normal : Progress msg -> Progress msg
normal = setSize Normal

{-| TODO
-}
medium : Progress msg -> Progress msg
medium = setSize Medium

{-| TODO
-}
large : Progress msg -> Progress msg
large = setSize Large

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Small  -> "is-small"
      Normal -> ""
      Medium -> "is-medium"
      Large  -> "is-large"


-- EMPHASIS --

{-| TODO
-}
type Color = Default
           | Primary
           | Info
           | Success
           | Warning
           | Danger

{-| TODO
-}
setColor : Color -> Progress msg -> Progress msg
setColor color_ = mapMods <| \mods -> { mods | color = color_ }

{-| TODO
-}
default : Progress msg -> Progress msg
default = setColor Default

{-| TODO
-}
primary : Progress msg -> Progress msg
primary = setColor Primary

{-| TODO
-}
info : Progress msg -> Progress msg
info = setColor Info

{-| TODO
-}
success : Progress msg -> Progress msg
success = setColor Success

{-| TODO
-}
warning : Progress msg -> Progress msg
warning = setColor Warning

{-| TODO
-}
danger : Progress msg -> Progress msg
danger = setColor Danger

{-| TODO
-}
colorClass : Color -> String
colorClass color
  = case color of 
      Default -> ""
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Progress msg -> Html msg
toHtml = Entity.toHtml modsClasses (y []) (y [])

{-| TODO
-}
addClass : String -> Progress msg -> Progress msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Progress msg -> Progress msg
setHelpers = Entity.setHelpers
