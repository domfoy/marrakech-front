module View exposing (view)

import Html exposing (Html, div, text)
import Models exposing (Model, Player)
import Msgs exposing (Msg)
import Players.List
import RemoteData exposing (WebData)


view : Model -> Html Msg
view model =
    div []
        [ Players.List.view model.players ]
        div
        []
        []
