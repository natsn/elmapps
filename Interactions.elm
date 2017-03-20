module Main exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Time
import Mouse
import Task


-- record the time the mouse event is clicked

type alias Model =
    { x : Int
    , y : Int
    , clickTimes : List Time.Time
    }

initModel : Model
initModel =
    { x = 0
    , y = 0
    , clickTimes = []
    }


viewXY x y =
        ul [] [li [] [text <| "X: " ++ (toString x)]
              , li [] [text <| "Y: " ++ (toString y)]
              ]

viewClickTimes clickTimes =
        p [] [text (toString clickTimes)]

view : Model -> Html Msg
view model =
    div [] [ h1 [] [text "where & when did you click?"]
           , viewXY model.x model.y
           , viewClickTimes model.clickTimes ]

type Msg
      = Click Mouse.Position
      | ClickTime Time.Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Click pos ->
                ({model | x = pos.x, y = pos.y }, Task.perform ClickTime Time.now)
        ClickTime time ->
                let
                    clickTimes_ = model.clickTimes
                in
                    ({model | clickTimes = time::clickTimes_}, Cmd.none)


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
