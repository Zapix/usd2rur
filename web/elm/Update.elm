module Update exposing (..)

import Msgs exposing (Msg(..))
import Navigation exposing (Location)
import Model exposing (Model, Route(..))
import Routing exposing (parseLocation)
import Auth.Msgs exposing (LoginMsg)
import Auth.Update exposing (loginUpdate)
import Auth.Model exposing (initialLoginModel, initialAuthModel)
import Bank.Commands exposing (loadingBankListCmd)
import Bank.Update exposing (bankUpdate)


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
                ( { updatedModel | route = route }
                , sendCommandOnRouteChange updatedModel route
                )
        OnLoginChange loginMessage ->
            loginUpdate loginMessage model
        OnBankChange bankMessage ->
            bankUpdate bankMessage model


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


sendCommandOnRouteChange : Model -> Route -> Cmd Msg
sendCommandOnRouteChange model route =
    case route of
        MainRoute ->
            loadingBankListCmd model
        AboutRoute ->
            Cmd.none
        LoginRoute ->
            Cmd.none
        LogoutRoute ->
            Cmd.none
        NotFoundRoute ->
            Cmd.none

