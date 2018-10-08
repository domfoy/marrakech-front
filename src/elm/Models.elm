module Models exposing (Model, Player, PlayerId, initialModel)

import RemoteData exposing (WebData)


type alias Model =
    { players : WebData (List Player)
    , turn : Int
    , playerTurn : PlayerTurn
    , assamPosition : Position
    , assamDirection : Direction
    }


initialModel : Model
initialModel =
    { players = RemoteData.Loading }


type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }


type PlayerTurn
    = OrientAssam
    | LayRug


type alias Position =
    ( Int, Int )


type Direction
    = Right
    | Up
    | Left
    | Down
