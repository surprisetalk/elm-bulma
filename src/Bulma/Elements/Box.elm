
module Bulma.Elements.Box exposing ( Box
                                   , box
                                   , easyBox
                                   , toHtml
                                   , setHelpers
                                   )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Box msg -> Html msg
toHtml (Box helps attrs htmls)
  = node helps "div" [ "box" ] attrs htmls


-- BOX -------------------------------------------------------------------------

type Box msg = Box Helpers (List (Attribute msg)) (List (Html msg))

easyBox : List (Html msg) -> Box msg
easyBox = box defaultHelpers []

box : List (Attribute msg) -> List (Html msg) -> Box msg
box = Box defaultHelpers


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Box msg -> Box msg
setHelpers helps_ (Box _ htmls attrs)
  = Box helps_ htmls attrs

