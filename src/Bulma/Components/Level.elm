
module Bulma.Components.Level exposing ( Level
                                       , level
                                       , toHtml
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Level.Item as Item exposing ( Item )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text )


-- LEVEL -----------------------------------------------------------------------

type alias Level msg = Entity Bool ( List (Item msg), Maybe (List (Item msg)) ) msg

level : Attrs msg -> List (Item msg) -> List (Item msg) -> Level msg

centeredLevel : Attrs msg -> List (Item msg) -> Level msg


-- MOBILE ----------------------------------------------------------------------

full : Level msg -> Level msg

mobile : Level msg -> Level msg


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Tag msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) identity

{-| TODO
-}
addClass : String -> Tag msg -> Tag msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tag msg -> Tag msg
setHelpers = Entity.setHelpers
