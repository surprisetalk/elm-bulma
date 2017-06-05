
module Bulma.Elements.Title exposing ( Size
                                     , auto
                                     , size
                                     , Spacing
                                     , spaced
                                     , notSpaced
                                     , toHtml
                                     , toHtmls
                                     , Title
                                     , title
                                     , subtitle
                                     , titleWithSubtitle
                                     , simpleTitle
                                     , simpleSubtitle
                                     , simpleTitleWithSubtitle
                                     )

-- IMPORTS ---------------------------------------------------------------------


-- MODIFIERS -------------------------------------------------------------------

type Size = Size01
          | Size02
          | Size03
          | Size04
          | Size05
          | Size06

auto : Size
auto = Auto

size : Int -> Size
size n = case clamp 1 6 n of
           01 -> Size01
           02 -> Size02
           03 -> Size03
           04 -> Size04
           05 -> Size05
           06 -> Size06
           _  -> Auto

type Spacing = Spaced
             | NotSpaced

spaced : Spacing
spaced = Spaced

notSpaced : Spacing
notSpaced = NotSpacing

-- TRANSFORMS ------------------------------------------------------------------

toHtml : Title msg -> Html msg

toHtmls : List (Title msg) -> List (Html msg)


-- TITLE -----------------------------------------------------------------------

type TitleType = Tit
               | Sub

type Title msg = Title TitleType (Maybe Spacing) Size (List (Attribute msg)) (List (Html msg))

title : Size -> List (Attribute msg) -> (List (Html msg)) -> Title msg

subtitle : Size -> List (Attribute msg) -> (List (Html msg)) -> Title msg

titleWithSubtitle : Spacing -> Size -> List (Attribute msg) -> (List (Html msg)) -> (List (Html msg)) -> Title msg

simpleTitle : Size -> String -> Title msg
              
simpleSubtitle : Size ->  String -> Title msg
                 
simpleTitleWithSubtitle : Spacing -> Size -> String -> String -> List (Title msg)
