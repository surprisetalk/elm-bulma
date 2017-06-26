
module Bulma.Layout.Footer exposing ( Footer
                                    , footer
                                    , toHtml
                                    , addClass
                                    , setHelpers
                                    )
                                    
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Footer
@docs footer

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Layout.Container as Container exposing ( Container )

import Html exposing ( Html, Attribute )

-- FOOTER -----------------------------------------------------------------------

{-| TODO
-}
type alias Footer msg = Entity () (Container msg) msg

{-| TODO
-}
footer : List (Attribute msg) -> Container msg -> Footer msg
footer = entity "footer" [ "footer" ] () 


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
