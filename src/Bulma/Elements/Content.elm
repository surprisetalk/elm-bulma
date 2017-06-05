
module Bulma.Elements.Content exposing ( Content
                                       , content
                                       , toHtml
                                       , Size
                                       , small
                                       , medium
                                       , large
                                       , setSize
                                       , setHelpers
                                       )

-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- CONTENT ---------------------------------------------------------------------

type Content msg = Content Helpers (Maybe Size) (List (Attribute msg)) (List (Html msg))

content : List (Attribute msg) -> List (Html msg) -> Content msg
content = Content defaultHelpers


-- SIZE ------------------------------------------------------------------------

type Size = Small
          | Medium
          | Large

unsetSize : Content msg -> Content msg

setSmall : Content msg -> Content msg

setMedium : Content msg -> Content msg

setLarge : Content msg -> Content msg

sizeClass : Maybe Size -> Maybe String
sizeClass size
  = case size of
      Nothing     -> Nothing
      Just Small  -> Just "is-small"
      Just Medium -> Just "is-medium"
      Just Large  -> Just "is-large"


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Content msg -> Html msg
toHtml (Content helps size attrs htmls)
  = let classes : List String
        classes = (::) "content"
                <| Maybe_.values
                <| [ sizeClass size
                  ]
                  
    in node helps "div" classes attrs htmls


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Content msg -> Content msg
setHelpers helps_ (Content _ size attrs htmls)
  = Content helps_ size attrs htmls


