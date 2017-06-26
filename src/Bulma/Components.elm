
module Bulma.Components exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Table of Contents
Coming soon!

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
Coming soon!

# Message
Coming soon!

# Modal
Coming soon!

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
Coming soon!

# Panel
Coming soon!

# Tabs
Coming soon!

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Layout exposing ( container )

import Bulma.Elements exposing ( Image ) 
import Bulma.Elements.Icon exposing ( Icon ) 

import Html exposing ( Html, text, div, p, span )
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

