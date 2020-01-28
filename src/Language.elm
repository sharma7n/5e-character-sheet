module Language exposing (..)


import Json.Decode as D



type alias Language =
    { name : String
    , prevalence : Prevalence
    }


languageDecoder : D.Decoder Language
languageDecoder =
    D.map2 Language
        D.string
        prevalenceDecoder


type Prevalence
    = Standard
    | Exotic
    | Secret


prevalenceDecoder : D.Decoder Prevalence
prevalenceDecoder =
    D.int
    |> D.andThen decodePrevalenceEnum


decodePrevalenceEnum : Int -> D.Decoder Prevalence
decodePrevalenceEnum enum =
    case enum of
        1 ->
            D.succeed Standard
        
        2 ->
            D.succeed Exotic
        
        3 ->
            D.succeed Secret
        
        _ ->
            D.fail <| (String.fromInt enum) ++ " is not a valid language prevalence!"