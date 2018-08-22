
module Bulma.Layout exposing
  ( Container
  , container
  , fluidContainer
  , widescreenContainer
  , fullHDContainer
  , Level
  , level
  , horizontalLevel
  , centeredLevel
  , LevelPartition
  , levelLeft
  , levelRight
  , LevelItem
  , levelItem
  , levelItemLink
  , levelItemText
  , easyLevelItemWithHeading 
  , Media
  , media
  , MediaPartition
  , mediaContent
  , mediaLeft
  , mediaRight
  , Hero
  , HeroModifiers
  , heroModifiers
  , hero
  , easyHero
  , HeroPartition
  , heroBody
  , heroFoot
  , heroHead
  , Section
  , SectionSpacing(..)
  , section
  , Footer
  , footer
  , Tile
  , tile
  , tileAncestor
  , tileParent
  , tileChild
  , verticalTile
  , verticalTileParent
  )

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Container](#container)
- [Level](#level)
- [Media](#media)
- [Hero](#hero)
- [Section](#section)
- [Footer](#footer)
- [Tile](#tile)

# Container
@docs Container
@docs container, fluidContainer
@docs widescreenContainer, fullHDContainer

# Level
@docs Level
@docs level, horizontalLevel
@docs centeredLevel

## Level Partition
@docs LevelPartition
@docs levelLeft, levelRight

## Level Item
@docs LevelItem
@docs levelItem, levelItemLink, levelItemText
@docs easyLevelItemWithHeading 

# Media Object
@docs Media
@docs media

## Media Object Partition
@docs MediaPartition 
@docs mediaContent
@docs mediaLeft, mediaRight

# Hero
@docs Hero, HeroModifiers, heroModifiers
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

# Tile
Learn more about tiled grids in the [official docs](http://bulma.io/documentation/grid/tiles/).

    myGrid : Html msg
    myGrid 
      = tileAncestor Auto []
        [ verticalTile Width8 []
          [ tile Auto []
            [ verticalTileParent Auto []
              [ tileChild Auto []
                [ text "I'm in the top-left corner!"
                ]
              , [ text "I'm on the middle-left edge!"
                ]
              ]
            , tileParent Auto []
              [ text "I'm a tile touching the top-middle edge!"
              ]
            ]
          , tileParent Auto []
            [ tileChild Auto []
              [ text "I'm taking up the bottom-left half of the grid!"
              ]
            ]
          ]
        , tileParent Auto []
          [ tileChild Auto []
            [ text "I'm a tall column taking up the entire right edge!"
            ]
          ]
        ]

@docs Tile
@docs tile
@docs tileAncestor, tileParent, tileChild
@docs verticalTile, verticalTileParent

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import Bulma.Classes as B

import Bulma.Modifiers as Modifiers exposing (..)

import Html exposing ( Html, Attribute, div, p, text )
import Html.Attributes as Attr exposing ( class )


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
container : List (Attribute msg) -> List (Html msg) -> Container msg
container = node "div" [ B.container ]

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
fluidContainer : List (Attribute msg) -> List (Html msg) -> Container msg
fluidContainer = node "div" [ B.container, B.isFluid ]

{-| This container is full-width until the "widescreen" breakpoint.

    myWidescreenContainer : Html msg
    myWidescreenContainer
      = widescreenContainer []
        [ p [] [ text "This container fills the screen-width..." ]
        , p [] [ text "...until it hits the widescreen breakpoint." ]
        ]
-}
widescreenContainer : List (Attribute msg) -> List (Html msg) -> Container msg
widescreenContainer = node "div" [ B.container, B.isWidescreen ]

{-| This container is full-width until the "fullHD" breakpoint.

    fullHDContainer : Html msg
    fullHDContainer
      = widescreenContainer []
        [ p [] [ text "This container fills the screen-width..." ]
        , p [] [ text "...until it hits the fullHD breakpoint." ]
        ]
-}
fullHDContainer : List (Attribute msg) -> List (Html msg) -> Container msg
fullHDContainer = node "div" [ B.container, B.isFullHD ]


-- LEVEL -----------------------------------------------------------------------

{-| -}
type alias Level msg = Html msg

{-|
    myLevel : Html msg
    myLevel
      = level []
        [ levelLeft []
          [ levelItem [] []
          , levelItem [] []
          , levelItem [] []
          ]
        , levelRight []
          [ levelItem [] []
          , levelItem [] []
          , levelItem [] []
          ]
        ]
-}
level : List (Attribute msg) -> List (LevelPartition msg) -> Level msg
level = node "nav" [ B.level ]

{-| -}
horizontalLevel : List (Attribute msg) -> List (LevelPartition msg) -> Level msg
horizontalLevel = node "nav" [ B.level, B.isHorizontal ]

{-|
    myLevel : Html msg
    myLevel
      = centeredLevel []
        [ levelItem [] []
        , levelItem [] []
        , levelItem [] []
        ]
-}
centeredLevel : List (Attribute msg) -> List (LevelItem msg) -> Level msg
centeredLevel = level


-- LEVEL PARTITONS --

{-| -}
type alias LevelPartition msg = Html msg

{-| -}
levelLeft : List (Attribute msg) -> List (LevelItem msg) -> LevelPartition msg
levelLeft = node "div" [ B.levelLeft ]

{-| -}
levelRight : List (Attribute msg) -> List (LevelItem msg) -> LevelPartition msg
levelRight = node "div" [ B.levelRight ]

-- LEVEL ITEMS --

{-| -}
type alias LevelItem msg = Html msg

{-| -}
levelItem : List (Attribute msg) -> List (Html msg) -> LevelItem msg
levelItem = node "div" [ B.levelItem ]

{-| -}
levelItemText : List (Attribute msg) -> List (Html msg) -> LevelItem msg
levelItemText = node "p" [ B.levelItem ]

{-| -}
levelItemLink : List (Attribute msg) -> List (Html msg) -> LevelItem msg
levelItemLink = node "a" [ B.levelItem ]

{-| -}
easyLevelItemWithHeading : List (Attribute msg) -> String -> String -> LevelItem msg
easyLevelItemWithHeading attrs heading title
  = levelItem attrs
    [ div []
      [ p [ class "heading" ] [ text heading ]
      , p [ class "title"   ] [ text title   ]
      ]
    ]


-- MEDIA OBJECT ----------------------------------------------------------------

{-| -}
type alias Media msg = Html msg

{-| 
    myMediaObject : Html msg
    myMediaObject
      = media []
        [ mediaLeft    [] []
        , mediaContent [] []
        , mediaRight   [] []
        ]
-}
media : List (Attribute msg) -> List (MediaPartition msg) -> Media msg
media = node "article" [ B.media ]

-- {-| -}
-- largeMedia : List (Attribute msg) -> List (MediaPartition msg) -> Media msg
-- largeMedia = node "article" [] [ B.media.container
--                                , B.media.size.isLarge
--                                ]

-- MEDIA PARTITION --

{-| -}
type alias MediaPartition msg = Html msg

{-| -}
mediaLeft : List (Attribute msg) -> List (Html msg) -> MediaPartition msg
mediaLeft = node "div" [ B.mediaLeft ]

{-| -}
mediaContent : List (Attribute msg) -> List (Html msg) -> MediaPartition msg
mediaContent = node "div" [ B.mediaContent ]

{-| -}
mediaRight : List (Attribute msg) -> List (Html msg) -> MediaPartition msg
mediaRight = node "div" [ B.mediaRight ]


-- HERO ------------------------------------------------------------------------

{-| -}
type alias Hero msg = Html msg

{-| An imposing Hero banner to showcase something.

    import B.Layout exposing (hero,heroBody,container)
    import B.Elements exposing (TitleSize(H1,H2),title)

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
hero : HeroModifiers -> List (Attribute msg) -> List (HeroPartition msg) -> Hero msg
hero {bold,size,color}
  = node "section"
    [ B.hero
    , case bold of
        True  -> B.isBold
        False -> B.none
    , case size of
        Small    -> B.none
        Standard -> B.isMedium
        Medium   -> B.isLarge
        Large    -> B.isFullHeight
    , case color of
        Default -> B.none
        White   -> B.isWhite
        Black   -> B.isBlack
        Light   -> B.isLight
        Dark    -> B.isDark
        Primary -> B.isPrimary
        Info    -> B.isInfo
        Success -> B.isSuccess
        Warning -> B.isWarning
        Danger  -> B.isDanger
        Link    -> B.isLink
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
easyHero : HeroModifiers -> List (Attribute msg) -> { head : HeroPartition msg, body : HeroPartition msg, foot : HeroPartition msg } -> Hero msg
easyHero mods attrs {head,body,foot}
  = hero mods attrs [ head, body, foot ]


-- HERO MODIFIERS --

{-| -}
type alias HeroModifiers = { bold  : Bool
                           , size  : Size
                           , color : Color
                           }

{-| These are the stylistic defaults for `hero` containers.

    import B.Modifiers exposing ( Size(Standard)
                                    , Color(Default)
                                    )

    -- Small    -> "is-small"
    -- Standard -> "is-medium"
    -- Medium   -> "is-large"
    -- Large    -> "is-fullheight"

    myHeroModifiers : HeroModifiers
    myHeroModifiers
      = { bold  = False
        , size  = Large
        , color = Default
        }
-}
heroModifiers : HeroModifiers
heroModifiers = { bold  = False
                , size  = Small
                , color = Default
                }

-- {-| -}
-- type HeroSize = Standard
--               | Medium
--               | Large
--               | FullHeight


-- HERO PARTITIONS --

{-| -}
type alias HeroPartition msg = Html msg

{-| -}
heroHead : List (Attribute msg) -> List (Html msg) -> HeroPartition msg
heroHead = node "div" [ B.heroHead ]

{-| -}
heroBody : List (Attribute msg) -> List (Html msg) -> HeroPartition msg
heroBody = node "div" [ B.heroBody ]

{-| -}
heroFoot : List (Attribute msg) -> List (Html msg) -> HeroPartition msg
heroFoot = node "div" [ B.heroFoot ]


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
section : SectionSpacing -> List (Attribute msg) -> List (Html msg) -> Section msg
section spacing
  = node "section" 
    [ B.section
    , case spacing of
        NotSpaced  -> B.none
        Spaced     -> B.isMedium
        VerySpaced -> B.isLarge
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
footer : List (Attribute msg) -> List (Html msg) -> Footer msg
footer = node "footer" [ B.footer ]


-- TILES -----------------------------------------------------------------------

{-| -}
type alias Tile msg = Html msg

-- TODO: easyTiles

{-| This element is a plain tile container. 
It's best used as an intermediate tile in a 2D grid. 
You can also add "is-ancestor", "is-parent", "is-child", and "is-vertical" classes to to make a custom Bulma-grid implementation.
-}
tile : Width -> List (Attribute msg) -> List (Tile msg) -> Tile msg
tile width
  = node "div"
    [ B.tile
    , case width of
        Auto    -> B.none
        Width1  -> B.is1
        Width2  -> B.is2
        Width3  -> B.is3
        Width4  -> B.is4
        Width5  -> B.is5
        Width6  -> B.is6
        Width7  -> B.is7
        Width8  -> B.is8
        Width9  -> B.is9
        Width10 -> B.is10
        Width11 -> B.is11
    ]

{-| If you want to stack tiles vertically, use a vertical tile!
-}
verticalTile : Width -> List (Attribute msg) -> List (Tile msg) -> Tile msg
verticalTile width
  = node "div"
    [ B.tile
    , B.isVertical
    , case width of
        Auto    -> B.none
        Width1  -> B.is1
        Width2  -> B.is2
        Width3  -> B.is3
        Width4  -> B.is4
        Width5  -> B.is5
        Width6  -> B.is6
        Width7  -> B.is7
        Width8  -> B.is8
        Width9  -> B.is9
        Width10 -> B.is10
        Width11 -> B.is11
    ]

{-| This should always be your outer-most tile.

    myGrid : Html msg
    myGrid
      = tileAncestor Auto []
        [ tileParent Width8 [] 
          [ tileChild Auto [] []
          , tileChild Auto [] []
          ]
        , verticalTileParent Width4 [] 
          [ tileChild Auto [] []
          , tileChild Auto [] []
          ]
        ]
-}
tileAncestor : Width -> List (Attribute msg) -> List (Tile msg) -> Html msg
tileAncestor width
  = node "div"
    [ B.tile
    , B.isAncestor
    , case width of
        Auto    -> B.none
        Width1  -> B.is1
        Width2  -> B.is2
        Width3  -> B.is3
        Width4  -> B.is4
        Width5  -> B.is5
        Width6  -> B.is6
        Width7  -> B.is7
        Width8  -> B.is8
        Width9  -> B.is9
        Width10 -> B.is10
        Width11 -> B.is11
    ]

{-| Your tile-children must always be accompanied by a parent!
-}
tileParent : Width -> List (Attribute msg) -> List (Tile msg) -> Tile msg
tileParent width
  = node "div"
    [ B.tile
    , B.isParent
    , case width of
        Auto    -> B.none
        Width1  -> B.is1
        Width2  -> B.is2
        Width3  -> B.is3
        Width4  -> B.is4
        Width5  -> B.is5
        Width6  -> B.is6
        Width7  -> B.is7
        Width8  -> B.is8
        Width9  -> B.is9
        Width10 -> B.is10
        Width11 -> B.is11
    ]

{-| Your tile-children must always be accompanied by a parent!
-}
verticalTileParent : Width -> List (Attribute msg) -> List (Tile msg) -> Tile msg
verticalTileParent width
  = node "div"
    [ B.tile
    , B.isParent
    , B.isVertical
    , case width of
        Auto    -> B.none
        Width1  -> B.is1
        Width2  -> B.is2
        Width3  -> B.is3
        Width4  -> B.is4
        Width5  -> B.is5
        Width6  -> B.is6
        Width7  -> B.is7
        Width8  -> B.is8
        Width9  -> B.is9
        Width10 -> B.is10
        Width11 -> B.is11
    ]

{-| This tile holds your content! Its parent should always be `tileParent` or `verticalTileParent`.
-}
tileChild : Width -> List (Attribute msg) -> List (Html msg) -> Tile msg
tileChild width
  = node "div"
    [ B.tile
    , B.isChild
    , case width of
        Auto    -> B.none
        Width1  -> B.is1
        Width2  -> B.is2
        Width3  -> B.is3
        Width4  -> B.is4
        Width5  -> B.is5
        Width6  -> B.is6
        Width7  -> B.is7
        Width8  -> B.is8
        Width9  -> B.is9
        Width10 -> B.is10
        Width11 -> B.is11
    ]
