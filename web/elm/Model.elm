module Model exposing (..)
import Auth.Model exposing (LoginModel, initialLoginModel, AuthModel, initialAuthModel)


type alias Model =
    { value: String
    , route: Route
    , loginData: LoginModel
    , auth: Maybe AuthModel
    }

initialModel : Route -> Model
initialModel route =
    { route = route
    , value = "Hello Phoenix"
    , loginData = initialLoginModel
    , auth = initialAuthModel
    }


type Route
    = MainRoute
    | LoginRoute
    | AboutRoute
    | NotFoundRoute