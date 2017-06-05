
module Bulma.Layout.Footer exposing ( Footer
                                    , footer
                                    , toHtml
                                    , setHelpers
                                    )
                                    
-- IMPORTS ---------------------------------------------------------------------

import Bulma exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- FOOTER -----------------------------------------------------------------------

type Footer msg = Footer Helpers (List (Attribute msg)) (Container msg)

-- TODO: easyFooter

fromContainer : List (Attribute msg) -> Container msg -> Footer msg


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Footer msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Footer msg -> Footer msg
