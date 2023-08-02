#define MAGIC_NUMBER 6766

void OnStart()
{
  MqlTradeRequest request = {};
  MqlTradeResult result = {};
  ZeroMemory(request);
  ZeroMemory(result);

  request.action = (ENUM_TRADE_REQUEST_ACTIONS)TRADE_ACTION_DEAL;
  request.magic = MAGIC_NUMBER;
  request.order = 0.1;
  request.symbol = _Symbol;
  request.volume = 1;
  request.price = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
  request.stoplimit = 1;
  request.sl = 1;
  request.tp = 1;
  request.deviation = 1;
  request.type = (ENUM_ORDER_TYPE)ORDER_TYPE_BUY;
  request.type_filling = (ENUM_ORDER_TYPE_FILLING)ORDER_FILLING_FOK;
  request.type_time = (ENUM_ORDER_TYPE_TIME)ORDER_TIME_DAY;
  request.expiration = 1;
  request.comment = 1;
  request.position = 1;
  request.position_by = 1;
  bool sent = OrderSend(request, result);

  return 0;
}