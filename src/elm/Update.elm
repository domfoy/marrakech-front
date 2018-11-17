port module Update exposing (update)

import Json.Encode as Encode
import Models exposing (ActionPayload(..), Direction(..), Model, Orientation(..), encodeActionPayload)
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

        Msgs.SubmitAction ->
            let
                currentAction =
                    model.currentAction

                newCurrentAction =
                    { currentAction | payload = OrientAssamPayload model.assamDirection }
            in
            ( { model | currentAction = newCurrentAction }, submitAction (encodeActionPayload model.currentAction.payload) )

        Msgs.NewPendingAction (Ok pendingActionContext) ->
            let
                currentAction =
                    model.currentAction

                newCurrentAction =
                    { currentAction | meta = pendingActionContext.pendingAction }
            in
            ( { model | currentAction = newCurrentAction }, Cmd.none )

        Msgs.NewPendingAction (Err err) ->
            ( model, Cmd.none )


port createSocket : () -> Cmd msg


port submitAction : Encode.Value -> Cmd msg


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
