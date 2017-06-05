
module Bulma.Grid.Columns exposing ( Size
                                   , size
                                   , threeQuarters
                                   , twoThirds
                                   , half
                                   , oneThird
                                   , oneQuarter
                                   )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Devices )

import Html exposing ( Html, Attribute )
import Html.Attributes exposing ( classList )


-- HELPERS ---------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)


-- MODIFIERS -------------------------------------------------------------------

type Size = Auto
          | Size01
          | Size02
          | Size03
          | Size04
          | Size05
          | Size06
          | Size07
          | Size08
          | Size09
          | Size10
          | Size11
          | Size12
          | ThreeQuarters
          | TwoThirds
          | Half
          | OneThird
          | OneQuarter

auto : Size
auto = Auto

size : Int -> Size
size n = case clamp 1 12 n of
           01 -> Size01
           02 -> Size02
           03 -> Size03
           04 -> Size04
           05 -> Size05
           06 -> Size06
           07 -> Size07
           08 -> Size08
           09 -> Size09
           10 -> Size10
           11 -> Size11
           12 -> Size12
           _  -> Auto

threeQuarters : Size
threeQuarters = ThreeQuarters

twoThirds : Size
twoThirds = TwoThirds

half : Size
half = Half

oneThird : Size
oneThird = OneThird

oneQuarter : Size
oneQuarter = OneQuarter

sizeToString : Size -> Maybe String
sizeToString size
  = case size of
      Auto          -> Nothing
      Size01        -> Just  "1"
      Size02        -> Just  "2"
      Size03        -> Just  "3"
      Size04        -> Just  "4"
      Size05        -> Just  "5"
      Size06        -> Just  "6"
      Size07        -> Just  "7"
      Size08        -> Just  "8"
      Size09        -> Just  "9"
      Size10        -> Just "10"
      Size11        -> Just "11"
      Size12        -> Just "12"
      ThreeQuarters -> Just "three-quarters"
      TwoThirds     -> Just "two-thirds"
      Half          -> Just "half"
      OneThird      -> Just "one-third"
      OneQuarter    -> Just "one-quarter"


-- COLUMN ----------------------------------------------------------------------

-- TODO: make a nice devices api, with helpful functions to generate options

type Column msg = Column (Html msg)

type alias Offset = Size


column : Devices Size -> Offset -> List (Attribute msg) -> List (Html msg) -> Column msg
column {mobile,tablet,desktop} offset attrs htmls
  = let attrs_ : List (Attribute msg)
        attrs_ = flip (::) attrs
               <| classList
                 [ "column"  => True
                 , mobile
                   |> sizeToString
                   |> Maybe.map ((++) "is-mobile-" >> flip (,) True)
                   |> Maybe.withDefault ("",False)
                 , tablet
                   |> sizeToString
                   |> Maybe.map ((++) "is-tablet-" >> flip (,) True)
                   |> Maybe.withDefault ("",False)
                 , desktop
                   |> sizeToString
                   |> Maybe.map ((++) "is-desktop-" >> flip (,) True)
                   |> Maybe.withDefault ("",False)
                 , offset
                   |> sizeToString
                   |> Maybe.map ((++) "is-offset-" >> flip (,) True)
                   |> Maybe.withDefault ("",False)
                 ]

    in div attrs_ htmls

-- narrowColumn : Devices Bool -> List (Attribute msg) -> List (Html msg) -> Column msg
-- -- TODO: True for the devices for which it's narrow


-- COLUMNS ---------------------------------------------------------------------

type Gaps = Gapped
          | Gapless

gapped : Gaps
gapped = Gapped

gapless : Gaps
gapless = Gapless

type Display = MobileAndBeyond
             | TabletAndBeyond
             | DesktopAndBeyond

multilineColumns : Gaps -> Display -> List (Attribute msg) -> List (Column msg) -> Html msg
multilineColumns gaps display attrs cols
  = let attrs_ : List (Attribute msg)
        attrs_ = flip (::) attrs
               <| classList
                 [ "columns"      => True
                 , "is-multiline" => True
                 , "is-gapless"   => (gaps == Gapless)
                 , case display of
                     MobileAndBeyond  -> "is-mobile"  => True
                     TabletAndBeyond  -> ""           => False
                     DesktopAndBeyond -> "is-desktop" => True
                 ]

        cols_ : List (Html msg)
        cols_ = cols |> List.map (\(Column html) -> html)
                 
    in div attrs_ cols_

columns : Gaps -> Display -> List (Attribute msg) -> List (Column msg) -> Html msg
columns gaps display attrs cols
  = let attrs_ : List (Attribute msg)
        attrs_ = flip (::) attrs
               <| classList
                 [ "columns"      => True
                 , "is-gapless"   => (gaps == Gapless)
                 , case display of
                     MobileAndBeyond  -> "is-mobile"  => True
                     TabletAndBeyond  -> ""           => False
                     DesktopAndBeyond -> "is-desktop" => True
                 ]

        cols_ : List (Html msg)
        cols_ = cols |> List.map (\(Column html) -> html)
                 
    in div attrs_ cols_

-- nestColumns : Gaps -> Display -> List (Attribute msg) -> List (Column msg) -> Column msg
-- nestColumns gaps display attrs cols
--   = let attrs_ : List (Attribute msg)
--         attrs_ = flip (::) attrs
--                <| classList
--                  [ "columns"      => True
--                  , "is-gapless"   => (gaps == Gapless)
--                  , case display of
--                      MobileAndBeyond  -> "is-mobile"  => True
--                      TabletAndBeyond  -> ""           => False
--                      DesktopAndBeyond -> "is-desktop" => True
--                  ]

--         cols_ : List (Html msg)
--         cols_ = cols |> List.map (\(Column html) -> html)
                 
--     in div attrs_ cols_

-- TODO: nestMultilineColumns


