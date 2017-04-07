module Views exposing (..)

import Html exposing (Html, div, text)
import Model exposing (Model)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ text model.value ]
