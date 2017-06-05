
module Bulma.Helpers exposing ( Helpers
                              , defaultHelpers
                              , node
                              )

-- IMPORTS ---------------------------------------------------------------------


-- NODE ------------------------------------------------------------------------

node : Helpers -> String -> List String -> List (Attribute msg) -> List (Html msg) -> Html msg


-- HELPERS ---------------------------------------------------------------------

type Float = FloatLeft
           | FloatRight

type Device = Mobile
            | Tablet
            | Desktop
            | Widescreen

type alias Devices a = { mobile     : a
                       , tablet     : a
                       , desktop    : a
                       , widescreen : a
                       }

type Display = Hide
             | Block       
             | Flex       
             | Inline    
             | InlineBlock
             | InlineFlex

type alias Helpers = { float        : Maybe Float
                     , fullWidth    : Bool
                     , clearfix     : Bool
                     , marginless   : Bool
                     , paddingless  : Bool
                     , unselectable : Bool
                     , show         : Devices (Maybe Display)
                     , hide         : Devices Bool
                     }

defaultHelpers : Helpers
defaultHelpers = { float        = Nothing
                 , fullWidth    = False
                 , clearfix     = False
                 , marginless   = False
                 , paddingless  = False
                 , unselectable = False
                 , show         = { mobile     = Nothing
                                  , tablet     = Nothing
                                  , desktop    = Nothing
                                  , widescreen = Nothing
                                  }
                 , hide         = { mobile     = False
                                  , tablet     = False
                                  , desktop    = False
                                  , widescreen = False
                                  }
                 }
