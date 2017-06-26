
module Bulma.Layout.Container exposing ( Container
                                       , container
                                       , fluidContainer
                                       , toHtml
                                       , addClass
                                       , setHelpers
                                       )
                                       
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Container
@docs container, fluidContainer

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute, text, div, p, a, ul, li, span )

-- CONTAINER -----------------------------------------------------------------------

{-| TODO
-}
type alias Container msg = Entity () (Htmls msg) msg

{-| TODO
-}
container : Attrs msg -> Htmls msg -> Container msg
container = entity "div" [ "container" ] () 

{-| TODO
-}
fluidContainer : Attrs msg -> Htmls msg -> Container msg
fluidContainer = entity "div" [ "container", "is-fluid" ] () 

-- fromContent : Attrs msg -> Content msg -> Container msg
-- -- TODO


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Container msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) identity

{-| TODO
-}
addClass : String -> Container msg -> Container msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Container msg -> Container msg
setHelpers = Entity.setHelpers
