module NotFound404 exposing (..)

import Html exposing (Html)
import Page


view : Html msg
view =
    let
        title =
            "Page not Found"

        subtitle =
            "Elm-Bulma is a simple and beautiful front-end library."

        body =
            Html.text ""
    in
    Page.template title subtitle body
