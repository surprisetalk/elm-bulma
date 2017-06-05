
module Bulma.Elements.Progress exposing ( Progress
                                        , progress
                                        , toHtml
                                        , setHelpers
                                        )
                                        
-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- PROGRESS --------------------------------------------------------------------

progress : List (Attribute msg) -> Float -> Html msg

easyProgress : Float -> Html msg


-- SIZE ------------------------------------------------------------------------

-- TODO


-- EMPHASIS --------------------------------------------------------------------

-- TODO


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Progress msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Progress msg -> Progress msg
