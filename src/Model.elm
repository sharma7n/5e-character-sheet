module Model exposing (..)


type alias Model msg =
    { steps : List (Step msg)
    , state : State msg
    }


type State msg
    = ViewingSteps
    | DoingStep (Step msg)


type alias Step msg =
    { label : String
    , request : Cmd msg
    }