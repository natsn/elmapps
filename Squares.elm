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
                ( { model | squareSize = (sq 10 s) }, Cmd.none )

            SetMargin s ->
                ( { model | squareMargin = (sq 1 s) }, Cmd.none )

            SetBoardSize s ->
                if (sq 5 s) > 20 then
                    ( { model | warning = "That's too big" }, Cmd.none )
                else
                    ( { model | boardSize = (sq 5 s) }, Cmd.none )


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

        placeBoard =
            (toString model.boardSize)

        placeMargin =
            (toString model.squareMargin)

        placeSquare =
            (toString model.squareSize)

        settings msg label =
            div []
                [ em [] [ text label ]
                , input [ onInput msg, placeholder placeBoard ] []
                ]
    in
        div []
            [ h1 [] [ text "squares (be careful)" ]
            , p [] [ text model.warning ]
            , (settings SetBoardSize "board size: ")
            , (settings SetMargin "margins: ")
            , (settings SetSquareSize "square size: ")
            , em [] [ text model.settings ]
            , div [ style boardStyles ] (List.repeat (model.boardSize ^ 2) square)
            ]
