module Main exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Time
import Mouse


-- record the time the mouse event is clicked
-- record where they clicked


type alias Model =
    { x : Int
    , y : Int
    , clickTimes : List Int
    }

initModel : Model
initModel =
    { x = 0
    , y = 0
    , clickTimes = []
    }

view : Model -> Html Msg
view model =
    div [] [ text "here we go" ]

type Msg = Click Mouse.Position

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Click pos ->
                ({model | x = pos.x, y = pos.y }, Cmd.none)


subscriptions model =
    Sub.batch [Mouse.clicks Click]

init : (Model, Cmd Msg)
init =
    ( initModel, Cmd.none )


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
