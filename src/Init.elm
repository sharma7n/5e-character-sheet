module Init exposing (..)


import Action
import Model
import Msg


init : () -> ( Model.Model, Cmd Msg.Msg )
init flags = 
    ( Model.init, Action.getBlocks )