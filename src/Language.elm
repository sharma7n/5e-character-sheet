module Language exposing (..)


type alias Language =
    { name : String
    , prevalence : Prevalence
    }


type Prevalence
    = Standard
    | Exotic
    | Secret