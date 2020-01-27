module AbilityScore exposing (..)


type AbilityScore
    = Strength
    | Dexterity
    | Constitution
    | Intelligence
    | Wisdom
    | Charisma


type alias Delta =
    { value : Int
    , score : AbilityScore
    }