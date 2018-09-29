module Main exposing (init, main)

import Browser
import Models exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- MAIN


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
