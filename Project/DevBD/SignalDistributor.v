module SignalDistributor #(parameter NContacts=136)(
input wire Clock,
input wire [7:0] Data,
input wire DataValid,
inout wire [NContacts-1:0] DataToContacts,
output reg [7:0] DataOut,
output reg WrReq,
output reg [1:0] StatusLED);

localparam N=NContacts-1;
localparam GroupCount=NContacts/4;

(*keep*) (*noprune*) reg [7:0] DebugCNT;

reg [N:0] DataToContactsR, DataToContactsCol, DataToContactsZ, DataToContactsZCol;
reg [N-8:0] DataToContactsR2;
initial begin
        DataToContactsR<=0;
        DataToContactsCol<=0;
        DataToContactsZ<=~0;
        DataToContactsZCol<=~0;
        StatusLED<=1;
        end

//Вывод на контакты или сигнала, или Z-состояния, чтобы можно было считать сигнал, поступающий извне.
genvar i;
generate for (i=0;i<(N+1);i=i+1)
  begin:ZStateSetup
  assign DataToContacts[i]=DataToContactsZ[i]?1'bz:DataToContactsR[i];
  end
endgenerate

reg [7:0] ReceivedFrameCountFull, SentFramesCountFull;
initial ReceivedFrameCountFull<=0;

reg [GroupCount-1:0] GroupSetupMask;
initial GroupSetupMask<=0;


(* syn_encoding = "user" *) reg [7:0] State;
initial State<=0;

always @(posedge Clock)
  case (State)
  0:begin
    if ((Data == 1)&DataValid) //Вывод на все контакты принятых данных, отправки подтверждения
    begin
      State<=1;
    end
    else
     if ((Data == 32)&DataValid) //Отправка данных со всех контактов
       begin
        State<=32;
        DataOut<=32;
        WrReq<=1;
      end
    else
      if ((Data == 64)&DataValid) //Установка групп контактов для работы
        begin
        State<=64;
        end
      else
        if ((Data == 80)&DataValid) //Установка сигналов на установленных группах контактов
         begin
         State<=80;
         
        end
       else
         if ((Data == 96)&DataValid) //Считывание сигланов с установленных групп контактов
           begin
           State<=96;
           
          end
        else
           if ((Data == 255)&DataValid) //Проверка платы
              State<=254;
           else
              State<=0;
   //ресетим всё
   ReceivedFrameCountFull<=0;
   end
  1:begin //Вывод на контакты принятых данных, отправка подтверждения
    if (DataValid)
      begin
      WrReq<=0;
      DataToContactsCol[N-4:0]<=DataToContactsCol[N:4];
      DataToContactsCol[N:N-4]<=Data[3:0];
      DataToContactsZCol[N-4:0]<=DataToContactsZCol[N:4];
      DataToContactsZCol[N:N-4]<=Data[7:4];
      ReceivedFrameCountFull<=ReceivedFrameCountFull+1'b1;
      if (ReceivedFrameCountFull==GroupCount)
        State<=2;
      end
    end
  2:begin
    DataToContactsR<=DataToContactsCol;
    DataToContactsZ<=DataToContactsZCol;
    DataOut<=1;
    WrReq<=1;
    State<=3;
    end
  3:begin
    WrReq<=0;
    State<=0;
    end

   
 32:begin //Отправка сигналов с контактов
    DataOut<=DataToContacts[7:0];
    DataToContactsR2<=DataToContacts[N:8];
    SentFramesCountFull<=1;
    State<=33;
    DebugCNT<=DebugCNT+1'b1;
    end
 33:begin
    DataOut<=DataToContactsR2[7:0];
    DataToContactsR2[N-16:0]<=DataToContactsR2[N-8:8];
    SentFramesCountFull<=SentFramesCountFull+1'b1;
    if (SentFramesCountFull==GroupCount/2)
      begin
      DataOut<=0;
      WrReq<=0;
      State<=0;
      end
    else
      State<=33;
    DebugCNT<=DebugCNT+1'b1;
    end

    
 64:if (DataValid) //Установка групп для работы
      begin
      State<=65;

      end
    else
      State<=64;
 65:if (DataValid)
      begin
      State<=66;

      end
    else
      State<=65;
 66:begin
    WrReq<=1;
    DataOut<=64;
    State<=67;
    end
 67:begin

    State<=68;
    end
 68:begin

    State<=69;
    end
 69:begin
    WrReq<=0;
    State<=0;
    end

 80:begin //установка сигнала на заданных группах контактов
    
    State<=0;
    end
    
    
 96:begin //считывание сигнала с заданных групп контактов
    
    State<=0;
    end
//129:State<=0;
//160:State<=0;
   
254:begin    
   WrReq<=1;
   StatusLED[1]<=1;
   DataOut<=255;
   State<=255;
   end
255:begin
   WrReq<=0;
   State<=0;
   end
default:State<=0;
  endcase
endmodule
   