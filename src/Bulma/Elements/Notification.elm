
module Bulma.Elements.Notification exposing ( Notification
                                            , notification
                                            , notificationWithDelete
                                            , toHtml
                                            , setHelpers
                                            )

-- IMPORTS ---------------------------------------------------------------------

import Bulma.Helpers exposing ( Helpers, defaultHelpers, node )

import Html exposing ( Html, Attribute )


-- NOTIFICATION ----------------------------------------------------------------

notification : List (Attribute msg) -> List (Html msg) -> Html msg

notificationWithDelete : List (Attribute msg) -> msg -> List (Html msg) -> Html msg

easyNotification : String -> Html msg

easyNotificationWithDelete : msg -> String -> Html msg


-- NOTIFICATION ----------------------------------------------------------------

type Emphasis = Primary
              | Info
              | Success
              | Warning
              | Danger

unsetEmphasis : Notification msg -> Notification msg

setPrimary : Notification msg -> Notification msg

setInfo : Notification msg -> Notification msg

setSuccess : Notification msg -> Notification msg

setWarning : Notification msg -> Notification msg

setDanger : Notification msg -> Notification msg

emphasisClass : Maybe Emphasis -> Maybe String


-- TRANSFORMS ------------------------------------------------------------------

toHtml : Notification msg -> Html msg


-- HELPERS ---------------------------------------------------------------------

setHelpers : Helpers -> Notification msg -> Notification msg
