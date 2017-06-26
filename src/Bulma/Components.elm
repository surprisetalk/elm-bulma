
module Bulma.Components exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Card
Coming soon!

# Level
Coming soon!

# Media Object
Coming soon!

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

import Html exposing ( Html, span )
import Html.Events exposing ( onClick )


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

