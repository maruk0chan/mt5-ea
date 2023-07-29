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
  long accountType = AccountInfoInteger(ACCOUNT_MARGIN_MODE);

  switch (accountType)
  {
  case 0:
    Print("Netting Type");
    break;

  case 1:
    Print("Exchange Type");
    break;

  case 2:
    Print("Hedging Type");
    break;

  default:
    Print("Unknown");
  }

  ENUM_SYMBOL_TRADE_EXECUTION exeMode = SymbolInfoInteger(NULL, SYMBOL_TRADE_EXEMODE);
  string executionType = EnumToString(exeMode);
  Print("Execution Type: " + executionType);
}