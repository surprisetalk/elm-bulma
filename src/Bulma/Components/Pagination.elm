
module Bulma.Components.Pagination exposing ( Pagination
                                            , pagination
                                            , easyPagination
                                            , windowSize
                                            , left
                                            , centered
                                            , right
                                            , small
                                            , normal
                                            , medium
                                            , large
                                            , toHtml
                                            , addClass
                                            , setHelpers
                                            )

-- DOCS ------------------------------------------------------------------------

{-| TODO 

@docs Pagination
@docs pagination, easyPagination

@docs windowSize
@docs left, centered, right
@docs small, normal, medium, large

@docs toHtml, addClass, setHelpers

-}

-- IMPORTS ---------------------------------------------------------------------

import Helpers exposing (..)
import Bulma.Entity as Entity exposing (..)
import Bulma.Helpers exposing ( Helpers )

import Html exposing ( Html, Attribute, text, div, p, a, ul, li, span )
import Html.Events exposing ( onClick )
import Html.Attributes as Attr exposing ( class, disabled )

import List exposing ( map, take, drop, length, indexedMap, concat )


-- PAGINATION -----------------------------------------------------------------------

{-| TODO
-}
type alias Body msg = { window  :   Int
                      , prev    :   Maybe (Maybe msg, Htmls msg)
                      , list    : ( List  (Maybe msg           )
                                  ,       (Maybe msg           )
                                  , List  (Maybe msg           )
                                  )
                      , next    :   Maybe (Maybe msg, Htmls msg)
                      }

{-| TODO
-}
type alias Pagination msg = Entity Modifiers (Body msg) msg

{-| TODO
-}
pagination : Attrs msg -> Maybe (Maybe msg, Htmls msg) -> ( List (Maybe msg), Maybe msg, List (Maybe msg) ) -> Maybe (Maybe msg, Htmls msg) -> Pagination msg
pagination attrs prev list next
  = entity "nav" [ "pagination" ] defaultModifiers attrs
  <| Body 3 prev list next

{-| TODO
-}
easyPagination : Attrs msg -> List (Maybe msg) -> Maybe msg -> List (Maybe msg) -> Pagination msg
easyPagination attrs before current after = pagination attrs Nothing (before,current,after) Nothing

-- {-| TODO
-- -}
-- easierPagination : Attrs msg -> List (Maybe msg) -> Maybe (Pagination msg)
-- easierPagination attrs list = pagination attrs Nothing list Nothing


-- WINDOW SIZE --

-- TODO: what do we do with even numbers?
-- TODO: what do we do with negative numbers and 0?

{-| TODO
-}
windowSize : Int -> Pagination msg -> Pagination msg
windowSize window_ = mapBody <| \body -> { body | window = window_ }


-- MODIFIERS -------------------------------------------------------------------

{-| TODO
-}
type alias Modifiers = { size      : Size
                       , alignment : Alignment
                       , groupSize : Int
                       }

{-| TODO
-}
defaultModifiers : Modifiers
defaultModifiers = { size      = Normal
                   , alignment = Left
                   , groupSize = 3
                   }

{-| TODO
-}
modsClasses : Modifiers -> List String
modsClasses {size,alignment}
  = [ size      |> sizeClass
    , alignment |> alignmentClass
    ]


-- ALIGNMENT --

{-| TODO
-}
type Alignment = Left
               | Centered
               | Right

{-| TODO
-}
setAlignment : Alignment -> Pagination msg -> Pagination msg
setAlignment alignment_ = mapMods <| \mods -> { mods | alignment = alignment_ }

{-| TODO
-}
left : Pagination msg -> Pagination msg
left = setAlignment Left

{-| TODO
-}
centered : Pagination msg -> Pagination msg
centered = setAlignment Centered

{-| TODO
-}
right : Pagination msg -> Pagination msg
right = setAlignment Right

{-| TODO
-}
alignmentClass : Alignment -> String
alignmentClass alignment
  = case alignment of
      Left     -> ""
      Centered -> "is-centered"
      Right    -> "is-right"
  

-- SIZE --

{-| TODO
-}
type Size = Small
          | Normal
          | Medium
          | Large

{-| TODO
-}
setSize : Size -> Pagination msg -> Pagination msg
setSize size_ = mapMods <| \mods -> { mods | size = size_ }

{-| TODO
-}
small : Pagination msg -> Pagination msg
small = setSize Small

{-| TODO
-}
normal : Pagination msg -> Pagination msg
normal = setSize Normal

{-| TODO
-}
medium : Pagination msg -> Pagination msg
medium = setSize Medium

{-| TODO
-}
large : Pagination msg -> Pagination msg
large = setSize Large

{-| TODO
-}
sizeClass : Size -> String
sizeClass size
  = case size of
      Small  -> "is-small"
      Normal -> ""
      Medium -> "is-medium"
      Large  -> "is-large"


-- HTML ------------------------------------------------------------------------

-- TODO: we need disabled buttons if they have no msg
  
a_ : String -> ( Maybe msg, Htmls msg ) -> Html msg
a_ c (msg,body)
  = case msg of
      Just msg -> a [ class c, onClick  msg  ] body
      Nothing  -> a [ class c, disabled True ] body

{-| TODO
-}
toHtml : Pagination msg -> Html msg
toHtml = Entity.toHtml modsClasses (y [])
       <| \{window,prev,list,next} -> 
         mvalues
         [ prev |> Maybe.map (a_ "pagination-previous")
         , next |> Maybe.map (a_ "pagination-next"    )
         , Just
           <| ul [ class "pagination-list" ]
           <| toHtml_ window
           <| list
         ]

{-| TODO
-}
toHtml_ : Int -> (List (Maybe msg), Maybe msg, List (Maybe msg)) -> Htmls msg
toHtml_ windowSize (before,current,after)
  = let a__ i msg = a_ "pagination-link" ( msg, [ text <| toString <| (+) 1 <| i ] )

        first = before
              |> take 1
              |> indexedMap a__ 

        skipBefore = before
                   |> drop 1
                   |> take (length before - 1 - windowSize // 2)
                  |> \skips ->
                    case skips of
                      [] -> []
                      _  -> [ li [] [ span [ class "pagination-ellipsis" ] [ text "&hellip;" ] ] ]

        window = indexedMap ((+) (length before - windowSize // 2) >> a__)
               <| drop (length before - windowSize // 2) ( before  )
              ++                                        [ current ]
              ++ take (                windowSize // 2) ( after   )

        skipAfter = after
                  |> drop (windowSize // 2)
                  |> take (length after - 1 - windowSize // 2)
                  |> \skips ->
                    case skips of
                      [] -> []
                      _  -> [ li [] [ span [ class "pagination-ellipsis" ] [ text "&hellip;" ] ] ]

        last = after
             |> drop (length after - windowSize // 2)
             |> map (before ++ [ current ] ++ after |> length |> a__)
    
    in map (ls >> li [])
     <| concat
       [ first
       , skipBefore
       , window
       , skipAfter
       , last
       ]

 --  = map (li [])
 --  <| ( if   length before <= 1 + window // 2
 --      then (before                                      |> map (a_ "pagination-link"           ))
 --      else (before |> take 1                             |>     (a_ "pagination-link" [ text 1 ]))
 --        ++ (span [ class "pagination-ellipsis" ] [ text "&hellip;" ])
 --        ++ (before |> drop (length before - window // 2) |>     (a_ "pagination-link" [ text 1 ])))
 -- ++ [
 --    ]
 -- ++ ( if   length after <= 1 + window // 2
 --      then (before                                     |> map (a_ "pagination-link"           ))
 --      else (after |> take (window // 2)                 |>     (a_ "pagination-link" [ text 1 ]))
 --        ++ (span [ class "pagination-ellipsis" ] [ text "&hellip;" ])
 --        ++ (after |> drop (length before - window // 2) |>     (a_ "pagination-link" [ text 1 ])))
                                                         

{-| TODO
-}
addClass : String -> Pagination msg -> Pagination msg
addClass = Entity.addClass


-- HELPERS ---------------------------------------------------------------------

{-| TODO
-}
setHelpers : Helpers -> Pagination msg -> Pagination msg
setHelpers = Entity.setHelpers
