
module Bulma.Grid.Columns exposing ( Column, column
                                   , size, size1, size2, size3, size4, size5, size6, size7, size8, size9, size10, size11, size12, sizeAuto, sizeNarrow
                                   , mobileSize, mobileSize1, mobileSize2, mobileSize3, mobileSize4, mobileSize5, mobileSize6, mobileSize7, mobileSize8, mobileSize9, mobileSize10, mobileSize11, mobileSize12, mobileSizeAuto, mobileSizeNarrow
                                   , tabletSize, tabletSize1, tabletSize2, tabletSize3, tabletSize4, tabletSize5, tabletSize6, tabletSize7, tabletSize8, tabletSize9, tabletSize10, tabletSize11, tabletSize12, tabletSizeAuto, tabletSizeNarrow
                                   , desktopSize, desktopSize1, desktopSize2, desktopSize3, desktopSize4, desktopSize5, desktopSize6, desktopSize7, desktopSize8, desktopSize9, desktopSize10, desktopSize11, desktopSize12, desktopSizeAuto, desktopSizeNarrow
                                   , offset, offset1, offset2, offset3, offset4, offset5, offset6, offset7, offset8, offset9, offset10, offset11, offset12, offsetAuto 
                                   , Columns, columns, toColumn
                                   , singleline, multiline
                                   , gapped, gapless
                                   , mobileAndBeyond, tabletAndBeyond, desktopAndBeyond
                                   , toHtml, addClass, setHelpers
                                   )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Columns
@docs columns, toColumn

@docs singleline , multiline
@docs gapped , gapless
@docs mobileAndBeyond , tabletAndBeyond , desktopAndBeyond

@docs Column
@docs column

@docs size , size1 , size2 , size3 , size4 , size5 , size6 , size7 , size8 , size9 , size10 , size11 , size12 , sizeAuto , sizeNarrow
@docs mobileSize , mobileSize1 , mobileSize2 , mobileSize3 , mobileSize4 , mobileSize5 , mobileSize6 , mobileSize7 , mobileSize8 , mobileSize9 , mobileSize10 , mobileSize11 , mobileSize12 , mobileSizeAuto , mobileSizeNarrow
@docs tabletSize , tabletSize1 , tabletSize2 , tabletSize3 , tabletSize4 , tabletSize5 , tabletSize6 , tabletSize7 , tabletSize8 , tabletSize9 , tabletSize10 , tabletSize11 , tabletSize12 , tabletSizeAuto , tabletSizeNarrow
@docs desktopSize , desktopSize1 , desktopSize2 , desktopSize3 , desktopSize4 , desktopSize5 , desktopSize6 , desktopSize7 , desktopSize8 , desktopSize9 , desktopSize10 , desktopSize11 , desktopSize12 , desktopSizeAuto , desktopSizeNarrow
@docs offset , offset1 , offset2 , offset3 , offset4 , offset5 , offset6 , offset7 , offset8 , offset9 , offset10 , offset11 , offset12 , offsetAuto 

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers, defaultHelpers )

import Html exposing ( Html, Attribute )

import List exposing ( map, singleton )


-- COLUMN ----------------------------------------------------------------------

{-| TODO
-}
type alias Column msg = Entity ColumnModifiers (Htmls msg) msg

{-| TODO
-}
column : Attrs msg -> Htmls msg -> Column msg
column = entity "div" [ "column" ] defaultColumnModifiers


-- COLUMN MODIFIERS ------------------------------------------------------------

{-| TODO
-}
type alias ColumnModifiers = { offset : Size
                             , sizes  : { mobile  : Size
                                        , tablet  : Size
                                        , desktop : Size
                                        }
                             }

{-| TODO
-}
defaultColumnModifiers : ColumnModifiers
defaultColumnModifiers = { offset = Auto
                         , sizes  = { mobile  = Auto
                                    , tablet  = Auto
                                    , desktop = Auto
                                    }
                         }

{-| TODO
-}
columnModsClasses : ColumnModifiers -> List String
columnModsClasses {offset,sizes}
  = [ sizes.mobile  |> sizeClass Mobile
    , sizes.tablet  |> sizeClass Tablet
    , sizes.desktop |> sizeClass Desktop
    , offset        |> offsetClass
    ]


-- DEVICE SIZES --

{-| TODO
-}
type Size = Auto
          | Narrow
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


{-| TODO
-}
type Device = All
            | Mobile
            | Tablet
            | Desktop

{-| TODO
-}
setDeviceSize : Device -> Size -> Column msg -> Column msg
setDeviceSize device size_
  = mapMods
  <| \({sizes} as mods) ->
    { mods
    | sizes = case device of
                Mobile  -> { sizes | mobile  = size_ }
                Tablet  -> { sizes | tablet  = size_ }
                Desktop -> { sizes | desktop = size_ }
                All     -> { sizes | mobile  = size_
                                  , tablet  = size_
                                  , desktop = size_ }
    }

{-| TODO
-}
size_ : Maybe Int -> Size
size_ n = case n |> Maybe.map (clamp 1 12) of
           Just 01 -> Size01
           Just 02 -> Size02
           Just 03 -> Size03
           Just 04 -> Size04
           Just 05 -> Size05
           Just 06 -> Size06
           Just 07 -> Size07
           Just 08 -> Size08
           Just 09 -> Size09
           Just 10 -> Size10
           Just 11 -> Size11
           Just 12 -> Size12
           _       -> Auto

{-| TODO
-}
size : Maybe Int -> Column msg -> Column msg
size = size_ >> setDeviceSize All

{-| TODO
-}
size1      : Column msg -> Column msg
size1      = setDeviceSize All Size01      
             
{-| TODO
-}
size2      : Column msg -> Column msg
size2      = setDeviceSize All Size02      
             
{-| TODO
-}
size3      : Column msg -> Column msg
size3      = setDeviceSize All Size03      
             
{-| TODO
-}
size4      : Column msg -> Column msg
size4      = setDeviceSize All Size04      
             
{-| TODO
-}
size5      : Column msg -> Column msg
size5      = setDeviceSize All Size05      
             
{-| TODO
-}
size6      : Column msg -> Column msg
size6      = setDeviceSize All Size06      
             
{-| TODO
-}
size7      : Column msg -> Column msg
size7      = setDeviceSize All Size07      
             
{-| TODO
-}
size8      : Column msg -> Column msg
size8      = setDeviceSize All Size08      
             
{-| TODO
-}
size9      : Column msg -> Column msg
size9      = setDeviceSize All Size09      
             
{-| TODO
-}
size10     : Column msg -> Column msg
size10     = setDeviceSize All Size10     
             
{-| TODO
-}
size11     : Column msg -> Column msg
size11     = setDeviceSize All Size11     
             
{-| TODO
-}
size12     : Column msg -> Column msg
size12     = setDeviceSize All Size12     
             
{-| TODO
-}
sizeAuto   : Column msg -> Column msg
sizeAuto   = setDeviceSize All Auto   
             
{-| TODO
-}
sizeNarrow : Column msg -> Column msg
sizeNarrow = setDeviceSize All Narrow 
             

{-| TODO
-}
mobileSize : Maybe Int -> Column msg -> Column msg
mobileSize = size_ >> setDeviceSize Mobile

{-| TODO
-}
mobileSize1      : Column msg -> Column msg
mobileSize1      = setDeviceSize Mobile Size01      
                    
{-| TODO
-}
mobileSize2      : Column msg -> Column msg
mobileSize2      = setDeviceSize Mobile Size02      
                    
{-| TODO
-}
mobileSize3      : Column msg -> Column msg
mobileSize3      = setDeviceSize Mobile Size03      
                    
{-| TODO
-}
mobileSize4      : Column msg -> Column msg
mobileSize4      = setDeviceSize Mobile Size04      
                    
{-| TODO
-}
mobileSize5      : Column msg -> Column msg
mobileSize5      = setDeviceSize Mobile Size05      
                    
{-| TODO
-}
mobileSize6      : Column msg -> Column msg
mobileSize6      = setDeviceSize Mobile Size06      
                    
{-| TODO
-}
mobileSize7      : Column msg -> Column msg
mobileSize7      = setDeviceSize Mobile Size07      
                    
{-| TODO
-}
mobileSize8      : Column msg -> Column msg
mobileSize8      = setDeviceSize Mobile Size08      
                    
{-| TODO
-}
mobileSize9      : Column msg -> Column msg
mobileSize9      = setDeviceSize Mobile Size09      
                    
{-| TODO
-}
mobileSize10     : Column msg -> Column msg
mobileSize10     = setDeviceSize Mobile Size10     
                   
{-| TODO
-}
mobileSize11     : Column msg -> Column msg
mobileSize11     = setDeviceSize Mobile Size11     
                   
{-| TODO
-}
mobileSize12     : Column msg -> Column msg
mobileSize12     = setDeviceSize Mobile Size12     
                   
{-| TODO
-}
mobileSizeAuto   : Column msg -> Column msg
mobileSizeAuto   = setDeviceSize Mobile Auto   
                   
{-| TODO
-}
mobileSizeNarrow : Column msg -> Column msg
mobileSizeNarrow = setDeviceSize Mobile Narrow 

{-| TODO
-}
tabletSize : Maybe Int -> Column msg -> Column msg
tabletSize = size_ >> setDeviceSize Tablet

{-| TODO
-}
tabletSize1      : Column msg -> Column msg
tabletSize1      = setDeviceSize Tablet Size01      
                    
{-| TODO
-}
tabletSize2      : Column msg -> Column msg
tabletSize2      = setDeviceSize Tablet Size02      
                    
{-| TODO
-}
tabletSize3      : Column msg -> Column msg
tabletSize3      = setDeviceSize Tablet Size03      
                    
{-| TODO
-}
tabletSize4      : Column msg -> Column msg
tabletSize4      = setDeviceSize Tablet Size04      
                    
{-| TODO
-}
tabletSize5      : Column msg -> Column msg
tabletSize5      = setDeviceSize Tablet Size05      
                    
{-| TODO
-}
tabletSize6      : Column msg -> Column msg
tabletSize6      = setDeviceSize Tablet Size06      
                    
{-| TODO
-}
tabletSize7      : Column msg -> Column msg
tabletSize7      = setDeviceSize Tablet Size07      
                    
{-| TODO
-}
tabletSize8      : Column msg -> Column msg
tabletSize8      = setDeviceSize Tablet Size08      
                    
{-| TODO
-}
tabletSize9      : Column msg -> Column msg
tabletSize9      = setDeviceSize Tablet Size09      
                    
{-| TODO
-}
tabletSize10     : Column msg -> Column msg
tabletSize10     = setDeviceSize Tablet Size10     
                   
{-| TODO
-}
tabletSize11     : Column msg -> Column msg
tabletSize11     = setDeviceSize Tablet Size11     
                   
{-| TODO
-}
tabletSize12     : Column msg -> Column msg
tabletSize12     = setDeviceSize Tablet Size12     
                   
{-| TODO
-}
tabletSizeAuto   : Column msg -> Column msg
tabletSizeAuto   = setDeviceSize Tablet Auto   
                   
{-| TODO
-}
tabletSizeNarrow : Column msg -> Column msg
tabletSizeNarrow = setDeviceSize Tablet Narrow 

{-| TODO
-}
desktopSize : Maybe Int -> Column msg -> Column msg
desktopSize = size_ >> setDeviceSize Desktop

{-| TODO
-}
desktopSize1      : Column msg -> Column msg
desktopSize1      = setDeviceSize Desktop Size01      
                     
{-| TODO
-}
desktopSize2      : Column msg -> Column msg
desktopSize2      = setDeviceSize Desktop Size02      
                     
{-| TODO
-}
desktopSize3      : Column msg -> Column msg
desktopSize3      = setDeviceSize Desktop Size03      
                     
{-| TODO
-}
desktopSize4      : Column msg -> Column msg
desktopSize4      = setDeviceSize Desktop Size04      
                     
{-| TODO
-}
desktopSize5      : Column msg -> Column msg
desktopSize5      = setDeviceSize Desktop Size05      
                     
{-| TODO
-}
desktopSize6      : Column msg -> Column msg
desktopSize6      = setDeviceSize Desktop Size06      
                     
{-| TODO
-}
desktopSize7      : Column msg -> Column msg
desktopSize7      = setDeviceSize Desktop Size07      
                     
{-| TODO
-}
desktopSize8      : Column msg -> Column msg
desktopSize8      = setDeviceSize Desktop Size08      
                     
{-| TODO
-}
desktopSize9      : Column msg -> Column msg
desktopSize9      = setDeviceSize Desktop Size09      
                     
{-| TODO
-}
desktopSize10     : Column msg -> Column msg
desktopSize10     = setDeviceSize Desktop Size10     
                    
{-| TODO
-}
desktopSize11     : Column msg -> Column msg
desktopSize11     = setDeviceSize Desktop Size11     
                    
{-| TODO
-}
desktopSize12     : Column msg -> Column msg
desktopSize12     = setDeviceSize Desktop Size12     

{-| TODO
-}
desktopSizeAuto : Column msg -> Column msg
desktopSizeAuto = setDeviceSize Desktop Auto 
                    
{-| TODO
-}
desktopSizeNarrow : Column msg -> Column msg
desktopSizeNarrow = setDeviceSize Desktop Narrow 

{-| TODO
-}
sizeClass : Device -> Size -> String
sizeClass device size
  = let device_ : String
        device_ = case device of
                    All     -> ""
                    Mobile  -> "-mobile"
                    Tablet  -> "-tablet"
                    Desktop -> "-desktop"
                    
    in case size of
         Auto          -> ""
         Narrow        -> "is-narrow"         ++ device_
         Size01        -> "is-1"              ++ device_
         Size02        -> "is-2"              ++ device_
         Size03        -> "is-3"              ++ device_
         Size04        -> "is-4"              ++ device_
         Size05        -> "is-5"              ++ device_
         Size06        -> "is-6"              ++ device_
         Size07        -> "is-7"              ++ device_
         Size08        -> "is-8"              ++ device_
         Size09        -> "is-9"              ++ device_
         Size10        -> "is-10"             ++ device_
         Size11        -> "is-11"             ++ device_
         Size12        -> "is-12"             ++ device_
         ThreeQuarters -> "is-three-quarters" ++ device_
         TwoThirds     -> "is-two-thirds"     ++ device_
         Half          -> "is-half"           ++ device_
         OneThird      -> "is-one-third"      ++ device_
         OneQuarter    -> "is-one-quarter"    ++ device_


-- OFFSETS --

{-| TODO
-}
setOffset : Size -> Column msg -> Column msg
setOffset size_ = mapMods <| \mods -> { mods | offset = size_ }

{-| TODO
-}
offset : Maybe Int -> Column msg -> Column msg
offset = size_ >> setOffset

{-| TODO
-}
offset1    : Column msg -> Column msg
offset1    = setOffset Size01    
             
{-| TODO
-}
offset2    : Column msg -> Column msg
offset2    = setOffset Size02    
             
{-| TODO
-}
offset3    : Column msg -> Column msg
offset3    = setOffset Size03    
             
{-| TODO
-}
offset4    : Column msg -> Column msg
offset4    = setOffset Size04    
             
{-| TODO
-}
offset5    : Column msg -> Column msg
offset5    = setOffset Size05    
             
{-| TODO
-}
offset6    : Column msg -> Column msg
offset6    = setOffset Size06    
             
{-| TODO
-}
offset7    : Column msg -> Column msg
offset7    = setOffset Size07    
             
{-| TODO
-}
offset8    : Column msg -> Column msg
offset8    = setOffset Size08    
             
{-| TODO
-}
offset9    : Column msg -> Column msg
offset9    = setOffset Size09    
             
{-| TODO
-}
offset10   : Column msg -> Column msg
offset10   = setOffset Size10   
             
{-| TODO
-}
offset11   : Column msg -> Column msg
offset11   = setOffset Size11   
             
{-| TODO
-}
offset12   : Column msg -> Column msg
offset12   = setOffset Size12   
             
{-| TODO
-}
offsetAuto : Column msg -> Column msg
offsetAuto = setOffset Auto 

{-| TODO
-}
offsetClass : Size -> String
offsetClass size
  = case size of
      Auto          -> ""
      Narrow        -> ""
      Size01        -> "is-1"
      Size02        -> "is-2"
      Size03        -> "is-3"
      Size04        -> "is-4"
      Size05        -> "is-5"
      Size06        -> "is-6"
      Size07        -> "is-7"
      Size08        -> "is-8"
      Size09        -> "is-9"
      Size10        -> "is-10"
      Size11        -> "is-11"
      Size12        -> "is-12"
      ThreeQuarters -> "is-three-quarters"
      TwoThirds     -> "is-two-thirds"
      Half          -> "is-half"
      OneThird      -> "is-one-third"
      OneQuarter    -> "is-one-quarter"

-- COLUMNS ---------------------------------------------------------------------

{-| TODO
-}
type alias Columns msg = Entity ColumnsModifiers (List (Column msg)) msg

{-| TODO
-}
columns : Attrs msg -> List (Column msg) -> Columns msg
columns = entity "div" [ "columns" ] defaultColumnsModifiers

{-| TODO
-}
toColumn : Attrs msg -> Columns msg -> Column msg
toColumn attrs = column attrs << singleton << toHtml


-- COLUMNS MODIFIERS------------------------------------------------------------

{-| TODO
-}
type alias ColumnsModifiers = { multiline : Bool
                              , gapless   : Bool
                              , display   : Display
                              }

{-| TODO
-}
defaultColumnsModifiers : ColumnsModifiers
defaultColumnsModifiers = { multiline = False
                          , gapless   = False
                          , display   = TabletAndBeyond
                          }

{-| TODO
-}
columnsModsClasses : ColumnsModifiers -> List String
columnsModsClasses {multiline,gapless,display}
  = [ if multiline then "is-multiline" else ""
    , if gapless   then "is-gapless"   else ""
    , case display of
        MobileAndBeyond  -> "is-mobile"
        TabletAndBeyond  -> ""
        DesktopAndBeyond -> "is-tablet"
    ]


-- MULTILINE --

{-| TODO
-}
singleline : Columns msg -> Columns msg
singleline = mapMods <| \mods -> { mods | multiline = False }

{-| TODO
-}
multiline : Columns msg -> Columns msg
multiline = mapMods <| \mods -> { mods | multiline = True }


-- GAPS --

{-| TODO
-}
gapped : Columns msg -> Columns msg
gapped = mapMods <| \mods -> { mods | gapless = False }

{-| TODO
-}
gapless : Columns msg -> Columns msg
gapless = mapMods <| \mods -> { mods | gapless = True }


-- DISPLAY --

{-| TODO
-}
type Display = MobileAndBeyond
             | TabletAndBeyond
             | DesktopAndBeyond

{-| TODO
-}
mobileAndBeyond : Columns msg -> Columns msg
mobileAndBeyond = mapMods <| \mods -> { mods | display = MobileAndBeyond }

{-| TODO
-}
tabletAndBeyond : Columns msg -> Columns msg
tabletAndBeyond = mapMods <| \mods -> { mods | display = TabletAndBeyond }
                  
{-| TODO
-}
desktopAndBeyond : Columns msg -> Columns msg
desktopAndBeyond = mapMods <| \mods -> { mods | display = DesktopAndBeyond }


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Columns msg -> Html msg
toHtml = Entity.toHtml columnsModsClasses (y [])
       <| map
       <| toHtml_

{-| TODO
-}
toHtml_ : Column msg -> Html msg
toHtml_ = Entity.toHtml columnModsClasses (y []) identity

{-| TODO
-}
addClass : String -> Columns msg -> Columns msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Columns msg -> Columns msg
setHelpers = Entity.setHelpers
