module Bank.List exposing (..)


import Html exposing (..)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =
    div [ class "center-align" ]
        [ text "List of available banks will be here" ]