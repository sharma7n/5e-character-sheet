module Model exposing (..)


import Http


import Race


type alias Model =
    { steps : List Step
    , state : State
    , races : List Race.Race
    , error : Maybe Http.Error
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
            , error = Nothing
            }
        
        initSteps =
            [   { label = "Choose a Race"
                }
            ]
    in
    initModel