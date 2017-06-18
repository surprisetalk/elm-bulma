
module Bulma.Components.Media.Section exposing ( Section
                                               )

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Nav    as Nav      exposing ( Nav      )
import Bulma.Elements.Content  as Content  exposing ( Content  )
import Bulma.Elements.Progress as Progress exposing ( Progress )
import Bulma.Elements.Table    as Table    exposing ( Table    )
import Bulma.Elements.Tag      as Tag      exposing ( Tag      )
import Bulma.Elements.Image    as Image    exposing ( Image    )
import Bulma.Elements.Button   as Button   exposing ( Button   )
import Bulma.Elements.Form     as Form     exposing ( Field    )
import Bulma.Elements.Icon     as Icon     exposing ( Icon     )
import Bulma.Elements.Box      as Box      exposing ( Box      )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text )


-- MEDIA SECTION ---------------------------------------------------------------

type Body msg = BodyHtmls    (Htmls    msg)
              | BodyBox      (Box      msg)
              | BodyContent  (Content  msg)
              | BodyProgress (Progress msg)
              | BodyTable    (Table    msg)
              | BodyTag      (Tag      msg)  
              | BodyNav      (Nav      msg)
              | BodyImage    (Image    msg)
              | BodyButton   (Button   msg)
              | BodyIcon     (Icon     msg)
              | BodyField    (Field    msg)
              | BodyMedia    (Media    msg)

type alias Section msg = Entity () (Body msg) msg

section_ : Attrs msg -> Body msg -> Section msg
section_ = entity "div" [] ()
           -- TODO: we have to addClass in Media

section : Attrs msg -> Htmls msg -> Section msg
section = section_ |-~-> BodyHtmls

fromBox : Attrs msg -> Box msg -> Section msg
fromBox = section_ |-~-> BodyBox

fromContent : Attrs msg -> Content msg -> Section msg
fromContent = section_ |-~-> BodyContent

fromProgress : Attrs msg -> Progress msg -> Section msg
fromProgress = section_ |-~-> BodyProgress

fromTable : Attrs msg -> Table msg -> Section msg
fromTable = section_ |-~-> BodyTable

fromTag : Attrs msg -> Tag msg -> Section msg
fromTag = section_ |-~-> BodyTag

fromNav : Attrs msg -> Nav msg -> Section msg
fromNav = section_ |-~-> BodyNav

fromImage : Attrs msg -> Image msg -> Section msg
fromImage = section_ |-~-> BodyImage

fromTitle : Attrs msg -> Title msg -> Section msg
fromTitle = section_ |-~-> BodyTitle

fromButton : Attrs msg -> Button msg -> Section msg
fromButton = section_ |-~-> BodyButton

fromIcon : Attrs msg -> Icon msg -> Section msg
fromIcon = section_ |-~-> BodyIcon

fromField : Attrs msg -> Field msg -> Section msg
fromField = section_ |-~-> BodyField

fromMedia : Attrs msg -> Media msg -> Section msg
fromMedia = section_ |-~-> BodyMedia

-- TODO: more elements & components?


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Section msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \body ->
         case body of
           BodyHtmls    htmls    -> htmls
           BodyBox      box      -> box      |> ls |> map Box.toHtml
           BodyContent  content  -> content  |> ls |> map Content.toHtml
           BodyProgress progress -> progress |> ls |> map Progress.toHtml
           BodyTable    table    -> table    |> ls |> map Table.toHtml
           BodyTag      tag      -> tag      |> ls |> map Tag.toHtml
           BodyNav      nav      -> nav      |> ls |> map Nav.toHtml
           BodyImage    image    -> image    |> ls |> map Image.toHtml
           BodyButton   button   -> button   |> ls |> map Button.toHtml
           BodyIcon     icon     -> icon     |> ls |> map Icon.toHtml
           BodyField    field    -> field    |> ls |> map Form.toHtml
           BodyMedia    media    -> media    |> ls |> map Media.toHtml

{-| TODO
-}
addClass : String -> Section msg -> Section msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Section msg -> Section msg
setHelpers = Entity.setHelpers
