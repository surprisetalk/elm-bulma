
module Helpers exposing (..)

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, Attribute )
import Html.Attributes as Attrs exposing ( class )

import Tuple exposing (..)

import List exposing ( foldr, filter )
import String exposing ( join )


-- COMBINATORS -----------------------------------------------------------------

y : a -> b -> a
y = always

-- fl : (a -> b -> c) -> b -> a -> c
-- fl a b = b a

-- curry3 : ((a,b,c) -> d) -> a -> b -> c -> d
-- curry3 f a b c = f (a,b,c)

-- uncurry3 : (a -> b -> c -> d) -> (a,b,c) -> d
-- uncurry3 f (a,b,c) = f a b c 

-- curry4 : ((a,b,c,d) -> e) -> a -> b -> c -> d -> e
-- curry4 f a b c d = f (a,b,c,d)

-- uncurry4 : (a -> b -> c -> d -> e) -> (a,b,c,d) -> e
-- uncurry4 f (a,b,c,d) = f a b c d


-- MAYBES ----------------------------------------------------------------------

flip : (a -> b -> c) -> b -> a -> c
flip f a b = f b a

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

ls : a -> List a
ls x = [ x ]


-- HTML ------------------------------------------------------------------------

node : String -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Html msg
node tag attrs_ attrs
  = Html.node tag
    <| attrs ++ attrs_

