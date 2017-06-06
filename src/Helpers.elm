
module Helpers exposing (..)

-- IMPORTS ---------------------------------------------------------------------

import Html exposing ( Html, Attribute )
import Function exposing (..)


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

y : a -> () -> a
y = always

fl : (a -> b -> c) -> b -> a -> c
fl = flip


-- LISTS -----------------------------------------------------------------------

ls : a -> List a
ls = fl (::) []
