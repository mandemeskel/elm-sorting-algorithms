module Main exposing (..)

import Html
import List


inf =
    1 / 0



{--
Get sub array of an array from start index, inclusive, to stop index, exclusive.
--}


getSubArray : List a -> Int -> Int -> List a
getSubArray array start stop =
    List.take (stop - start) (List.drop start array)



{--
  Merge sort
--}


mergeSort : List Float -> List Float
mergeSort array =
    if List.length array > 1 then
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


mergeArrays : List Float -> List Float -> List Float
mergeArrays a_left a_right =
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
        if l_len == r_len && l_len == 0 then
            []
        else if l_len == 0 || l_first > r_first then
            List.append ([ r_first ]) (mergeArrays a_left (Maybe.withDefault [] (List.tail a_right)))
        else if r_len == 0 || l_first <= r_first then
            List.append ([ l_first ]) (mergeArrays ((Maybe.withDefault [] (List.tail a_left))) a_right)
        else
            []


array =
    [ 2, 1, 0, 9, 6, 5, 7, 4, 8, 3, 3 ]


sorted =
    mergeSort array


main =
    Html.text ("Array: " ++ (toString array) ++ " -> " ++ "Sorted: " ++ (toString sorted))
