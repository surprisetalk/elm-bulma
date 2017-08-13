
module Bulma.Layout exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Container](#container)
- [Hero](#hero)
- [Section](#section)
- [Footer](#footer)

# Container
@docs Container
@docs container, fluidContainer
@docs widescreenContainer, fullHDContainer

# Hero
@docs Hero, HeroModifiers, HeroSize, heroModifiers
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
   
{-| -}
type alias Container msg = Html msg

{-| A simple container to center your content horizontally.

    myContainer : Html msg
    myContainer
      = container []
        [ p []
          [ text "My container is centered on a desktop!"
          ]
        ]

Containers can be used in any context, but mostly as a direct child of:
- `navbar`
- `hero`
- `section`
- `footer`
-}
container : Attrs msg -> Htmls msg -> Container msg
container = node "div" [] [ bulma.feature.container ]

{-| If you don't want to have a maximum width, but want to keep the 24px margin on the left and right sides, `fluidContainer` is for you!

    myFluidContainer : Html msg
    myFluidContainer
      = container []
        [ p []
          [ text "My container will have a 24px gap on its left and right."
          ]
        [ p []
          [ text "This gap holds for all viewport sizes."
          ]
        ]
-}
fluidContainer : Attrs msg -> Htmls msg -> Container msg
fluidContainer = node "div" [] [ bulma.feature.container
                               , bulma.feature.sizing.isFluid
                               ]

{-| This container is full-width until the "widescreen" breakpoint.

    myWidescreenContainer : Html msg
    myWidescreenContainer
      = widescreenContainer []
        [ p [] [ text "This container fills the screen-width..." ]
        , p [] [ text "...until it hits the widescreen breakpoint." ]
        ]
-}
widescreenContainer : Attrs msg -> Htmls msg -> Container msg
widescreenContainer = node "div" [] [ bulma.feature.container
                                    , "is-widescreen"
                                      -- TODO: add to BulmaClasses
                                    ]

{-| This container is full-width until the "fullHD" breakpoint.

    fullHDContainer : Html msg
    fullHDContainer
      = widescreenContainer []
        [ p [] [ text "This container fills the screen-width..." ]
        , p [] [ text "...until it hits the fullHD breakpoint." ]
        ]
-}
fullHDContainer : Attrs msg -> Htmls msg -> Container msg
fullHDContainer = node "div" [] [ bulma.feature.container
                                , "is-fullhd"
                                  -- TODO: add to BulmaClasses
                                ]


-- HERO ------------------------------------------------------------------------

{-| -}
type alias Hero msg = Html msg

{-| An imposing Hero banner to showcase something.

    import Bulma.Layout exposing (hero,heroBody,container)
    import Bulma.Elements exposing (TitleSize(H1,H2),title)

    myHero : Html msg
    myHero
      = hero myHeroModifiers []
        [ heroBody [] 
          [ container []
            [ title H1 [] [ text "Hero Title" ]
            , title H2 [] [ text "Hero Subtitle" ]
            ]
          ]
        ]
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

{-| The `hero` element with some added guard-rails.

    myHero : Html msg
    myHero
      = easyHero myHeroModifiers []
        { head = heroHead [] []
        , body = heroBody [] []
        , foot = heroFoot [] []
        }
-}
easyHero : HeroModifiers -> Attrs msg -> { head : HeroPartition msg, body : HeroPartition msg, foot : HeroPartition msg } -> Hero msg
easyHero mods attrs {head,body,foot}
  = hero mods attrs [ head, body, foot ]


-- HERO MODIFIERS --

{-| -}
type alias HeroModifiers = { bold  : Bool
                           , size  : HeroSize
                           , color : Color
                           }

{-| These are the stylistic defaults for `hero` containers.

    import Bulma.Modifiers exposing ( Size(Normal)
                                    , Color(Default)
                                    )

    myHeroModifiers : HeroModifiers
    myHeroModifiers
      = { bold  = False
        , size  = Normal
        , color = Default
        }
-}
heroModifiers : HeroModifiers
heroModifiers = { bold  = False
                , size  = Normal
                , color = Default
                }

{-| -}
type HeroSize = Normal
              | Medium
              | Large
              | FullHeight


-- HERO PARTITIONS --

{-| -}
type alias HeroPartition msg = Html msg

{-| -}
heroHead : Attrs msg -> Htmls msg -> HeroPartition msg
heroHead = node "div" [] [ bulma.hero.head ]

{-| -}
heroBody : Attrs msg -> Htmls msg -> HeroPartition msg
heroBody = node "div" [] [ bulma.hero.body ]

{-| -}
heroFoot : Attrs msg -> Htmls msg -> HeroPartition msg
heroFoot = node "div" [] [ bulma.hero.foot ]


-- SECTION ---------------------------------------------------------------------

{-| -}
type alias Section msg = Html msg

{-| Use sections as direct children of your top HTML element.

    view : Model -> Html msg
    view model
      = div []
        [ section NotSpaced []
          [ container []
            [ p [] [ text "Containers for your containers!" ]
            ]
          ]
        ]
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

{-| -}
type SectionSpacing = NotSpaced
                    | Spaced
                    | VerySpaced


-- FOOTER ----------------------------------------------------------------------

{-| -}
type alias Footer msg = Html msg

{-| A simple responsive footer which can include anything: lists, headings, columns, icons, buttons, etc.

    myFooter : Html msg
    myFooter
      = footer []
        [ container []
          [ content [ textCentered ]
            [ p [] 
              [ text "Ask your doctor if Bulma is right for you."
              ]
            ]
          ]
        ]

-}
footer : Attrs msg -> Htmls msg -> Footer msg
footer = node "footer" [] [ bulma.footer.container ]
