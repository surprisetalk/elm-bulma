
module Bulma.Components exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
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

## Dropdown Trigger
@docs DropdownContent
@docs dropdownTrigger

## Dropdown Menu
@docs DropdownContent
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

## Navbar Brand
@docs NavbarSection, navbarBrand

### Navbar Burger
@docs NavbarBurger
@docs navbarBurger, navbarCross

## Navbar Menu
@docs NavbarSection, navbarMenu

@docs NavbarSide, navbarStart, navbarEnd

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
@docs PanelPartition, IsActive
@docs panelHeading
@docs panelBlock, panelLabel, panelLink, panelLinkWithIcon, panelCheckbox
@docs panelTabs

### Panel Tab
@docs PanelTab, IsActive
@docs panelTab

# Tabs
@docs Tabs, TabsModifiers, TabsStyle, tabsModifiers
@docs tabs

## Tab
@docs Tab, IsActive
@docs tab
-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers exposing ( Color(..), Size(..), HorizontalAlignment(..), VerticalAlignment(..), VerticalDirection(..) )

import Bulma.Elements exposing ( Image, easyDelete, Button, ButtonModifiers, button ) 
import Bulma.Elements.Icon exposing ( Icon, IconBody ) 

import Html exposing ( Html, text, div, p, a, ul, li, span, input )
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
breadcrumb : BreadcrumbModifiers -> Attrs msg -> Attrs msg -> List (Crumblet msg) -> Breadcrumb msg
breadcrumb {separator,alignment,size} attrs attrs_
  = node "nav" [ attribute "aria-label" "breadcrumb" ]
    [ "breadcrumb"
    , case separator of
        Slash    -> ""
        Arrow    -> "has-arrow-separator"
        Bullet   -> "has-bullet-separator"
        Dot      -> "has-dot-separator"
        Succeeds -> "has-succeeds-separator"
    , case size of
        Small  -> "is-small"
        Standard -> ""
        Medium -> "is-medium"
        Large  -> "is-large"
    , case alignment of
        Left     -> ""
        Centered -> "is-centered"
        Right    -> "is-right"
    ]
    attrs
    << ls
      << ul attrs_

{-| -}
type alias Crumblet msg = Html msg

{-| A convenience element for `breadcrumb`.
The first attribute list applies to the outer `li` tag. The second attribute list applies to the inner `a` tag.
-}
crumblet : IsActive -> Attrs msg -> Attrs msg -> Htmls msg -> Crumblet msg
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
card : Attrs msg -> List (CardPartition msg) -> Card msg
card = node "div" [] [ bulma.card.container ]


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
cardHeader : Attrs msg -> Htmls msg -> CardPartition msg
cardHeader = node "header" [] [ bulma.card.header.container ]

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
easyCardHeader : Attrs msg -> { title : Htmls msg, icon : Htmls msg, onClickIcon : msg } -> CardPartition msg
easyCardHeader attrs {title,icon,onClickIcon}
  = cardHeader attrs
    [ cardTitle    [                     ] title
    , cardIconLink [ onClick onClickIcon ] icon
    ]
  
{-| -}
easierCardHeader : Attrs msg -> { title : String, icon : Icon msg, onClickIcon : msg } -> CardPartition msg
easierCardHeader attrs {title,icon,onClickIcon}
  = cardHeader attrs
    [ easyCardTitle    []             title
    , easyCardIconLink [] onClickIcon icon
    ]

{-| -}
type alias CardHeaderItem msg = Html msg

{-| -}
cardTitle : Attrs msg -> Htmls msg -> CardHeaderItem msg
cardTitle = node "p" [] [ bulma.card.header.title ]

{-| -}
easyCardTitle : Attrs msg -> String -> CardHeaderItem msg
easyCardTitle attrs = text >> ls >> cardTitle attrs

{-| -}
cardIcon : Attrs msg -> List (Icon msg) -> CardHeaderItem msg
cardIcon = node "p" [] [ bulma.card.header.icon ]

{-| -}
cardIconLink : Attrs msg -> List (Icon msg) -> CardHeaderItem msg
cardIconLink = node "a" [] [ bulma.card.header.icon ]

{-| -}
easyCardIconLink : Attrs msg -> msg -> Icon msg -> CardHeaderItem msg
easyCardIconLink attrs msg
  = cardIcon (onClick msg :: attrs) << ls

{-| 
    import Bulma.Elements exposing (image,imageModifiers)

    myImage : Html msg
    myImage
      = image imageModifiers []
        [ img [ src "http://i.imgur.com/LcvP04R.gif" ] []
        ]

    myCardImage : Html msg
    myCardImage
      = cardImage [] [ myImage ]
-}
cardImage : Attrs msg -> List (Image msg) -> CardPartition msg
cardImage = node "div" [] [ bulma.card.image ]

{-| -}
cardContent : Attrs msg -> Htmls msg -> CardPartition msg
cardContent = node "div" [] [ bulma.card.content ]

{-| 
    myCardFooter : Html msg
    myCardFooter
      = cardFooter []
        [ cardFooterItemLink [] [ text "Save"   ]
        , cardFooterItemLink [] [ text "Edit"   ]
        , cardFooterItemLink [] [ text "Delete" ]
        ]
-}
cardFooter : Attrs msg -> List (CardFooterItem msg) -> CardPartition msg
cardFooter = node "footer" [] [ bulma.card.footer.container ]

{-| -}
type alias CardFooterItem msg = Html msg

{-| -}
cardFooterItem : Attrs msg -> Htmls msg -> CardFooterItem msg
cardFooterItem = node "p" [] [ bulma.card.footer.item ]

{-| -}
cardFooterItemLink : Attrs msg -> Htmls msg -> CardFooterItem msg
cardFooterItemLink = node "a" [] [ bulma.card.footer.item ]


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
dropdown : IsActive -> DropdownModifiers -> Attrs msg -> List (DropdownContent msg) -> Dropdown msg
dropdown isActive {horizontalAlignment,verticalDirection}
  = node "div" []
    [ "dropdown"
    , case isActive of
        True  -> "is-active"
        _     -> ""
    , case horizontalAlignment of
        Right    -> "is-right"
        _        -> ""
    , case verticalDirection of
        Up -> "is-up"
        _  -> ""
    ]

{-| A hoverable variant of `dropdown`.
-}
hoverableDropdown : DropdownModifiers -> Attrs msg -> List (DropdownContent msg) -> Dropdown msg
hoverableDropdown {horizontalAlignment,verticalDirection}
  = node "div" []
    [ "dropdown"
    , "is-hoverable"
    , case horizontalAlignment of
        Right -> "is-right"
        _     -> ""
    , case verticalDirection of
        Up -> "is-up"
        _  -> ""
    ]

{-| The container for the button/link that activates the dropdown menu.
-}
dropdownTrigger : Attrs msg -> List (Button msg) -> DropdownContent msg
dropdownTrigger = node "div" [] [ "dropdown-trigger" ]

-- {-| TODO 
-- -}
-- dropdownTriggerButton : ButtonModifiers msg -> Attrs msg -> List (Html msg) -> Button msg
-- dropdownTriggerButton mods 
--   = button mods
--     << (++)
--       [ attribute "aria-haspopup" "true"
--       , attribute "aria-controls" "dropdown-menu"
--       ]

{-| The container for the dropdown's items.
The first attributes list is for the outer `div.dropdown-menu`. The inner list is for the `dropdown-content`.
-}
dropdownMenu : Attrs msg -> Attrs msg -> List (DropdownItem msg) -> DropdownContent msg
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
dropdownItemLink : IsActive -> Attrs msg -> List (Html msg) -> DropdownItem msg
dropdownItemLink isActive = node "a" [] [ "dropdown-item", if isActive then "is-active" else "" ]

{-| A synonym for `div.dropdown-item.is-active`.
-}
dropdownItem : IsActive -> Attrs msg -> List (Html msg) -> DropdownItem msg
dropdownItem isActive = node "div" [] [ "dropdown-item", if isActive then "is-active" else "" ]

{-| An empty `hr.dropdown-divider` element.
-}
dropdownDivider : Attrs msg -> List (Html msg) -> DropdownItem msg
dropdownDivider = node "hr" [] [ "dropdown-divider" ]


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
menu : Attrs msg -> List (MenuPart msg) -> Menu msg
menu = node "aside" [] [ bulma.menu.container ]


-- MENU ITEMS --

{-| -}
type alias MenuPart msg = Html msg

{-| -}
menuLabel : Attrs msg -> Htmls msg -> MenuPart msg
menuLabel = node "p" [] [ bulma.menu.label ]

{-| -}
menuList : Attrs msg -> List (MenuListItem msg) -> MenuPart msg
menuList = node "ul" [] [ bulma.menu.list ]


-- MENU LIST ITEMS --

{-| -}
type alias MenuListItem msg = Html msg

{-| -}
menuListItem : Attrs msg -> Htmls msg -> MenuListItem msg
menuListItem = li

{-| -}
menuListItemLink : IsActive -> Attrs msg -> Htmls msg -> MenuListItem msg
menuListItemLink active = a << (::) (class (if active then "is-active" else ""))
-- KLUDGE

{-| -}
easyMenuListItemLink : IsActive -> Attrs msg -> msg -> Icon msg -> String -> MenuListItem msg
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
message : MessageModifiers -> Attrs msg -> List (MessagePartition msg) -> Message msg
message {color,size}
  = node "article" []
    [ bulma.message.container
    , case color of
        Default -> ""
        White   -> bulma.message.color.isWhite
        Light   -> bulma.message.color.isLight
        Dark    -> bulma.message.color.isDark
        Black   -> bulma.message.color.isBlack
        Primary -> bulma.message.color.isPrimary
        Link    -> "is-link"
        Info    -> bulma.message.color.isInfo
        Success -> bulma.message.color.isSuccess
        Warning -> bulma.message.color.isWarning
        Danger  -> bulma.message.color.isDanger
    , case size of
        Small  -> "is-small"
        Standard -> ""
        Medium -> "is-medium"
        Large  -> "is-large"
        -- KLUDGE: add to BulmaClasses
    ]


-- MESSAGE PARTITONS --

{-| -}
type alias MessagePartition msg = Html msg

{-| -}
messageHeader : Attrs msg -> Htmls msg -> MessagePartition msg
messageHeader = node "div" [] [ bulma.message.header ]

{-| -}
messageHeaderWithDelete : Attrs msg -> msg -> Htmls msg -> MessagePartition msg
messageHeaderWithDelete attrs msg
  = node "div" [] [ bulma.message.header ] attrs
  << flip (++) [ easyDelete [] msg ]

{-| -}
messageBody : Attrs msg -> Htmls msg -> MessagePartition msg
messageBody = node "div" [] [ bulma.message.body ]


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
modal : IsModalOpen -> Attrs msg -> List (ModalPartition msg) -> Modal msg
modal active
  = node "div" []
    [ bulma.modal.container
    , case active of
        True  -> bulma.modal.state.isActive
        False -> ""
    ]

{-| 
    type Msg = CloseModal

    myModal : Html Msg
    myModal
      = easyModal True [] CloseModal
        [ text "Your content goes here."
        ]
-}
easyModal : IsModalOpen -> Attrs msg -> msg -> Htmls msg -> Modal msg
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
modalBackground : Attrs msg -> Htmls msg -> ModalPartition msg
modalBackground = node "div" [] [ bulma.modal.background ]

{-| -}
easyModalBackground : Attrs msg -> msg -> ModalPartition msg
easyModalBackground attrs onClickBackground
  = modalBackground (onClick onClickBackground :: attrs) []

{-| -}
modalContent : Attrs msg -> Htmls msg -> ModalPartition msg
modalContent = node "div" [] [ bulma.modal.content ]

{-| -}
modalClose : Size -> Attrs msg -> Htmls msg -> ModalPartition msg
modalClose size
  = node "button" []
    [ bulma.modal.close.ui
    , case size of
        Small  -> bulma.modal.close.size.isSmall
        Standard -> ""
        Medium -> bulma.modal.close.size.isMedium
        Large  -> bulma.modal.close.size.isLarge
    ]

{-| -}
easyModalClose : Size -> Attrs msg -> msg -> ModalPartition msg
easyModalClose size attrs onClickModal
  = modalClose size (onClick onClickModal :: attrs) []

{-| -}
modalCard : Attrs msg -> List (ModalCardPartition msg) -> ModalPartition msg
modalCard = node "div" [] [ bulma.modal.card.container ]


-- MODAL CARD PARTITIONS --

{-| -}
type alias ModalCardPartition msg = Html msg

{-| -}
modalCardHead : Attrs msg -> Htmls msg -> ModalCardPartition msg
modalCardHead = node "div" [] [ bulma.modal.card.head ]

{-| -}
modalCardTitle : Attrs msg -> Htmls msg -> Html msg
modalCardTitle = node "div" [] [ bulma.modal.card.title ]

{-| -}
modalCardBody : Attrs msg -> Htmls msg -> ModalCardPartition msg
modalCardBody = node "div" [] [ bulma.modal.card.body ]

{-| -}
modalCardFoot : Attrs msg -> Htmls msg -> ModalCardPartition msg
modalCardFoot = node "div" [] [ bulma.modal.card.foot ]


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
            [ img [ src "https://bulma.io/images/bulma-logo.png" ] []
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
navbar : NavbarModifiers -> Attrs msg -> List (NavbarSection msg) -> Navbar msg
navbar {color,transparent}
  = node "nav" []
    [ "navbar"
    , case transparent of
        True -> "is-transparent"
        _    -> ""
    , case color of
        Default -> ""
        White   -> "is-white"
        Light   -> "is-light"
        Dark    -> "is-dark"
        Black   -> "is-black"
        Primary -> "is-primary"
        Link    -> "is-link"
        Info    -> "is-info"
        Success -> "is-success"
        Warning -> "is-warning"
        Danger  -> "is-danger"
    ]

{-| A sticky variant of `navbar`.
Remember to change your root `<html>` tag to `<html class="has-navbar-fixed-top">` or `<html class="has-navbar-fixed-bottom">`.
-}
fixedNavbar : VerticalAlignment -> NavbarModifiers -> Attrs msg -> List (NavbarSection msg) -> Navbar msg
fixedNavbar dir mods
  = navbar mods
    << (::)
      ( case dir of
          Top    -> class "is-fixed-top"
          Bottom -> class "is-fixed-bottom"
      )

-- {-| TODO 
-- -}
-- fixedNavbarContainer : VerticalAlignment -> Attrs msg -> List (Html msg) -> Navbar msg
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
navbarBrand : Attrs msg -> NavbarBurger msg -> List (NavbarItem msg) -> NavbarSection msg
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
navbarBurger : IsActive -> Attrs msg -> List (Html msg) -> NavbarBurger msg
navbarBurger isActive = node "a" [] [ "navbar-burger", if isActive then "is-active" else ""  ]

{-| A simple "X" character; the active version of `navbarBurger`.
-}
navbarCross : Attrs msg -> NavbarBurger msg
navbarCross attrs = navbarBurger True attrs []

{-| This is a child of `navbar`, and a sibling to `navbarBrand`.
On small screens, passing `True` to `navbarMenu` will show the mobile-device menu.
Its third argument should be `[ navbarStart [] [], navbarEnd [] [] ]`.
-}
navbarMenu : IsActive -> Attrs msg -> List (NavbarSide msg) -> NavbarSection msg
navbarMenu isActive attrs
  = node "div" [] [ "navbar-menu", if isActive then "is-active" else "" ] attrs

{-| This element is a child of `navbarMenu`.
On normal screens, this section will appear on the left of the `navbar`.
-}
navbarStart : Attrs msg -> List (NavbarItem msg) -> NavbarSide msg
navbarStart = node "div" [] [ "navbar-start" ]

{-| This element is a child of `navbarMenu`.
On normal screens, this section will appear on the left of the `navbar`.
-}
navbarEnd : Attrs msg -> List (NavbarItem msg) -> NavbarSide msg
navbarEnd = node "div" [] [ "navbar-end" ]

{-| This is a synonym for `div.navbar-item`.
You can use this element in `navbarStart`, `navbarEnd`, `navbarBrand`, and `navbarDropdown`.
-}
navbarItem : IsActive -> Attrs msg -> List (Html msg) -> NavbarItem msg
navbarItem isActive = node "div" [] [ "navbar-item", if isActive then "is-active" else "" ]

{-| This is a synonym for `a.navbar-item`.
You can use this element in `navbarStart`, `navbarEnd`, `navbarBrand`, and `navbarDropdown`.
When the first argument is `True`, the link will be highlighted.
-}
navbarItemLink : IsActive -> Attrs msg -> List (Html msg) -> NavbarItem msg
navbarItemLink isActive = node "a" [] [ "navbar-item", if isActive then "is-active" else "" ]

{-| This is a dropdown item that expects `navbarLink` and `navbarDropdown` tags.
When the first argument is `True` the menu contents will be visible.
The second argument determines which way its child dropdown opens vertically.
You can use this element in `navbarStart`, `navbarEnd`, `navbarBrand`, and `navbarDropdown`.
-}
navbarItemDropdown : IsActive -> VerticalDirection -> Attrs msg -> NavbarLink msg -> List (NavbarDropdown msg) -> NavbarItem msg
navbarItemDropdown isActive dir attrs link dropdowns
  = node "div" []
    [ "navbar-item"
    , case isActive of
        True -> "is-active"
        _    -> ""
    , case dir of
        Up -> "has-dropdown has-dropdown-up"
        _  -> "has-dropdown"
    ]
    attrs
    <| link
   :: dropdowns

{-| A hoverable variant of `navbarItemDropdown`.
-}
hoverableNavbarItemDropdown : VerticalDirection -> Attrs msg -> NavbarLink msg -> List (NavbarDropdown msg) -> NavbarItem msg
hoverableNavbarItemDropdown dir attrs link dropdowns
  = node "div" []
    [ "navbar-item"
    , "is-hoverable"
    , case dir of
        Up -> "has-dropdown has-dropdown-up"
        _  -> "has-dropdown"
    ]
    attrs
    <| link
   :: dropdowns

{-| This element represents `a.navbar-link`. It is only useful as a child of `navbarDropdown`.
-}
navbarLink : Attrs msg -> List (Html msg) -> NavbarLink msg
navbarLink = node "a" [] [ "navbar-link" ]

{-| -}
type alias IsBoxed = Bool

{-| This is a `div.navbar-dropdown` element.
It is intended to be a child of `navbarItemDropdown`.
When its first argument is `True`, it will add a border on the top of the menu. This is most useful when you're using a transparent menu.
Its second argument determines which side of the button the menu aligns with.
-}
navbarDropdown : IsBoxed -> HorizontalAlignment -> Attrs msg -> List (NavbarItem msg) -> NavbarDropdown msg
navbarDropdown isBoxed alignment
  = node "div" []
    [ "navbar-dropdown"
    , case isBoxed of
        True -> "is-boxed"
        _    -> ""
    , case alignment of
        Right -> "is-right"
        _     -> ""
    ]

{-| A tiny 'lil `hr.navbar-divider`.
-}
navbarDivider : Attrs msg -> List (Html msg) -> NavbarItem msg
navbarDivider = node "hr" [] [ "navbar-divider" ]
   
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
pagination : HorizontalAlignment -> Attrs msg -> List (PaginationPartition msg) -> Pagination msg
pagination alignment
  = node "div" []
    [ bulma.pagination.container
    , case alignment of
        Left     -> ""
        Centered -> bulma.pagination.position.isCentered
        Right    -> bulma.pagination.position.isRight
    ]

{-| A rounded variant of `pagination`.
-}
roundedPagination : HorizontalAlignment -> Attrs msg -> List (PaginationPartition msg) -> Pagination msg
roundedPagination alignment = pagination alignment << (::) (class "is-rounded")


-- PAGINATION PARTITIONS --

{-| -}
type alias PaginationPartition msg = Html msg

{-| -}
paginationPrev : Attrs msg -> Htmls msg -> PaginationPartition msg
paginationPrev = node "a" [] [ bulma.pagination.previous ]

{-| -}
easyPaginationPrev : Attrs msg -> msg -> String -> PaginationPartition msg
easyPaginationPrev attrs msg
  = text >> ls >> paginationPrev (onClick msg :: attrs)

{-| -}
paginationNext : Attrs msg -> Htmls msg -> PaginationPartition msg
paginationNext = node "a" [] [ bulma.pagination.next ]

{-| -}
easyPaginationNext : Attrs msg -> msg -> String -> PaginationPartition msg
easyPaginationNext attrs msg
  = text >> ls >> paginationNext (onClick msg :: attrs)

{-| -}
paginationList : Attrs msg -> List (PaginationListItem msg) -> PaginationPartition msg
paginationList attrs
  = List.map (ls >> li []) >> node "ul" [] [ bulma.pagination.list.container ] attrs

-- TODO: easyPaginationList


-- PAGINATION LIST ITEMS --

{-| -}
type alias PaginationListItem msg = Html msg

{-| -}
type alias IsCurrent = Bool

{-| -}
paginationLink : IsCurrent -> Attrs msg -> Htmls msg -> PaginationListItem msg
paginationLink current
  = node "a" []
    [ bulma.pagination.list.link.ui
    , case current of
        True  -> bulma.pagination.list.link.state.isCurrent
        False -> ""
    ]

{-| -}
easyPaginationLink : IsCurrent -> Attrs msg -> msg -> Int -> PaginationListItem msg
easyPaginationLink current attrs msg
  = toString >> text >> ls >> paginationLink current (onClick msg :: attrs)

{-| -}
paginationEllipsis : Attrs msg -> Htmls msg -> PaginationListItem msg
paginationEllipsis = node "span" [] [ bulma.pagination.list.ellipsis ]

{-| -}
easyPaginationEllipsis : Attrs msg -> PaginationListItem msg
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
panel : Attrs msg -> List (PanelPartition msg) -> Panel msg
panel = node "div" [] [ bulma.panel.container ]

-- TODO: easyPanel


-- PANEL PARTITIONS --

{-| -}
type alias PanelPartition msg = Html msg

{-| -}
panelHeading : Attrs msg  -> Htmls msg -> PanelPartition msg
panelHeading = node "p" [] [ bulma.panel.heading ]

{-| -}
panelTabs : Attrs msg -> List (PanelTab msg) -> PanelPartition msg
panelTabs = node "p" [] [ bulma.panel.tabs.container ]

{-| -}
panelBlock : IsActive -> Attrs msg -> Htmls msg -> PanelPartition msg
panelBlock active
  = node "div" []
    [ bulma.panel.block.container
    , case active of
        True  -> bulma.panel.block.state.isActive
        False -> ""
    ]

{-| -}
panelLink : IsActive -> Attrs msg -> Htmls msg -> PanelPartition msg
panelLink active
  = node "a" []
    [ bulma.panel.block.container
    , case active of
        True  -> bulma.panel.block.state.isActive
        False -> ""
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
        [ Bulma.Elements.Icon.book ]
        [ text "github.com/evancz" ]
-}
panelLinkWithIcon : IsActive -> Attrs msg -> Attrs msg -> List (IconBody msg) -> Htmls msg -> PanelPartition msg
panelLinkWithIcon active attrs attrs_ iconBodies htmls
  = a ( ( case active of
            True  -> class "panel-block is-active"
            False -> class "panel-block "
        )
     :: attrs
      )
    <| span (class "panel-icon" :: attrs_) iconBodies
   :: htmls 
    

-- easyPanelLink : IsActive -> Attrs msg -> msg -> Icon msg -> String -> PanelPartition msg
-- easyPanelLink active attrs msg icon str
--   = panelBlockLink active (onClick msg :: attrs) [ panelLinkIcon icon ]

-- TODO: panelLinkIcon : (Attrs msg -> Htmls msg -> Icon msg) -> Attrs msg -> Htmls msg -> Icon msg

{-| -}
panelLabel : IsActive -> Attrs msg -> Htmls msg -> PanelPartition msg
panelLabel active
  = node "label" []
    [ bulma.panel.block.container
    , case active of
        True  -> bulma.panel.block.state.isActive
        False -> ""
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
panelCheckbox : IsActive -> Attrs msg -> Attrs msg -> Htmls msg -> PanelPartition msg
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
panelTab : IsActive -> Attrs msg -> Htmls msg -> PanelTab msg
panelTab active
  = node "a" []
    [ case active of
        True  -> bulma.panel.tabs.tab.state.isActive
        False -> ""
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
tabs : TabsModifiers -> Attrs msg -> Attrs msg -> List (Tab msg) -> Tabs msg
tabs {style,alignment,size} attrs attrs_
  = node "div" []
    [ "tabs"
    , case style of
        Minimal -> ""
        Boxed   -> "is-boxed"
        Toggle  -> "is-toggle"
        Round   -> "is-toggle is-toggle-rounded"
    , case alignment of
        Left     -> ""
        Centered -> bulma.tabs.alignment.isCentered
        Right    -> bulma.tabs.alignment.isRight
    , case size of
        Small  -> bulma.tabs.size.isSmall
        Standard -> ""
        Medium -> bulma.tabs.size.isMedium
        Large  -> bulma.tabs.size.isLarge
    ]
    attrs
  << ls
  << ul attrs_

-- TAB --

{-| -}
type alias Tab msg = Html msg

{-| -}
tab : IsActive -> Attrs msg -> Attrs msg -> Htmls msg -> Tab msg
tab active attrs attrs_ htmls
  = li ( (::)
         ( case active of
          True  -> class "is-active"
          False -> class ""
         )
         attrs
       )
    [ a attrs_ htmls
    ]



