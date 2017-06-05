
module Bulma.Elements.Form exposing ( Control
                                    , toHtml
                                    , setHelpers
                                    )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- CONTROLS --------------------------------------------------------------------

type Control = Control Helpers Modifiers (List (Attribute msg)) (List (Html msg))

setValue : String -> Control msg -> Control msg

addCase : (String -> Bool) -> (Control msg -> Control msg) -> Control msg -> Control msg

addHelp : Help msg -> Control msg -> Control msg

-- TODO: convenience functions for each control type


-- LABEL --

type Label = Label (List (Attribute msg)) (List (Html msg))

label : List (Attribute msg) -> List (Html msg) -> Label msg
label = Label

easyLabel : String -> Label msg
easyLabel = label << singleton << text

fromLabel : Label msg -> Control msg
fromLabel (Label attrs htmls)
  = Control defaultHelpers defaultModifiers attrs htmls


-- INPUT --

type InputType = Text
               | TextArea

type Input = Input InputType String String (String -> msg) (List (Attribute msg)) (List (Html msg))

input : List (Attribute msg) -> List (Html msg) -> Input msg
input = Input Text

textarea : List (Attribute msg) -> List (Html msg) -> Input msg
textarea = Input TextArea

easyInput : String -> (String -> msg) -> String -> Input msg
easyInput ph f s = input [ onInput f ] []
                 |> setPlaceholder ph
                 |> setValue s

setPlaceholder : String -> Input msg -> Input msg

setInputValue : String -> Input msg -> Input msg

setInputEvent : (String -> msg) -> Input msg -> Input msg

fromInput : Input msg -> Control msg
fromInput (Input attrs htmls)
  = Control defaultHelpers defaultModifiers attrs htmls
    -- TODO: integrate the placeholder, value, and inputter


-- SELECT --

type Option = Option (List (Attribute msg)) (List (Html msg))

option : List (Attribute msg) -> List (Html msg) -> Select msg

easyOption : Bool -> String -> String -> Option msg

type Select = Select (List (Attribute msg)) (List (Option msg))

select : List (Attribute msg) -> List (Option msg) -> Select msg

easySelect : (String -> msg) -> List (Option msg) -> Select msg

easierSelect : (String -> msg) -> List (String, String) -> Select msg

setSelectedOption : String -> Select msg -> Select msg

fromSelect : Select msg -> Control msg


-- CHECKBOX  --

type Option = Option Bool (List (Attribute msg)) (List (Html msg))

checkbox : List (Attribute msg) -> List (Html msg) -> CheckBox msg

easyCheckBox : (Bool -> msg) -> Bool -> String -> CheckBox msg

setCheck : Bool -> CheckBox msg -> CheckBox msg

setChecked : CheckBox msg -> CheckBox msg

setUnchecked : CheckBox msg -> CheckBox msg

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


-- TRANSFORMS --------------------------------------------------------------------

toHtml : Control msg -> Html msg


-- MODIFIERS -------------------------------------------------------------------


-- COLORS --

unsetColor : Control msg -> Control msg

setPrimary : Control msg -> Control msg

setInfo : Control msg -> Control msg

setSuccess : Control msg -> Control msg

setWarning : Control msg -> Control msg

setDanger : Control msg -> Control msg


-- SIZES --

unsetSize : Control msg -> Control msg

setSmall : Control msg -> Control msg

setMedium : Control msg -> Control msg

setLarge : Control msg -> Control msg


-- STATES --

unsetState : Control msg -> Control msg

setHover : Control msg -> Control msg

setFocus : Control msg -> Control msg

setLoading : Control msg -> Control msg

setDisabled : Control msg -> Control msg


-- EXPANDED --

unsetExpanded : Control msg -> Control msg

setExpanded : Control msg -> Control msg


-- ICON --

unsetIconLeft : Control msg -> Control msg

setIconLeft : Icon -> Control msg -> Control msg

unsetIconRight : Control msg -> Control msg

setIconRight : Icon -> Control msg -> Control msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Control msg -> Control msg
