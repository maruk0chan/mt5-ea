#define EXPERT_MAGIC 123456 // エキスパートアドバイザのMagicNumber
#import "test.ex5"
   void import_test();
#import
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart()
  {
  import_test();
//--- 結果とリクエストの宣言

//--- リクエストと結果の宣言と初期化
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
//--- リクエストのパラメータ
   request.action = TRADE_ACTION_DEAL; // 　取引操作タイプ
   request.symbol = Symbol();          // シンボル
   request.volume = 0.1;            // 0.1ロットのボリューム
   request.type = ORDER_TYPE_BUY;      // 注文タイプ
   request.price    =SymbolInfoDouble(Symbol(),SYMBOL_ASK); // 発注価格
   request.deviation = 5;        // 価格からの許容偏差
   request.magic = EXPERT_MAGIC; // 注文のMagicNumber
   request.type_filling = ORDER_FILLING_IOC;

   OrderSend(request, result);

   if(result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE)
     {
      Print("successful= ", result.retcode);
     }

   else
     {
      Print("foobar= ", result.comment);
     }
  }
//+------------------------------------------------------------------+
