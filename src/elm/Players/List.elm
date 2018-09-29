module Players.List exposing (list, nav, view)

import Html exposing (..)

view players =
    div []
        [ nav
        , list players
        ]


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
        , td [] [ text player.name]
        , td [] [ text (String.fromInt player.level)]
        , td [] []
        ]
