module Overview.Start exposing (..)

import Bulma.Components as Components exposing (..)
import Bulma.Elements as Elements exposing (..)
import Bulma.Layout as Layout exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Html exposing (Html, a, br, code, img, li, p, small, strong, text, ul)
import Html.Attributes exposing (href)
import Page


view : Html msg
view =
    let
        title =
            "Getting Started"

        subtitle =
            "Elm-Bulma is a simple and beautiful front-end library."

        code =
            Page.formatElmCode """
module Example exposing (..)

import Bulma.CDN exposing (..)
import Bulma.Modifiers exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Columns exposing (..)
import Bulma.Layout exposing (..)
import Html exposing ( Html, main_, text )

type alias Model = {}

main : Program Never Model msg
main
  = Html.beginnerProgram
    { model = {}
    , view = view
    , update = \\msg -> \\model -> model
    }

view : Model -> Html msg
view model
  = main_ []
    [ stylesheet
    , exampleHero
    , exampleColumns
    ]

exampleHero : Html msg
exampleHero
  = hero { heroModifiers | size = Medium, color = Primary } []
    [ heroBody []
      [ container []
          [ title H1 [] [ text "Hero Title" ]
          , title H2 [] [ text "Hero Subtitle" ]
          ]
      ]
    ]

exampleColumns : Html msg
exampleColumns
  = section NotSpaced []
    [ container []
      [ columns columnsModifiers []
        [ column columnModifiers [] [ text "First Column" ]
        , column columnModifiers [] [ text "Second Column" ]
        , column columnModifiers [] [ text "Third Column" ]
        ]
      ]
    ]

            """

        body =
            content Standard
                []
                [ Elements.title H4 [] [ text "Documentation" ]
                , ul []
                    [ li []
                        [ text "learn about the components at "
                        , a [ href "bulma.io" ] [ text "bulma.io." ]
                        ]
                    , li []
                        [ text "for api information, head over to the "
                        , a [ href "http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest" ] [ text "elm package." ]
                        ]
                    ]
                , Elements.title H4 [] [ text "Getting Started" ]
                , ul []
                    [ li [] [ text "Make a new project: mkdir bulma-example && cd bulma-example" ]
                    , li [] [ text "Install the package: elm package install --yes surprisetalk/elm-bulma." ]
                    , li [] [ text "Create a new file Main.elm and copy the code below." ]
                    , li []
                        [ text "Start elm reactor and navigate to "
                        , a [ href "http://localhost:8000/" ] [ text "http://localhost:8000/" ]
                        ]
                    ]
                , code
                ]
    in
    Page.template title subtitle body
