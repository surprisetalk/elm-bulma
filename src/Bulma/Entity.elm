
module Bulma.Entity exposing (..)

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)

import Bulma.Helpers exposing ( Helpers, defaultHelpers, toClassStrings )

import String exposing ( join )

import Html exposing ( Html, Attribute, node )
import Html.Attributes exposing ( class )


-- ENTITY ----------------------------------------------------------------------

type Entity mods body msg = Entity { helps : Helpers
                                   , attrs : Attrs msg
                                   , clsss : List String
                                   , tag   : String
                                   , mods  : mods
                                   , body  : body
                                   }

mapMods : (a -> b) -> Entity a body msg -> Entity b body msg
mapMods f (Entity ({mods} as ent))
  = Entity { ent | mods = f mods }

mapBody : (a -> b) -> Entity mods a msg -> Entity mods b msg
mapBody f (Entity ({body} as ent))
  = Entity { ent | body = f body }

entity : String -> List String -> mods -> Attrs msg -> body -> Entity mods body msg
-- TODO: it may be wiser to omit a few of these arguments as optional setters
-- TODO:   esp. tag
entity tag clsss mods attrs body 
  = Entity  { helps = defaultHelpers
            , attrs = attrs
            , clsss = clsss
            , tag   = tag
            , mods  = mods
            , body  = body
            }

toHtml : (mods -> List String) -> (body -> Attrs msg) -> (body -> Htmls msg) -> Entity mods body msg -> Html msg
toHtml modsF attrsF bodyF (Entity {helps,attrs,clsss,tag,mods,body})
  = let clsss_ : List String
        clsss_ = clsss ++ modsF mods ++ toClassStrings helps

        attrs_ : Attrs msg
        attrs_ = clsss_ |> join " " |> class |> flip (::) attrs |> (++) (body |> attrsF)

        htmls_ : Htmls msg
        htmls_ = bodyF body

    in node tag attrs_ htmls_

addAttribute : Attr msg -> Entity mods body msg -> Entity mods body msg
addAttribute attr (Entity ({attrs} as ent))
  = Entity { ent | attrs = attr :: attrs }

addClass : String -> Entity mods body msg -> Entity mods body msg
addClass clss (Entity ({clsss} as ent))
  = Entity { ent | clsss = clss :: clsss }

setHelpers : Helpers -> Entity mods body msg -> Entity mods body msg
setHelpers helps_ (Entity ent)
  = Entity { ent | helps = helps_ }
  


