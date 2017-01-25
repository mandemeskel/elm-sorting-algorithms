module Main exposing (..)

import Html
import List

type Direction = Left | Right


unsorted =
    [ 4, 3, 2, 1 ]


firstHalf =
  List.reverse >> lastHalf >> List.reverse

lastHalf a =
  List.drop ( (List.length a) // 2 ) a

splitInHalf : List -> Direction -> List
splitInHalf a dir =
  -- half = ( length a ) // 2
  if dir == Left then
    firstHalf a
  else
    lastHalf a

{--
  Merge sort
--}
mergeSort : List -> List
mergeSort a =
    if length a > 1 then
      aleft = mergeSort ( splitInHalf a Left )
      aright = mergeSort ( splitInHalf a Right )
      mergeArrays aleft aright
    else
      a


result =
    [ 1, 2, 4 ]


main =
    Html.text (toString result)
