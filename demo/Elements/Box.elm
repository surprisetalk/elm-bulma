module Elements.Box exposing (..)

import Bulma.Elements as Elements exposing (..)
import Bulma.Layout as Layout exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Html exposing (Html, br, code, img, p, small, strong, text)
import Html.Attributes exposing (src)
import Page


view : Html msg
view =
    let
        title =
            "Box"

        subtitle =
            "A white box to contain other elements"

        codeHtml =
            Page.formatElmCode """
Elements.box  []
  [ Layout.media []
    [ Layout.mediaLeft [] [
      image imageModifiers []
        [ img [ src "https://bulma.io/images/placeholders/128x128.png" ] []
        ]]
    , Layout.mediaContent [] [
      p []
        [ strong [] [ text "John Smith " ]
        , small [] [ text "@johnsmith " ]
        , br [] []
        , text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis."]
      ]
  """

        boxExample =
            Elements.box []
                [ Layout.media []
                    [ Layout.mediaLeft []
                        [ image Natural
                            []
                            [ img [ src "https://bulma.io/images/placeholders/128x128.png" ] []
                            ]
                        ]
                    , Layout.mediaContent []
                        [ p []
                            [ strong [] [ text "John Smith " ]
                            , small [] [ text "@johnsmith " ]
                            , br [] []
                            , text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur sit amet massa fringilla egestas. Nullam condimentum luctus turpis."
                            ]
                        ]
                    ]
                , content Standard [] []
                ]

        body =
            content Standard
                []
                [ p [] [ text "The .box element is simply a container with a shadow, a border, a radius, and some padding. For example, you can include a media object:" ]
                , Page.example boxExample codeHtml
                ]
    in
    Page.template title subtitle body
