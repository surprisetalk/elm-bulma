module Page exposing (example, formatElmCode, sectionTitle, template)

import Bulma.Columns as Columns exposing (..)
import Bulma.Elements as Elements exposing (..)
import Bulma.Layout as Layout exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Html exposing (Html, a, hr, img, main_, span, text)
import Markdown


template : String -> String -> Html msg -> Html msg
template titleText subTitleText body =
    section NotSpaced
        []
        [ container []
            [ title H3 [] [ text titleText ]
            , subtitle H4 [] [ text subTitleText ]
            , hr [] []
            , body
            ]
        ]


formatElmCode : String -> Html msg
formatElmCode str =
    formatCode "elm" str


formatCode : String -> String -> Html msg
formatCode lang str =
    Markdown.toHtmlWith Markdown.defaultOptions
        []
        ("```" ++ lang ++ "\n" ++ String.trim str ++ "\n```")


example : Html msg -> Html msg -> Html msg
example example code =
    content Standard
        []
        [ columns columnsModifiers
            []
            [ column pageColumnModifiers [] [ example ]
            , column pageColumnModifiers [] [ code ]
            ]
        ]


pageColumnModifiers : ColumnModifiers
pageColumnModifiers =
    { offset = Auto
    , widths =
        { mobile = Just Auto
        , tablet = Just Width6
        , desktop = Just Width6
        , widescreen = Just Width6
        , fullHD = Just Width6
        }
    }


sectionTitle : String -> Html msg
sectionTitle title =
    Elements.title H4
        []
        [ a [] [ text "# " ] -- TODO set up anchor tags
        , text title
        ]
