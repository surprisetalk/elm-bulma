
module Bulma.Elements.Form.Control exposing ( Control
                                            , toHtml
                                            , setHelpers
                                            )

-- DOCS ------------------------------------------------------------------------

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute )


-- CONTROLS --------------------------------------------------------------------

-- TODO: convenience functions for each control type

{-| TODO
-}
type ControlBody msg = ControlInput    (Input msg)
                     | ControlSelect   (Select msg)
                     | ControlCheckBox (CheckBox msg)
                     | ControlRadio    (Radio msg)
                     | ControlButton   (Button msg)

{-| TODO
-}
type Control msg = Entity (Modifiers String) (ControlBody msg) msg

{-| TODO
-}
control : Body msg -> Control msg

{-| TODO
-}
setLabel : Label msg -> Control msg -> Control msg

{-| TODO
-}
setValue : String -> Control msg -> Control msg
-- TODO: log a warning when we can't set the value?

{-| TODO
-}
addCase : (String -> Bool) -> (Control msg -> Control msg) -> Control msg -> Control msg

{-| TODO
-}
addHelp : Help msg -> Control msg -> Control msg

-- TODO: consider surfacing onInput at the control level


-- LABEL --

{-| TODO
-}
type alias Label msg = Entity () (Htmls msg) msg

{-| TODO
-}
label : Attrs msg -> Htmls msg -> Label msg
label = entity "label" [] ()

{-| TODO
-}
easyLabel : String -> Label msg
easyLabel = label [] << singleton << text


-- INPUT --

{-| TODO
-}
type InputType = Text
               | TextArea

{-| TODO
-}
type alias InputBody msg = { htmls       : Htmls msg
                           , inputType   : InputType
                           , placeholder : String
                           , value       : String
                           , onInput     : Maybe (String -> msg)
                           }

{-| TODO
-}
type alias Input msg = Entity () (InputBody msg) msg

{-| TODO
-}
input : Attrs msg -> Htmls msg -> Input msg
input attrs htmls
  = entity "input" [ "input" ] () attrs
    { htmls       = []
    , inputType   = Text
    , placeholder = ""
    , value       = ""
    , onInput     = Nothing
    }

{-| TODO
-}
easyInput : String -> (String -> msg) -> String -> Input msg
easyInput ph f s = input [] []
                 |> setPlaceholder ph
                 |> setInputEvent  f
                 |> setInputValue  s

{-| TODO
-}
textarea : Attrs msg -> Htmls msg -> Input msg
textarea attrs htmls
  = entity "input" [ "input" ] () attrs
    { htmls       = htmls
    , inputType   = TextArea
    , placeholder = ""
    , value       = ""
    , onInput     = Nothing
    }

{-| TODO
-}
easyTextarea : String -> (String -> msg) -> String -> Input msg
easyTextarea ph f s = textarea [] []
                    |> setPlaceholder ph
                    |> setInputEvent  f
                    |> setInputValue  s

{-| TODO
-}
setPlaceholder : String -> Input msg -> Input msg
setPlaceholder ph_ = mapBody <| \body -> { body | placeholder = ph_ }

{-| TODO
-}
setInputValue : String -> Input msg -> Input msg
setInputValue value_ = mapBody <| \body -> { body | value = value_ }

{-| TODO
-}
setInputEvent : (String -> msg) -> Input msg -> Input msg
setInputEvent f_ = mapBody <| \body -> { body | onInput = Just f_ }

{-| TODO
-}
fromInput : Input msg -> Control msg
fromInput = control << ControlInput


-- SELECT --

-- TODO: make sure to wrap options in <select> before placing in the <span>

{-| TODO
-}
type alias OptionBody = { key : String
                        , val : String
                        } 

{-| TODO
-}
type Option = Entity () OptionBody msg

{-| TODO
-}
option : String -> String -> Option msg
option k v = entity "option" [] () [] { key = k, val = v }

{-| TODO
-}
type alias SelectBody msg = { options : FList (Option msg)
                            , onInput : Maybe (String -> msg)
                            }

{-| TODO
-}
type alias Select msg = Entity () (SelectBody msg) msg

{-| TODO
-}
select : Attrs msg -> FList (Option msg) -> Select msg
select attrs opts = entity "span" [ "select" ] attrs { options = opts, onInput = Nothing }

{-| TODO
-}
easySelect : (String -> msg) -> String -> FList (Option msg) -> Select msg
easySelect f s opts = select [] opts
                    |> setSelectEvent    f
                    |> setSelectedOption s

{-| TODO
-}
setSelectedOption : String -> Select msg -> Select msg

{-| TODO
-}
setSelectedEvent : (String -> msg) -> Input msg -> Input msg
setSelectedEvent f_ = mapBody <| \body -> { body | onInput = Just f_ }

{-| TODO
-}
fromSelect : Select msg -> Control msg
fromSelect = ControlSelect >> control


-- CHECKBOX --

{-| TODO
-}
type CheckBox = Entity () (Label msg) msg

{-| TODO
-}
checkbox : Attrs msg -> Label msg -> CheckBox msg

{-| TODO
-}
easyCheckBox : (Bool -> msg) -> Bool -> String -> CheckBox msg

{-| TODO
-}
setCheck : Bool -> CheckBox msg -> CheckBox msg

{-| TODO
-}
setChecked : CheckBox msg -> CheckBox msg

{-| TODO
-}
setUnchecked : CheckBox msg -> CheckBox msg

{-| TODO
-}
fromCheckBox : CheckBox msg -> Control msg


-- RADIO  --

type Radio msg = Radio String (List (Attribute msg)) (List (Html msg))

radio : List (Attribute msg) -> List (Html msg) -> Radio msg

easyRadio : String -> String -> Radio msg

setRadioValue : String -> RadioGroup msg -> RadioGroup msg

type RadioGroup msg = RadioGroup String (List (Attribute msg)) (List (Html msg))

radioGroup : List (Attrribute msg) -> List (Radio msg) -> RadioGroup msg

easyRadioGroup : (String -> msg) -> List (String, String) -> RadioGroup msg

setRadioGroupName : String -> RadioGroup msg -> RadioGroup msg

fromRadioGroup : RadioGroup msg -> Control msg


-- BUTTON  --

fromButton : Button msg -> Control msg


-- HELP  --

type Help msg

help : List (Attribute msg) -> List (Html msg) -> Help msg

easyHelp : String -> Help msg


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers a = { value     : a
                         , color     : Color
                         , size      : Size
                         , expanded  : Bool
                         , iconLeft  : Maybe Icon
                         , iconRight : Maybe Icon
                         }

{-| TODO
-}
defaultModifiers : a -> Modifiers a
defaultModifiers a = { value     = a
                     , color     = Default
                     , size      = Normal
                     , expanded  = False
                     , iconLeft  = Nothing
                     , iconRight = Nothing
                     }
                     
-- COLORS --

type Color = Default
           | Primary
           | Info
           | Success
           | Warning
           | Danger

default : Control msg -> Control msg

primary : Control msg -> Control msg

info : Control msg -> Control msg

success : Control msg -> Control msg

warning : Control msg -> Control msg

danger : Control msg -> Control msg


-- SIZES --

type Size = Small
          | Normal
          | Medium
          | Large

small : Control msg -> Control msg

normal : Control msg -> Control msg

medium : Control msg -> Control msg

large : Control msg -> Control msg


-- STATES --

type State = Blur
           | Hover
           | Focus
           | Loading
           | Disabled

blur : Control msg -> Control msg

hover : Control msg -> Control msg

focus : Control msg -> Control msg

loading : Control msg -> Control msg

disabled : Control msg -> Control msg


-- EXPANDED --

compact : Control msg -> Control msg
compact = mapMods <| \mods -> { mods | expanded = False }

expanded : Control msg -> Control msg
expanded = mapMods <| \mods -> { mods | expanded = True }


-- ICON --

setIconLeft : Maybe Icon -> Control msg -> Control msg
setIconLeft icon_ = mapMods <| \mods -> { mods | iconLeft = icon_ }

setIconRight : Maybe Icon -> Control msg -> Control msg
setIconRight icon_ = mapMods <| \mods -> { mods | iconRight = icon_ }


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Control msg -> Html msg
toHtml = Entity.toHtml (\_ -> []) identity

{-| TODO
-}
addClass : String -> Control msg -> Control msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Control msg -> Control msg
setHelpers helps = Entity.setHelpers helps
