
module Bulma.Elements.Image exposing ( Image
                                     , image
                                     , easyImage
                                     , normal
                                     , size16x16
                                     , size24x24
                                     , size32x32
                                     , size48x48
                                     , size64x64
                                     , size96x96
                                     , size128x128
                                     , noAspect
                                     , aspect1x1
                                     , aspect4x3
                                     , aspect3x2
                                     , aspect16x9
                                     , aspect2x1
                                     , toHtml
                                     , addClass
                                     , setHelpers
                                     )
                                     
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Image, image, easyImage

@docs normal, size16x16, size24x24, size32x32, size48x48, size64x64, size96x96, size128x128

@docs noAspect, aspect1x1, aspect4x3, aspect3x2, aspect16x9, aspect2x1

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute, text, div )
import Html.Attributes as Attr exposing ( class )


-- IMAGE -----------------------------------------------------------------------

{-| TODO
-}
type ImageBody msg = ImageHtml (Html msg)
                   | ImageSrc  (String  )

{-| TODO
-}
type alias Image msg = Entity Modifiers (ImageBody msg) msg

{-| TODO
-}
image : Attrs msg -> Html msg -> Image msg
image attrs = entity "figure" [ "image" ] defaultModifiers attrs << ImageHtml

{-| TODO
-}
easyImage : Attrs msg -> String -> Image msg
easyImage attrs = entity "figure" [ "image" ] defaultModifiers attrs << ImageSrc

-- TODO: placeholders


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { aspect : AspectRatio
                       , size   : Size
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { aspect = NoAspect
                   , size   = Normal
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,aspect}
  = [ size   |> sizeClass
    , aspect |> aspectRatioClass
    ]


-- SIZE --

{-| TODO
-}
type Size = Normal
          | X16
          | X24
          | X32
          | X48
          | X64
          | X96
          | X128

{-| TODO
-}
setSize : Size -> Image msg -> Image msg
setSize size_ = mapMods <| \mods -> { mods | size = size_ }

{-| TODO
-}
normal : Image msg -> Image msg
normal = setSize Normal

{-| TODO
-}
size16x16  : Image msg -> Image msg
size16x16 = setSize X16
         
{-| TODO
-}
size24x24  : Image msg -> Image msg
size24x24 = setSize X24
         
{-| TODO
-}
size32x32  : Image msg -> Image msg
size32x32 = setSize X32
         
{-| TODO
-}
size48x48  : Image msg -> Image msg
size48x48 = setSize X48
         
{-| TODO
-}
size64x64  : Image msg -> Image msg
size64x64 = setSize X64
         
{-| TODO
-}
size96x96  : Image msg -> Image msg
size96x96 = setSize X96
         
{-| TODO
-}
size128x128 : Image msg -> Image msg
size128x128 = setSize X128

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      X16    -> "is-16x16"
      X24    -> "is-24x24"
      X32    -> "is-32x32"
      X48    -> "is-48x48"
      X64    -> "is-64x64"
      X96    -> "is-96x96"
      X128   -> "is-128x128"
      Normal -> ""
      

-- ASPECT RATIO --

{-| TODO
-}
type AspectRatio = NoAspect
                 | OneByOne
                 | FourByThree
                 | ThreeByTwo
                 | SixteenByNine
                 | TwoByOne

{-| TODO
-}
setAspectRatio : AspectRatio -> Image msg -> Image msg
setAspectRatio aspect_ = mapMods <| \mods -> { mods | aspect = aspect_ }

{-| TODO
-}
noAspect : Image msg -> Image msg
noAspect = setAspectRatio NoAspect

{-| TODO
-}
aspect1x1 : Image msg -> Image msg
aspect1x1 = setAspectRatio OneByOne
              
{-| TODO
-}
aspect4x3 : Image msg -> Image msg
aspect4x3 = setAspectRatio FourByThree
                 
{-| TODO
-}
aspect3x2 : Image msg -> Image msg
aspect3x2 = setAspectRatio ThreeByTwo
                
{-| TODO
-}
aspect16x9 : Image msg -> Image msg
aspect16x9 = setAspectRatio SixteenByNine
                   
{-| TODO
-}
aspect2x1 : Image msg -> Image msg
aspect2x1 = setAspectRatio TwoByOne

{-| TODO
-}
aspectRatioClass : AspectRatio -> String
aspectRatioClass ratio
  = case ratio of
      NoAspect      -> ""
      OneByOne      -> "is-1by1"
      FourByThree   -> "is-4by3"
      ThreeByTwo    -> "is-3by2"
      SixteenByNine -> "is-16by9"
      TwoByOne      -> "is-2by1"


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Image msg -> Html msg
toHtml = Entity.toHtml modsClasses (y [])
       <| \body ->
         case body of
           ImageHtml html -> [ html                         ]
           ImageSrc  src  -> [ Html.img [ Attr.src src ] [] ]
                            

{-| TODO
-}
addClass : String -> Image msg -> Image msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Image msg -> Image msg
setHelpers helps = Entity.setHelpers helps
