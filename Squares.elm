module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { settings : String
    , boardSize : Int
    , squareSize : Int
    , squareMargin : Int
    , warning : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" 5 20 3 "", Cmd.none )


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\m -> Sub.none)
        }


type Msg
    = SetSquareSize String
    | SetMargin String
    | SetBoardSize String


update msg model =
    let
        sq d s =
            Result.withDefault d (String.toInt s)
    in
        case msg of
            SetSquareSize s ->
                ( { model | squareSize = (sq model.squareSize s) }, Cmd.none )

            SetMargin s ->
                ( { model | squareMargin = (sq model.squareMargin s) }, Cmd.none )

            SetBoardSize s ->
                if (sq 5 s) > 100 then
                    ( { model | warning = "That's too big" }, Cmd.none )
                else
                    ( { model | boardSize = (sq model.boardSize s), warning = "" }, Cmd.none )


view : Model -> Html Msg
view model =
    let
        width =
            (model.squareSize + (model.squareMargin * 2)) * model.boardSize

        squarePx =
            (toString model.squareSize) ++ "px"

        widthPx =
            (toString width) ++ "px"

        squareMarginPx =
            (toString model.squareMargin) ++ "px"

        squareStyles =
            [ ( "background", "lightblue" )
            , ( "margin", squareMarginPx )
            , ( "width", squarePx )
            , ( "height", squarePx )
            , ( "float", "left" )
            ]

        boardStyles =
            [ ( "background", "#eee" )
            , ( "width", widthPx )
            ]

        square =
            div [ style squareStyles ] []

        settings msg label num =
            div []
                [ em [] [ text label ]
                , input [ onInput msg, placeholder (toString num) ] []
                ]

        app =
            [ ( "background", "-webkit-linear-gradient(top, #ff8989 0%,#ffffff 100%)" )
            , ( "padding", "10px" )
            , ( "margin", "20px" )
            ]
    in
        div [ style app ]
            [ h1 [ style [ ( "color", "#FF2B2B" ) ] ] [ text "THE GREAT GRID MAKING MACHINE" ]
            , p [] [ text model.warning ]
            , (settings SetBoardSize "board: " model.boardSize)
            , (settings SetSquareSize "square: " model.squareSize)
            , (settings SetMargin "margins: " model.squareMargin)
            , br [] []
            , div [ style boardStyles ] (List.repeat (model.boardSize ^ 2) square)
            ]
