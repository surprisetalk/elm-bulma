
module Bulma.Elements.Delete exposing ( Delete
                                      , delete
                                      , small
                                      , normal
                                      , medium
                                      , large
                                      , toHtml
                                      , addClass
                                      , setHelpers
                                      )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Delete, delete

@docs small, normal, medium, large

@docs toHtml, addClass, setHelpers

-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute )


-- DELETE ---------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size : Size }

{-| TODO
-}
type alias Delete msg = Entity Modifiers (Htmls msg) msg

{-| TODO
-}
delete : List (Attribute msg) -> List (Html msg) -> Delete msg
delete = entity "a" [ "delete" ] { size = Normal }


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
small : Delete msg -> Delete msg
small = mapMods <| setSize Small

{-| TODO
-}
normal : Delete msg -> Delete msg
normal = mapMods <| setSize Normal

{-| TODO
-}
medium : Delete msg -> Delete msg
medium = mapMods <| setSize Medium

{-| TODO
-}
large : Delete msg -> Delete msg
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
toHtml : Delete msg -> Html msg
toHtml = Entity.toHtml (\_ -> []) identity

{-| TODO
-}
addClass : String -> Delete msg -> Delete msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Delete msg -> Delete msg
setHelpers = Entity.setHelpers

