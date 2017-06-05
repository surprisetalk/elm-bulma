
module Bulma.Components.Modal exposing ( Modal
                                       , modal
                                       , toHtml
                                       , setHelpers
                                       )
                                       
-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- MODAL -----------------------------------------------------------------------

type Modal msg = Modal Helpers (List (Attribute msg)) (Maybe (Html msg)) (List (Html msg)) (Maybe (Button msg))

-- TODO: easyModal

modal : List (Attribute msg) -> List (Html msg) -> Modal msg

modalCard : List (Attribute msg) -> List (Html msg) -> List (Html msg) -> List (Html msg) -> Modal msg

-- TODO: fromEVERYTHING

fromImage : Image -> Modal msg

setCloseButton : Button msg -> Modal msg -> Modal msg

unsetBackground : Modal msg -> Modal msg

setBackground : Modal msg -> Modal msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Modal msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Modal msg -> Modal msg
