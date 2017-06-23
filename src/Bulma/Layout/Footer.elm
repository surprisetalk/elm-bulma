
module Bulma.Layout.Footer exposing ( Footer
                                    , fromContainer
                                    , toHtml
                                    , addClass
                                    , setHelpers
                                    )
                                    
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Footer
@docs fromContainer

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Layout.Container as Container exposing ( Container )

import Html exposing ( Html, Attribute, text, div, p, a, ul, li, span )

-- FOOTER -----------------------------------------------------------------------

{-| TODO
-}
type alias Footer msg = Entity () (Container msg) msg

{-| TODO
-}
fromContainer : List (Attribute msg) -> Container msg -> Footer msg
fromContainer = entity "footer" [ "footer" ] () 


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Footer msg -> Html msg
toHtml = Entity.toHtml (y []) (y []) (Container.toHtml >> ls)

{-| TODO
-}
addClass : String -> Footer msg -> Footer msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Footer msg -> Footer msg
setHelpers = Entity.setHelpers
