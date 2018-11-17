module Models exposing (ActionMeta, ActionPayload(..), ActionType(..), Colour(..), Direction(..), GameInfo, Model, Orientation(..), PendingActionContext, Player, PlayerId, encodeActionPayload, initialModel)

import Array
import Json.Encode as Encode
import RemoteData exposing (WebData)


type alias Model =
    { players : WebData (List Player)
    , assamPosition : Position
    , currentAction : Action
    , assamDirection : Direction
    , game : GameInfo
    }


initialModel : Model
initialModel =
    { players = RemoteData.Loading
    , assamPosition = ( 0, 0 )
    , currentAction = { meta = { turn = 1, playerId = 1, actionType = OrientAssam, colour = Blue }, payload = OrientAssamPayload Up }
    , assamDirection = Up
    , game = GameInfo 0 0 0
    }


type alias GameInfo =
    { currentAction : Int
    , playerCount : Int
    , totalTurns : Int
    }


type alias PlayerId =
    Int


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }


type ActionType
    = OrientAssam
    | LayRug


type alias Position =
    ( Int, Int )


encodePosition : Position -> Encode.Value
encodePosition ( x, y ) =
    Encode.object [ ( "x", Encode.int x ), ( "y", Encode.int y ) ]


type Direction
    = Right
    | Up
    | Left
    | Down


encodeDirection direction =
    case direction of
        Right ->
            Encode.string "RIGHT"

        Up ->
            Encode.string "UP"

        Left ->
            Encode.string "LEFT"

        Down ->
            Encode.string "DOWN"


type Orientation
    = L
    | R


type alias Action =
    { meta : ActionMeta
    , payload : ActionPayload
    }


type alias ActionMeta =
    { turn : Int
    , playerId : PlayerId
    , actionType : ActionType
    , colour : Colour
    }


type Colour
    = Blue
    | Yellow
    | Red
    | Brown


encodeColour colour =
    case colour of
        Blue ->
            Encode.string "BLUE"

        Yellow ->
            Encode.string "YELLOW"

        Red ->
            Encode.string "RED"

        Brown ->
            Encode.string "BROWN"


type ActionPayload
    = OrientAssamPayload Direction
    | LayRugPayload Position Position


encodeActionPayload : ActionPayload -> Encode.Value
encodeActionPayload action =
    case action of
        OrientAssamPayload direction ->
            Encode.object [ ( "direction", encodeDirection direction ) ]

        LayRugPayload position1 position2 ->
            Encode.object [ ( "position1", encodePosition position1 ), ( "position2", encodePosition position2 ) ]


type alias PendingActionContext =
    { pendingAction : ActionMeta
    }
