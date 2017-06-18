
module Bulma.Elements.Table exposing ( Table
                                     , table
                                     , easyTable
                                     , easierTable
                                     , easiestTable
                                     , easiestestTable
                                     , head
                                     , body
                                     , foot
                                     , row
                                     , easyRow
                                     , easierRow
                                     , unselected
                                     , selected
                                     , col
                                     , easyCol
                                     , easierCol
                                     , colHead
                                     , easyColHead
                                     , easierColHead
                                     , unbordered
                                     , bordered
                                     , unstriped
                                     , striped
                                     , wide
                                     , narrow
                                     , toHtml
                                     , addClass
                                     , setHelpers
                                     )
                                        
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Table, table, easyTable, easierTable, easiestTable, easiestestTable

@docs head, body, foot

@docs row, easyRow, easierRow
@docs unselected, selected

@docs col, easyCol, easierCol
@docs colHead, easyColHead, easierColHead

@docs unbordered, bordered

@docs unstriped, striped

@docs wide, narrow

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text, th, td )

import List exposing ( map )


-- TABLE -----------------------------------------------------------------------

{-| TODO
-}
type alias TableContent msg = { head : Maybe (Head msg)
                              , body :       (Body msg)
                              , foot : Maybe (Foot msg)
                              }

{-| TODO
-}
type alias Table msg = Entity Modifiers (TableContent msg) msg

{-| TODO
-}
table : List (Attribute msg) -> Maybe (Head msg) -> Body msg -> Maybe (Foot msg) -> Table msg
table attrs head body foot
  = entity "table" [ "table" ] defaultModifiers attrs
    { head = head
    , body = body
    , foot = foot
    }

{-| TODO
-}
easyTable : Head msg -> Body msg -> Table msg
easyTable head body = table [] (Just head) body Nothing

{-| TODO
-}
easierTable : Row msg -> List (Row msg) -> Table msg
easierTable = easyTable |~> ls >> head [] ~-> body []

{-| TODO
-}
easiestTable : List (Html msg) -> List (List (Html msg)) -> Table msg
easiestTable = easierTable
             |~>     (map easyCol >> row [])
             ~-> map (map easyCol >> row [])

{-| TODO
-}
easiestestTable : List (List String) -> Table msg
easiestestTable = map easierRow >> body [] >> (flip (table [] Nothing) Nothing)


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { bordered : Bool
                       , striped  : Bool
                       , narrow   : Bool
                       } 

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { bordered = False
                   , striped  = False
                   , narrow   = False
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {bordered,striped,narrow}
  = [ if bordered then "is-bordered" else ""
    , if striped  then "is-striped"  else ""
    , if narrow   then "is-narrow"   else ""
    ]

-- BORDERS --

{-| TODO
-}
unbordered : Table msg -> Table msg
unbordered = mapMods <| \mods -> { mods | bordered = False }

{-| TODO
-}
bordered : Table msg -> Table msg
bordered = mapMods <| \mods -> { mods | bordered = True }

-- STRIPES --

{-| TODO
-}
unstriped : Table msg -> Table msg
unstriped = mapMods <| \mods -> { mods | striped = False }

{-| TODO
-}
striped : Table msg -> Table msg
striped = mapMods <| \mods -> { mods | striped = True }

-- NARROW --

{-| TODO
-}
wide : Table msg -> Table msg
wide = mapMods <| \mods -> { mods | narrow = False }

{-| TODO
-}
narrow : Table msg -> Table msg
narrow = mapMods <| \mods -> { mods | narrow = True }


-- HEAD ------------------------------------------------------------------------

{-| TODO
-}
type alias Head msg = Entity () (List (Row msg)) msg

{-| TODO
-}
head : List (Attribute msg) -> List (Row msg) -> Head msg
head = entity "thead" [] ()


-- BODY ------------------------------------------------------------------------

{-| TODO
-}
type alias Body msg = Entity () (List (Row msg)) msg

{-| TODO
-}
body : List (Attribute msg) -> List (Row msg) -> Body msg
body = entity "tbody" [] ()


-- FOOT ------------------------------------------------------------------------

{-| TODO
-}
type alias Foot msg = Entity () (List (Row msg)) msg

{-| TODO
-}
foot : List (Attribute msg) -> List (Row msg) -> Foot msg
foot = entity "tfoot" [] ()


-- ROW -------------------------------------------------------------------------

{-| TODO
-}
type alias Row msg = Entity Bool (List (Column msg)) msg

{-| TODO
-}
row : List (Attribute msg) -> List (Column msg) -> Row msg
row = entity "tr" [] False

{-| TODO
-}
easyRow : Bool -> List (Column msg) -> Row msg
easyRow = flip (entity "tr" []) []

{-| TODO
-}
easierRow : List String -> Row msg
easierRow = map easierCol >> row []

-- HIGHLIGHT --

{-| TODO
-}
unselected : Row msg -> Row msg
unselected = mapMods <| y False

{-| TODO
-}
selected : Row msg -> Row msg
selected = mapMods <| y True

{-| TODO
-}
selectedClass : Bool -> String
selectedClass selected = if selected then "is-selected" else ""


-- COLUMN ----------------------------------------------------------------------

{-| TODO
-}
type Column msg = Column ( Bool, ( Attrs msg, Htmls msg ) )

{-| TODO
-}
col : Attrs msg -> Htmls msg -> Column msg
col attrs htmls = Column ( False, ( attrs, htmls ) )

{-| TODO
-}
easyCol : Html msg -> Column msg
easyCol = col [] << ls

{-| TODO
-}
easierCol : String -> Column msg
easierCol = easyCol << text

{-| TODO
-}
colHead : Attrs msg -> Htmls msg -> Column msg
colHead attrs htmls = Column ( True, ( attrs, htmls ) )

{-| TODO
-}
easyColHead : Html msg -> Column msg
easyColHead = colHead [] << ls

{-| TODO
-}
easierColHead : String -> Column msg
easierColHead = easyColHead << text


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Table msg -> Html msg
toHtml = Entity.toHtml modsClasses (y [])
       <| \{head,body,foot} ->
         let sectionToHtml : Entity () (List (Row msg)) msg -> Html msg
             sectionToHtml = Entity.toHtml (y []) (y []) <| map rowToHtml

             rowToHtml : Row msg -> Html msg
             rowToHtml = Entity.toHtml (selectedClass >> ls) (y []) <| map colToHtml

             colToHtml : Column msg -> Html msg
             colToHtml (Column ( isColHead, ( attrs, htmls ) ))
               = (if isColHead then th else td) attrs htmls
             
         in mvalues
            [ head |> Maybe.map sectionToHtml
            , body |>           sectionToHtml |> Just
            , foot |> Maybe.map sectionToHtml
            ]

{-| TODO
-}
addClass : String -> Table msg -> Table msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Table msg -> Table msg
setHelpers = Entity.setHelpers
