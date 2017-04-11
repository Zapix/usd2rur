module Bank.Update exposing (..)

import Msgs exposing (Msg)
import Model exposing (Model)
import Bank.Msgs exposing (BankMsg(..))
import Bank.Model exposing (BankModel)


bankUpdate: BankMsg -> Model -> (Model, Cmd Msg)
bankUpdate message model =
    case message of
        OnLoadBankList response ->
            let
                bankModel = model.bank
                updatedBankModel = { bankModel | banks = response }
            in
                ({ model | bank = updatedBankModel }, Cmd.none)
