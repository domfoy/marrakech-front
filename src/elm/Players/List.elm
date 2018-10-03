module Players.List exposing (list, nav, view)

import Html exposing (..)
import Models exposing (Player)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


view players =
    div []
        [ nav
        , maybeList players
        ]


maybeList : WebData (List Player) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading"

        RemoteData.Success players ->
            list players

        RemoteData.Failure error ->
            text (Debug.toString error)


nav =
    div []
        [ div [] [ text "Players" ] ]


list players =
    div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Level" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map playerRow players)
            ]
        ]


playerRow player =
    tr []
        [ td [] [ text player.id ]
        , td [] [ text player.name ]
        , td [] [ text (String.fromInt player.level) ]
        , td [] []
        ]
