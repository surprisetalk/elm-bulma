
module Bulma.Elements.Delete exposing ( Delete
                                      , delete
                                      , toHtml
                                      , Size
                                      , small
                                      , medium
                                      , large
                                      , setSize
                                      , setHelpers
                                      )
                                      
-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- DELETE ----------------------------------------------------------------------

type Delete msg = Delete Helpers (Maybe Size) (List (Attribute msg)) (List (Html msg))

delete : List (Attribute msg) -> List (Html msg) -> Delete msg
delete = Delete defaultHelpers


-- SIZE ------------------------------------------------------------------------

type Size = Small
          | Medium
          | Large

unsetSize : Delete msg -> Delete msg

setSmall : Delete msg -> Delete msg

setMedium : Delete msg -> Delete msg

setLarge : Delete msg -> Delete msg

sizeClass : Maybe Size -> Maybe String
sizeClass size
  = case size of
      Nothing     -> Nothing
      Just Small  -> Just "is-small"
      Just Medium -> Just "is-medium"
      Just Large  -> Just "is-large"


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Delete msg -> Html msg
toHtml (Delete helps size attrs htmls)
  = let classes : List String
        classes = (::) "delete"
                <| Maybe_.values
                <| [ sizeClass size
                  ]
                  
    in node helps "a" classes attrs htmls


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Delete msg -> Delete msg
setHelpers helps_ (Delete _ size attrs htmls)
  = Delete helps_ size attrs htmls
