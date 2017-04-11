module Routing exposing (..)

import Navigation exposing (Location)
import Model exposing (Model, Route(..))
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
         [ map MainRoute top
         , map LoginRoute (s "login")
         , map AboutRoute (s "about")
         ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing ->
            NotFoundRoute


mainPath : String
mainPath = "#"


loginPath : String
loginPath = "#login"


aboutPath : String
aboutPath = "#about"

