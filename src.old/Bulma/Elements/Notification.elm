
module Bulma.Elements.Notification exposing ( Notification
                                            , notification
                                            , easyNotification
                                            , notificationWithDelete
                                            , easyNotificationWithDelete
                                            , normal
                                            , primary
                                            , info
                                            , success
                                            , warning
                                            , danger
                                            , toHtml
                                            , addClass
                                            , setHelpers
                                            )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Notification, notification, easyNotification 
@docs notificationWithDelete, easyNotificationWithDelete

@docs normal, primary, info, success, warning, danger

@docs toHtml, addClass, setHelpers

-}
-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Delete as Delete exposing ( Delete, easyDelete )

import Html exposing ( Html, Attribute, text, div )


-- NOTIFICATION ----------------------------------------------------------------

{-| TODO
-}
type alias Notification msg = Entity Color (Htmls msg) msg

{-| TODO
-}
notification : Attrs msg -> Htmls msg -> Notification msg
notification = entity "div" [ "notification" ] Normal

{-| TODO
-}
easyNotification : String -> Notification msg
easyNotification = notification [] << ls << text

{-| TODO
-}
notificationWithDelete : Attrs msg -> Delete msg -> Htmls msg -> Notification msg
notificationWithDelete attrs del = notification [] << (::) (Delete.toHtml del)

{-| TODO
-}
easyNotificationWithDelete : msg -> String -> Notification msg
easyNotificationWithDelete msg = notification []
                               << (::) (easyDelete msg |> Delete.toHtml)
                               << ls
                               << text


-- COLOR -----------------------------------------------------------------------

{-| TODO
-}
type Color = Normal
           | Primary
           | Info
           | Success
           | Warning
           | Danger

{-| TODO
-}
setColor : Color -> Notification msg -> Notification msg
setColor = mapMods << y

{-| TODO
-}
normal : Notification msg -> Notification msg
normal = setColor Normal

{-| TODO
-}
primary : Notification msg -> Notification msg
primary = setColor Primary

{-| TODO
-}
info : Notification msg -> Notification msg
info = setColor Info

{-| TODO
-}
success : Notification msg -> Notification msg
success = setColor Success

{-| TODO
-}
warning : Notification msg -> Notification msg
warning = setColor Warning

{-| TODO
-}
danger : Notification msg -> Notification msg
danger = setColor Danger

{-| TODO
-}
colorClass : Color -> String
colorClass color
  = case color of
      Normal  -> ""
      Primary -> "is-primary"
      Info    -> "is-info"
      Success -> "is-success"
      Warning -> "is-warning"
      Danger  -> "is-danger"


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Notification msg -> Html msg
toHtml = Entity.toHtml (colorClass >> ls) (y []) identity

{-| TODO
-}
addClass : String -> Notification msg -> Notification msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Notification msg -> Notification msg
setHelpers = Entity.setHelpers
