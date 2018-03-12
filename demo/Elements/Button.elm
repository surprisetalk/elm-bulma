module Elements.Button exposing (..)

import Bulma.Elements as Elements exposing (..)
import Bulma.Form as Form exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Html exposing (Html, div, hr, i, p, span, strong, text)
import Html.Attributes exposing (class)
import Page


view : Html msg
view =
    let
        title =
            "Button"

        subtitle =
            "The classic button, in different colors, sizes, and states"

        body =
            content Standard
                []
                [ p []
                    [ text "The "
                    , strong [] [ text "button " ]
                    , text "is an essential element of any design. It's meant to look and behave as an "
                    , strong [] [ text "interactive " ]
                    , text "element of your page. Button"
                    ]
                , Page.example
                    (button buttonModifiers [] [ text "Button" ])
                    (Page.formatElmCode "button buttonModifiers [] [ text \"Button\" ]")
                , hr [] []
                , Page.sectionTitle "Color"
                , Page.example
                    (buttons Left
                        []
                        [ button { buttonModifiers | color = White } [] [ text "White" ]
                        , button { buttonModifiers | color = Light } [] [ text "Light" ]
                        , button { buttonModifiers | color = Dark } [] [ text "Dark" ]
                        , button { buttonModifiers | color = Black } [] [ text "Black" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | color = White } [] [ text "White" ]
, button { buttonModifiers | color = Light } [] [ text "Light" ]
, button { buttonModifiers | color = Dark } [] [ text "Dark" ]
, button { buttonModifiers | color = Black } [] [ text "Black" ]
]
                                   """)
                , Page.example
                    (buttons Left
                        []
                        [ button { buttonModifiers | color = Primary } [] [ text "Primary" ]
                        , button { buttonModifiers | color = Link } [] [ text "Link" ]
                        , button { buttonModifiers | color = Info } [] [ text "Info" ]
                        , button { buttonModifiers | color = Success } [] [ text "Success" ]
                        , button { buttonModifiers | color = Warning } [] [ text "Warning" ]
                        , button { buttonModifiers | color = Danger } [] [ text "Danger" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | color = Primary } [] [ text "Primary" ]
, button { buttonModifiers | color = Link } [] [ text "Link" ]
, button { buttonModifiers | color = Info } [] [ text "Info" ]
, button { buttonModifiers | color = Success } [] [ text "Success" ]
, button { buttonModifiers | color = Warning } [] [ text "Warning" ]
, button { buttonModifiers | color = Danger } [] [ text "Danger" ]
]
                                   """)
                , hr [] []
                , Page.sectionTitle "Sizes"
                , Page.example
                    (buttons Left
                        []
                        [ button { buttonModifiers | size = Small } [] [ text "Size" ]
                        , button { buttonModifiers | size = Standard } [] [ text "Standard" ]
                        , button { buttonModifiers | size = Medium } [] [ text "Medium" ]
                        , button { buttonModifiers | size = Large } [] [ text "Large" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | size = Small } [] [ text "Size" ]
, button { buttonModifiers | size = Standard } [] [ text "Standard" ]
, button { buttonModifiers | size = Medium } [] [ text "Medium" ]
, button { buttonModifiers | size = Large } [] [ text "Large" ]
]
                                   """)
                , hr [] []
                , Page.sectionTitle "Styles"
                , p [] [ text "Outlined" ]
                , Page.example
                    (buttons Left
                        []
                        [ button { buttonModifiers | outlined = True } [] [ text "Outlined" ]
                        , button { buttonModifiers | outlined = True, color = Primary } [] [ text "Outlined" ]
                        , button { buttonModifiers | outlined = True, color = Link } [] [ text "Outlined" ]
                        , button { buttonModifiers | outlined = True, color = Info } [] [ text "Outlined" ]
                        , button { buttonModifiers | outlined = True, color = Success } [] [ text "Outlined" ]
                        , button { buttonModifiers | outlined = True, color = Warning } [] [ text "Outlined" ]
                        , button { buttonModifiers | outlined = True, color = Danger } [] [ text "Outlined" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | outlined = True } [] [ text "Outlined" ]
, button { buttonModifiers | outlined = True, color = Primary } [] [ text "Outlined" ]
, button { buttonModifiers | outlined = True, color = Link } [] [ text "Outlined" ]
, button { buttonModifiers | outlined = True, color = Info } [] [ text "Outlined" ]
, button { buttonModifiers | outlined = True, color = Success } [] [ text "Outlined" ]
, button { buttonModifiers | outlined = True, color = Warning } [] [ text "Outlined" ]
, button { buttonModifiers | outlined = True, color = Danger } [] [ text "Outlined" ]
]
                                   """)
                , p [] [ text "Inverted (the text color becomes the background color, and vice-versa) Inverted" ]
                , Page.example
                    (notification Primary
                        []
                        [ button { buttonModifiers | inverted = True } [] [ text "Inverted" ]
                        , button { buttonModifiers | inverted = True, color = Primary } [] [ text "Inverted" ]
                        , button { buttonModifiers | inverted = True, color = Link } [] [ text "Inverted" ]
                        , button { buttonModifiers | inverted = True, color = Info } [] [ text "Inverted" ]
                        , button { buttonModifiers | inverted = True, color = Success } [] [ text "Inverted" ]
                        , button { buttonModifiers | inverted = True, color = Warning } [] [ text "Inverted" ]
                        , button { buttonModifiers | inverted = True, color = Danger } [] [ text "Inverted" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | inverted = True } [] [ text "Inverted" ]
, button { buttonModifiers | inverted = True, color = Primary } [] [ text "Inverted" ]
, button { buttonModifiers | inverted = True, color = Link } [] [ text "Inverted" ]
, button { buttonModifiers | inverted = True, color = Info } [] [ text "Inverted" ]
, button { buttonModifiers | inverted = True, color = Success } [] [ text "Inverted" ]
, button { buttonModifiers | inverted = True, color = Warning } [] [ text "Inverted" ]
, button { buttonModifiers | inverted = True, color = Danger } [] [ text "Inverted" ]
]
                                  """)
                , p [] [ text "Invert Outlined (the invert color becomes the text and border colors) Invert Outlined" ]
                , Page.example
                    (notification Primary
                        []
                        [ button { buttonModifiers | outlined = True, inverted = True } [] [ text "Inverted" ]
                        , button { buttonModifiers | outlined = True, inverted = True, color = Primary } [] [ text "Inverted" ]
                        , button { buttonModifiers | outlined = True, inverted = True, color = Link } [] [ text "Inverted" ]
                        , button { buttonModifiers | outlined = True, inverted = True, color = Info } [] [ text "Inverted" ]
                        , button { buttonModifiers | outlined = True, inverted = True, color = Success } [] [ text "Inverted" ]
                        , button { buttonModifiers | outlined = True, inverted = True, color = Warning } [] [ text "Inverted" ]
                        , button { buttonModifiers | outlined = True, inverted = True, color = Danger } [] [ text "Inverted" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | outlined = True, inverted = True } [] [ text "Inverted" ]
, button { buttonModifiers | outlined = True, inverted = True, color = Primary } [] [ text "Inverted" ]
, button { buttonModifiers | outlined = True, inverted = True, color = Link } [] [ text "Inverted" ]
, button { buttonModifiers | outlined = True, inverted = True, color = Info } [] [ text "Inverted" ]
, button { buttonModifiers | outlined = True, inverted = True, color = Success } [] [ text "Inverted" ]
, button { buttonModifiers | outlined = True, inverted = True, color = Warning } [] [ text "Inverted" ]
, button { buttonModifiers | outlined = True, inverted = True, color = Danger } [] [ text "Inverted" ]
]
                                  """)
                , p [] [ text "Rounded Buttons" ]
                , Page.example
                    (buttons Left
                        []
                        [ button { buttonModifiers | rounded = True } [] [ text "Inverted" ]
                        , button { buttonModifiers | rounded = True, color = Primary } [] [ text "Rounded" ]
                        , button { buttonModifiers | rounded = True, color = Link } [] [ text "Inverted" ]
                        , button { buttonModifiers | rounded = True, color = Info } [] [ text "Inverted" ]
                        , button { buttonModifiers | rounded = True, color = Success } [] [ text "Inverted" ]
                        , button { buttonModifiers | rounded = True, color = Warning } [] [ text "Inverted" ]
                        , button { buttonModifiers | rounded = True, color = Danger } [] [ text "Inverted" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | rounded = True } [] [ text "Inverted" ]
, button { buttonModifiers | rounded = True, color = Primary } [] [ text "Rounded" ]
, button { buttonModifiers | rounded = True, color = Link } [] [ text "Inverted" ]
, button { buttonModifiers | rounded = True, color = Info } [] [ text "Inverted" ]
, button { buttonModifiers | rounded = True, color = Success } [] [ text "Inverted" ]
, button { buttonModifiers | rounded = True, color = Warning } [] [ text "Inverted" ]
, button { buttonModifiers | rounded = True, color = Danger } [] [ text "Inverted" ]
]
                                  """)
                , hr [] []
                , Page.sectionTitle "States"
                , Page.example
                    (p []
                        [ button { buttonModifiers | state = Blur } [] [ text "Blur" ]
                        , button { buttonModifiers | state = Hover } [] [ text "Hover" ]
                        , button { buttonModifiers | state = Focus } [] [ text "Focus" ]
                        , button { buttonModifiers | state = Active } [] [ text "Active" ]
                        , button { buttonModifiers | state = Loading } [] [ text "Loading" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | state = Blur  } [] [ text "Blur" ]
, button { buttonModifiers | state = Hover  } [] [ text "Hover" ]
, button { buttonModifiers | state = Focus } [] [ text "Focus" ]
, button { buttonModifiers | state = Active } [] [ text "Active" ]
, button { buttonModifiers | state = Loading } [] [ text "Loading" ]
]
                                   """)
                , Page.example
                    (buttons Left
                        []
                        [ button { buttonModifiers | state = Blur, color = Primary } [] [ text "Blur" ]
                        , button { buttonModifiers | state = Hover, color = Primary } [] [ text "Hover" ]
                        , button { buttonModifiers | state = Focus, color = Primary } [] [ text "Focus" ]
                        , button { buttonModifiers | state = Active, color = Primary } [] [ text "Active" ]
                        , button { buttonModifiers | state = Loading, color = Primary } [] [ text "Loading" ]
                        ]
                    )
                    (Page.formatElmCode """
[ button { buttonModifiers | state = Blur, color = Primary   } [] [ text "Blur" ]
, button { buttonModifiers | state = Hover, color = Primary   } [] [ text "Hover" ]
, button { buttonModifiers | state = Focus, color = Primary  } [] [ text "Focus" ]
, button { buttonModifiers | state = Active, color = Primary  } [] [ text "Active" ]
, button { buttonModifiers | state = Loading, color = Primary  } [] [ text "Loading" ]
]
                                   """)
                , hr [] []
                , Page.sectionTitle "Icon"
                , p [] [ text "With Font Awesome icons" ]
                , Page.example
                    (buttons Left
                        []
                        [ button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-bold" ] [] ] ]
                        , button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-italic" ] [] ] ]
                        , button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-underline" ] [] ] ]
                        ]
                    )
                    (Page.formatElmCode """
[  button buttonModifiers []
    [ Elements.icon Standard [] [ i [class "fa fa-bold"] [] ] ]
,  button buttonModifiers []
    [ Elements.icon Standard [] [ i [class "fa fa-italic"] [] ] ]
,  button buttonModifiers []
    [ Elements.icon Standard [] [ i [class "fa fa-underline"] [] ] ]
]
                                   """)
                , Page.example
                    (buttons Left
                        []
                        [ button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-github" ] [] ]
                            , span [] [ text "Github" ]
                            ]
                        , button { buttonModifiers | color = Primary }
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-twitter" ] [] ]
                            , span [] [ text "Twitter" ]
                            ]
                        , button { buttonModifiers | color = Success }
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-check" ] [] ]
                            , span [] [ text "Save" ]
                            ]
                        , button { buttonModifiers | color = Danger }
                            []
                            [ span [] [ text "Delete" ]
                            , Elements.icon Standard [] [ i [ class "fa fa-check" ] [] ]
                            ]
                        ]
                    )
                    (Page.formatElmCode """
[ button buttonModifiers []
[ Elements.icon Standard [] [ i [ class "fa fa-github" ] [] ]
, span [] [ text "Github" ]
]
, button {buttonModifiers | color = Primary } []
[ Elements.icon Standard [] [ i [ class "fa fa-twitter" ] [] ]
, span [] [ text "Twitter" ]
]
, button {buttonModifiers | color = Success } []
[ Elements.icon Standard [] [ i [ class "fa fa-check" ] [] ]
, span [] [ text "Save" ]
]
, button {buttonModifiers | color = Danger } []
[ span [] [ text "Delete" ]
, Elements.icon Standard [] [ i [ class "fa fa-check" ] [] ]
]
]
                                   """)
                , hr [] []
                , Page.sectionTitle "Button Group"
                , p [] [ text "If you want to group buttons together on a single line " ]
                , Page.example
                    (fields Centered
                        []
                        [ controlButton { buttonModifiers | color = Primary } [] [] [ text "Save Changes" ]
                        , controlButton { buttonModifiers | color = Link } [] [] [ text "Cancel" ]
                        , controlButton { buttonModifiers | color = Danger } [] [] [ text "Delete Post" ]
                        ]
                    )
                    (Page.formatElmCode """
  (buttons Centered []
  [ controlButton { buttonModifiers | color = Primary } [] [] [ text "Save Changes" ]
  , controlButton { buttonModifiers | color = Link } [] [] [ text "Cancel" ]
  , controlButton { buttonModifiers | color = Danger } [] [] [ text "Delete Post" ]
  ])
                                   """)
                , hr [] []
                , Page.sectionTitle "Connected Button (Add-ins)"
                , p [] [ text "If you want to use buttons as addons" ]
                , Page.example
                    (connectedButtons Centered
                        []
                        [ button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-align-left" ] [] ]
                            , span [] [ text "Left" ]
                            ]
                        , button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-align-center" ] [] ]
                            , span [] [ text "Center" ]
                            ]
                        , button buttonModifiers
                            []
                            [ Elements.icon Standard [] [ i [ class "fa fa-align-right" ] [] ]
                            , span [] [ text "Right" ]
                            ]
                        ]
                    )
                    (Page.formatElmCode """
(connectedButtons Centered []
[ button buttonModifiers []
  [ Elements.icon Standard [] [ i [ class "fa fa-align-left" ] [] ]
  , span [] [ text "Left" ]
  ]
, button buttonModifiers []
  [ Elements.icon Standard [] [ i [ class "fa fa-align-center" ] [] ]
  , span [] [ text "Center" ]
  ]
, button buttonModifiers []
  [ Elements.icon Standard [] [ i [ class "fa fa-align-right" ] [] ]
  , span [] [ text "Right" ]
  ]
  ])
                                   """)
                , hr [] []
                , Page.sectionTitle "List of Buttons"
                , p [] [ text "You can now create a list of buttons with the .buttons container." ]
                , Page.example
                    (buttons Centered
                        []
                        [ button { buttonModifiers | color = Primary } [] [ text "Save Changes" ]
                        , button { buttonModifiers | color = Link } [] [ text "Cancel" ]
                        , button { buttonModifiers | color = Danger } [] [ text "Delete Post" ]
                        ]
                    )
                    (Page.formatElmCode """
  (buttons Centered []
  [ button { buttonModifiers | color = Primary } [] [ text "Save Changes" ]
  , button { buttonModifiers | color = Link } [] [ text "Cancel" ]
  , button { buttonModifiers | color = Danger } [] [ text "Delete Post" ]
  ])
                                   """)
                ]
    in
    Page.template title subtitle body
