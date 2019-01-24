
module Bulma.Columns exposing
  ( ColumnsModifiers
  , Display(..)
  , Gap(..)
  , columnsModifiers
  , columns
  , Column
  , ColumnModifiers
  , Offset
  , columnModifiers
  , narrowColumnModifiers
  , column
  )

-- DOCS ------------------------------------------------------------------------

{-| A simple way to build responsive grids.

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

import Bulma.Classes as B

import Bulma.Modifiers exposing ( Devices, Width(..) )

import Html exposing ( Html, Attribute, text, div, a )


-- COLUMNS ---------------------------------------------------------------------

{-| Make a columnar grid! The widths of all your columns should be no greater than twelve.
-}
columns : ColumnsModifiers -> List (Attribute msg) -> List (Column msg) -> Html msg
columns {centered,multiline,gap,display}
  = node "div"
    [ B.columns
    , case centered of
        True  -> B.isCentered
        False -> B.none
    -- , case verticallyCentered of
    --     True  -> B.isVCentered
    --     False -> B.none
    , case multiline of
        True  -> B.isMultiline
        False -> B.none
    -- , B.isVariable
    , case gap of
        Gap0 -> B.isGapless
        _    -> B.none
    , case gap of
        Gap0 -> B.is0
        Gap1 -> B.is1
        Gap2 -> B.is2
        Gap3 -> B.none
        Gap4 -> B.is4
        Gap5 -> B.is5
        Gap6 -> B.is6
        Gap7 -> B.is7
        Gap8 -> B.is8
    , case display of
        MobileAndBeyond  -> B.isMobile
        TabletAndBeyond  -> B.none
        DesktopAndBeyond -> B.isDesktop
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
        , gap                = Gap3             
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
  = node "div"
    [ B.column
    , case widths.mobile of
         Just Auto    -> B.none
         Just Width1  -> B.is01Mobile
         Just Width2  -> B.is02Mobile
         Just Width3  -> B.is03Mobile
         Just Width4  -> B.is04Mobile
         Just Width5  -> B.is05Mobile
         Just Width6  -> B.is06Mobile
         Just Width7  -> B.is07Mobile
         Just Width8  -> B.is08Mobile
         Just Width9  -> B.is09Mobile
         Just Width10 -> B.is10Mobile
         Just Width11 -> B.is11Mobile
         Nothing      -> B.isNarrowMobile
    , case widths.tablet of
         Just Auto    -> B.none
         Just Width1  -> B.is01Tablet
         Just Width2  -> B.is02Tablet
         Just Width3  -> B.is03Tablet
         Just Width4  -> B.is04Tablet
         Just Width5  -> B.is05Tablet
         Just Width6  -> B.is06Tablet
         Just Width7  -> B.is07Tablet
         Just Width8  -> B.is08Tablet
         Just Width9  -> B.is09Tablet
         Just Width10 -> B.is10Tablet
         Just Width11 -> B.is11Tablet
         Nothing      -> B.isNarrowTablet
    , case widths.desktop of
         Just Auto    -> B.none
         Just Width1  -> B.is01Desktop
         Just Width2  -> B.is02Desktop
         Just Width3  -> B.is03Desktop
         Just Width4  -> B.is04Desktop
         Just Width5  -> B.is05Desktop
         Just Width6  -> B.is06Desktop
         Just Width7  -> B.is07Desktop
         Just Width8  -> B.is08Desktop
         Just Width9  -> B.is09Desktop
         Just Width10 -> B.is10Desktop
         Just Width11 -> B.is11Desktop
         Nothing      -> B.isNarrowDesktop
    , case widths.widescreen of
         Just Auto    -> B.none
         Just Width1  -> B.is01Widescreen
         Just Width2  -> B.is02Widescreen
         Just Width3  -> B.is03Widescreen
         Just Width4  -> B.is04Widescreen
         Just Width5  -> B.is05Widescreen
         Just Width6  -> B.is06Widescreen
         Just Width7  -> B.is07Widescreen
         Just Width8  -> B.is08Widescreen
         Just Width9  -> B.is09Widescreen
         Just Width10 -> B.is10Widescreen
         Just Width11 -> B.is11Widescreen
         Nothing      -> B.isNarrowWidescreen
    , case widths.fullHD of
         Just Auto    -> B.none
         Just Width1  -> B.is01FullHD
         Just Width2  -> B.is02FullHD
         Just Width3  -> B.is03FullHD
         Just Width4  -> B.is04FullHD
         Just Width5  -> B.is05FullHD
         Just Width6  -> B.is06FullHD
         Just Width7  -> B.is07FullHD
         Just Width8  -> B.is08FullHD
         Just Width9  -> B.is09FullHD
         Just Width10 -> B.is10FullHD
         Just Width11 -> B.is11FullHD
         Nothing      -> B.isNarrowFullHD
    , case offset of
         Auto    -> B.none
         Width1  -> B.isOffset01
         Width2  -> B.isOffset02
         Width3  -> B.isOffset03
         Width4  -> B.isOffset04
         Width5  -> B.isOffset05
         Width6  -> B.isOffset06
         Width7  -> B.isOffset07
         Width8  -> B.isOffset08
         Width9  -> B.isOffset09
         Width10 -> B.isOffset10
         Width11 -> B.isOffset11
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
