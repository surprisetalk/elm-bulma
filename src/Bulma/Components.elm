
module Bulma.Components exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [BreadCrumb](#breadcrumb)
- [Card](#card)
- [Dropdown](#dropdown)
- [Level](#level)
- [Media](#media)
- [Menu](#menu)
- [Message](#message)
- [Modal](#modal)
- [Navbar](#navbar)
- [Pagination](#pagination)
- [Panel](#panel)
- [Tabs](#tabs)

# BreadCrumb
Coming Soon!

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
Coming Soon!

# Level
@docs Level
@docs level, horizontalLevel
@docs centeredLevel

## Level Partition
@docs LevelPartition
@docs levelLeft, levelRight

## Level Item
@docs LevelItem
@docs levelItem, levelItemLink, levelItemText
@docs easyLevelItemWithHeading 

# Media Object
@docs Media
@docs media

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
Coming Soon!

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


-- BREADCRUMB ------------------------------------------------------------------

-- TODO: breadcrumb


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
        , cardIcon [] []
          [ icon Normal []
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
    myIcon = icon Normal [] [ diamond ] 

    myCardHeader : Html Msg
    myCardHeader
      = easyCardHeader []
        { title       = [ text "4 of Diamonds" ]
        , icon        = [ myIcon               ]
        , onClickIcon = ShowCard
        ]
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

-- TODO: dropdown


-- LEVEL -----------------------------------------------------------------------

{-| -}
type alias Level msg = Html msg

{-|
    myLevel : Html msg
    myLevel
      = level []
        [ levelLeft []
          [ levelItem [] []
          , levelItem [] []
          , levelItem [] []
          ]
        , levelRight []
          [ levelItem [] []
          , levelItem [] []
          , levelItem [] []
          ]
        ]
-}
level : Attrs msg -> List (LevelPartition msg) -> Level msg
level = node "nav" [] [ bulma.level.container ]

{-| -}
horizontalLevel : Attrs msg -> List (LevelPartition msg) -> Level msg
horizontalLevel = node "nav" [] [ bulma.level.container
                                , bulma.level.mobile.isHorizontal
                                ]
{-|
    myLevel : Html msg
    myLevel
      = centeredLevel []
        [ levelItem [] []
        , levelItem [] []
        , levelItem [] []
        ]
-}
centeredLevel : Attrs msg -> List (LevelItem msg) -> Level msg
centeredLevel = level


-- LEVEL PARTITONS --

{-| -}
type alias LevelPartition msg = Html msg

{-| -}
levelLeft : Attrs msg -> List (LevelItem msg) -> LevelPartition msg
levelLeft = node "div" [] [ bulma.level.left ]

{-| -}
levelRight : Attrs msg -> List (LevelItem msg) -> LevelPartition msg
levelRight = node "div" [] [ bulma.level.right ]

-- LEVEL ITEMS --

{-| -}
type alias LevelItem msg = Html msg

{-| -}
levelItem : Attrs msg -> Htmls msg -> LevelItem msg
levelItem = node "div" [] [ bulma.level.item ]

{-| -}
levelItemText : Attrs msg -> Htmls msg -> LevelItem msg
levelItemText = node "p" [] [ bulma.level.item ]

{-| -}
levelItemLink : Attrs msg -> Htmls msg -> LevelItem msg
levelItemLink = node "a" [] [ bulma.level.item ]

{-| -}
easyLevelItemWithHeading : Attrs msg -> String -> String -> LevelItem msg
easyLevelItemWithHeading attrs heading title
  = levelItem attrs
    [ div []
      [ p [ class "heading" ] [ text heading ]
      , p [ class "title"   ] [ text title   ]
      ]
    ]


-- MEDIA OBJECT ----------------------------------------------------------------

{-| -}
type alias Media msg = Html msg

{-| 
    myMediaObject : Html msg
    myMediaObject
      = media []
        [ mediaLeft    [] []
        , mediaContent [] []
        , mediaRight   [] []
        ]
-}
media : Attrs msg -> List (MediaPartition msg) -> Media msg
media = node "article" [] [ bulma.media.container ]

-- {-| -}
-- largeMedia : Attrs msg -> List (MediaPartition msg) -> Media msg
-- largeMedia = node "article" [] [ bulma.media.container
--                                , bulma.media.size.isLarge
--                                ]

-- MEDIA PARTITION --

{-| -}
type alias MediaPartition msg = Html msg

{-| -}
mediaLeft : Attrs msg -> Htmls msg -> MediaPartition msg
mediaLeft = node "div" [] [ bulma.media.left ]

{-| -}
mediaContent : Attrs msg -> Htmls msg -> MediaPartition msg
mediaContent = node "div" [] [ bulma.media.content ]

{-| -}
mediaRight : Attrs msg -> Htmls msg -> MediaPartition msg
mediaRight = node "div" [] [ bulma.media.right ]


-- MENU ------------------------------------------------------------------------

{-| -}
type alias Menu msg = Html msg

{-| Simple menus for vertical navigation.

    myMenu : Html msg
    myMenu
      = menu []
        [ menuLabel [] [ text "General" ]
        , menuList  [] 
          [ menuListItemLink [] [ text "Dashboard" ]
          , menuListItemLink [] [ text "Customers" ]
          ]
        [ menuLabel [] [ text "Administration" ]
        , menuList  [] 
          [ menuListItemLink [] [ text "Team Settings" ]
          , menuListItem [] 
            [ a [] [ text "Manage Your Team" ]
            , menuList []
              [ menuListItemLink [] [ text "Members" ]
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
menuListItemLink active attrs = a (class (if active then "is-active" else "") :: attrs) >> ls >> li []
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
    , size  = Normal
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
        Info    -> bulma.message.color.isInfo
        Success -> bulma.message.color.isSuccess
        Warning -> bulma.message.color.isWarning
        Danger  -> bulma.message.color.isDanger
    , case size of
        Small  -> "is-small"
        Normal -> ""
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
    , easyModalClose Normal [] close
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
        Normal -> ""
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

-- TODO: nav -> navbar

-- {-| -}
-- type alias Nav msg = Html msg
   
-- {-| -}
-- nav : HasShadow -> Attrs msg -> List (NavPartition msg) -> Nav msg
-- nav shadow
--   = node "nav" []
--     [ bulma.nav.container
--     , case shadow of
--         True  -> bulma.nav.style.hasShadow
--         False -> ""
--     ]

-- {-| -}
-- containedNav : HasShadow -> Attrs msg -> List (NavPartition msg) -> Nav msg
-- containedNav shadow attrs
--   = container [] >> ls >> nav shadow attrs

-- {-| -}
-- easyNav : HasShadow -> Attrs msg -> { toggle : NavToggle msg, left : NavPartition msg, center : NavPartition msg, right : NavPartition msg } -> Nav msg
-- easyNav shadow attrs {left,center,right,toggle}
--   = nav shadow attrs
--     [ left
--     , center
--     , toggle
--     , right
--     ]

-- {-| -}
-- easierNav : HasShadow -> Attrs msg -> { toggleMsg : msg, isMenuOpen : Bool, left : List (NavItem msg), center : List (NavItem msg), right : List (NavItem msg) } -> Nav msg
-- easierNav shadow attrs {toggleMsg,isMenuOpen,left,center,right}
--   = nav shadow attrs
--     [ navLeft [] left
--     , navCenter [] center
--     , navToggle isMenuOpen [ onClick toggleMsg ]
--     , navRightMenu isMenuOpen [] right
--     ]


-- -- NAV PARTITION --

-- {-| -}
-- type alias NavPartition msg = Html msg

-- {-| -}
-- navLeft : Attrs msg -> List (NavItem msg) -> NavPartition msg
-- navLeft = node "div" [] [ bulma.nav.left ] 

-- {-| -}
-- navCenter : Attrs msg -> List (NavItem msg) -> NavPartition msg
-- navCenter = node "div" [] [ bulma.nav.center ] 

-- {-| -}
-- navRight : Attrs msg -> List (NavItem msg) -> NavPartition msg
-- navRight = node "div" [] [ bulma.nav.right ] 

-- {-| -}
-- navRightMenu : IsMenuOpen -> Attrs msg -> List (NavItem msg) -> NavPartition msg
-- navRightMenu active
--   = node "div" [] [ bulma.nav.right
--                   , bulma.nav.menu.container
--                   , case active of
--                       True  -> bulma.nav.menu.state.isActive
--                       False -> ""
--                   ] 


-- -- NAV TOGGLE --

-- {-| -}
-- type alias NavToggle msg = Html msg

-- {-| -}
-- navToggle : IsMenuOpen -> Attrs msg -> NavToggle msg
-- navToggle active attrs
--   = node "span" [] [ bulma.nav.toggle.ui
--                    , case active of
--                        True  -> bulma.nav.toggle.state.isActive
--                        False -> ""
--                    ]
--     attrs
--     [ span [] []
--     , span [] []
--     , span [] []
--     ]


-- -- NAV ITEM --

-- {-| -}
-- type alias NavItem msg = Html msg

-- {-| -}
-- navItem : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
-- navItem active
--   = node "div" [] [ bulma.nav.item.container
--                   , case active of
--                       True  -> bulma.nav.item.state.isActive
--                       False -> ""
--                   ]

-- {-| -}
-- navItemTab : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
-- navItemTab active
--   = node "div" [] [ bulma.nav.item.container
--                   , bulma.nav.item.style.isTab
--                   , case active of
--                       True  -> bulma.nav.item.state.isActive
--                       False -> ""
--                   ]

-- {-| -}
-- navItemLink : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
-- navItemLink active
--   = node "a" [] [ bulma.nav.item.container
--                   , case active of
--                       True  -> bulma.nav.item.state.isActive
--                       False -> ""
--                   ]

-- {-| -}
-- navItemTabLink : IsActive -> Attrs msg -> Htmls msg -> NavItem msg
-- navItemTabLink active
--   = node "a" [] [ bulma.nav.item.container
--                   , bulma.nav.item.style.isTab
--                   , case active of
--                       True  -> bulma.nav.item.state.isActive
--                       False -> ""
--                   ]


-- MODIFIERS --

-- {-| -}
-- type alias HasShadow = Bool

-- {-| -}
-- type alias IsMenuOpen = Bool

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
easyPaginationEllipsis attrs = paginationEllipsis attrs [ text "&hellip;" ]


-- PANEL -----------------------------------------------------------------------

{-| -}
type alias Panel msg = Html msg

{-| 
    myPanel : Html msg
    myPanel
      = panel [] 
        [ panelHeading [] [ text "Repositories" ] 
        , panelBlock False []
          [ controlInput controlInputModifiers [] [] [] []
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

{-| -}
type alias TabsModifiers = { style     : TabsStyle
                           , alignment : HorizontalAlignment
                           , size      : Size
                           }

{-| -}
tabsModifiers : TabsModifiers
tabsModifiers = { style     = Minimal
                , alignment = Left
                , size      = Normal
                }

{-| 
    myTabs : Html msg
    myTabs
      = tabs myTabsModifiers []
        [ tab False [] [ text "Pictures" ]
        , tab False [] [ text "Music"    ]
        , tab True  [] [ text "Videos"   ]
        , tab False [] [ text "Docs"     ]
        ]
-}
tabs : TabsModifiers -> Attrs msg -> List (Tab msg) -> Tabs msg
tabs {style,alignment,size} attrs
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
    attrs
  << ls
  << ul []

-- TODO: contained tabs

-- TAB --

{-| -}
type alias Tab msg = Html msg

{-| -}
tab : IsActive -> Attrs msg -> Htmls msg -> Tab msg
tab active
  = node "li" []
    [ case active of
        True  -> bulma.tabs.tab.state.isActive
        False -> ""
    ]



