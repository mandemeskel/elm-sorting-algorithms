import Html exposing (Html, Attribute, div, text, input, label)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List
import String

{-
Mergesort : List Int Int -> List
-- Mergesort : array start radius =
Mergesort : radius start array = 
  radius = List.length array // 2
  start = 0
-}

main = Html.beginnerProgram{ model = model, view = view, update = update }


-- Model


-- the list we will be sorting
type alias Model = { array : List }
model = { array = [] }


-- UPDATE


type Msg = MergeSort List

update : Msg -> Model -> Model
update msg model =
  case msg of
    MergeSort unsortedArray -> { model | array = unsortedArray }
    
    
-- VIEW

view : Model -> Html Msg
view model = div
-- attributes
  []
-- children
  [
  label [] [ text( "enter a comma separated list of numebrs to sort" ) ],
  -- NOTE: type is a taken keyword, if you want to set the attribute type, use type_
  -- input [ type( "number" ) ] [],
  input [ type_( "number" ) ] [],
  input [ type_( "submit" ), onClick( MergeSort ) ] [ text( "sort" ) ],
  -- NOTE: Elm wont automatically cast everything into a printable format
  -- NOTE: Elm's text function expects a string most get string from list
  -- label [] [ text( model.array ) ]
  -- NOTE: fromList expects a list of chars
  -- TODO: most convert elements from Int to Char, http://package.elm-lang.org/packages/elm-lang/core/latest/List
  -- label [] [ text( String.fromList( model.array ) ) ]
  ]

