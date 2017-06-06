
module Bulma.Elements.Table exposing ( Table
                                     , table
                                     , toHtml
                                     , setHelpers
                                     )
                                        
-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- TABLE -----------------------------------------------------------------------

-- TODO: selected row

table : List (Attribute msg) -> Maybe (Head msg) -> Body msg -> Maybe (Foot msg) -> Html msg

easyTable : Head msg -> Body msg -> Html msg

easierTable : Row msg -> List (Row msg) -> Html msg

easiestTable : List (Html msg) -> List (List (Html msg)) -> Html msg

easiestestTable : List (List String) -> Html msg


-- BORDERS --

unsetBordered : Table msg -> Table msg

setBordered : Table msg -> Table msg


-- STRIPES --

unsetStriped : Table msg -> Table msg

setStriped : Table msg -> Table msg


-- NARROW --

unsetNarrow : Table msg -> Table msg

setNarrow : Table msg -> Table msg


-- HEAD ------------------------------------------------------------------------

head : List (Attribute msg) -> List (Row msg) -> Head msg


-- BODY ------------------------------------------------------------------------

body : List (Attribute msg) -> List (Row msg) -> Body msg


-- FOOT ------------------------------------------------------------------------

foot : List (Attribute msg) -> List (Row msg) -> Foot msg


-- ROW -------------------------------------------------------------------------

row : List (Attribute msg) -> List (Column msg) -> Row msg

easyRow : Bool -> List (Column msg) -> Row msg

easierRow : List String -> Row msg

unsetHighlighted : Row msg -> Row msg

setHighlighted : Row msg -> Row msg


-- COLUMN ----------------------------------------------------------------------

col : List (Attribute msg) -> List (Html msg) -> Column msg

easyCol : String -> Column msg


-- HTML ------------------------------------------------------------------------

toHtml : Table msg -> Html msg

addClass : String -> Table msg -> Table msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Table msg -> Table msg
