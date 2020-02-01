module Update exposing (..)


import Http


import Model
import Msg


update : Msg.Msg -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.NoOp ->
            updateNoOp model


updateNoOp : Model.Model -> ( Model.Model, Cmd Msg.Msg )
updateNoOp model =
    ( model, Cmd.none )