module Main exposing (..)


import Browser


import Init
import Model
import Msg
import Subscriptions
import Update
import View


main : Program () Model.Model Msg.Msg 
main =
    Browser.element
        { init = Init.init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }