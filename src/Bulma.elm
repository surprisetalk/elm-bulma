
module Bulma exposing ( Emphasis(..)
                      , Size(..)
                      , Style(..)
                      , State(..)
                      , Float(..)
                      , ClearFix(..)
                      , Overlay(..)
                      , TextAlign(..)
                      , Margin(..)
                      , Padding(..)
                      , Selectable(..)
                      )

-- IMPORTS ---------------------------------------------------------------------


-- CDN -------------------------------------------------------------------------

-- TODO: cdn
-- TODO: font awesome ?


-- MODIFIERS -------------------------------------------------------------------

-- TODO: we can stick all our modifiers in the same record! like a tree

type Emphasis = DefaultEmphasis
              | Primary
              | Info
              | Success
              | Warning
              | Danger

type Size = DefaultSize
          | Small
          | Medium
          | Large

type Style = Lined
           | Outlined

type State = Active
           | Loading
           | Disabled

type Float = NoFloat
           | FloatLeft
           | FloatRight

type ClearFix = NoFix
              | ClearFix

type Overlay = NoOverlay
             | Overlay

type FullWidth = DefaultWidth
               | FullWidth

type TextAlign = DefaultAlign
               | Left
               | Center
               | Right

type Margin = Margin
            | Marginless

type Padding = Padding
             | Paddingless

type Selectable = Selectable
                | Unselectable

type Device = Mobile
            | Tablet
            | Desktop
            | Widescreen

type alias Devices a = { mobile     : a
                       , tablet     : a
                       , desktop    : a
                       , widescreen : a
                       }

type alias Display = Devices DisplayType

type DisplayType = DefaultDisplay
                 | Hide
                 | Block       
                 | Flex       
                 | Inline    
                 | InlineBlock
                 | InlineFlex

type Orientation = Vertical
                 | Horizontal


-- GRID ------------------------------------------------------------------------

-- TODO: each of these should get its own unique modifiers record


-- COLUMNS --

type Gaps = Gaps
          | Gapless

type alias GridDisplay = Devices Bool

multiline : GridDisplay -> List (Column msg) -> Html msg
-- TODO: gaps

columns : GridDisplay -> List (Column msg) -> Html msg
-- TODO: gaps

type Narrow = Narrow
            | Flexible

column : ColumnDisplay -> Offset -> ColumnSize -> List (Attribute msg) -> List (Html msg) -> Html msg
-- TODO: narrow


-- TILES --

tiles : List Tile -> Html msg

tile : Orientation -> ColumnSize -> List (Attribute msg) -> List (Html msg) -> Tile


-- ELEMENTS --------------------------------------------------------------------


-- BOX --

box : Modifiers -> List (Attribute msg) -> List (Html msg) -> Html msg


-- BUTTON --

-- TODO


-- CONTENT --

content : Size -> List (Attribute msg) -> List (Html msg) -> Html msg


-- DELETE --

delete : Size -> List (Attribute msg) -> List (Html msg) -> Html msg


-- FORM --

-- TODO


-- ICON --

-- TODO


-- IMAGE --

type ImageSize = X16
               | X24
               | X32
               | X48
               | X64
               | X96
               | X128

type ImageRatio = OneByOne
                | FourByThree
                | ThreeByTwo
                | SixteenByNine
                | TwoByOne

image : Image.Modifiers -> List (Attribute msg) -> List (Html msg) -> Html msg

simpleImage : Image.Modifiers -> List (Attribute msg) -> String -> Html msg


-- NOTIFICATION --

-- TODO: outlook

notification : Notification.Modifiers -> List (Attribute msg) -> List (Html msg) -> Html msg

notificationWithDelete : Notification.Modifiers -> msg -> List (Attribute msg) -> List (Html msg) -> Html msg


-- PROGRESS --

-- TODO: outlook

-- TODO: size

-- TODO: percentage

progress : Float -> List (Attribute msg) ->  Html msg


-- TABLE --

-- TODO


-- TAGS --

-- TODO: color

-- TODO: size

-- TODO: delete

tag : Tag.Modifiers -> List (Attribute msg) -> List (Html msg) -> Html msg

simpleTag : Tag.Modifiers -> List (Attribute msg) -> String -> Html msg

simpleIconTag : Tag.Modifiers -> List (Attribute msg) -> Icon -> String -> Html msg

simpleTagWithDelete : Tag.Modifiers -> msg -> List (Attribute msg) -> String -> Html msg


-- TITLE --

-- TODO: size
-- TODO: is-spaced

title : Title.Modifiers -> List (Attribute msg) -> String -> Html msg

subtitle : Title.Modifiers -> List (Attribute msg) -> String -> Html msg

titleWithSubtitle : Title.Modifiers -> List (Attribute msg) -> String -> String -> Html msg


-- COMPONENTS ------------------------------------------------------------------


-- CARD --

type CardHeaderItem = CardHeaderTitle String
                    | CardHeaderIcon  Icon

type CardFooterItem msg = CardFooterItem (Html msg)

type CardElement msg = CardHeader  (List (CardHeaderItem    ))
                     | CardImage   (     (Image          msg))
                     | CardContent (List (Html           msg))
                     | CardFooter  (List (CardFooterItem msg))

card : Card.Modifiers -> List (Attribute msg) -> List CardElement -> Html msg

cardHeader : List (CardHeaderItem msg) -> CardHeader (List (CardHeaderItem msg))
cardHeader = CardHeader

cardImage : Image msg -> CardImage (Image msg)
cardImage = CardImage


-- LEVEL --

-- TODO: mobile

level : Level.Modifiers -> List (Attribute msg) -> List (Html msg) -> List (Html msg) -> Html msg

centeredLevel : Level.Modifiers -> List (Attribute msg) -> List (List (Html msg)) -> Html msg


-- MEDIA OBJECT --

media : List (Attribute msg) -> Maybe (Html msg) -> List (Html msg) -> Maybe (Html msg) -> Html msg


-- MENU --

type MenuElement msg = MenuLabel (Html msg)
                     | MenuList  (Html msg)

menu : List (Attribute msg) -> List (MenuElement msg) -> Html msg

menuLabel : List (Attribute msg) -> List (Html msg) -> MenuElement msg

menuList : List (Atribute msg) -> List (Html msg) -> MenuElement msg
-- TODO: automagically do ul/li


-- MESSAGE --

-- TODO: emphasis

-- type MessageElement msg = MessageHeader (Html msg)
--                         | MessageBody   (Html msg)

type MessageHeader msg = MessageHeader (List (Html msg))

type MessageBody msg = MessageBody (List (Html msg))

message : Emphasis -> List (Attribute msg) -> Maybe (MessageHeader msg) -> MessageBody msg -> Html msg

messageHeader : List (Attribute msg) -> List (Html msg) -> Html msg

messageBody : List (Attribute msg) -> List (Html msg) -> Html msg


-- MODAL --

-- TODO: open/close bool or union-type

type ModalBackground msg = ModalBackground (List (Html msg))

type ModalContent msg = ModalContent (List (Html  msg))
                      | ModalImage         (Image msg)
                      | ModalCard          (Card  msg)

type ModalClose msg = ModalClose (Html msg)

simpleModal : List (Attribute msg) -> ModalContent msg -> Html msg

modal : List (Attribute msg) -> Maybe (ModalBackground msg) -> ModalContent msg -> Maybe (ModalClose msg) -> Html msg

defaultModalBackground : ModalBackground msg

modalBackground : List (Attribute msg) -> List (Html msg) -> ModalBackground msg

modalContent : List (Attribute msg) -> List (Html msg) -> ModalContent msg

modalContentImage : List (Attribute msg) -> Image msg -> ModalContent msg

modalContentCard : List (Attribute msg) -> Card msg -> ModalContent msg

defaultModalClose : ModalClose msg

modalClose : List (Attribute msg) -> Html msg -> ModalClose msg


-- NAV --

-- TODO: nav-toggle
-- TODO: nav-menu

-- TODO: shadow
-- TODO: item active
-- TODO: item tab

type NavItem msg = NavItem NavItemModifiers (List (Html msg))

type NavLeft   msg = NavLeft   (List (NavItem msg))
type NavCenter msg = NavCenter (List (NavItem msg))
type NavRight  msg = NavRight  (List (NavItem msg))

nav : List (Attribute msg) -> Maybe (NavLeft msg) -> Maybe (NavCenter msg) -> Maybe (NavRight msg) -> Html msg

-- TODO: navLeft, navCenter, navRight, navItem 


-- PAGINATION --

-- TODO


-- PANEL --

-- TODO


-- TABS --

-- TODO


-- LAYOUT ----------------------------------------------------------------------


-- CONTAINER --

-- TODO: relate to navs, heros, sections, and footers

-- TODO


-- HERO --

-- TODO


-- SECTION --

-- TODO


-- FOOTER --

-- TODO
