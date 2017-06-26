
module Bulma.Elements exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Table of Contents
Coming soon!

# Box
@docs Box
@docs box

# Button
@docs Button, ButtonModifiers, buttonModifiers
@docs button, staticButton, easyButton
@docs iconButton, staticIconButton, easyIconButton

## Button GROUPS
@docs ButtonGroup
@docs buttonGroup, connectedButtonGroup

# Content
@docs Content
@docs content

# Delete
Coming soon!

# Form
Coming soon!

# Image
@docs Image
Coming soon!

# Notification
Coming soon!

# Progress
Coming soon!

# Table
Coming soon!

# Tag
Coming soon!

# Title
Coming soon!

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers as Modifiers exposing (..)

import Bulma.Elements.Icon as Icon exposing ( Icon )

import Html exposing ( Html, text, div, a )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class )

import List exposing ( filter )


-- BOX -------------------------------------------------------------------------

{-| TODO
-}
type alias Box msg = Html msg

{-| TODO
-}
box : Attrs msg -> Htmls msg -> Box msg
box = node "div" [] [ bulma.box.container ]


-- BUTTON ----------------------------------------------------------------------

{-| TODO
-}
type alias Button msg = Html msg

{-| TODO
-}
button : ButtonModifiers -> Attrs msg -> Htmls msg -> Button msg
button {disabled,outlined,inverted,size,state,color}
  = node "a" ( if disabled then [ Attr.disabled True ] else [] )
    [ bulma.button.ui
    , case outlined of
        True  -> bulma.button.style.isOutlined
        False -> ""
    , case inverted of
        True  -> bulma.button.style.isInverted
        False -> ""
    -- TODO: size
    -- TODO: state
    -- TODO: color
    ]
  
{-| TODO
-}
staticButton : ButtonModifiers -> Attrs msg -> Htmls msg -> Button msg
staticButton mods = button mods << (::) (class bulma.button.style.isStatic)

{-| TODO
-}
easyButton : ButtonModifiers -> Attrs msg -> msg -> String -> Button msg
easyButton mods attrs msg str
  = button mods
    (onClick msg :: attrs)
    [ text str ]

-- WITH ICON --

{-| TODO
-}
iconButton : ButtonModifiers -> Icon msg -> Attrs msg -> Htmls msg -> Button msg
iconButton mods icon attrs htmls
  = button mods attrs <| icon :: htmls
    
{-| TODO
-}
staticIconButton : ButtonModifiers -> Icon msg -> Attrs msg -> Htmls msg -> Button msg
staticIconButton mods icon = iconButton mods icon << (::) (class bulma.button.style.isStatic)

{-| TODO
-}
easyIconButton : ButtonModifiers -> Icon msg -> Attrs msg -> msg -> String -> Button msg
easyIconButton mods icon attrs msg str
  = button mods (onClick msg :: attrs)
    [ icon 
    , text str
    ]

-- GROUP --

{-| TODO
-}
type alias ButtonGroup msg = Html msg

{-| TODO
-}
buttonGroup : HorizontalAlignment -> Attrs msg -> List (Button msg) -> ButtonGroup msg
buttonGroup alignment
  = node "div" []
    [ bulma.field.container
    , case alignment of
        Left     -> ""
        Centered -> bulma.field.isGrouped.centered
        Right    -> bulma.field.isGrouped.right
    ]

{-| TODO
-}
connectedButtonGroup : HorizontalAlignment -> Attrs msg -> List (Button msg) -> ButtonGroup msg
connectedButtonGroup alignment
  = node "div" [] [ bulma.field.container
                  , case alignment of
                      Left     -> bulma.field.hasAddons.left
                      Centered -> bulma.field.hasAddons.centered
                      Right    -> bulma.field.hasAddons.right
                  ]

-- MODIFIERS --

{-| TODO
-}
type alias ButtonModifiers = { disabled : Bool
                             , outlined : Bool
                             , inverted : Bool
                             , size     : Size
                             , state    : State
                             , color    : Color
                             }

{-| TODO
-}
buttonModifiers : ButtonModifiers
buttonModifiers = { disabled = False
                  , outlined = False
                  , inverted = False
                  , size     = Normal
                  , state    = Blur
                  , color    = Default
                  }


-- CONTENT ---------------------------------------------------------------------

{-| TODO
-}
type alias Content msg = Html msg

{-| TODO
-}
content : Size -> Attrs msg -> Htmls msg -> Content msg
content size
  = node "div" []
    [ bulma.content.container
    , case size of
        Small  -> bulma.content.size.isSmall
        Normal -> ""
        Medium -> bulma.content.size.isMedium
        Large  -> bulma.content.size.isLarge
    ]


-- IMAGE -----------------------------------------------------------------------

{-| TODO
-}
type alias Image msg = Html msg

