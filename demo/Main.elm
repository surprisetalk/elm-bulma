module Main exposing (..)

import Array exposing (Array)
import Bulma.Components as Components exposing (..)
import Bulma.Elements as Elements exposing (..)
import Bulma.Layout as Layout exposing (..)
import Bulma.Modifiers as Modifiers exposing (..)
import Dict
import Elements.Box as Box
import Elements.Button as Button
import Elements.Content as Content
import Elements.Delete as Delete
import Elements.Icon as Icon
import Html exposing (Html, a, i, img, main_, span, text)
import Html.Attributes exposing (class, href, src)
import Navigation
import NotFound404
import Overview.Start as Start
import Pending
import RouteUrl
import Tuple


type alias Model =
    { selectedTab : ( Int, Int )
    }


model : Model
model =
    { selectedTab = ( 0, 0 )
    }


defTabs : Array ( String, List ( String, Html msg ) )
defTabs =
    Array.fromList
        [ ( "Overview"
          , [ ( "Start", Start.view )
            ]
          )
        , ( "Elements"
          , [ ( "Box", Box.view )
            , ( "Button", Button.view )
            , ( "Content", Content.view )
            , ( "Delete", Delete.view )
            , ( "Icon", Icon.view )
            ]
          )
        ]


getTabId : String -> Int
getTabId name =
    defTabs
        |> Array.indexedMap (\i ( name, _ ) -> ( name, i ))
        |> Array.toList
        |> Dict.fromList
        |> Dict.get name
        |> Maybe.withDefault 0


getNavId : Int -> String -> Int
getNavId tabId navName =
    let
        ( _, navList ) =
            defTabs
                |> Array.get tabId
                |> Maybe.withDefault ( "", [] )
    in
    navList
        |> Array.fromList
        |> Array.indexedMap (\i ( name, _ ) -> ( name, i ))
        |> Array.filter (\( name, _ ) -> name == navName)
        |> Array.get 0
        |> Maybe.withDefault ( "", 0 )
        |> Tuple.second


urlOf : Model -> String
urlOf model =
    let
        ( selectedTab, selectedNav ) =
            model.selectedTab

        ( tab, navList ) =
            defTabs
                |> Array.get selectedTab
                |> Maybe.withDefault ( "", [] )

        nav =
            navList
                |> Array.fromList
                |> Array.get selectedNav
                |> Maybe.withDefault ( "", NotFound404.view )
                |> Tuple.first
    in
    urlString tab nav


urlString : String -> String -> String
urlString tab nav =
    "#" ++ tab ++ "/" ++ nav


delta2url : Model -> Model -> Maybe RouteUrl.UrlChange
delta2url model1 model2 =
    if model1.selectedTab /= model2.selectedTab then
        { entry = RouteUrl.NewEntry
        , url = urlOf model2
        }
            |> Just
    else
        Nothing


location2messages : Navigation.Location -> List Msg
location2messages location =
    let
        parts =
            location.hash
                |> String.dropLeft 1
                |> String.split "/"
                |> List.take 2

        tab =
            case List.head parts of
                Maybe.Just value ->
                    getTabId value

                Maybe.Nothing ->
                    0

        nav =
            case List.length parts of
                2 ->
                    getNavId tab (parts |> List.drop 1 |> List.head |> Maybe.withDefault "")

                _ ->
                    0
    in
    [ SelectTab ( tab, nav ) ]


main : RouteUrl.RouteUrlProgram Never Model Msg
main =
    RouteUrl.program
        { delta2url = delta2url
        , location2messages = location2messages
        , init = ( model, Cmd.none )
        , view = demoView
        , update = update
        , subscriptions = always Sub.none
        }



-- UPDATE


type Msg
    = SelectTab ( Int, Int )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectTab t ->
            ( { model | selectedTab = t }, Cmd.none )



-- VIEW


demoView : Model -> Html Msg
demoView model =
    main_ []
        [ demoTopNavBar
        , easyHero { heroModifiers | color = Modifiers.Primary }
            []
            { head = heroHead [] []
            , body = heroBody [] [ demoHeroBody ]
            , foot = heroFoot [] [ demoTabs model ]
            }
        , demoNavBar model
        , pageView model
        ]


demoHeroHead : Html msg
demoHeroHead =
    container [] [ text "elm-bulma" ]


demoTabs : Model -> Html msg
demoTabs model =
    let
        tabElems =
            defTabs
                |> Array.map Tuple.first
                |> Array.indexedMap
                    (\i name ->
                        tab (i == (model.selectedTab |> Tuple.first))
                            []
                            [ href ("#" ++ name) ]
                            [ text name ]
                    )
                |> Array.toList
    in
    container []
        [ tabs { tabsModifiers | style = Boxed } [] [] tabElems ]


demoHeroBody : Html msg
demoHeroBody =
    container []
        [ title H1 [] [ text "Documentation" ]
        , subtitle H2 [] [ text "Everything you need to create a website with Elm-Bulma" ]
        ]


demoTopNavBar : Html msg
demoTopNavBar =
    navbar navbarModifiers
        []
        [ navbarBrand []
            (navbarBurger False
                []
                [ span [] []
                , span [] []
                , span [] []
                ]
            )
            [ navbarItem False
                []
                [ img [ src "https://bulma.io/images/bulma-logo.png" ] []
                ]
            , navbarItem False [] [ text "elm-bulma" ]
            ]
        , navbarEnd []
            [ navbarItemLink False
                [ href "https://github.com/surprisetalk/elm-bulma" ]
                [ Elements.icon Standard [] [ i [ class "fa fa-github" ] [] ]
                , Html.span [] [ text "Source" ]
                ]
            , navbarItemLink False
                [ href "http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest" ]
                [ Elements.icon Standard [] [ i [ class "fa fa-download" ] [] ]
                , Html.span [] [ text "Elm-Package" ]
                ]
            ]
        ]


demoNavBar : Model -> Html msg
demoNavBar model =
    let
        ( selectedTab, selectedNav ) =
            model.selectedTab

        ( tab, navList ) =
            defTabs
                |> Array.get selectedTab
                |> Maybe.withDefault ( "", [] )

        navs =
            navList
                |> List.indexedMap
                    (\i ( name, _ ) ->
                        Pending.navbarTabLink (i == selectedNav)
                            []
                            [ Html.a [ href (urlString tab name) ] [ text name ] ]
                    )

        modifiers =
            Pending.pendingNavbarModifiers
    in
    Pending.navbar { modifiers | shadow = True }
        []
        [ container []
            [ Pending.navbarTabs [] navs ]
        ]


pageView : Model -> Html msg
pageView model =
    let
        ( tab, nav ) =
            model.selectedTab

        ( _, view ) =
            defTabs
                |> Array.get tab
                |> Maybe.withDefault ( "", [] )
                |> Tuple.second
                |> Array.fromList
                |> Array.get nav
                |> Maybe.withDefault ( "", NotFound404.view )
    in
    view
