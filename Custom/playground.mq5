#define EXPERT_MAGIC 123456 // MagicNumber of the expert
//+------------------------------------------------------------------+
//| Opening Buy position                                             |
//+------------------------------------------------------------------+
void OnStart()
{
   //--- declare and initialize the trade request and result of trade request
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
   //--- parameters of request
   request.action = TRADE_ACTION_DEAL;                     // type of trade operation
   request.symbol = Symbol();                              // symbol
   request.volume = 0.1;                                   // volume of 0.1 lot
   request.type = ORDER_TYPE_BUY;                          // order type
   request.price = SymbolInfoDouble(Symbol(), SYMBOL_ASK); // price for opening
   request.deviation = 5;                                  // allowed deviation from the price
   request.magic = EXPERT_MAGIC;                           // MagicNumber of the order
   request.type_filling = ORDER_FILLING_FOK;
   //--- send the request
   if (!OrderSend(request, result))
      PrintFormat("OrderSend error %d", GetLastError()); // if unable to send the request, output the error code
                                                         //--- information about the operation
   PrintFormat("retcode=%u  deal=%I64u  order=%I64u", result.retcode, result.deal, result.order);
   color clr1 = clrDarkSlateBlue
}
//+------------------------------------------------------------------+