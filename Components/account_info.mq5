//+------------------------------------------------------------------+
//|                                                        input.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link "https://www.mql5.com"
#property version "1.00"

void OnStart()
{
  long accountCode = AccountInfoInteger(ACCOUNT_MARGIN_MODE);
  string accountType;
  switch (accountCode)
  {
  case 0:
    accountType = "NETTING";
    break;

  case 1:
    accountType = "EXCHANGE";
    break;

  case 2:
    accountType = "HEDGING";
    break;

  default:
    accountType = "UNKNOWN";
  }

  ENUM_SYMBOL_TRADE_EXECUTION exeMode = SymbolInfoInteger(NULL, SYMBOL_TRADE_EXEMODE);
  string executionType = EnumToString(exeMode);
  Comment("Execution Type: " + executionType + "\n" +
          "Account Type: " + accountType);
}