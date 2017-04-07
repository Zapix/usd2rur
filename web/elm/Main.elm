module Main exposing (..)

import Html exposing (Html, program)
import Model exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import Views exposing (view)




init : ( Model, Cmd Msg)
init = ( initialModel, Cmd.none )

-- MAIN
main = program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
