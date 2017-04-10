module Auth.Msgs exposing (..)
import Auth.Model exposing (LoginFormField)

type LoginMsg
    = OnLoginFormChange LoginFormField String
    | OnLoginFormSubmit
