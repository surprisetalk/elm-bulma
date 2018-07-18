
module Bulma.Classes exposing (..)

-- DOCS ------------------------------------------------------------------------

-- TODO: Organize code and documentation.

{-|
# Table of Contents
- [Modifiers](#modifiers)
- [Columns](#columns)
- [Layout](#layout)
- [Form](#form)
- [Elements](#elements)
- [Components](#components)

@docs none

# Modifiers
@docs isBold, isPrimary, isInfo, isSuccess, isWarning, isDanger, isLight, isDark, isWhite, isBlack, isLink
@docs isSmall, isNormal, isMedium, isLarge, isFullHeight
@docs isActive, isHovered, isFocused, isLoading, isStatic
@docs is0, is1, is2, is3, is4, is5, is6, is7, is8, is9, is10, is11, is12
@docs is0, is1, is02, is03, is04, is05, is06, is07, is08, is09, is10, is11, is12
@docs isRight, isUp
@docs isRounded
@docs isBoxed
@docs isHoverable
@docs isCentered
@docs isFullWidth
@docs isMobile, isDesktop

## Helpers
@docs isClearfix, isPulledLeft, isPulledRight
@docs isMarginless, isPaddingless
@docs isOverlay, isClipped, isRadiusless, isShadowless, isUnselectable, isInvisible, isSROnly

## Responsive Helpers
@docs isBlock, isFlex, isHidden, isInline, isInlineBlock, isInlineFlex
@docs isBlockMobile, isBlockTabletOnly, isBlockDesktopOnly, isBlockWidescreenOnly, isBlockTouch, isBlockTablet, isBlockDesktop, isBlockWidescreen, isBlockFullHD
@docs isFlexMobile, isFlexTabletOnly, isFlexDesktopOnly, isFlexWidescreenOnly, isFlexTouch, isFlexTablet, isFlexDesktop, isFlexWidescreen, isFlexFullHD
@docs isInlineMobile, isInlineTabletOnly, isInlineDesktopOnly, isInlineWidescreenOnly, isInlineTouch, isInlineTablet, isInlineDesktop, isInlineWidescreen, isInlineFullHD
@docs isInlineBlockMobile, isInlineBlockTabletOnly, isInlineBlockDesktopOnly, isInlineBlockWidescreenOnly, isInlineBlockTouch, isInlineBlockTablet, isInlineBlockDesktop, isInlineBlockWidescreen, isInlineBlockFullHD
@docs isInlineFlexMobile, isInlineFlexTabletOnly, isInlineFlexDesktopOnly, isInlineFlexWidescreenOnly, isInlineFlexTouch, isInlineFlexTablet, isInlineFlexDesktop, isInlineFlexWidescreen, isInlineFlexFullHD
@docs isHiddenMobile, isHiddenTabletOnly, isHiddenDesktopOnly, isHiddenWidescreenOnly, isHiddenTouch, isHiddenTablet, isHiddenDesktop, isHiddenWidescreen, isHiddenFullHD

## Color Helpers
@docs hasTextWhite, hasTextBlack, hasTextLight, hasTextDark, hasTextPrimary, hasTextInfo, hasTextLink, hasTextSuccess, hasTextWarning, hasTextDanger, hasTextBlackBis, hasTextBlackTer, hasTextGreyDarker, hasTextGreyDark, hasTextGrey, hasTextGreyLight, hasTextGreyLighter, hasTextWhiteTer, hasTextWhiteBis
@docs hasBackgroundWhite, hasBackgroundBlack, hasBackgroundLight, hasBackgroundDark, hasBackgroundPrimary, hasBackgroundInfo, hasBackgroundLink, hasBackgroundSuccess, hasBackgroundWarning, hasBackgroundDanger, hasBackgroundBlackBis, hasBackgroundBlackTer, hasBackgroundGreyDarker, hasBackgroundGreyDark, hasBackgroundGrey, hasBackgroundGreyLight, hasBackgroundGreyLighter, hasBackgroundWhiteTer, hasBackgroundWhiteBis

## Typography Helpers
@docs isSize1, isSize2, isSize3, isSize4, isSize5, isSize6, isSize7
@docs isSize1Mobile, isSize2Mobile, isSize3Mobile, isSize4Mobile, isSize5Mobile, isSize6Mobile, isSize7Mobile
@docs isSize1Tablet, isSize2Tablet, isSize3Tablet, isSize4Tablet, isSize5Tablet, isSize6Tablet, isSize7Tablet
@docs isSize1Touch, isSize2Touch, isSize3Touch, isSize4Touch, isSize5Touch, isSize6Touch, isSize7Touch
@docs isSize1Desktop, isSize2Desktop, isSize3Desktop, isSize4Desktop, isSize5Desktop, isSize6Desktop, isSize7Desktop
@docs isSize1Widescreen, isSize2Widescreen, isSize3Widescreen, isSize4Widescreen, isSize5Widescreen, isSize6Widescreen, isSize7Widescreen
@docs isSize1FullHD, isSize2FullHD, isSize3FullHD, isSize4FullHD, isSize5FullHD, isSize6FullHD, isSize7FullHD
@docs hasTextCentered, hasTextJustified, hasTextLeft, hasTextRight
@docs hasTextCenteredMobile, hasTextJustifiedMobile, hasTextLeftMobile, hasTextRightMobile
@docs hasTextCenteredTablet, hasTextJustifiedTablet, hasTextLeftTablet, hasTextRightTablet
@docs hasTextCenteredTabletOnly, hasTextJustifiedTabletOnly, hasTextLeftTabletOnly, hasTextRightTabletOnly
@docs hasTextCenteredTouch, hasTextJustifiedTouch, hasTextLeftTouch, hasTextRightTouch
@docs hasTextCenteredDesktop, hasTextJustifiedDesktop, hasTextLeftDesktop, hasTextRightDesktop
@docs hasTextCenteredDesktopOnly, hasTextJustifiedDesktopOnly, hasTextLeftDesktopOnly, hasTextRightDesktopOnly
@docs hasTextCenteredWidescreen, hasTextJustifiedWidescreen, hasTextLeftWidescreen, hasTextRightWidescreen
@docs hasTextCenteredWidescreenOnly, hasTextJustifiedWidescreenOnly, hasTextLeftWidescreenOnly, hasTextRightWidescreenOnly
@docs hasTextCenteredFullHD, hasTextJustifiedFullHD, hasTextLeftFullHD, hasTextRightFullHD
@docs isCapitalized, isLowercase, isUppercase, isItalic
@docs hasTextWeightLight, hasTextWeightNormal, hasTextWeightSemibold, hasTextWeightBold

# Columns
@docs column, columns
@docs isThreeQuarters, isTwoThirds, isHalf, isOneThird, isOneQuarter, isFourFifths, isThreeFifths, isTwoFifths, isOneFifth
@docs is00, is01, is01Desktop, is01FullHD, is01Mobile, is01Tablet, is01Widescreen, is02Desktop, is02FullHD, is02Mobile, is02Tablet, is02Widescreen, is03Desktop, is03FullHD, is03Mobile, is03Tablet, is03Widescreen, is04Desktop, is04FullHD, is04Mobile, is04Tablet, is04Widescreen, is05Desktop, is05FullHD, is05Mobile, is05Tablet, is05Widescreen, is06Desktop, is06FullHD, is06Mobile, is06Tablet, is06Widescreen, is07Desktop, is07FullHD, is07Mobile, is07Tablet, is07Widescreen, is08Desktop, is08FullHD, is08Mobile, is08Tablet, is08Widescreen, is09Desktop, is09FullHD, is09Mobile, is09Tablet, is09Widescreen, is10Desktop, is10FullHD, is10Mobile, is10Tablet, is10Widescreen, is11Desktop, is11FullHD, is11Mobile, is11Tablet, is11Widescreen, is1Desktop, is1FullHD, is1Mobile, is1Tablet, is1Widescreen, is2Desktop, is2FullHD, is2Mobile, is2Tablet, is2Widescreen, is3Desktop, is3FullHD, is3Mobile, is3Tablet, is3Widescreen, is4Desktop, is4FullHD, is4Mobile, is4Tablet, is4Widescreen, is5Desktop, is5FullHD, is5Mobile, is5Tablet, is5Widescreen, is6Desktop, is6FullHD, is6Mobile, is6Tablet, is6Widescreen, is7Desktop, is7FullHD, is7Mobile, is7Tablet, is7Widescreen, is8Desktop, is8FullHD, is8Mobile, is8Tablet, is8Widescreen, is9Desktop, is9FullHD, is9Mobile, is9Tablet, is9Widescreen, isFourFifthsDesktop, isFourFifthsFullHD, isFourFifthsMobile, isFourFifthsTablet, isFourFifthsWidescreen, isHalfDesktop, isHalfFullHD, isHalfMobile, isHalfTablet, isHalfWidescreen, isOneFifthDesktop, isOneFifthFullHD, isOneFifthMobile, isOneFifthTablet, isOneFifthWidescreen, isOneQuarterDesktop, isOneQuarterFullHD, isOneQuarterMobile, isOneQuarterTablet, isOneQuarterWidescreen, isOneThirdDesktop, isOneThirdFullHD, isOneThirdMobile, isOneThirdTablet, isOneThirdWidescreen, isThreeFifthsDesktop, isThreeFifthsFullHD, isThreeFifthsMobile, isThreeFifthsTablet, isThreeFifthsWidescreen, isThreeQuartersDesktop, isThreeQuartersFullHD, isThreeQuartersMobile, isThreeQuartersTablet, isThreeQuartersWidescreen, isTwoFifthsDesktop, isTwoFifthsFullHD, isTwoFifthsMobile, isTwoFifthsTablet, isTwoFifthsWidescreen, isTwoThirdsDesktop, isTwoThirdsFullHD, isTwoThirdsMobile, isTwoThirdsTablet, isTwoThirdsWidescreen
@docs isOffset1, isOffset2, isOffset3, isOffset4, isOffset5, isOffset6, isOffset7, isOffset8, isOffset9, isOffset10, isOffset11
@docs isOffset01, isOffset02, isOffset03, isOffset04, isOffset05, isOffset06, isOffset07, isOffset08, isOffset09, isOffset10, isOffset11
@docs isOffsetThreeQuarters, isOffsetTwoThirds, isOffsetHalf, isOffsetOneThird, isOffsetOneQuarter, isOffsetFourFifths, isOffsetThreeFifths, isOffsetTwoFifths, isOffsetOneFifth
@docs isNarrow, isNarrowMobile, isNarrowTouch, isNarrowTablet, isNarrowDesktop, isNarrowWidescreen, isNarrowFullHD
@docs isGapless
@docs isMultiline
@docs isVariable

# Layout
@docs container
@docs isFluid, isWidescreen, isFullHD
@docs level, levelLeft, levelRight, levelItem
@docs media, mediaLeft, mediaContent, mediaRight
@docs hero, heroBody, heroHead, heroFoot
@docs section
@docs footer
@docs tile, isAncestor, isParent, isChild, isVertical

# Form
@docs label, input, textarea, select, checkbox, radio, button, help
@docs control, field
@docs hasIconsLeft, hasIconsRight
@docs hasAddons
@docs isExpanded
@docs hasAddonsCentered, hasAddonsRight
@docs isGrouped, isGroupedCentered, isGroupedRight, isGroupedMultiline
@docs isHorizontal
@docs fieldLabel, fieldBody
@docs isMultiple
@docs file, fileLabel, fileInput, fileCTA, fileIcon, fileName, hasName

# Elements
@docs box
@docs button, buttons
@docs isOutlined, isInverted, isSelected
@docs content
@docs delete
@docs icon
@docs image
@docs is16x16, is24x24, is32x32, is48x48, is64x64, is96x96, is128x128
@docs is016x016, is024x024, is032x032, is048x048, is064x064, is096x096, is128x128
@docs isSquare
@docs is1by1, is5by4, is4by3, is3by2, is5by3, is16by9, is2by1, is3by1, is4by5, is3by4, is2by3, is3by5, is9by16, is1by2, is1by3
@docs is01by01, is05by04, is04by03, is03by02, is05by03, is16by09, is02by01, is03by01, is04by05, is03by04, is02by03, is03by05, is09by16, is01by02, is01by03
@docs notification
@docs progress
@docs table
@docs isBordered, isStriped
@docs tag, tags
@docs isDelete
@docs title, subtitle
@docs isSpaced

# Components
@docs breadcrumb
@docs hasArrowSeparator, hasBulletSeparator, hasDotSeparator, hasSucceedsSeparator
@docs card, cardHeader, cardHeaderTitle, cardHeaderIcon, cardImage, cardContent, cardFooter, cardFooterItem
@docs dropdown, dropdownTrigger, dropdownMenu, dropdownContent, dropdownItem, dropdownDivider
@docs menu, menuLabel, menuList
@docs message, messageBody, messageHeader
@docs modal, modalBackground, modalContent, modalClose, modalCard, modalCardHead, modalCardTitle, modalCardBody, modalCardFoot
@docs navbar, navbarBrand, navbarBurger, navbarMenu, navbarStart, navbarEnd, navbarItem, navbarLink, navbarDropdown, navbarDivider
@docs isFixedTop, isFixedBottom, hasNavbarFixedTop, hasNavbarFixedBottom, hasDropdown, hasDropdownUp, isTransparent
@docs pagination, paginationPrevious, paginationNext, paginationList, paginationLink, paginationEllipsis
@docs isCurrent
@docs panel, panelHeading, panelTabs, panelBlock, panelIcon
@docs tabs
@docs isToggle, isToggleRounded
-}


-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Attribute )
import Html.Attributes exposing ( class )


-- MISC ------------------------------------------------------------------------

{-| 
-}
none : Attribute msg
none = class ""


-- MODIFIERS -------------------------------------------------------------------

{-| 
-}
isBold : Attribute msg
isBold = class "is-bold"
{-| 
-}
isPrimary : Attribute msg
isPrimary = class "is-primary"
{-| 
-}
isInfo : Attribute msg
isInfo = class "is-info"
{-| 
-}
isSuccess : Attribute msg
isSuccess = class "is-success"
{-| 
-}
isWarning : Attribute msg
isWarning = class "is-warning"
{-| 
-}
isDanger : Attribute msg
isDanger = class "is-danger"
{-| 
-}
isLight : Attribute msg
isLight = class "is-light"
{-| 
-}
isDark : Attribute msg
isDark = class "is-dark"
{-| 
-}
isWhite : Attribute msg
isWhite = class "is-white"
{-| 
-}
isBlack : Attribute msg
isBlack = class "is-black"
{-| 
-}
isLink : Attribute msg
isLink = class "is-link"

{-| 
-}
isSmall : Attribute msg
isSmall = class "is-small"
{-| 
-}
isNormal : Attribute msg
isNormal = class "is-normal"
{-| 
-}
isMedium : Attribute msg
isMedium = class "is-medium"
{-| 
-}
isLarge : Attribute msg
isLarge = class "is-large"
{-| 
-}
isFullHeight : Attribute msg
isFullHeight = class "is-fullheight"

{-| 
-}
isActive : Attribute msg
isActive = class "is-active"
{-| 
-}
isHovered : Attribute msg
isHovered = class "is-hovered"
{-| 
-}
isFocused : Attribute msg
isFocused = class "is-focused"
{-| 
-}
isLoading : Attribute msg
isLoading = class "is-loading"
{-| 
-}
isStatic : Attribute msg
isStatic = class "is-static"

{-| 
-}
is0 : Attribute msg
is0 = class "is-0"
{-| 
-}
is1 : Attribute msg
is1 = class "is-1"
{-| 
-}
is2 : Attribute msg
is2 = class "is-2"
{-| 
-}
is3 : Attribute msg
is3 = class "is-3"
{-| 
-}
is4 : Attribute msg
is4 = class "is-4"
{-| 
-}
is5 : Attribute msg
is5 = class "is-5"
{-| 
-}
is6 : Attribute msg
is6 = class "is-6"
{-| 
-}
is7 : Attribute msg
is7 = class "is-7"
{-| 
-}
is8 : Attribute msg
is8 = class "is-8"
{-| 
-}
is9 : Attribute msg
is9 = class "is-9"

{-| 
-}
is00 : Attribute msg
is00 = class "is-0"
{-| 
-}
is01 : Attribute msg
is01 = class "is-1"
{-| 
-}
is02 : Attribute msg
is02 = class "is-2"
{-| 
-}
is03 : Attribute msg
is03 = class "is-3"
{-| 
-}
is04 : Attribute msg
is04 = class "is-4"
{-| 
-}
is05 : Attribute msg
is05 = class "is-5"
{-| 
-}
is06 : Attribute msg
is06 = class "is-6"
{-| 
-}
is07 : Attribute msg
is07 = class "is-7"
{-| 
-}
is08 : Attribute msg
is08 = class "is-8"
{-| 
-}
is09 : Attribute msg
is09 = class "is-9"
{-| 
-}
is10 : Attribute msg
is10 = class "is-10"
{-| 
-}
is11 : Attribute msg
is11 = class "is-11"
{-| 
-}
is12 : Attribute msg
is12 = class "is-12"

{-| 
-}
isRounded : Attribute msg
isRounded = class "is-rounded"

{-| 
-}
isBoxed : Attribute msg
isBoxed = class "is-boxed"

{-| 
-}
isRight : Attribute msg
isRight = class "is-right"             
{-| 
-}
isUp : Attribute msg
isUp = class "is-up"

{-| 
-}
isHoverable : Attribute msg
isHoverable = class "is-hoverable"


{-| 
-}
isMobile : Attribute msg
isMobile = class "is-mobile"
{-| 
-}
isDesktop : Attribute msg
isDesktop = class "is-desktop"



-- GENERIC HELPERS -------------------------------------------------------------

{-| 
-}
isClearfix : Attribute msg
isClearfix = class "is-clearfix"

{-| 
-}
isPulledLeft : Attribute msg
isPulledLeft = class "is-pulled-left"

{-| 
-}
isPulledRight : Attribute msg
isPulledRight = class "is-pulled-right"

{-| 
-}
isMarginless : Attribute msg
isMarginless = class "is-marginless"

{-| 
-}
isPaddingless : Attribute msg
isPaddingless = class "is-paddingless"

{-| 
-}
isOverlay : Attribute msg
isOverlay = class "is-overlay"

{-| 
-}
isClipped : Attribute msg
isClipped = class "is-clipped"

{-| 
-}
isRadiusless : Attribute msg
isRadiusless = class "is-radiusless"

{-| 
-}
isShadowless : Attribute msg
isShadowless = class "is-shadowless"

{-| 
-}
isUnselectable : Attribute msg
isUnselectable = class "is-unselectable"

{-| 
-}
isInvisible : Attribute msg
isInvisible = class "is-invisible"

{-| 
-}
isSROnly : Attribute msg
isSROnly = class "is-sr-only"


-- RESPONSIVE HELPERS ----------------------------------------------------------

{-|
-}
isBlock : Attribute msg
isBlock = class "is-block"
{-|
-}
isFlex : Attribute msg
isFlex = class "is-flex"
{-|
-}
isInline : Attribute msg
isInline = class "is-inline"
{-|
-}
isInlineBlock : Attribute msg
isInlineBlock = class "is-inline-block"
{-|
-}
isInlineFlex : Attribute msg
isInlineFlex = class "is-inline-flex"
{-|
-}
isHidden : Attribute msg
isHidden = class "is-hidden"

{-| 
-}
isBlockMobile         : Attribute msg
isBlockMobile         = class "is-block-mobile"
{-| 
-}
isBlockTabletOnly     : Attribute msg
isBlockTabletOnly     = class "is-block-tablet-only"
{-| 
-}
isBlockDesktopOnly    : Attribute msg
isBlockDesktopOnly    = class "is-block-desktop-only"
{-| 
-}
isBlockWidescreenOnly : Attribute msg
isBlockWidescreenOnly = class "is-block-widscreen-only"
{-| 
-}
isBlockTouch          : Attribute msg
isBlockTouch          = class "is-block-touch"
{-| 
-}
isBlockTablet         : Attribute msg
isBlockTablet         = class "is-block-tablet"
{-| 
-}
isBlockDesktop        : Attribute msg
isBlockDesktop        = class "is-block-desktop"
{-| 
-}
isBlockWidescreen     : Attribute msg
isBlockWidescreen     = class "is-block-widescreen"
{-| 
-}
isBlockFullHD         : Attribute msg
isBlockFullHD         = class "is-block-fullhd"

{-| 
-}
isFlexMobile         : Attribute msg
isFlexMobile         = class "is-flex-mobile"
{-| 
-}
isFlexTabletOnly     : Attribute msg
isFlexTabletOnly     = class "is-flex-tablet-only"
{-| 
-}
isFlexDesktopOnly    : Attribute msg
isFlexDesktopOnly    = class "is-flex-desktop-only"
{-| 
-}
isFlexWidescreenOnly : Attribute msg
isFlexWidescreenOnly = class "is-flex-widscreen-only"
{-| 
-}
isFlexTouch          : Attribute msg
isFlexTouch          = class "is-flex-touch"
{-| 
-}
isFlexTablet         : Attribute msg
isFlexTablet         = class "is-flex-tablet"
{-| 
-}
isFlexDesktop        : Attribute msg
isFlexDesktop        = class "is-flex-desktop"
{-| 
-}
isFlexWidescreen     : Attribute msg
isFlexWidescreen     = class "is-flex-widescreen"
{-| 
-}
isFlexFullHD         : Attribute msg
isFlexFullHD         = class "is-flex-fullhd"

{-| 
-}
isInlineMobile         : Attribute msg
isInlineMobile         = class "is-inline-mobile"
{-| 
-}
isInlineTabletOnly     : Attribute msg
isInlineTabletOnly     = class "is-inline-tablet-only"
{-| 
-}
isInlineDesktopOnly    : Attribute msg
isInlineDesktopOnly    = class "is-inline-desktop-only"
{-| 
-}
isInlineWidescreenOnly : Attribute msg
isInlineWidescreenOnly = class "is-inline-widscreen-only"
{-| 
-}
isInlineTouch          : Attribute msg
isInlineTouch          = class "is-inline-touch"
{-| 
-}
isInlineTablet         : Attribute msg
isInlineTablet         = class "is-inline-tablet"
{-| 
-}
isInlineDesktop        : Attribute msg
isInlineDesktop        = class "is-inline-desktop"
{-| 
-}
isInlineWidescreen     : Attribute msg
isInlineWidescreen     = class "is-inline-widescreen"
{-| 
-}
isInlineFullHD         : Attribute msg
isInlineFullHD         = class "is-inline-fullhd"

{-| 
-}
isInlineBlockMobile         : Attribute msg
isInlineBlockMobile         = class "is-inline-block-mobile"
{-| 
-}
isInlineBlockTabletOnly     : Attribute msg
isInlineBlockTabletOnly     = class "is-inline-block-tablet-only"
{-| 
-}
isInlineBlockDesktopOnly    : Attribute msg
isInlineBlockDesktopOnly    = class "is-inline-block-desktop-only"
{-| 
-}
isInlineBlockWidescreenOnly : Attribute msg
isInlineBlockWidescreenOnly = class "is-inline-block-widscreen-only"
{-| 
-}
isInlineBlockTouch          : Attribute msg
isInlineBlockTouch          = class "is-inline-block-touch"
{-| 
-}
isInlineBlockTablet         : Attribute msg
isInlineBlockTablet         = class "is-inline-block-tablet"
{-| 
-}
isInlineBlockDesktop        : Attribute msg
isInlineBlockDesktop        = class "is-inline-block-desktop"
{-| 
-}
isInlineBlockWidescreen     : Attribute msg
isInlineBlockWidescreen     = class "is-inline-block-widescreen"
{-| 
-}
isInlineBlockFullHD         : Attribute msg
isInlineBlockFullHD         = class "is-inline-block-fullhd"

{-| 
-}
isInlineFlexMobile         : Attribute msg
isInlineFlexMobile         = class "is-inline-flex-mobile"
{-| 
-}
isInlineFlexTabletOnly     : Attribute msg
isInlineFlexTabletOnly     = class "is-inline-flex-tablet-only"
{-| 
-}
isInlineFlexDesktopOnly    : Attribute msg
isInlineFlexDesktopOnly    = class "is-inline-flex-desktop-only"
{-| 
-}
isInlineFlexWidescreenOnly : Attribute msg
isInlineFlexWidescreenOnly = class "is-inline-flex-widscreen-only"
{-| 
-}
isInlineFlexTouch          : Attribute msg
isInlineFlexTouch          = class "is-inline-flex-touch"
{-| 
-}
isInlineFlexTablet         : Attribute msg
isInlineFlexTablet         = class "is-inline-flex-tablet"
{-| 
-}
isInlineFlexDesktop        : Attribute msg
isInlineFlexDesktop        = class "is-inline-flex-desktop"
{-| 
-}
isInlineFlexWidescreen     : Attribute msg
isInlineFlexWidescreen     = class "is-inline-flex-widescreen"
{-| 
-}
isInlineFlexFullHD         : Attribute msg
isInlineFlexFullHD         = class "is-inline-flex-fullhd"

{-| 
-}
isHiddenMobile         : Attribute msg
isHiddenMobile         = class "is-hidden-mobile"
{-| 
-}
isHiddenTabletOnly     : Attribute msg
isHiddenTabletOnly     = class "is-hidden-tablet-only"
{-| 
-}
isHiddenDesktopOnly    : Attribute msg
isHiddenDesktopOnly    = class "is-hidden-desktop-only"
{-| 
-}
isHiddenWidescreenOnly : Attribute msg
isHiddenWidescreenOnly = class "is-hidden-widscreen-only"
{-| 
-}
isHiddenTouch          : Attribute msg
isHiddenTouch          = class "is-hidden-touch"
{-| 
-}
isHiddenTablet         : Attribute msg
isHiddenTablet         = class "is-hidden-tablet"
{-| 
-}
isHiddenDesktop        : Attribute msg
isHiddenDesktop        = class "is-hidden-desktop"
{-| 
-}
isHiddenWidescreen     : Attribute msg
isHiddenWidescreen     = class "is-hidden-widescreen"
{-| 
-}
isHiddenFullHD         : Attribute msg
isHiddenFullHD         = class "is-hidden-fullhd"


-- COLOR HELPERS ---------------------------------------------------------------

-- TODO: Add background to Modifiers.
-- TODO: Consider making Modifiers.Color.

{-| 
-}
hasTextWhite       : Attribute msg
hasTextWhite       = class "has-text-white"
{-| 
-}
hasTextBlack       : Attribute msg
hasTextBlack       = class "has-text-black"
{-| 
-}
hasTextLight       : Attribute msg
hasTextLight       = class "has-text-light"
{-| 
-}
hasTextDark        : Attribute msg
hasTextDark        = class "has-text-dark"
{-| 
-}
hasTextPrimary     : Attribute msg
hasTextPrimary     = class "has-text-primary"
{-| 
-}
hasTextInfo        : Attribute msg
hasTextInfo        = class "has-text-info"
{-| 
-}
hasTextLink        : Attribute msg
hasTextLink        = class "has-text-link"
{-| 
-}
hasTextSuccess     : Attribute msg
hasTextSuccess     = class "has-text-success"
{-| 
-}
hasTextWarning     : Attribute msg
hasTextWarning     = class "has-text-warning"
{-| 
-}
hasTextDanger      : Attribute msg
hasTextDanger      = class "has-text-danger"
{-| 
-}
hasTextBlackBis    : Attribute msg
hasTextBlackBis    = class "has-text-black-bis"
{-| 
-}
hasTextBlackTer    : Attribute msg
hasTextBlackTer    = class "has-text-black-ter"
{-| 
-}
hasTextGreyDarker  : Attribute msg
hasTextGreyDarker  = class "has-text-grey-darker"
{-| 
-}
hasTextGreyDark    : Attribute msg
hasTextGreyDark    = class "has-text-grey-dark"
{-| 
-}
hasTextGrey        : Attribute msg
hasTextGrey        = class "has-text-grey"
{-| 
-}
hasTextGreyLight   : Attribute msg
hasTextGreyLight   = class "has-text-grey-light"
{-| 
-}
hasTextGreyLighter : Attribute msg
hasTextGreyLighter = class "has-text-grey-lighter"
{-| 
-}
hasTextWhiteTer    : Attribute msg
hasTextWhiteTer    = class "has-text-white-ter"
{-| 
-}
hasTextWhiteBis    : Attribute msg
hasTextWhiteBis    = class "has-text-white-bis"

{-| 
-}
hasBackgroundWhite       : Attribute msg
hasBackgroundWhite       = class "has-background-white"
{-| 
-}
hasBackgroundBlack       : Attribute msg
hasBackgroundBlack       = class "has-background-black"
{-| 
-}
hasBackgroundLight       : Attribute msg
hasBackgroundLight       = class "has-background-light"
{-| 
-}
hasBackgroundDark        : Attribute msg
hasBackgroundDark        = class "has-background-dark"
{-| 
-}
hasBackgroundPrimary     : Attribute msg
hasBackgroundPrimary     = class "has-background-primary"
{-| 
-}
hasBackgroundInfo        : Attribute msg
hasBackgroundInfo        = class "has-background-info"
{-| 
-}
hasBackgroundLink        : Attribute msg
hasBackgroundLink        = class "has-background-link"
{-| 
-}
hasBackgroundSuccess     : Attribute msg
hasBackgroundSuccess     = class "has-background-success"
{-| 
-}
hasBackgroundWarning     : Attribute msg
hasBackgroundWarning     = class "has-background-warning"
{-| 
-}
hasBackgroundDanger      : Attribute msg
hasBackgroundDanger      = class "has-background-danger"
{-| 
-}
hasBackgroundBlackBis    : Attribute msg
hasBackgroundBlackBis    = class "has-background-black-bis"
{-| 
-}
hasBackgroundBlackTer    : Attribute msg
hasBackgroundBlackTer    = class "has-background-black-ter"
{-| 
-}
hasBackgroundGreyDarker  : Attribute msg
hasBackgroundGreyDarker  = class "has-background-grey-darker"
{-| 
-}
hasBackgroundGreyDark    : Attribute msg
hasBackgroundGreyDark    = class "has-background-grey-dark"
{-| 
-}
hasBackgroundGrey        : Attribute msg
hasBackgroundGrey        = class "has-background-grey"
{-| 
-}
hasBackgroundGreyLight   : Attribute msg
hasBackgroundGreyLight   = class "has-background-grey-light"
{-| 
-}
hasBackgroundGreyLighter : Attribute msg
hasBackgroundGreyLighter = class "has-background-grey-lighter"
{-| 
-}
hasBackgroundWhiteTer    : Attribute msg
hasBackgroundWhiteTer    = class "has-background-white-ter"
{-| 
-}
hasBackgroundWhiteBis    : Attribute msg
hasBackgroundWhiteBis    = class "has-background-white-bis"


-- TYPOGRAPHY HELPERS ----------------------------------------------------------

{-| 
-}
isSize1 : Attribute msg
isSize1 = class "is-size-1"
{-| 
-}
isSize2 : Attribute msg
isSize2 = class "is-size-2"
{-| 
-}
isSize3 : Attribute msg
isSize3 = class "is-size-3"
{-| 
-}
isSize4 : Attribute msg
isSize4 = class "is-size-4"
{-| 
-}
isSize5 : Attribute msg
isSize5 = class "is-size-5"
{-| 
-}
isSize6 : Attribute msg
isSize6 = class "is-size-6"
{-| 
-}
isSize7 : Attribute msg
isSize7 = class "is-size-7"

{-| 
-}
isSize1Mobile : Attribute msg
isSize1Mobile = class "is-size-1-mobile"
{-| 
-}
isSize2Mobile : Attribute msg
isSize2Mobile = class "is-size-2-mobile"
{-| 
-}
isSize3Mobile : Attribute msg
isSize3Mobile = class "is-size-3-mobile"
{-| 
-}
isSize4Mobile : Attribute msg
isSize4Mobile = class "is-size-4-mobile"
{-| 
-}
isSize5Mobile : Attribute msg
isSize5Mobile = class "is-size-5-mobile"
{-| 
-}
isSize6Mobile : Attribute msg
isSize6Mobile = class "is-size-6-mobile"
{-| 
-}
isSize7Mobile : Attribute msg
isSize7Mobile = class "is-size-7-mobile"

{-| 
-}
isSize1Tablet : Attribute msg
isSize1Tablet = class "is-size-1-tablet"
{-| 
-}
isSize2Tablet : Attribute msg
isSize2Tablet = class "is-size-2-tablet"
{-| 
-}
isSize3Tablet : Attribute msg
isSize3Tablet = class "is-size-3-tablet"
{-| 
-}
isSize4Tablet : Attribute msg
isSize4Tablet = class "is-size-4-tablet"
{-| 
-}
isSize5Tablet : Attribute msg
isSize5Tablet = class "is-size-5-tablet"
{-| 
-}
isSize6Tablet : Attribute msg
isSize6Tablet = class "is-size-6-tablet"
{-| 
-}
isSize7Tablet : Attribute msg
isSize7Tablet = class "is-size-7-tablet"

{-| 
-}
isSize1Touch : Attribute msg
isSize1Touch = class "is-size-1-touch"
{-| 
-}
isSize2Touch : Attribute msg
isSize2Touch = class "is-size-2-touch"
{-| 
-}
isSize3Touch : Attribute msg
isSize3Touch = class "is-size-3-touch"
{-| 
-}
isSize4Touch : Attribute msg
isSize4Touch = class "is-size-4-touch"
{-| 
-}
isSize5Touch : Attribute msg
isSize5Touch = class "is-size-5-touch"
{-| 
-}
isSize6Touch : Attribute msg
isSize6Touch = class "is-size-6-touch"
{-| 
-}
isSize7Touch : Attribute msg
isSize7Touch = class "is-size-7-touch"

{-| 
-}
isSize1Desktop : Attribute msg
isSize1Desktop = class "is-size-1-desktop"
{-| 
-}
isSize2Desktop : Attribute msg
isSize2Desktop = class "is-size-2-desktop"
{-| 
-}
isSize3Desktop : Attribute msg
isSize3Desktop = class "is-size-3-desktop"
{-| 
-}
isSize4Desktop : Attribute msg
isSize4Desktop = class "is-size-4-desktop"
{-| 
-}
isSize5Desktop : Attribute msg
isSize5Desktop = class "is-size-5-desktop"
{-| 
-}
isSize6Desktop : Attribute msg
isSize6Desktop = class "is-size-6-desktop"
{-| 
-}
isSize7Desktop : Attribute msg
isSize7Desktop = class "is-size-7-desktop"

{-| 
-}
isSize1Widescreen : Attribute msg
isSize1Widescreen = class "is-size-1-widescreen"
{-| 
-}
isSize2Widescreen : Attribute msg
isSize2Widescreen = class "is-size-2-widescreen"
{-| 
-}
isSize3Widescreen : Attribute msg
isSize3Widescreen = class "is-size-3-widescreen"
{-| 
-}
isSize4Widescreen : Attribute msg
isSize4Widescreen = class "is-size-4-widescreen"
{-| 
-}
isSize5Widescreen : Attribute msg
isSize5Widescreen = class "is-size-5-widescreen"
{-| 
-}
isSize6Widescreen : Attribute msg
isSize6Widescreen = class "is-size-6-widescreen"
{-| 
-}
isSize7Widescreen : Attribute msg
isSize7Widescreen = class "is-size-7-widescreen"

{-| 
-}
isSize1FullHD : Attribute msg
isSize1FullHD = class "is-size-1-fullhd"
{-| 
-}
isSize2FullHD : Attribute msg
isSize2FullHD = class "is-size-2-fullhd"
{-| 
-}
isSize3FullHD : Attribute msg
isSize3FullHD = class "is-size-3-fullhd"
{-| 
-}
isSize4FullHD : Attribute msg
isSize4FullHD = class "is-size-4-fullhd"
{-| 
-}
isSize5FullHD : Attribute msg
isSize5FullHD = class "is-size-5-fullhd"
{-| 
-}
isSize6FullHD : Attribute msg
isSize6FullHD = class "is-size-6-fullhd"
{-| 
-}
isSize7FullHD : Attribute msg
isSize7FullHD = class "is-size-7-fullhd"

{-| 
-}
hasTextCentered  : Attribute msg
hasTextCentered  = class "has-text-centered"
{-| 
-}
hasTextJustified : Attribute msg
hasTextJustified = class "has-text-justified"
{-| 
-}
hasTextLeft      : Attribute msg
hasTextLeft      = class "has-text-left"
{-| 
-}
hasTextRight     : Attribute msg
hasTextRight     = class "has-text-right"

{-| 
-}
hasTextCenteredMobile  : Attribute msg
hasTextCenteredMobile  = class "has-text-centered-mobile"
{-| 
-}
hasTextJustifiedMobile : Attribute msg
hasTextJustifiedMobile = class "has-text-justified-mobile"
{-| 
-}
hasTextLeftMobile      : Attribute msg
hasTextLeftMobile      = class "has-text-left-mobile"
{-| 
-}
hasTextRightMobile     : Attribute msg
hasTextRightMobile     = class "has-text-right-mobile"

{-| 
-}
hasTextCenteredTablet  : Attribute msg
hasTextCenteredTablet  = class "has-text-centered-tablet"
{-| 
-}
hasTextJustifiedTablet : Attribute msg
hasTextJustifiedTablet = class "has-text-justified-tablet"
{-| 
-}
hasTextLeftTablet      : Attribute msg
hasTextLeftTablet      = class "has-text-left-tablet"
{-| 
-}
hasTextRightTablet     : Attribute msg
hasTextRightTablet     = class "has-text-right-tablet"

{-| 
-}
hasTextCenteredTabletOnly  : Attribute msg
hasTextCenteredTabletOnly  = class "has-text-centered-tablet-only"
{-| 
-}
hasTextJustifiedTabletOnly : Attribute msg
hasTextJustifiedTabletOnly = class "has-text-justified-tablet-only"
{-| 
-}
hasTextLeftTabletOnly      : Attribute msg
hasTextLeftTabletOnly      = class "has-text-left-tablet-only"
{-| 
-}
hasTextRightTabletOnly     : Attribute msg
hasTextRightTabletOnly     = class "has-text-right-tablet-only"

{-| 
-}
hasTextCenteredTouch  : Attribute msg
hasTextCenteredTouch  = class "has-text-centered-touch"
{-| 
-}
hasTextJustifiedTouch : Attribute msg
hasTextJustifiedTouch = class "has-text-justified-touch"
{-| 
-}
hasTextLeftTouch      : Attribute msg
hasTextLeftTouch      = class "has-text-left-touch"
{-| 
-}
hasTextRightTouch     : Attribute msg
hasTextRightTouch     = class "has-text-right-touch"

{-| 
-}
hasTextCenteredDesktop  : Attribute msg
hasTextCenteredDesktop  = class "has-text-centered-desktop"
{-| 
-}
hasTextJustifiedDesktop : Attribute msg
hasTextJustifiedDesktop = class "has-text-justified-desktop"
{-| 
-}
hasTextLeftDesktop      : Attribute msg
hasTextLeftDesktop      = class "has-text-left-desktop"
{-| 
-}
hasTextRightDesktop     : Attribute msg
hasTextRightDesktop     = class "has-text-right-desktop"

{-| 
-}
hasTextCenteredDesktopOnly  : Attribute msg
hasTextCenteredDesktopOnly  = class "has-text-centered-desktop-only"
{-| 
-}
hasTextJustifiedDesktopOnly : Attribute msg
hasTextJustifiedDesktopOnly = class "has-text-justified-desktop-only"
{-| 
-}
hasTextLeftDesktopOnly      : Attribute msg
hasTextLeftDesktopOnly      = class "has-text-left-desktop-only"
{-| 
-}
hasTextRightDesktopOnly     : Attribute msg
hasTextRightDesktopOnly     = class "has-text-right-desktop-only"

{-| 
-}
hasTextCenteredWidescreen  : Attribute msg
hasTextCenteredWidescreen  = class "has-text-centered-widescreen"
{-| 
-}
hasTextJustifiedWidescreen : Attribute msg
hasTextJustifiedWidescreen = class "has-text-justified-widescreen"
{-| 
-}
hasTextLeftWidescreen      : Attribute msg
hasTextLeftWidescreen      = class "has-text-left-widescreen"
{-| 
-}
hasTextRightWidescreen     : Attribute msg
hasTextRightWidescreen     = class "has-text-right-widescreen"

{-| 
-}
hasTextCenteredWidescreenOnly  : Attribute msg
hasTextCenteredWidescreenOnly  = class "has-text-centered-widescreen-only"
{-| 
-}
hasTextJustifiedWidescreenOnly : Attribute msg
hasTextJustifiedWidescreenOnly = class "has-text-justified-widescreen-only"
{-| 
-}
hasTextLeftWidescreenOnly      : Attribute msg
hasTextLeftWidescreenOnly      = class "has-text-left-widescreen-only"
{-| 
-}
hasTextRightWidescreenOnly     : Attribute msg
hasTextRightWidescreenOnly     = class "has-text-right-widescreen-only"

{-| 
-}
hasTextCenteredFullHD  : Attribute msg
hasTextCenteredFullHD  = class "has-text-centered-fullhd"
{-| 
-}
hasTextJustifiedFullHD : Attribute msg
hasTextJustifiedFullHD = class "has-text-justified-fullhd"
{-| 
-}
hasTextLeftFullHD      : Attribute msg
hasTextLeftFullHD      = class "has-text-left-fullhd"
{-| 
-}
hasTextRightFullHD     : Attribute msg
hasTextRightFullHD     = class "has-text-right-fullhd"

{-| 
-}
isCapitalized : Attribute msg
isCapitalized = class "is-capitalized"
{-| 
-}
isLowercase   : Attribute msg
isLowercase   = class "is-lowercase"
{-| 
-}
isUppercase   : Attribute msg
isUppercase   = class "is-uppercase"
{-| 
-}
isItalic      : Attribute msg
isItalic      = class "is-italic"

{-| 
-}
hasTextWeightLight    : Attribute msg
hasTextWeightLight    = class "has-text-weight-light"
{-| 
-}
hasTextWeightNormal   : Attribute msg
hasTextWeightNormal   = class "has-text-weight-normal"
{-| 
-}
hasTextWeightSemibold : Attribute msg
hasTextWeightSemibold = class "has-text-weight-semibold"
{-| 
-}
hasTextWeightBold     : Attribute msg
hasTextWeightBold     = class "has-text-weight-bold"



-- COLUMNS ---------------------------------------------------------------------

{-| 
-}
columns : Attribute msg
columns = class "columns"
{-| 
-}
column  : Attribute msg
column  = class "column"

{-| 
-}
is1Mobile : Attribute msg
is1Mobile = class "is-1-mobile"
{-| 
-}
is2Mobile : Attribute msg
is2Mobile = class "is-2-mobile"
{-| 
-}
is3Mobile : Attribute msg
is3Mobile = class "is-3-mobile"
{-| 
-}
is4Mobile : Attribute msg
is4Mobile = class "is-4-mobile"
{-| 
-}
is5Mobile : Attribute msg
is5Mobile = class "is-5-mobile"
{-| 
-}
is6Mobile : Attribute msg
is6Mobile = class "is-6-mobile"
{-| 
-}
is7Mobile : Attribute msg
is7Mobile = class "is-7-mobile"
{-| 
-}
is8Mobile : Attribute msg
is8Mobile = class "is-8-mobile"
{-| 
-}
is9Mobile : Attribute msg
is9Mobile = class "is-9-mobile"
{-| 
-}
is01Mobile : Attribute msg
is01Mobile = class "is-1-mobile"
{-| 
-}
is02Mobile : Attribute msg
is02Mobile = class "is-2-mobile"
{-| 
-}
is03Mobile : Attribute msg
is03Mobile = class "is-3-mobile"
{-| 
-}
is04Mobile : Attribute msg
is04Mobile = class "is-4-mobile"
{-| 
-}
is05Mobile : Attribute msg
is05Mobile = class "is-5-mobile"
{-| 
-}
is06Mobile : Attribute msg
is06Mobile = class "is-6-mobile"
{-| 
-}
is07Mobile : Attribute msg
is07Mobile = class "is-7-mobile"
{-| 
-}
is08Mobile : Attribute msg
is08Mobile = class "is-8-mobile"
{-| 
-}
is09Mobile : Attribute msg
is09Mobile = class "is-9-mobile"
{-| 
-}
is10Mobile : Attribute msg
is10Mobile = class "is-10-mobile"
{-| 
-}
is11Mobile : Attribute msg
is11Mobile = class "is-11-mobile"

{-| 
-}
is1Tablet : Attribute msg
is1Tablet = class "is-1-tablet"
{-| 
-}
is2Tablet : Attribute msg
is2Tablet = class "is-2-tablet"
{-| 
-}
is3Tablet : Attribute msg
is3Tablet = class "is-3-tablet"
{-| 
-}
is4Tablet : Attribute msg
is4Tablet = class "is-4-tablet"
{-| 
-}
is5Tablet : Attribute msg
is5Tablet = class "is-5-tablet"
{-| 
-}
is6Tablet : Attribute msg
is6Tablet = class "is-6-tablet"
{-| 
-}
is7Tablet : Attribute msg
is7Tablet = class "is-7-tablet"
{-| 
-}
is8Tablet : Attribute msg
is8Tablet = class "is-8-tablet"
{-| 
-}
is9Tablet : Attribute msg
is9Tablet = class "is-9-tablet"
{-| 
-}
is01Tablet : Attribute msg
is01Tablet = class "is-1-tablet"
{-| 
-}
is02Tablet : Attribute msg
is02Tablet = class "is-2-tablet"
{-| 
-}
is03Tablet : Attribute msg
is03Tablet = class "is-3-tablet"
{-| 
-}
is04Tablet : Attribute msg
is04Tablet = class "is-4-tablet"
{-| 
-}
is05Tablet : Attribute msg
is05Tablet = class "is-5-tablet"
{-| 
-}
is06Tablet : Attribute msg
is06Tablet = class "is-6-tablet"
{-| 
-}
is07Tablet : Attribute msg
is07Tablet = class "is-7-tablet"
{-| 
-}
is08Tablet : Attribute msg
is08Tablet = class "is-8-tablet"
{-| 
-}
is09Tablet : Attribute msg
is09Tablet = class "is-9-tablet"
{-| 
-}
is10Tablet : Attribute msg
is10Tablet = class "is-10-tablet"
{-| 
-}
is11Tablet : Attribute msg
is11Tablet = class "is-11-tablet"

{-| 
-}
is1Desktop : Attribute msg
is1Desktop = class "is-1-desktop"
{-| 
-}
is2Desktop : Attribute msg
is2Desktop = class "is-2-desktop"
{-| 
-}
is3Desktop : Attribute msg
is3Desktop = class "is-3-desktop"
{-| 
-}
is4Desktop : Attribute msg
is4Desktop = class "is-4-desktop"
{-| 
-}
is5Desktop : Attribute msg
is5Desktop = class "is-5-desktop"
{-| 
-}
is6Desktop : Attribute msg
is6Desktop = class "is-6-desktop"
{-| 
-}
is7Desktop : Attribute msg
is7Desktop = class "is-7-desktop"
{-| 
-}
is8Desktop : Attribute msg
is8Desktop = class "is-8-desktop"
{-| 
-}
is9Desktop : Attribute msg
is9Desktop = class "is-9-desktop"
{-| 
-}
is01Desktop : Attribute msg
is01Desktop = class "is-1-desktop"
{-| 
-}
is02Desktop : Attribute msg
is02Desktop = class "is-2-desktop"
{-| 
-}
is03Desktop : Attribute msg
is03Desktop = class "is-3-desktop"
{-| 
-}
is04Desktop : Attribute msg
is04Desktop = class "is-4-desktop"
{-| 
-}
is05Desktop : Attribute msg
is05Desktop = class "is-5-desktop"
{-| 
-}
is06Desktop : Attribute msg
is06Desktop = class "is-6-desktop"
{-| 
-}
is07Desktop : Attribute msg
is07Desktop = class "is-7-desktop"
{-| 
-}
is08Desktop : Attribute msg
is08Desktop = class "is-8-desktop"
{-| 
-}
is09Desktop : Attribute msg
is09Desktop = class "is-9-desktop"
{-| 
-}
is10Desktop : Attribute msg
is10Desktop = class "is-10-desktop"
{-| 
-}
is11Desktop : Attribute msg
is11Desktop = class "is-11-desktop"

{-| 
-}
is1Widescreen : Attribute msg
is1Widescreen = class "is-1-widescreen"
{-| 
-}
is2Widescreen : Attribute msg
is2Widescreen = class "is-2-widescreen"
{-| 
-}
is3Widescreen : Attribute msg
is3Widescreen = class "is-3-widescreen"
{-| 
-}
is4Widescreen : Attribute msg
is4Widescreen = class "is-4-widescreen"
{-| 
-}
is5Widescreen : Attribute msg
is5Widescreen = class "is-5-widescreen"
{-| 
-}
is6Widescreen : Attribute msg
is6Widescreen = class "is-6-widescreen"
{-| 
-}
is7Widescreen : Attribute msg
is7Widescreen = class "is-7-widescreen"
{-| 
-}
is8Widescreen : Attribute msg
is8Widescreen = class "is-8-widescreen"
{-| 
-}
is9Widescreen : Attribute msg
is9Widescreen = class "is-9-widescreen"
{-| 
-}
is01Widescreen : Attribute msg
is01Widescreen = class "is-1-widescreen"
{-| 
-}
is02Widescreen : Attribute msg
is02Widescreen = class "is-2-widescreen"
{-| 
-}
is03Widescreen : Attribute msg
is03Widescreen = class "is-3-widescreen"
{-| 
-}
is04Widescreen : Attribute msg
is04Widescreen = class "is-4-widescreen"
{-| 
-}
is05Widescreen : Attribute msg
is05Widescreen = class "is-5-widescreen"
{-| 
-}
is06Widescreen : Attribute msg
is06Widescreen = class "is-6-widescreen"
{-| 
-}
is07Widescreen : Attribute msg
is07Widescreen = class "is-7-widescreen"
{-| 
-}
is08Widescreen : Attribute msg
is08Widescreen = class "is-8-widescreen"
{-| 
-}
is09Widescreen : Attribute msg
is09Widescreen = class "is-9-widescreen"
{-| 
-}
is10Widescreen : Attribute msg
is10Widescreen = class "is-10-widescreen"
{-| 
-}
is11Widescreen : Attribute msg
is11Widescreen = class "is-11-widescreen"

{-| 
-}
is1FullHD : Attribute msg
is1FullHD = class "is-1-fullhd"
{-| 
-}
is2FullHD : Attribute msg
is2FullHD = class "is-2-fullhd"
{-| 
-}
is3FullHD : Attribute msg
is3FullHD = class "is-3-fullhd"
{-| 
-}
is4FullHD : Attribute msg
is4FullHD = class "is-4-fullhd"
{-| 
-}
is5FullHD : Attribute msg
is5FullHD = class "is-5-fullhd"
{-| 
-}
is6FullHD : Attribute msg
is6FullHD = class "is-6-fullhd"
{-| 
-}
is7FullHD : Attribute msg
is7FullHD = class "is-7-fullhd"
{-| 
-}
is8FullHD : Attribute msg
is8FullHD = class "is-8-fullhd"
{-| 
-}
is9FullHD : Attribute msg
is9FullHD = class "is-9-fullhd"
{-| 
-}
is01FullHD : Attribute msg
is01FullHD = class "is-1-fullhd"
{-| 
-}
is02FullHD : Attribute msg
is02FullHD = class "is-2-fullhd"
{-| 
-}
is03FullHD : Attribute msg
is03FullHD = class "is-3-fullhd"
{-| 
-}
is04FullHD : Attribute msg
is04FullHD = class "is-4-fullhd"
{-| 
-}
is05FullHD : Attribute msg
is05FullHD = class "is-5-fullhd"
{-| 
-}
is06FullHD : Attribute msg
is06FullHD = class "is-6-fullhd"
{-| 
-}
is07FullHD : Attribute msg
is07FullHD = class "is-7-fullhd"
{-| 
-}
is08FullHD : Attribute msg
is08FullHD = class "is-8-fullhd"
{-| 
-}
is09FullHD : Attribute msg
is09FullHD = class "is-9-fullhd"
{-| 
-}
is10FullHD : Attribute msg
is10FullHD = class "is-10-fullhd"
{-| 
-}
is11FullHD : Attribute msg
is11FullHD = class "is-11-fullhd"

{-| 
-}
isThreeQuarters : Attribute msg
isThreeQuarters = class "is-three-quarters"
{-| 
-}
isTwoThirds     : Attribute msg
isTwoThirds     = class "is-two-thirds"
{-| 
-}
isHalf          : Attribute msg
isHalf          = class "is-half"
{-| 
-}
isOneThird      : Attribute msg
isOneThird      = class "is-one-third"
{-| 
-}
isOneQuarter    : Attribute msg
isOneQuarter    = class "is-one-quarter"
{-| 
-}
isFourFifths    : Attribute msg
isFourFifths    = class "is-four-fifths"
{-| 
-}
isThreeFifths   : Attribute msg
isThreeFifths   = class "is-three-fifths"
{-| 
-}
isTwoFifths     : Attribute msg
isTwoFifths     = class "is-two-fifths"
{-| 
-}
isOneFifth      : Attribute msg
isOneFifth      = class "is-one-fifth"

{-| 
-}
isThreeQuartersMobile : Attribute msg
isThreeQuartersMobile = class "is-three-quarters-mobile"
{-| 
-}
isTwoThirdsMobile     : Attribute msg
isTwoThirdsMobile     = class "is-two-thirds-mobile"
{-| 
-}
isHalfMobile          : Attribute msg
isHalfMobile          = class "is-half-mobile"
{-| 
-}
isOneThirdMobile      : Attribute msg
isOneThirdMobile      = class "is-one-third-mobile"
{-| 
-}
isOneQuarterMobile    : Attribute msg
isOneQuarterMobile    = class "is-one-quarter-mobile"
{-| 
-}
isFourFifthsMobile    : Attribute msg
isFourFifthsMobile    = class "is-four-fifths-mobile"
{-| 
-}
isThreeFifthsMobile   : Attribute msg
isThreeFifthsMobile   = class "is-three-fifths-mobile"
{-| 
-}
isTwoFifthsMobile     : Attribute msg
isTwoFifthsMobile     = class "is-two-fifths-mobile"
{-| 
-}
isOneFifthMobile      : Attribute msg
isOneFifthMobile      = class "is-one-fifth-mobile"

{-| 
-}
isThreeQuartersTablet : Attribute msg
isThreeQuartersTablet = class "is-three-quarters-tablet"
{-| 
-}
isTwoThirdsTablet     : Attribute msg
isTwoThirdsTablet     = class "is-two-thirds-tablet"
{-| 
-}
isHalfTablet          : Attribute msg
isHalfTablet          = class "is-half-tablet"
{-| 
-}
isOneThirdTablet      : Attribute msg
isOneThirdTablet      = class "is-one-third-tablet"
{-| 
-}
isOneQuarterTablet    : Attribute msg
isOneQuarterTablet    = class "is-one-quarter-tablet"
{-| 
-}
isFourFifthsTablet    : Attribute msg
isFourFifthsTablet    = class "is-four-fifths-tablet"
{-| 
-}
isThreeFifthsTablet   : Attribute msg
isThreeFifthsTablet   = class "is-three-fifths-tablet"
{-| 
-}
isTwoFifthsTablet     : Attribute msg
isTwoFifthsTablet     = class "is-two-fifths-tablet"
{-| 
-}
isOneFifthTablet      : Attribute msg
isOneFifthTablet      = class "is-one-fifth-tablet"

{-| 
-}
isThreeQuartersDesktop : Attribute msg
isThreeQuartersDesktop = class "is-three-quarters-desktop"
{-| 
-}
isTwoThirdsDesktop     : Attribute msg
isTwoThirdsDesktop     = class "is-two-thirds-desktop"
{-| 
-}
isHalfDesktop          : Attribute msg
isHalfDesktop          = class "is-half-desktop"
{-| 
-}
isOneThirdDesktop      : Attribute msg
isOneThirdDesktop      = class "is-one-third-desktop"
{-| 
-}
isOneQuarterDesktop    : Attribute msg
isOneQuarterDesktop    = class "is-one-quarter-desktop"
{-| 
-}
isFourFifthsDesktop    : Attribute msg
isFourFifthsDesktop    = class "is-four-fifths-desktop"
{-| 
-}
isThreeFifthsDesktop   : Attribute msg
isThreeFifthsDesktop   = class "is-three-fifths-desktop"
{-| 
-}
isTwoFifthsDesktop     : Attribute msg
isTwoFifthsDesktop     = class "is-two-fifths-desktop"
{-| 
-}
isOneFifthDesktop      : Attribute msg
isOneFifthDesktop      = class "is-one-fifth-desktop"

{-| 
-}
isThreeQuartersWidescreen : Attribute msg
isThreeQuartersWidescreen = class "is-three-quarters-widescreen"
{-| 
-}
isTwoThirdsWidescreen     : Attribute msg
isTwoThirdsWidescreen     = class "is-two-thirds-widescreen"
{-| 
-}
isHalfWidescreen          : Attribute msg
isHalfWidescreen          = class "is-half-widescreen"
{-| 
-}
isOneThirdWidescreen      : Attribute msg
isOneThirdWidescreen      = class "is-one-third-widescreen"
{-| 
-}
isOneQuarterWidescreen    : Attribute msg
isOneQuarterWidescreen    = class "is-one-quarter-widescreen"
{-| 
-}
isFourFifthsWidescreen    : Attribute msg
isFourFifthsWidescreen    = class "is-four-fifths-widescreen"
{-| 
-}
isThreeFifthsWidescreen   : Attribute msg
isThreeFifthsWidescreen   = class "is-three-fifths-widescreen"
{-| 
-}
isTwoFifthsWidescreen     : Attribute msg
isTwoFifthsWidescreen     = class "is-two-fifths-widescreen"
{-| 
-}
isOneFifthWidescreen      : Attribute msg
isOneFifthWidescreen      = class "is-one-fifth-widescreen"

{-| 
-}
isThreeQuartersFullHD : Attribute msg
isThreeQuartersFullHD = class "is-three-quarters-fullhd"
{-| 
-}
isTwoThirdsFullHD     : Attribute msg
isTwoThirdsFullHD     = class "is-two-thirds-fullhd"
{-| 
-}
isHalfFullHD          : Attribute msg
isHalfFullHD          = class "is-half-fullhd"
{-| 
-}
isOneThirdFullHD      : Attribute msg
isOneThirdFullHD      = class "is-one-third-fullhd"
{-| 
-}
isOneQuarterFullHD    : Attribute msg
isOneQuarterFullHD    = class "is-one-quarter-fullhd"
{-| 
-}
isFourFifthsFullHD    : Attribute msg
isFourFifthsFullHD    = class "is-four-fifths-fullhd"
{-| 
-}
isThreeFifthsFullHD   : Attribute msg
isThreeFifthsFullHD   = class "is-three-fifths-fullhd"
{-| 
-}
isTwoFifthsFullHD     : Attribute msg
isTwoFifthsFullHD     = class "is-two-fifths-fullhd"
{-| 
-}
isOneFifthFullHD      : Attribute msg
isOneFifthFullHD      = class "is-one-fifth-fullhd"

{-| 
-}
isOffsetThreeQuarters : Attribute msg
isOffsetThreeQuarters = class "is-offset-three-quarters"
{-| 
-}
isOffsetTwoThirds     : Attribute msg
isOffsetTwoThirds     = class "is-offset-two-thirds"
{-| 
-}
isOffsetHalf          : Attribute msg
isOffsetHalf          = class "is-offset-half"
{-| 
-}
isOffsetOneThird      : Attribute msg
isOffsetOneThird      = class "is-offset-one-third"
{-| 
-}
isOffsetOneQuarter    : Attribute msg
isOffsetOneQuarter    = class "is-offset-one-quarter"
{-| 
-}
isOffsetFourFifths    : Attribute msg
isOffsetFourFifths    = class "is-offset-four-fifths"
{-| 
-}
isOffsetThreeFifths   : Attribute msg
isOffsetThreeFifths   = class "is-offset-three-fifths"
{-| 
-}
isOffsetTwoFifths     : Attribute msg
isOffsetTwoFifths     = class "is-offset-two-fifths"
{-| 
-}
isOffsetOneFifth      : Attribute msg
isOffsetOneFifth      = class "is-offset-one-fifth"

{-| 
-}
isOffset1 : Attribute msg
isOffset1 = class "is-1"
{-| 
-}
isOffset2 : Attribute msg
isOffset2 = class "is-2"
{-| 
-}
isOffset3 : Attribute msg
isOffset3 = class "is-3"
{-| 
-}
isOffset4 : Attribute msg
isOffset4 = class "is-4"
{-| 
-}
isOffset5 : Attribute msg
isOffset5 = class "is-5"
{-| 
-}
isOffset6 : Attribute msg
isOffset6 = class "is-6"
{-| 
-}
isOffset7 : Attribute msg
isOffset7 = class "is-7"
{-| 
-}
isOffset8 : Attribute msg
isOffset8 = class "is-8"
{-| 
-}
isOffset9 : Attribute msg
isOffset9 = class "is-9"

{-| 
-}
isOffset01 : Attribute msg
isOffset01 = class "is-offset-1"
{-| 
-}
isOffset02 : Attribute msg
isOffset02 = class "is-offset-2"
{-| 
-}
isOffset03 : Attribute msg
isOffset03 = class "is-offset-3"
{-| 
-}
isOffset04 : Attribute msg
isOffset04 = class "is-offset-4"
{-| 
-}
isOffset05 : Attribute msg
isOffset05 = class "is-offset-5"
{-| 
-}
isOffset06 : Attribute msg
isOffset06 = class "is-offset-6"
{-| 
-}
isOffset07 : Attribute msg
isOffset07 = class "is-offset-7"
{-| 
-}
isOffset08 : Attribute msg
isOffset08 = class "is-offset-8"
{-| 
-}
isOffset09 : Attribute msg
isOffset09 = class "is-offset-9"
{-| 
-}
isOffset10 : Attribute msg
isOffset10 = class "is-offset-10"
{-| 
-}
isOffset11 : Attribute msg
isOffset11 = class "is-offset-11"

{-| 
-}
isNarrow               : Attribute msg
isNarrow               = class "is-narrow"
{-| 
-}
isNarrowMobile         : Attribute msg
isNarrowMobile         = class "is-narrow-mobile"
{-| 
-}
isNarrowTouch          : Attribute msg
isNarrowTouch          = class "is-narrow-touch"
{-| 
-}
isNarrowTablet         : Attribute msg
isNarrowTablet         = class "is-narrow-tablet"
{-| 
-}
isNarrowDesktop        : Attribute msg
isNarrowDesktop        = class "is-narrow-desktop"
{-| 
-}
isNarrowWidescreen     : Attribute msg
isNarrowWidescreen     = class "is-narrow-widescreen"
{-| 
-}
isNarrowFullHD         : Attribute msg
isNarrowFullHD         = class "is-narrow-fullhd"

{-| 
-}
isGapless : Attribute msg
isGapless = class "is-gapless"

{-| 
-}
isMultiline : Attribute msg
isMultiline = class "is-multiline"

{-| 
-}
isVariable : Attribute msg
isVariable = class "is-variable"
-- TODO: Add this to columns?

{-| 
-}
isCentered : Attribute msg
isCentered = class "is-centered"


-- LAYOUT ----------------------------------------------------------------------

{-| 
-}
container : Attribute msg
container = class "container"
{-| 
-}
isFluid : Attribute msg
isFluid = class "is-fluid"
{-| 
-}
isFullHD : Attribute msg
isFullHD = class "is-fullhd"
{-| 
-}
isWidescreen : Attribute msg
isWidescreen = class "is-widescreen"

{-| 
-}
level : Attribute msg
level = class "level"
{-| 
-}
levelLeft : Attribute msg
levelLeft = class "level-left"
{-| 
-}
levelRight : Attribute msg
levelRight = class "level-right"
{-| 
-}
levelItem : Attribute msg
levelItem = class "level-item"

{-| 
-}
media : Attribute msg
media = class "media"
{-| 
-}
mediaLeft : Attribute msg
mediaLeft = class "media-left"
{-| 
-}
mediaContent : Attribute msg
mediaContent = class "media-content"
{-| 
-}
mediaRight : Attribute msg
mediaRight = class "media-right"

{-| 
-}
hero : Attribute msg
hero = class "hero"
{-| 
-}
heroBody : Attribute msg
heroBody = class "hero-body"
{-| 
-}
heroHead : Attribute msg
heroHead = class "hero-head"
{-| 
-}
heroFoot : Attribute msg
heroFoot = class "hero-foot"

{-| 
-}
section : Attribute msg
section = class "section"

{-| 
-}
footer : Attribute msg
footer = class "footer"        

{-| 
-}
tile : Attribute msg
tile = class "tile"
{-| 
-}
isAncestor : Attribute msg
isAncestor = class "is-ancestor"
{-| 
-}
isParent : Attribute msg
isParent = class "is-parent"
{-| 
-}
isChild : Attribute msg
isChild = class "is-child"
{-| 
-}
isVertical : Attribute msg
isVertical = class "is-vertical"


-- FORM ------------------------------------------------------------------------

{-| 
-}
label : Attribute msg
label = class "label"
{-| 
-}
input : Attribute msg
input = class "input"
{-| 
-}
textarea : Attribute msg
textarea = class "textarea"
{-| 
-}
select : Attribute msg
select = class "select"
{-| 
-}
checkbox : Attribute msg
checkbox = class "checkbox"
{-| 
-}
radio : Attribute msg
radio = class "radio"
{-| 
-}
help : Attribute msg
help = class "help"

{-| 
-}
control : Attribute msg
control = class "control"
{-| 
-}
field : Attribute msg
field = class "field"

{-| 
-}
hasIconsLeft : Attribute msg
hasIconsLeft = class "has-icons-left"
{-| 
-}
hasIconsRight : Attribute msg
hasIconsRight = class "has-icons-right"

{-| 
-}
hasAddons : Attribute msg
hasAddons = class "has-addons"

{-| 
-}
isExpanded : Attribute msg
isExpanded = class "is-expanded"

{-| 
-}
isFullWidth : Attribute msg
isFullWidth = class "is-fullwidth"

{-| 
-}
hasAddonsCentered : Attribute msg
hasAddonsCentered = class "has-addons-centered"
{-| 
-}
hasAddonsRight : Attribute msg
hasAddonsRight = class "has-addons-right"

{-| 
-}
isGrouped : Attribute msg
isGrouped = class "is-grouped"
{-| 
-}
isGroupedCentered : Attribute msg
isGroupedCentered = class "is-grouped-centered"
{-| 
-}
isGroupedRight : Attribute msg
isGroupedRight = class "is-grouped-right"

{-| 
-}
isGroupedMultiline : Attribute msg
isGroupedMultiline = class "is-grouped-multiline"

{-| 
-}
isHorizontal : Attribute msg
isHorizontal = class "is-horizontal"

{-| 
-}
fieldLabel : Attribute msg
fieldLabel = class "field-label"
{-| 
-}
fieldBody  : Attribute msg
fieldBody  = class "field-body"

{-| 
-}
isMultiple : Attribute msg
isMultiple = class "is-multiple"

{-| 
-}
file : Attribute msg
file = class "file"
{-| 
-}
fileLabel : Attribute msg
fileLabel = class "file-label"
{-| 
-}
fileInput : Attribute msg
fileInput = class "file-input"
{-| 
-}
fileCTA : Attribute msg
fileCTA = class "file-cta"
{-| 
-}
fileIcon : Attribute msg
fileIcon = class "file-icon"
{-| 
-}
fileName : Attribute msg
fileName = class "file-name"
{-| 
-}
hasName : Attribute msg
hasName = class "has-name"


-- ELEMENTS --------------------------------------------------------------------

{-| 
-}
box : Attribute msg
box = class "box"

{-| 
-}
button : Attribute msg
button = class "button"
{-| 
-}
buttons : Attribute msg
buttons = class "buttons"
{-| 
-}
isOutlined : Attribute msg
isOutlined = class "is-outlined"
{-| 
-}
isInverted : Attribute msg
isInverted = class "is-inverted"
{-| 
-}
isSelected : Attribute msg
isSelected = class "is-selected"

{-| 
-}
content : Attribute msg
content = class "content"

{-| 
-}
delete : Attribute msg
delete = class "delete"

{-| 
-}
icon : Attribute msg
icon = class "icon"
-- fas : Attribute msg
-- fas = class "fas"
-- faLg : Attribute msg
-- faLg = class "fa-lg"
-- fa2x : Attribute msg
-- fa2x = class "fa-2x"
-- fa3x : Attribute msg
-- fa3x = class "fa-3x"
-- TODO: Consider adding Icon junk.

{-| 
-}
image : Attribute msg
image = class "image"

{-| 
-}
is16x16   : Attribute msg
is16x16   = class "is-16x16"
{-| 
-}
is24x24   : Attribute msg
is24x24   = class "is-24x24"
{-| 
-}
is32x32   : Attribute msg
is32x32   = class "is-32x32"
{-| 
-}
is48x48   : Attribute msg
is48x48   = class "is-48x48"
{-| 
-}
is64x64   : Attribute msg
is64x64   = class "is-64x64"
{-| 
-}
is96x96   : Attribute msg
is96x96   = class "is-96x96"

{-| 
-}
is016x016   : Attribute msg
is016x016   = class "is-16x16"
{-| 
-}
is024x024   : Attribute msg
is024x024   = class "is-24x24"
{-| 
-}
is032x032   : Attribute msg
is032x032   = class "is-32x32"
{-| 
-}
is048x048   : Attribute msg
is048x048   = class "is-48x48"
{-| 
-}
is064x064   : Attribute msg
is064x064   = class "is-64x64"
{-| 
-}
is096x096   : Attribute msg
is096x096   = class "is-96x96"
{-| 
-}
is128x128 : Attribute msg
is128x128 = class "is-128x128"

{-| 
-}
isSquare : Attribute msg
isSquare = class "is-square"

{-| 
-}
is1by1   : Attribute msg
is1by1   = class "is-1by1"
{-| 
-}
is5by4   : Attribute msg
is5by4   = class "is-5by4"
{-| 
-}
is4by3   : Attribute msg
is4by3   = class "is-4by3"
{-| 
-}
is3by2   : Attribute msg
is3by2   = class "is-3by2"
{-| 
-}
is5by3   : Attribute msg
is5by3   = class "is-5by3"
{-| 
-}
is16by9  : Attribute msg
is16by9  = class "is-16by9"
{-| 
-}
is2by1   : Attribute msg
is2by1   = class "is-2by1"
{-| 
-}
is3by1   : Attribute msg
is3by1   = class "is-3by1"
{-| 
-}
is4by5   : Attribute msg
is4by5   = class "is-4by5"
{-| 
-}
is3by4   : Attribute msg
is3by4   = class "is-3by4"
{-| 
-}
is2by3   : Attribute msg
is2by3   = class "is-2by3"
{-| 
-}
is3by5   : Attribute msg
is3by5   = class "is-3by5"
{-| 
-}
is9by16  : Attribute msg
is9by16  = class "is-9by16"
{-| 
-}
is1by2   : Attribute msg
is1by2   = class "is-1by2"
{-| 
-}
is1by3   : Attribute msg
is1by3   = class "is-1by3"
-- TODO: Update Elements.Image to match this.

{-| 
-}
is01by01 : Attribute msg
is01by01 = class "is-1by1"
{-| 
-}
is05by04 : Attribute msg
is05by04 = class "is-5by4"
{-| 
-}
is04by03 : Attribute msg
is04by03 = class "is-4by3"
{-| 
-}
is03by02 : Attribute msg
is03by02 = class "is-3by2"
{-| 
-}
is05by03 : Attribute msg
is05by03 = class "is-5by3"
{-| 
-}
is16by09 : Attribute msg
is16by09 = class "is-16by9"
{-| 
-}
is02by01 : Attribute msg
is02by01 = class "is-2by1"
{-| 
-}
is03by01 : Attribute msg
is03by01 = class "is-3by1"
{-| 
-}
is04by05 : Attribute msg
is04by05 = class "is-4by5"
{-| 
-}
is03by04 : Attribute msg
is03by04 = class "is-3by4"
{-| 
-}
is02by03 : Attribute msg
is02by03 = class "is-2by3"
{-| 
-}
is03by05 : Attribute msg
is03by05 = class "is-3by5"
{-| 
-}
is09by16 : Attribute msg
is09by16 = class "is-9by16"
{-| 
-}
is01by02 : Attribute msg
is01by02 = class "is-1by2"
{-| 
-}
is01by03 : Attribute msg
is01by03 = class "is-1by3"

{-| 
-}
notification : Attribute msg
notification = class "notification"

{-| 
-}
progress : Attribute msg
progress = class "progress"

{-| 
-}
table : Attribute msg
table = class "table"
{-| 
-}
isBordered : Attribute msg
isBordered = class "is-bordered"
{-| 
-}
isStriped : Attribute msg
isStriped = class "is-striped"

{-| 
-}
tag : Attribute msg
tag = class "tag"
{-| 
-}
tags : Attribute msg
tags = class "tags"

{-| 
-}
isDelete : Attribute msg
isDelete = class "is-delete"

{-| 
-}
title : Attribute msg
title = class "title"
{-| 
-}
subtitle : Attribute msg
subtitle = class "subtitle"
{-| 
-}
isSpaced : Attribute msg
isSpaced = class "is-spaced"


-- COMPONENTS ------------------------------------------------------------------

{-| 
-}
breadcrumb : Attribute msg
breadcrumb = class "breadcrumb"
{-| 
-}
hasArrowSeparator : Attribute msg
hasArrowSeparator = class "has-arrow-separator"
{-| 
-}
hasBulletSeparator : Attribute msg
hasBulletSeparator = class "has-bullet-separator"
{-| 
-}
hasDotSeparator : Attribute msg
hasDotSeparator = class "has-dot-separator"
{-| 
-}
hasSucceedsSeparator : Attribute msg
hasSucceedsSeparator = class "has-succeeds-separator"
-- TODO: Are these all currently included?

{-| 
-}
card : Attribute msg
card = class "card"
{-| 
-}
cardHeader : Attribute msg
cardHeader = class "card-header"
{-| 
-}
cardHeaderTitle : Attribute msg
cardHeaderTitle = class "card-header-title"
{-| 
-}
cardHeaderIcon : Attribute msg
cardHeaderIcon = class "card-header-icon"
{-| 
-}
cardImage : Attribute msg
cardImage = class "card-image"
{-| 
-}
cardContent : Attribute msg
cardContent = class "card-content"
{-| 
-}
cardFooter : Attribute msg
cardFooter = class "card-footer"
{-| 
-}
cardFooterItem : Attribute msg
cardFooterItem = class "card-footer-item"

{-| 
-}
dropdown : Attribute msg
dropdown = class "dropdown"
{-| 
-}
dropdownTrigger : Attribute msg
dropdownTrigger = class "dropdown-trigger"
{-| 
-}
dropdownMenu : Attribute msg
dropdownMenu = class "dropdown-menu"
{-| 
-}
dropdownContent : Attribute msg
dropdownContent = class "dropdown-content"
{-| 
-}
dropdownItem : Attribute msg
dropdownItem = class "dropdown-item"
{-| 
-}
dropdownDivider : Attribute msg
dropdownDivider = class "dropdown-divider"

{-| 
-}
menu : Attribute msg
menu = class "menu"
{-| 
-}
menuLabel : Attribute msg
menuLabel = class "menu-label"
{-| 
-}
menuList : Attribute msg
menuList = class "menu-list"

{-| 
-}
message : Attribute msg
message = class "message"
{-| 
-}
messageBody : Attribute msg
messageBody = class "message-body"
{-| 
-}
messageHeader : Attribute msg
messageHeader = class "message-header"

{-| 
-}
modal : Attribute msg
modal = class "modal"
{-| 
-}
modalBackground : Attribute msg
modalBackground = class "modal-background"
{-| 
-}
modalContent : Attribute msg
modalContent = class "modal-content"
{-| 
-}
modalClose : Attribute msg
modalClose = class "modal-close"
{-| 
-}
modalCard : Attribute msg
modalCard = class "modal-card"
{-| 
-}
modalCardHead : Attribute msg
modalCardHead = class "modal-card-head"
{-| 
-}
modalCardTitle : Attribute msg
modalCardTitle = class "modal-card-title"
{-| 
-}
modalCardBody : Attribute msg
modalCardBody = class "modal-card-body"
{-| 
-}
modalCardFoot : Attribute msg
modalCardFoot = class "modal-card-foot"

{-| 
-}
navbar : Attribute msg
navbar = class "navbar"
{-| 
-}
navbarBrand : Attribute msg
navbarBrand = class "navbar-brand"
{-| 
-}
navbarBurger : Attribute msg
navbarBurger = class "navbar-burger"
{-| 
-}
navbarMenu : Attribute msg
navbarMenu = class "navbar-menu"
{-| 
-}
navbarStart : Attribute msg
navbarStart = class "navbar-start"
{-| 
-}
navbarEnd : Attribute msg
navbarEnd = class "navbar-end"
{-| 
-}
navbarItem : Attribute msg
navbarItem = class "navbar-item"
{-| 
-}
navbarLink : Attribute msg
navbarLink = class "navbar-link"
{-| 
-}
navbarDropdown : Attribute msg
navbarDropdown = class "navbar-dropdown"
{-| 
-}
navbarDivider : Attribute msg
navbarDivider = class "navbar-divider"
{-| 
-}
isFixedTop : Attribute msg
isFixedTop = class "is-fixed-top"
{-| 
-}
isFixedBottom : Attribute msg
isFixedBottom = class "is-fixed-bottom"
{-| 
-}
hasNavbarFixedTop : Attribute msg
hasNavbarFixedTop = class "has-navbar-fixed-top"
{-| 
-}
hasNavbarFixedBottom : Attribute msg
hasNavbarFixedBottom = class "has-navbar-fixed-bottom"
{-| 
-}
hasDropdown : Attribute msg
hasDropdown = class "has-dropdown"
{-| 
-}
hasDropdownUp : Attribute msg
hasDropdownUp = class "has-dropdown-up"
{-| 
-}
isTransparent : Attribute msg
isTransparent = class "is-transparent"

{-| 
-}
pagination : Attribute msg
pagination = class "pagination"
{-| 
-}
paginationPrevious : Attribute msg
paginationPrevious = class "pagination-previous"
{-| 
-}
paginationNext : Attribute msg
paginationNext = class "pagination-next"
{-| 
-}
paginationList : Attribute msg
paginationList = class "pagination-list"
{-| 
-}
paginationLink : Attribute msg
paginationLink = class "pagination-link"
{-| 
-}
paginationEllipsis : Attribute msg
paginationEllipsis = class "pagination-ellipsis"
{-| 
-}
isCurrent : Attribute msg
isCurrent = class "is-current"

{-| 
-}
panel : Attribute msg
panel = class "panel"
{-| 
-}
panelHeading : Attribute msg
panelHeading = class "panel-heading"
{-| 
-}
panelTabs : Attribute msg
panelTabs = class "panel-tabs"
{-| 
-}
panelBlock : Attribute msg
panelBlock = class "panel-block"
{-| 
-}
panelIcon : Attribute msg
panelIcon = class "panel-icon"

{-| 
-}
tabs : Attribute msg
tabs = class "tabs"
{-| 
-}
isToggle : Attribute msg
isToggle = class "is-toggle"
{-| 
-}
isToggleRounded : Attribute msg
isToggleRounded = class "is-toggle-rounded"
                  

