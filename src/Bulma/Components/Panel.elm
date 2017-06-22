
module Bulma.Components.Panel exposing ( Panel
                                       , panel
                                       , panelWithHeading
                                       , addTabs
                                       , addBlock
                                       , Block
                                       , block
                                       , checkBlock
                                       , linkBlock
                                       , easyLinkBlock
                                       , iconBlock
                                       , easyIconLinkBlock
                                       , fromButton
                                       , fromControl
                                       , inactive
                                       , active
                                       , toHtml
                                       , addClass
                                       , setHelpers
                                       )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Panel
@docs panel, panelWithHeading
@docs addTabs, addBlock

@docs Block
@docs block
@docs checkBlock, linkBlock, easyLinkBlock, iconBlock, easyIconLinkBlock
@docs fromButton, fromControl

@docs inactive, active

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Bulma.Elements.Icon as Icon exposing ( Icon )
import Bulma.Elements.Button as Button exposing ( Button )
import Bulma.Elements.Form.Control as Control exposing ( Control )

import Html exposing ( Html, Attribute, text, div, p, a, label )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class )

import Pointless exposing (..)

import List exposing ( map )

import Maybe.Extra as Maybe_ exposing ( unwrap )


-- PANEL -----------------------------------------------------------------------

{-| TODO
-}
type Content msg = ContentTabs  (List  (msg, String, Bool))
                 | ContentBlock (Block (msg              ))

{-| TODO
-}
type alias Body msg = { heading : Htmls msg
                      , content : List (Content msg)
                      } 

{-| TODO
-}
type alias Panel msg = Entity () (Body msg) msg

{-| TODO
-}
panel : Attrs msg -> Panel msg
panel = fl panelWithHeading []

{-| TODO
-}
panelWithHeading : Attrs msg -> Htmls msg -> Panel msg
panelWithHeading attrs = entity "nav" [ "panel" ] () attrs << fl Body []

{-| TODO
-}
addTabs : List (msg, String, Bool) -> Panel msg -> Panel msg
addTabs tabs = mapBody <| \body -> { body | content = body.content ++ [ ContentTabs tabs ] }

{-| TODO
-}
addBlock : Block msg -> Panel msg -> Panel msg
addBlock block = mapBody <| \body -> { body | content = body.content ++ [ ContentBlock block ] }


-- BLOCK -----------------------------------------------------------------------

{-| TODO
-}
type BlockBody msg = BlockHtmls    (Htmls    msg)
                   | BlockControl  (Control  msg)
                   | BlockButton   (Button   msg)
                   | BlockCheckBox (Htmls    msg
                                   ,         msg)
                   | BlockLink     (Htmls    msg
                                   ,         msg)

{-| TODO
-}
type alias Block msg = { active : Bool
                       , attrs  : Attrs msg
                       , icon   : Maybe (Icon msg)
                       , body   : BlockBody msg
                       }

{-| TODO
-}
block_ : Attrs msg -> Maybe (Icon msg) -> BlockBody msg -> Block msg
block_ = Block False

{-| TODO
-}
block : Attrs msg -> Htmls msg -> Block msg
block attrs = block_ attrs Nothing << BlockHtmls

{-| TODO
-}
checkBlock : Attrs msg -> msg -> Htmls msg -> Block msg
checkBlock attrs = fl <| curry <| block_ attrs Nothing << BlockCheckBox

{-| TODO
-}
linkBlock : Attrs msg -> msg -> Htmls msg -> Block msg
linkBlock attrs = fl <| curry <| block_ attrs Nothing << BlockLink

{-| TODO
-}
easyLinkBlock : msg -> String -> Block msg
easyLinkBlock msg = linkBlock [] msg << ls << text

{-| TODO
-}
iconBlock : Attrs msg -> Icon msg -> Htmls msg -> Block msg
iconBlock = block_ |-~> Just ~-> BlockHtmls

{-| TODO
-}
easyIconLinkBlock : msg -> Icon msg -> String -> Block msg
easyIconLinkBlock = iconBlock |~> (onClick >> ls) -~-> (text >> ls)

{-| TODO
-}
fromButton : Attrs msg -> Button msg -> Block msg
fromButton attrs = block_ attrs Nothing << BlockButton

{-| TODO
-}
fromControl : Attrs msg -> Control msg -> Block msg
fromControl attrs = block_ attrs Nothing << BlockControl


-- ACTIVE --

{-| TODO
-}
inactive : Block msg -> Block msg
inactive block = { block | active = False }

{-| TODO
-}
active : Block msg -> Block msg
active block = { block | active = True }


-- HTML ------------------------------------------------------------------------

{-| TODO
-}
toHtml : Panel msg -> Html msg
toHtml = Entity.toHtml (y []) (y [])
       <| \{heading,content} ->
         (++) [ p [ class "panel-heading" ] heading
              ]
         <| map toHtml_
         <| content

{-| TODO
-}
toHtml_ : Content msg -> Html msg       
toHtml_ content
  = case content of

      ContentTabs tabs ->

        p [ class "panel-tabs" ]
        <| flip map tabs
        <| \(msg,str,active) -> 
          a (if active then [ class "is-active" ] else []) [ text str ]

      ContentBlock {active,attrs,icon,body} ->

        let attrs_ : Attrs msg
            attrs_ = fl (::) attrs
                   <| class
                   <| (++) "panel-block"
                   <| if active then "is-active " else ""

            htmls_ : Htmls msg
            htmls_ = icon |> unwrap [] (Icon.toHtml >> ls)

        in case body of

             BlockLink (htmls,msg) ->

               a (onClick msg :: attrs_) <| htmls_ ++ htmls

             BlockHtmls htmls ->

               div attrs_ <| htmls_ ++ htmls

             BlockControl control ->

               div attrs_ <| (++) htmls_ <| ls <| Control.toHtml control

             BlockButton button ->

               div attrs_ <| (++) htmls_ <| ls <| Button.toHtml button

             BlockCheckBox (htmls,msg) ->

               label attrs_ <| htmls_ ++ htmls

          
        

{-| TODO
-}
addClass : String -> Panel msg -> Panel msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Panel msg -> Panel msg
setHelpers = Entity.setHelpers
