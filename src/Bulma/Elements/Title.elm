
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
                                     , easyTitle
                                     , easySubtitle
                                     , easyTitleWithSubtitle
                                     )


-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- TITLE -----------------------------------------------------------------------

type TitleType = Tit
               | Sub

type Title msg = Title TitleType (Maybe Spacing) Size (List (Attribute msg)) (List (Html msg))

title : List (Attribute msg) -> (List (Html msg)) -> Title msg

subtitle : List (Attribute msg) -> (List (Html msg)) -> Title msg

titleWithSubtitle :  List (Attribute msg) -> (List (Html msg)) -> (List (Html msg)) -> Title msg

easyTitle : String -> Title msg
              
easySubtitle : String -> Title msg
                 
easyTitleWithSubtitle : String -> String -> List (Title msg)


-- SIZE ------------------------------------------------------------------------

type Size = Size01
          | Size02
          | Size03
          | Size04
          | Size05
          | Size06

unsetSize : Title msg -> Title msg

setSize : Int -> Title msg -> Title msg
setSize n = case clamp 1 6 n of
              01 -> Size01
              02 -> Size02
              03 -> Size03
              04 -> Size04
              05 -> Size05
              06 -> Size06
              _  -> Auto


-- SPACING ---------------------------------------------------------------------

type Spacing = Spaced
             | NotSpaced

unsetSpaced : Title msg -> Title msg

setSpaced : Title msg -> Title msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Title msg -> Html msg

toHtmls : List (Title msg) -> List (Html msg)


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Title msg -> Title msg

