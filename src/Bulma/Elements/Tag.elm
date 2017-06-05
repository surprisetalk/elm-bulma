
module Bulma.Elements.Tag exposing ( Tag
                                   , tag
                                   , toHtml
                                   , setHelpers
                                   )
                                        
-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- TAGS ------------------------------------------------------------------------

tag : List (Attribute msg) -> List (Html msg) -> Html msg

tagWithDelete : List (Attribute msg) -> msg -> List (Html msg) -> Html msg

easyTag : String -> Html msg

easyIconTag : Icon -> String -> Html msg

easyTagWithDelete : msg -> String -> Html msg


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

unsetColor : Tag msg -> Tag msg

setBlack : Tag msg -> Tag msg
           
setDark : Tag msg -> Tag msg
          
setLight : Tag msg -> Tag msg
           
setWhite : Tag msg -> Tag msg
           
setPrimary : Tag msg -> Tag msg
             
setInfo : Tag msg -> Tag msg
          
setSuccess : Tag msg -> Tag msg
             
setWarning : Tag msg -> Tag msg
             
setDanger : Tag msg -> Tag msg
            

-- SIZE ------------------------------------------------------------------------

type Size = Normal
          | Medium
          | Large

unsetSize : Tag msg -> Tag msg

setNormal : Tag msg -> Tag msg
            
setMedium : Tag msg -> Tag msg
            
setLarge : Tag msg -> Tag msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Tag msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Tag msg -> Tag msg
