
Elm-Bulma is a simple and beautiful front-end library.

## Documentation
- Learn about the components at [bulma.io](http://bulma.io/).
- For API information, head over to the [Elm package](http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest).

## Getting Started
1. Make a new project: `mkdir bulma-example && cd bulma-example`.
2. Install the package: `elm package install --yes surprisetalk/elm-bulma`.
3. Create a new file `Main.elm` and copy the code below.
4. Start `elm reactor` and navigate to [http://localhost:8000/Main.elm](http://localhost:8000).

``` elm
module Main exposing (..)

import Bulma.CDN exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Grid as Grid exposing (..)
import Bulma.Layout exposing (..)
import Html
    exposing
        ( Html
        , main_
        , text
        )


type Model
    = NoModel


main =
    Html.beginnerProgram
        { model = NoModel
        , view = view
        , update = \msg -> \model -> model
        }


view : Model -> Html msg
view model =
    main_ []
        [ stylesheet
        , section Spaced [] [ exampleHero ]
        , section Spaced [] [ exampleGrid ]
        ]


exampleHero : Html msg
exampleHero =
    Grid.columns columnsModifiers
        []
        [ hero heroModifiers
            []
            [ heroBody []
                [ container []
                    [ title H1 [] [ text "Hero Title" ]
                    , title H2 [] [ text "Hero Subtitle" ]
                    ]
                ]
            ]
        ]


exampleGrid : Html msg
exampleGrid =
    Grid.columns columnsModifiers
        []
        [ column columnModifiers [] [ text "First Column" ]
        , column columnModifiers [] [ text "Second Column" ]
        , column columnModifiers [] [ text "Third Column" ]
        ]
```

## Contributions
- Feel free to [report bugs on Github](https://github.com/surprisetalk/elm-bulma/issues).
- If you have any suggestions on how to make the API more friendly, please reach out to me at [surprisetalk@gmail.com](surprisetalk@gmail.com).

## Friends
- [elm-bootstrap](http://package.elm-lang.org/packages/rundis/elm-bootstrap/latest)
- [elm-bulma-classes](http://package.elm-lang.org/packages/danielnarey/elm-bulma-classes/latest/BulmaClasses)

## Next Steps
- Adding the remaining Bulma `0.5.3` components.
- Improving documentation.
- Cleaning the codebase.
- Making the library web-accessible by default, using the [elm-html-a11y](http://package.elm-lang.org/packages/tesk9/elm-html-a11y/latest) package.
