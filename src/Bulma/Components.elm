
module Bulma.Components exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Table of Contents
- [Card](#card)
- [Level](#level)
- [Media](#media)
- [Menu](#menu)
- [Message](#message)
- [Modal](#modal)
- [Nav](#nav)
- [Pagination](#pagination)
- [Panel](#panel)
- [Tabs](#tabs)

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

# Level
@docs Level
@docs level, centeredLevel
@docs horizontalLevel, centeredHorizontalLevel

## Level Partition
@docs LevelPartition
@docs levelLeft, levelRight

## Level Item
@docs LevelItem
@docs levelItem, levelItemLink, levelItemText
@docs easyLevelItemWithHeading 

# Media Object
@docs Media
@docs media, largeMedia

## Media Object Partition
@docs MediaPartition 
@docs mediaContent
@docs mediaLeft, mediaRight

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
@docs menuListItem, easyMenuListItem

# Message
@docs Message
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

# Nav
@docs Nav, HasShadow
@docs nav, containedNav, easyNav, easierNav

## Nav Partiton
@docs NavPartition, IsMenuOpen
@docs navLeft, navCenter, navRight, navRightMenu

### Nav Toggle
@docs NavToggle
@docs navToggle

### Nav Item
@docs NavItem, IsActive
@docs navItem, navItemLink
@docs navItemTab, navItemTabLink

# Pagination
@docs Pagination, pagination

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
@docs panelBlock, panelLink, panelLabel
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

import Bulma.Modifiers exposing ( Color(..), Size(..), HorizontalAlignment(..) )

import Bulma.Layout exposing ( container )

import Bulma.Elements exposing ( Image, easyDelete ) 
import Bulma.Elements.Icon exposing ( Icon ) 

import Html exposing ( Html, text, div, p, a, ul, li, span )
import Html.Events exposing ( onClick )
import Html.Attributes exposing ( class )


-- CARD ------------------------------------------------------------------------

{-| TODO
-}
type alias Card msg = Html msg

{-| TODO
-}
card : Attrs msg -> List (CardPartition msg) -> Card msg
card = node "div" [] [ bulma.card.container ]


-- CARD PARTITIONS --

{-| TODO
-}
type alias CardPartition msg = Html msg

{-| TODO
-}
cardHeader : Attrs msg -> Htmls msg -> CardPartition msg
cardHeader = node "header" [] [ bulma.card.header.container ]

{-| TODO
-}
easyCardHeader : Attrs msg -> { title : Htmls msg, icon : Htmls msg, onClickIcon : msg } -> CardPartition msg
easyCardHeader attrs {title,icon,onClickIcon}
  = cardHeader attrs
    [ cardTitle    [                     ] title
    , cardIconLink [ onClick onClickIcon ] icon
    ]
  
{-| TODO
-}
easierCardHeader : Attrs msg -> { title : String, icon : Icon msg, onClickIcon : msg } -> CardPartition msg
easierCardHeader attrs {title,icon,onClickIcon}
  = cardHeader attrs
    [ easyCardTitle    []             title
    , easyCardIconLink [] onClickIcon icon
    ]

{-| TODO
-}
type alias CardHeaderItem msg = Html msg

{-| TODO
-}
cardTitle : Attrs msg -> Htmls msg -> CardHeaderItem msg
cardTitle = node "p" [] [ bulma.card.header.title ]

{-| TODO
-}
easyCardTitle : Attrs msg -> String -> CardHeaderItem msg
easyCardTitle attrs = text >> ls >> cardTitle attrs

{-| TODO
-}
cardIcon : Attrs msg -> List (Icon msg) -> CardHeaderItem msg
cardIcon = node "p" [] [ bulma.card.header.icon ]

{-| TODO
-}
cardIconLink : Attrs msg -> List (Icon msg) -> CardHeaderItem msg
cardIconLink = node "a" [] [ bulma.card.header.icon ]

{-| TODO
-}
easyCardIconLink : Attrs msg -> msg -> Icon msg -> CardHeaderItem msg
easyCardIconLink attrs msg
  = cardIcon (onClick msg :: attrs) << ls

{-| TODO
-}
cardImage : Attrs msg -> List (Image msg) -> CardPartition msg
cardImage = node "div" [] [ bulma.card.image ]

{-| TODO
-}
cardContent : Attrs msg -> Htmls msg -> CardPartition msg
cardContent = node "div" [] [ bulma.card.content ]

{-| TODO
-}
cardFooter : Attrs msg -> List (CardFooterItem msg) -> CardPartition msg
cardFooter = node "footer" [] [ bulma.card.footer.container ]

{-| TODO
-}
type alias CardFooterItem msg = Html msg

{-| TODO
-}
cardFooterItem : Attrs msg -> Htmls msg -> CardFooterItem msg
cardFooterItem = node "p" [] [ bulma.card.footer.item ]

{-| TODO
-}
cardFooterItemLink : Attrs msg -> Htmls msg -> CardFooterItem msg
cardFooterItemLink = node "a" [] [ bulma.card.footer.item ]


-- LEVEL -----------------------------------------------------------------------

{-| TODO
-}
type alias Level msg = Html msg

{-| TODO
-}
level : Attrs msg -> List (LevelPartition msg) -> Level msg
level = node "nav" [] [ bulma.level.container ]

{-| TODO
-}
centeredLevel : Attrs msg -> List (LevelItem msg) -> Level msg
centeredLevel = level
                
{-| TODO
-}
horizontalLevel : Attrs msg -> List (LevelPartition msg) -> Level msg
horizontalLevel = node "nav" [] [ bulma.level.container
                                , bulma.level.mobile.isHorizontal
                                ]

{-| TODO
-}
centeredHorizontalLevel : Attrs msg -> List (LevelPartition msg) -> Level msg
centeredHorizontalLevel = horizontalLevel

-- LEVEL PARTITONS --

{-| TODO
-}
type alias LevelPartition msg = Html msg

{-| TODO
-}
levelLeft : Attrs msg -> List (LevelItem msg) -> LevelPartition msg
levelLeft = node "div" [] [ bulma.level.left ]

{-| TODO
-}
levelRight : Attrs msg -> List (LevelItem msg) -> LevelPartition msg
levelRight = node "div" [] [ bulma.level.right ]

-- LEVEL ITEMS --

{-| TODO
-}
type alias LevelItem msg = Html msg

{-| TODO
-}
levelItem : Attrs msg -> Htmls msg -> LevelItem msg
levelItem = node "div" [] [ bulma.level.item ]

{-| TODO
-}
levelItemText : Attrs msg -> Htmls msg -> LevelItem msg
levelItemText = node "p" [] [ bulma.level.item ]

{-| TODO
-}
levelItemLink : Attrs msg -> Htmls msg -> LevelItem msg
levelItemLink = node "a" [] [ bulma.level.item ]

{-| TODO
-}
easyLevelItemWithHeading : Attrs msg -> String -> String -> LevelItem msg
easyLevelItemWithHeading attrs heading title
  = levelItem attrs
    [ div []
      [ p [ class "heading" ] [ text heading ]
      , p [ class "title"   ] [ text title   ]
      ]
    ]


-- MEDIA OBJECT ----------------------------------------------------------------

{-| TODO
-}
type alias Media msg = Html msg

{-| TODO
-}
media : Attrs msg -> List (MediaPartition msg) -> Media msg
media = node "article" [] [ bulma.media.container ]

{-| TODO
-}
largeMedia : Attrs msg -> List (MediaPartition msg) -> Media msg
largeMedia = node "article" [] [ bulma.media.container
                               , bulma.media.size.isLarge
                               ]

-- MEDIA PARTITION --

{-| TODO
-}
type alias MediaPartition msg = Html msg

-- mediaLeft_ : (Attrs msg -> Htmls msg -> Html msg) -> Attrs msg -> Htmls msg -> MediaPartition msg

{-| TODO
-}
mediaLeft : Attrs msg -> Htmls msg -> MediaPartition msg
mediaLeft = node "div" [] [ bulma.media.left ]

{-| TODO
-}
mediaContent : Attrs msg -> Htmls msg -> MediaPartition msg
mediaContent = node "div" [] [ bulma.media.content ]

{-| TODO
-}
mediaRight : Attrs msg -> Htmls msg -> MediaPartition msg
mediaRight = node "div" [] [ bulma.media.right ]


-- MENU ------------------------------------------------------------------------

{-| TODO
-}
type alias Menu msg = Html msg

{-| TODO
-}
menu : Attrs msg -> List (MenuPart msg) -> Menu msg
menu = node "aside" [] [ bulma.menu.container ]


-- MENU ITEMS --

{-| TODO
-}
type alias MenuPart msg = Html msg

{-| TODO
-}
menuLabel : Attrs msg -> Htmls msg -> MenuPart msg
menuLabel = node "p" [] [ bulma.menu.label ]

{-| TODO
-}
menuList : Attrs msg -> List (MenuListItem msg) -> MenuPart msg
menuList = node "ul" [] [ bulma.menu.list ]


-- MENU LIST ITEMS --

{-| TODO
-}
type alias MenuListItem msg = Html msg

{-| TODO
-}
menuListItem : Attrs msg -> Htmls msg -> MenuListItem msg
menuListItem attrs = a attrs >> ls >> li []

{-| TODO
-}
easyMenuListItem : Attrs msg -> msg -> Icon msg -> String -> MenuListItem msg
easyMenuListItem attrs msg icon str
  = menuListItem (onClick msg :: attrs)
    [ icon
    , text str
    ]


-- MESSAGE ---------------------------------------------------------------------

{-| TODO
-}
type alias Message msg = Html msg

{-| TODO
-}
message : Color -> Attrs msg -> List (MessagePartition msg) -> Message msg
message color
  = node "article" []
    [ bulma.message.container
    , case color of
        Default -> ""
        White   -> bulma.message.color.isWhite
        Light   -> bulma.message.color.isLight
        Dark    -> bulma.message.color.isDark
        Black   -> bulma.message.color.isBlack
        Primary -> bulma.message.color.isPrimary
        Info    -> bulma.message.color.isInfo
        Success -> bulma.message.color.isSuccess
        Warning -> bulma.message.color.isWarning
        Danger  -> bulma.message.color.isDanger
    ]


-- MESSAGE PARTITONS --

{-| TODO
-}
type alias MessagePartition msg = Html msg

{-| TODO
-}
messageHeader : Attrs msg -> Htmls msg -> MessagePartition msg
messageHeader = node "div" [] [ bulma.message.header ]

{-| TODO
-}
messageHeaderWithDelete : Attrs msg -> msg -> Htmls msg -> MessagePartition msg
messageHeaderWithDelete attrs msg
  = node "div" [] [ bulma.message.header ] attrs
  << flip (++) [ easyDelete [] msg ]

{-| TODO
-}
messageBody : Attrs msg -> Htmls msg -> MessagePartition msg
messageBody = node "div" [] [ bulma.message.body ]


-- MODAL -----------------------------------------------------------------------

{-| TODO
-}
type alias Modal msg = Html msg

{-| TODO
-}
type alias IsModalOpen = Bool

{-| TODO
-}
modal : IsModalOpen -> Attrs msg -> List (ModalPartition msg) -> Modal msg
modal active
  = node "div" []
    [ bulma.modal.container
    , case active of
        True  -> bulma.modal.state.isActive
        False -> ""
    ]

{-| TODO
-}
easyModal : IsModalOpen -> Attrs msg -> msg -> Htmls msg -> Modal msg
easyModal active attrs close content
  = modal active attrs
    [ easyModalBackground   [] close
    , modalContent          [] content
    , easyModalClose Normal [] close
    ]


-- MODAL PARTITIONS --

{-| TODO
-}
type alias ModalPartition msg = Html msg

{-| TODO
-}
modalBackground : Attrs msg -> Htmls msg -> ModalPartition msg
modalBackground = node "div" [] [ bulma.modal.background ]

{-| TODO
-}
easyModalBackground : Attrs msg -> msg -> ModalPartition msg
easyModalBackground attrs onClickBackground
  = modalBackground (onClick onClickBackground :: attrs) []

{-| TODO
-}
modalContent : Attrs msg -> Htmls msg -> ModalPartition msg
modalContent = node "div" [] [ bulma.modal.content ]

{-| TODO
-}
modalClose : Size -> Attrs msg -> Htmls msg -> ModalPartition msg
modalClose size
  = node "button" []
    [ bulma.modal.close.ui
    , case size of
        Small  -> bulma.modal.close.size.isSmall
        Normal -> ""
        Medium -> bulma.modal.close.size.isMedium
        Large  -> bulma.modal.close.size.isLarge
    ]

{-| TODO
-}
easyModalClose : Size -> Attrs msg -> msg -> ModalPartition msg
easyModalClose size attrs onClickModal
  = modalClose size (onClick onClickModal :: attrs) []

{-| TODO
-}
modalCard : Attrs msg -> List (ModalCardPartition msg) -> ModalPartition msg
modalCard = node "div" [] [ bulma.modal.card.container ]


-- MODAL CARD PARTITIONS --

{-| TODO
-}
type alias ModalCardPartition msg = Html msg

{-| TODO
-}
modalCardHead : Attrs msg -> Htmls msg -> ModalCardPartition msg
modalCardHead = node "div" [] [ bulma.modal.card.head ]

{-| TODO
-}
modalCardTitle : Attrs msg -> Htmls msg -> Html msg
modalCardTitle = node "div" [] [ bulma.modal.card.title ]

{-| TODO
-}
modalCardBody : Attrs msg -> Htmls msg -> ModalCardPartition msg
modalCardBody = node "div" [] [ bulma.modal.card.body ]

{-| TODO
-}
modalCardFoot : Attrs msg -> Htmls msg -> ModalCardPartition msg
modalCardFoot = node "div" [] [ bulma.modal.card.foot ]


-- NAV -------------------------------------------------------------------------

{-| TODO
-}
type alias Nav msg = Html msg
   
{-| TODO
-}
nav : HasShadow -> Attrs msg -> List (NavPartition msg) -> Nav msg
nav shadow
  = node "nav" []
    [ bulma.nav.container
    , case shadow of
        True  -> bulma.nav.style.hasShadow
        False -> ""
    ]

{-| TODO
-}
containedNav : HasShadow -> Attrs msg -> List (NavPartition msg) -> Nav msg
containedNav shadow attrs
  = container [] >> ls >> nav shadow attrs

{-| TODO
-}
easyNav : HasShadow -> Attrs msg -> { toggle : NavToggle msg, left : NavPartition msg, center : NavPartition msg, right : NavPartition msg } -> Nav msg
easyNav shadow attrs {left,center,right,toggle}
  = nav shadow attrs
    [ left
    , center
    , toggle
    , right
    ]

{-| TODO
-}
easierNav : HasShadow -> Attrs msg -> { toggleMsg : msg, isMenuOpen : Bool, left : List (NavItem msg), center : List (NavItem msg), right : List (NavItem msg) } -> Nav msg
easierNav shadow attrs {toggleMsg,isMenuOpen,left,center,right}
  = nav shadow attrs
    [ navLeft [] left
    , navCenter [] center
    , navToggle isMenuOpen [ onClick toggleMsg ]
    , navRightMenu isMenuOpen [] right
    ]


-- NAV PARTITION --

{-| TODO
-}
type alias NavPartition msg = Html msg

{-| TODO
-}
navLeft : Attrs msg -> List (NavItem msg) -> NavPartition msg
navLeft = node "div" [] [ bulma.nav.left ] 

{-| TODO
-}
navCenter : Attrs msg -> List (NavItem msg) -> NavPartition msg
navCenter = node "div" [] [ bulma.nav.center ] 

{-| TODO
-}
navRight : Attrs msg -> List (NavItem msg) -> NavPartition msg
navRight = node "div" [] [ bulma.nav.right ] 

{-| TODO
-}
navRightMenu : IsMenuOpen -> Attrs msg -> List (NavItem msg) -> NavPartition msg
navRightMenu active
  = node "div" [] [ bulma.nav.right
                  , bulma.nav.menu.container
                  , case active of
                      True  -> bulma.nav.menu.state.isActive
                      False -> ""
                  ] 


-- NAV TOGGLE --

{-| TODO
-}
type alias NavToggle msg = Html msg

{-| TODO
-}
navToggle : IsMenuOpen -> Attrs msg -> NavToggle msg
navToggle active attrs
  = node "span" [] [ bulma.nav.toggle.ui
                   , case active of
                       True  -> bulma.nav.toggle.state.isActive
                       False -> ""
                   ]
    attrs
    [ span [] []
    , span [] []
    , span [] []
    ]


-- NAV ITEM --

{-| TODO
-}
type alias NavItem msg = Html msg

{-| TODO
-}
navItem : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
navItem active
  = node "div" [] [ bulma.nav.item.container
                  , case active of
                      True  -> bulma.nav.item.state.isActive
                      False -> ""
                  ]

{-| TODO
-}
navItemTab : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
navItemTab active
  = node "div" [] [ bulma.nav.item.container
                  , bulma.nav.item.style.isTab
                  , case active of
                      True  -> bulma.nav.item.state.isActive
                      False -> ""
                  ]

{-| TODO
-}
navItemLink : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
navItemLink active
  = node "a" [] [ bulma.nav.item.container
                  , case active of
                      True  -> bulma.nav.item.state.isActive
                      False -> ""
                  ]

{-| TODO
-}
navItemTabLink : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
navItemTabLink active
  = node "a" [] [ bulma.nav.item.container
                  , bulma.nav.item.style.isTab
                  , case active of
                      True  -> bulma.nav.item.state.isActive
                      False -> ""
                  ]


-- MODIFIERS --

{-| TODO
-}
type alias HasShadow = Bool

{-| TODO
-}
type alias IsMenuOpen = Bool

{-| TODO
-}
type alias IsActive = Bool


-- PAGINATION ------------------------------------------------------------------

{-| TODO
-}
type alias Pagination msg = Html msg

{-| TODO
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

-- {-| TODO
-- -}
-- easyModal : IsModalOpen -> Attrs msg -> msg -> Htmls msg -> Modal msg
-- easyModal active attrs close content
--   = modal active attrs
--     [ easyModalBackground   [] close
--     , modalContent          [] content
--     , easyModalClose Normal [] close
--     ]

-- PAGINATION PARTITIONS --

{-| TODO
-}
type alias PaginationPartition msg = Html msg

{-| TODO
-}
paginationPrev : Attrs msg -> Htmls msg -> PaginationPartition msg
paginationPrev = node "a" [] [ bulma.pagination.previous ]

{-| TODO
-}
easyPaginationPrev : Attrs msg -> msg -> String -> PaginationPartition msg
easyPaginationPrev attrs msg
  = text >> ls >> paginationPrev (onClick msg :: attrs)

{-| TODO
-}
paginationNext : Attrs msg -> Htmls msg -> PaginationPartition msg
paginationNext = node "a" [] [ bulma.pagination.next ]

{-| TODO
-}
easyPaginationNext : Attrs msg -> msg -> String -> PaginationPartition msg
easyPaginationNext attrs msg
  = text >> ls >> paginationNext (onClick msg :: attrs)

{-| TODO
-}
paginationList : Attrs msg -> List (PaginationListItem msg) -> PaginationPartition msg
paginationList attrs
  = List.map (ls >> li []) >> node "ul" [] [ bulma.pagination.list.container ] attrs

-- TODO: easyPaginationList


-- PAGINATION LIST ITEMS --

{-| TODO
-}
type alias PaginationListItem msg = Html msg

{-| TODO
-}
type alias IsCurrent = Bool

{-| TODO
-}
paginationLink : IsCurrent -> Attrs msg -> Htmls msg -> PaginationListItem msg
paginationLink current
  = node "a" []
    [ bulma.pagination.list.link.ui
    , case current of
        True  -> bulma.pagination.list.link.state.isCurrent
        False -> ""
    ]

{-| TODO
-}
easyPaginationLink : IsCurrent -> Attrs msg -> msg -> Int -> PaginationListItem msg
easyPaginationLink current attrs msg
  = toString >> text >> ls >> paginationLink current (onClick msg :: attrs)

{-| TODO
-}
paginationEllipsis : Attrs msg -> Htmls msg -> PaginationListItem msg
paginationEllipsis = node "span" [] [ bulma.pagination.list.ellipsis ]

{-| TODO
-}
easyPaginationEllipsis : Attrs msg -> PaginationListItem msg
easyPaginationEllipsis attrs = paginationEllipsis attrs [ text "&hellip;" ]


-- PANEL -----------------------------------------------------------------------

{-| TODO
-}
type alias Panel msg = Html msg

{-| TODO
-}
panel : Attrs msg -> List (PanelPartition msg) -> Panel msg
panel = node "div" [] [ bulma.panel.container ]

-- TODO: easyPanel


-- PANEL PARTITIONS --

{-| TODO
-}
type alias PanelPartition msg = Html msg

{-| TODO
-}
panelHeading : Attrs msg  -> Htmls msg -> PanelPartition msg
panelHeading = node "p" [] [ bulma.panel.heading ]

{-| TODO
-}
panelTabs : Attrs msg -> List (PanelTab msg) -> PanelPartition msg
panelTabs = node "p" [] [ bulma.panel.tabs.container ]

{-| TODO
-}
panelBlock : IsActive -> Attrs msg -> Htmls msg -> PanelPartition msg
panelBlock active
  = node "div" []
    [ bulma.panel.block.container
    , case active of
        True  -> bulma.panel.block.state.isActive
        False -> ""
    ]

{-| TODO
-}
panelLink : IsActive -> Attrs msg -> Htmls msg -> PanelPartition msg
panelLink active
  = node "a" []
    [ bulma.panel.block.container
    , case active of
        True  -> bulma.panel.block.state.isActive
        False -> ""
    ]

-- easyPanelLink : IsActive -> Attrs msg -> msg -> Icon msg -> String -> PanelPartition msg
-- easyPanelLink active attrs msg icon str
--   = panelBlockLink active (onClick msg :: attrs) [ panelLinkIcon icon ]

-- TODO: panelLinkIcon : (Attrs msg -> Htmls msg -> Icon msg) -> Attrs msg -> Htmls msg -> Icon msg

{-| TODO
-}
panelLabel : IsActive -> Attrs msg -> Htmls msg -> PanelPartition msg
panelLabel active
  = node "label" []
    [ bulma.panel.block.container
    , case active of
        True  -> bulma.panel.block.state.isActive
        False -> ""
    ]

-- TODO: easyPanelRadio


-- PANEL TABS --

{-| TODO
-}
type alias PanelTab msg = Html msg

{-| TODO
-}
panelTab : IsActive -> Attrs msg -> Htmls msg -> PanelTab msg
panelTab active
  = node "a" []
    [ case active of
        True  -> bulma.panel.tabs.tab.state.isActive
        False -> ""
    ]


-- TABS ------------------------------------------------------------------------

{-| TODO
-}
type alias Tabs msg = Html msg

{-| TODO
-}
type TabsStyle = Minimal
               | Boxed
               | Toggle

{-| TODO
-}
type alias TabsModifiers = { style     : TabsStyle
                           , alignment : HorizontalAlignment
                           , size      : Size
                           }

{-| TODO
-}
tabsModifiers : TabsModifiers
tabsModifiers = { style     = Minimal
                , alignment = Left
                , size      = Normal
                }

{-| TODO
-}
tabs : TabsModifiers -> Attrs msg -> List (Tab msg) -> Tabs msg
tabs {style,alignment,size}
  = node "div" []
    [ bulma.tabs.container
    , case style of
        Minimal -> ""
        Boxed   -> bulma.tabs.style.isBoxed
        Toggle  -> bulma.tabs.style.isToggle
    , case alignment of
        Left     -> ""
        Centered -> bulma.tabs.alignment.isCentered
        Right    -> bulma.tabs.alignment.isRight
    , case size of
        Small  -> bulma.tabs.size.isSmall
        Normal -> ""
        Medium -> bulma.tabs.size.isMedium
        Large  -> bulma.tabs.size.isLarge
    ]


-- TAB --

{-| TODO
-}
type alias Tab msg = Html msg

{-| TODO
-}
tab : IsActive -> Attrs msg -> Htmls msg -> Tab msg
tab active
  = node "li" []
    [ case active of
        True  -> bulma.tabs.tab.state.isActive
        False -> ""
    ]



