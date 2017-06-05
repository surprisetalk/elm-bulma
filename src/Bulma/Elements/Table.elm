
-- MODIFIERS -------------------------------------------------------------------

type alias Modifiers = { borders : Bool
                       , stripes : Bool
                       , narrow  : Bool
                       }

defaultModifiers : Modifiers
defaultModifiers = { borders = False
                   , stripes = False
                   , narrow  = False
                   }


-- TRANSFORMS ------------------------------------------------------------------




-- TABLE -----------------------------------------------------------------------

-- TODO: selected row

table : Modifiers -> List (Attribute msg) -> Maybe (Head msg) -> Body msg -> Maybe (Foot msg) -> Html msg

easyTable : Modifiers -> Body msg -> Html msg

easierTable : Modifiers -> List (Row msg) -> Html msg

easiestTable : Modifiers -> List (List (Html msg)) -> Html msg


-- HEAD ------------------------------------------------------------------------

head : List (Attribute msg) -> List (Row msg) -> Head msg


-- BODY ------------------------------------------------------------------------

body : List (Attribute msg) -> List (Row msg) -> Body msg


-- FOOT ------------------------------------------------------------------------

foot : List (Attribute msg) -> List (Row msg) -> Foot msg


-- ROW -------------------------------------------------------------------------

row : Bool -> List (Attribute msg) -> List (Column msg) -> Row msg
row selected attrs cols


-- COLUMN ----------------------------------------------------------------------

col : List (Attribute msg) -> List (Html msg) -> Column msg

