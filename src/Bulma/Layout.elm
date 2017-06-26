
module Bulma.Layout exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| TODO 

# Container
@docs Container
@docs container, fluidContainer

# Hero
@docs Hero, HeroModifiers, HeroSize
@docs hero, easyHero

## Hero Partition
@docs HeroPartition 
@docs heroBody, heroFoot, heroHead

# Section
@docs Section, SectionSpacing
@docs section

# Footer
@docs Footer
@docs footer

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers as Modifiers exposing (..)

import Html exposing ( Html )


-- CONTAINER -------------------------------------------------------------------
   
{-| TODO
-}
type alias Container msg = Html msg

{-| TODO
-}
container : Attrs msg -> Htmls msg -> Container msg
container = node "div" [] [ bulma.feature.container ]

{-| TODO
-}
fluidContainer : Attrs msg -> Htmls msg -> Container msg
fluidContainer = node "div" [] [ bulma.feature.container
                               , bulma.feature.sizing.isFluid
                               ]


-- HERO ------------------------------------------------------------------------

{-| TODO
-}
type alias Hero msg = Html msg

{-| TODO
-}
hero : HeroModifiers -> Attrs msg -> List (HeroPartition msg) -> Hero msg
hero {bold,size,color}
  = node "section" []
    [ bulma.hero.container
    , case bold of
        True  -> bulma.hero.style.isBold
        False -> ""
    , case size of
        Normal     -> ""
        Medium     -> bulma.hero.size.isMedium
        Large      -> bulma.hero.size.isLarge
        FullHeight -> bulma.hero.size.isFullheight
    , case color of
        Default -> ""
        White   -> bulma.hero.color.isWhite
        Black   -> bulma.hero.color.isBlack
        Light   -> bulma.hero.color.isLight
        Dark    -> bulma.hero.color.isDark
        Primary -> bulma.hero.color.isPrimary
        Info    -> bulma.hero.color.isInfo
        Success -> bulma.hero.color.isSuccess
        Warning -> bulma.hero.color.isWarning
        Danger  -> bulma.hero.color.isDanger
    ]

{-| TODO
-}
easyHero : HeroModifiers -> Attrs msg -> { head : HeroPartition msg, body : HeroPartition msg, foot : HeroPartition msg } -> Hero msg
easyHero mods attrs {head,body,foot}
  = hero mods attrs [ head, body, foot ]

-- TODO: hero video???

-- HERO MODIFIERS --

{-| TODO
-}
type alias HeroModifiers = { bold  : Bool
                           , size  : HeroSize
                           , color : Color
                           }

{-| TODO
-}
type HeroSize = Normal
              | Medium
              | Large
              | FullHeight


-- HERO PARTITIONS --

{-| TODO
-}
type alias HeroPartition msg = Html msg

{-| TODO
-}
heroHead : Attrs msg -> Htmls msg -> HeroPartition msg
heroHead = node "div" [] [ bulma.hero.head ]

{-| TODO
-}
heroBody : Attrs msg -> Htmls msg -> HeroPartition msg
heroBody = node "div" [] [ bulma.hero.body ]

{-| TODO
-}
heroFoot : Attrs msg -> Htmls msg -> HeroPartition msg
heroFoot = node "div" [] [ bulma.hero.foot ]


-- SECTION ---------------------------------------------------------------------

{-| TODO
-}
type alias Section msg = Html msg

{-| TODO
-}
section : SectionSpacing -> Attrs msg -> Htmls msg -> Section msg
section spacing
  = node "section" []
    [ bulma.section.container
    , case spacing of
        NotSpaced  -> ""
        Spaced     -> bulma.section.spacing.isMedium
        VerySpaced -> bulma.section.spacing.isLarge
    ]

-- MODIFIERS --

{-| TODO
-}
type SectionSpacing = NotSpaced
                    | Spaced
                    | VerySpaced


-- FOOTER ----------------------------------------------------------------------

{-| TODO
-}
type alias Footer msg = Html msg

{-| TODO
-}
footer : Attrs msg -> Htmls msg -> Footer msg
footer = node "footer" [] [ bulma.footer.container ]
