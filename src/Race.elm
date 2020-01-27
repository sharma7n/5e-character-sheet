module Race exposing (..)


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