module Page.About exposing (..)

import Html exposing (..)
import Model exposing (Model)
import Msgs exposing (Msg)

view : Model -> Html Msg
view model =
    div []
        [ text "About" ]