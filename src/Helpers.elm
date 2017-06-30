
module Helpers exposing (..)

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, Attribute )
import Html.Attributes as Attrs exposing ( class )

import Tuple exposing (..)

import List exposing ( foldr, filter )
import String exposing ( join )


-- INFIX OPERATORS -------------------------------------------------------------

(=>) : a -> b -> ( a, b )
(=>) = (,)

(<<<) : (c -> d) -> (a -> b -> c) -> a -> b -> d
(<<<) = (<<<)

(>>>) : (a -> b -> c) -> (c -> d) -> a -> b -> d
(>>>) = (>>>)


-- ALIASES ---------------------------------------------------------------------

type alias Htmls msg = List (Html msg)

type alias Attr msg = Attribute msg

type alias Attrs msg = List (Attribute msg)


-- COMBINATORS -----------------------------------------------------------------

y : a -> b -> a
y = always

fl : (a -> b -> c) -> b -> a -> c
fl = flip

curry3 : ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f a b c = f (a,b,c)

uncurry3 : (a -> b -> c -> d) -> (a,b,c) -> d
uncurry3 f (a,b,c) = f a b c 

curry4 : ((a,b,c,d) -> e) -> a -> b -> c -> d -> e
curry4 f a b c d = f (a,b,c,d)

uncurry4 : (a -> b -> c -> d -> e) -> (a,b,c,d) -> e
uncurry4 f (a,b,c,d) = f a b c d


-- MAYBES ----------------------------------------------------------------------

(?.) : Maybe a -> a -> a
(?.) = fl Maybe.withDefault

(*?) : (a -> b) -> Maybe a -> Maybe b
(*?) = Maybe.map

(?*) : Maybe a -> (a -> b) -> Maybe b
(?*) = fl (*?)

mvalues : List (Maybe a) -> List a
mvalues
  = flip foldr []
  <| \x xs ->
    case x of
      Nothing ->       xs
      Just x_ -> x_ :: xs
    


-- TUPLES ----------------------------------------------------------------------

setFirst : b -> (a1,a2) -> (b,a2)
setFirst = mapFirst << y

setSecond : b -> (a1,a2) -> (a1,b)
setSecond = mapSecond << y


-- LISTS -----------------------------------------------------------------------

(+:) : List a -> a -> List a
(+:) xs x = xs ++ [ x ]

ls : a -> List a
ls = fl (::) []


-- HTML ------------------------------------------------------------------------

node : String -> Attrs msg -> List String -> Attrs msg -> Htmls msg -> Html msg
node tag attrs_ classes attrs
  = Html.node tag
  <| (++) attrs
  <| (++) attrs_
  <| ls
  <| class
  <| join " "
  <| filter ((/=) "")
  <| classes


-- -- FLISTS ----------------------------------------------------------------------

-- type alias FList a = ( List a, a, List a )

-- flmap : (a -> b) -> (a -> b) -> (a -> b) -> FList a -> FList b
-- flmap f g h (xs,y,zs) = ( List.map f xs
--                         ,          g y
--                         , List.map h zs
--                         )

-- fromFList : FList a -> List a
-- fromFList (a,b,c) = a ++ [ b ] ++ c

-- selectWhen : (a -> Bool) -> FList a -> FList a
-- selectWhen f flist
--   = case splitWhen f <| fromFList flist of
--       Just ( xs, y :: zs ) -> ( xs, y, zs )
--       _                    -> flist
