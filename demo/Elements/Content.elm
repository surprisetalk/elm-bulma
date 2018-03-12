module Elements.Content exposing (..)

import Bulma.Elements as Elements exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Html exposing (Html, br, code, h1, h2, hr, img, li, p, small, strong, text, ul)
import Page


view : Html msg
view =
    let
        title =
            "Content"

        subtitle =
            "A single class to handle WYSIWYG generated content, where only HTML tags are available"

        innerContent =
            [ h1 [] [ text "Hello World" ]
            , p [] [ text "Lorem ipsum[1] dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Subscript works as well!" ]
            , h2 [] [ text "Second Level " ]
            , p [] [ text "Curabitur accumsan turpis pharetra augue tincidunt blandit. Quisque condimentum maximus mi, sit amet commodo arcu rutrum id. Proin pretium urna vel cursus venenatis. Suspendisse potenti. Etiam mattis sem rhoncus lacus dapibus facilisis. Donec at dignissim dui. Ut et neque nisl." ]
            , ul []
                [ li [] [ text "In fermentum leo eu lectus mollis, quis dictum mi aliquet." ]
                , li [] [ text "Morbi eu nulla lobortis, lobortis est in, fringilla felis." ]
                , li [] [ text "Aliquam nec felis in sapien venenatis viverra fermentum nec lectus." ]
                , li [] [ text "Ut non enim metus." ]
                ]
            ]

        body =
            content Standard
                []
                [ p []
                    [ text "This content class can be used in any context where you just want to (or can only) write some "
                    , strong [] [ text "text. " ]
                    , text "For example, it's used for the paragraph you're currently reading."
                    ]
                , Page.example
                    (content Standard [] innerContent)
                    (Page.formatElmCode "content Standard [] [ ... ]")
                , hr [] []
                , Page.sectionTitle "Sizes"
                , Page.example
                    (content Small [] innerContent)
                    (Page.formatElmCode "content Small [] [ ... ]")
                , Page.example
                    (content Medium [] innerContent)
                    (Page.formatElmCode "content Medium [] [ ... ]")
                , Page.example
                    (content Large [] innerContent)
                    (Page.formatElmCode "content Large [] [ ... ]")
                ]
    in
    Page.template title subtitle body
