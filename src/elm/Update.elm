module Update exposing (update)

import Models exposing (Model)
import Msgs exposing (Msg)

update : Msg -> (Model, Cmd Msg) -> (Model, Cmd Msg)
update msg (model, _) =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )
