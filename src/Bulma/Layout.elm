
module Bulma.Layout exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# CONTAINER
@docs Container
@docs container, fluidContainer

# HERO
Coming soon!

# SECTION
Coming soon!

# FOOTER
Coming soon!

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Html exposing ( Html )


-- CONTAINER -------------------------------------------------------------------
   
{-| TODO
-}
type alias Container msg = Html msg

{-| TODO
-}
container : Attrs msg -> Htmls msg -> Container msg
container = node "div" [] [ bulma.feature.container ]

{-| TODO
-}
fluidContainer : Attrs msg -> Htmls msg -> Container msg
fluidContainer = node "div" [] [ bulma.feature.container
                               , bulma.feature.sizing.isFluid
                               ]
