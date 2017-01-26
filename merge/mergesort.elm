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


mergeArrays aleft aright =
    []



{--
  Merge sort
--}


mergeSort : List a -> List a
mergeSort a =
    if List.length a > 1 then
        mergeArrays (mergeSort (splitInHalf a Left)) (mergeSort (splitInHalf a Right))
        -- aleft = mergeSort ( splitInHalf a Left )
        -- aright = mergeSort ( splitInHalf a Right )
        -- mergeArrays aleft aright
    else
        a


result =
    splitArray [ 1, 2, 4, 5, 6 ]


main =
    Html.text (toString result)
