
-- IMAGE -----------------------------------------------------------------------

image : List (Attribute msg) -> List (Html msg) -> Image msg

easyImage : AspectRatio -> Size -> String -> Image msg

easierImage : String -> Image msg


-- SIZE ------------------------------------------------------------------------

type Size = X16
          | X24
          | X32
          | X48
          | X64
          | X96
          | X128

unsetSize : Image msg -> Image msg

set16  : Image msg -> Image msg
         
set24  : Image msg -> Image msg
         
set32  : Image msg -> Image msg
         
set48  : Image msg -> Image msg
         
set64  : Image msg -> Image msg
         
set96  : Image msg -> Image msg
         
set128 : Image msg -> Image msg


-- ASPECT RATIO ----------------------------------------------------------------

type AspectRatio = OneByOne
                 | FourByThree
                 | ThreeByTwo
                 | SixteenByNine
                 | TwoByOne

unsetAspectRatio : Image msg -> Image msg

setOneByOne : Image msg -> Image msg
              
setFourByThree : Image msg -> Image msg
                 
setThreeByTwo : Image msg -> Image msg
                
setSixteenByNine : Image msg -> Image msg
                   
setTwoByOne : Image msg -> Image msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Image msg -> Html msg

