
module Bulma.Modifiers exposing (..)

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
@docs radiusless, shadowless, invisible

## Display
@docs Devices, Display
@docs display, displayByDevice

### Typography
See [Bulma.Modifiiers.Typography](http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest/Bulma-Modifiers-Typography).

-}

-- IMPORTS ---------------------------------------------------------------------

import BulmaClasses exposing (..)

import Html exposing ( Attribute )
import Html.Attributes exposing ( class )

import String exposing ( join )

-- GLOBALS ---------------------------------------------------------------------

{-| -}
type Size
  = Small
  | Normal
  | Medium
  | Large

{-| -}
type Width = Auto
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


-- INVISIBLE -------------------------------------------------------------------

{-| Makes it disappear.
-}
invisible : Attribute msg
invisible = class "is-invisible"
-- KLUDGE: add "is-invisible" to BulmaClasses


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


