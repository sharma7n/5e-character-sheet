module Update exposing (..)


import Model
import Msg


update : Msg.Msg -> Model.Model Msg.Msg -> ( Model.Model Msg.Msg, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.WorkOnStep step ->
            updateWorkOnStep step model


updateWorkOnStep : Model.Step Msg.Msg -> Model.Model Msg.Msg -> ( Model.Model Msg.Msg, Cmd Msg.Msg )
updateWorkOnStep step model =
    let
        newModel =
            { steps = model.steps
            , state = Model.DoingStep step
            }
    in
    ( newModel, step.request )