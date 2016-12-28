module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    Int


model : Model
model =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            model // 0



-- VIEW


view : Model -> Html Msg
view model =
    div [ style [ ( "margin", "2em" ), ( "padding", "1em" ), ( "background", "BlanchedAlmond" ) ] ]
        [ button
            [ onClick Decrement
            , style
                [ ( "background"
                  , "green"
                  )
                , ( "color", "white" )
                ]
            ]
            [ text "Decrement (-1)" ]
        , div [ style [ ( "font-size", "2em" ), ( "padding", "1em" ) ] ] [ text (toString model) ]
        , button [ onClick Increment, style [ ( "background", "red" ), ( "color", "white" ) ] ] [ text "Increment (+1)" ]
        , div [ style [ ( "padding", "2em" ) ] ] []
        , button [ onClick Reset ] [ text "Reset" ]
        ]
