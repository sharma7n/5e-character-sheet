module Model exposing (..)


import Race


type alias Model =
    { steps : List Step
    , state : State
    , races : List Race.Race
    }


type State
    = ViewingSteps
    | DoingStep Step


type alias Step =
    { label : String
    }


init : Model
init = 
    let
        initModel =
            { steps = initSteps
            , state = ViewingSteps
            , races = []
            }
        
        initSteps =
            [   { label = "Choose a Race"
                }
            ]
    in
    initModel