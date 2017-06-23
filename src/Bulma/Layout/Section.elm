
module Bulma.Layout.Section exposing ( Section
                                     , fromContainer
                                     , normal
                                     , medium
                                     , large
                                     , toHtml
                                     , addClass
                                     , setHelpers
                                     )
                                    
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Section
@docs fromContainer

@docs normal, medium, large

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Layout.Container as Container exposing ( Container )

import Html exposing ( Html, Attribute )


-- SECTION -----------------------------------------------------------------------

{-| TODO
-}
type alias Section msg = Entity Size (Container msg) msg

{-| TODO
-}
fromContainer : List (Attribute msg) -> Container msg -> Section msg
fromContainer = entity "section" [ "section" ] Normal 


-- SIZE --

{-| TODO
-}
type Size = Normal
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Section msg -> Section msg
setSize size_ = mapMods <| y size_

{-| TODO
-}
normal : Section msg -> Section msg
normal = setSize Normal

{-| TODO
-}
medium : Section msg -> Section msg
medium = setSize Medium

{-| TODO
-}
large : Section msg -> Section msg
large = setSize Large

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Normal -> ""
      Medium -> "is-medium"
      Large  -> "is-large"



-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Section msg -> Html msg
toHtml = Entity.toHtml (sizeClass >> ls) (y []) (Container.toHtml >> ls)

{-| TODO
-}
addClass : String -> Section msg -> Section msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Section msg -> Section msg
setHelpers = Entity.setHelpers
