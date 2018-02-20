
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

@docs ColumnsModifiers, Display, Gap, columnsModifiers
@docs columns

## Column
@docs Column, ColumnModifiers, Offset, columnModifiers, narrowColumnModifiers
@docs column

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers exposing ( Devices, Width(..) )

import Html exposing ( Html, Attribute, text, div, a )


-- COLUMNS ---------------------------------------------------------------------

{-| Make a columnar grid! The widths of all your columns should be no greater than twelve.
-}
columns : ColumnsModifiers -> List (Attribute msg) -> List (Column msg) -> Html msg
columns {centered,multiline,gap,display}
  = node "div" []
    [ bulma.columns.container
    , case centered of
        True  -> "is-centered"
        False -> ""
    -- , case verticallyCentered of
    --     True  -> bulma.columns.alignment.isVCentered
    --     False -> ""
    , case multiline of
        True  -> bulma.columns.spacing.isMultiline
        False -> ""
    , case gap of
        Gap0 -> "is-variable is-0 is-gapless"
        Gap1 -> "is-variable is-1"
        Gap2 -> "is-variable is-2"
        Gap3 -> "is-variable is-3"
        Gap4 -> "is-variable is-4"
        Gap5 -> "is-variable is-5"
        Gap6 -> "is-variable is-6"
        Gap7 -> "is-variable is-7"
        Gap8 -> "is-variable is-8"
    , case display of
        MobileAndBeyond  -> bulma.columns.display.onMobile
        TabletAndBeyond  -> ""
        DesktopAndBeyond -> bulma.columns.display.onlyDesktop
    ]


-- MODIFIERS --

{-| -}
type alias ColumnsModifiers = { multiline          : Bool
                              , gap                : Gap
                              , display            : Display
                              , centered           : Bool
                              -- , verticallyCentered : Bool
                              }

{-| -}
type Gap
  = Gap0
  | Gap1
  | Gap2
  | Gap3
  | Gap4
  | Gap5
  | Gap6
  | Gap7
  | Gap8

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
                   , gap                = Gap3
                   , display            = TabletAndBeyond
                   , centered           = False
                   -- , verticallyCentered = False
                   }


-- COLUMN ----------------------------------------------------------------------

{-| -}
type alias Column msg = Html msg

{-| -}
type alias Offset = Width

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
column : ColumnModifiers -> List (Attribute msg) -> List (Html msg) -> Column msg
column {widths,offset}
  = node "div" []
    [ bulma.columns.column.container
    , case widths.mobile of
         Just Auto    -> ""
         Just Width1  -> flip (++) "-mobile" bulma.columns.column.width.is1
         Just Width2  -> flip (++) "-mobile" bulma.columns.column.width.is2
         Just Width3  -> flip (++) "-mobile" bulma.columns.column.width.is3
         Just Width4  -> flip (++) "-mobile" bulma.columns.column.width.is4
         Just Width5  -> flip (++) "-mobile" bulma.columns.column.width.is5
         Just Width6  -> flip (++) "-mobile" bulma.columns.column.width.is6
         Just Width7  -> flip (++) "-mobile" bulma.columns.column.width.is7
         Just Width8  -> flip (++) "-mobile" bulma.columns.column.width.is8
         Just Width9  -> flip (++) "-mobile" bulma.columns.column.width.is9
         Just Width10 -> flip (++) "-mobile" bulma.columns.column.width.is10
         Just Width11 -> flip (++) "-mobile" bulma.columns.column.width.is11
         Nothing      -> flip (++) "-mobile" "is-narrow"
    , case widths.tablet of
         Just Auto    -> ""
         Just Width1  -> flip (++) "-tablet" bulma.columns.column.width.is1
         Just Width2  -> flip (++) "-tablet" bulma.columns.column.width.is2
         Just Width3  -> flip (++) "-tablet" bulma.columns.column.width.is3
         Just Width4  -> flip (++) "-tablet" bulma.columns.column.width.is4
         Just Width5  -> flip (++) "-tablet" bulma.columns.column.width.is5
         Just Width6  -> flip (++) "-tablet" bulma.columns.column.width.is6
         Just Width7  -> flip (++) "-tablet" bulma.columns.column.width.is7
         Just Width8  -> flip (++) "-tablet" bulma.columns.column.width.is8
         Just Width9  -> flip (++) "-tablet" bulma.columns.column.width.is9
         Just Width10 -> flip (++) "-tablet" bulma.columns.column.width.is10
         Just Width11 -> flip (++) "-tablet" bulma.columns.column.width.is11
         Nothing      -> flip (++) "-tablet" "is-narrow"
    , case widths.desktop of
         Just Auto    -> ""
         Just Width1  -> flip (++) "-desktop" bulma.columns.column.width.is1
         Just Width2  -> flip (++) "-desktop" bulma.columns.column.width.is2
         Just Width3  -> flip (++) "-desktop" bulma.columns.column.width.is3
         Just Width4  -> flip (++) "-desktop" bulma.columns.column.width.is4
         Just Width5  -> flip (++) "-desktop" bulma.columns.column.width.is5
         Just Width6  -> flip (++) "-desktop" bulma.columns.column.width.is6
         Just Width7  -> flip (++) "-desktop" bulma.columns.column.width.is7
         Just Width8  -> flip (++) "-desktop" bulma.columns.column.width.is8
         Just Width9  -> flip (++) "-desktop" bulma.columns.column.width.is9
         Just Width10 -> flip (++) "-desktop" bulma.columns.column.width.is10
         Just Width11 -> flip (++) "-desktop" bulma.columns.column.width.is11
         Nothing      -> flip (++) "-desktop" "is-narrow"
    , case widths.widescreen of
         Just Auto    -> ""
         Just Width1  -> flip (++) "-widescreen" bulma.columns.column.width.is1
         Just Width2  -> flip (++) "-widescreen" bulma.columns.column.width.is2
         Just Width3  -> flip (++) "-widescreen" bulma.columns.column.width.is3
         Just Width4  -> flip (++) "-widescreen" bulma.columns.column.width.is4
         Just Width5  -> flip (++) "-widescreen" bulma.columns.column.width.is5
         Just Width6  -> flip (++) "-widescreen" bulma.columns.column.width.is6
         Just Width7  -> flip (++) "-widescreen" bulma.columns.column.width.is7
         Just Width8  -> flip (++) "-widescreen" bulma.columns.column.width.is8
         Just Width9  -> flip (++) "-widescreen" bulma.columns.column.width.is9
         Just Width10 -> flip (++) "-widescreen" bulma.columns.column.width.is10
         Just Width11 -> flip (++) "-widescreen" bulma.columns.column.width.is11
         Nothing      -> flip (++) "-widscreen" "is-narrow"
    , case widths.fullHD of
         Just Auto    -> ""
         Just Width1  -> flip (++) "-fullhd" bulma.columns.column.width.is1
         Just Width2  -> flip (++) "-fullhd" bulma.columns.column.width.is2
         Just Width3  -> flip (++) "-fullhd" bulma.columns.column.width.is3
         Just Width4  -> flip (++) "-fullhd" bulma.columns.column.width.is4
         Just Width5  -> flip (++) "-fullhd" bulma.columns.column.width.is5
         Just Width6  -> flip (++) "-fullhd" bulma.columns.column.width.is6
         Just Width7  -> flip (++) "-fullhd" bulma.columns.column.width.is7
         Just Width8  -> flip (++) "-fullhd" bulma.columns.column.width.is8
         Just Width9  -> flip (++) "-fullhd" bulma.columns.column.width.is9
         Just Width10 -> flip (++) "-fullhd" bulma.columns.column.width.is10
         Just Width11 -> flip (++) "-fullhd" bulma.columns.column.width.is11
         Nothing      -> flip (++) "-fullhd" "is-narrow"
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

{-| The `widths` field requires a `Maybe Width` for each device size.
`Nothing` will create a narrow column for that device range.
-}
type alias ColumnModifiers = { offset : Width
                             , widths : Devices (Maybe Width)
                             }

{-| Default offsets and widths for an individiual column. 
The offset defaults to `Auto`. Each device defaults to `Just Auto`. 
-}
columnModifiers : ColumnModifiers
columnModifiers = { offset = Auto
                  , widths = { mobile     = Just Auto
                             , tablet     = Just Auto
                             , desktop    = Just Auto
                             , widescreen = Just Auto
                             , fullHD     = Just Auto
                             }
                  }

{-| Default offsets and widths for an individiual column. 
The offset defaults to `Auto`. Each device defaults to `Nothing`. 
-}
narrowColumnModifiers : ColumnModifiers
narrowColumnModifiers
  = { offset = Auto
    , widths = { mobile     = Nothing
               , tablet     = Nothing
               , desktop    = Nothing
               , widescreen = Nothing
               , fullHD     = Nothing
               }
    }
