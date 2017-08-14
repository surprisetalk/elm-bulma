
module Bulma.Elements exposing (..)

-- DOCS ------------------------------------------------------------------------

{-| 
# Table of Contents
- [Box](#box)
- [Button](#button)
- [Content](#content)
- [Delete](#delete)
- [Icon](#icon)
- [Image](#image)
- [Notification](#notification)
- [Progress](#progress)
- [Table](#table)
- [Tag](#tag)
- [Title](#title)

# Box
@docs Box
@docs box

# Button
Moved to [Bulma.Form](http://package.elm-lang.org/packages/surprisetalk/elm-bulma/latest/Bulma-Grid#Button).

# Content
@docs Content
@docs content

# Delete
@docs Delete
@docs delete, easyDelete

# Image
@docs Image, ImageModifiers, ImageSize, ImageAspectRatio, imageModifiers
@docs image, easyImage, easyPlaceholderImage

# Notification
@docs Notification
@docs notification, notificationWithDelete

# Progress
@docs Progress, ProgressModifiers, progressModifiers
@docs progress, easyProgress

# Table
@docs Table, TableModifiers, tableModifiers
@docs table

## Table Partition
@docs TablePartition
@docs tableBody, tableHead, tableFoot

### Table Row
@docs TableRow, IsHighlighted
@docs tableRow

#### Table Cell
@docs TableCell
@docs tableCell, tableCellHead

# Tag
@docs Tag, TagModifiers, tagModifiers
@docs tag, easyTag
@docs roundedTag, easyRoundedTag
@docs tagWithDelete, easyTagWithDelete, easyRoundedTagWithDelete

## Tag Groups
@docs tags
@docs multitag

# Title
@docs Title, TitleSize
@docs title, subtitle

## Title Pair
@docs TitleSpacing 
@docs easyTitleWithSubtitle
-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import BulmaClasses exposing (..)

import Bulma.Modifiers as Modifiers exposing (..)

import Bulma.Elements.Icon as Icon exposing ( Icon, IconBody, icon )

import Bulma.Form as Form exposing ( Control )

import Html exposing ( Html, text, div, a, img, span )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class )

import List exposing ( filter )


-- BOX -------------------------------------------------------------------------

{-| -}
type alias Box msg = Html msg

{-| A white box to contain other elements.
The box is simply a container with a shadow, a border, a radius, and some padding.

    myBox : Html msg
    myBox 
      = box []
        [ p [] 
          [ text "I'm the box ghost!" ]
        ]
-}
box : Attrs msg -> Htmls msg -> Box msg
box = node "div" [] [ bulma.box.container ]


-- CONTENT ---------------------------------------------------------------------

{-| -}
type alias Content msg = Html msg

{-| A single class to handle WYSIWYG-generated content, where only HTML tags are available.

    import Bulma.Modifiers exposing (Size(Normal))

    myContent : Html msg
    myContent
      = content Normal []
        [ p [] [ text "Lorem ipsum..." ] 
        ]
        
It can handle almost any HTML element, including:
- `p`
- `ul` / `ol` / `dl`
- `h1` through `h6`
- `blockquote`
- `em` & `strong`
- `table`, `tr`, `th`, and `td` tables
-}
content : Size -> Attrs msg -> Htmls msg -> Content msg
content size
  = node "div" []
    [ bulma.content.container
    , case size of
        Small  -> bulma.content.size.isSmall
        Normal -> ""
        Medium -> bulma.content.size.isMedium
        Large  -> bulma.content.size.isLarge
    ]


-- DELETE ----------------------------------------------------------------------

{-| -}
type alias Delete msg = Html msg

{-| Versatile delete cross.
-}
delete : Attrs msg -> Htmls msg -> Delete msg
delete = node "a" [] [ bulma.delete.ui ]

{-| 
    type Msg = DeleteMsg

    myEasyDelete : Html Msg
    myEasyDelete
      = easyDelete [] DeleteMsg
-}
easyDelete : Attrs msg -> msg -> Delete msg
easyDelete attrs msg = delete (onClick msg :: attrs) []


-- IMAGE -----------------------------------------------------------------------

{-| -}
type alias Image msg = Html msg

{-| -}
type alias ImageModifiers = { size        : Maybe ImageSize
                            , aspectRatio : Maybe ImageAspectRatio
                            }

{-| -}
type ImageSize = X16
               | X24
               | X32
               | X48
               | X64
               | X96
               | X128

{-| -}
type ImageAspectRatio = OneByOne
                      | FourByThree
                      | ThreeByTwo
                      | SixteenByNine
                      | TwoByOne

{-| -}
imageModifiers : ImageModifiers
imageModifiers = { size        = Nothing
                 , aspectRatio = Nothing
                 }

{-| Use the `image` container to specify a precisely-sized container so that your layout isn't broken because of loading or broken images.

    myImageModifiers : ImageModifiers
    myImageModifiers
      = { size        = Just X64
        , aspectRatio = Just OneByOne
        }

    myImage : Html msg
    myImage
      = image myImageModifiers []
        [ img [ src "https://i.imgur.com/pPjvmVS.jpg" ] []
        ]
-}
image : ImageModifiers -> Attrs msg -> Htmls msg -> Image msg
image {size,aspectRatio}
  = node "figure" []
    [ bulma.image.container
    , case size of
        Just X16  -> bulma.image.size.is16x16
        Just X24  -> bulma.image.size.is24x24
        Just X32  -> bulma.image.size.is32x32
        Just X48  -> bulma.image.size.is48x48
        Just X64  -> bulma.image.size.is64x64
        Just X96  -> bulma.image.size.is96x96
        Just X128 -> bulma.image.size.is128x128
        _         -> ""
    , case aspectRatio of
        Just OneByOne      -> bulma.image.size.is1by1
        Just FourByThree   -> bulma.image.size.is4by3
        Just ThreeByTwo    -> bulma.image.size.is3by2
        Just SixteenByNine -> bulma.image.size.is16by9
        Just TwoByOne      -> bulma.image.size.is2by1
        _                  -> ""
    ]

{-| 
    myImageModifiers : ImageModifiers
    myImageModifiers
      = { size        = Just X64
        , aspectRatio = Just OneByOne
        }

    myEasyImage : Html msg
    myEasyImage
      = easyImage myImageModifiers []
        "http://i.imgur.com/I47PSAO.png"
-}
easyImage : ImageModifiers -> Attrs msg -> String -> Image msg
easyImage mods attrs src = image mods attrs [ img [ Attr.src src ] [] ]

{-| 
    myEasyPlaceholderImage : Html msg
    myEasyPlaceholderImage
      = easyPlaceholderImage myImageModifiers []
-}
easyPlaceholderImage : ImageModifiers -> Attrs msg -> Image msg
easyPlaceholderImage ({size,aspectRatio} as mods) attrs
  = image mods attrs
    [ flip img []
      [ Attr.src
        <| (\(h,w) -> "http://bulma.io/images/placeholders/" ++ toString h ++ "x" ++ toString w ++ ".png")
        <| case ( size, aspectRatio ) of
            ( Just X16 , Just OneByOne      ) -> (  16,  16  )
            ( Just X24 , Just OneByOne      ) -> (  24,  24  )
            ( Just X32 , Just OneByOne      ) -> (  32,  32  )
            ( Just X48 , Just OneByOne      ) -> (  48,  48  )
            ( Just X64 , Just OneByOne      ) -> (  64,  64  )
            ( Just X96 , Just OneByOne      ) -> (  96,  96  )
            ( Just X128, Just OneByOne      ) -> ( 128, 128  )
            (      _   , Just FourByThree   ) -> ( 640, 480  )
            (      _   , Just ThreeByTwo    ) -> ( 480, 320  )
            (      _   , Just SixteenByNine ) -> ( 640, 360  )
            (      _   , Just TwoByOne      ) -> ( 640, 320  )
            (      _   ,      _             ) -> ( 256, 256  )
      ]
    ]


-- NOTIFICATION ----------------------------------------------------------------

{-| -}
type alias Notification msg = Html msg

{-| 
    import Bulma.Modifiers exposing (Color(Danger))

    myNotification : Html msg
    myNotification
      = notification Danger []
        [ text "Something went wrong!"
        ]
-}
notification : Color -> Attrs msg -> Htmls msg -> Notification msg
notification color
  = node "div" []
    [ bulma.notification.ui
    , case color of
        Default -> ""
        White   -> bulma.notification.color.isWhite
        Light   -> bulma.notification.color.isLight
        Dark    -> bulma.notification.color.isDark
        Black   -> bulma.notification.color.isBlack
        Primary -> bulma.notification.color.isPrimary
        Info    -> bulma.notification.color.isInfo
        Success -> bulma.notification.color.isSuccess
        Warning -> bulma.notification.color.isWarning
        Danger  -> bulma.notification.color.isDanger
    ]

{-| 
    import Bulma.Modifiers exposing (Color(Success))
    
    type Msg = ClearNotificationsMsg

    myNotification : Html Msg
    myNotification
      = notificationWithDelete Danger []
        ClearNotificationsMsg
        [ text "Something went right!"
        ]
-}
notificationWithDelete : Color -> Attrs msg -> msg -> Htmls msg -> Notification msg
notificationWithDelete color attrs msg
  = notification color attrs << (::) (easyDelete [] msg)


-- PROGRESS --------------------------------------------------------------------

{-| -}
type alias Progress msg = Html msg

{-| -}
type alias ProgressModifiers = { size  : Size
                               , color : Color
                               } 

{-| -}
progressModifiers : ProgressModifiers
progressModifiers = { size  = Normal
                    , color = Default
                    } 

{-| 
    myProgressBar : Int -> Int -> Html msg
    myProgressBar pVal pMax
      = progress myProgressModifiers 
        [ value <| toString pVal
        , max   <| toString pMax
        ] 
        []
-}
progress : ProgressModifiers -> Attrs msg -> Htmls msg -> Progress msg
progress {size,color}
  = node "progress" [] 
    [ bulma.progress.ui
    , case size of
        Small  -> bulma.progress.size.isSmall
        Normal -> ""
        Medium -> bulma.progress.size.isMedium
        Large  -> bulma.progress.size.isLarge
    , case color of
        Default -> ""
        White   -> bulma.progress.color.isWhite
        Light   -> bulma.progress.color.isLight
        Dark    -> bulma.progress.color.isDark
        Black   -> bulma.progress.color.isBlack
        Primary -> bulma.progress.color.isPrimary
        Info    -> bulma.progress.color.isInfo
        Success -> bulma.progress.color.isSuccess
        Warning -> bulma.progress.color.isWarning
        Danger  -> bulma.progress.color.isDanger
    ]

{-|
    myProgressBar : Float -> Html msg
    myProgressBar percentCompleted
      = progress myProgressModifiers []
        percentCompleted
-}
easyProgress : ProgressModifiers -> Attrs msg -> Float -> Progress msg
easyProgress mods attrs val
  = progress mods (Attr.value (toString (round (val * 100))) :: attrs) []


-- TABLE -----------------------------------------------------------------------

{-| -}
type alias Table msg = Html msg

{-| -}
type alias TableModifiers = { bordered : Bool
                            , striped  : Bool
                            , narrow   : Bool
                            }

{-| -}
tableModifiers : TableModifiers
tableModifiers = { bordered = False
                 , striped  = False
                 , narrow   = False
                 }

{-| 
    myTable : Html msg
    myTable 
      = table myTableModifiers []
        [ tableHead [] []
        , tableBody [] []
        , tableFoot [] []
        ]
-}
table : TableModifiers -> Attrs msg -> List (TablePartition msg) -> Table msg
table {bordered,striped,narrow}
  = node "table" []
    [ bulma.table.container
    , case bordered of
        True  -> bulma.table.style.isBordered
        False -> ""
    , case striped of
        True  -> bulma.table.style.isStriped
        False -> ""
    , case narrow of
        True  -> bulma.table.spacing.isNarrow
        False -> ""
    ]


-- TABLE PARTITIONS --

{-| -}
type alias TablePartition msg = Html msg

{-|
    myTableHead : Html msg
    myTableHead 
      = tableHead []
        [ tableRow False []
          [ tableCellHead [] []
          , tableCellHead [] []
          , tableCellHead [] []
          ]
        ]
-}
tableHead : Attrs msg -> List (TableRow msg) -> TablePartition msg
tableHead = node "thead" [] []

{-|
    myTableBody : Html msg
    myTableBody 
      = tableBody []
        [ tableRow False []
          [ tableCell [] []
          , tableCell [] []
          , tableCell [] []
          ]
        , tableRow True  []
          [ tableCell [] []
          , tableCell [] []
          , tableCell [] []
          ]
        ]
-}
tableBody : Attrs msg -> List (TableRow msg) -> TablePartition msg
tableBody = node "tbody" [] []

{-|
    myTableFoot : Html msg
    myTableFoot 
      = tableFoot []
        [ tableRow False []
          [ tableCellHead [] []
          , tableCellHead [] []
          , tableCellHead [] []
          ]
        ]
-}
tableFoot : Attrs msg -> List (TableRow msg) -> TablePartition msg
tableFoot = node "tfoot" [] []


-- TABLE ROW --

{-| -}
type alias TableRow msg = Html msg

{-| -}
type alias IsHighlighted = Bool

{-| -}
tableRow : IsHighlighted -> Attrs msg -> List (TableCell msg) -> TableRow msg
tableRow highlighted
  = node "tr" []
    [ case highlighted of
        True  -> bulma.table.row.state.isSelected
        False -> bulma.table.row.state.isSelected
    ]


-- TABLE CELLS --

{-| -}
type alias TableCell msg = Html msg

{-| -}
tableCell : Attrs msg -> Htmls msg -> TableCell msg
tableCell = node "td" [] []

{-| -}
tableCellHead : Attrs msg -> Htmls msg -> TableCell msg
tableCellHead = node "th" [] []


-- TAG -------------------------------------------------------------------------

{-| -}
type alias Tag msg = Html msg

{-| -}
type alias TagModifiers = { size  : Size
                          , color : Color
                          }

{-| -}
tagModifiers : TagModifiers
tagModifiers = { size  = Normal
               , color = Default
               } 

{-| 
    myTag : Html msg
    myTag
      = tag myTagModifiers []
        [ text "Hip to Be Square"
        ]
-}
tag : TagModifiers -> Attrs msg -> Htmls msg -> Tag msg
tag {size,color}
  = node "span" []
    [ bulma.tag.ui
    , case size of
        Small  -> "" -- KLUDGE
        Normal -> ""
        Medium -> bulma.tag.size.isMedium
        Large  -> bulma.tag.size.isLarge
    , case color of
        Default -> ""
        White   -> bulma.tag.color.isWhite
        Light   -> bulma.tag.color.isLight
        Dark    -> bulma.tag.color.isDark
        Black   -> bulma.tag.color.isBlack
        Primary -> bulma.tag.color.isPrimary
        Info    -> bulma.tag.color.isInfo
        Success -> bulma.tag.color.isSuccess
        Warning -> bulma.tag.color.isWarning
        Danger  -> bulma.tag.color.isDanger
    ]

{-| 
    myTag : Html msg
    myTag
      = roundedTag myTagModifiers []
        [ text "Behold! I'm circlular!"
        ]
-}
roundedTag : TagModifiers -> Attrs msg -> Htmls msg -> Tag msg
roundedTag mods attrs
  = tag mods <| class "is-rounded" :: attrs

{-| 
    myTag : Html msg
    myTag
      = easyTag myTagModifiers []
        "That was easy."
-}
easyTag : TagModifiers -> Attrs msg -> String -> Tag msg
easyTag mods attrs = text >> ls >> tag mods attrs 

{-| -}
easyRoundedTag : TagModifiers -> Attrs msg -> String -> Tag msg
easyRoundedTag mods attrs = text >> ls >> roundedTag mods attrs 

{-|
    type Msg = DeleteTag Id

    myTag : Id -> Html Msg
    myTag id
      = tagWithDelete myTagModifiers []
        (DeleteTag id)
        [ text "cool"
        ]
-}
tagWithDelete : TagModifiers -> Attrs msg -> msg -> Htmls msg -> Tag msg
tagWithDelete mods attrs msg
  = flip (++) [ easyDelete [] msg ] >> tag mods attrs

{-|
    type Msg = DeleteTag Id

    myTag : Id -> Html Msg
    myTag id
      = tagWithDelete myTagModifiers []
        (DeleteTag id)
        "cooler"
-}
easyTagWithDelete : TagModifiers -> Attrs msg -> msg -> String -> Tag msg
easyTagWithDelete mods attrs msg str
  = tag mods attrs [ text str, easyDelete [] msg ]

{-| -}
easyRoundedTagWithDelete : TagModifiers -> Attrs msg -> msg -> String -> Tag msg
easyRoundedTagWithDelete mods attrs msg str
  = roundedTag mods attrs [ text str, easyDelete [] msg ]

    
-- TAG GROUPS --

{-| 
    myTags : Html msg
    myTags
      = tags []
        [ myFirstTag
        , mySecondTag
        ]
-}
tags : Attrs msg -> List (Tag msg) -> Html msg
tags = node "div" [] [ "tags" ]
-- KLUDGE: add to BulmaClasses

{-| 
    myMultitag : Html msg
    myMultitag
      = multitag []
        [ myFirstTag
        , mySecondTag
        ]

    myMultitags : Html msg
    myMultitags
      = multilineFieldGroup []
        [ control myControlModifiers []
          [ myMultiTag 
          ]
        , control myControlModifiers []
          [ myMultiTag 
          ]
        , control myControlModifiers []
          [ myMultiTag 
          ]
        ]
-}
multitag : Attrs msg -> List (Tag msg) -> Html msg
multitag = node "div" [] [ "tags", "has-addons" ]


-- TITLE -----------------------------------------------------------------------

{-| -}
type alias Title msg = Html msg

{-| -}
type TitleSize = H1
               | H2
               | H3
               | H4
               | H5
               | H6

{-|
    myTitle : Html msg
    myTitle
      = title H1 [] 
        [ text "Hullo"
        ]
-}
title : TitleSize -> Attrs msg -> Htmls msg -> Title msg
title size
  = node "p" []
    [ bulma.heading.title
    , case size of
        H1 -> bulma.heading.size.is1
        H2 -> bulma.heading.size.is2
        H3 -> bulma.heading.size.is3
        H4 -> bulma.heading.size.is4
        H5 -> bulma.heading.size.is5
        H6 -> bulma.heading.size.is6
    ]


-- SUBTITLE --

{-|
    mySubtitle : Html msg
    mySubtitle
      = subtitle H3 [] 
        [ text "World"
        ]
-}
subtitle : TitleSize -> Attrs msg -> Htmls msg -> Title msg
subtitle size
  = node "p" [] 
    [ bulma.heading.subtitle
    , case size of
        H1 -> bulma.heading.size.is1
        H2 -> bulma.heading.size.is2
        H3 -> bulma.heading.size.is3
        H4 -> bulma.heading.size.is4
        H5 -> bulma.heading.size.is5
        H6 -> bulma.heading.size.is6
    ]


-- TITLE PAIR --

{-| -}
type alias TitleSpacing = Bool

{-| 
    myTitle : Html msg
    myTitle
      = easyTitleWithSubtitle False H1
        [ text "EPISODE V" ]
        [ text "THE EMPIRE STRIKES BACK" ]
-}
easyTitleWithSubtitle : TitleSpacing -> TitleSize -> Htmls msg -> Htmls msg -> List (Title msg)
easyTitleWithSubtitle spacing size title subtitle
  = [ node "p" []
      [ bulma.heading.title
      , case spacing of
          True  -> bulma.heading.spacing.isNormal
          False -> ""
      , case size of
          H1 -> bulma.heading.size.is1
          H2 -> bulma.heading.size.is2
          H3 -> bulma.heading.size.is3
          H4 -> bulma.heading.size.is4
          H5 -> bulma.heading.size.is5
          H6 -> bulma.heading.size.is6
      ]
      [
      ]
      title
    , node "p" [] 
      [ bulma.heading.subtitle
      , case size of
          H1 -> bulma.heading.size.is3
          H2 -> bulma.heading.size.is4
          H3 -> bulma.heading.size.is5
          _  -> bulma.heading.size.is6
      ]
      [
      ]
      subtitle
    ]

