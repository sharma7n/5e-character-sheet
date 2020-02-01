module Block exposing (..)


import Http
import Json.Decode as D


type alias Block =
    { name : String
    , hitPoints : Int
    , armorClass : Int
    , speed : Int
    }


decoder : D.Decoder Block
decoder =
    D.map4 Block
        ( D.field "name" D.string )
        ( D.field "hitPoints" D.int )
        ( D.field "armorClass" D.int )
        ( D.field "speed" D.int )


type alias FetchResult
    = Result Http.Error (List Block)