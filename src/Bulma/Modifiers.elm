
module Bulma.Modifiers exposing
  ( Size(..)
  , Width(..)
  , State(..)
  , IsActive
  , Color(..)
  , HorizontalAlignment(..)
  , VerticalAlignment(..)
  , VerticalDirection(..)
  , clearfix
  , pulledLeft
  , pulledRight
  , overlay
  , fullWidth
  , marginless
  , paddingless
  , unselectable
  , clipped
  , radiusless
  , shadowless
  , invisible
  , screenReaderOnly
  , Devices
  , Display(..)
  , display
  , displayByDevice
  )

-- DOCS ------------------------------------------------------------------------

{-| Most Bulma elements have alternative styles. 
These types will come in handy for various modifiers records throughout this library.
Also included are a set of helpers for style, layout.

# Table of Contents
- [Global Union Types](#types)
- [Global Attributes](#attributes)
  - [General Helpers](#general)
  - [Display Helpers](#display)
  - [Typography Helpers](#typography)

# Types

## Size
@docs Size
@docs Width

## State
@docs State
@docs IsActive

## Color
@docs Color

## Alignment
@docs HorizontalAlignment, VerticalAlignment

## Direction
@docs VerticalDirection

# Attributes

## General

### Float
@docs clearfix
@docs pulledLeft, pulledRight

### Overlay
@docs overlay

### Size

### Sizing
@docs fullWidth

### Spacing
@docs marginless, paddingless

### Selectability
@docs unselectable

### Overflow
@docs clipped

### Style
@docs radiusless, shadowless, invisible, screenReaderOnly

## Display
@docs Devices, Display
@docs display, displayByDevice

### Typography
See [Bulma.Modifiiers.Typography](http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest/Bulma-Modifiers-Typography).

-}

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Classes as B

import Html exposing ( Attribute )
import Html.Attributes exposing ( class )

import String exposing ( join )

-- GLOBALS ---------------------------------------------------------------------

{-| -}
type Size
  = Small
  | Standard
  | Medium
  | Large

{-| -}
type Width
  = Auto
  | Width1
  | Width2
  | Width3
  | Width4
  | Width5
  | Width6
  | Width7
  | Width8
  | Width9
  | Width10
  | Width11
    
{-| -}
type State
  = Blur
  | Hover
  | Focus
  | Active
  | Loading

{-| -}
type Color
  = Default
  | White
  | Light
  | Dark
  | Black
  | Primary
  | Link
  | Info
  | Success
  | Warning
  | Danger

{-| -}
type HorizontalAlignment
  = Left
  | Centered
  | Right

-- TODO: Centerable HorizontalAlignment

{-| -}
type VerticalAlignment
  = Top
  | Bottom

{-| -}
type VerticalDirection
  = Up
  | Down

{-| -}
type alias IsActive
  = Bool

-- FLOAT -----------------------------------------------------------------------

{-| Fixes an element's floating children.
-}
clearfix : Attribute msg
clearfix = B.isClearfix

{-| Moves an element to the left.
-}
pulledLeft : Attribute msg
pulledLeft = B.isPulledLeft

{-| Moves an element to the right.
-}
pulledRight : Attribute msg
pulledRight = B.isPulledRight


-- INTERACTION -----------------------------------------------------------------

{-| Prevents text from being selectable.
-}
unselectable : Attribute msg
unselectable = B.isUnselectable
                                                                                                                                

-- OVERLAY----------------------------------------------------------------------

{-| Completely covers the first-positioned parent.
-}
overlay : Attribute msg
overlay = B.isOverlay


-- SIZING ----------------------------------------------------------------------

{-| Takes up the whole width (100%).
-}
fullWidth : Attribute msg
fullWidth = B.isFullWidth


-- SPACING ---------------------------------------------------------------------

{-| Removes all margins.
-}
marginless : Attribute msg
marginless = B.isMarginless

{-| Removes all paddings.
-}
paddingless : Attribute msg
paddingless = B.isPaddingless


-- CLIPPED ---------------------------------------------------------------------

{-| Adds overflow:hidden.
-}
clipped : Attribute msg
clipped = B.isClipped


-- RADIUSLESS ------------------------------------------------------------------

{-| Removes any radius.
-}
radiusless : Attribute msg
radiusless = B.isRadiusless


-- SHADOWLESS ------------------------------------------------------------------

{-| Removes any shadow.
-}
shadowless : Attribute msg
shadowless = B.isShadowless


-- INVISIBLE -------------------------------------------------------------------

{-| Makes it disappear.
-}
invisible : Attribute msg
invisible = B.isInvisible

{-| Hides element visually, but keeps the element available to be announced by a screen reader.
-}
screenReaderOnly : Attribute msg
screenReaderOnly = B.isSROnly


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
      Block       -> B.isBlock
      Flex        -> B.isFlex
      Inline      -> B.isInline
      InlineBlock -> B.isInlineBlock
      InlineFlex  -> B.isInlineFlex
      Hidden      -> B.isHidden

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
        Block       -> "is-block-mobile"
        Flex        -> "is-flex-mobile"
        Inline      -> "is-inline-mobile"
        InlineBlock -> "is-inline-block-mobile"
        InlineFlex  -> "is-inline-flex-mobile"
        Hidden      -> "is-hidden-mobile"
    , case tablet of
        Block       -> "is-block-tablet-only"
        Flex        -> "is-flex-tablet-only"
        Inline      -> "is-inline-tablet-only"
        InlineBlock -> "is-inline-block-tablet-only"
        InlineFlex  -> "is-inline-flex-tablet-only"
        Hidden      -> "is-hidden-tablet-only"
    , case desktop of
        Block       -> "is-block-desktop-only"
        Flex        -> "is-flex-desktop-only"
        Inline      -> "is-inline-desktop-only"
        InlineBlock -> "is-inline-block-desktop-only"
        InlineFlex  -> "is-inline-flex-desktop-only"
        Hidden      -> "is-hidden-desktop-only"
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


