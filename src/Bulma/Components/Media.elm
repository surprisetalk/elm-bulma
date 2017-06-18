
module Bulma.Components.Media exposing ( Media
                                       , media
                                       , toHtml
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- MEDIA -----------------------------------------------------------------------

type Media msg = Media Helpers (List (Attribute msg)) (List (Object msg)) (List (Object msg)) (List (Object msg))

-- TODO: easyMedia

media : List (Attribute msg) -> List (Object msg) -> List (Object msg) -> List (Object msg) -> Media msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Media msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Media msg -> Media msg
