
-- COLOR -----------------------------------------------------------------------

type Color = Black
           | Dark
           | Light
           | White
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


-- SIZE ------------------------------------------------------------------------

type Size = Normal
          | Medium
          | Large

normal : Size
normal = Normal

medium : Size
medium = Medium

large : Size
large = Large


-- TRANSFORMS ------------------------------------------------------------------

-- TODO: do we want to make a tag type?


-- TAGS ------------------------------------------------------------------------

tag : Size -> Color -> List (Attribute msg) -> List (Html msg) -> Html msg

tagWithDelete : Size -> Color -> msg -> List (Attribute msg) -> List (Html msg) -> Html msg

simpleTag : Size -> Color -> String -> Html msg

simpleIconTag : Size -> Color -> Icon -> String -> Html msg

simpleTagWithDelete : Size -> Color -> msg -> String -> Html msg

