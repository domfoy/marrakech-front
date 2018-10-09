module Update exposing (update)

import Models exposing (Direction(..), Model, Orientation(..))
import Msgs exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none )

        Msgs.OrientAssam orientation ->
            ( { model | assamDirection = orientAssam orientation model.assamDirection }, Cmd.none )


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
