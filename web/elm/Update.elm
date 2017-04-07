module Update exposing (..)

import Msgs exposing (Msg)
import Model exposing (Model)


update : Msg -> Model -> (Model, Cmd Msg)
update message model
    = (model, Cmd.none)

