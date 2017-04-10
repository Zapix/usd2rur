module Auth.Model exposing (..)

type alias LoginModel =
    { username: String
    , password: String
    }


initialLoginModel : LoginModel
initialLoginModel =
    { username = ""
    , password = ""
    }


type LoginFormField
    = UsernameField
    | PasswordField


type alias AuthModel =
    { token : String }

initialAuthModel: AuthModel
initialAuthModel =
    { token = "" }
