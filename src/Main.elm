module Main exposing (..)


import Browser
import Html


import Element


main : Program () Model msg 
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { steps : List Step
    }


type alias Step =
    { label : String
    }


init : () -> ( Model, Cmd msg )
init flags = 
    let
        initModel =
            { steps = initSteps
            }
        
        initSteps =
            [ { label = "Choose a Race" }
            , { label = "Choose a Background" }
            , { label = "Choose an Alignment" }
            , { label = "Choose a Class" }
            , { label = "Generate Ability Scores" }
            , { label = "Choose Equipment" }
            , { label = "Prepare Spells" }
            ]
    in
    ( initModel, Cmd.none )


view : Model -> Html.Html msg
view model =
    viewElement model
    |> Element.layout []


viewElement : Model -> Element.Element msg
viewElement model =
    Element.column
        []
        (model.steps |> List.map (\step -> Element.text step.label))


update : msg -> Model -> ( Model, Cmd msg )
update msg model = ( model, Cmd.none )


subscriptions : model -> Sub msg
subscriptions model =
    Sub.none