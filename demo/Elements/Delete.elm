module Elements.Delete exposing (..)

import Bulma.Elements as Elements exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Html exposing (Html, br, code, h1, h2, hr, img, li, p, small, strong, text, ul)
import Page


view : Html msg
view =
    let
        title =
            "Delete"

        subtitle =
            "A versatile delete cross"

        body =
            content Standard
                []
                [ p [] [ text "The .delete element is a stand-alone element that can be used in different contexts." ]
                , p [] [ text "On its own, it's a simple circle with a cross:" ]
                , Page.example
                    (delete [] [])
                    (Page.formatElmCode "delete [] []")
                ]
    in
    Page.template title subtitle body
