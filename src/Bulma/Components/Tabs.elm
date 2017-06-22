
module Bulma.Components.Tabs exposing ( Tabs
                                      , tabs
                                      , easyTabs
                                      , easyIconTabs
                                      , left
                                      , centered
                                      , right
                                      , small
                                      , normal
                                      , medium
                                      , large
                                      , noStyle
                                      , boxed
                                      , toggle
                                      , auto
                                      , fullWidth
                                      , Tab
                                      , tab
                                      , easyTab
                                      , iconTab
                                      , easyIconTab
                                      , inactive
                                      , active
                                      , toHtml
                                      , addClass
                                      , setHelpers
                                      )
                                      
-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Tabs
@docs tabs, easyTabs, easyIconTabs

@docs left, centered, right
@docs small, normal, medium, large
@docs noStyle, boxed, toggle
@docs auto, fullWidth

@docs Tab
@docs tab, easyTab
@docs iconTab, easyIconTab
@docs inactive, active

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Icon as Icon exposing ( Icon )

import Html exposing ( Html, Attribute, text, div, ul, a )
import Html.Events exposing ( onClick )

import Pointless exposing (..)

import List exposing ( map )

import Maybe.Extra as Maybe_ exposing ( unwrap )


-- TABS -----------------------------------------------------------------------

{-| TODO
-}
type alias Tabs msg = Entity Modifiers (List (Tab msg)) msg

{-| TODO
-}
tabs : Attrs msg -> List (Tab msg) -> Tabs msg
tabs = entity "div" [ "tabs" ] defaultModifiers
 
{-| TODO
-}
easyTabs : List (msg, String, Bool) -> Tabs msg
easyTabs = tabs [] |~-> map (\(msg,str,isActive) -> tab [] msg str |> if isActive then active else inactive)

{-| TODO
-}
easyIconTabs : List (msg, Icon msg, String, Bool) -> Tabs msg
easyIconTabs = tabs [] |~-> map (\(msg,icon,str,isActive) -> iconTab [] msg icon str |> if isActive then active else inactive)
 

-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size      : Size
                       , alignment : Alignment
                       , style     : Style
                       , fullWidth : Bool
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { size      = Normal
                   , alignment = Left
                   , style     = NoStyle
                   , fullWidth = False
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,alignment,style,fullWidth}
  = [ size      |> sizeClass
    , alignment |> alignmentClass
    , style     |> styleClass
    , fullWidth |> fullWidthClass
    ]


-- ALIGNMENT --

{-| TODO
-}
type Alignment = Left
               | Centered
               | Right

{-| TODO
-}
setAlignment : Alignment -> Tabs msg -> Tabs msg
setAlignment alignment_ = mapMods <| \mods -> { mods | alignment = alignment_ }

{-| TODO
-}
left : Tabs msg -> Tabs msg
left = setAlignment Left

{-| TODO
-}
centered : Tabs msg -> Tabs msg
centered = setAlignment Centered

{-| TODO
-}
right : Tabs msg -> Tabs msg
right = setAlignment Right

{-| TODO
-}
alignmentClass : Alignment -> String
alignmentClass alignment
  = case alignment of
      Left     -> ""
      Centered -> "is-centered"
      Right    -> "is-right"
  

-- SIZE --

{-| TODO
-}
type Size = Small
          | Normal
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Tabs msg -> Tabs msg
setSize size_ = mapMods <| \mods -> { mods | size = size_ }

{-| TODO
-}
small : Tabs msg -> Tabs msg
small = setSize Small

{-| TODO
-}
normal : Tabs msg -> Tabs msg
normal = setSize Normal

{-| TODO
-}
medium : Tabs msg -> Tabs msg
medium = setSize Medium

{-| TODO
-}
large : Tabs msg -> Tabs msg
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


-- STYLE --

{-| TODO
-}
type Style = NoStyle
           | Boxed
           | Toggle

{-| TODO
-}
setStyle : Style -> Tabs msg -> Tabs msg
setStyle style_ = mapMods <| \mods -> { mods | style = style_ }

{-| TODO
-}
noStyle : Tabs msg -> Tabs msg
noStyle = setStyle NoStyle

{-| TODO
-}
boxed : Tabs msg -> Tabs msg
boxed = setStyle Boxed

{-| TODO
-}
toggle : Tabs msg -> Tabs msg
toggle = setStyle Toggle

{-| TODO
-}
styleClass : Style -> String
styleClass style
  = case style of
      NoStyle -> ""
      Boxed   -> "is-boxed"
      Toggle  -> "is-toggle"


-- WIDTH --

{-| TODO
-}
setFullWidth : Bool -> Tabs msg -> Tabs msg
setFullWidth fullWidth_ = mapMods <| \mods -> { mods | fullWidth = fullWidth_ }

{-| TODO
-}
auto : Tabs msg -> Tabs msg
auto = setFullWidth False

{-| TODO
-}
fullWidth : Tabs msg -> Tabs msg
fullWidth = setFullWidth True

{-| TODO
-}
fullWidthClass : Bool -> String
fullWidthClass fullWidth = if fullWidth then "is-fullwidth" else ""


-- TAB -------------------------------------------------------------------------

{-| TODO
-}
type alias Tab msg = Entity Bool (Maybe msg, Maybe (Icon msg), String) msg

{-| TODO
-}
tab_ : Attrs msg -> (Maybe msg, Maybe (Icon msg), String) -> Tab msg
tab_ = entity "li" [] False

{-| TODO
-}
tab : Attrs msg -> msg -> String -> Tab msg
tab attrs msg str = tab_ attrs (Just msg, Nothing, str)

{-| TODO
-}
easyTab : String -> Tab msg
easyTab str = tab_ [] (Nothing, Nothing, str)

{-| TODO
-}
iconTab : Attrs msg -> msg -> Icon msg -> String -> Tab msg
iconTab attrs msg icon str = tab_ attrs (Just msg, Just icon, str)

{-| TODO
-}
easyIconTab : Icon msg -> String -> Tab msg
easyIconTab icon str = tab_ [] (Nothing, Just icon, str)


-- ACTIVE --

{-| TODO
-}
inactive : Tab msg -> Tab msg
inactive = mapMods <| y False

{-| TODO
-}
active : Tab msg -> Tab msg
active = mapMods <| y True

{-| TODO
-}
activeClass : Bool -> String
activeClass active = if active then "is-active" else ""


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Tabs msg -> Html msg
toHtml = Entity.toHtml modsClasses (y [])
       <| map
       <| toHtml_ >> ls >> ul []

{-| TODO
-}
toHtml_ : Tab msg -> Html msg
toHtml_ = Entity.toHtml (activeClass >> ls) (y [])
        <| \(msg,icon,str) ->
          [ a (msg |> unwrap [] (onClick >> ls))
            <| mvalues
              [ icon |> Maybe.map Icon.toHtml
              , str  |> text |> Just
              ]
          ]

{-| TODO
-}
addClass : String -> Tabs msg -> Tabs msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Tabs msg -> Tabs msg
setHelpers = Entity.setHelpers
