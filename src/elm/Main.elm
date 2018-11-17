port module Main exposing (init, main)

import Browser
import Commands exposing (fetchPlayers)
import Html.Styled
import Json.Decode as Decode
import Json.Decode.Pipeline as PipelineDecoder
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, fetchPlayers )


subscriptions _ =
    Sub.batch
        [ newGame (decodeGameInfo >> Msgs.NewGame)
        , pendingAction (decodePendingAction >> Msgs.NewPendingAction)
        ]


port newGame : (Decode.Value -> msg) -> Sub msg


port pendingAction : (Decode.Value -> msg) -> Sub msg


decodeGameInfo : Decode.Value -> Result Decode.Error Models.GameInfo
decodeGameInfo =
    Decode.decodeValue gameInfoDecoder


gameInfoDecoder : Decode.Decoder Models.GameInfo
gameInfoDecoder =
    Decode.succeed Models.GameInfo
        |> PipelineDecoder.required "currentTurn" Decode.int
        |> PipelineDecoder.required "playerCount" Decode.int
        |> PipelineDecoder.required "totalTurns" Decode.int


decodePendingAction =
    Decode.decodeValue pendingActionDecoder


pendingActionDecoder =
    Decode.succeed Models.PendingActionContext
        |> PipelineDecoder.required "pendingAction"
            (Decode.succeed Models.ActionMeta
                |> PipelineDecoder.required "turn" Decode.int
                |> PipelineDecoder.required "playerId" Decode.int
                |> PipelineDecoder.required "actionType" actionTypeDecoder
                |> PipelineDecoder.required "colour" colourDecoder
            )


actionTypeDecoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "ORIENT_ASSAM" ->
                        Decode.succeed Models.OrientAssam

                    "LAY_RUG" ->
                        Decode.succeed Models.LayRug

                    unmatched ->
                        Decode.fail <| "Unknown theme: " ++ unmatched
            )


colourDecoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "BLUE" ->
                        Decode.succeed Models.Blue

                    "YELLOW" ->
                        Decode.succeed Models.Yellow

                    "RED" ->
                        Decode.succeed Models.Red

                    "BROWN" ->
                        Decode.succeed Models.Brown

                    unmatched ->
                        Decode.fail <| "Unknown theme: " ++ unmatched
            )



-- MAIN


main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
