module Msg exposing (..)


import Model
import Race


type Msg
    = WorkOnStep (Model.Step Msg)
    | GotRaces (List Race.Race)