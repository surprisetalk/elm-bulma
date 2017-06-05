
module Bulma.Components.Media exposing ( Media
                                       , media
                                       , toHtml
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- MEDIA -----------------------------------------------------------------------

type Media msg = Media Helpers (List (Attribute msg)) (List (Object msg)) (List (Object msg)) (List (Object msg))

-- TODO: easyMedia

media : List (Attribute msg) -> List (Object msg) -> List (Object msg) -> List (Object msg) -> Media msg


-- MEDIA OBJECT ----------------------------------------------------------------

type Object msg = Object Helpers (List (Attribute msg)) (List (Html msg))

object : List (Attribute msg) -> (List (Html msg)) -> Object msg

fromBox : Box msg -> Object msg

fromContent : Content msg -> Object msg

fromProgress : Progress msg -> Object msg

fromTable : Table msg -> Object msg

fromTag : Tag msg -> Object msg

fromNav : Nav msg -> Object msg

fromImage : Image msg -> Object msg

fromTitle : Title msg -> Object msg

fromButton : Button msg -> Object msg

fromIcon : Icon msg -> Object msg

fromField : Field msg -> Object msg

fromMedia : Media msg -> Object msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Media msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Media msg -> Media msg
