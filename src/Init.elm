module Init exposing (..)


import Model
import Msg


init : () -> ( Model.Model Msg.Msg, Cmd Msg.Msg )
init flags = 
    let
        initModel =
            { steps = initSteps
            , state = Model.ViewingSteps
            }
        
        initSteps =
            [   { label = "Choose a Race"
                , request = Cmd.none
                }
            ]
    in
    ( initModel, Cmd.none )