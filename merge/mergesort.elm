module Main exposing (..)

import Html
import List


type Direction
    = Left
    | Right


unsorted =
    [ 4, 3, 2, 1 ]



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


mergeSort : List Int -> List Int
mergeSort array =
    if List.length array > 1 then
        -- mergeArrays (mergeSort (splitInHalf a Left)) (mergeSort (splitInHalf a Right))
        -- aleft = mergeSort ( splitInHalf a Left )
        -- aright = mergeSort ( splitInHalf a Right )
        -- mergeArrays aleft aright
        let
            len =
                List.length array

            aleft =
                mergeSort (getSubArray array 0 (len // 2))

            aright =
                mergeSort (getSubArray array (len // 2) 0)
        in
            mergeArrays aleft aright
    else
        array


lessThan : Int -> Int -> Int
lessThan val1 val2 =
    if val1 > val2 then
        val1
    else
        val2


mergeArrays : List Int -> List Int -> List Int
mergeArrays aleft aright =
    List.map2 lessThan aleft aright


array =
    [ 1, 2, 3, 4, 5, 6, 7 ]


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


merged =
    mergeArrays [ 1, 2, 4 ] [ 0, 3, 5 ]



-- use ++ to concat strings


main =
    -- Html.text ((toString result) ++ " " ++ (toString array))
    Html.text (toString merged)
