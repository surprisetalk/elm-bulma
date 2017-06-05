
module Bulma.Layout.Section exposing ( Section
                                     , section
                                     , toHtml
                                     , setHelpers
                                     )
                                     
-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- SECTION -----------------------------------------------------------------------

type Section msg = Section Helpers (List (Attribute msg)) (Container msg)

-- TODO: easySection

fromContainer : List (Attribute msg) -> Container msg -> Section msg


-- SIZE --

type Size = Medium
          | Large

unsetSize : Hero msg -> Hero msg

setMedium : Hero msg -> Hero msg

setLarge : Hero msg -> Hero msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Section msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Section msg -> Section msg
