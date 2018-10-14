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
    newGame (decodeGameInfo >> Msgs.NewGame)


port newGame : (Decode.Value -> msg) -> Sub msg


decodeGameInfo : Decode.Value -> Result Decode.Error Models.GameInfo
decodeGameInfo =
    Decode.decodeValue gameInfoDecoder


gameInfoDecoder : Decode.Decoder Models.GameInfo
gameInfoDecoder =
    Decode.succeed Models.GameInfo
        |> PipelineDecoder.required "currentTurn" Decode.int
        |> PipelineDecoder.required "playerCount" Decode.int
        |> PipelineDecoder.required "totalTurns" Decode.int



-- MAIN


main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
