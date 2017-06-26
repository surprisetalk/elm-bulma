
module Bulma.Components.Level exposing ( Level
                                       , level
                                       , centeredLevel
                                       , full
                                       , mobile
                                       , toHtml
                                       , addClass
                                       , setHelpers
                                       )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Level
@docs level, centeredLevel

@docs full, mobile

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Level.Item as Item exposing ( Item )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text, div )
import Html.Attributes exposing ( class )

import List exposing ( map )
import Tuple exposing ( mapSecond )


-- LEVEL -----------------------------------------------------------------------

{-| TODO
-}
type alias Level msg = Entity Bool ( List (Item msg), Maybe (List (Item msg)) ) msg

{-| TODO
-}
level_ : Attrs msg -> ( List (Item msg), Maybe (List (Item msg)) ) -> Level msg
level_ = entity "nav" [ "level" ] False

{-| TODO
-}
level : Attrs msg -> ( List (Item msg), List (Item msg) ) -> Level msg
level = level_ |-~-> mapSecond Just

{-| TODO
-}
centeredLevel : Attrs msg -> List (Item msg) -> Level msg
centeredLevel = level_ |-~-> fl (,) Nothing


-- MOBILE ----------------------------------------------------------------------

{-| TODO
-}
full : Level msg -> Level msg
full = mapMods <| y False

{-| TODO
-}
mobile : Level msg -> Level msg
mobile = mapMods <| y True

{-| TODO
-}
mobileClass : Bool -> String
mobileClass isMobile = if isMobile then "is-mobile" else ""


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Level msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \( left, right ) ->

         case ( left, right ) of

           ( content, Nothing ) ->

             content |> map Item.toHtml

           ( left, Just right ) ->

             [ left  |> map Item.toHtml |> div [ class "level-left"  ] 
             , right |> map Item.toHtml |> div [ class "level-right" ] 
             ]
             


{-| TODO
-}
addClass : String -> Level msg -> Level msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Level msg -> Level msg
setHelpers = Entity.setHelpers
