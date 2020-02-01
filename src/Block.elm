module Block exposing (..)


import Http
import Json.Decode as D


type alias Block =
    { name : String
    }


decoder : D.Decoder Block
decoder =
    D.map Block
        ( D.field "name" D.string )


type alias FetchResult
    = Result Http.Error (List Block)