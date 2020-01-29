module Msg exposing (..)


import Model
import Race


type Msg
    = WorkOnStep Model.Step
    | RaceMsg Race.Msg