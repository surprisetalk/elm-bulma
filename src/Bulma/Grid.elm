
module Bulma.Grid exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Modifiers
@docs Width

# Columns
@docs columns
@docs ColumnsModifiers, Display, columnsModifiers

## Column
@docs Column
@docs column, narrowColumn
@docs ColumnModifiers, columnModifiers

# Tile
Coming soon!

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Html exposing ( Html, text, div, a )


-- COLUMNS ---------------------------------------------------------------------

{-| TODO
-}
type Width = Auto
           | Width1
           | Width2
           | Width3
           | Width4
           | Width5
           | Width6
           | Width7
           | Width8
           | Width9
           | Width10
           | Width11


-- COLUMNS ---------------------------------------------------------------------

{-| TODO
-}
columns : ColumnsModifiers -> Attrs msg -> List (Column msg) -> Html msg
columns {verticallyCentered,multiline,gapless,display}
  = node "div" []
    [ bulma.columns.container
    , case verticallyCentered of
        True  -> bulma.columns.alignment.isVCentered
        False -> ""
    , case multiline of
        True  -> bulma.columns.spacing.isMultiline
        False -> ""
    , case gapless of
        True  -> bulma.columns.spacing.isGapless
        False -> ""
    , case display of
        MobileAndBeyond  -> bulma.columns.display.onMobile
        TabletAndBeyond  -> ""
        DesktopAndBeyond -> bulma.columns.display.onlyDesktop
    ]


-- MODIFIERS --

{-| TODO
-}
type alias ColumnsModifiers = { multiline          : Bool
                              , gapless            : Bool
                              , display            : Display
                              , verticallyCentered : Bool
                              }

{-| TODO
-}
type Display = MobileAndBeyond
             | TabletAndBeyond
             | DesktopAndBeyond

{-| TODO
-}
columnsModifiers : ColumnsModifiers
columnsModifiers = { multiline          = False
                   , gapless            = False
                   , display            = TabletAndBeyond
                   , verticallyCentered = False
                   }


-- COLUMN ----------------------------------------------------------------------

{-| TODO
-}
type alias Column msg = Html msg

{-| TODO
-}
column : ColumnModifiers -> Attrs msg -> Htmls msg -> Html msg
column {widths,offset}
  = node "div" []
    [ flip (++) "-mobile"
    <| case widths.mobile of
         Auto    -> ""
         Width1  -> bulma.columns.column.width.is1
         Width2  -> bulma.columns.column.width.is2
         Width3  -> bulma.columns.column.width.is3
         Width4  -> bulma.columns.column.width.is4
         Width5  -> bulma.columns.column.width.is5
         Width6  -> bulma.columns.column.width.is6
         Width7  -> bulma.columns.column.width.is7
         Width8  -> bulma.columns.column.width.is8
         Width9  -> bulma.columns.column.width.is9
         Width10 -> bulma.columns.column.width.is10
         Width11 -> bulma.columns.column.width.is11
    , flip (++) "-tablet"
    <| case widths.tablet of
         Auto    -> ""
         Width1  -> bulma.columns.column.width.is1
         Width2  -> bulma.columns.column.width.is2
         Width3  -> bulma.columns.column.width.is3
         Width4  -> bulma.columns.column.width.is4
         Width5  -> bulma.columns.column.width.is5
         Width6  -> bulma.columns.column.width.is6
         Width7  -> bulma.columns.column.width.is7
         Width8  -> bulma.columns.column.width.is8
         Width9  -> bulma.columns.column.width.is9
         Width10 -> bulma.columns.column.width.is10
         Width11 -> bulma.columns.column.width.is11
    , flip (++) "-desktop"
    <| case widths.desktop of
         Auto    -> ""
         Width1  -> bulma.columns.column.width.is1
         Width2  -> bulma.columns.column.width.is2
         Width3  -> bulma.columns.column.width.is3
         Width4  -> bulma.columns.column.width.is4
         Width5  -> bulma.columns.column.width.is5
         Width6  -> bulma.columns.column.width.is6
         Width7  -> bulma.columns.column.width.is7
         Width8  -> bulma.columns.column.width.is8
         Width9  -> bulma.columns.column.width.is9
         Width10 -> bulma.columns.column.width.is10
         Width11 -> bulma.columns.column.width.is11
    , case offset of
         Auto    -> ""
         Width1  -> bulma.columns.column.offset.is1
         Width2  -> bulma.columns.column.offset.is2
         Width3  -> bulma.columns.column.offset.is3
         Width4  -> bulma.columns.column.offset.is4
         Width5  -> bulma.columns.column.offset.is5
         Width6  -> bulma.columns.column.offset.is6
         Width7  -> bulma.columns.column.offset.is7
         Width8  -> bulma.columns.column.offset.is8
         Width9  -> bulma.columns.column.offset.is9
         Width10 -> bulma.columns.column.offset.is10
         Width11 -> bulma.columns.column.offset.is11
    ]


{-| TODO
-}
narrowColumn : Width -> Attrs msg -> Htmls msg -> Html msg
narrowColumn offset
  = node "div" []
    [ case offset of
         Auto    -> ""
         Width1  -> bulma.columns.column.offset.is1
         Width2  -> bulma.columns.column.offset.is2
         Width3  -> bulma.columns.column.offset.is3
         Width4  -> bulma.columns.column.offset.is4
         Width5  -> bulma.columns.column.offset.is5
         Width6  -> bulma.columns.column.offset.is6
         Width7  -> bulma.columns.column.offset.is7
         Width8  -> bulma.columns.column.offset.is8
         Width9  -> bulma.columns.column.offset.is9
         Width10 -> bulma.columns.column.offset.is10
         Width11 -> bulma.columns.column.offset.is11
    ]

-- MODIFIERS --

{-| TODO
-}
type alias ColumnModifiers = { offset : Width
                             , widths : { mobile  : Width
                                        , tablet  : Width
                                        , desktop : Width
                                        }
                             }

{-| TODO
-}
columnModifiers : ColumnModifiers
columnModifiers = { offset = Auto
                  , widths = { mobile  = Auto
                             , tablet  = Auto
                             , desktop = Auto
                             }
                  }

