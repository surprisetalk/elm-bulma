
module Bulma.Components.Card exposing ( Card
                                      , card
                                      , toHtml
                                      , setHelpers
                                      )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- CARD ------------------------------------------------------------------------

type Card msg = Card Helpers (List (Attribute msg)) (List (Html msg))

card : List (Attribute msg) -> List (Cardlet msg) -> Card msg


-- CARDLET ---------------------------------------------------------------------

type Cardlet msg = Cardlet Helpers (List (Attribute msg)) (List (Html msg))


-- HEADER --

easyHeader : Icon msg -> Title msg -> Cardlet msg

easierHeader : Title msg -> Cardlet msg

header : List (Attribute msg) -> List (Html msg) -> List (Html msg) -> Cardlet msg


-- IMAGE --

fromImage : Image msg -> Cardlet msg


-- CONTENT --

-- TODO: other components/elements

content : List (Attribute msg) -> List (Html msg) -> Cardlet msg
          
fromBox : Box msg -> Cardlet msg

fromMedia : Media msg -> Cardlet msg


-- FOOTER --

easyFooter : List (Button msg) -> Cardlet msg

footer : List (Attribute msg) -> List (List (Html msg)) -> Cardlet msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Card msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Card msg -> Card msg
