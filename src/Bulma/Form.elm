
module Bulma.Form exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| 
# Field
@docs Field
@docs field

## Field Group
@docs FieldGroupModifiers, fieldGroupModifiers
@docs fieldGroup, horizontalFieldGroup

### Horizontal Field Partition
@docs HorizontalFieldPartition
@docs fieldLabel, fieldBody

## Control
@docs Control, IsInline
@docs ControlModifiers, controlModifiers
@docs control
@docs controlCheckBox, controlInput, controlLabel, controlRadio, controlRadioButton, controlSelect, controlTextArea
@docs label, help
-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers as Modifiers exposing (..)

import Bulma.Elements.Icon as Icon exposing ( Icon, IconBody, icon )

import Html exposing ( Html, text, div, a, img, span )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class )

import List exposing ( filter )


-- FORM ------------------------------------------------------------------------

{-| TODO
-}
type alias Field msg = Html msg

{-| TODO
-}
field : Attrs msg -> List (Control msg) -> Field msg
field = node "div" [] [ bulma.field.container ]

-- FIELD GROUPS --

{-| TODO
-}
type alias FieldGroupModifiers = { alignment : HorizontalAlignment
                                 , connected : Bool
                                 }

{-| TODO
-}
fieldGroupModifiers : FieldGroupModifiers
fieldGroupModifiers = { alignment = Left
                      , connected = False
                      }

{-| TODO
-}
fieldGroup : FieldGroupModifiers -> Attrs msg -> List (Control msg) -> Field msg
fieldGroup {alignment,connected}
  = node "div" []
    [ bulma.field.container
    , case connected of
        True -> 
          case alignment of
            Left     -> bulma.field.hasAddons.left
            Centered -> bulma.field.hasAddons.centered
            Right    -> bulma.field.hasAddons.right
        False -> 
          case alignment of
            Left     -> bulma.field.hasAddons.left
            Centered -> bulma.field.hasAddons.centered
            Right    -> bulma.field.hasAddons.right
    ]

{-| TODO
-}
horizontalFieldGroup : FieldGroupModifiers -> Attrs msg -> List (HorizontalFieldPartition msg) -> Field msg
horizontalFieldGroup {alignment,connected}
  = node "div" []
    [ bulma.field.container
    , bulma.field.layout.isHorizontal
    , case connected of
        True -> 
          case alignment of
            Left     -> bulma.field.hasAddons.left
            Centered -> bulma.field.hasAddons.centered
            Right    -> bulma.field.hasAddons.right
        False -> 
          case alignment of
            Left     -> bulma.field.hasAddons.left
            Centered -> bulma.field.hasAddons.centered
            Right    -> bulma.field.hasAddons.right
    ]


-- HORIZONTAL FIELD PARTITION --

{-| TODO
-}
type alias HorizontalFieldPartition msg = Html msg

{-| TODO
-}
fieldLabel : Size -> Attrs msg -> Htmls msg -> HorizontalFieldPartition msg
fieldLabel size
  = node "div" []
    [ bulma.field.label
    , case size of
        Small  -> bulma.label.size.isSmall
        Normal -> ""
        Medium -> bulma.label.size.isMedium
        Large  -> bulma.label.size.isLarge
    ]

{-| TODO
-}
fieldBody : Attrs msg -> List (Control msg) -> HorizontalFieldPartition msg
fieldBody = node "div" [] [ "field-body" ]


-- CONTROLS --

{-| TODO
-}
type alias ControlModifiers msg = { color     : Color
                                  , size      : Size
                                  , state     : State
                                  , expanded  : Bool
                                  , disabled  : Bool
                                  , iconLeft  : Maybe (Size, Attrs msg, IconBody msg)
                                  , iconRight : Maybe (Size, Attrs msg, IconBody msg)
                                  }

{-| TODO
-}
type alias IsInline = Bool

{-| TODO
-}
controlModifiers : ControlModifiers msg
controlModifiers = { color     = Default
                   , size      = Normal
                   , state     = Blur
                   , expanded  = False
                   , disabled  = False
                   , iconLeft  = Nothing
                   , iconRight = Nothing
                   }

{-| TODO
-}
type alias Control msg = Html msg

{-| TODO
-}
control : ControlModifiers msg -> Attrs msg -> Htmls msg -> Control msg
control {color,size,state,expanded,disabled,iconLeft,iconRight} attrs htmls
  = node "p" []
    [ bulma.control.container
    , case state of
        Loading -> bulma.control.state.isLoading
        _       -> ""
    , case expanded of
        True  -> bulma.control.sizing.isExpanded
        False -> ""
    , case iconLeft of
        Just  _ -> bulma.control.hasIcons.left
        Nothing -> ""
    , case iconRight of
        Just  _ -> bulma.control.hasIcons.right
        Nothing -> ""
    ]
    attrs
  <| htmls
 ++ ( iconLeft
    |> Maybe.map (\(size, attrs, iconBody) -> [ icon size (class "is-left"  :: attrs) [ iconBody ] ])
    |> Maybe.withDefault []
    )
 ++ ( iconRight
    |> Maybe.map (\(size, attrs, iconBody) -> [ icon size (class "is-right" :: attrs) [ iconBody ] ])
    |> Maybe.withDefault []
    )
 ++ [
    ]

{-| TODO
-}
label : Attrs msg -> Htmls msg -> Control msg
label = node "label" [] [ bulma.label.ui ]

{-| TODO
-}
controlLabel : ControlModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlLabel ({size} as mods) attrs attrs_
  = control mods attrs
  << ls
  << node "label" []
    [ bulma.label.ui
    , case size of
        Small  -> bulma.label.size.isSmall
        Normal -> ""
        Medium -> bulma.label.size.isMedium
        Large  -> bulma.label.size.isLarge
    ]
    attrs_

{-| TODO
-}
controlInput : IsInline -> ControlModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlInput inline ({size,state,color,expanded} as mods) attrs attrs_
  = control mods attrs
  << ls
  << node "input" []
    [ bulma.input.ui
    , case inline of
        True  -> bulma.input.display.isInline
        False -> ""
    , case size of
        Small  -> bulma.input.size.isSmall
        Normal -> ""
        Medium -> bulma.input.size.isMedium
        Large  -> bulma.input.size.isLarge
    , case state of
        Hover   -> bulma.input.state.isHovered
        Focus   -> bulma.input.state.isFocused
        Active  -> bulma.input.state.isActive
        Loading -> bulma.input.state.isLoading
        _       -> ""
    , case color of
        Default -> ""
        White   -> bulma.input.color.isWhite
        Light   -> bulma.input.color.isLight
        Dark    -> bulma.input.color.isDark
        Black   -> bulma.input.color.isBlack
        Primary -> bulma.input.color.isPrimary
        Info    -> bulma.input.color.isInfo
        Success -> bulma.input.color.isSuccess
        Warning -> bulma.input.color.isWarning
        Danger  -> bulma.input.color.isDanger
    , case expanded of
        True  -> bulma.input.addon.isExpanded
        False -> ""
    ]
    attrs_

{-| TODO
-}
controlTextArea : IsInline -> ControlModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlTextArea inline ({size,state,color} as mods) attrs attrs_
  = control mods attrs
  << ls
  << node "textarea" []
    [ bulma.textarea.ui
    , case inline of
        True  -> bulma.textarea.display.isInline
        False -> ""
    , case size of
        Small  -> bulma.textarea.size.isSmall
        Normal -> ""
        Medium -> bulma.textarea.size.isMedium
        Large  -> bulma.textarea.size.isLarge
    , case state of
        Hover   -> bulma.textarea.state.isHovered
        Focus   -> bulma.textarea.state.isFocused
        Active  -> bulma.textarea.state.isActive
        Loading -> bulma.textarea.state.isLoading
        _       -> ""
    , case color of
        Default -> ""
        White   -> bulma.textarea.color.isWhite
        Light   -> bulma.textarea.color.isLight
        Dark    -> bulma.textarea.color.isDark
        Black   -> bulma.textarea.color.isBlack
        Primary -> bulma.textarea.color.isPrimary
        Info    -> bulma.textarea.color.isInfo
        Success -> bulma.textarea.color.isSuccess
        Warning -> bulma.textarea.color.isWarning
        Danger  -> bulma.textarea.color.isDanger
    ]
    attrs_

{-| TODO
-}
controlSelect : ControlModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlSelect ({size,state,expanded} as mods) attrs attrs_
  = control mods attrs
  << ls
  << node "span" [] [ bulma.select.ui ] []
  << ls
  << node "select" []
    [ case size of
        Small  -> bulma.select.size.isSmall
        Normal -> ""
        Medium -> bulma.select.size.isMedium
        Large  -> bulma.select.size.isLarge
    , case state of
        Hover   -> bulma.select.state.isHovered
        Focus   -> bulma.select.state.isFocused
        Active  -> bulma.select.state.isActive
        Loading -> bulma.select.state.isLoading
        _       -> ""
    , case expanded of
        True  -> bulma.select.addon.isExpanded
        False -> ""
    ]
    attrs_

{-| TODO
-}
controlCheckBox : ControlModifiers msg -> Attrs msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlCheckBox mods attrs attrs_ attrs__
  = control mods attrs
  << ls
  << node "label" [] [ bulma.checkbox.ui ] attrs_
  << ls
  << node "input" [] [ bulma.checkbox.ui ] attrs__

{-| TODO
-}
controlRadio : ControlModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlRadio mods attrs attrs_
  = control mods attrs
  << ls
  << node "label" [] [ bulma.radio.ui ] attrs_

{-| TODO
-}
controlRadioButton : Attrs msg -> Htmls msg -> Html msg
controlRadioButton = node "input" [ Attr.type_ "radio" ] []

-- {-| TODO
-- -}
-- easyControlRadio : ControlModifiers -> Attrs msg -> List (msg, Htmls msg) -> Control msg
-- easyControlRadio mods attrs controls

-- {-| TODO
-- -}
-- controlButton : ControlModifiers -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
-- controlButton mods attrs attrs_
--   = control mods attrs
--   << ls
--   << node "button"

{-| TODO
-}
help : ControlModifiers msg -> Attrs msg -> Htmls msg -> Control msg
help {color}
  = node "p" []
    [ bulma.help.ui
    , case color of
        Default -> ""
        White   -> bulma.textarea.color.isWhite
        Light   -> bulma.textarea.color.isLight
        Dark    -> bulma.textarea.color.isDark
        Black   -> bulma.textarea.color.isBlack
        Primary -> bulma.textarea.color.isPrimary
        Info    -> bulma.textarea.color.isInfo
        Success -> bulma.textarea.color.isSuccess
        Warning -> bulma.textarea.color.isWarning
        Danger  -> bulma.textarea.color.isDanger
    ]

