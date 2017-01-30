module Main exposing (..)

import Html
import List


-- NOTE: comparable is a type that can be compared i.e. Int, String, Float


insertionSort : List comparable -> List comparable
insertionSort lst =
    if List.length lst == 0 then
        []
    else if List.length lst == 1 then
        lst
    else
        let
            n1 =
                [ List.head lst ]

            tail_lst =
                List.tail lst

            n2 =
                insertionSort (Maybe.withDefault [] tail_lst)
        in
            if List.length n2 == 0 then
                n1
            else
                mergeList n1 n2


mergeList lst1 list2 =
    case lst1 of
        [] ->
            if List.length list2 == 0 then
                []
            else
                [ list2 [ 0 ] ]

        [ x ] ->
            if List.length list2 == 0 then
                [ x ]
            else if x < list2 [ 0 ] then
                [ x ]
            else
                [ list2 [ 0 ] ]

        x :: y ->
            let
                merged =
                    mergeList lst1 list2
            in
                merged
