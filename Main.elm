module Main exposing (..)

import Html


add : Int -> Int -> Int
add x y =
    x + y


result : Int
result =
    add (add 1 2) 3



-- Partial Application: call a function without supplying all the parameters
-- Currying: ??????


result2 : Bool
result2 =
    -- a curried function that will get called with
    -- a value sent form the left hand side
    add 1 2 |> \a -> a % 2 == 0


main : Html.Html msg
main =
    Html.text (toString result2)
