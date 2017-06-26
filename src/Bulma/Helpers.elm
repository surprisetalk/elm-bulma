
module Bulma.Helpers exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Float
@docs clearfix
@docs pulledLeft, pulledRight

# Overlay
@docs overlay

# Size
@docs fullWidth

# Text Alignment
@docs textLeft, textCentered, textRight

# Spacing
@docs marginless, paddingless

# Selectability
@docs unselectable

# Display
@docs Devices, Display
@docs display, displayByDevice

-}

-- IMPORTS ---------------------------------------------------------------------

import BulmaClasses exposing (..)

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


-- DISPLAY ---------------------------------------------------------------------

{-| TODO
-}
type alias Devices a = { mobile     : a
                       , tablet     : a
                       , desktop    : a
                       , widescreen : a
                       }

{-| TODO
-}
type Display = Block       
             | Flex       
             | Hidden
             | Inline    
             | InlineBlock
             | InlineFlex

{-| TODO
-}
display : Display -> Attribute msg
display d
  = case d of
      Block       -> class bulma.properties.display.isBlock.always
      Flex        -> class bulma.properties.display.isFlex.always
      Hidden      -> class bulma.properties.display.isInline.always
      Inline      -> class bulma.properties.display.isInlineBlock.always
      InlineBlock -> class bulma.properties.display.isInlineFlex.always
      InlineFlex  -> class bulma.properties.visibility.isHidden.always

{-| TODO
-}
displayByDevice : Devices Display -> Attribute msg
displayByDevice {mobile,tablet,desktop,widescreen}
  = class
  <| join " "
    [ case mobile of
        Block       -> bulma.properties.display.isBlock.mobile
        Flex        -> bulma.properties.display.isFlex.mobile
        Hidden      -> bulma.properties.display.isInline.mobile
        Inline      -> bulma.properties.display.isInlineBlock.mobile
        InlineBlock -> bulma.properties.display.isInlineFlex.mobile
        InlineFlex  -> bulma.properties.visibility.isHidden.mobile
    , case tablet of
        Block       -> bulma.properties.display.isBlock.tabletOnly
        Flex        -> bulma.properties.display.isFlex.tabletOnly
        Hidden      -> bulma.properties.display.isInline.tabletOnly
        Inline      -> bulma.properties.display.isInlineBlock.tabletOnly
        InlineBlock -> bulma.properties.display.isInlineFlex.tabletOnly
        InlineFlex  -> bulma.properties.visibility.isHidden.tabletOnly
    , case desktop of
        Block       -> bulma.properties.display.isBlock.desktopOnly
        Flex        -> bulma.properties.display.isFlex.desktopOnly
        Hidden      -> bulma.properties.display.isInline.desktopOnly
        Inline      -> bulma.properties.display.isInlineBlock.desktopOnly
        InlineBlock -> bulma.properties.display.isInlineFlex.desktopOnly
        InlineFlex  -> bulma.properties.visibility.isHidden.desktopOnly
    , case widescreen of
        Block       -> bulma.properties.display.isBlock.widescreen
        Flex        -> bulma.properties.display.isFlex.widescreen
        Hidden      -> bulma.properties.display.isInline.widescreen
        Inline      -> bulma.properties.display.isInlineBlock.widescreen
        InlineBlock -> bulma.properties.display.isInlineFlex.widescreen
        InlineFlex  -> bulma.properties.visibility.isHidden.widescreen
    ]

