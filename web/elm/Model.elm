module Model exposing (..)
import Auth.Model exposing (LoginModel, initialLoginModel)


type alias Model =
    { value: String
    , route: Route
    , loginData: LoginModel
    }

initialModel : Route -> Model
initialModel route =
    { route = route
    , value = "Hello Phoenix"
    , loginData = initialLoginModel
    }


type Route
    = LoginRoute
    | AboutRoute
    | NotFoundRoute