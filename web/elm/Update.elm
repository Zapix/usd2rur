module Update exposing (..)

import Msgs exposing (Msg(..))
import Navigation exposing (Location)
import Model exposing (Model, Route(..))
import Routing exposing (parseLocation)
import Auth.Msgs exposing (LoginMsg)
import Auth.Update exposing (loginUpdate)
import Auth.Model exposing (initialLoginModel, initialAuthModel)


update : Msg -> Model -> (Model, Cmd Msg)
update message model =
    case message of
        NoOp ->
            (model, Cmd.none)
        OnLocationChange location ->
            let
                route = parseLocation location
                updatedModel = updateModelOnRouteChange model route
            in
                ({ updatedModel | route = route }, Cmd.none )
        OnLoginChange loginMessage ->
            loginUpdate loginMessage model


updateModelOnRouteChange : Model -> Route -> Model
updateModelOnRouteChange model route =
    case route of
        MainRoute ->
            model
        AboutRoute ->
            model
        LoginRoute ->
            { model | loginData = initialLoginModel }
        LogoutRoute ->
            { model | auth = initialAuthModel }
        NotFoundRoute ->
            model
