module Msgs exposing (Msg(..))

import Json.Decode as Decode
import Models exposing (Orientation, Player)
import RemoteData exposing (WebData)


type Msg
    = OnFetchPlayers (WebData (List Player))
    | OrientAssam Orientation
    | StartGame
    | NewGame (Result Decode.Error Models.GameInfo)
