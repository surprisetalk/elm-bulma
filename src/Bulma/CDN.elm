
module Bulma.CDN exposing ( stylesheet, fontAwesome )


-- DOCS ------------------------------------------------------------------------

{-| 
@docs stylesheet
@docs fontAwesome
-}

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, node )
import Html.Attributes exposing ( rel, href )


-- STYLESHEET ------------------------------------------------------------------

{-| Include Bulma 0.6.2 in your Elm project.

    import Bulma.CDN exposing (stylesheet)

    view : Model -> Html msg
    view model
      = div []
        [ stylesheet
        , text "wow!"
        ]

-}
stylesheet : Html msg
stylesheet =
  node "link"
  [ rel  "stylesheet"
  , href "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.2/css/bulma.min.css"
  ]
  []


-- FONT AWESOME ----------------------------------------------------------------

{-| Include Font Awesome 4.7.0 in your Elm project.

    import Bulma.CDN exposing (fontAwesome)
    import Bulma.Modifiers exposing (Size(Large))
    import Bulma.Elements.Icon exposing (icon,meh_o)

    view : Model -> Html msg
    view model
      = div []
        [ fontAwesome
        , icon Large [] 
          [ meh_o
          ]
        ]

-}
fontAwesome : Html msg
fontAwesome =
  node "link"
  [ rel "stylesheet"
  , href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
  ]
  []
