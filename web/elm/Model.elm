module Model exposing (..)


type alias Model = { value: String }

initialModel : Model
initialModel =
    { value = "Hello Phoenix" }