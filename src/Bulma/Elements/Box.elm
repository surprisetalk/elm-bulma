
module Bulma.Elements.Box exposing ( Box
                                   , box
                                   , toHtml
                                   , addClass
                                   , setHelpers
                                   )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Box, box

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute )


-- BOX -------------------------------------------------------------------------

{-| TODO
-}
type alias Box msg = Entity () (Htmls msg) msg

{-| TODO
-}
box : List (Attribute msg) -> List (Html msg) -> Box msg
box = entity "div" [ "box" ] ()


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Box msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) identity

{-| TODO
-}
addClass : String -> Box msg -> Box msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Box msg -> Box msg
setHelpers helps = Entity.setHelpers helps

