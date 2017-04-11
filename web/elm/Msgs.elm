module Msgs exposing (..)

import Navigation exposing (Location)
import Auth.Msgs exposing (LoginMsg)

type Msg
    = NoOp
    | OnLocationChange  Location
    | OnLoginChange LoginMsg
