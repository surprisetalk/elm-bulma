
module Bulma.Components.Media exposing ( Media
                                       , media
                                       , left
                                       , right
                                       , toSection
                                       , toHtml
                                       , addClass
                                       , setHelpers
                                       )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Media
@docs media

@docs left, right

@docs toSection

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Media.Section as Section exposing ( Section, section )

import Html exposing ( Html, Attribute, text )

import List exposing ( concat )


-- MEDIA -----------------------------------------------------------------------

{-| TODO
-}
type alias Sections msg = List (Section msg)

{-| TODO
-}
type alias Media msg = Entity () { left : Maybe (Sections msg), content : Sections msg, right : Maybe (Sections msg) } msg

{-| TODO
-}
media : Attrs msg -> Sections msg -> Media msg
media attrs content
  = entity "article" [ "media" ] () attrs
    { left    = Nothing
    , content = content
    , right   = Nothing
    }

{-| TODO
-}
left : Sections msg -> Media msg -> Media msg
left left_ = mapBody <| \body -> { body | left = Just left_ }

{-| TODO
-}
right : Sections msg -> Media msg -> Media msg
right right_ = mapBody <| \body -> { body | right = Just right_ }

{-| TODO
-}
toSection : Attrs msg -> Media msg -> Section msg
toSection attrs = toHtml >> ls >> section attrs

-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Media msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \{left,content,right} ->
         concat
       <| mvalues
         [      left    |> Maybe.map (List.map (Section.addClass "media-left"    >> Section.toHtml))
         , Just content |> Maybe.map (List.map (Section.addClass "media-content" >> Section.toHtml))
         ,      right   |> Maybe.map (List.map (Section.addClass "media-right"   >> Section.toHtml))
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
