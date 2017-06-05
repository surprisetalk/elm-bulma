
-- SIZE ------------------------------------------------------------------------

type Size = X16
          | X24
          | X32
          | X48
          | X64
          | X96
          | X128

size : Int -> Maybe Size

x16  : Size

x24  : Size

x32  : Size

x48  : Size

x64  : Size

x96  : Size

x128 : Size


-- ASPECT RATIO ----------------------------------------------------------------

type AspectRatio = OneByOne
                 | FourByThree
                 | ThreeByTwo
                 | SixteenByNine
                 | TwoByOne

aspectRatio : Int -> Int -> Maybe AspectRatio

oneByOne : AspectRatio

fourByThree : AspectRatio

threeByTwo : AspectRatio

sixteenByNine : AspectRatio

twoByOne : AspectRatio


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Image msg -> Html msg


-- IMAGE -----------------------------------------------------------------------

image : AspectRatio -> Size -> List (Attribute msg) -> List (Html msg) -> Image msg

easyImage : AspectRatio -> Size -> Image.Modifiers -> String -> Image msg

