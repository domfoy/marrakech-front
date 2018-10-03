module Main exposing (init, main)

import Browser
import Commands exposing (fetchPlayers)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, fetchPlayers )


subscriptions _ =
    Sub.none



-- MAIN


main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
