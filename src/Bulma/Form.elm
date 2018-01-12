
module Bulma.Form exposing (..)

-- TODO: double-check that all the features here work correctly
-- TODO: update inputs
-- TODO: update textarea
-- TODO: update dropdowns

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Field](#field)
  - [Control](#control)
    - [Button](#button)
    - [Input](#input)
    - [Select](#select)
    - [Label](#label)
    - [CheckBox](#button)
    - [Radio](#radio)
    - [Help](#help)
    - [File](#file)
  - [Field Group](#field-group)

# Field
@docs Field
@docs field

## Control
@docs Control, ControlModifiers, controlModifiers
@docs control

### Button
@docs Button, ButtonModifiers, buttonModifiers
@docs controlButton
@docs button, easyButton

### Input
@docs ControlInputModifiers, controlInputModifiers
@docs controlInput
@docs controlText, controlPassword, controlEmail, controlPhone
@docs controlTextArea

### Select
@docs Option
@docs controlSelect
@docs controlMultiselect

### Label
@docs controlLabel 
@docs label

### CheckBox
@docs controlCheckBox 

### Radio
@docs RadioButton
@docs controlRadio, controlRadioButton 

### Help
@docs controlHelp
@docs help

### File
Coming Soon!

## Field Group
@docs fieldGroup, connectedFieldGroup
@docs multilineFieldGroup
@docs horizontalFieldGroup

### Horizontal Field Partition
@docs HorizontalFieldPartition
@docs fieldLabel, fieldBody
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

{-| -}
type alias Field msg = Html msg

{-| Fields are containers for Controls.
Usually this will be a single `control`, with optional an `label` and `help`.

    import Bulma.Form exposing ( field
                               , label
                               , controlInput
                               , controlModifiers
                               , help
                               )

    myField : Html msg
    myField
      = field []
        [ controlLabel [] []
        , controlInput myControlInputModifiers [] [] [] 
        , controlHelp myControlModifiers [] []
        ]
-}
field : Attrs msg -> List (Control msg) -> Field msg
field = node "div" [] [ bulma.field.container ]


-- FIELD GROUPS --

{-| This is a container for gluing controls together on the same line. 
This variation will leave spaces between each control.

    myFieldGroup : Html msg
    myFieldGroup
      = fieldGroup Right []
        [ controlInput myControlInputModifiers [] [] [] 
        , control myControlModifiers []
          [ button myButtonModifiers [] []
          ]
        ]
-}
fieldGroup : HorizontalAlignment -> Attrs msg -> List (Control msg) -> Field msg
fieldGroup alignment
  = node "div" []
    [ bulma.field.container
    , case alignment of
        Left     -> bulma.field.hasAddons.left
        Centered -> bulma.field.hasAddons.centered
        Right    -> bulma.field.hasAddons.right
    ]

{-| This is a container for gluing controls together on the same line. 
This variation will connect them as "addons".

    myFieldGroup : Html msg
    myFieldGroup
      = fieldGroup Centered []
        [ controlInput myControlInputModifiers [] [] [] 
        , control myControlModifiers []
          [ button myButtonModifiers [] []
          ]
        ]
-}
connectedFieldGroup : HorizontalAlignment -> Attrs msg -> List (Control msg) -> Field msg
connectedFieldGroup alignment
  = node "div" []
    [ bulma.field.container
    , case alignment of
        Left     -> bulma.field.isGrouped.left
        Centered -> bulma.field.isGrouped.centered
        Right    -> bulma.field.isGrouped.right
    ]

{-| This is a container for gluing controls together when you expect it to take up multiple lines.

    myControlButton : String -> Html msg
    myControlButton buttonText
      = control myControlModifiers []
        [ button myButtonModifiers []
          [ text buttonText ]
        ]

    myFieldGroup : Html msg
    myFieldGroup
      = multilineFieldGroup []
     <| List.map myControlButton
     <| List.map toString
     <| List.range 0 10
-}
multilineFieldGroup : Attrs msg -> List (Control msg) -> Field msg
multilineFieldGroup
  = node "div" []
    [ bulma.field.container
    , "is-grouped-multiline"
      -- KLUDGE: add this to BulmaClasses
    ]

{-| The `horizontalFieldGroup` expects a `fieldLabel` and a `fieldBody`.

    import Bulma.Modifiers exposing (Size(Normal))

    myFieldGroup : Html msg
    myFieldGroup
      = horizontalFieldGroup []
        [ fieldLabel Normal []
          [ label [] 
            [ text "name"
            ]
          ]
        , fieldBody []
          [ field []
            [ controlInput myControlInputModifiers [] [] [] 
            ]
          , field []
            [ controlInput myControlInputModifiers [] [] [] 
            ]
          ]
        ]
-}
horizontalFieldGroup : Attrs msg -> List (HorizontalFieldPartition msg) -> Field msg
horizontalFieldGroup
  = node "div" []
    [ bulma.field.container
    , bulma.field.layout.isHorizontal
    ]


-- HORIZONTAL FIELD PARTITION --

{-| -}
type alias HorizontalFieldPartition msg = Html msg

{-| `fieldLabel` expects a Bulma label element.

    import Bulma.Modifiers exposing (Size(Large))
    import Bulma.Form exposing ( label
                               , fieldLabel
                               )

    myFieldLabel : Html msg
    myFieldLabel
      = fieldLabel Large []
        [ label [] 
          [ text "Email?"
          ]
        ]
-}
fieldLabel : Size -> Attrs msg -> List (Control msg) -> HorizontalFieldPartition msg
fieldLabel size
  = node "div" []
    [ bulma.field.label
    , case size of
        Small  -> bulma.label.size.isSmall
        Normal -> ""
        Medium -> bulma.label.size.isMedium
        Large  -> bulma.label.size.isLarge
    ]

-- TODO: easyFieldLabel

{-| 
    myFieldBody : Html msg
    myFieldBody
      = fieldBody []
        [ field []
          [ controlInput myControlInputModifiers [] [] [] 
          ]
        , field []
          [ controlInput myControlInputModifiers [] [] []
          ]
        ]
-}
fieldBody : Attrs msg -> List (Field msg) -> HorizontalFieldPartition msg
fieldBody = node "div" [] [ "field-body" ]


-- CONTROLS --

{-| -}
type alias ControlModifiers msg
  = { loading   : Maybe Size
    , expanded  : Bool
    , iconLeft  : Maybe (Size, Attrs msg, IconBody msg)
    , iconRight : Maybe (Size, Attrs msg, IconBody msg)
    }

{-| -}
controlModifiers : ControlModifiers msg
controlModifiers
  = { loading   = Nothing
    , expanded  = False
    , iconLeft  = Nothing
    , iconRight = Nothing
    }

{-| -}
type alias Control msg = Html msg

{-| Controls are containers for singlular form controls.
They can only contain the folling elements:
- `label` (for radio and checkbox)
- `input`
- `select`
- `button`
- `icon`

You really shouldn't need to use this function.
`controlLabel`, `controlButton`, `controlInput`, etc. should be everything you need.
-}
control : ControlModifiers msg -> Attrs msg -> Htmls msg -> Control msg
control {loading,expanded,iconLeft,iconRight} attrs htmls
  = node "p" []
    [ bulma.control.container
    , case loading of
        Just _  -> bulma.control.state.isLoading
        Nothing -> ""
    , case loading of
        Just Small  -> "is-small"
        Just Medium -> "is-medium"
        Just Large  -> "is-large"
        _           -> ""
        -- KLUDGE: add to BulmaClasses
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

{-| Just a simple label.

    myLabel : Html msg
    myLabel
      = label [] [ text "hi" ]
-}
label : Attrs msg -> Htmls msg -> Html msg
label = node "label" [] [ bulma.label.ui ]

{-| Secretly the same thing as a label. This is just for consistency's sake.

    myLabel : Html msg
    myLabel
      = controlLabel [] [ text "hello" ]
-}
controlLabel : Attrs msg -> Htmls msg -> Control msg
controlLabel 
  = label

{-| -}
type alias ControlInputModifiers msg
  = { size      : Size
    , state     : State
    , color     : Color
    , expanded  : Bool
    , iconLeft  : Maybe (Size, Attrs msg, IconBody msg)
    , iconRight : Maybe (Size, Attrs msg, IconBody msg)
    }

{-| -}
controlInputModifiers : ControlInputModifiers msg
controlInputModifiers 
  = { size      = Normal
    , state     = Blur
    , color     = Default
    , expanded  = False
    , iconLeft  = Nothing
    , iconRight = Nothing
    }

{-|
    type Msg = UpdateName String

    myInput : Html Msg
    myInput
      = let myControlAttrs : List (Attribute Msg)
            myControlAttrs = []
            myInputAttrs   : List (Attribute Msg)
            myInputAttrs   = [ onInput UpdateName 
                             , placeholder "Name"
                             ]

        in  controlInput myControlInputModifiers 
            myControlAttrs
            myInputAttrs
            []
-}
controlInput : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlInput ({size,state,color,expanded,iconLeft,iconRight} as mods) attrs attrs_
  = let controlMods : ControlModifiers msg
        controlMods
          = { expanded  = False
            , iconLeft  = Nothing
            , iconRight = Nothing
            , loading   = case state of
                            Loading -> Just size
                            _       -> Nothing
            }
    in control controlMods attrs
     << ls
     << node "input" []
       [ bulma.input.ui
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
       ]
       attrs_

{-| Just like `controlInput`, but with the `type="text"` attribute added to the input.
-}
controlText : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlText mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "text" :: attrs_

{-| Just like `controlInput`, but with the `type="password"` attribute added to the input.
-}
controlPassword : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlPassword mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "password" :: attrs_

{-| Just like `controlInput`, but with the `type="email"` attribute added to the input.
-}
controlEmail : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlEmail mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "email" :: attrs_

{-| Just like `controlInput`, but with the `type="tel"` attribute added to the input.
-}
controlPhone : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlPhone mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "tel" :: attrs_

{-| 
    type Msg = UpdateDesc String

    myTextArea : Html Msg
    myTextArea
      = let myControlAttrs  : List (Attribute Msg)
            myControlAttrs  = []
            myTextAreaAttrs : List (Attribute Msg)
            myTextAreaAttrs = [ onInput UpdateDesc
                              , placeholder "Description"
                              ]

        in  controlTextArea myControlInputModifiers 
            myControlAttrs
            myTextAreaAttrs
            []
-}
controlTextArea : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlTextArea ({size,state,color,expanded,iconLeft,iconRight} as mods) attrs attrs_
  = let controlMods : ControlModifiers msg
        controlMods
          = { expanded  = False
            , iconLeft  = Nothing
            , iconRight = Nothing
            , loading   = case state of
                            Loading -> Just size
                            _       -> Nothing
            }
    in control controlMods attrs
     << ls
     << node "textarea" []
       [ bulma.textarea.ui
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

{-| -}
type alias Option msg = Html msg

{-|
    type Msg = UpdateChoice String
    
    myOption : (String,String) -> Html msg
    myOption (key,val)
      = option [ value val ]
        [ text key
        ]

    mySelect : Html Msg
    mySelect
      = let myControlAttrs  : List (Attribute Msg)
            myControlAttrs  = []
            mySelectAttrs : List (Attribute Msg)
            mySelectAttrs = [ onInput UpdateChoice ]

        in  controlSelect myControlModifiers 
            myControlAttrs
            mySelectAttrs
        <|  List.map myOption
        <|  [ (   "grow", "eat me"   )
            , ( "shrink", "drink me" )
            ]
-}
controlSelect : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> List (Option msg) -> Control msg
controlSelect ({size,state,color,expanded,iconLeft,iconRight} as mods) attrs attrs_
  = let controlMods : ControlModifiers msg
        controlMods
          = { expanded  = False
            , iconLeft  = Nothing
            , iconRight = Nothing
            , loading   = case state of
                            Loading -> Just size
                            _       -> Nothing
            }
    in control controlMods attrs
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
           -- KLUDGE: add to BulmaClass
       ]
       attrs_

{-| Accepts options just like `controlSelect`, except it allows you to select multiple list items.
-}
controlMultiselect : ControlInputModifiers msg -> Attrs msg -> Attrs msg -> List (Option msg) -> Control msg
controlMultiselect mods attrs attrs_
  = controlSelect mods attrs
    <| class "is-multiple" :: attrs_
      -- KLUDGE: add to BulmaClasses

{-| 
    type Msg = UpdateChoice Bool
    
    myCheckBox : Html Msg
    myCheckBox
      = let myControlAttrs  : List (Attribute Msg)
            myControlAttrs  = []
            myLabelAttrs    : List (Attribute Msg)
            myLabelAttrs    = []
            myCheckBoxAttrs : List (Attribute Msg)
            myCheckBoxAttrs = [ onCheck UpdateChoice ]

        in  controlCheckBox
            myControlAttrs
            myLabelAttrs
            myCheckBoxAttrs
            [ text "I don't agree to the terms and conditions"
            ]
-}
controlCheckBox : Attrs msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlCheckBox attrs attrs_ attrs__ htmls
  = control controlModifiers attrs
  <| ls
  <| node "label" [ Attr.disabled False ] [ bulma.checkbox.ui ] attrs_
  <| node "input" [ Attr.disabled False ] [ bulma.checkbox.ui ] attrs__ []
 :: htmls

{-| -}
type alias RadioButton msg = Html msg

{-|
    type Msg = UpdateChoice String
    
    myRadio : Html Msg
    myRadio
      = let myControlAttrs : List (Attribute Msg)
            myControlAttrs = []
            myLabelAttrs   : List (Attribute Msg)
            myLabelAttrs   = []
            myRadioAttrs   : List (Attribute Msg)
            myRadioAttrs   = [ onInput UpdateChoice ]

        in  controlRadio myControlAttrs
            [ controlRadioButton "answer"
              myLabelAttrs
              (value "1" :: myRadioAttrs)
              [ text "yep" ]
            , controlRadioButton "answer"
              myLabelAttrs
              (value "0" :: myRadioAttrs)
              [ text "nope" ]
            ]
-}
controlRadio : Attrs msg -> Htmls msg -> Control msg
controlRadio
  = control controlModifiers

{-| -}
controlRadioButton : String -> Attrs msg -> Attrs msg -> Htmls msg -> RadioButton msg
controlRadioButton name attrs attrs_ htmls
  = let inputAttrs : List (Html.Attribute msg)
        inputAttrs
          = [ Attr.name name
            , Attr.type_ "radio"
            , Attr.disabled False
            ]
        labelAttrs : List (Html.Attribute msg)
        labelAttrs
          = [ Attr.disabled False
            ]
    in node "label" labelAttrs [ bulma.radio.ui ] attrs
     <| node "input" inputAttrs [                ] attrs_ []
       :: htmls

-- TODO: {-| TODO
-- TODO: -}
-- TODO: easyControlRadio : String -> ControlModifiers -> Attrs msg -> List (String, String -> msg, Htmls msg) -> Control msg
-- TODO: easyControlRadio name mods attrs controls

{-| 
    import Bulma.Modifiers exposing (Color(Danger))

    myHelp : Html msg
    myHelp
      = help Danger []
        [ text "This field is required."
        ]
-}
help : Color -> Attrs msg -> Htmls msg -> Html msg
help color
  = node "p" []
    [ bulma.help.ui
    , case color of
        Default -> ""
        White   -> bulma.help.color.isWhite
        Light   -> bulma.help.color.isLight
        Dark    -> bulma.help.color.isDark
        Black   -> bulma.help.color.isBlack
        Primary -> bulma.help.color.isPrimary
        Info    -> bulma.help.color.isInfo
        Success -> bulma.help.color.isSuccess
        Warning -> bulma.help.color.isWarning
        Danger  -> bulma.help.color.isDanger
    ]

{-| Secretly just `help`. Created this just for consistency.
-}
controlHelp : Color -> Attrs msg -> Htmls msg -> Control msg
controlHelp = help


-- FILE ------------------------------------------------------------------------

-- TODO: file


-- BUTTON ----------------------------------------------------------------------

-- TODO: consider moving back to Elements or Elements.Button
-- TODO: update button

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
button : ButtonModifiers msg -> Attrs msg -> Htmls msg -> Button msg
button {disabled,outlined,inverted,size,state,color,static,iconLeft,iconRight} attrs htmls
  = let htmls_ : Htmls msg
        htmls_ = iconLeft_ ++ htmls ++ iconRight_
        iconLeft_ : Htmls msg
        iconLeft_
          = case iconLeft of
              Just ( size, attrs, body ) -> [ icon size attrs [ body ] ]
              Nothing                    -> [                          ]
        iconRight_ : Htmls msg
        iconRight_
          = case iconRight of
              Just ( size, attrs, body ) -> [ icon size attrs [ body ] ]
              Nothing                    -> [                          ]
    in node "a" ( if disabled then [ Attr.disabled disabled ] else [] )
       [ bulma.button.ui
       , case static of
           True  -> bulma.button.style.isStatic
           False -> ""
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
       , case state of
           Blur    -> ""
           Hover   -> "is-hovered"
           Focus   -> "is-focused"
           Active  -> "is-active"
           Loading -> "is-loading"
           -- KLUDGE: add to BulmaClasses
       ]
       attrs
       htmls_
  
{-|
    type Msg = DoSomething
    
    myButton : Html Msg
    myButton
      = let myControlAttrs : List (Attribute Msg)
            myControlAttrs = []
            myButtonAttrs   : List (Attribute Msg)
            myButtonAttrs   = [ onClick DoSomething ]

        in  controlButton myButtonModifiers 
            myControlAttrs
            myButtonAttrs
            [ text "Click me!"
            ]
-}
controlButton : ButtonModifiers msg -> Attrs msg -> Attrs msg -> Htmls msg -> Control msg
controlButton mods attrs attrs_
  = control controlModifiers attrs
  << ls
  << button mods attrs_

{-| 
    type Msg = DoSomething
             | DoSomethingElse

    myEasyButton : Html Msg
    myEasyButton
      = easyButton myButtonModifiers []
        DoSomethingElse
        "Click me!"
-}
easyButton : ButtonModifiers msg -> Attrs msg -> msg -> String -> Button msg
easyButton mods attrs msg str
  = button mods
    (onClick msg :: attrs)
    [ text str ]

-- -- WITH ICON --

-- {-| 
--     import Bulma.Icon exposing (icon,check)
--     import Bulma.Modifiers exposing (Size(Small))

--     type Msg = SaveMsg

--     myIconButton : Html Msg
--     myIconButton
--       = let myIcon : Html Msg
--             myIcon = icon Small [] [ check ] 
--         in iconButton 
--            myButtonModifiers 
--            myIcon 
--            [ SaveMsg ]
--            [ text "Save" ]
-- -}
-- iconButton : ButtonModifiers msg -> Icon msg -> Attrs msg -> Htmls msg -> Button msg
-- iconButton mods icon attrs htmls
--   = button mods attrs <| icon :: htmls
    
-- {-| -}
-- staticIconButton : ButtonModifiers msg -> Icon msg -> Attrs msg -> Htmls msg -> Button msg
-- staticIconButton mods icon = iconButton mods icon << (::) (class bulma.button.style.isStatic)

-- {-| -}
-- easyIconButton : ButtonModifiers msg -> Icon msg -> Attrs msg -> msg -> String -> Button msg
-- easyIconButton mods icon attrs msg str
--   = button mods (onClick msg :: attrs)
--     [ icon 
--     , span [] [ text str ]
--     ]

-- MODIFIERS --

{-| -}
type alias ButtonModifiers msg
  = { disabled  : Bool
    , outlined  : Bool
    , inverted  : Bool
    , static    : Bool
    , size      : Size
    , state     : State
    , color     : Color
    , iconLeft  : Maybe (Size, Attrs msg, IconBody msg)
    , iconRight : Maybe (Size, Attrs msg, IconBody msg)
    }

{-| The basic defaults for buttons.

    import Bulma.Modifiers exposing ( State(Blur) 
                                    , Color(Default)
                                    , Size(Normal)
                                    )
                                   
    myButtonModifiers : ButtonModifiers msg
    myButtonModifiers 
      = { disabled = False
        , outlined = False
        , inverted = False
        , size     = Normal
        , state    = Blur
        , color    = Default
        }
-}
buttonModifiers : ButtonModifiers msg
buttonModifiers = { disabled  = False
                  , outlined  = False
                  , inverted  = False
                  , static    = False
                  , size      = Normal
                  , state     = Blur
                  , color     = Default
                  , iconLeft  = Nothing
                  , iconRight = Nothing
                  }

