module Race exposing (..)


import Http
import Json.Decode as D


import AbilityScore
import Language
import Size
import Speed
import Trait


type alias Race =
    { name : String
    , abilityScoreIncreases : List AbilityScore.Delta
    , size : Size.Size
    , speed : Speed.Speed
    , languages : List Language.Language
    , traits : List Trait.Trait
    }



type Msg
    = GotRaces (Result Http.Error (List Race))


raceDecoder : D.Decoder Race
raceDecoder =
    D.map6 Race
        D.string
        (D.succeed [])
        (D.succeed Size.Medium)
        (D.succeed (Speed.Speed 6))
        (D.list Language.languageDecoder)
        (D.succeed [])


getRaces : Cmd Msg
getRaces =
    Http.get
        { url = "https://sharma7n-5e-character-sheet.builtwithdark.com/races"
        , expect = Http.expectJson GotRaces (D.list raceDecoder) 
        }