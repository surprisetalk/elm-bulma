module Elements.Icon exposing (..)

import Bulma.Elements as Elements exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Bulma.Modifiers.Typography as Typography exposing (textColor)
import Html exposing (Html, br, code, h1, h2, hr, i, img, li, p, small, span, strong, text, ul)
import Html.Attributes exposing (class)
import Page


view : Html msg
view =
    let
        title =
            "Icon"

        subtitle =
            "Bulma is compatible with all icon font libraries: Font Awesome 5, Font Awesome 4, Material Design Icons, Open Iconic, Ionicons etc."

        body =
            content Standard
                []
                [ p [] [ text "The icon element is a container for any type of icon font. Because the icons can take a few seconds to load, and because you want control over the space the icons will take, you can use the icon class as a reliable square container that will prevent the page to \"jump\" on page load." ]
                , Page.example
                    (Elements.icon Standard [] [ i [ class "fa fa-home" ] [] ])
                    (Page.formatElmCode """
Elements.icon Standard []
  [ i [ class "fa fa-home" ] []
                                """)
                , hr [] []
                , Page.sectionTitle "Color"
                , p [] [ text "Since icon fonts are simply text, you can use the text color modifiers to change the icon's color." ]
                , Page.example
                    (p []
                        [ Elements.icon Standard
                            [ textColor Typography.Info ]
                            [ i [ class "fa fa-info-circle" ] [] ]
                        , Elements.icon Standard
                            [ textColor Typography.Success ]
                            [ i [ class "fa fa-check-square" ] [] ]
                        , Elements.icon Standard
                            [ textColor Typography.Warning ]
                            [ i [ class "fa fa-exclamation-triangle" ] [] ]
                        , Elements.icon Standard
                            [ textColor Typography.Danger ]
                            [ i [ class "fa fa-ban" ] [] ]
                        ]
                    )
                    (Page.formatElmCode """
  [Elements.icon Standard
    [textColor Typography.Info]
    [ i [ class "fa fa-info-circle" ] [] ]
  , Elements.icon Standard
    [textColor Typography.Success]
    [ i [ class "fa fa-check-square" ] [] ]
  , Elements.icon Standard
    [textColor Typography.Warning]
    [ i [ class "fa fa-exclamation-triangle" ] [] ]
  , Elements.icon Standard
    [textColor Typography.Danger]
    [ i [ class "fa fa-ban" ] [] ]
  ]
                                """)
                ]
    in
    Page.template title subtitle body
