module Init exposing (..)


import Model
import Msg


init : () -> ( Model.Model, Cmd Msg.Msg )
init flags = 
    ( Model.init, Cmd.none )