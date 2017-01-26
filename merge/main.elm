module Main exposing (..)

import Html exposing (Html, Attribute, div, text, input, label)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import List
import String
import Regex


{-
   Mergesort : List Int Int -> List
   -- Mergesort : array start radius =
   Mergesort : radius start array =
     radius = List.length array // 2
     start = 0
-}


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- Model
-- create our sorting list type


type alias SortArray =
    List Char



-- the list we will be sorting,


type alias Model =
    { user_input : String }


model : Model
model =
    { user_input = "" }



-- UPDATE


type Msg
    = SetModel String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetModel unsorted_array ->
            { model
                | user_input = unsorted_array
            }



-- VIEW


view : Model -> Html Msg
view model =
    div
        -- attributes
        []
        -- children
        [ label [] [ text ("enter a comma separated list of numebrs to sort") ]
        , -- NOTE: type is a taken keyword, if you want to set the attribute type, use type_
          -- input [ type( "number" ) ] [],
          input [ type_ ("number") ] []
        , input [ type_ ("submit"), onClick (SetModel) ] [ text ("sort") ]
          -- NOTE: Elm wont automatically cast everything into a printable format
          -- NOTE: Elm's text function expects a string most get string from list
          -- label [] [ text( model.array ) ]
          -- NOTE: fromList expects a list of chars
          -- TODO: most convert elements from Int to Char, http://package.elm-lang.org/packages/elm-lang/core/latest/List
          -- label [] [ text( String.fromList( model.array ) ) ]
          -- label [] [ text( model.user_input ) ]
        ]
