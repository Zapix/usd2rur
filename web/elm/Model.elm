module Model exposing (..)


type alias Model =
    { value: String
    , route: Route
    }

initialModel : Route -> Model
initialModel route =
    { route = route
    , value = "Hello Phoenix"
    }


type Route
    = LoginRoute
    | AboutRoute
    | NotFoundRoute