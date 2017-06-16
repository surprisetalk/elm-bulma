
module Bulma.Elements.Form.Control exposing ( Control
                                            , setIconLeft
                                            , setIconRight
                                            , addHelp
                                            , Label
                                            , label
                                            , easyLabel
                                            , Help
                                            , help
                                            , easyHelp
                                            , Input
                                            , input
                                            , easyInput
                                            , textarea
                                            , easyTextarea
                                            , setPlaceholder
                                            , setInputValue
                                            , setInputEvent
                                            , fromInput
                                            , Option
                                            , option
                                            , Select
                                            , select
                                            , easySelect
                                            , setSelectedOption
                                            , fromSelect
                                            , CheckBox
                                            , checkbox
                                            , easyCheckBox
                                            , setCheck
                                            , checked
                                            , unchecked
                                            , fromCheckBox
                                            , Radio
                                            , radio
                                            , easyRadio
                                            , RadioGroup
                                            , radioGroup
                                            , easyRadioGroup
                                            , easierRadioGroup
                                            , setRadioGroupName
                                            , fromRadioGroup
                                            , fromButton
                                            , toHtml
                                            , addClass
                                            , setHelpers
                                            )
                                            
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Control, setIconLeft, setIconRight, addHelp

@docs Label, label, easyLabel

@docs Help, help, easyHelp

@docs Input, input, easyInput, textarea, easyTextarea, setPlaceholder, setInputValue, setInputEvent, fromInput

@docs Option, option
@docs Select, select, easySelect, setSelectedOption, fromSelect

@docs CheckBox, checkbox, easyCheckBox, setCheck, checked, unchecked, fromCheckBox

@docs Radio, radio, easyRadio
@docs RadioGroup, radioGroup, easyRadioGroup, easierRadioGroup, setRadioGroupName, fromRadioGroup

@docs fromButton

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Icon   as Icon   exposing ( Icon   )
import Bulma.Elements.Button as Button exposing ( Button )

import Html exposing ( Html, Attribute, text )
import Html.Events as Events exposing ( onClick, onInput )
import Html.Attributes as Attr exposing ( type_ )

import List  exposing ( map      )
import Tuple exposing ( mapFirst, mapSecond )


-- CONTROLS --------------------------------------------------------------------

-- TODO: field labels

-- TODO: convenience functions for each control type

{-| TODO
-}
type ControlBodylet msg = ControlInput      (Input      msg)
                        | ControlSelect     (Select     msg)
                        | ControlCheckBox   (CheckBox   msg)
                        | ControlRadioGroup (RadioGroup msg)
                        | ControlButton     (Button     msg)

type alias ControlBody msg = { mods    : Modifiers
                             , helps   : List  (Help  msg)
                             , bodylet : ControlBodylet msg
                             , icons   : ( Maybe (Icon msg)
                                         , Maybe (Icon msg)
                                         )
                             }

{-| TODO
-}
defaultControlBody : ControlBodylet msg -> ControlBody msg
defaultControlBody bodylet = { mods    = defaultModifiers
                             , helps   = []
                             , bodylet = bodylet
                             , icons   = ( Nothing
                                         , Nothing
                                         ) 
                             }

{-| TODO
-}
type alias Control msg = Entity (Bool,(Bool,Bool)) (ControlBody msg) msg
-- TODO: move mods to body and apply to bodylet

{-| TODO
-}
control : Attrs msg -> ControlBodylet msg -> Control msg
control attrs = entity "p" [ "control" ] (False,(False,False)) attrs << defaultControlBody

{-| TODO
-}
setIconLeft : Icon msg -> Control msg -> Control msg
setIconLeft icon_
  = mapMods (mapSecond (setFirst True))
  << mapBody (\body -> { body | icons = body.icons |> setFirst (Just icon_) })

{-| TODO
-}
setIconRight : Icon msg -> Control msg -> Control msg
setIconRight icon_
  = mapMods (mapSecond (setSecond True))
  << mapBody (\body -> { body | icons = body.icons |> setSecond (Just icon_) })

{-| TODO
-}
addHelp : Help msg -> Control msg -> Control msg
addHelp help_ = mapBody <| \body -> { body | helps = body.helps +: help_ }

-- {-| TODO
-- -}
-- addCase : (String -> Bool) -> (Control msg -> Control msg) -> Control msg -> Control msg
-- addCase = 

-- TODO: consider surfacing onInput at the control level
-- TODO:  in particular, addCase would be helpful


-- LABEL --

-- TODO: apply modifiers to help?

-- TODO: it seems overkill to use an entity here

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
easyLabel = label [] << ls << text


-- INPUT --

{-| TODO
-}
type InputType = Text
               | TextArea

{-| TODO
-}
type alias InputBody msg = { htmls       : Htmls msg
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
  = entity "textarea" [ "textarea" ] () attrs
    { htmls       = htmls
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
fromInput : Attrs msg -> Input msg -> Control msg
fromInput attrs = ControlInput >> control attrs


-- SELECT --

-- TODO: is option entity overkill?
-- TODO: make sure to wrap options in <select> before placing in the <span>

{-| TODO
-}
type alias OptionBody = { key : String
                        , val : String
                        } 

{-| TODO
-}
type alias Option msg = Entity () OptionBody msg

{-| TODO
-}
option : String -> String -> Option msg
option k v = entity "option" [] () [] { key = k, val = v }

{-| TODO
-}
type alias Select msg = Entity () (FList (Option msg)) msg

{-| TODO
-}
select : Attrs msg -> FList (Option msg) -> Select msg
select attrs = entity "span" [ "select" ] () attrs

{-| TODO
-}
easySelect : (String -> msg) -> String -> FList (Option msg) -> Select msg
easySelect f s opts = select [ onInput f ] opts |> setSelectedOption s

{-| TODO
-}
-- setSelectedOption : String -> Select msg -> Select msg
-- setSelectedOption key_
--   = mapBody <| selectWhen <| \(Entity _ {key} _) -> key == key_
setSelectedOption : String -> Select msg -> Select msg
setSelectedOption = y identity
-- TODO

{-| TODO
-}
fromSelect : Attrs msg -> Select msg -> Control msg
fromSelect attrs = ControlSelect >> control attrs


-- CHECKBOX --

-- BUG: what if somebody wants to put a link in their checkbox?

{-| TODO
-}
type alias CheckBox msg = Entity () (Bool, Htmls msg) msg

{-| TODO
-}
checkbox : Attrs msg -> Htmls msg -> CheckBox msg
checkbox attrs 
  = entity "label" [ "checkbox" ] () attrs << (,) False

{-| TODO
-}
easyCheckBox : msg -> Bool -> String -> CheckBox msg
easyCheckBox msg c = text >> ls >> checkbox [ onClick msg ] >> setCheck c

{-| TODO
-}
setCheck : Bool -> CheckBox msg -> CheckBox msg
setCheck = mapBody << mapFirst << y

{-| TODO
-}
checked : CheckBox msg -> CheckBox msg
checked = setCheck True

{-| TODO
-}
unchecked : CheckBox msg -> CheckBox msg
unchecked = setCheck False

{-| TODO
-}
fromCheckBox : Attrs msg -> CheckBox msg -> Control msg
fromCheckBox attrs = ControlCheckBox >> control attrs


-- RADIO  --

{-| TODO
-}
type alias Radio msg = Entity () (Htmls msg) msg

{-| TODO
-}
radio : Attrs msg -> Htmls msg -> Radio msg
radio = entity "label" [ "checkbox" ] ()

{-| TODO
-}
easyRadio : msg -> String -> Radio msg
easyRadio msg = text >> ls >> radio [ onClick msg ]

{-| TODO
-}
type alias RadioGroup msg = { name   : Maybe String
                            , radios : List (Radio msg)
                            }

{-| TODO
-}
radioGroup : List (Radio msg) -> RadioGroup msg
radioGroup radios = { name = Nothing, radios = radios }

{-| TODO
-}
easyRadioGroup : List (msg, Htmls msg) -> RadioGroup msg
easyRadioGroup = map (uncurry (onClick >> ls >> radio)) >> radioGroup

{-| TODO
-}
easierRadioGroup : List (msg, String) -> RadioGroup msg
easierRadioGroup = map (uncurry easyRadio) >> radioGroup

{-| TODO
-}
setRadioGroupName : String -> RadioGroup msg -> RadioGroup msg
setRadioGroupName name_ group = { group | name = Just name_ }

{-| TODO
-}
fromRadioGroup : Attrs msg -> RadioGroup msg -> Control msg
fromRadioGroup attrs = ControlRadioGroup >> control attrs


-- BUTTON  --

{-| TODO
-}
fromButton : Attrs msg -> Button msg -> Control msg
fromButton attrs = ControlButton >> control attrs


-- HELP  --

-- TODO: apply modifiers to help?

{-| TODO
-}
type alias Help msg = Entity () String msg

{-| TODO
-}
help : Attrs msg -> String -> Help msg
help = entity "p" [ "help" ] ()

{-| TODO
-}
easyHelp : String -> Help msg
easyHelp = help []


-- MODIFIERS -------------------------------------------------------------------

-- KLUDGE: the modifiers actually only apply to the bodylets
-- KLUDGE:   except for expanded

{-| TODO
-}
type alias Modifiers = { color     : Color
                       , state     : State
                       , size      : Size
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { color     = Default
                   , state     = Blur
                   , size      = Normal
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,state,color}
  = [ size     |> sizeClass
    , state    |> stateClass
    , color    |> colorClass
    ]

{-| TODO
-}
iconClasses : (Bool,Bool) -> List String
iconClasses (left,right)
  = [ if   left
      then "has-icons-left"
      else ""
    , if   right
      then "has-icons-right"
      else ""
    ]

                     
-- COLORS --

type Color = Default
           | Primary
           | Info
           | Success
           | Warning
           | Danger

setColor : Color -> Control msg -> Control msg
setColor color_ = mapBody <| \({mods} as body) -> { body | mods = { mods | color = color_ } }

default : Control msg -> Control msg
default = setColor Default

primary : Control msg -> Control msg
primary = setColor Primary

info : Control msg -> Control msg
info = setColor Info

success : Control msg -> Control msg
success = setColor Success

warning : Control msg -> Control msg
warning = setColor Warning

danger : Control msg -> Control msg
danger = setColor Danger

{-| TODO
-}
colorClass : Color -> String
colorClass color
  = case color of
      Default -> ""
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"


-- SIZES --

type Size = Small
          | Normal
          | Medium
          | Large

setSize : Size -> Control msg -> Control msg
setSize size_ = mapBody <| \({mods} as body) -> { body | mods = { mods | size = size_ } }

small : Control msg -> Control msg
small = setSize Small

normal : Control msg -> Control msg
normal = setSize Normal

medium : Control msg -> Control msg
medium = setSize Medium

large : Control msg -> Control msg
large = setSize Large

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Small  -> "is-small"
      Normal -> ""
      Medium -> "is-medium"
      Large  -> "is-large"


-- STATES --

type State = Blur
           | Hover
           | Focus
           | Loading
           | Disabled

setState : State -> Control msg -> Control msg
setState state_ = mapBody <| \({mods} as body) -> { body | mods = { mods | state = state_ } }

blur : Control msg -> Control msg
blur = setState Blur

hover : Control msg -> Control msg
hover = setState Hover

focus : Control msg -> Control msg
focus = setState Focus

loading : Control msg -> Control msg
loading = setState Loading

disabled : Control msg -> Control msg
disabled = setState Disabled

{-| TODO
-}
stateClass : State -> String
stateClass state
  = case state of
      Blur     -> ""
      Hover    -> "is-hover"
      Focus    -> "is-focus"
      Loading  -> "is-loading"
      Disabled -> "is-disabled"


-- EXPANDED --

compact : Control msg -> Control msg
compact = mapMods <| setFirst False

expanded : Control msg -> Control msg
expanded = mapMods <| setFirst True

{-| TODO
-}
expandedClass : Bool -> String
expandedClass expanded = if   expanded
                         then "is-expanded"
                         else ""



-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Control msg -> Html msg
-- TODO: is-loading [sometimes] goes on the parent for some reason...
-- TODO: if has icons, use addClass to add "has-icons-left" etc
-- TODO:   or do the lazy thing and keep track of it in the modifiers
toHtml = Entity.toHtml (\(expanded,icons) -> expandedClass expanded :: iconClasses icons) (y [])
       <| \{mods,helps,bodylet,icons} ->
         let addHelps : Htmls msg -> Htmls msg
             addHelps = fl (++) <| map (Entity.toHtml (y []) (y []) (text >> ls)) helps 

             addIcons : Htmls msg -> Htmls msg
             addIcons = icons
                      |> \(l,r) ->
                        [ l ?* Icon.toHtml
                        , r ?* Icon.toHtml
                        ]
                      |> mvalues
                      |> fl (++)

         in addHelps
          <| addIcons
          <| case bodylet of

              ControlInput input ->

                input
                |> mapMods (y mods)
                |> Entity.toHtml modsClasses
                  (\{placeholder,value,onInput} ->
                     mvalues
                     <| [ placeholder |> Attr.placeholder |> Just
                       , value       |> Attr.value       |> Just
                       , onInput |> Maybe.map Events.onInput
                       ])
                  (\{htmls} -> htmls)
                |> ls
                     
              ControlSelect select ->

                select
                |> mapMods (y mods)
                |> Entity.toHtml modsClasses (y [])
                  (flmap identity (addAttribute (Attr.selected True)) identity
                   >> fromFList
                   >> map (Entity.toHtml (y [])
                          (\{val} -> [ Attr.value val ])
                          (\{key} -> key |> text |> ls)))
                |> ls

              ControlCheckBox checkbox ->

                checkbox
                |> mapMods (y mods)
                |> Entity.toHtml modsClasses (y [])
                  (\(checked,htmls) -> Html.input [ type_ "checkbox", Attr.checked checked ] [] :: htmls )
                |> ls

              ControlRadioGroup {name,radios} ->

                radios
                |> map (Entity.toHtml (y []) (y []) (Html.input [ name ?. "" |> Attr.name, type_ "radio" ] [] |> (::)))

              ControlButton button ->

                button |> Button.toHtml |> ls
                -- TODO: mods -> button modifiers


{-| TODO
-}
addClass : String -> Control msg -> Control msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Control msg -> Control msg
setHelpers helps = Entity.setHelpers helps
