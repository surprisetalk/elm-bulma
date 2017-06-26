
module Bulma.Elements.Title exposing ( Title
                                     , title
                                     , easyTitle
                                     , subtitle
                                     , easySubtitle
                                     , titleWithSubtitle
                                     , easyTitleWithSubtitle
                                     , size1
                                     , size2
                                     , size3
                                     , size4
                                     , size5
                                     , size6
                                     , smooshed
                                     , spaced
                                     , toHtml
                                     , toHtmls
                                     , addClass
                                     , setHelpers
                                     )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Title 
@docs title, easyTitle
@docs subtitle, easySubtitle
@docs titleWithSubtitle, easyTitleWithSubtitle

@docs size1, size2, size3, size4, size5, size6

@docs smooshed, spaced

@docs toHtml, toHtmls, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute, text )


-- TITLE -----------------------------------------------------------------------

{-| TODO
-}
type alias Title msg = Entity Modifiers (Htmls msg) msg

{-| TODO
-}
title : Attrs msg -> Htmls msg -> Title msg
title = entity "p" [ "title" ] (defaultModifiers Size3)

{-| TODO
-}
easyTitle : String -> Title msg
easyTitle = text >> ls >> title []
              
{-| TODO
-}
subtitle : Attrs msg -> Htmls msg -> Title msg
subtitle = entity "p" [ "subtitle" ] (defaultModifiers Size5)

{-| TODO
-}
easySubtitle : String -> Title msg
easySubtitle = text >> ls >> subtitle []
                 
{-| TODO
-}
titleWithSubtitle : ( Attrs msg, Htmls msg ) -> ( Attrs msg, Htmls msg ) -> ( Title msg, Title msg )
titleWithSubtitle t s = ( uncurry title    t
                        , uncurry subtitle s
                        )

{-| TODO
-}
easyTitleWithSubtitle : String -> String -> ( Title msg, Title msg )
easyTitleWithSubtitle t s = ( easyTitle    t
                            , easySubtitle s
                            )


-- SIZE ------------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size   : Size
                       , spaced : Bool
                       }

{-| TODO
-}
defaultModifiers : Size -> Modifiers
defaultModifiers size = { size   = size
                        , spaced = False
                        }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,spaced}
  = [ size   |> sizeClass
    , spaced |> spacedClass
    ]


-- SIZE --

{-| TODO
-}
type Size = Size1
          | Size2
          | Size3
          | Size4
          | Size5
          | Size6

{-| TODO
-}
setSize : Int -> Title msg -> Title msg
setSize n = mapMods
          <| \mods ->
            { mods
            | size = case clamp 1 6 n of
                       01 -> Size1
                       02 -> Size2
                       03 -> Size3
                       04 -> Size4
                       05 -> Size5
                       06 -> Size6
                       _  -> Size6
            }

{-| TODO
-}
size1 : Title msg -> Title msg
size1 = setSize 1

{-| TODO
-}
size2 : Title msg -> Title msg
size2 = setSize 2

{-| TODO
-}
size3 : Title msg -> Title msg
size3 = setSize 3

{-| TODO
-}
size4 : Title msg -> Title msg
size4 = setSize 4

{-| TODO
-}
size5 : Title msg -> Title msg
size5 = setSize 5

{-| TODO
-}
size6 : Title msg -> Title msg
size6 = setSize 6

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Size1 -> "is-1"
      Size2 -> "is-2"
      Size3 -> "is-3"
      Size4 -> "is-4"
      Size5 -> "is-5"
      Size6 -> "is-6"

-- SPACING --

{-| TODO
-}
smooshed : Title msg -> Title msg
smooshed = mapMods <| \mods -> { mods | spaced = False }

{-| TODO
-}
spaced : Title msg -> Title msg
spaced = mapMods <| \mods -> { mods | spaced = True }

{-| TODO
-}
spacedClass : Bool -> String
spacedClass spaced = if spaced then "is-spaced" else ""


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Title msg -> Html msg
toHtml = Entity.toHtml modsClasses (y []) identity

{-| TODO
-}
toHtmls : ( Title msg, Title msg ) -> Htmls msg
toHtmls (t,s) = [ toHtml t
                , toHtml s
                ]

{-| TODO
-}
addClass : String -> Title msg -> Title msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Title msg -> Title msg
setHelpers = Entity.setHelpers
