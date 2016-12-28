module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL
{-
   what the data looks like,
   a record with a single key and a value type of "String"
-}


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }



-- Initial state of data


model : Model
model =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Submit


update : Msg -> Model -> Model



-- why is this Model -> Model ?


update msg model =
    -- why does this take model as a 2nd argument?
    case msg of
        -- what is msg?
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain }

        Submit ->
            { model | name = "BLA" }



-- show validation
-- VIEWS


view : Model -> Html Msg
view model =
    div [ style [ ( "margin", "1em" ) ] ]
        -- parent div
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "PasswordAgain", onInput PasswordAgain ] []
        , extraView
        , viewValidation model
        ]


viewValidation : Model -> Html Msg
viewValidation model =
    let
        ( color, message ) =
            if String.length model.password < 8 then
                ( "blue", "Less than 8" )
            else if model.password == model.passwordAgain then
                ( "green", "OK" )
            else
                ( "red", "Oh crap..." )
    in
        div [ style [ ( "color", color ) ] ] [ text message ]


extraView : Html Msg
extraView =
    div [] [ button [ onClick Submit ] [ text "Submit" ] ]
