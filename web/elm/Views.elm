module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Msgs exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [
          button [ class "waves-effect waves-light btn" ]
              [ text model.value
              ]
        ]
