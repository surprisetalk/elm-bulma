
module Bulma.Modifiers exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| Most Bulma elements have alternative styles. 
These types will come in handy for various modifiers records throughout this library.

# Size
@docs Size

# State
@docs State

# Color
@docs Color

# Alignment
@docs HorizontalAlignment

-}

-- MODIFIERS -------------------------------------------------------------------

{-| -}
type Size
  = Small
  | Normal
  | Medium
  | Large

{-| -}
type State
  = Blur
  | Hover
  | Focus
  | Active
  | Loading
  | Static

{-| -}
type Color
  = Default
  | White
  | Light
  | Dark
  | Black
  | Primary
  | Info
  | Success
  | Warning
  | Danger

{-| -}
type HorizontalAlignment
  = Left
  | Centered
  | Right
