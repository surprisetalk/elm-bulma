
module Bulma.Components.Modal exposing ( Modal
                                       , modal
                                       , onExit
                                       , toHtml
                                       , addClass
                                       , setHelpers
                                       )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Modal
@docs modal

@docs exit

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute, text, div )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class )

import Pointless exposing (..)


-- MODAL -----------------------------------------------------------------------

{-| TODO
-}
type Body msg = BodyHtmls (Htmls msg)

{-| TODO
-}
type alias Modal msg = Entity () (Maybe msg, Body msg) msg

{-| TODO
-}
modal_ : Attrs msg -> Body msg -> Modal msg
modal_ attrs = (,) Nothing >> entity "div" [ "modal" ] () attrs

{-| TODO
-}
modal : Attrs msg -> Htmls msg -> Modal msg
modal = modal_ |-~-> BodyHtmls

-- TODO: fromEVERYTHING


-- EXIT ------------------------------------------------------------------------

{-| TODO
-}
onExit : msg -> Modal msg -> Modal msg
onExit = mapBody << setFirst << Just


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Modal msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \(exit,body) ->
         [ flip div []
           <| mvalues
             [ class "modal-background" |> Just
             , exit |> Maybe.map onClick
             ]
         , div [ class "modal-content"    ]
           <| case body of
               BodyHtmls htmls -> htmls
         ]

{-| TODO
-}
addClass : String -> Modal msg -> Modal msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Modal msg -> Modal msg
setHelpers = Entity.setHelpers
