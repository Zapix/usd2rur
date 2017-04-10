module Update exposing (..)

import Msgs exposing (Msg(..))
import Model exposing (Model)
import Routing exposing (parseLocation)


update : Msg -> Model -> (Model, Cmd Msg)
update message model =
    case message of
        NoOp ->
            (model, Cmd.none)
        OnLocationChange location ->
            ( { model | route = parseLocation location }, Cmd.none )

