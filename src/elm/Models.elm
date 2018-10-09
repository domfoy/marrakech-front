module Models exposing (Direction(..), Model, Orientation(..), Player, PlayerId, initialModel)

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
    { players = RemoteData.Loading
    , turn = 0
    , playerTurn = OrientAssam
    , assamPosition = ( 0, 0 )
    , assamDirection = Up
    }


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


type Orientation
    = L
    | R
