
module Bulma.Components.Card.Cardlet exposing ( Cardlet
                                              )

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Media as Media exposing ( Media )
import Bulma.Elements.Image as Image exposing ( Image )
import Bulma.Elements.Icon  as Icon  exposing ( Icon  )
import Bulma.Elements.Box   as Box   exposing ( Box   )

import Html exposing ( Html, Attribute, text )

import Tuple exposing ( mapSecond )


-- CARDLET ---------------------------------------------------------------------

type CardletScrap msg = CardletScrapHeader  (CardletHeader  msg)
                      | CardletScrapImage   (CardletImage   msg)
                      | CardletScrapContent (CardletContent msg)
                      | CardletScrapFooter  (CardletFooter  msg)

type alias Cardlet msg = Entity () (CardletScrap msg) msg


-- HEADER --

type alias CardletHeaderBody msg = { title : Maybe String
                                   , icon  : Maybe ((Icon msg), Maybe msg )
                                   }

type alias CardletHeader msg = Entity () (CardletHeaderBody msg) msg

header_ : Attrs msg -> CardletHeaderBody msg -> Cardlet msg
header_ attrs = entity "header" [ "card-header" ] () attrs >> CardletScrapHeader

titleHeader : Attrs msg -> String -> Cardlet msg
titleHeader attrs title = header_ attrs { title = Just title, icon = Nothing }

iconHeader : Attrs msg -> ( Icon msg, msg ) -> Cardlet msg
iconHeader attrs icon = header_ attrs { title = Nothing, icon = icon |> mapSecond Just |> Just }

easyIconHeader : Icon msg -> Cardlet msg
easyIconHeader icon = header_ [] { title = Nothing, icon = ( icon, Nothing ) }

iconTitleHeader : Attrs msg -> ( Icon msg, msg ) -> String -> Cardlet msg
iconTitleHeader attrs icon title = header_ attrs { title = Just title, icon = Just icon }

easyIconTitleHeader : Icon msg -> String -> Cardlet msg
easyIconTitleHeader icon title = header_ [] { title = Just title, icon = Just ( icon, Nothing ) }


-- IMAGE --

type alias CardletImage msg = Entity () (Image msg) msg

image : Image msg -> Cardlet msg
image = entity "div" [ "card-image" ] () >> CardletScrapImage


-- CONTENT --

type CardletContentBody msg = CardletContentHtmls (Htmls msg)
                            | CardletContentMedia (Media msg)
                            | CardletContentBox   (Box   msg)

type alias CardletContent msg = Entity () (CardletContentBody msg) msg

content_ : Attrs msg -> CardletContentBody msg -> Cardlet msg
content_ attrs body = entity "div" [ "card-content" ] attrs body >> CardletScrapContent

content : Attrs msg -> Htmls msg -> Cardlet msg
content attrs = CardletContentHtmls >> content_ attrs
          
fromBox : Attrs msg -> Box msg -> Cardlet msg
fromBox attrs = CardletContentBox >> content_ attrs

fromMedia : Media msg -> Cardlet msg
fromMedia attrs = CardletContentMedia >> content_ attrs

-- TODO: other components/elements


-- FOOTER --

type alias CardletFooter msg = Entity () (List (Htmls msg)) msg

footer : Attrs msg -> List (Htmls msg) -> Cardlet msg
footer attrs htmls = entity "p" [ "card-footer" ] () attrs htmls >> CardletScrapFooter


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Tag msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| map
       <| \scrap -> 
         case scrap of

           CardletScrapHeader header -> 

             flip (Entity.toHtml (y []) (y [])) header
             <| \{title,icon} ->
               mvalues
               [ title |> Maybe.map (text >> ls >> p [ class "card-header-title" ])
               , case icon of
                   Nothing                 -> Nothing
                   Just ( icon, Nothing  ) -> p [ class "card-header-icon"              ] [ Icon.toHtml icon ] |> Just
                   Just ( icon, Just msg ) -> a [ class "card-header-icon", onClick msg ] [ Icon.toHtml icon ] |> Just
               ]

           CardletScrapImage image -> 

             image |> Entity.toHtml (y []) (y []) (Image.toHtml >> ls)

           CardletScrapContent content -> 

             flip (Entity.toHtml (y []) (y [])) content
             <| \body ->
               case body of
                 CardletContentHtmls htmls -> htmls
                 CardletContentMedia media -> media |> Media.toHtml
                 CardletContentBox   box   -> box   |>   Box.toHtml

           CardletScrapFooter footer -> 

             footer <| Entity.toHtml (y []) (y []) (map (p [ class "card-footer-item" ]))


{-| TODO
-}
addClass : String -> Tag msg -> Tag msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tag msg -> Tag msg
setHelpers = Entity.setHelpers
