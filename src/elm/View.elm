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
                , div [ id "pending_action" ]
                    [ a [] [ text (Debug.toString model.currentAction.meta) ]
                    ]
                , div [ id "overlay" ] []
                , div [ id "assam" ]
                    [ span [] [ text "test" ]
                    ]
                ]
            , div []
                [ a [] [ text "Assam" ]
                , div []
                    [ a [] [ text (Debug.toString model.assamDirection) ]
                    , a [] [ text (Debug.toString model.assamPosition) ]
                    , a [] [ text (Debug.toString model.game.totalTurns) ]
                    ]
                ]
            , div []
                [ button [ onClick (OrientAssam L) ] [ text "L" ]
                , button [ onClick (OrientAssam R) ] [ text "R" ]
                ]
            , button [ onClick StartGame ] [ text "Start Game" ]
            , button [ onClick SubmitAction ] [ text "Submit Action" ]
            ]
        ]
