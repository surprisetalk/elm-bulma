
module Bulma.Components.Message exposing ( Message
                                         , message
                                         , toHtml
                                         , setHelpers
                                         )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- MESSAGE -----------------------------------------------------------------------

type Message msg = Message Helpers (List (Attribute msg)) (Maybe (List (Html msg), msg)) (List (Html msg))

-- TODO: easyMessage

message : List (Attribute msg) -> List (Html msg) -> Message msg

messageWithHeader : List (Attribute msg) -> List (Html msg) -> List (Html msg) -> Message msg

messageWithHeaderAndDelete : List (Attribute msg) -> msg -> List (Html msg) -> List (Html msg) -> Message msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Message msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Message msg -> Message msg
