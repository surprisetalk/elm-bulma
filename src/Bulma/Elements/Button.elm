
module Bulma.Elements.Button exposing ( Button
                                      , button
                                      , iconButton
                                      , easyButton
                                      , toHtml
                                      , buttonGroup
                                      , connectedButtonGroup
                                      , Modifiers
                                      , defaultModifiers
                                      , setModifiers
                                      , Size
                                      , small
                                      , medium
                                      , large
                                      , State
                                      , hover
                                      , focus
                                      , loading
                                      , active
                                      , static
                                      , Color
                                      , white
                                      , light
                                      , dark
                                      , black
                                      , link
                                      , primary
                                      , info
                                      , success
                                      , warning
                                      , danger
                                      , setHelpers
                                      )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Size(..), Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- BUTTON ----------------------------------------------------------------------

type Button msg = Button Helpers Modifiers (List (Html msg)) (List (Html msg))

button : List (Attribute msg) -> List (Html msg) -> Button msg
button = Button defaultHelpers defaultModifiers

iconButton : List (Attribute msg) -> Icon msg -> List (Html msg) -> Button msg
iconButton attrs icon htmls
  = button attrs
    [ Icon.toHtml icon
    , span [] htmls
    ]

easyButton : msg -> Icon msg -> String -> Button msg
easyButton icon = text >> singleton >> iconButton icon

easierButton : msg -> String -> Button msg
easierButton icon = text >> singleton >> button []


-- GROUPS ----------------------------------------------------------------------

buttonGroup : List (Button msg) -> Html msg

connectedButtonGroup : List (Button msg) -> Html msg


-- MODIFIERS -------------------------------------------------------------------


-- OUTLINE --

unsetOutline : Button msg -> Button msg

setOutline : Button msg -> Button msg

outlineClass : Bool -> Maybe String
outlineClass outline = if   outline
                       then Just "is-outlined"
                       else Nothing


-- INVERT --

unsetInverted : Button msg -> Button msg

setInverted : Button msg -> Button msg

invertClass : Bool -> Maybe String
invertClass invert = if   invert
                     then Just "is-inverted"
                     else Nothing
                     
-- SIZE --

type Size = Small
          | Medium
          | Large

unsetSize : Button msg -> Button msg

setSmall : Button msg -> Button msg

setMedium : Button msg -> Button msg

setLarge : Button msg -> Button msg

sizeClass : Maybe Size -> Maybe String
sizeClass size
  = case size of
      Nothing     -> Nothing
      Just Small  -> Just "is-small"
      Just Medium -> Just "is-medium"
      Just Large  -> Just "is-large"


-- STATE --

type State = Hover
           | Focus
           | Active
           | Loading
           | Static

unsetState : Button msg -> Button msg

setHover : Button msg -> Button msg

setFocus : Button msg -> Button msg

setActive : Button msg -> Button msg

setLoading : Button msg -> Button msg

setStatic : Button msg -> Button msg

stateClass : Maybe State -> Maybe String
stateClass state
  = case state of
      Nothing      -> Nothing
      Just Hover   -> Just "is-hover"
      Just Focus   -> Just "is-focus"
      Just Active  -> Just "is-active"
      Just Loading -> Just "is-loading"
      Just Static  -> Just "is-static"


-- COLOR --

type Color = White
           | Light
           | Dark
           | Black
           | Link
           | Primary
           | Info
           | Success
           | Warning
           | Danger

unsetColor : Button msg -> Button msg

setBlack : Button msg -> Button msg

setDark : Button msg -> Button msg
       
setLight : Button msg -> Button msg

setWhite : Button msg -> Button msg

setLink : Button msg -> Button msg

setPrimary : Button msg -> Button msg

setInfo : Button msg -> Button msg

setSuccess : Button msg -> Button msg

setWarning : Button msg -> Button msg

setDanger : Button msg -> Button msg
                           
colorClass : Maybe Color -> Maybe String
colorClass color
  = case color of
      Nothing      -> Nothing
      Just White   -> Just "is-white"
      Just Light   -> Just "is-light"
      Just Dark    -> Just "is-dark"
      Just Black   -> Just "is-black"
      Just Link    -> Just "is-link"
      Just Primary -> Just "is-primary"
      Just Info    -> Just "is-info"
      Just Success -> Just "is-success"
      Just Warning -> Just "is-warning"
      Just Danger  -> Just "is-danger"


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Button msg -> Html msg
toHtml (Button helps {color,size,outline,invert,state} attrs htmls)
  = let classes : List String
        classes = (::) "button"
                <| Maybe_.values
                <| [ outlineClass outline
                  ,  invertClass invert
                  ,   colorClass color
                  ,   stateClass state
                  ,    sizeClass size
                  ]
                  
    in node helps "a" classes attrs htmls


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Button msg -> Button msg
setHelpers helps_ (Button _ mods htmls attrs)
  = Box helps_ mods htmls attrs
