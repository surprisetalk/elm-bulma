
module Bulma.Components.Media.Section exposing ( Section , section
                                               , fromBox , fromContent , fromProgress , fromTable , fromTag , fromNav , fromImage , fromTitle , fromButton , fromIcon , fromField
                                               , toHtml, addClass, setHelpers
                                               )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Section
@docs section

@docs fromBox , fromContent , fromProgress , fromTable , fromTag , fromNav , fromImage , fromTitle , fromButton , fromIcon , fromField

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Components.Nav    as Nav      exposing ( Nav      )
import Bulma.Elements.Content  as Content  exposing ( Content  )
import Bulma.Elements.Progress as Progress exposing ( Progress )
import Bulma.Elements.Table    as Table    exposing ( Table    )
import Bulma.Elements.Title    as Title    exposing ( Title    )
import Bulma.Elements.Tag      as Tag      exposing ( Tag      )
import Bulma.Elements.Image    as Image    exposing ( Image    )
import Bulma.Elements.Button   as Button   exposing ( Button   )
import Bulma.Elements.Form     as Form     exposing ( Field    )
import Bulma.Elements.Icon     as Icon     exposing ( Icon     )
import Bulma.Elements.Box      as Box      exposing ( Box      )

import Pointless exposing (..)

import Html exposing ( Html, Attribute, text )

import List exposing ( map )


-- MEDIA SECTION ---------------------------------------------------------------

{-| TODO
-}
type Body msg = BodyHtmls    (Htmls    msg)
              | BodyBox      (Box      msg)
              | BodyContent  (Content  msg)
              | BodyProgress (Progress msg)
              | BodyTable    (Table    msg)
              | BodyTitle    (Title    msg)
              | BodyTag      (Tag      msg)  
              | BodyNav      (Nav      msg)
              | BodyImage    (Image    msg)
              | BodyButton   (Button   msg)
              | BodyIcon     (Icon     msg)
              | BodyField    (Field    msg)

{-| TODO
-}
type alias Section msg = Entity () (Body msg) msg

{-| TODO
-}
section_ : Attrs msg -> Body msg -> Section msg
section_ = entity "div" [] ()

{-| TODO
-}
section : Attrs msg -> Htmls msg -> Section msg
section = section_ |-~-> BodyHtmls

{-| TODO
-}
fromBox : Attrs msg -> Box msg -> Section msg
fromBox = section_ |-~-> BodyBox

{-| TODO
-}
fromContent : Attrs msg -> Content msg -> Section msg
fromContent = section_ |-~-> BodyContent

{-| TODO
-}
fromProgress : Attrs msg -> Progress msg -> Section msg
fromProgress = section_ |-~-> BodyProgress

{-| TODO
-}
fromTable : Attrs msg -> Table msg -> Section msg
fromTable = section_ |-~-> BodyTable

{-| TODO
-}
fromTag : Attrs msg -> Tag msg -> Section msg
fromTag = section_ |-~-> BodyTag

{-| TODO
-}
fromNav : Attrs msg -> Nav msg -> Section msg
fromNav = section_ |-~-> BodyNav

{-| TODO
-}
fromImage : Attrs msg -> Image msg -> Section msg
fromImage = section_ |-~-> BodyImage

{-| TODO
-}
fromTitle : Attrs msg -> Title msg -> Section msg
fromTitle = section_ |-~-> BodyTitle

{-| TODO
-}
fromButton : Attrs msg -> Button msg -> Section msg
fromButton = section_ |-~-> BodyButton

{-| TODO
-}
fromIcon : Attrs msg -> Icon msg -> Section msg
fromIcon = section_ |-~-> BodyIcon

{-| TODO
-}
fromField : Attrs msg -> Field msg -> Section msg
fromField = section_ |-~-> BodyField

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
           BodyTitle    title    -> title    |> ls |> map Title.toHtml
           BodyTag      tag      -> tag      |> ls |> map Tag.toHtml
           BodyNav      nav      -> nav      |> ls |> map Nav.toHtml
           BodyImage    image    -> image    |> ls |> map Image.toHtml
           BodyButton   button   -> button   |> ls |> map Button.toHtml
           BodyIcon     icon     -> icon     |> ls |> map Icon.toHtml
           BodyField    field    -> field    |> ls |> map Form.toHtml

{-| TODO
-}
addClass : String -> Section msg -> Section msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Section msg -> Section msg
setHelpers = Entity.setHelpers
