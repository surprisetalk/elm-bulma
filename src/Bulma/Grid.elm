
module Bulma.Grid exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Table of Contents
- [Columns](#columns)
  - [Column](#column)
- [Tile](#tile)

# Columns
@docs ColumnsModifiers, Display, columnsModifiers
@docs columns

## Column
@docs Column, ColumnModifiers, Width, columnModifiers
@docs column, narrowColumn

# Tile
@docs Tile, Width
@docs tile
@docs tileAncestor, tileParent, tileChild
@docs verticalTile, verticalTileParent

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
    [ bulma.columns.column.container
    , case widths.mobile of
         Auto    -> ""
         Width1  -> flip (++) "-mobile" bulma.columns.column.width.is1
         Width2  -> flip (++) "-mobile" bulma.columns.column.width.is2
         Width3  -> flip (++) "-mobile" bulma.columns.column.width.is3
         Width4  -> flip (++) "-mobile" bulma.columns.column.width.is4
         Width5  -> flip (++) "-mobile" bulma.columns.column.width.is5
         Width6  -> flip (++) "-mobile" bulma.columns.column.width.is6
         Width7  -> flip (++) "-mobile" bulma.columns.column.width.is7
         Width8  -> flip (++) "-mobile" bulma.columns.column.width.is8
         Width9  -> flip (++) "-mobile" bulma.columns.column.width.is9
         Width10 -> flip (++) "-mobile" bulma.columns.column.width.is10
         Width11 -> flip (++) "-mobile" bulma.columns.column.width.is11
    , case widths.tablet of
         Auto    -> ""
         Width1  -> flip (++) "-tablet" bulma.columns.column.width.is1
         Width2  -> flip (++) "-tablet" bulma.columns.column.width.is2
         Width3  -> flip (++) "-tablet" bulma.columns.column.width.is3
         Width4  -> flip (++) "-tablet" bulma.columns.column.width.is4
         Width5  -> flip (++) "-tablet" bulma.columns.column.width.is5
         Width6  -> flip (++) "-tablet" bulma.columns.column.width.is6
         Width7  -> flip (++) "-tablet" bulma.columns.column.width.is7
         Width8  -> flip (++) "-tablet" bulma.columns.column.width.is8
         Width9  -> flip (++) "-tablet" bulma.columns.column.width.is9
         Width10 -> flip (++) "-tablet" bulma.columns.column.width.is10
         Width11 -> flip (++) "-tablet" bulma.columns.column.width.is11
    , case widths.desktop of
         Auto    -> ""
         Width1  -> flip (++) "-desktop" bulma.columns.column.width.is1
         Width2  -> flip (++) "-desktop" bulma.columns.column.width.is2
         Width3  -> flip (++) "-desktop" bulma.columns.column.width.is3
         Width4  -> flip (++) "-desktop" bulma.columns.column.width.is4
         Width5  -> flip (++) "-desktop" bulma.columns.column.width.is5
         Width6  -> flip (++) "-desktop" bulma.columns.column.width.is6
         Width7  -> flip (++) "-desktop" bulma.columns.column.width.is7
         Width8  -> flip (++) "-desktop" bulma.columns.column.width.is8
         Width9  -> flip (++) "-desktop" bulma.columns.column.width.is9
         Width10 -> flip (++) "-desktop" bulma.columns.column.width.is10
         Width11 -> flip (++) "-desktop" bulma.columns.column.width.is11
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
    [ bulma.columns.column.container
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


-- COLUMN ----------------------------------------------------------------------

{-| TODO
-}
type alias Tile msg = Html msg

-- TODO: easyTiles

{-| TODO
-}
tile : Width -> Attrs msg -> List (Tile msg) -> Tile msg
tile width
  = node "div" []
    [ bulma.tile.container
    , case width of
        Auto    -> ""
        Width1  -> bulma.tile.width.is1
        Width2  -> bulma.tile.width.is2
        Width3  -> bulma.tile.width.is3
        Width4  -> bulma.tile.width.is4
        Width5  -> bulma.tile.width.is5
        Width6  -> bulma.tile.width.is6
        Width7  -> bulma.tile.width.is7
        Width8  -> bulma.tile.width.is8
        Width9  -> bulma.tile.width.is9
        Width10 -> bulma.tile.width.is10
        Width11 -> bulma.tile.width.is11
    ]

{-| TODO
-}
verticalTile : Width -> Attrs msg -> List (Tile msg) -> Tile msg
verticalTile width
  = node "div" []
    [ bulma.tile.container
    , bulma.tile.orientation.isVertical
    , case width of
        Auto    -> ""
        Width1  -> bulma.tile.width.is1
        Width2  -> bulma.tile.width.is2
        Width3  -> bulma.tile.width.is3
        Width4  -> bulma.tile.width.is4
        Width5  -> bulma.tile.width.is5
        Width6  -> bulma.tile.width.is6
        Width7  -> bulma.tile.width.is7
        Width8  -> bulma.tile.width.is8
        Width9  -> bulma.tile.width.is9
        Width10 -> bulma.tile.width.is10
        Width11 -> bulma.tile.width.is11
    ]

{-| TODO
-}
tileAncestor : Width -> Attrs msg -> List (Tile msg) -> Html msg
tileAncestor width
  = node "div" []
    [ bulma.tile.container
    , bulma.tile.level.isAncestor
    , case width of
        Auto    -> ""
        Width1  -> bulma.tile.width.is1
        Width2  -> bulma.tile.width.is2
        Width3  -> bulma.tile.width.is3
        Width4  -> bulma.tile.width.is4
        Width5  -> bulma.tile.width.is5
        Width6  -> bulma.tile.width.is6
        Width7  -> bulma.tile.width.is7
        Width8  -> bulma.tile.width.is8
        Width9  -> bulma.tile.width.is9
        Width10 -> bulma.tile.width.is10
        Width11 -> bulma.tile.width.is11
    ]

{-| TODO
-}
tileParent : Width -> Attrs msg -> List (Tile msg) -> Tile msg
tileParent width
  = node "div" []
    [ bulma.tile.container
    , bulma.tile.level.isParent
    , case width of
        Auto    -> ""
        Width1  -> bulma.tile.width.is1
        Width2  -> bulma.tile.width.is2
        Width3  -> bulma.tile.width.is3
        Width4  -> bulma.tile.width.is4
        Width5  -> bulma.tile.width.is5
        Width6  -> bulma.tile.width.is6
        Width7  -> bulma.tile.width.is7
        Width8  -> bulma.tile.width.is8
        Width9  -> bulma.tile.width.is9
        Width10 -> bulma.tile.width.is10
        Width11 -> bulma.tile.width.is11
    ]

{-| TODO
-}
verticalTileParent : Width -> Attrs msg -> List (Tile msg) -> Tile msg
verticalTileParent width
  = node "div" []
    [ bulma.tile.container
    , bulma.tile.level.isParent
    , bulma.tile.orientation.isVertical
    , case width of
        Auto    -> ""
        Width1  -> bulma.tile.width.is1
        Width2  -> bulma.tile.width.is2
        Width3  -> bulma.tile.width.is3
        Width4  -> bulma.tile.width.is4
        Width5  -> bulma.tile.width.is5
        Width6  -> bulma.tile.width.is6
        Width7  -> bulma.tile.width.is7
        Width8  -> bulma.tile.width.is8
        Width9  -> bulma.tile.width.is9
        Width10 -> bulma.tile.width.is10
        Width11 -> bulma.tile.width.is11
    ]

{-| TODO
-}
tileChild : Width -> Attrs msg -> Htmls msg -> Tile msg
tileChild width
  = node "div" []
    [ bulma.tile.container
    , bulma.tile.level.isChild
    , case width of
        Auto    -> ""
        Width1  -> bulma.tile.width.is1
        Width2  -> bulma.tile.width.is2
        Width3  -> bulma.tile.width.is3
        Width4  -> bulma.tile.width.is4
        Width5  -> bulma.tile.width.is5
        Width6  -> bulma.tile.width.is6
        Width7  -> bulma.tile.width.is7
        Width8  -> bulma.tile.width.is8
        Width9  -> bulma.tile.width.is9
        Width10 -> bulma.tile.width.is10
        Width11 -> bulma.tile.width.is11
    ]
