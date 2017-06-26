
module Bulma.Components.Card.Cardlet exposing ( Cardlet
                                              , titleHeader
                                              , iconHeader, easyIconHeader
                                              , iconTitleHeader, easyIconTitleHeader
                                              , image
                                              , content, fromBox, fromMedia
                                              , footer
                                              , toHtml, addClass, setHelpers
                                              )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Cardlet

@docs titleHeader
@docs iconHeader, easyIconHeader
@docs iconTitleHeader, easyIconTitleHeader

@docs image

@docs content, fromBox, fromMedia

@docs footer

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Media as Media exposing ( Media )
import Bulma.Elements.Image as Image exposing ( Image )
import Bulma.Elements.Icon  as Icon  exposing ( Icon  )
import Bulma.Elements.Box   as Box   exposing ( Box   )

import Html exposing ( Html, Attribute, text, p, a )
import Html.Events exposing ( onClick )
import Html.Attributes exposing ( class )

import List exposing ( map )

import Tuple exposing ( mapSecond )


-- CARDLET ---------------------------------------------------------------------

{-| TODO
-}
type Cardlet msg = CardletScrapHeader  (CardletHeader  msg)
                 | CardletScrapImage   (CardletImage   msg)
                 | CardletScrapContent (CardletContent msg)
                 | CardletScrapFooter  (CardletFooter  msg)
                   

-- HEADER --

{-| TODO
-}
type alias CardletHeaderBody msg = { title : Maybe String
                                   , icon  : Maybe ((Icon msg), Maybe msg )
                                   }

{-| TODO
-}
type alias CardletHeader msg = Entity () (CardletHeaderBody msg) msg

{-| TODO
-}
header_ : Attrs msg -> CardletHeaderBody msg -> Cardlet msg
header_ attrs = entity "header" [ "card-header" ] () attrs >> CardletScrapHeader

{-| TODO
-}
titleHeader : Attrs msg -> String -> Cardlet msg
titleHeader attrs title = header_ attrs { title = Just title, icon = Nothing }

{-| TODO
-}
iconHeader : Attrs msg -> ( Icon msg, msg ) -> Cardlet msg
iconHeader attrs icon = header_ attrs { title = Nothing, icon = icon |> mapSecond Just |> Just }

{-| TODO
-}
easyIconHeader : Icon msg -> Cardlet msg
easyIconHeader icon = header_ [] { title = Nothing, icon = Just ( icon, Nothing ) }

{-| TODO
-}
iconTitleHeader : Attrs msg -> ( Icon msg, msg ) -> String -> Cardlet msg
iconTitleHeader attrs icon title = header_ attrs { title = Just title, icon = Just <| mapSecond Just <| icon }

{-| TODO
-}
easyIconTitleHeader : Icon msg -> String -> Cardlet msg
easyIconTitleHeader icon title = header_ [] { title = Just title, icon = Just ( icon, Nothing ) }


-- IMAGE --

{-| TODO
-}
type alias CardletImage msg = Entity () (Image msg) msg

{-| TODO
-}
image : Attrs msg -> Image msg -> Cardlet msg
image attrs = entity "div" [ "card-image" ] () attrs >> CardletScrapImage


-- CONTENT --

{-| TODO
-}
type CardletContentBody msg = CardletContentHtmls (Htmls msg)
                            | CardletContentMedia (Media msg)
                            | CardletContentBox   (Box   msg)

{-| TODO
-}
type alias CardletContent msg = Entity () (CardletContentBody msg) msg

{-| TODO
-}
content_ : Attrs msg -> CardletContentBody msg -> Cardlet msg
content_ attrs = entity "div" [ "card-content" ] () attrs >> CardletScrapContent

{-| TODO
-}
content : Attrs msg -> Htmls msg -> Cardlet msg
content attrs = CardletContentHtmls >> content_ attrs
          
{-| TODO
-}
fromBox : Attrs msg -> Box msg -> Cardlet msg
fromBox attrs = CardletContentBox >> content_ attrs

{-| TODO
-}
fromMedia : Attrs msg -> Media msg -> Cardlet msg
fromMedia attrs = CardletContentMedia >> content_ attrs

-- TODO: other components/elements


-- FOOTER --

{-| TODO
-}
type alias CardletFooter msg = Entity () (List (Htmls msg)) msg

{-| TODO
-}
footer : Attrs msg -> List (Htmls msg) -> Cardlet msg
footer attrs = entity "p" [ "card-footer" ] () attrs >> CardletScrapFooter


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Cardlet msg -> Html msg
toHtml cardlet
  = case cardlet of

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
            CardletContentMedia media -> media |> Media.toHtml |> ls
            CardletContentBox   box   -> box   |>   Box.toHtml |> ls

      CardletScrapFooter footer -> 

        footer |> Entity.toHtml (y []) (y []) (map (p [ class "card-footer-item" ]))


{-| TODO
-}
addClass : String -> Cardlet msg -> Cardlet msg
addClass c cardlet
  = case cardlet of
      CardletScrapHeader   header -> CardletScrapHeader  <| Entity.addClass c header
      CardletScrapImage     image -> CardletScrapImage   <| Entity.addClass c image
      CardletScrapContent content -> CardletScrapContent <| Entity.addClass c content
      CardletScrapFooter   footer -> CardletScrapFooter  <| Entity.addClass c footer


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Cardlet msg -> Cardlet msg
setHelpers helpers cardlet
  = case cardlet of
      CardletScrapHeader   header -> CardletScrapHeader  <| Entity.setHelpers helpers header
      CardletScrapImage     image -> CardletScrapImage   <| Entity.setHelpers helpers image
      CardletScrapContent content -> CardletScrapContent <| Entity.setHelpers helpers content
      CardletScrapFooter   footer -> CardletScrapFooter  <| Entity.setHelpers helpers footer
