module Commands exposing (fetchPlayers, fetchPlayersUrl, playerDecoder, playersDecoder)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (required)
import Models exposing (Player)
import Msgs
import RemoteData


fetchPlayers =
    Http.get fetchPlayersUrl playersDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPlayers


fetchPlayersUrl =
    "http://localhost:3000/players"


playersDecoder =
    Decode.list playerDecoder


playerDecoder =
    Decode.succeed Player
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "level" Decode.int
