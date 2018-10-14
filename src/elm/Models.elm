module Models exposing (Direction(..), GameInfo, Model, Orientation(..), Player, PlayerId, initialModel)

import RemoteData exposing (WebData)


type alias Model =
    { players : WebData (List Player)
    , turn : Int
    , playerTurn : PlayerTurn
    , assamPosition : Position
    , assamDirection : Direction
    , game : GameInfo
    }


initialModel : Model
initialModel =
    { players = RemoteData.Loading
    , turn = 0
    , playerTurn = Orient
    , assamPosition = ( 0, 0 )
    , assamDirection = Up
    , game = GameInfo 0 0 0
    }


type alias GameInfo =
    { currentTurn : Int
    , playerCount : Int
    , totalTurns : Int
    }


type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }


type PlayerTurn
    = Orient
    | Lay


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
