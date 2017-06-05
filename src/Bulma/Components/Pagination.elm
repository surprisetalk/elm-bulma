
module Bulma.Components.Pagination exposing ( Pagination
                                            , pagination
                                            , toHtml
                                            , setHelpers
                                            )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- PAGINATION -----------------------------------------------------------------------

type Pagination msg = Pagination Helpers (List (Attribute msg)) (Maybe (Button msg)) (Maybe (Button msg)) (List (Button msg)) (Maybe (Button msg)) (Maybe (Button msg)) 

-- TODO: easyPagination

pagination : List (Attribute msg) -> Maybe (Button msg) -> Maybe (Button msg) -> List (Button msg) -> Maybe (Button msg) -> Maybe (Button msg) -> Pagination msg

-- TODO: it may be better to add some of the buttons as setters?


-- ALIGNMENT --

unsetAlignment : Pagination msg -> Pagination msg

setCentered : Pagination msg -> Pagination msg

setRight : Pagination msg -> Pagination msg


-- SIZE --

unsetSize : Pagination msg -> Pagination msg

setSmall : Pagination msg -> Pagination msg

setMedium : Pagination msg -> Pagination msg

setLarge : Pagination msg -> Pagination msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Pagination msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Pagination msg -> Pagination msg
