
module Bulma.Elements.Image exposing ( Image
                                     , toHtml
                                     , setHelpers
                                     )
                                     
-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- IMAGE -----------------------------------------------------------------------

type Body msg = Src   String
              | Htmls (List (Html msg))

type Image msg = Image { helps : Helpers
                       , size  : Maybe Size
                       , ratio : Maybe AspectRatio
                       , attrs : List (Attribute msg)
                       , body  : Body msg
                       }

easyImage : AspectRatio -> Size -> String -> Image msg
easyImage ratio size src
  = Image { helps = defaultHelpers
          , size  = Just size
          , ratio = Just ratio
          , attrs = []
          , body  = Src src
          }

easierImage : String -> Image msg
easierImage src
  = Image { helps = defaultHelpers
          , size  = Nothing
          , ratio = Nothing
          , attrs = []
          , body  = Src src
          }

image : List (Attribute msg) -> List (Html msg) -> Image msg
image attrs htmls
  = Image { helps = defaultHelpers
          , size  = Nothing
          , ratio = Nothing
          , attrs = attrs
          , body  = Htmls htmls
          }


-- SIZE ------------------------------------------------------------------------

type Size = X16
          | X24
          | X32
          | X48
          | X64
          | X96
          | X128

unsetSize : Image msg -> Image msg
unsetSize image = Image { image | size = Nothing }

set16x16  : Image msg -> Image msg
set16x16 image = Image { image | size = Just X16 }
         
set24x24  : Image msg -> Image msg
set24x24 image = Image { image | size = Just X24 }
         
set32x32  : Image msg -> Image msg
set32x32 image = Image { image | size = Just X32 }
         
set48x48  : Image msg -> Image msg
set48x48 image = Image { image | size = Just X48 }
         
set64x64  : Image msg -> Image msg
set64x64 image = Image { image | size = Just X64 }
         
set96x96  : Image msg -> Image msg
set96x96 image = Image { image | size = Just X96 }
         
set128x128 : Image msg -> Image msg
set128x128 image = Image { image | size = Just X128 }

sizeClass : Maybe Size -> Maybe String
sizeClass size
  = Maybe.map
  <| case size of
      X16  -> "is-16x16"
      X24  -> "is-24x24"
      X32  -> "is-32x32"
      X48  -> "is-48x48"
      X64  -> "is-64x64"
      X96  -> "is-96x96"
      X128 -> "is-128x128"
      

-- ASPECT RATIO ----------------------------------------------------------------

type AspectRatio = OneByOne
                 | FourByThree
                 | ThreeByTwo
                 | SixteenByNine
                 | TwoByOne

unsetAspectRatio : Image msg -> Image msg
unsetAspectRatio image = Image { image | ratio = Nothing }

set1x1 : Image msg -> Image msg
set1x1 image = Image { image | ratio = Just OneByOne }
              
set4x3 : Image msg -> Image msg
set4x3 image = Image { image | ratio = Just FourByThree }
                 
set3x2 : Image msg -> Image msg
set3x2 image = Image { image | ratio = Just ThreeByTwo }
                
set16x9 : Image msg -> Image msg
set16x9 image = Image { image | ratio = Just SixteenByNine }
                   
set2x1 : Image msg -> Image msg
set2x1 image = Image { image | ratio = Just TwoByOne }

aspectRatioClass : Maybe AspectRatio -> Maybe String
aspectRatioClass ratio
  = Maybe.map
  <| case ratio of
      OneByOne      -> "is-1by1"
      FourByThree   -> "is-4by3"
      ThreeByTwo    -> "is-3by2"
      SixteenByNine -> "is-16by9"
      TwoByOne      -> "is-2by1"


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Image msg -> Html msg
toHtml {helps,size,ratio,attrs,body}
  = let classes : List String
        classes = (::) "image"
                <| Maybe_.values
                <| [ aspectRatioClass ratio
                  ,        sizeClass size
                  ]

        htmls : List (Html msg)
        htmls = case body of
                  Htmls h ->             h
                  Src   s -> [ img [ src s ] [] ]
                  
    in node helps "figure" classes attrs htmls

