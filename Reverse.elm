module Main exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL
-- what the data looks like (a record with a single key and a value type of String)


type alias Model =
    { content : String
    }



-- Initial state of data


model : Model
model =
    { content = "" }



-- UPDATE


type Msg
    = Change String



-- listen for Change, which takes a String


update : Msg -> Model -> Model



-- why is this Model -> Model ?


update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }



-- syntax for updating a record
-- VIEW


view : Model -> Html Msg
view model =
    div [ style [ ( "margin", "1em" ) ] ]
        [ div [] [ Html.h1 [] [ text "String Reverse App" ] ]
        , input [ placeholder "Text to reverse", onInput Change ] []
        , div [] [ text (String.reverse model.content) ]
        ]
