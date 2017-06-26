
module Bulma.Components.Level.Item exposing ( Item
                                            , item
                                            , headingItem
                                            , fromImage
                                            , fromButton
                                            , fromTitle
                                            , fromIcon
                                            , fromField
                                            , toHtml
                                            , addClass
                                            , setHelpers
                                            )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Item
@docs item, headingItem
@docs fromImage, fromButton, fromTitle, fromIcon, fromField

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Image   as Image   exposing ( Image   )
import Bulma.Elements.Title   as Title   exposing ( Title   )
import Bulma.Elements.Button  as Button  exposing ( Button  )
import Bulma.Elements.Icon    as Icon    exposing ( Icon    )
import Bulma.Elements.Form    as Form    exposing ( Field   )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text, div, p )
import Html.Attributes exposing ( class )

import List exposing ( map )


-- LEVEL ITEM ------------------------------------------------------------------

{-| TODO
-}
type alias Heading msg = ( String, Title msg )

{-| TODO
-}
type Body msg = BodyHtmls    (Htmls    msg)
              | BodyImage    (Image    msg)
              | BodyTitle    (Title    msg)
              | BodyButton   (Button   msg)
              | BodyIcon     (Icon     msg)
              | BodyField    (Field    msg)
              | BodyHeading  (Heading  msg)

{-| TODO
-}
type alias Item msg = Entity () (Body msg) msg

{-| TODO
-}
item_ : Attrs msg -> Body msg -> Item msg
item_ = entity "div" [ "level-item" ] ()

{-| TODO
-}
item : Attrs msg -> Htmls msg -> Item msg
item = item_ |-~-> BodyHtmls

{-| TODO
-}
headingItem : Attrs msg -> String -> Title msg -> Item msg
headingItem attrs heading title = ( heading, title ) |> BodyHeading |> item_ attrs

{-| TODO
-}
fromImage : Attrs msg -> Image msg -> Item msg
fromImage = item_ |-~-> BodyImage

{-| TODO
-}
fromTitle : Attrs msg -> Title msg -> Item msg
fromTitle = item_ |-~-> BodyTitle

{-| TODO
-}
fromButton : Attrs msg -> Button msg -> Item msg
fromButton = item_ |-~-> BodyButton

{-| TODO
-}
fromIcon : Attrs msg -> Icon msg -> Item msg
fromIcon = item_ |-~-> BodyIcon

{-| TODO
-}
fromField : Attrs msg -> Field msg -> Item msg
fromField = item_ |-~-> BodyField

-- TODO: more elements


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Item msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \body ->
         case body of
           BodyHtmls    htmls    -> htmls
           BodyImage    image    -> image    |> ls |> map  Image.toHtml
           BodyButton   button   -> button   |> ls |> map Button.toHtml
           BodyIcon     icon     -> icon     |> ls |> map   Icon.toHtml
           BodyField    field    -> field    |> ls |> map   Form.toHtml
           BodyTitle    title    -> title    |> ls |> map  Title.toHtml
           BodyHeading  (h,t)    -> [ div []
                                     [ p [ class "heading" ] [ text h ]
                                     , t |> Title.toHtml
                                     ]
                                   ]

{-| TODO
-}
addClass : String -> Item msg -> Item msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Item msg -> Item msg
setHelpers = Entity.setHelpers
