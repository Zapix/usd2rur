module Auth.Update exposing (..)

import Model exposing (Model)
import Msgs exposing (Msg)
import Auth.Msgs exposing (LoginMsg(..))
import Auth.Model exposing (LoginModel, LoginFormField(..))
import Debug

loginUpdate : LoginMsg -> Model -> (Model, Cmd Msg)
loginUpdate message model =
    case message of
        OnLoginFormChange field value ->
            let
                loginData = updateLoginData model.loginData field value
            in
                ( { model | loginData = loginData }, Cmd.none )
        OnLoginFormSubmit ->
            let
                strData = toString model.loginData
            in
                Debug.log strData
                ( model, Cmd.none )


updateLoginData : LoginModel -> LoginFormField -> String -> LoginModel
updateLoginData loginData field value =
    case field of
        UsernameField ->
            { loginData | username = value }
        PasswordField ->
            { loginData | password = value }
