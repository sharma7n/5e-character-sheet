module Update exposing (..)


import Model
import Msg


update : Msg.Msg -> Model.Model Msg.Msg -> ( Model.Model Msg.Msg, Cmd Msg.Msg )
update msg model =
    case msg of
        WorkOnStep step ->
            updateWorkOnStep step model


updateWorkOnStep : Step Msg.Msg -> Model.Model Msg.Msg -> ( Model.Model Msg.Msg, Cmd Msg.Msg )
updateWorkOnStep step model =
    let
        newModel =
            { steps = model.steps
            , state = DoingStep step
            }
    in
    ( newModel, step.request )