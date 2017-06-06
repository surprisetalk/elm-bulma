
module Bulma.Elements.Content exposing ( Content
                                       , content
                                       , toHtml
                                       , small
                                       , normal
                                       , medium
                                       , large
                                       , addClass
                                       , setHelpers
                                       )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Content, content

@docs small, normal, medium, large

@docs toHtml, addClass, setHelpers

-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute )


-- CONTENT ---------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size : Size }

{-| TODO
-}
type alias Content msg = Entity Modifiers (Htmls msg) msg

{-| TODO
-}
content : List (Attribute msg) -> List (Html msg) -> Content msg
content = entity "div" [ "content" ] { size = Normal }


-- SIZE ------------------------------------------------------------------------

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
small : Content msg -> Content msg
small = mapMods <| setSize Small

{-| TODO
-}
normal : Content msg -> Content msg
normal = mapMods <| setSize Normal

{-| TODO
-}
medium : Content msg -> Content msg
medium = mapMods <| setSize Medium

{-| TODO
-}
large : Content msg -> Content msg
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


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Content msg -> Html msg
toHtml = Entity.toHtml (\_ -> []) identity

{-| TODO
-}
addClass : String -> Content msg -> Content msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Content msg -> Content msg
setHelpers = Entity.setHelpers

