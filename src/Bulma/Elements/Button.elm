
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

buttonGroup : List (Button msg) -> Html msg

connectedButtonGroup : List (Button msg) -> Html msg


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

easyButton : Icon msg -> String -> Button msg
easyButton icon = text >> singleton >> iconButton icon


-- MODIFIERS -------------------------------------------------------------------

type alias Modifiers = { size    : Maybe Size
                       , state   : Maybe State
                       , color   : Maybe Color 
                       , invert  : Bool
                       , outline : Bool
                       }

defaultModifiers : Modifiers
defaultModifiers = { size     : Nothing
                   , state    : Nothing
                   , color    : Nothing
                   , invert   : False
                   , outline  : False
                   }

setModifiers : Modifiers -> Button msg -> Button msg
setModifiers mods_ (Button helps _ htmls attrs)
  = Box helps mods_ htmls attrs


-- OUTLINE --

outlineClass : Bool -> Maybe String
outlineClass outline = if   outline
                       then Just "is-outlined"
                       else Nothing


-- INVERT --

invertClass : Bool -> Maybe String
invertClass invert = if   invert
                     then Just "is-inverted"
                     else Nothing
                     
-- SIZE --

type Size = Small
          | Medium
          | Large

small : Size
small = Small

medium : Size
medium = Medium

large : Size
large = Large

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

hover : State
hover = Hover

focus : State
focus = Focus

active : State
active = Active

loading : State
loading = Loading

static : State
static = Static

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

black : Color
black = Black

dark : Color
dark = Dark
       
light : Color
light = Light

white : Color
white = White

link : Color
link = Link

primary : Color
primary = Primary

info : Color
info = Info

success : Color
success = Success

warning : Color
warning = Warning

danger : Color
danger = Danger
                           
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


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Button msg -> Button msg
setHelpers helps_ (Button _ mods htmls attrs)
  = Box helps_ mods htmls attrs
