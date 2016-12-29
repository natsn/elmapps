module Main exposing (..)

import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Array exposing (..)


main : Program Never Model Msg
main =
    Html.program { init = init, update = update, view = view, subscriptions = subscriptions }


type Msg
    = ChangeDateAndColor String Int
    | SetYear String
    | ContribBash


type alias Model =
    { year : String
    , dates : List String
    , bash : String
    , fills : Array String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" [] "" (Array.repeat 365 "#eee"), Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeDateAndColor date index ->
            ( { model | dates = model.dates ++ [ date ], fills = Array.set index "green" model.fills }, Cmd.none )

        SetYear year ->
            ( { model | year = year }, Cmd.none )

        ContribBash ->
            ( { model | bash = "" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    let
        afill index =
            Maybe.withDefault "" <| Array.get index model.fills

        makeRect ( dateString, fillInt, yString, xString ) =
            rect [ class "day", width "10", height "10", x xString, y yString, fill (afill fillInt), onClick (ChangeDateAndColor dateString fillInt) ] []
    in
        div []
            [ Html.text (toString model.dates)
            , br [] []
            , svg
                []
                [ g
                    [ transform "translate(16, 20)" ]
                    [ g
                        [ transform "translate(0, 0)" ]
                        (List.map makeRect
                            [ ( "2015-12-27", 0, "0", "13" )
                            , ( "2015-12-28", 1, "12", "13" )
                            , ( "2015-12-29", 2, "24", "13" )
                            , ( "2015-12-30", 3, "36", "13" )
                            , ( "2015-12-31", 4, "48", "13" )
                            , ( "2016-01-01", 5, "60", "13" )
                            , ( "2016-01-02", 6, "72", "13" )
                            ]
                        )
                    , g
                        [ transform "translate(13, 0)" ]
                        (List.map makeRect
                            [ ( "2015-12-27", 7, "0", "12" )
                            , ( "2015-12-28", 8, "12", "12" )
                            , ( "2015-12-29", 9, "24", "12" )
                            , ( "2015-12-30", 10, "36", "12" )
                            , ( "2015-12-31", 11, "48", "12" )
                            , ( "2016-01-01", 12, "60", "12" )
                            , ( "2016-01-02", 13, "72", "12" )
                            ]
                        )
                    , g
                        [ transform "translate(26, 0)" ]
                        (List.map makeRect
                            [ ( "2016-01-10", 14, "0", "11" )
                            , ( "2016-01-11", 15, "12", "11" )
                            , ( "2016-01-12", 16, "24", "11" )
                            , ( "2016-01-13", 17, "36", "11" )
                            , ( "2016-01-14", 18, "48", "11" )
                            , ( "2016-01-15", 19, "60", "11" )
                            , ( "2016-01-16", 20, "72", "11" )
                            ]
                        )
                    , g
                        -- translate + 13, x - 1, dates and index scooted
                        [ transform "translate(39, 0)" ]
                        (List.map makeRect
                            [ ( "2016-01-16", 21, "0", "10" )
                            , ( "2016-01-17", 22, "12", "10" )
                            , ( "2016-01-18", 23, "24", "10" )
                            , ( "2016-01-19", 24, "36", "10" )
                            , ( "2016-01-20", 25, "48", "10" )
                            , ( "2016-01-21", 26, "60", "10" )
                            , ( "2016-01-22", 27, "72", "10" )
                            ]
                        )
                    ]
                ]
            ]
