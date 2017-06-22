
module Bulma.Components.Message exposing ( Message
                                         , message
                                         , messageWithHeader
                                         , messageWithHeaderAndDelete
                                         , default
                                         , dark
                                         , info
                                         , success
                                         , warning
                                         , danger
                                         , toHtml
                                         , addClass
                                         , setHelpers
                                         )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Message
@docs message
@docs messageWithHeader, messageWithHeaderAndDelete

@docs default, dark, info, success, warning, danger

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Delete as Delete exposing ( easyDelete )

import Html exposing ( Html, Attribute, text, div )
import Html.Attributes as Attr exposing ( class )

import Maybe.Extra as Maybe_ exposing ( unwrap )


-- MESSAGE -----------------------------------------------------------------------

{-| TODO
-}
type alias Body msg = { exitMsg : Maybe msg
                      , header  : Htmls msg
                      , htmls   : Htmls msg
                      }

{-| TODO
-}
type alias Message msg = Entity Color (Body msg) msg

{-| TODO
-}
message : Attrs msg -> Htmls msg -> Message msg
message attrs = messageWithHeader attrs []

{-| TODO
-}
messageWithHeader : Attrs msg -> Htmls msg -> Htmls msg -> Message msg
messageWithHeader attrs header htmls
  = entity "article" [ "message" ] Default attrs (Body Nothing header htmls)

{-| TODO
-}
messageWithHeaderAndDelete : Attrs msg -> msg -> Htmls msg -> Htmls msg -> Message msg
messageWithHeaderAndDelete attrs exitMsg header htmls
  = entity "article" [ "message" ] Default attrs (Body (Just exitMsg) header htmls)


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type Color = Default
           | Dark
           | Primary
           | Info
           | Success
           | Warning
           | Danger

{-| TODO
 -}
setColor : Color -> Message msg -> Message msg
setColor = mapMods << y

{-| TODO
 -}
default : Message msg -> Message msg
default = setColor Default

{-| TODO
-}
dark : Message msg -> Message msg
dark = setColor Dark

{-| TODO
-}
primary : Message msg -> Message msg
primary = setColor Primary

{-| TODO
-}
info : Message msg -> Message msg
info = setColor Info

{-| TODO
-}
success : Message msg -> Message msg
success = setColor Success

{-| TODO
-}
warning : Message msg -> Message msg
warning = setColor Warning

{-| TODO
-}
danger : Message msg -> Message msg
danger = setColor Danger
                           
{-| TODO
-}
colorClass : Color -> String
colorClass color
  = case color of
      Default -> ""
      Dark    -> "is-dark"
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Message msg -> Html msg
toHtml = Entity.toHtml (colorClass >> ls) (y [])
       <| \{exitMsg,header,htmls} ->
         [ div [ class "message-header" ]
           <| (++) header
           <| unwrap [] (easyDelete >> Delete.toHtml >> ls)
           <| exitMsg
         , div [ class "message-body" ] htmls
         ]

{-| TODO
-}
addClass : String -> Message msg -> Message msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Message msg -> Message msg
setHelpers = Entity.setHelpers
