module Update exposing (..)


import Http


import Model
import Msg
import Race


update : Msg.Msg -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.WorkOnStep step ->
            updateWorkOnStep step model
        
        Msg.RaceMsg raceMsg ->
            updateOnRaceMsg raceMsg model
        
        Msg.ChoseRace race ->
            updateChoseRace race model


updateWorkOnStep : Model.Step -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
updateWorkOnStep step model =
    let
        newModel = { model | state = Model.DoingStep step }
        cmd = Cmd.map Msg.RaceMsg Race.getRaces
    in
    ( newModel, cmd )


updateOnRaceMsg : Race.Msg -> Model.Model-> ( Model.Model, Cmd Msg.Msg )
updateOnRaceMsg raceMsg model =
    case raceMsg of
        Race.GotRaces result ->
            updateGotRaces result model


updateGotRaces : Result Http.Error (List Race.Race) -> Model.Model-> ( Model.Model, Cmd Msg.Msg )
updateGotRaces result model =
    case result of
        Ok races ->
            let
                newModel = { model | races = races }
            in
            ( newModel, Cmd.none )
        
        Err error ->
            ( model, Cmd.none )


updateChoseRace : Race.Race -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
updateChoseRace race model =
    let
        newModel = { model | chosenRace = Just race }
    in
    ( newModel, Cmd.none )