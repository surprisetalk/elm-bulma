
module Bulma.Columns exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| A simple way to build responsive grids.

# Table of Contents
- [Columns](#columns)

# Columns
Learn more about columnar grids in the [official docs](http://bulma.io/documentation/grid/columns/).

    myGrid : Html msg
    myGrid
      = columns myColumnsModifiers []
        [ column myColumnModifiers [] 
          [ text "First Column"
          ]
        , column myColumnModifiers [] 
          [ text "Second Column"
          ]
        , column myColumnModifiers [] 
          [ text "Third Column"
          ]
        ]

@docs ColumnsModifiers, Display, columnsModifiers
@docs columns

## Column
@docs Column, ColumnModifiers, columnModifiers
@docs column, narrowColumn

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers exposing ( Devices, Width(..) )

import Html exposing ( Html, text, div, a )


-- COLUMNS ---------------------------------------------------------------------

-- TODO: replace gapless with gapSize (0-8)

{-| Make a columnar grid! The widths of all your columns should be no greater than twelve.
-}
columns : ColumnsModifiers -> Attrs msg -> List (Column msg) -> Html msg
columns {centered,multiline,gapless,display}
  = node "div" []
    [ bulma.columns.container
    , case centered of
        True  -> bulma.columns.alignment.isCentered
        False -> ""
    -- , case verticallyCentered of
    --     True  -> bulma.columns.alignment.isVCentered
    --     False -> ""
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

{-| -}
type alias ColumnsModifiers = { multiline          : Bool
                              , gapless            : Bool
                              , display            : Display
                              , centered           : Bool
                              -- , verticallyCentered : Bool
                              }

{-| -}
type Display = MobileAndBeyond
             | TabletAndBeyond
             | DesktopAndBeyond

{-| Default column attributes.

    myColumnsModifiers : ColumnsModifiers
    myColumnsModifiers 
      = { multiline          = False
        , gapless            = False             
        , display            = TabletAndBeyond
        , centered           = False
        }
    
    myColumnsModifiers == columnsModifiers
-}
columnsModifiers : ColumnsModifiers
columnsModifiers = { multiline          = False
                   , gapless            = False
                   , display            = TabletAndBeyond
                   , centered           = False
                   -- , verticallyCentered = False
                   }


-- COLUMN ----------------------------------------------------------------------

{-| -}
type alias Column msg = Html msg

{-| A column element that is meant to be placed in `columns`.

    myColumn : Html msg
    myColumn
      = column myColumnModifiers []
        [ h1 [] [ text "Lorem" ]
        , h2 [] [ text "ipsum" ]
        , h3 [] [ text "dolor" ]
        , h4 [] [ text "sit" ]
        , h5 [] [ text "amet" ]
        ]
-}
column : ColumnModifiers -> Attrs msg -> Htmls msg -> Column msg
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
    , case widths.widescreen of
         Auto    -> ""
         Width1  -> flip (++) "-widescreen" bulma.columns.column.width.is1
         Width2  -> flip (++) "-widescreen" bulma.columns.column.width.is2
         Width3  -> flip (++) "-widescreen" bulma.columns.column.width.is3
         Width4  -> flip (++) "-widescreen" bulma.columns.column.width.is4
         Width5  -> flip (++) "-widescreen" bulma.columns.column.width.is5
         Width6  -> flip (++) "-widescreen" bulma.columns.column.width.is6
         Width7  -> flip (++) "-widescreen" bulma.columns.column.width.is7
         Width8  -> flip (++) "-widescreen" bulma.columns.column.width.is8
         Width9  -> flip (++) "-widescreen" bulma.columns.column.width.is9
         Width10 -> flip (++) "-widescreen" bulma.columns.column.width.is10
         Width11 -> flip (++) "-widescreen" bulma.columns.column.width.is11
    , case widths.fullHD of
         Auto    -> ""
         Width1  -> flip (++) "-fullhd" bulma.columns.column.width.is1
         Width2  -> flip (++) "-fullhd" bulma.columns.column.width.is2
         Width3  -> flip (++) "-fullhd" bulma.columns.column.width.is3
         Width4  -> flip (++) "-fullhd" bulma.columns.column.width.is4
         Width5  -> flip (++) "-fullhd" bulma.columns.column.width.is5
         Width6  -> flip (++) "-fullhd" bulma.columns.column.width.is6
         Width7  -> flip (++) "-fullhd" bulma.columns.column.width.is7
         Width8  -> flip (++) "-fullhd" bulma.columns.column.width.is8
         Width9  -> flip (++) "-fullhd" bulma.columns.column.width.is9
         Width10 -> flip (++) "-fullhd" bulma.columns.column.width.is10
         Width11 -> flip (++) "-fullhd" bulma.columns.column.width.is11
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


{-| Narrow columns are used just like other columns, but they only take up as much space as they need.

The other non-narrow columns will take up the remaining space.

    myNarrowColumn : Html msg
    myNarrowColumn
      = let offset : Width
            offset = Auto
        in narrowColumn offset []
           [ text "I only take what I need!"
           ]
-}
narrowColumn : Width -> Attrs msg -> Htmls msg -> Column msg
narrowColumn offset
-- TODO: narrow columns by device
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

{-| -}
type alias ColumnModifiers = { offset : Width
                             , widths : Devices Width
                             }

{-| Default offsets and widths for individiual columns. 
Everything defaults to `Auto`.
-}
columnModifiers : ColumnModifiers
columnModifiers = { offset = Auto
                  , widths = { mobile     = Auto
                             , tablet     = Auto
                             , desktop    = Auto
                             , widescreen = Auto
                             , fullHD     = Auto
                             }
                  }


