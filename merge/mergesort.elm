module Main exposing (..)

import Html
import List


type Direction
    = Left
    | Right


unsorted =
    [ 4, 3, 2, 1 ]


inf =
    1 / 0



-- returns middle and all elements to the left of it


firstHalf : List a -> List a
firstHalf =
    List.reverse >> lastHalf >> List.reverse



-- returns middle and all elements to the right of it
-- lastHalf : List -> List, causes an error when using List.length function
-- elm thinks a is List and not List a????


lastHalf : List a -> List a
lastHalf a =
    let
        len =
            (List.length a)
    in
        if len % 2 == 0 then
            List.drop (len // 2) a
        else
            List.drop ((len // 2) - 1) a



-- getSection array start stop =


splitInHalf : List a -> Direction -> List a
splitInHalf a dir =
    -- half = ( length a ) // 2
    if dir == Left then
        firstHalf a
    else
        lastHalf a


splitArray : List a -> ( List a, List a )
splitArray a =
    ( firstHalf a, lastHalf a )



-- Int a and Int b causes an error, elm expects an atom type?
-- getSubArray : List a -> Int a -> Int b -> List a
{--
Your type annotation uses `d` and `a` as separate type variables. Each one
can be any type of value, but because they have separate names, there is no
guarantee that they are equal to each other. Your code seems to be saying they
ARE the same though! Maybe they should be the same in your type annotation?
Maybe your code uses them in a weird way?
--}
-- getSubArray : List a -> Int -> Int -> List d
{--
Get sub array of an array from start index, inclusive, to stop index, exclusive.
--}


getSubArray : List a -> Int -> Int -> List a
getSubArray array start stop =
    -- List.reverse (List.drop stop (List.reverse (List.drop start array)))
    -- let
    --   if start > 0 then
    --     n =
    --         start - 1
    --   else
    --     n = start
    -- in
    --     (List.drop n array)
    -- if start > 0 then
    -- List.take (stop - start) (List.drop start array)
    -- else
    -- List.take (stop - start) (List.drop start array)
    List.take (stop - start) (List.drop start array)



{--
  Merge sort
--}


mergeSort : List Float -> List Float
mergeSort array =
    if List.length array > 1 then
        -- mergeArrays (mergeSort (splitInHalf a Left)) (mergeSort (splitInHalf a Right))
        -- a_left = mergeSort ( splitInHalf a Left )
        -- a_right = mergeSort ( splitInHalf a Right )
        -- mergeArrays a_left a_right
        let
            len =
                List.length array

            a_left =
                mergeSort (getSubArray array 0 (len // 2))

            a_right =
                mergeSort (getSubArray array (len // 2) len)
        in
            mergeArrays a_left a_right
    else
        array


lessThan : Int -> Int -> Int
lessThan val1 val2 =
    if val1 > val2 then
        val1
    else
        val2


mergeArrays : List Float -> List Float -> List Float
mergeArrays a_left a_right =
    -- List.map2 lessThan a_left a_right
    -- NOTE: can't use if conditionals in let expressions
    let
        l_len =
            List.length a_left

        r_len =
            List.length a_right

        l_first =
            Maybe.withDefault inf (List.head a_left)

        r_first =
            Maybe.withDefault inf (List.head a_right)
    in
        -- if l_len == r_len && l_len == 0 then
        --     []
        -- else if l_len == 0 || (List.head a_left) > (List.head a_right) then
        --     --NOTE: List.singelton is missing, Cannot find variable `List.singleton`, the docs have decieved me
        --     -- List.append (List.singleton a_right.head) (mergeArrays a_left (List.tail a_right))
        --     -- NOTE: using List.tail which can return a Maybe causes a tempest of type mistmatche errors
        --     List.append ([ List.head a_right ]) (mergeArrays a_left (Maybe.withDefault [] (List.tail a_right)))
        -- else if r_len == 0 || (List.head a_left) <= (List.head a_right) then
        --     List.append ([ List.head a_left ]) (mergeArrays ((Maybe.withDefault [] (List.tail a_left))) a_right)
        -- else
        -- []
        if l_len == r_len && l_len == 0 then
            []
        else if l_len == 0 || l_first > r_first then
            -- NOTE: need Maybe.withDefault becausse List.tail can return Nothing which would causes an error
            List.append ([ r_first ]) (mergeArrays a_left (Maybe.withDefault [] (List.tail a_right)))
        else if r_len == 0 || l_first <= r_first then
            List.append ([ l_first ]) (mergeArrays ((Maybe.withDefault [] (List.tail a_left))) a_right)
        else
            []


array =
    [ 2, 1, 0, 9, 6, 5, 7, 4, 8, 3, 3 ]


start =
    List.length array // 2



-- 0
-- 2


stop =
    List.length array



-- List.length array // 2
-- 5


result =
    getSubArray array start stop



-- a_left =
--     [ 1, 2, 4 ]
--
--
-- a_right =
--     [ 0, 3, 5 ]
-- len =
--     List.length array
--
--
-- a_left =
--     getSubArray array 0 (len // 2)
--
--
-- a_right =
--     getSubArray array (len // 2) len
--
--
-- merged =
--     mergeArrays a_left a_right


sorted =
    mergeSort array



-- NOTE: use ++ to concat strings


main =
    -- Html.text ((toString result) ++ " " ++ (toString array))
    -- Html.text (toString merged)
    -- Html.text ("Array: " ++ (toString array) ++ " </br> " ++ "Left: " ++ (toString a_left) ++ " " ++ "Right: " ++ (toString a_right))
    Html.text ("Array: " ++ (toString array) ++ " </br> " ++ "Sorted: " ++ (toString sorted))
