module Main exposing (..)

import Html exposing (div, img, h1, button, text, input, br)
import Html.Attributes exposing (src, placeholder)
import Html.Events exposing (onClick, onInput)
import Http
import Json.Decode exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { gifUrl : String
    , topic : String
    }


type Msg
    = MorePlease
    | NewGif (Result Http.Error String)
    | UpdateTopic String


init : ( Model, Cmd Msg )
init =
    ( Model "waiting.gif" "FOO", Cmd.none )


view : Model -> Html.Html Msg
view model =
    div []
        [ h1 [] [ text model.topic ]
        , input [ placeholder model.topic, onInput UpdateTopic ] []
        , button [ onClick MorePlease ] [ text "Get Random Gif" ]
        , br [] []
        , br [] []
        , img [ src model.gifUrl ] []
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            ( model, getRandomGif model.topic )

        NewGif (Ok newUrl) ->
            ( { model | gifUrl = newUrl }, Cmd.none )

        NewGif (Err _) ->
            ( model, Cmd.none )

        UpdateTopic newTopic ->
            ( { model | topic = newTopic }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


getRandomGif : String -> Cmd Msg
getRandomGif topic =
    let
        url =
            "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic

        request =
            Http.get url decodeGifUrl
    in
        Http.send NewGif request


decodeGifUrl : Decoder String
decodeGifUrl =
    at [ "data", "image_url" ] string
