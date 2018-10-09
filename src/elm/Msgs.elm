module Msgs exposing (Msg(..))

import Models exposing (Orientation, Player)
import RemoteData exposing (WebData)


type Msg
    = OnFetchPlayers (WebData (List Player))
    | OrientAssam Orientation
