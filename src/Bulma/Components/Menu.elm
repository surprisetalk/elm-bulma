
module Bulma.Components.Menu exposing ( Menu
                                      , menu
                                      , Section
                                      , section
                                      , labeledSection
                                      , Item
                                      , item
                                      , easyItem
                                      , easierItem
                                      , easiestItem
                                      , active
                                      , inactive
                                      , toHtml
                                      , addClass
                                      , setHelpers
                                      )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Menu
@docs menu

@docs Section
@docs section, labeledSection

@docs Item
@docs item
@docs easyItem, easierItem, easiestItem
@docs active, inactive

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Icon as Icon exposing ( Icon )

import Html exposing ( Html, Attribute, text, ul, li, a, p )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class )

import List exposing ( map )
import Tuple exposing ( mapFirst )


-- MENU -----------------------------------------------------------------------

{-| TODO
-}
type alias Menu msg = Entity () (List (Section msg)) msg

{-| TODO
-}
menu : Attrs msg -> List (Section msg) -> Menu msg
menu = entity "aside" [ "menu" ] ()

-- TODO: easyMenu

-- MENU SECTION ---------------------------------------------------------------

-- BUG: we're not exposing any attributes

{-| TODO
-}
type alias Section msg = (Maybe (Htmls msg), List (Item msg))

{-| TODO
-}
section : List (Item msg) -> Section msg
section = (,) Nothing

{-| TODO
-}
labeledSection : Htmls msg -> List (Item msg) -> Section msg
labeledSection = Just >> (,)


-- MENU ITEM ------------------------------------------------------------------

{-| TODO
-}
type Item msg = Item (Entity () ((Bool, Htmls msg), List (Item msg)) msg)

{-| TODO
-}
item : Attrs msg -> Htmls msg -> List (Item msg) -> Item msg
item attrs link children = entity "li" [] () attrs ( (False, link), children ) |> Item

{-| TODO
-}
easyItem : msg -> Icon msg -> String -> Bool -> List (Item msg) -> Item msg
easyItem msg icon label isActive items
  = a [ onClick msg ] [ icon |> Icon.toHtml, text label ]
  |> ls
  |> flip (item []) items
  |> if   isActive
    then active
    else inactive

{-| TODO
-}
easierItem : msg -> String -> Bool -> List (Item msg) -> Item msg
easierItem msg label isActive items
  = a [ onClick msg ] [ text label ]
  |> ls
  |> flip (item []) items
  |> if   isActive
    then active
    else inactive

{-| TODO
-}
easiestItem : msg -> String -> List (Item msg) -> Item msg
easiestItem msg label items
  = a [ onClick msg ] [ text label ]
  |> ls
  |> flip (item []) items

-- toItem : Menu msg -> Item msg
-- toItem menu = menu
--             |> setTag 

{-| TODO
-}
inactive : Item msg -> Item msg
inactive (Item item) = item |> mapBody (mapFirst <| setFirst False) |> Item

{-| TODO
-}
active : Item msg -> Item msg
active (Item item) = item |> mapBody (mapFirst <| setFirst True) |> Item


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Menu msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| List.concat
       << ( map
         <| \(label,items) ->
           mvalues
           [ label |> Maybe.map (p [ class "menu-label" ])
           , items |> map toHtml_ |> ul [ class "menu-list" ] |> Just
           ]
         )

{-| TODO
-}
toHtml_ : Item msg -> Html msg
toHtml_ (Item item)
  = flip (Entity.toHtml (y []) (y [])) item
  <| \((active,label),items) ->
      a (if active then [ class "is-active" ] else []) label
      :: case items of
           []    -> []
           items -> items |> map toHtml_ |> ul [] |> ls

{-| TODO
-}
addClass : String -> Menu msg -> Menu msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Menu msg -> Menu msg
setHelpers = Entity.setHelpers
