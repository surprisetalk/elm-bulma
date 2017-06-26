
module Bulma.Elements.Delete exposing ( Delete
                                      , delete
                                      , easyDelete
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

@docs Delete, delete, easyDelete

@docs small, normal, medium, large

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute )
import Html.Events exposing ( onClick )


-- DELETE ---------------------------------------------------------------------

{-| TODO
-}
type alias Delete msg = Entity Size () msg

{-| TODO
-}
delete : List (Attribute msg) -> Delete msg
delete attrs = entity "a" [ "delete" ] Normal attrs ()

{-| TODO
-}
easyDelete : msg -> Delete msg
easyDelete = onClick >> ls >> delete


-- SIZE ------------------------------------------------------------------------

{-| TODO
-}
type Size = Small
          | Normal
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Delete msg -> Delete msg
setSize = mapMods << y

{-| TODO
-}
small : Delete msg -> Delete msg
small = setSize Small

{-| TODO
-}
normal : Delete msg -> Delete msg
normal = setSize Normal

{-| TODO
-}
medium : Delete msg -> Delete msg
medium = setSize Medium

{-| TODO
-}
large : Delete msg -> Delete msg
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


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Delete msg -> Html msg
toHtml = Entity.toHtml (sizeClass >> ls) (y []) (y [])

{-| TODO
-}
addClass : String -> Delete msg -> Delete msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Delete msg -> Delete msg
setHelpers = Entity.setHelpers

