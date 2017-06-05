
module Bulma.Layout.Container exposing ( Container
                                       , container
                                       , toHtml
                                       , setHelpers
                                       )
                                       
-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- CONTAINER -----------------------------------------------------------------------

type Container msg = Container Helpers (List (Attribute msg)) (List (Html msg))

-- TODO: easyContainer

container : List (Attribute msg) -> List (Html msg) -> Container msg

fromContent : List (Attribute msg) -> Content msg -> Container msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Container msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Container msg -> Container msg
