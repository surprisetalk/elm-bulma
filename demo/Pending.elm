module Pending exposing (..)

import Bulma.Components as Base
import Bulma.Modifiers exposing (Color(..))
import Helpers exposing (..)
import Html exposing (Attribute, Html)
import Html.Attributes exposing (class)


--------------
-- Modifiers
------------
-- SHADOW ------------------------------------------------------------------


{-| Adds shadow.
-}
shadow : Attribute msg
shadow =
    class "has-shadow"



-------------
-- Components
---------


type alias NavbarModifiers =
    { color : Color
    , transparent : Bool
    , shadow : Bool
    }


pendingNavbarModifiers : NavbarModifiers
pendingNavbarModifiers =
    { color = Default
    , transparent = False
    , shadow = False
    }


navbar : NavbarModifiers -> List (Attribute msg) -> List (Base.NavbarSection msg) -> Base.Navbar msg
navbar { color, transparent, shadow } =
    node "nav"
        []
        [ "navbar"
        , case transparent of
            True ->
                "is-transparent"

            _ ->
                ""
        , case color of
            Default ->
                ""

            White ->
                "is-white"

            Light ->
                "is-light"

            Dark ->
                "is-dark"

            Black ->
                "is-black"

            Primary ->
                "is-primary"

            Link ->
                "is-link"

            Info ->
                "is-info"

            Success ->
                "is-success"

            Warning ->
                "is-warning"

            Danger ->
                "is-danger"
        , case shadow of
            True ->
                "has-shadow"

            _ ->
                ""
        ]


{-| A tab variant of `navbar`.
-}
navbarTabs : List (Attribute msg) -> List (Html msg) -> Base.NavbarItem msg
navbarTabs =
    node "div" [] [ "navbar-tabs" ]


{-| This element is a child of `navbarTabs`.
based on an <div> tag
-}
navbarTab : Base.IsActive -> List (Attribute msg) -> List (Html msg) -> Base.NavbarItem msg
navbarTab isActive =
    node "div"
        []
        [ "navbar-item is-tab"
        , if isActive then
            "is-active"
          else
            ""
        ]


{-| This element is a child of `navbarTabs`.
based on an <a> tag
-}
navbarTabLink : Base.IsActive -> List (Attribute msg) -> List (Html msg) -> Base.NavbarItem msg
navbarTabLink isActive =
    node "a"
        []
        [ "navbar-item is-tab"
        , if isActive then
            "is-active"
          else
            ""
        ]
