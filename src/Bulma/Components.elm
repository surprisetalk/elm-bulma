
module Bulma.Components exposing
  ( Breadcrumb
  , BreadcrumbModifiers
  , BreadcrumbSeparator(..)
  , breadcrumbModifiers
  , breadcrumb
  , Crumblet
  , crumblet
  , Card
  , card
  , CardPartition
  , cardHeader
  , easyCardHeader
  , easierCardHeader
  , CardHeaderItem
  , cardTitle
  , easyCardTitle
  , cardIcon
  , cardIconLink
  , easyCardIconLink
  , cardImage
  , cardContent
  , cardFooter
  , CardFooterItem
  , cardFooterItem
  , cardFooterItemLink
  , Dropdown
  , DropdownModifiers
  , dropdownModifiers
  , dropdown
  , hoverableDropdown
  , DropdownContent
  , dropdownTrigger
  , dropdownMenu
  , DropdownItem
  , dropdownItem
  , dropdownItemLink
  , dropdownDivider
  , Menu
  , menu
  , MenuPart
  , menuLabel
  , menuList
  , MenuListItem
  , menuListItem 
  , menuListItemLink
  , easyMenuListItemLink
  , Message
  , MessageModifiers
  , messageModifiers
  , message
  , MessagePartition
  , messageBody 
  , messageHeader
  , messageHeaderWithDelete
  , Modal
  , IsModalOpen
  , modal
  , easyModal
  , ModalPartition
  , modalContent
  , modalBackground
  , easyModalBackground
  , modalClose
  , easyModalClose
  , modalCard
  , ModalCardPartition
  , modalCardBody
  , modalCardHead
  , modalCardTitle
  , modalCardFoot
  , Navbar
  , NavbarModifiers
  , navbarModifiers
  , navbar
  , fixedNavbar
  , NavbarBurger
  , navbarBurger
  , navbarCross
  , NavbarSection
  , navbarMenu
  , navbarBrand
  , NavbarSide
  , navbarStart
  , navbarEnd
  , NavbarItem
  , navbarItem
  , navbarItemLink
  , navbarDivider
  , navbarItemDropdown
  , hoverableNavbarItemDropdown
  , NavbarDropdown
  , IsBoxed
  , navbarDropdown
  , NavbarLink
  , navbarLink
  , Pagination
  , pagination
  , roundedPagination
  , PaginationPartition
  , paginationPrev
  , easyPaginationPrev
  , paginationNext
  , easyPaginationNext
  , paginationList
  , PaginationListItem
  , IsCurrent
  , paginationLink
  , easyPaginationLink
  , paginationEllipsis
  , easyPaginationEllipsis
  , Panel
  , panel
  , PanelPartition
  , panelHeading
  , panelBlock
  , panelLabel
  , panelLink
  , panelLinkWithIcon
  , panelCheckbox
  , panelTabs
  , PanelTab
  , IsActive
  , panelTab
  , Tabs
  , TabsModifiers
  , TabsStyle(..)
  , tabsModifiers
  , tabs
  , Tab
  , tab
  )

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Aliases](#aliases)
- [Breadcrumb](#breadcrumb)
- [Card](#card)
- [Dropdown](#dropdown)
- [Menu](#menu)
- [Message](#message)
- [Modal](#modal)
- [Navbar](#navbar)
- [Pagination](#pagination)
- [Panel](#panel)
- [Tabs](#tabs)

# Aliases
@docs IsActive

# Breadcrumb
@docs Breadcrumb, BreadcrumbModifiers, BreadcrumbSeparator, breadcrumbModifiers
@docs breadcrumb

## Crumblet
@docs Crumblet
@docs crumblet

# Card
@docs Card
@docs card

## Card Partitions
@docs CardPartition

### Card Header
@docs cardHeader, easyCardHeader, easierCardHeader

#### Card Header Item
@docs CardHeaderItem 
@docs cardTitle, easyCardTitle
@docs cardIcon, cardIconLink, easyCardIconLink

### Card Image
@docs cardImage

### Card Content
@docs cardContent

### Card Footer
@docs cardFooter

#### Card Footer Item
@docs CardFooterItem
@docs cardFooterItem, cardFooterItemLink

# Dropdown
@docs Dropdown, DropdownModifiers, dropdownModifiers
@docs dropdown, hoverableDropdown

## Dropdown Content
@docs DropdownContent
@docs dropdownTrigger
@docs dropdownMenu

### Dropdown Item
@docs DropdownItem 
@docs dropdownItem, dropdownItemLink, dropdownDivider

# Menu
@docs Menu
@docs menu

## Menu Part
@docs MenuPart

### Menu Label
@docs menuLabel

### Menu List
@docs menuList

#### Menu List Item
@docs MenuListItem
@docs menuListItem 
@docs menuListItemLink, easyMenuListItemLink

# Message
@docs Message, MessageModifiers, messageModifiers
@docs message

## Message Partition
@docs MessagePartition 
@docs messageBody 
@docs messageHeader, messageHeaderWithDelete

# Modal
@docs Modal, IsModalOpen
@docs modal, easyModal

## Modal Partition
@docs ModalPartition
@docs modalContent
@docs modalBackground, easyModalBackground
@docs modalClose, easyModalClose
@docs modalCard

### Modal Card Partition
@docs ModalCardPartition
@docs modalCardBody
@docs modalCardHead, modalCardTitle
@docs modalCardFoot

# Navbar
@docs Navbar, NavbarModifiers, navbarModifiers
@docs navbar
@docs fixedNavbar

## Navbar Sections
@docs NavbarSection
@docs navbarBrand, navbarMenu
@docs NavbarSide, navbarStart, navbarEnd

### Navbar Burger
@docs NavbarBurger
@docs navbarBurger, navbarCross

### Navbar Item
@docs NavbarItem
@docs navbarItem, navbarItemLink
@docs navbarDivider

#### Navbar Item Dropdown
@docs navbarItemDropdown, hoverableNavbarItemDropdown
@docs NavbarDropdown, IsBoxed, navbarDropdown
@docs NavbarLink, navbarLink

# Pagination
@docs Pagination, pagination, roundedPagination

## Pagination Partition
@docs PaginationPartition
@docs paginationPrev, easyPaginationPrev
@docs paginationNext, easyPaginationNext
@docs paginationList

## Pagination List Item
@docs PaginationListItem, IsCurrent
@docs paginationLink, easyPaginationLink
@docs paginationEllipsis, easyPaginationEllipsis

# Panel
@docs Panel
@docs panel

## Panel Partition
@docs PanelPartition
@docs panelHeading
@docs panelBlock, panelLabel, panelLink, panelLinkWithIcon, panelCheckbox
@docs panelTabs

### Panel Tab
@docs PanelTab
@docs panelTab

# Tabs
@docs Tabs, TabsModifiers, TabsStyle, tabsModifiers
@docs tabs

## Tab
@docs Tab
@docs tab
-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import Bulma.Classes as B

import Bulma.Modifiers exposing ( Color(..), Size(..), HorizontalAlignment(..), VerticalAlignment(..), VerticalDirection(..) )

import Bulma.Elements exposing ( Image, easyDelete, Button, ButtonModifiers, button, Icon, IconBody ) 

import Html exposing ( Html, Attribute, text, div, p, a, ul, li, span, input )
import Html.Events exposing ( onClick )
import Html.Attributes exposing ( attribute, class, type_ )


-- BREADCRUMB ------------------------------------------------------------------

{-| -}
type alias Breadcrumb msg = Html msg

{-| -}
type BreadcrumbSeparator
  = Slash
  | Arrow
  | Bullet
  | Dot
  | Succeeds

{-| -}
type alias BreadcrumbModifiers
  = { separator : BreadcrumbSeparator
    , alignment : HorizontalAlignment
    , size      : Size
    }

{-| -}
breadcrumbModifiers : BreadcrumbModifiers
breadcrumbModifiers
  = { separator = Slash
    , alignment = Left
    , size      = Standard
    }

{-| A navigation thingy.
The first list of attributes is for a `nav.breadcrumb` tag. The second is for an inner `ul` tag.

    type Msg = GoHome
             | GoAway
             | GoTeam

    myBreadCrumb : Html Msg
    myBreadCrumb
      = breadcrumb breadcrumbModifiers [] []
        [ crumblet False [] [ onClick GoHome ]
        , crumblet False [] [ onClick GoAway ]
        , crumblet False [] [ onClick GoTeam ]
        , crumblet True  [] [                ]
        ]
-}
breadcrumb : BreadcrumbModifiers -> List (Attribute msg) -> List (Attribute msg) -> List (Crumblet msg) -> Breadcrumb msg
breadcrumb {separator,alignment,size} attrs attrs_
  = node "nav"
    [ attribute "aria-label" "breadcrumb" 
    , B.breadcrumb
    , case separator of
        Slash    -> B.none
        Arrow    -> B.hasArrowSeparator
        Bullet   -> B.hasBulletSeparator
        Dot      -> B.hasDotSeparator
        Succeeds -> B.hasSucceedsSeparator
    , case size of
        Small    -> B.isSmall
        Standard -> B.none
        Medium   -> B.isMedium
        Large    -> B.isLarge
    , case alignment of
        Left     -> B.none
        Centered -> B.isCentered
        Right    -> B.isRight
    ]
    attrs
    << ls
      << ul attrs_

{-| -}
type alias Crumblet msg = Html msg

{-| A convenience element for `breadcrumb`.
The first attribute list applies to the outer `li` tag. The second attribute list applies to the inner `a` tag.
-}
crumblet : IsActive -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Crumblet msg
crumblet isActive attrs attrs_
  = li ( if isActive then class "is-active" :: attrs else attrs )
    << ls
      << a attrs_


-- CARD ------------------------------------------------------------------------

{-| -}
type alias Card msg = Html msg

{-| The card component comprises several elements that you can mix and match.
`card` is the main container for the card-partitions.

    myCard : Html msg
    myCard
      = card []
        [ cardImage   [] []
        , cardContent [] []
        ]
-}
card : List (Attribute msg) -> List (CardPartition msg) -> Card msg
card = node "div" [ B.card ]


-- CARD PARTITIONS --

{-| -}
type alias CardPartition msg = Html msg

{-| A horizontal bar with a shadow.

    myCardHeader : Html msg
    myCardHeader
      = cardHeader []
        [ cardTitle [] 
          [ text "Queen of Hearts"
          ]
        , cardIcon []
          [ icon Standard []
            [ heart_o
            ]
          ]
        ]
-}
cardHeader : List (Attribute msg) -> List (Html msg) -> CardPartition msg
cardHeader = node "header" [ B.cardHeader ]

{-|
    type Msg = ShowCard

    myIcon : Html msg
    myIcon = icon Standard [] [ diamond ] 

    myCardHeader : Html Msg
    myCardHeader
      = easyCardHeader []
        { title       = [ text "4 of Diamonds" ]
        , icon        = [ myIcon               ]
        , onClickIcon = ShowCard
        }
-}
easyCardHeader : List (Attribute msg) -> { title : List (Html msg), icon : List (Html msg), onClickIcon : msg } -> CardPartition msg
easyCardHeader attrs {title,icon,onClickIcon}
  = cardHeader attrs
    [ cardTitle    [                     ] title
    , cardIconLink [ onClick onClickIcon ] icon
    ]
  
{-| -}
easierCardHeader : List (Attribute msg) -> { title : String, icon : Icon msg, onClickIcon : msg } -> CardPartition msg
easierCardHeader attrs {title,icon,onClickIcon}
  = cardHeader attrs
    [ easyCardTitle    []             title
    , easyCardIconLink [] onClickIcon icon
    ]

{-| -}
type alias CardHeaderItem msg = Html msg

{-| -}
cardTitle : List (Attribute msg) -> List (Html msg) -> CardHeaderItem msg
cardTitle = node "p" [ B.cardHeaderTitle ]

{-| -}
easyCardTitle : List (Attribute msg) -> String -> CardHeaderItem msg
easyCardTitle attrs = text >> ls >> cardTitle attrs

{-| -}
cardIcon : List (Attribute msg) -> List (Icon msg) -> CardHeaderItem msg
cardIcon = node "p" [ B.cardHeaderIcon ]

{-| -}
cardIconLink : List (Attribute msg) -> List (Icon msg) -> CardHeaderItem msg
cardIconLink = node "a" [ B.cardHeaderIcon ]

{-| -}
easyCardIconLink : List (Attribute msg) -> msg -> Icon msg -> CardHeaderItem msg
easyCardIconLink attrs msg
  = cardIcon (onClick msg :: attrs) << ls

{-| 
    import B.Elements exposing (image,imageModifiers)

    myImage : Html msg
    myImage
      = image imageModifiers []
        [ img [ src "http://i.imgur.com/LcvP04R.gif" ] []
        ]

    myCardImage : Html msg
    myCardImage
      = cardImage [] [ myImage ]
-}
cardImage : List (Attribute msg) -> List (Image msg) -> CardPartition msg
cardImage = node "div" [ B.cardImage ]

{-| -}
cardContent : List (Attribute msg) -> List (Html msg) -> CardPartition msg
cardContent = node "div" [ B.cardContent ]

{-| 
    myCardFooter : Html msg
    myCardFooter
      = cardFooter []
        [ cardFooterItemLink [] [ text "Save"   ]
        , cardFooterItemLink [] [ text "Edit"   ]
        , cardFooterItemLink [] [ text "Delete" ]
        ]
-}
cardFooter : List (Attribute msg) -> List (CardFooterItem msg) -> CardPartition msg
cardFooter = node "footer" [ B.cardFooter ]

{-| -}
type alias CardFooterItem msg = Html msg

{-| -}
cardFooterItem : List (Attribute msg) -> List (Html msg) -> CardFooterItem msg
cardFooterItem = node "p" [ B.cardFooterItem ]

{-| -}
cardFooterItemLink : List (Attribute msg) -> List (Html msg) -> CardFooterItem msg
cardFooterItemLink = node "a" [ B.cardFooterItem ]


-- DROPDOWN --------------------------------------------------------------------

{-| -}
type alias Dropdown msg = Html msg

{-| -}
type alias DropdownContent msg = Html msg

{-| -}
type alias DropdownItem msg = Html msg

{-| -}
type alias DropdownModifiers
  = { horizontalAlignment : HorizontalAlignment
    , verticalDirection   : VerticalDirection
    }

{-| -}
dropdownModifiers : DropdownModifiers
dropdownModifiers
  = { horizontalAlignment = Left
    , verticalDirection   = Down
    }

{-| 
    type Msg = ToggleMenu

    myDropdownTrigger : Html Msg
    myDropdownTrigger 
      = dropdownTrigger []
        [ button buttonModifiers 
          [ onClick ToggleMenu 
          , attribute "aria-haspopup" "true"
          , attribute "aria-controls" "dropdown-menu"
          ]
          [ text "Toggle Me"
          ]
        ]

    myDropdownMenu : Html Msg
    myDropdownMenu
      = dropdownMenu [] []
        [ dropdownItem     False [               ] [ text "Cool Birds" ]
        , dropdownDivider        [               ] [                   ]
        , dropdownItemLink False [ href "#duck"  ] [ text "Duck"       ]
        , dropdownItemLink False [ href "#duck"  ] [ text "Duck"       ]
        , dropdownItemLink True  [ href "#goose" ] [ text "Goose"      ]
        ]

    myDropdown : Bool -> Html Msg
    myDropdown isMenuOpen
      = dropdown isMenuOpen dropdownModifiers []
        [ myDropdownTrigger
        , myDropdownMenu
        ]
-}
dropdown : IsActive -> DropdownModifiers -> List (Attribute msg) -> List (DropdownContent msg) -> Dropdown msg
dropdown isActive {horizontalAlignment,verticalDirection}
  = node "div"
    [ B.dropdown
    , case isActive of
        True  -> B.isActive
        _     -> B.none
    , case horizontalAlignment of
        Right -> B.isRight
        _     -> B.none
    , case verticalDirection of
        Up    -> B.isUp
        _     -> B.none
    ]

{-| A hoverable variant of `dropdown`.
-}
hoverableDropdown : DropdownModifiers -> List (Attribute msg) -> List (DropdownContent msg) -> Dropdown msg
hoverableDropdown {horizontalAlignment,verticalDirection}
  = node "div"
    [ B.dropdown
    , B.isHoverable
    , case horizontalAlignment of
        Right -> B.isRight
        _     -> B.none
    , case verticalDirection of
        Up -> B.isUp
        _  -> B.none
    ]

{-| The container for the button/link that activates the dropdown menu.
-}
dropdownTrigger : List (Attribute msg) -> List (Button msg) -> DropdownContent msg
dropdownTrigger = node "div" [ B.dropdownTrigger ]

-- {-| TODO 
-- -}
-- dropdownTriggerButton : ButtonModifiers msg -> List (Attribute msg) -> List (Html msg) -> Button msg
-- dropdownTriggerButton mods 
--   = button mods
--     << (++)
--       [ attribute "aria-haspopup" "true"
--       , attribute "aria-controls" "dropdown-menu"
--       ]

{-| The container for the dropdown's items.
The first attributes list is for the outer `div.dropdown-menu`. The inner list is for the `dropdown-content`.
-}
dropdownMenu : List (Attribute msg) -> List (Attribute msg) -> List (DropdownItem msg) -> DropdownContent msg
dropdownMenu attrs attrs_ items
  = div ( attrs
       ++ [ class "dropdown-menu"
          , attribute "role" "menu"
          ]
        )
    [ div ( class "dropdown-content" :: attrs_ )
      items
    ]

{-| A synonym for `a.dropdown-item.is-active`.
-}
dropdownItemLink : IsActive -> List (Attribute msg) -> List (Html msg) -> DropdownItem msg
dropdownItemLink isActive = node "a" [ B.dropdownItem, if isActive then B.isActive else B.none ]

{-| A synonym for `div.dropdown-item.is-active`.
-}
dropdownItem : IsActive -> List (Attribute msg) -> List (Html msg) -> DropdownItem msg
dropdownItem isActive = node "div" [ B.dropdownItem, if isActive then B.isActive else B.none ]

{-| An empty `hr.dropdown-divider` element.
-}
dropdownDivider : List (Attribute msg) -> List (Html msg) -> DropdownItem msg
dropdownDivider = node "hr" [ B.dropdownDivider ]


-- MENU ------------------------------------------------------------------------

{-| -}
type alias Menu msg = Html msg

{-| Simple menus for vertical navigation.

    myMenu : Html msg
    myMenu
      = menu []
        [ menuLabel [] [ text "General" ]
        , menuList  [] 
          [ menuListItemLink False [] [ text "Dashboard" ]
          , menuListItemLink False [] [ text "Customers" ]
          ]
        , menuLabel [] [ text "Administration" ]
        , menuList  [] 
          [ menuListItem [] 
            [ menuListItemLink False [] [ text "Team Settings" ]
            ]
          , menuListItem [] 
            [ menuListItemLink True [] [ text "Manage Your Team" ]
            , menuList []
              [ menuListItemLink False [] [ text "Members" ]
              ]
            ]
          ]
        ]
-}
menu : List (Attribute msg) -> List (MenuPart msg) -> Menu msg
menu = node "aside" [ B.menu ]


-- MENU ITEMS --

{-| -}
type alias MenuPart msg = Html msg

{-| -}
menuLabel : List (Attribute msg) -> List (Html msg) -> MenuPart msg
menuLabel = node "p" [ B.menuLabel ]

{-| -}
menuList : List (Attribute msg) -> List (MenuListItem msg) -> MenuPart msg
menuList = node "ul" [ B.menuList ]


-- MENU LIST ITEMS --

{-| -}
type alias MenuListItem msg = Html msg

{-| -}
menuListItem : List (Attribute msg) -> List (Html msg) -> MenuListItem msg
menuListItem = li

{-| -}
menuListItemLink : IsActive -> List (Attribute msg) -> List (Html msg) -> MenuListItem msg
menuListItemLink active = a << (::) (class (if active then "is-active" else ""))
-- KLUDGE

{-| -}
easyMenuListItemLink : IsActive -> List (Attribute msg) -> msg -> Icon msg -> String -> MenuListItem msg
easyMenuListItemLink active attrs msg icon str
  = menuListItemLink active (onClick msg :: attrs)
    [ icon
    , text str
    ]


-- MESSAGE ---------------------------------------------------------------------

{-| -}
type alias Message msg = Html msg

{-| -}
type alias MessageModifiers
  = { color : Color
    , size  : Size
    }

{-| -}
messageModifiers : MessageModifiers
messageModifiers
  = { color = Default
    , size  = Standard
    }

{-| 
    myMessage : Html msg
    myMessage
      = message myMessageModifiers []
        [ messageHeader []
          [ p [] [ text "hello" ] 
          ]
        , messageBody []
          [ text "lorem ipsum"
          ]
        ]
-}
message : MessageModifiers -> List (Attribute msg) -> List (MessagePartition msg) -> Message msg
message {color,size}
  = node "article"
    [ B.message
    , case color of
        Default -> B.none
        White   -> B.isWhite
        Light   -> B.isLight
        Dark    -> B.isDark
        Black   -> B.isBlack
        Primary -> B.isPrimary
        Link    -> B.isLink
        Info    -> B.isInfo
        Success -> B.isSuccess
        Warning -> B.isWarning
        Danger  -> B.isDanger
    , case size of
        Small    -> B.isSmall
        Standard -> B.none
        Medium   -> B.isMedium
        Large    -> B.isLarge
    ]


-- MESSAGE PARTITONS --

{-| -}
type alias MessagePartition msg = Html msg

{-| -}
messageHeader : List (Attribute msg) -> List (Html msg) -> MessagePartition msg
messageHeader = node "div" [ B.messageHeader ]

{-| -}
messageHeaderWithDelete : List (Attribute msg) -> msg -> List (Html msg) -> MessagePartition msg
messageHeaderWithDelete attrs msg
  = node "div" [ B.messageHeader ] attrs
  << flip (++) [ easyDelete [] msg ]

{-| -}
messageBody : List (Attribute msg) -> List (Html msg) -> MessagePartition msg
messageBody = node "div" [ B.messageBody ]


-- MODAL -----------------------------------------------------------------------

{-| -}
type alias Modal msg = Html msg

{-| -}
type alias IsModalOpen = Bool

{-|
    myModal : Html msg
    myModal
      = modal True []
        [ modalBackground [] []
        , modalContent []
          [ text "Anything can go here!"
          ]
        , modalClose Large [] []
        ]
-}
modal : IsModalOpen -> List (Attribute msg) -> List (ModalPartition msg) -> Modal msg
modal active
  = node "div"
    [ B.modal
    , case active of
        True  -> B.isActive
        False -> B.none
    ]

{-| 
    type Msg = CloseModal

    myModal : Html Msg
    myModal
      = easyModal True [] CloseModal
        [ text "Your content goes here."
        ]
-}
easyModal : IsModalOpen -> List (Attribute msg) -> msg -> List (Html msg) -> Modal msg
easyModal active attrs close content
  = modal active attrs
    [ easyModalBackground   [] close
    , modalContent          [] content
    , easyModalClose Standard [] close
    ]


-- MODAL PARTITIONS --

{-| -}
type alias ModalPartition msg = Html msg

{-| -}
modalBackground : List (Attribute msg) -> List (Html msg) -> ModalPartition msg
modalBackground = node "div" [ B.modalBackground ]

{-| -}
easyModalBackground : List (Attribute msg) -> msg -> ModalPartition msg
easyModalBackground attrs onClickBackground
  = modalBackground (onClick onClickBackground :: attrs) []

{-| -}
modalContent : List (Attribute msg) -> List (Html msg) -> ModalPartition msg
modalContent = node "div" [ B.modalContent ]

{-| -}
modalClose : Size -> List (Attribute msg) -> List (Html msg) -> ModalPartition msg
modalClose size
  = node "a"
    [ B.modalClose
    , case size of
        Small    -> B.isSmall
        Standard -> B.none
        Medium   -> B.isMedium
        Large    -> B.isLarge
    ]

{-| -}
easyModalClose : Size -> List (Attribute msg) -> msg -> ModalPartition msg
easyModalClose size attrs onClickModal
  = modalClose size (onClick onClickModal :: attrs) []

{-| -}
modalCard : List (Attribute msg) -> List (ModalCardPartition msg) -> ModalPartition msg
modalCard = node "div" [ B.modalCard ]


-- MODAL CARD PARTITIONS --

{-| -}
type alias ModalCardPartition msg = Html msg

{-| -}
modalCardHead : List (Attribute msg) -> List (Html msg) -> ModalCardPartition msg
modalCardHead = node "div" [ B.modalCardHead ]

{-| -}
modalCardTitle : List (Attribute msg) -> List (Html msg) -> Html msg
modalCardTitle = node "div" [ B.modalCardTitle ]

{-| -}
modalCardBody : List (Attribute msg) -> List (Html msg) -> ModalCardPartition msg
modalCardBody = node "div" [ B.modalCardBody ]

{-| -}
modalCardFoot : List (Attribute msg) -> List (Html msg) -> ModalCardPartition msg
modalCardFoot = node "div" [ B.modalCardFoot ]


-- NAVBAR ----------------------------------------------------------------------

{-| -}
type alias Navbar msg = Html msg

{-| -}
type alias NavbarSection msg = Html msg

{-| -}
type alias NavbarItem msg = Html msg

{-| -}
type alias NavbarBurger msg = Html msg

{-| -}
type alias NavbarSide msg = Html msg

{-| -}
type alias NavbarLink msg = Html msg

{-| -}
type alias NavbarDropdown msg = Html msg

{-| -}
type alias NavbarModifiers
  = { color       : Color
    , transparent : Bool
    }

{-| -}
navbarModifiers : NavbarModifiers
navbarModifiers
  = { color       = Default
    , transparent = False
    }

{-|
    myNavbarBurger : Html Msg
    myNavbarBurger 
      = navbarBurger isMenuOpen []
        [ span [] []
        , span [] []
        , span [] []
        ]
        
    myNavbarLink : Html Msg
    myNavbarLink 
      = navbarLink [] 
        [ text "More Junk" 
        ]
        
    myNavbar : Bool -> Bool -> Html Msg
    myNavbar isMenuOpen isMenuDropdownOpen
      = navbar navbarModifiers []
        [ navbarBrand [] myNavbarBurger
          [ navbarItem False []
            [ img [ src "https://B.io/images/bulma-logo.png" ] []
            ]
          ]
        , navbarMenu isMenuOpen []
          [ navbarStart [] 
            [ navbarItemLink False [] [ text "Home"  ]
            , navbarItemLink False [] [ text "Blog"    ]
            , navbarItemLink True  [] [ text "Carrots" ]
            , navbarItemLink False [] [ text "About"   ]
            ]
          , navbarEnd [] 
            [ navbarItemDropdown isMenuDropdownOpen Down [] myNavbarLink
              [ navbarDropdown False Left [] 
                [ navbarItemLink False [] [ text "Crud"     ]
                , navbarItemLink False [] [ text "Detritus" ]
                , navbarItemLink True  [] [ text "Refuse"   ]
                , navbarItemLink False [] [ text "Trash"    ]
                ]
              ]
            ]
          ]
        ]
-}
navbar : NavbarModifiers -> List (Attribute msg) -> List (NavbarSection msg) -> Navbar msg
navbar {color,transparent}
  = node "nav"
    [ B.navbar
    , case transparent of
        True -> B.isTransparent
        _    -> B.none
    , case color of
        Default -> B.none
        White   -> B.isWhite
        Light   -> B.isLight
        Dark    -> B.isDark
        Black   -> B.isBlack
        Primary -> B.isPrimary
        Link    -> B.isLink
        Info    -> B.isInfo
        Success -> B.isSuccess
        Warning -> B.isWarning
        Danger  -> B.isDanger
    ]

{-| A sticky variant of `navbar`.
Remember to change your root `<html>` tag to `<html class="has-navbar-fixed-top">` or `<html class="has-navbar-fixed-bottom">`.
-}
fixedNavbar : VerticalAlignment -> NavbarModifiers -> List (Attribute msg) -> List (NavbarSection msg) -> Navbar msg
fixedNavbar dir mods
  = navbar mods
    << (::)
      ( case dir of
          Top    -> class "is-fixed-top"
          Bottom -> class "is-fixed-bottom"
      )

-- {-| TODO 
-- -}
-- fixedNavbarContainer : VerticalAlignment -> List (Attribute msg) -> List (Html msg) -> Navbar msg
-- fixedNavbarContainer dir attrs
--   = div
--     <| (::)
--       ( case dir of
--           Top    -> class "has-navbar-fixed-top"
--           Bottom -> class "has-navbar-fixed-bottom"
--       )
--     <| attrs

-- TODO: easyNavbar

{-| This is a child of `navbar`, and a sibling to `navbarBrand`.
This element stays to the left side of the `navbar`.
This section is always visible, so try not to place too many links in here -- they'll overflow past the right side of the screen on mobile devices.
-}
navbarBrand : List (Attribute msg) -> NavbarBurger msg -> List (NavbarItem msg) -> NavbarSection msg
navbarBrand attrs burger items
  = div ( class "navbar-brand" :: attrs )
    <| items ++ [ burger ]

{-| This is a little hamburger menu icon that only appears on mobile devices, when placed in a `navbarBrand`.
Place empty `span` elements inside to add/subtract numbers of lines.
When its first argument is `True`, it transforms into a `navbarCross`.

    myNavbarBurger : Bool -> Html Msg
    myNavbarBurger isMenuOpen
      = navbarBurger isMenuOpen []
        [ span [] []
        , span [] []
        , span [] []
        ]

-}
navbarBurger : IsActive -> List (Attribute msg) -> List (Html msg) -> NavbarBurger msg
navbarBurger isActive = node "a" [ B.navbarBurger, if isActive then B.isActive else B.none ]

{-| A simple "X" character; the active version of `navbarBurger`.
-}
navbarCross : List (Attribute msg) -> NavbarBurger msg
navbarCross attrs = navbarBurger True attrs []

{-| This is a child of `navbar`, and a sibling to `navbarBrand`.
On small screens, passing `True` to `navbarMenu` will show the mobile-device menu.
Its third argument should be `[ navbarStart [] [], navbarEnd [] [] ]`.
-}
navbarMenu : IsActive -> List (Attribute msg) -> List (NavbarSide msg) -> NavbarSection msg
navbarMenu isActive attrs
  = node "div" [ B.navbarMenu, if isActive then B.isActive else B.none ] attrs

{-| This element is a child of `navbarMenu`.
On normal screens, this section will appear on the left of the `navbar`.
-}
navbarStart : List (Attribute msg) -> List (NavbarItem msg) -> NavbarSide msg
navbarStart = node "div" [ B.navbarStart ]

{-| This element is a child of `navbarMenu`.
On normal screens, this section will appear on the left of the `navbar`.
-}
navbarEnd : List (Attribute msg) -> List (NavbarItem msg) -> NavbarSide msg
navbarEnd = node "div" [ B.navbarEnd ]

{-| This is a synonym for `div.navbar-item`.
You can use this element in `navbarStart`, `navbarEnd`, `navbarBrand`, and `navbarDropdown`.
-}
navbarItem : IsActive -> List (Attribute msg) -> List (Html msg) -> NavbarItem msg
navbarItem isActive = node "div" [ B.navbarItem, if isActive then B.isActive else B.none ]

{-| This is a synonym for `a.navbar-item`.
You can use this element in `navbarStart`, `navbarEnd`, `navbarBrand`, and `navbarDropdown`.
When the first argument is `True`, the link will be highlighted.
-}
navbarItemLink : IsActive -> List (Attribute msg) -> List (Html msg) -> NavbarItem msg
navbarItemLink isActive = node "a" [ B.navbarItem, if isActive then B.isActive else B.none ]

{-| This is a dropdown item that expects `navbarLink` and `navbarDropdown` tags.
When the first argument is `True` the menu contents will be visible.
The second argument determines which way its child dropdown opens vertically.
You can use this element in `navbarStart`, `navbarEnd`, `navbarBrand`, and `navbarDropdown`.
-}
navbarItemDropdown : IsActive -> VerticalDirection -> List (Attribute msg) -> NavbarLink msg -> List (NavbarDropdown msg) -> NavbarItem msg
navbarItemDropdown isActive dir attrs link dropdowns
  = node "div"
    [ B.navbarItem
    , B.hasDropdown
    , case dir of
        Up -> B.hasDropdownUp
        _  -> B.none
    , case isActive of
        True -> B.isActive
        _    -> B.none
    ]
    attrs
    <| link
   :: dropdowns

{-| A hoverable variant of `navbarItemDropdown`.
-}
hoverableNavbarItemDropdown : VerticalDirection -> List (Attribute msg) -> NavbarLink msg -> List (NavbarDropdown msg) -> NavbarItem msg
hoverableNavbarItemDropdown dir attrs link dropdowns
  = node "div"
    [ B.navbarItem
    , B.hasDropdown
    , B.isHoverable
    , case dir of
        Up -> B.hasDropdownUp
        _  -> B.none
    ]
    attrs
    <| link
   :: dropdowns

{-| This element represents `a.navbar-link`. It is only useful as a child of `navbarDropdown`.
-}
navbarLink : List (Attribute msg) -> List (Html msg) -> NavbarLink msg
navbarLink = node "a" [ B.navbarLink ]

{-| -}
type alias IsBoxed = Bool

{-| This is a `div.navbar-dropdown` element.
It is intended to be a child of `navbarItemDropdown`.
When its first argument is `True`, it will add a border on the top of the menu. This is most useful when you're using a transparent menu.
Its second argument determines which side of the button the menu aligns with.
-}
navbarDropdown : IsBoxed -> HorizontalAlignment -> List (Attribute msg) -> List (NavbarItem msg) -> NavbarDropdown msg
navbarDropdown isBoxed alignment
  = node "div"
    [ B.navbarDropdown
    , case isBoxed of
        True -> B.isBoxed
        _    -> B.none
    , case alignment of
        Right -> B.isRight
        _     -> B.none
    ]

{-| A tiny 'lil `hr.navbar-divider`.
-}
navbarDivider : List (Attribute msg) -> List (Html msg) -> NavbarItem msg
navbarDivider = node "hr" [ B.navbarDivider ]
   
-- MODIFIERS --

{-| -}
type alias IsActive = Bool


-- PAGINATION ------------------------------------------------------------------

{-| -}
type alias Pagination msg = Html msg

{-| 
    myPagination : Html msg
    myPagination
      = pagination Left []
        [ paginationPrev [] [ text "Previous" ]
        , paginationNext [] [ text "Next"     ]
        , paginationList []
          [ paginationLink False [] [ text "1"  ]
          , paginationEllipsis   [] [           ]
          , paginationLink False [] [ text "45" ]
          , paginationLink True  [] [ text "46" ]
          , paginationLink False [] [ text "47" ]
          , paginationEllipsis   [] [           ]
          , paginationLink False [] [ text "83" ]
          ]
-}
pagination : HorizontalAlignment -> List (Attribute msg) -> List (PaginationPartition msg) -> Pagination msg
pagination alignment
  = node "div"
    [ B.pagination
    , case alignment of
        Left     -> B.none
        Centered -> B.isCentered
        Right    -> B.isRight
    ]

{-| A rounded variant of `pagination`.
-}
roundedPagination : HorizontalAlignment -> List (Attribute msg) -> List (PaginationPartition msg) -> Pagination msg
roundedPagination alignment = pagination alignment << (::) (class "is-rounded")


-- PAGINATION PARTITIONS --

{-| -}
type alias PaginationPartition msg = Html msg

{-| -}
paginationPrev : List (Attribute msg) -> List (Html msg) -> PaginationPartition msg
paginationPrev = node "a" [ B.paginationPrevious ]

{-| -}
easyPaginationPrev : List (Attribute msg) -> msg -> String -> PaginationPartition msg
easyPaginationPrev attrs msg
  = text >> ls >> paginationPrev (onClick msg :: attrs)

{-| -}
paginationNext : List (Attribute msg) -> List (Html msg) -> PaginationPartition msg
paginationNext = node "a" [ B.paginationNext ]

{-| -}
easyPaginationNext : List (Attribute msg) -> msg -> String -> PaginationPartition msg
easyPaginationNext attrs msg
  = text >> ls >> paginationNext (onClick msg :: attrs)

{-| -}
paginationList : List (Attribute msg) -> List (PaginationListItem msg) -> PaginationPartition msg
paginationList attrs
  = List.map (ls >> li []) >> node "ul" [ B.paginationList ] attrs

-- TODO: easyPaginationList


-- PAGINATION LIST ITEMS --

{-| -}
type alias PaginationListItem msg = Html msg

{-| -}
type alias IsCurrent = Bool

{-| -}
paginationLink : IsCurrent -> List (Attribute msg) -> List (Html msg) -> PaginationListItem msg
paginationLink current
  = node "a"
    [ B.paginationLink
    , case current of
        True  -> B.isCurrent
        False -> B.none
    ]

{-| -}
easyPaginationLink : IsCurrent -> List (Attribute msg) -> msg -> Int -> PaginationListItem msg
easyPaginationLink current attrs msg
  = String.fromInt >> text >> ls >> paginationLink current (onClick msg :: attrs)

{-| -}
paginationEllipsis : List (Attribute msg) -> List (Html msg) -> PaginationListItem msg
paginationEllipsis = node "span" [ B.paginationEllipsis ]

{-| -}
easyPaginationEllipsis : List (Attribute msg) -> PaginationListItem msg
easyPaginationEllipsis attrs = paginationEllipsis attrs [ text "…" ]


-- PANEL -----------------------------------------------------------------------

{-| -}
type alias Panel msg = Html msg

{-| 
    myPanel : Html msg
    myPanel
      = panel [] 
        [ panelHeading [] [ text "Repositories" ] 
        , panelBlock False []
          [ controlInput controlInputModifiers [] [] []
          ] 
        , panelTabs []
          [ panelTab False [] [ text "all"     ]
          , panelTab True  [] [ text "public"  ]
          , panelTab True  [] [ text "private" ]
          ]
        , panelLink False [] [ text "bulma"     ]
        , panelLink False [] [ text "marksheet" ]
        , panelLink True  [] [ text "test"      ]
        , panelLink False [] [ text "horsin"    ]
        ]

-}
panel : List (Attribute msg) -> List (PanelPartition msg) -> Panel msg
panel = node "div" [ B.panel ]

-- TODO: easyPanel


-- PANEL PARTITIONS --

{-| -}
type alias PanelPartition msg = Html msg

{-| -}
panelHeading : List (Attribute msg)  -> List (Html msg) -> PanelPartition msg
panelHeading = node "p" [ B.panelHeading ]

{-| -}
panelTabs : List (Attribute msg) -> List (PanelTab msg) -> PanelPartition msg
panelTabs = node "p" [ B.panelTabs ]

{-| -}
panelBlock : IsActive -> List (Attribute msg) -> List (Html msg) -> PanelPartition msg
panelBlock active
  = node "div"
    [ B.panelBlock
    , case active of
        True  -> B.isActive
        False -> B.none
    ]

{-| -}
panelLink : IsActive -> List (Attribute msg) -> List (Html msg) -> PanelPartition msg
panelLink active
  = node "a"
    [ B.panelBlock
    , case active of
        True  -> B.isActive
        False -> B.none
    ]

{-| 
    myPanelBlockAttrs : List (Attribute msg)
    myPanelBlockAttrs = []

    myPanelIconAttrs : List (Attribute msg)
    myPanelIconAttrs = []

    myPanelLink : Html msg
    myPanelLink 
      = panelLinkWithIcon False 
        myPanelBlockAttrs 
        myPanelIconAttrs
        [ B.Elements.Icon.book ]
        [ text "github.com/evancz" ]
-}
panelLinkWithIcon : IsActive -> List (Attribute msg) -> List (Attribute msg) -> List (IconBody msg) -> List (Html msg) -> PanelPartition msg
panelLinkWithIcon active attrs attrs_ iconBodies htmls
  = a ( ( case active of
            True  -> class "panel-block is-active"
            False -> class "panel-block "
        )
     :: attrs
      )
    <| span (class "panel-icon" :: attrs_) iconBodies
   :: htmls 
    

-- easyPanelLink : IsActive -> List (Attribute msg) -> msg -> Icon msg -> String -> PanelPartition msg
-- easyPanelLink active attrs msg icon str
--   = panelBlockLink active (onClick msg :: attrs) [ panelLinkIcon icon ]

-- TODO: panelLinkIcon : (List (Attribute msg) -> List (Html msg) -> Icon msg) -> List (Attribute msg) -> List (Html msg) -> Icon msg

{-| -}
panelLabel : IsActive -> List (Attribute msg) -> List (Html msg) -> PanelPartition msg
panelLabel active
  = node "label"
    [ B.panelBlock
    , case active of
        True  -> B.isActive
        False -> B.none
    ]

{-| 
    myPanelBlockAttrs : List (Attribute msg)
    myPanelBlockAttrs = []

    myPanelCheckboxInputAttrs : List (Attribute msg)
    myPanelCheckboxInputAttrs = [ onClick ToggleThing ]

    myPanelLink : Html msg
    myPanelLink 
      = panelLinkWithIcon False 
        myPanelBlockAttrs 
        myPanelCheckboxInputAttrs
        [ text "Remember Me" ]
-}
panelCheckbox : IsActive -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> PanelPartition msg
panelCheckbox active attrs attrs_ htmls
  = a ( ( case active of
            True  -> class "panel-block is-active"
            False -> class "panel-block "
        )
     :: attrs
      )
    <| input (type_ "checkbox" :: attrs_) []
   :: htmls

-- TODO: easyPanelRadio


-- PANEL TABS --

{-| -}
type alias PanelTab msg = Html msg

{-| -}
panelTab : IsActive -> List (Attribute msg) -> List (Html msg) -> PanelTab msg
panelTab active
  = node "a"
    [ case active of
        True  -> B.isActive
        False -> B.none
    ]


-- TABS ------------------------------------------------------------------------

{-| -}
type alias Tabs msg = Html msg

{-| -}
type TabsStyle = Minimal
               | Boxed
               | Toggle
               | Round

{-| -}
type alias TabsModifiers = { style     : TabsStyle
                           , alignment : HorizontalAlignment
                           , size      : Size
                           }

{-| -}
tabsModifiers : TabsModifiers
tabsModifiers = { style     = Minimal
                , alignment = Left
                , size      = Standard
                }

{-| 
    myTabs : Html msg
    myTabs
      = tabs myTabsModifiers [] []
        [ tab False [] [] [ text "Pictures" ]
        , tab False [] [] [ text "Music"    ]
        , tab True  [] [] [ text "Videos"   ]
        , tab False [] [] [ text "Docs"     ]
        ]
-}
tabs : TabsModifiers -> List (Attribute msg) -> List (Attribute msg) -> List (Tab msg) -> Tabs msg
tabs {style,alignment,size} attrs attrs_
  = node "div"
    [ B.tabs
    , case style of
        Toggle  -> B.isToggle
        Round   -> B.isToggle
        _       -> B.none
    , case style of
        Boxed   -> B.isBoxed
        _       -> B.none
    , case style of
        Round   -> B.isToggleRounded
        _       -> B.none
    , case alignment of
        Left     -> B.none
        Centered -> B.isCentered
        Right    -> B.isRight
    , case size of
        Small    -> B.isSmall
        Standard -> B.none
        Medium   -> B.isMedium
        Large    -> B.isLarge
    ]
    attrs
  << ls
  << ul attrs_

-- TAB --

{-| -}
type alias Tab msg = Html msg

{-| -}
tab : IsActive -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Tab msg
tab active attrs attrs_ htmls
  = li ( (::)
         ( case active of
          True  -> B.isActive
          False -> B.none
         )
         attrs
       )
    [ a attrs_ htmls
    ]



