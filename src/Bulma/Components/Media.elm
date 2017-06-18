
module Bulma.Components.Media exposing ( Media
                                       , media
                                       , toHtml
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Media.Section as Section exposing ( Section )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text )


-- MEDIA -----------------------------------------------------------------------

type alias Sections msg = List (Section msg)

type alias Media msg = Entity () (Maybe (Sections msg), Sections msg, Maybe (Sections msg)) msg

media : Attrs msg -> Sections msg -> Media msg
media = entity "article" [ "media" ] ()

left : Sections msg -> Media msg -> Media msg
left left_ = mapBody <| \(_,content,right) -> ( Just left_, content, right )

right : Sections msg -> Media msg -> Media msg
right right_ = mapBody <| \(left,content,_) -> ( left, content, Just right_ )

toSection : Media msg -> Section msg

-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Section msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \(left,content,right) ->
         mvalues
         [      left    |> Maybe.map (Section.addClass "media-left"    >> Section.toHtml)
         , Just content |> Maybe.map (Section.addClass "media-content" |> Section.toHtml)
         ,      right   |> Maybe.map (Section.addClass "media-right"   >> Section.toHtml)
         ]

{-| TODO
-}
addClass : String -> Section msg -> Section msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Section msg -> Section msg
setHelpers = Entity.setHelpers
