
module Bulma.Helpers exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| A set of helpers for style, layout, and typography.

# Table of Contents
- [General Helpers](#general)
- [Display Helpers](#display)
- [Typography Helpers](#typography)

# General

## Float
@docs clearfix
@docs pulledLeft, pulledRight

## Overlay
@docs overlay

## Size
@docs fullWidth

## Spacing
@docs marginless, paddingless

## Selectability
@docs unselectable

## Overflow
@docs clipped

## Style
@docs radiusless, shadowless

# Display
@docs Devices, Display
@docs display, displayByDevice

# Typography

## Transformations
@docs capitalize, uppercase, lowercase

## Size
@docs Display
@docs textSize, textSizeByDevice

## Colors
@docs TextColor
@docs textColor

## Alignment
@docs textLeft, textCentered, textRight
@docs textAlignment, textAlignmentByDevice

-}

-- IMPORTS ---------------------------------------------------------------------

import BulmaClasses exposing (..)

import Bulma.Modifiers exposing ( HorizontalAlignment(..) )

import Html exposing ( Attribute )
import Html.Attributes exposing ( class )

import String exposing ( join )

-- FLOAT -----------------------------------------------------------------------

{-| Fixes an element's floating children.
-}
clearfix : Attribute msg
clearfix = class bulma.properties.float.isClearfix

{-| Moves an element to the left.
-}
pulledLeft : Attribute msg
pulledLeft = class bulma.properties.float.isPulledLeft

{-| Moves an element to the right.
-}
pulledRight : Attribute msg
pulledRight = class bulma.properties.float.isPulledRight


-- INTERACTION -----------------------------------------------------------------

{-| Prevents text from being selectable.
-}
unselectable : Attribute msg
unselectable = class bulma.properties.interaction.isUnselectable
                                                                                                                                

-- OVERLAY----------------------------------------------------------------------

{-| Completely covers the first-positioned parent.
-}
overlay : Attribute msg
overlay = class bulma.properties.sizing.isOverlay


-- SIZING ----------------------------------------------------------------------

{-| Takes up the whole width (100%).
-}
fullWidth : Attribute msg
fullWidth = class bulma.properties.sizing.isFullwidth


-- SPACING ---------------------------------------------------------------------

{-| Removes all margins.
-}
marginless : Attribute msg
marginless = class bulma.properties.sizing.isMarginless

{-| Removes all paddings.
-}
paddingless : Attribute msg
paddingless = class bulma.properties.sizing.isPaddingless


-- CLIPPED ---------------------------------------------------------------------

{-| Adds overflow:hidden.
-}
clipped : Attribute msg
clipped = class "is-clipped"
-- KLUDGE: add "is-clipped" to BulmaClasses


-- RADIUSLESS ------------------------------------------------------------------

{-| Removes any radius.
-}
radiusless : Attribute msg
radiusless = class "is-radiusless"
-- KLUDGE: add "is-radiusless" to BulmaClasses


-- SHADOWLESS ------------------------------------------------------------------

{-| Removes any shadow.
-}
shadowless : Attribute msg
shadowless = class "is-shadowless"
-- KLUDGE: add "is-shadowless" to BulmaClasses


-- DISPLAY ---------------------------------------------------------------------

{-| -}
type alias Devices a = { mobile     : a
                       , tablet     : a
                       , desktop    : a
                       , widescreen : a
                       , fullHD     : a
                       }

{-| -}
type Display = Block       
             | Flex       
             | Hidden
             | Inline    
             | InlineBlock
             | InlineFlex

{-| This sets a certain display attributes across all device sizes.
-}
display : Display -> Attribute msg
display d
  = case d of
      Block       -> class bulma.properties.display.isBlock.always
      Flex        -> class bulma.properties.display.isFlex.always
      Inline      -> class bulma.properties.display.isInline.always
      InlineBlock -> class bulma.properties.display.isInlineBlock.always
      InlineFlex  -> class bulma.properties.display.isInlineFlex.always
      Hidden      -> class bulma.properties.visibility.isHidden.always

{-| This sets display attributes per-device.

    tabletOnly 
      = displayByDevice 
        { mobile     = Hidden
        , tablet     = Block
        , desktop    = Hidden
        , widescreen = Hidden
        , fullHD     = Hidden
        }

-}
displayByDevice : Devices Display -> Attribute msg
displayByDevice {mobile,tablet,desktop,widescreen,fullHD}
  = class
  <| join " "
    [ case mobile of
        Block       -> bulma.properties.display.isBlock.mobile
        Flex        -> bulma.properties.display.isFlex.mobile
        Inline      -> bulma.properties.display.isInline.mobile
        InlineBlock -> bulma.properties.display.isInlineBlock.mobile
        InlineFlex  -> bulma.properties.display.isInlineFlex.mobile
        Hidden      -> bulma.properties.visibility.isHidden.mobile
    , case tablet of
        Block       -> bulma.properties.display.isBlock.tabletOnly
        Flex        -> bulma.properties.display.isFlex.tabletOnly
        Inline      -> bulma.properties.display.isInline.tabletOnly
        InlineBlock -> bulma.properties.display.isInlineBlock.tabletOnly
        InlineFlex  -> bulma.properties.display.isInlineFlex.tabletOnly
        Hidden      -> bulma.properties.visibility.isHidden.tabletOnly
    , case desktop of
        Block       -> bulma.properties.display.isBlock.desktopOnly
        Flex        -> bulma.properties.display.isFlex.desktopOnly
        Inline      -> bulma.properties.display.isInline.desktopOnly
        InlineBlock -> bulma.properties.display.isInlineBlock.desktopOnly
        InlineFlex  -> bulma.properties.display.isInlineFlex.desktopOnly
        Hidden      -> bulma.properties.visibility.isHidden.desktopOnly
    , case widescreen of
        Block       -> "is-block-widescreen-only"
        Flex        -> "is-flex-widescreen-only"
        Inline      -> "is-inline-widescreen-only"
        InlineBlock -> "is-inline-block-widescreen-only"
        InlineFlex  -> "is-inline-flex-widescreen-only"
        Hidden      -> "is-hidden-widescreen-only"
        -- KLUDGE: add widescreen helpers to BulmaClasses
    , case fullHD of
        Block       -> "is-block-fullHD-only"
        Flex        -> "is-flex-fullHD-only"
        Inline      -> "is-inline-fullHD-only"
        InlineBlock -> "is-inline-block-fullHD-only"
        InlineFlex  -> "is-inline-flex-fullHD-only"
        Hidden      -> "is-hidden-fullHD"
        -- KLUDGE: add fullHD helpers to BulmaClasses
    ]


-- TEXT TRANSFORMATIONS --------------------------------------------------------

{-| Transforms the first character to each word to uppercase.
-}
capitalize : Attribute msg
capitalize = class "is-capitalized"
-- KLUDGE: add to BulmaClasses

{-| Transforms all characters to lowercase.
-}
lowercase : Attribute msg
lowercase = class "is-lowercase"
-- KLUDGE: add to BulmaClasses

{-| Transforms all characters to uppercase.
-}
uppercase : Attribute msg
uppercase = class "is-uppercase"
-- KLUDGE: add to BulmaClasses


-- TEXT SIZE -------------------------------------------------------------------

{-| There are 7 font sizes to choose from:
- `textSize 1`: 3.00rem
- `textSize 2`: 2.50rem
- `textSize 3`: 2.00rem
- `textSize 4`: 1.50rem
- `textSize 5`: 1.25rem
- `textSize 6`: 1.00rem
- `textSize 7`: 0.75rem
-}
textSize : Int -> Attribute msg
textSize ts
  = class
    <| case clamp 1 7 ts of
        1 -> "is-size-1"
        2 -> "is-size-2"
        3 -> "is-size-3"
        4 -> "is-size-4"
        5 -> "is-size-5"
        6 -> "is-size-6"
        7 -> "is-size-7"
        _ -> ""
        -- KLUDGE: add to BulmaClasses

{-| You can choose a font specific size for each viewport width.
-}
textSizeByDevice : Devices Int -> Attribute msg
textSizeByDevice {mobile,tablet,desktop,widescreen,fullHD}
  = class
  <| join " "
    [ case clamp 1 7 mobile of
        1 -> "is-size-1-mobile"
        2 -> "is-size-2-mobile"
        3 -> "is-size-3-mobile"
        4 -> "is-size-4-mobile"
        5 -> "is-size-5-mobile"
        6 -> "is-size-6-mobile"
        7 -> "is-size-7-mobile"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 tablet of
        1 -> "is-size-1-tablet"
        2 -> "is-size-2-tablet"
        3 -> "is-size-3-tablet"
        4 -> "is-size-4-tablet"
        5 -> "is-size-5-tablet"
        6 -> "is-size-6-tablet"
        7 -> "is-size-7-tablet"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 desktop of
        1 -> "is-size-1-desktop"
        2 -> "is-size-2-desktop"
        3 -> "is-size-3-desktop"
        4 -> "is-size-4-desktop"
        5 -> "is-size-5-desktop"
        6 -> "is-size-6-desktop"
        7 -> "is-size-7-desktop"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 widescreen of
        1 -> "is-size-1-widescreen"
        2 -> "is-size-2-widescreen"
        3 -> "is-size-3-widescreen"
        4 -> "is-size-4-widescreen"
        5 -> "is-size-5-widescreen"
        6 -> "is-size-6-widescreen"
        7 -> "is-size-7-widescreen"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    , case clamp 1 7 fullHD of
        1 -> "is-size-1-fullhd"
        2 -> "is-size-2-fullhd"
        3 -> "is-size-3-fullhd"
        4 -> "is-size-4-fullhd"
        5 -> "is-size-5-fullhd"
        6 -> "is-size-6-fullhd"
        7 -> "is-size-7-fullhd"
        _ -> ""
        -- KLUDGE: add to BulmaClasses
    ]


-- TEXT ALIGNMENT --------------------------------------------------------------

{-| Aligns text to the left.
-}
textLeft : Attribute msg
textLeft = class bulma.properties.alignment.hasTextLeft

{-| Aligns text to the right.
-}
textCentered : Attribute msg
textCentered = class bulma.properties.alignment.hasTextCentered

{-| Centers text.
-}
textRight : Attribute msg
textRight = class bulma.properties.alignment.hasTextRight

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


-- TEXT COLOR ------------------------------------------------------------------

{-| -}
type TextColor
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
textColor : TextColor -> Attribute msg
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
