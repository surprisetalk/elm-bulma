
module Bulma.Grid.Columns exposing ( Columns
                                   , columns
                                   )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )
import Html.Attributes exposing ( classList )


-- HELPERS ---------------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)


-- COLUMN ----------------------------------------------------------------------

type Column msg = Column { helps  : Helpers
                         , attrs  : List (Attribute msg)
                         , htmls  : List (Html      msg)
                         , offset : Size
                         , sizes  : { mobile  : Size
                                    , tablet  : Size
                                    , desktop : Size
                                    }
                         }

column : List (Attribute msg) -> List (Html msg) -> Column msg
column attrs htmls
  = Column { helps  = defaultHelpers
           , attrs  = attrs
           , htmls  = htmls
           , offset = Auto
           , sizes  = { mobile  = Auto
                      , tablet  = Auto
                      , desktop = Auto
                      }
           }


-- DEVICE SIZES --

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


type Device = All
            | Mobile
            | Tablet
            | Desktop

setDeviceSize : Device -> Size -> Column msg -> Column msg
setDeviceSize device size_ (Column ({sizes} as column))
  = { column
    | sizes = case device of
                Mobile  -> { sizes | mobile  = size_ }
                Tablet  -> { sizes | tablet  = size_ }
                Desktop -> { sizes | desktop = size_ }
                All     -> { sizes | mobile  = size_
                                  , tablet  = size_
                                  , desktop = size_ }
    }

size : Maybe Int -> Size
size n = case n |> Maybe.map (clamp 1 12) of
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

setSize : Maybe Int -> Column msg -> Column msg
setSize = size >> setDeviceSize All

size1      : Column msg -> Column msg
size1      = setDeviceSize All Size01      
             
size2      : Column msg -> Column msg
size2      = setDeviceSize All Size02      
             
size3      : Column msg -> Column msg
size3      = setDeviceSize All Size03      
             
size4      : Column msg -> Column msg
size4      = setDeviceSize All Size04      
             
size5      : Column msg -> Column msg
size5      = setDeviceSize All Size05      
             
size6      : Column msg -> Column msg
size6      = setDeviceSize All Size06      
             
size7      : Column msg -> Column msg
size7      = setDeviceSize All Size07      
             
size8      : Column msg -> Column msg
size8      = setDeviceSize All Size08      
             
size9      : Column msg -> Column msg
size9      = setDeviceSize All Size09      
             
size10     : Column msg -> Column msg
size10     = setDeviceSize All Size10     
             
size11     : Column msg -> Column msg
size11     = setDeviceSize All Size11     
             
size12     : Column msg -> Column msg
size12     = setDeviceSize All Size12     
             
sizeAuto   : Column msg -> Column msg
sizeAuto   = setDeviceSize All Auto   
             
sizeNarrow : Column msg -> Column msg
sizeNarrow = setDeviceSize All Narrow 
             

mobileSize : Maybe Int -> Column msg -> Column msg
mobileSize = size >> setDeviceSize Mobile

mobileSize01      : Column msg -> Column msg
mobileSize01      = setDeviceSize Mobile Size01      
                    
mobileSize02      : Column msg -> Column msg
mobileSize02      = setDeviceSize Mobile Size02      
                    
mobileSize03      : Column msg -> Column msg
mobileSize03      = setDeviceSize Mobile Size03      
                    
mobileSize04      : Column msg -> Column msg
mobileSize04      = setDeviceSize Mobile Size04      
                    
mobileSize05      : Column msg -> Column msg
mobileSize05      = setDeviceSize Mobile Size05      
                    
mobileSize06      : Column msg -> Column msg
mobileSize06      = setDeviceSize Mobile Size06      
                    
mobileSize07      : Column msg -> Column msg
mobileSize07      = setDeviceSize Mobile Size07      
                    
mobileSize08      : Column msg -> Column msg
mobileSize08      = setDeviceSize Mobile Size08      
                    
mobileSize09      : Column msg -> Column msg
mobileSize09      = setDeviceSize Mobile Size09      
                    
mobileSize10     : Column msg -> Column msg
mobileSize10     = setDeviceSize Mobile Size10     
                   
mobileSize11     : Column msg -> Column msg
mobileSize11     = setDeviceSize Mobile Size11     
                   
mobileSize12     : Column msg -> Column msg
mobileSize12     = setDeviceSize Mobile Size12     
                   
mobileSizeAuto   : Column msg -> Column msg
mobileSizeAuto   = setDeviceSize Mobile Auto   
                   
mobileSizeNarrow : Column msg -> Column msg
mobileSizeNarrow = setDeviceSize Mobile Narrow 

tabletSize : Maybe Int -> Column msg -> Column msg
tabletSize = size >> setDeviceSize Tablet

tabletSize01      : Column msg -> Column msg
tabletSize01      = setDeviceSize Tablet Size01      
                    
tabletSize02      : Column msg -> Column msg
tabletSize02      = setDeviceSize Tablet Size02      
                    
tabletSize03      : Column msg -> Column msg
tabletSize03      = setDeviceSize Tablet Size03      
                    
tabletSize04      : Column msg -> Column msg
tabletSize04      = setDeviceSize Tablet Size04      
                    
tabletSize05      : Column msg -> Column msg
tabletSize05      = setDeviceSize Tablet Size05      
                    
tabletSize06      : Column msg -> Column msg
tabletSize06      = setDeviceSize Tablet Size06      
                    
tabletSize07      : Column msg -> Column msg
tabletSize07      = setDeviceSize Tablet Size07      
                    
tabletSize08      : Column msg -> Column msg
tabletSize08      = setDeviceSize Tablet Size08      
                    
tabletSize09      : Column msg -> Column msg
tabletSize09      = setDeviceSize Tablet Size09      
                    
tabletSize10     : Column msg -> Column msg
tabletSize10     = setDeviceSize Tablet Size10     
                   
tabletSize11     : Column msg -> Column msg
tabletSize11     = setDeviceSize Tablet Size11     
                   
tabletSize12     : Column msg -> Column msg
tabletSize12     = setDeviceSize Tablet Size12     
                   
tabletSizeAuto   : Column msg -> Column msg
tabletSizeAuto   = setDeviceSize Tablet Auto   
                   
tabletSizeNarrow : Column msg -> Column msg
tabletSizeNarrow = setDeviceSize Tablet Narrow 

desktopSize : Maybe Int -> Column msg -> Column msg
desktopSize = size >> setDeviceSize Desktop

desktopSize01      : Column msg -> Column msg
desktopSize01      = setDeviceSize Desktop Size01      
                     
desktopSize02      : Column msg -> Column msg
desktopSize02      = setDeviceSize Desktop Size02      
                     
desktopSize03      : Column msg -> Column msg
desktopSize03      = setDeviceSize Desktop Size03      
                     
desktopSize04      : Column msg -> Column msg
desktopSize04      = setDeviceSize Desktop Size04      
                     
desktopSize05      : Column msg -> Column msg
desktopSize05      = setDeviceSize Desktop Size05      
                     
desktopSize06      : Column msg -> Column msg
desktopSize06      = setDeviceSize Desktop Size06      
                     
desktopSize07      : Column msg -> Column msg
desktopSize07      = setDeviceSize Desktop Size07      
                     
desktopSize08      : Column msg -> Column msg
desktopSize08      = setDeviceSize Desktop Size08      
                     
desktopSize09      : Column msg -> Column msg
desktopSize09      = setDeviceSize Desktop Size09      
                     
desktopSize10     : Column msg -> Column msg
desktopSize10     = setDeviceSize Desktop Size10     
                    
desktopSize11     : Column msg -> Column msg
desktopSize11     = setDeviceSize Desktop Size11     
                    
desktopSize12     : Column msg -> Column msg
desktopSize12     = setDeviceSize Desktop Size12     
                    
desktopSizeNarrow : Column msg -> Column msg
desktopSizeNarrow = setDeviceSize Desktop Narrow 

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


-- OFFSETS --

setOffset : Size -> Column msg -> Column msg
setOffset size_ (Column column)
  = Column { column | offset = size_ }

offset : Maybe Int -> Column msg -> Column msg
offset = size >> setOffset

offset1    : Column msg -> Column msg
offset1    = setOffset Size01    
             
offset2    : Column msg -> Column msg
offset2    = setOffset Size02    
             
offset3    : Column msg -> Column msg
offset3    = setOffset Size03    
             
offset4    : Column msg -> Column msg
offset4    = setOffset Size04    
             
offset5    : Column msg -> Column msg
offset5    = setOffset Size05    
             
offset6    : Column msg -> Column msg
offset6    = setOffset Size06    
             
offset7    : Column msg -> Column msg
offset7    = setOffset Size07    
             
offset8    : Column msg -> Column msg
offset8    = setOffset Size08    
             
offset9    : Column msg -> Column msg
offset9    = setOffset Size09    
             
offset10   : Column msg -> Column msg
offset10   = setOffset Size10   
             
offset11   : Column msg -> Column msg
offset11   = setOffset Size11   
             
offset12   : Column msg -> Column msg
offset12   = setOffset Size12   
             
offsetAuto : Column msg -> Column msg
offsetAuto = setOffset Auto 


-- COLUMNS ---------------------------------------------------------------------

type Columns msg = Columns { helps     : Helpers
                           , attrs     : List (Attribute msg)
                           , cols      : List (Column    msg)
                           , multiline : Bool
                           , gapless   : Bool
                           , display   : Display
                           }

columns : List (Attribute msg) -> List (Column msg) -> Columns msg
columns attrs cols
  = Columns { helps     = defaultHelpers
            , attrs     = attrs
            , cols      = cols
            , multiline = False
            , gapless   = False
            , display   = TabletAndBeyond
            }

toColumn : List (Attribute msg) -> Columns msg -> Column msg
toColumn attrs = column attrs << singleton << toHtml


-- MULTILINE --

singleline : Columns msg -> Columns msg
singleline (Columns columns)
  = Columns { columns | multiline = False }

multiline : Columns msg -> Columns msg
multiline (Columns columns)
  = Columns { columns | multiline = True }


-- GAPS --

gapped : Columns msg -> Columns msg
gapped (Columns columns)
  = Columns { columns | gapless = False }

gapless : Columns msg -> Columns msg
gapless (Columns columns)
  = Columns { columns | gapless = True }


-- DISPLAY --

type Display = MobileAndBeyond
             | TabletAndBeyond
             | DesktopAndBeyond

mobileAndBeyond : Columns msg -> Columns msg
mobileAndBeyond (Columns columns)
  = Columns { columns | display = MobileAndBeyond }

tabletAndBeyond : Columns msg -> Columns msg
tabletAndBeyond (Columns columns)
  = Columns { columns | display = TabletAndBeyond }
                  
desktopAndBeyond : Columns msg -> Columns msg
desktopAndBeyond (Columns columns)
  = Columns { columns | display = DesktopAndBeyond }


-- HTML ------------------------------------------------------------------------

toHtml : Columns msg -> Html msg
toHtml (Columns {helps,attrs,cols,multiline,gapped,display})
  = let toHtml_ : Column msg -> Html msg
        toHtml_ (Column {helps,attrs,htmls,sizes,offset})
          = let classes : List String
                classes = flip (::) "column"
                        <| Maybe_.values
                        <| [ sizes.mobile  |> sizeToString |> Maybe.map (\s -> "is-" ++ s ++ "-mobile" )
                          , sizes.tablet  |> sizeToString |> Maybe.map (\s -> "is-" ++ s ++ "-tablet" )
                          , sizes.desktop |> sizeToString |> Maybe.map (\s -> "is-" ++ s ++ "-desktop")
                          , offset        |> sizeToString |> Maybe.map ((++) "is-offset-")
                          ]
        
            in node helps "div" classes attrs htmls

        classes : List String
        classes = [ "columns"
                  , if       multiline
                    then "is-multiline"
                    else ""
                  , if       gapped
                    then "is-gapped"
                    else ""
                  , case display of
                      MobileAndBeyond  -> "is-mobile"
                      TabletAndBeyond  -> ""
                      DesktopAndBeyond -> "is-tablet"
                  ]
        
    in node helps "div" classes attrs
     <| map toHtml_
     <| cols
                

-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Columns msg -> Columns msg
setHelpers helps_ (Columns columns) = { columns | helps = helps_ }

