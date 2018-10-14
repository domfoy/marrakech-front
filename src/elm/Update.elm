port module Update exposing (update)

import Models exposing (Direction(..), Model, Orientation(..))
import Msgs exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.StartGame ->
            ( model, createSocket () )

        Msgs.NewGame (Ok game) ->
            ( { model | game = game }, Cmd.none )

        Msgs.NewGame (Err err) ->
            ( model, Cmd.none )

        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Msgs.OrientAssam orientation ->
            ( { model | assamDirection = orientAssam orientation model.assamDirection }, Cmd.none )


port createSocket : () -> Cmd msg


orientAssam : Orientation -> Direction -> Direction
orientAssam orientation direction =
    case orientation of
        L ->
            case direction of
                Right ->
                    Up

                Up ->
                    Left

                Left ->
                    Down

                Down ->
                    Right

        R ->
            case direction of
                Right ->
                    Down

                Down ->
                    Left

                Left ->
                    Up

                Up ->
                    Right
