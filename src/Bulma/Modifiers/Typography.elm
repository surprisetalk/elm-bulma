
module Bulma.Modifiers.Typography exposing
  ( capitalize
  , uppercase
  , lowercase
  , italicize
  , Size(..)
  , textSize
  , textSizeByDevice
  , Weight(..)
  , textWeight
  , Color(..)
  , textColor
  , textLeft
  , textCentered
  , textRight
  , textJustified
  , textAlignment
  , textAlignmentByDevice
  )

-- DOCS ------------------------------------------------------------------------

{-| This module includes all the modifiers that apply exclusively to text!
It's really handy have attributes like `textCentered` and `Text.danger` to throw at all your Html elements.

# Transformations
@docs capitalize, uppercase, lowercase, italicize

# Size
@docs Size
@docs textSize, textSizeByDevice

# Weight
@docs Weight
@docs textWeight

# Colors
@docs Color
@docs textColor

# Alignment
@docs textLeft, textCentered, textRight, textJustified
@docs textAlignment, textAlignmentByDevice

-}

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Classes as B

import Bulma.Modifiers exposing ( Devices, HorizontalAlignment(..) )

import Html exposing ( Attribute )
import Html.Attributes exposing ( class )

import String exposing ( join )

-- TEXT TRANSFORMATIONS --------------------------------------------------------

{-| Transforms the first character to each word to uppercase.
-}
capitalize : Attribute msg
capitalize = B.isCapitalized

{-| Transforms all characters to lowercase.
-}
lowercase : Attribute msg
lowercase = B.isLowercase

{-| Transforms all characters to uppercase.
-}
uppercase : Attribute msg
uppercase = B.isUppercase

{-| Italicizes text.
-}
italicize : Attribute msg
italicize = B.isItalic


-- TEXT SIZE -------------------------------------------------------------------

{-| -}
type Size
  = Largest
  | EvenLarger
  | Larger
  | Large
  | Medium
  | Standard
  | Small

{-| There are 7 font sizes to choose from:
- `textSize Largest   `: 3.00rem
- `textSize EvenLarger`: 2.50rem
- `textSize Larger    `: 2.00rem
- `textSize Large     `: 1.50rem
- `textSize Medium    `: 1.25rem
- `textSize Standard  `: 1.00rem
- `textSize Small     `: 0.75rem
-}
textSize : Size -> Attribute msg
textSize ts
  = case ts of
      Largest    -> B.isSize1
      EvenLarger -> B.isSize2
      Larger     -> B.isSize3
      Large      -> B.isSize4
      Medium     -> B.isSize5
      Standard   -> B.isSize6
      Small      -> B.isSize7

{-| You can choose a font specific size for each viewport width.
-}
textSizeByDevice : Devices Size -> Attribute msg
textSizeByDevice {mobile,tablet,desktop,widescreen,fullHD}
  = class
  <| join " "
    [ case mobile of
        Largest    -> "is-size-1-mobile"
        EvenLarger -> "is-size-2-mobile"
        Larger     -> "is-size-3-mobile"
        Large      -> "is-size-4-mobile"
        Medium     -> "is-size-5-mobile"
        Standard   -> "is-size-6-mobile"
        Small      -> "is-size-7-mobile"
        -- KLUDGE: add to BulmaClasses
    , case tablet of
        Largest    -> "is-size-1-tablet"
        EvenLarger -> "is-size-2-tablet"
        Larger     -> "is-size-3-tablet"
        Large      -> "is-size-4-tablet"
        Medium     -> "is-size-5-tablet"
        Standard   -> "is-size-6-tablet"
        Small      -> "is-size-7-tablet"
        -- KLUDGE: add to BulmaClasses
    , case desktop of
        Largest    -> "is-size-1-desktop"
        EvenLarger -> "is-size-2-desktop"
        Larger     -> "is-size-3-desktop"
        Large      -> "is-size-4-desktop"
        Medium     -> "is-size-5-desktop"
        Standard   -> "is-size-6-desktop"
        Small      -> "is-size-7-desktop"
        -- KLUDGE: add to BulmaClasses
    , case widescreen of
        Largest    -> "is-size-1-widescreen"
        EvenLarger -> "is-size-2-widescreen"
        Larger     -> "is-size-3-widescreen"
        Large      -> "is-size-4-widescreen"
        Medium     -> "is-size-5-widescreen"
        Standard   -> "is-size-6-widescreen"
        Small      -> "is-size-7-widescreen"
        -- KLUDGE: add to BulmaClasses
    , case fullHD of
        Largest    -> "is-size-1-fullhd"
        EvenLarger -> "is-size-2-fullhd"
        Larger     -> "is-size-3-fullhd"
        Large      -> "is-size-4-fullhd"
        Medium     -> "is-size-5-fullhd"
        Standard   -> "is-size-6-fullhd"
        Small      -> "is-size-7-fullhd"
        -- KLUDGE: add to BulmaClasses
    ]


-- TEXT ALIGNMENT --------------------------------------------------------------

{-| Aligns text to the left.
-}
textLeft : Attribute msg
textLeft = B.hasTextLeft

{-| Centers text.
-}
textCentered : Attribute msg
textCentered = B.hasTextCentered

{-| Aligns text to the right.
-}
textRight : Attribute msg
textRight = B.hasTextRight

{-| Justifies text.
-}
textJustified : Attribute msg
textJustified = B.hasTextJustified

{-| Aligns text.
-}
textAlignment : HorizontalAlignment -> Attribute msg
textAlignment alignment
  = case alignment of
        Left     -> textLeft
        Centered -> textCentered
        Right    -> textRight

{-| Aligns text based on a device's viewport width.
-}
textAlignmentByDevice : Devices HorizontalAlignment -> Attribute msg
textAlignmentByDevice {mobile,tablet,desktop,widescreen,fullHD}
  = class
  <| join " "
    [ case mobile of
        Left     -> "has-text-left-mobile"
        Centered -> "has-text-centered-mobile"
        Right    -> "has-text-right-mobile"
        -- KLUDGE: add to BulmaClasses
    , case tablet of
        Left     -> "has-text-left-tablet-only"
        Centered -> "has-text-centered-tablet-only"
        Right    -> "has-text-right-tablet-only"
        -- KLUDGE: add to BulmaClasses
    , case desktop of
        Left     -> "has-text-left-desktop-only"
        Centered -> "has-text-centered-desktop-only"
        Right    -> "has-text-right-desktop-only"
        -- KLUDGE: add to BulmaClasses
    , case widescreen of
        Left     -> "has-text-left-widescreen-only"
        Centered -> "has-text-centered-widescreen-only"
        Right    -> "has-text-right-widescreen-only"
        -- KLUDGE: add to BulmaClasses
    , case fullHD of
        Left     -> "has-text-left-fullHD"
        Centered -> "has-text-centered-fullHD"
        Right    -> "has-text-right-fullHD"
        -- KLUDGE: add to BulmaClasses
    ]


-- TEXT WEIGHT -----------------------------------------------------------------

{-| -}
type Weight
  = Light
  | Normal
  | Semibold
  | Bold

{-| You can set any text to one of four font-weights.
-}
textWeight : Weight -> Attribute msg
textWeight weight
  = class
  <| case weight of
      Light    -> "has-text-weight-light"
      Normal   -> "has-text-weight-normal"
      Semibold -> "has-text-weight-semibold"
      Bold     -> "has-text-weight-bold"


-- TEXT COLOR ------------------------------------------------------------------

{-| -}
type Color
  = Black
  | BlackLight
  | BlackLighter
  | GreyDarker
  | GreyDark
  | Grey
  | GreyLight
  | GreyLighter
  | WhiteDarker
  | WhiteDark
  | White
  | Primary
  | Info
  | Success
  | Warning
  | Danger

{-| You can set any text to one of the 5 colors or 11 shades of grey.
-}
textColor : Color -> Attribute msg
textColor color
  = class
  <| case color of
      Black        -> "has-text-black"
      BlackLight   -> "has-text-black-bis"
      BlackLighter -> "has-text-black-ter"
      GreyDarker   -> "has-text-grey-darker"
      GreyDark     -> "has-text-grey-dark"
      Grey         -> "has-text-grey"
      GreyLight    -> "has-text-grey-light"
      GreyLighter  -> "has-text-grey-lighter"
      WhiteDarker  -> "has-text-white-bis"
      WhiteDark    -> "has-text-white-ter"
      White        -> "has-text-white"
      Primary      -> "has-text-primary"
      Info         -> "has-text-info"
      Success      -> "has-text-success"
      Warning      -> "has-text-warning"
      Danger       -> "has-text-danger"
