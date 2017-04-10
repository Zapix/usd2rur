module Auth.Login exposing (..)

import Html exposing (..)
import Msgs exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =
    div []
        [ text "Login page" ]
