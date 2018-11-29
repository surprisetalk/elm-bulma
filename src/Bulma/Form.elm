
module Bulma.Form exposing
  ( Field
  , field
  , Control
  , ControlModifiers
  , controlModifiers
  , control
  , controlInput
  , ControlInputModifiers
  , controlInputModifiers
  , controlText
  , controlPassword
  , controlEmail
  , controlPhone
  , ControlTextAreaModifiers
  , controlTextAreaModifiers
  , controlTextArea
  , ControlSelectModifiers
  , controlSelectModifiers
  , Option
  , controlSelect
  , controlSelectRounded
  , controlMultiselect
  , controlLabel 
  , label
  , controlCheckBox 
  , IsChecked
  , IsDisabled
  , RadioButton
  , controlRadio
  , controlRadioButton 
  , controlButton
  , controlHelp
  , help
  , fields
  , connectedFields
  , multilineFields
  , horizontalFields
  , HorizontalFieldPartition
  , fieldLabel
  , fieldBody
  )

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Aliases](#aliases)
- [Field](#field)
  - [Control](#control)
    - [Input](#input)
    - [TextArea](#textarea)
    - [Select](#select)
    - [Label](#label)
    - [CheckBox](#button)
    - [Radio](#radio)
    - [Help](#help)
    - [Button](#button)
    - [File](#file)
  - [Fields](#fields)

# Aliases
@docs IsDisabled

# Field
@docs Field
@docs field

## Control
@docs Control, ControlModifiers, controlModifiers
@docs control

### Input
@docs ControlInputModifiers, controlInputModifiers
@docs controlInput
@docs controlText, controlPassword, controlEmail, controlPhone

### TextArea
@docs ControlTextAreaModifiers, controlTextAreaModifiers
@docs controlTextArea

### Select
@docs ControlSelectModifiers, controlSelectModifiers
@docs Option
@docs controlSelect, controlSelectRounded
@docs controlMultiselect

### Label
@docs controlLabel 
@docs label

### CheckBox
@docs controlCheckBox 

### Radio
@docs IsChecked
@docs RadioButton
@docs controlRadio, controlRadioButton 

### Button
@docs controlButton

### Help
@docs controlHelp
@docs help

### File
Coming Soon!

## Fields
@docs fields, connectedFields
@docs multilineFields
@docs horizontalFields

### Horizontal Field Partition
@docs HorizontalFieldPartition
@docs fieldLabel, fieldBody
-}


-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import Bulma.Classes as B

import Bulma.Modifiers as Modifiers exposing (..)

import Bulma.Elements exposing ( ButtonModifiers, button, IconBody, icon )

import Html exposing ( Html, Attribute, text, div, a, img, span )
import Html.Attributes as Attr exposing ( class, readonly, disabled )

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
        , controlHelp Default [] []
        ]
-}
field : List (Attribute msg) -> List (Control msg) -> Field msg
field = node "div" [ B.field ]


-- FIELD GROUPS --

{-| This is a container for gluing controls together on the same line. 
This variation will leave spaces between each control.

    myFields : Html msg
    myFields
      = fields Right []
        [ controlInput myControlInputModifiers [] [] [] 
        , control myControlModifiers []
          [ button myButtonModifiers [] []
          ]
        ]
-}
fields : HorizontalAlignment -> List (Attribute msg) -> List (Control msg) -> Field msg
fields alignment
  = node "div"
    [ B.field
    , B.isGrouped
    , case alignment of
        Left     -> B.none
        Centered -> B.isGroupedCentered
        Right    -> B.isGroupedRight
    ]

{-| This is a container for gluing controls together on the same line. 
This variation will connect them as "addons".

    myFields : Html msg
    myFields
      = connectedFields Centered []
        [ controlInput myControlInputModifiers [] [] [] 
        , control myControlModifiers []
          [ button myButtonModifiers [] []
          ]
        ]
-}
connectedFields : HorizontalAlignment -> List (Attribute msg) -> List (Control msg) -> Field msg
connectedFields alignment
  = node "div"
    [ B.field
    , B.hasAddons
    , case alignment of
        Left     -> B.none
        Centered -> B.hasAddonsCentered
        Right    -> B.hasAddonsRight
    ]

{-| This is a container for gluing controls together when you expect it to take up multiple lines.

    myControlButton : String -> Html msg
    myControlButton buttonText
      = control myControlModifiers []
        [ button myButtonModifiers []
          [ text buttonText ]
        ]

    myFields : Html msg
    myFields
      = multilineFields []
     <| List.map myControlButton
     <| List.map toString
     <| List.range 0 10
-}
multilineFields : List (Attribute msg) -> List (Control msg) -> Field msg
multilineFields
  = node "div"
    [ B.field
    , B.isGrouped
      -- TODO: addon tags want both, but should we always have both?
    , B.isGroupedMultiline
    ]

{-| The `horizontalFields` expects a `fieldLabel` and a `fieldBody`.

    import B.Modifiers exposing (Size(Standard))

    myFields : Html msg
    myFields
      = horizontalFields []
        [ fieldLabel Standard []
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
horizontalFields : List (Attribute msg) -> List (HorizontalFieldPartition msg) -> Field msg
horizontalFields
  = node "div"
    [ B.field
    , B.isHorizontal
    ]


-- HORIZONTAL FIELD PARTITION --

{-| -}
type alias HorizontalFieldPartition msg = Html msg

{-| `fieldLabel` expects a Bulma label element.

    import B.Modifiers exposing (Size(Large))
    import B.Form exposing ( label
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
fieldLabel : Size -> List (Attribute msg) -> List (Control msg) -> HorizontalFieldPartition msg
fieldLabel size
  = node "div"
    [ B.fieldLabel
    , case size of
        Small    -> B.isSmall
        Standard -> B.none
        Medium   -> B.isMedium
        Large    -> B.isLarge
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
fieldBody : List (Attribute msg) -> List (Field msg) -> HorizontalFieldPartition msg
fieldBody = node "div" [ B.fieldBody ]


-- CONTROLS --

{-| -}
type alias ControlModifiers msg
  = { loading   : Maybe Size
    , expanded  : Bool
    , iconLeft  : Maybe (Size, List (Attribute msg), IconBody msg)
    , iconRight : Maybe (Size, List (Attribute msg), IconBody msg)
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
control : ControlModifiers msg -> List (Attribute msg) -> List (Html msg) -> Control msg
control {loading,expanded,iconLeft,iconRight} attrs htmls
  = node "p"
    [ B.control
    , case loading of
        Just _  -> B.isLoading
        Nothing -> B.none
    , case loading of
        Just Small  -> B.isSmall
        Just Medium -> B.isMedium
        Just Large  -> B.isLarge
        _           -> B.none
    , case expanded of
        True  -> B.isExpanded
        False -> B.none
    , case iconLeft of
        Just  _ -> B.hasIconsLeft
        Nothing -> B.none
    , case iconRight of
        Just  _ -> B.hasIconsRight
        Nothing -> B.none
    ]
    attrs
  <| htmls
 ++ ( iconLeft
    |> Maybe.map (\(size_, attrs_, iconBody) -> [ icon size_ (class "is-left"  :: attrs_) [ iconBody ] ])
    |> Maybe.withDefault []
    )
 ++ ( iconRight
    |> Maybe.map (\(size_, attrs_, iconBody) -> [ icon size_ (class "is-right" :: attrs_) [ iconBody ] ])
    |> Maybe.withDefault []
    )
 ++ [
    ]

{-| Just a simple label.

    myLabel : Html msg
    myLabel
      = label [] [ text "hi" ]
-}
label : List (Attribute msg) -> List (Html msg) -> Html msg
label = node "label" [ B.label ]

{-| Secretly the same thing as a label. This is just for consistency's sake.

    myLabel : Html msg
    myLabel
      = controlLabel [] [ text "hello" ]
-}
controlLabel : List (Attribute msg) -> List (Html msg) -> Control msg
controlLabel 
  = label

{-| -}
type alias ControlInputModifiers msg
  = { size      : Size
    , state     : State
    , color     : Color
    , expanded  : Bool
    , rounded   : Bool
    , readonly  : Bool
    , disabled  : Bool
    , iconLeft  : Maybe (Size, List (Attribute msg), IconBody msg)
    , iconRight : Maybe (Size, List (Attribute msg), IconBody msg)
    }

{-| -}
controlInputModifiers : ControlInputModifiers msg
controlInputModifiers 
-- TODO: placeholder?
  = { size      = Standard
    , state     = Blur
    , color     = Default
    , expanded  = False
    , rounded   = False
    , readonly  = False
    , disabled  = False
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
controlInput : ControlInputModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlInput ({size,state,color,expanded,rounded,readonly,disabled,iconLeft,iconRight} as mods) attrs attrs_
  = let controlMods : ControlModifiers msg
        controlMods
          = { expanded  = expanded
            , iconLeft  = iconLeft
            , iconRight = iconRight
            , loading   = case state of
                            Loading -> Just size
                            _       -> Nothing
            }
    in control controlMods attrs
     << ls
     << node "input"
       [ B.input
       , Attr.disabled disabled
       , case readonly of
           True  -> Attr.readonly readonly
           False -> B.none
       , case size of
           Small    -> B.isSmall
           Standard -> B.none
           Medium   -> B.isMedium
           Large    -> B.isLarge
       , case state of
           Hover   -> B.isHovered
           Focus   -> B.isFocused
           Active  -> B.isActive
           Loading -> B.isLoading
           _       -> B.none
       , case color of
           Default -> B.none
           White   -> B.isWhite
           Light   -> B.isLight
           Dark    -> B.isDark
           Black   -> B.isBlack
           Primary -> B.isPrimary
           Info    -> B.isInfo
           Success -> B.isSuccess
           Warning -> B.isWarning
           Danger  -> B.isDanger
           Link    -> B.isLink
       , case rounded of
           False   -> B.none
           True    -> B.isRounded
       ]
       attrs_

{-| Just like `controlInput`, but with the `type="text"` attribute added to the input.
-}
controlText : ControlInputModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlText mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "text" :: attrs_

{-| Just like `controlInput`, but with the `type="password"` attribute added to the input.
-}
controlPassword : ControlInputModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlPassword mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "password" :: attrs_

{-| Just like `controlInput`, but with the `type="email"` attribute added to the input.
-}
controlEmail : ControlInputModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlEmail mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "email" :: attrs_

{-| Just like `controlInput`, but with the `type="tel"` attribute added to the input.
-}
controlPhone : ControlInputModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlPhone mods attrs attrs_
  = controlInput mods attrs
    <| Attr.type_ "tel" :: attrs_

{-| -}
type alias ControlTextAreaModifiers
  = { size      : Size
    , state     : State
    , color     : Color
    , readonly  : Bool
    , disabled  : Bool
    }

{-| -}
controlTextAreaModifiers : ControlTextAreaModifiers
controlTextAreaModifiers 
  = { size      = Standard
    , state     = Blur
    , color     = Default
    , readonly  = False
    , disabled  = False
    }

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

        in  controlTextArea myControlTextAreaModifiers 
            myControlAttrs
            myTextAreaAttrs
            []
-}
controlTextArea : ControlTextAreaModifiers -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlTextArea ({size,state,color,readonly,disabled} as mods) attrs attrs_
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
     << node "textarea"
       [ B.textarea
       , Attr.disabled disabled
       , case readonly of
           True  -> Attr.readonly readonly
           False -> B.none
       , case size of
           Small    -> B.isSmall
           Standard -> B.none
           Medium   -> B.isMedium
           Large    -> B.isLarge
       , case state of
           Hover   -> B.isHovered
           Focus   -> B.isFocused
           Active  -> B.isActive
           Loading -> B.isLoading
           _       -> B.none
       , case color of
           Default -> B.none
           White   -> B.isWhite
           Light   -> B.isLight
           Dark    -> B.isDark
           Black   -> B.isBlack
           Primary -> B.isPrimary
           Info    -> B.isInfo
           Success -> B.isSuccess
           Warning -> B.isWarning
           Danger  -> B.isDanger
           Link    -> B.isLink
       ]
       attrs_

{-| -}
type alias Option msg = Html msg

{-| -}
type alias ControlSelectModifiers msg
  = { size      : Size
    , state     : State
    , color     : Color
    , expanded  : Bool
    , iconLeft  : Maybe (Size, List (Attribute msg), IconBody msg)
    }

{-| -}
controlSelectModifiers : ControlSelectModifiers msg
controlSelectModifiers 
  = { size      = Standard
    , state     = Blur
    , color     = Default
    , expanded  = False
    , iconLeft  = Nothing
    }

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
controlSelect : ControlSelectModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Option msg) -> Control msg
controlSelect ({size,state,color,expanded,iconLeft} as mods) attrs attrs_
  = let controlMods : ControlModifiers msg
        controlMods
          = { expanded  = expanded
            , iconLeft  = iconLeft
            , iconRight = Nothing
            , loading   = case state of
                            Loading -> Just size
                            _       -> Nothing
            }
    in control controlMods attrs
     << ls
     << node "span" [ B.select ] []
     << ls
     << node "select"
       [ case size of
           Small    -> B.isSmall
           Standard -> B.none
           Medium   -> B.isMedium
           Large    -> B.isLarge
       , case state of
           Hover   -> B.isHovered
           Focus   -> B.isFocused
           Active  -> B.isActive
           Loading -> B.isLoading
           _       -> B.none
       , case color of
           Default -> B.none
           White   -> B.isWhite
           Light   -> B.isLight
           Dark    -> B.isDark
           Black   -> B.isBlack
           Primary -> B.isPrimary
           Info    -> B.isInfo
           Success -> B.isSuccess
           Warning -> B.isWarning
           Danger  -> B.isDanger
           Link    -> B.isLink
       , case expanded of
           True    -> B.isFullWidth
           False   -> B.none
       ]
       attrs_

{-| A rounded variation of `controlSelect`.
-}
controlSelectRounded : ControlSelectModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlSelectRounded mods attrs attrs_
  = controlSelect mods attrs
    <| class "is-rounded" :: attrs_

{-| Accepts options just like `controlSelect`, except it allows you to select multiple list items.
-}
controlMultiselect : ControlSelectModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Option msg) -> Control msg
controlMultiselect mods attrs attrs_
  = controlSelect mods attrs
    <| class "is-multiple" :: attrs_
      -- KLUDGE: add to BulmaClasses

{-|
-}
type alias IsDisabled
  = Bool

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

        in  controlCheckBox False
            myControlAttrs
            myLabelAttrs
            myCheckBoxAttrs
            [ text "I don't agree to the terms and conditions"
            ]
-}
controlCheckBox : IsDisabled -> List (Attribute msg) -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlCheckBox disabled attrs attrs_ attrs__ htmls
  = control controlModifiers attrs
  <| ls
  <| node "label" [ Attr.disabled disabled, B.checkbox            ] attrs_
  <| node "input" [ Attr.disabled disabled, Attr.type_ "checkbox" ] attrs__ []
 :: (text " " :: htmls)
    -- KLUDGE: it looks much better with the space, but should we force that on the developer?

{-| -}
type alias IsChecked = Bool

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
            [ controlRadioButton False False "yes"
              myLabelAttrs
              (value "1" :: myRadioAttrs)
              [ text "yep" ]
            , controlRadioButton False True "no"
              myLabelAttrs
              (value "0" :: myRadioAttrs)
              [ text "nope" ]
            , controlRadioButton True False "maybe"
              myLabelAttrs
              (value "0" :: myRadioAttrs)
              [ text "uhh" ]
            ]
-}
controlRadio : List (Attribute msg) -> List (RadioButton msg) -> Control msg
controlRadio
  = control controlModifiers

{-| -}
controlRadioButton : IsDisabled -> IsChecked -> String -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> RadioButton msg
controlRadioButton disabled checked name attrs attrs_ htmls
  = let inputAttrs : List (Html.Attribute msg)
        inputAttrs
          = [ Attr.name name
            , Attr.type_ "radio"
            , Attr.disabled disabled
            , Attr.checked checked
            ]
        labelAttrs : List (Html.Attribute msg)
        labelAttrs
          = [ B.radio
            , Attr.disabled disabled
            ]
    in node "label" labelAttrs attrs
    <| node "input" inputAttrs attrs_ []
    :: (text " " :: htmls)

-- TODO: {-| TODO
-- TODO: -}
-- TODO: easyControlRadio : String -> ControlModifiers -> List (Attribute msg) -> List (String, String -> msg, List (Html msg)) -> Control msg
-- TODO: easyControlRadio name mods attrs controls

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
controlButton : ButtonModifiers msg -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Control msg
controlButton mods attrs attrs_
  = control controlModifiers attrs
  << ls
  << button mods attrs_

{-| 
    import B.Modifiers exposing (Color(Danger))

    myHelp : Html msg
    myHelp
      = help Danger []
        [ text "This field is required."
        ]
-}
help : Color -> List (Attribute msg) -> List (Html msg) -> Html msg
help color
  = node "p"
    [ B.help
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

{-| Secretly just `help`. Created this just for consistency.
-}
controlHelp : Color -> List (Attribute msg) -> List (Html msg) -> Control msg
controlHelp = help


-- FILE ------------------------------------------------------------------------

-- TODO: file
