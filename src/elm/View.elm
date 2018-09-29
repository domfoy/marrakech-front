module View exposing (..)

import Html exposing (Html, div ,text)
import Players.List
import Msgs exposing (Msg)
import Models exposing (Model)

view : (Model, Cmd Msg) -> Html Msg
view (model, _) =
  div []
    [ page model ]

page model =
  Players.List.view model.players
