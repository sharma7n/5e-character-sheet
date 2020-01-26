module Main exposing (..)


import Browser
import Html


main : Program () Model msg 
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    {}


init : () -> ( Model, Cmd msg )
init flags = ( {}, Cmd.none )


view : Model -> Html.Html msg
view model = Html.text "Hello, world!"


update : msg -> Model -> ( Model, Cmd msg )
update msg model = ( {}, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none