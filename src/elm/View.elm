module View exposing (view)

-- import Html.Styled exposing (..)
-- import Html.Styled.Attributes exposing (css)

import Css exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Models exposing (Orientation(..))
import Msgs exposing (Msg(..))
import Players.List
import RemoteData exposing (WebData)


view : Models.Model -> Html Msg
view model =
    div []
        [ h2
            [ id "heading" ]
            [ text "Hello" ]
        , div []
            [ section []
                [ div [ id "board" ] []
                , div [ id "overlay" ] []
                , div [ id "assam" ]
                    [ span [] [ text "test" ]
                    ]
                ]
            , div []
                [ a [] [ text "Assam" ]
                , div [] []
                ]
            , div []
                [ button [ onClick (OrientAssam L) ] [ text "L" ]
                , button [ onClick (OrientAssam R) ] [ text "R" ]
                ]
            ]
        ]
