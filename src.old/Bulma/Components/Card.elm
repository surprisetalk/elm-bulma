
module Bulma.Components.Card exposing ( Card
                                      , card
                                      , toHtml
                                      , addClass
                                      , setHelpers
                                      )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Card
@docs card

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Card.Cardlet as Cardlet exposing ( Cardlet )

import Html exposing ( Html, Attribute, text )

import List exposing ( map )


-- CARD ------------------------------------------------------------------------

{-| TODO
-}
type alias Card msg = Entity () (List (Cardlet msg)) msg

{-| TODO
-}
card : Attrs msg -> List (Cardlet msg) -> Card msg
card = entity "div" [ "card" ] ()


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Card msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) <| map Cardlet.toHtml
         

{-| TODO
-}
addClass : String -> Card msg -> Card msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Card msg -> Card msg
setHelpers = Entity.setHelpers
