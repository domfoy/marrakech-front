module Models exposing (Model, Player, PlayerId, initialModel)

import RemoteData exposing (WebData)


type alias Model =
    { players : WebData (List Player)
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
