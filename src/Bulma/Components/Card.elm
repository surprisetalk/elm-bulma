
module Bulma.Components.Card exposing ( Card
                                      , card
                                      , toHtml
                                      , setHelpers
                                      )

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Card.Cardlet exposing ( Cardlet )

import Html exposing ( Html, Attribute, text )


-- CARD ------------------------------------------------------------------------

type alias Card msg = Entity () (List (Cardlet msg)) msg

card : Attrs msg -> List (Cardlet msg) -> Card msg
card = entity "div" [ "card" ] ()


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Tag msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) <| map Cardlet.toHtml
         

{-| TODO
-}
addClass : String -> Tag msg -> Tag msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tag msg -> Tag msg
setHelpers = Entity.setHelpers
