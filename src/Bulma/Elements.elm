
module Bulma.Elements exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Box](#box)
- [Button](#button)
- [Content](#content)
- [Delete](#delete)
- [Form](#form)
- [Icon](#icon)
- [Image](#image)
- [Notification](#notification)
- [Progress](#progress)
- [Table](#table)
- [Tag](#tag)
- [Title](#title)

# Box
@docs Box
@docs box

# Button
@docs Button, ButtonModifiers, buttonModifiers
@docs button, staticButton, easyButton
@docs iconButton, staticIconButton, easyIconButton

## Button Groups
@docs ButtonGroup
@docs buttonGroup, connectedButtonGroup

# Content
@docs Content
@docs content

# Delete
@docs Delete
@docs delete, easyDelete

# Form

## Field
@docs Field
@docs field

### Field Group
@docs FieldGroupModifiers, fieldGroupModifiers
@docs fieldGroup, horizontalFieldGroup

#### Horizontal Field Partition
@docs HorizontalFieldPartition
@docs fieldLabel, fieldBody

### Control
@docs Control, IsInline
@docs ControlModifiers, controlModifiers
@docs control
@docs controlCheckBox, controlInput, controlLabel, controlRadio, controlRadioButton, controlSelect, controlTextArea
@docs label, help

# Image
@docs Image, ImageModifiers, ImageSize, ImageAspectRatio, imageModifiers
@docs image, easyImage

# Notification
@docs Notification
@docs notification, notificationWithDelete

# Progress
@docs Progress, ProgressModifiers, progressModifiers
@docs progress, easyProgress

# Table
@docs Table, TableModifiers, tableModifiers
@docs table

## Table Partition
@docs TablePartition
@docs tableBody, tableHead, tableFoot

### Table Row
@docs TableRow, IsHighlighted
@docs tableRow

#### Table Cell
@docs TableCell
@docs tableCell, tableCellHead

# Tag
@docs Tag, TagModifiers, tagModifiers
@docs tag, easyTag
@docs tagWithDelete, easyTagWithDelete

# Title
@docs Title, TitleSize
@docs title, subtitle

## Title Pair
@docs TitleSpacing 
@docs easyTitleWithSubtitle
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


-- BOX -------------------------------------------------------------------------

{-| -}
type alias Box msg = Html msg

{-| A white box to contain other elements.
The box is simply a container with a shadow, a border, a radius, and some padding.

    myBox : Html msg
    myBox 
      = box []
        [ p [] 
          [ text "I'm the box ghost!" ]
        ]
-}
box : Attrs msg -> Htmls msg -> Box msg
box = node "div" [] [ bulma.box.container ]


-- BUTTON ----------------------------------------------------------------------

{-| -}
type alias Button msg = Html msg

{-| 
    type Msg = DoSomething
             | DoSomethingElse

    myButton : Html Msg
    myButton
      = button myButtonModifiers 
        [ onClick DoSomething ]
        [ text "Click me!" ]
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
    , case color of
        Default -> ""
        White   -> bulma.button.color.isWhite
        Light   -> bulma.button.color.isLight
        Dark    -> bulma.button.color.isDark
        Black   -> bulma.button.color.isBlack
        Primary -> bulma.button.color.isPrimary
        Info    -> bulma.button.color.isInfo
        Success -> bulma.button.color.isSuccess
        Warning -> bulma.button.color.isWarning
        Danger  -> bulma.button.color.isDanger
    , case size of
        Small  -> bulma.button.size.isSmall
        Normal -> ""
        Medium -> bulma.button.size.isMedium
        Large  -> bulma.button.size.isLarge
    -- TODO: state
    ]
  
{-| These are like disabled buttons, but more dull-looking.
Static buttons are useful to align text labels with inputs.
-}
staticButton : ButtonModifiers -> Attrs msg -> Htmls msg -> Button msg
staticButton mods = button mods << (::) (class bulma.button.style.isStatic)

{-| 
    type Msg = DoSomething
             | DoSomethingElse

    myEasyButton : Html Msg
    myEasyButton
      = easyButton myButtonModifiers []
        DoSomethingElse
        "Click me!"
-}
easyButton : ButtonModifiers -> Attrs msg -> msg -> String -> Button msg
easyButton mods attrs msg str
  = button mods
    (onClick msg :: attrs)
    [ text str ]

-- WITH ICON --

{-| 
    import Bulma.Icon exposing (icon,check)
    import Bulma.Modifiers exposing (Size(Small))

    type Msg = SaveMsg

    myIconButton : Html Msg
    myIconButton
      = let myIcon : Html Msg
            myIcon = icon Small [] [ check ] 
        in iconButton 
           myButtonModifiers 
           myIcon 
           [ SaveMsg ]
           [ text "Save" ]
-}
iconButton : ButtonModifiers -> Icon msg -> Attrs msg -> Htmls msg -> Button msg
iconButton mods icon attrs htmls
  = button mods attrs <| icon :: htmls
    
{-| -}
staticIconButton : ButtonModifiers -> Icon msg -> Attrs msg -> Htmls msg -> Button msg
staticIconButton mods icon = iconButton mods icon << (::) (class bulma.button.style.isStatic)

{-| -}
easyIconButton : ButtonModifiers -> Icon msg -> Attrs msg -> msg -> String -> Button msg
easyIconButton mods icon attrs msg str
  = button mods (onClick msg :: attrs)
    [ icon 
    , span [] [ text str ]
    ]

-- GROUP --

{-| -}
type alias ButtonGroup msg = Html msg

{-| 
    import Bulma.Modifiers exposing (HorizontalAlignment(Centered))
    
    myButtonGroup : Html msg
    myButtonGroup 
      = buttonGroup Centered []
        [ control [] 
          [ myFirstButton 
          ]
        , control [] 
          [ mySecondButton 
          ]
        ]
-}
buttonGroup : HorizontalAlignment -> Attrs msg -> List (Control msg) -> ButtonGroup msg
buttonGroup alignment
  = node "div" []
    [ bulma.field.container
    , case alignment of
        Left     -> bulma.field.isGrouped.left
        Centered -> bulma.field.isGrouped.centered
        Right    -> bulma.field.isGrouped.right
    ]

{-| Just like `buttonGroup`, but all the buttons are joined together.
This uses Bulma's "has-addons" class.
-}
connectedButtonGroup : HorizontalAlignment -> Attrs msg -> List (Control msg) -> ButtonGroup msg
connectedButtonGroup alignment
  = node "div" [] [ bulma.field.container
                  , case alignment of
                      Left     -> bulma.field.hasAddons.left
                      Centered -> bulma.field.hasAddons.centered
                      Right    -> bulma.field.hasAddons.right
                  ]

-- MODIFIERS --

{-| -}
type alias ButtonModifiers = { disabled : Bool
                             , outlined : Bool
                             , inverted : Bool
                             , size     : Size
                             , state    : State
                             , color    : Color
                             }

{-| The basic defaults for buttons.

    import Bulma.Modifiers exposing ( State(Blur) 
                                    , Color(Default)
                                    , Size(Normal)
                                    )
                                   
    myButtonModifiers : ButtonModifiers
    myButtonModifiers 
      = { disabled = False
        , outlined = False
        , inverted = False
        , size     = Normal
        , state    = Blur
        , color    = Default
        }
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

{-| -}
type alias Content msg = Html msg

{-| A single class to handle WYSIWYG-generated content, where only HTML tags are available.

    import Bulma.Modifiers exposing (Size(Normal))

    myContent : Html msg
    myContent
      = content Normal []
        [ p [] [ text "Lorem ipsum..." ] 
        ]
        
It can handle almost any HTML element, including:
- `p`
- `ul` / `ol` / `dl`
- `h1` through `h6`
- `blockquote`
- `em` & `strong`
- `table`, `tr`, `th`, and `td` tables
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


-- DELETE ----------------------------------------------------------------------

{-| -}
type alias Delete msg = Html msg

{-| Versatile delete cross.
-}
delete : Attrs msg -> Htmls msg -> Delete msg
delete = node "a" [] [ bulma.delete.ui ]

{-| 
    type Msg = DeleteMsg

    myEasyDelete : Html Msg
    myEasyDelete
      = easyDelete [] DeleteMsg
-}
easyDelete : Attrs msg -> msg -> Delete msg
easyDelete attrs msg = delete (onClick msg :: attrs) []


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


-- IMAGE -----------------------------------------------------------------------

{-| TODO
-}
type alias Image msg = Html msg

{-| TODO
-}
type alias ImageModifiers = { size        : Maybe ImageSize
                            , aspectRatio : Maybe ImageAspectRatio
                            }

{-| TODO
-}
type ImageSize = X16
               | X24
               | X32
               | X48
               | X64
               | X96
               | X128

{-| TODO
-}
type ImageAspectRatio = OneByOne
                      | FourByThree
                      | ThreeByTwo
                      | SixteenByNine
                      | TwoByOne

{-| TODO
-}
imageModifiers : ImageModifiers
imageModifiers = { size        = Nothing
                 , aspectRatio = Nothing
                 }

{-| TODO
-}
image : ImageModifiers -> Attrs msg -> Htmls msg -> Image msg
image {size,aspectRatio}
  = node "figure" []
    [ bulma.image.container
    , case size of
        Just X16  -> bulma.image.size.is16x16
        Just X24  -> bulma.image.size.is24x24
        Just X32  -> bulma.image.size.is32x32
        Just X48  -> bulma.image.size.is48x48
        Just X64  -> bulma.image.size.is64x64
        Just X96  -> bulma.image.size.is96x96
        Just X128 -> bulma.image.size.is128x128
        _         -> ""
    , case aspectRatio of
        Just OneByOne      -> bulma.image.size.is1by1
        Just FourByThree   -> bulma.image.size.is4by3
        Just ThreeByTwo    -> bulma.image.size.is3by2
        Just SixteenByNine -> bulma.image.size.is16by9
        Just TwoByOne      -> bulma.image.size.is2by1
        _                  -> ""
    ]

{-| TODO
-}
easyImage : ImageModifiers -> Attrs msg -> String -> Image msg
easyImage mods attrs src = image mods attrs [ img [ Attr.src src ] [] ]

-- easyLinkedImage : Attrs msg -> msg -> String -> Image msg


-- NOTIFICATION ----------------------------------------------------------------

{-| TODO
-}
type alias Notification msg = Html msg

{-| TODO
-}
notification : Color -> Attrs msg -> Htmls msg -> Notification msg
notification color
  = node "div" []
    [ bulma.notification.ui
    , case color of
        Default -> ""
        White   -> bulma.notification.color.isWhite
        Light   -> bulma.notification.color.isLight
        Dark    -> bulma.notification.color.isDark
        Black   -> bulma.notification.color.isBlack
        Primary -> bulma.notification.color.isPrimary
        Info    -> bulma.notification.color.isInfo
        Success -> bulma.notification.color.isSuccess
        Warning -> bulma.notification.color.isWarning
        Danger  -> bulma.notification.color.isDanger
    ]

{-| TODO
-}
notificationWithDelete : Color -> Attrs msg -> msg -> Htmls msg -> Notification msg
notificationWithDelete color attrs msg
  = notification color attrs << (::) (easyDelete [] msg)


-- PROGRESS --------------------------------------------------------------------

{-| TODO
-}
type alias Progress msg = Html msg

{-| TODO
-}
type alias ProgressModifiers = { size  : Size
                               , color : Color
                               } 

{-| TODO
-}
progressModifiers : ProgressModifiers
progressModifiers = { size  = Normal
                    , color = Default
                    } 

{-| TODO
-}
progress : ProgressModifiers -> Attrs msg -> Htmls msg -> Progress msg
progress {size,color}
  = node "progress" [] 
    [ bulma.progress.ui
    , case size of
        Small  -> bulma.progress.size.isSmall
        Normal -> ""
        Medium -> bulma.progress.size.isMedium
        Large  -> bulma.progress.size.isLarge
    , case color of
        Default -> ""
        White   -> bulma.progress.color.isWhite
        Light   -> bulma.progress.color.isLight
        Dark    -> bulma.progress.color.isDark
        Black   -> bulma.progress.color.isBlack
        Primary -> bulma.progress.color.isPrimary
        Info    -> bulma.progress.color.isInfo
        Success -> bulma.progress.color.isSuccess
        Warning -> bulma.progress.color.isWarning
        Danger  -> bulma.progress.color.isDanger
    ]

{-| TODO
-}
easyProgress : ProgressModifiers -> Attrs msg -> Float -> Progress msg
easyProgress mods attrs val
  = progress mods (Attr.value (toString (round (val * 100))) :: attrs) []


-- TABLE -----------------------------------------------------------------------

{-| TODO
-}
type alias Table msg = Html msg

{-| TODO
-}
type alias TableModifiers = { bordered : Bool
                            , striped  : Bool
                            , narrow   : Bool
                            }

{-| TODO
-}
tableModifiers : TableModifiers
tableModifiers = { bordered = False
                 , striped  = False
                 , narrow   = False
                 }

{-| TODO
-}
table : TableModifiers -> Attrs msg -> List (TablePartition msg) -> Table msg
table {bordered,striped,narrow}
  = node "table" []
    [ bulma.table.container
    , case bordered of
        True  -> bulma.table.style.isBordered
        False -> ""
    , case striped of
        True  -> bulma.table.style.isStriped
        False -> ""
    , case narrow of
        True  -> bulma.table.spacing.isNarrow
        False -> ""
    ]


-- TABLE PARTITIONS --

{-| TODO
-}
type alias TablePartition msg = Html msg

{-| TODO
-}
tableHead : Attrs msg -> List (TableRow msg) -> TablePartition msg
tableHead = node "thead" [] []

{-| TODO
-}
tableBody : Attrs msg -> List (TableRow msg) -> TablePartition msg
tableBody = node "tbody" [] []

{-| TODO
-}
tableFoot : Attrs msg -> List (TableRow msg) -> TablePartition msg
tableFoot = node "tfoot" [] []


-- TABLE ROW --

{-| TODO
-}
type alias TableRow msg = Html msg

{-| TODO
-}
type alias IsHighlighted = Bool

{-| TODO
-}
tableRow : IsHighlighted -> Attrs msg -> List (TableCell msg) -> TableRow msg
tableRow highlighted
  = node "tr" []
    [ case highlighted of
        True  -> bulma.table.row.state.isSelected
        False -> bulma.table.row.state.isSelected
    ]


-- TABLE CELLS --

{-| TODO
-}
type alias TableCell msg = Html msg

{-| TODO
-}
tableCell : Attrs msg -> Htmls msg -> TableCell msg
tableCell = node "td" [] []

{-| TODO
-}
tableCellHead : Attrs msg -> Htmls msg -> TableCell msg
tableCellHead = node "th" [] []


-- TAG -------------------------------------------------------------------------

{-| TODO
-}
type alias Tag msg = Html msg

{-| TODO
-}
type alias TagModifiers = { size  : Size
                          , color : Color
                          }

{-| TODO
-}
tagModifiers : TagModifiers
tagModifiers = { size  = Normal
               , color = Default
               } 

{-| TODO
-}
tag : TagModifiers -> Attrs msg -> Htmls msg -> Tag msg
tag {size,color}
  = node "span" []
    [ bulma.tag.ui
    , case size of
        Small  -> "" -- KLUDGE
        Normal -> ""
        Medium -> bulma.tag.size.isMedium
        Large  -> bulma.tag.size.isLarge
    , case color of
        Default -> ""
        White   -> bulma.tag.color.isWhite
        Light   -> bulma.tag.color.isLight
        Dark    -> bulma.tag.color.isDark
        Black   -> bulma.tag.color.isBlack
        Primary -> bulma.tag.color.isPrimary
        Info    -> bulma.tag.color.isInfo
        Success -> bulma.tag.color.isSuccess
        Warning -> bulma.tag.color.isWarning
        Danger  -> bulma.tag.color.isDanger
    ]

{-| TODO
-}
easyTag : TagModifiers -> Attrs msg -> String -> Tag msg
easyTag mods attrs = text >> ls >> tag mods attrs 

{-| TODO
-}
tagWithDelete : TagModifiers -> Attrs msg -> msg -> Htmls msg -> Tag msg
tagWithDelete mods attrs msg
  = flip (++) [ easyDelete [] msg ] >> tag mods attrs

{-| TODO
-}
easyTagWithDelete : TagModifiers -> Attrs msg -> msg -> String -> Tag msg
easyTagWithDelete mods attrs msg str
  = tag mods attrs [ text str, easyDelete [] msg ]


-- TITLE -----------------------------------------------------------------------

{-| TODO
-}
type alias Title msg = Html msg

{-| TODO
-}
type TitleSize = H1
               | H2
               | H3
               | H4
               | H5
               | H6

{-| TODO
-}
title : TitleSize -> Attrs msg -> Htmls msg -> Title msg
title size
  = node "p" []
    [ bulma.heading.title
    , case size of
        H1 -> bulma.heading.size.is1
        H2 -> bulma.heading.size.is2
        H3 -> bulma.heading.size.is3
        H4 -> bulma.heading.size.is4
        H5 -> bulma.heading.size.is5
        H6 -> bulma.heading.size.is6
    ]


-- SUBTITLE --

{-| TODO
-}
subtitle : TitleSize -> Attrs msg -> Htmls msg -> Title msg
subtitle size
  = node "p" [] 
    [ bulma.heading.subtitle
    , case size of
        H1 -> bulma.heading.size.is1
        H2 -> bulma.heading.size.is2
        H3 -> bulma.heading.size.is3
        H4 -> bulma.heading.size.is4
        H5 -> bulma.heading.size.is5
        H6 -> bulma.heading.size.is6
    ]


-- TITLE PAIR --

{-| TODO
-}
type alias TitleSpacing = Bool

{-| TODO
-}
easyTitleWithSubtitle : TitleSpacing -> TitleSize -> Htmls msg -> Htmls msg -> List (Title msg)
easyTitleWithSubtitle spacing size title subtitle
  = [ node "p" []
      [ bulma.heading.title
      , case spacing of
          True  -> bulma.heading.spacing.isNormal
          False -> ""
      , case size of
          H1 -> bulma.heading.size.is1
          H2 -> bulma.heading.size.is2
          H3 -> bulma.heading.size.is3
          H4 -> bulma.heading.size.is4
          H5 -> bulma.heading.size.is5
          H6 -> bulma.heading.size.is6
      ]
      [
      ]
      title
    , node "p" [] 
      [ bulma.heading.subtitle
      , case size of
          H1 -> bulma.heading.size.is3
          H2 -> bulma.heading.size.is4
          H3 -> bulma.heading.size.is5
          _  -> bulma.heading.size.is6
      ]
      [
      ]
      subtitle
    ]

