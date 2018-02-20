
module Bulma.CDN exposing (..)


-- DOCS ------------------------------------------------------------------------

{-| 
@docs stylesheet
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
