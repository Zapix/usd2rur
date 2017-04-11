module Bank.Commands exposing (..)

import Http exposing (header)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Bank.Model exposing (BankModel, Bank)
import Bank.Msgs exposing (BankMsg(..))
import Msgs exposing (Msg(OnBankChange))
import Model exposing (Model)
import RemoteData


bankListUrl : String
bankListUrl =
    "/api/currency"


loadBankList : String -> Http.Request (List Bank)
loadBankList token =
    let
        tokenString = "Bearer " ++ token
    in
        Http.request
            { method = "GET"
            , expect = Http.expectJson bankListDecoder
            , headers = [ header "Authorization" tokenString ]
            , url = bankListUrl
            , body = Http.emptyBody
            , timeout = Nothing
            , withCredentials = False
            }


loadingBankListCmd : Model -> Cmd Msg
loadingBankListCmd model =
    case model.auth of
        Just auth ->
            loadBankList auth.token
                |> RemoteData.sendRequest
                |>  Cmd.map (\value -> (OnBankChange (OnLoadBankList value)))
        Nothing ->
            Cmd.none


bankListDecoder : Decode.Decoder (List Bank)
bankListDecoder =
    Decode.list bankDecoder


bankDecoder : Decode.Decoder Bank
bankDecoder =
    decode Bank
        |> required "name" Decode.string
        |> required "slug" Decode.string
