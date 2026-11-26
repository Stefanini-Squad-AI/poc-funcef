unit uPilha;
//****************************************************************************//
// SISTEMA : REGRA (REGRAS DE NEGÓCIO)                                        //
//****************************************************************************//
{  Alterações:
{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 183347 Kintana 1712386
//  Descrição : Aumentar limite de 200 passos das regras para 400
//  Data      : 02/07/2012
//------------------------------------------------------------------------------}

interface


type
    str1   = string[1];
    str6   = string[6];
    str30  = string[30];
    tAlgRegra    = Record
                    AlgorRegra      :  String;      // Códigos dos algoritmos
                    AlgorCampo      :  String[12];  // Códigos dos campos
                    AlgorCampo2     :  String[12];  // Códigos dos campos 2
                    AlgorFormula1   :  String[38];  // Códigos das fórmula's1
                    AlgorExpressao  :  String;
                    AlgorCorrelacao :  String[2];   // Códigos das correlações
                    AlgorValor      :  String[60];  // Valores constantes para atribuição ou comparação
                    AlgorSubseqTrue :  String[4];   // Códigos dos algoritmos subseq se true
                    AlgorSubseqFalse:  String[4];   // Códigos dos algoritmos subseq se false
                    AlgorTipo       :  String[4];   // Tipo de Algoritmo
                    Algortipocampo1 :  string[1];
                    Algortipocampo2 :  string[1];
                    Algornomecampo1 :  string[30];
                    Algornomecampo2 :  string[30];
                    AlgorFormatacao :  string[2];

                 end;

  TabAlgRegra  = Array [1..400] of tAlgregra;       //SOL 183347 Kintana 1712386

  PtNodo       = ^Nodo;
  Nodo         = Record
                   Pt           : PtNodo;
                   idRegra      : longint;
                   IdAlgoritmo  : longint;
                   TemQuery     : boolean;
                   TabAlgoritmo : TabAlgRegra;
                 end;

  PtNodoRep    = ^NodoRep;
  NodoRep      = record
                   Pt           : PtNodoRep;
                   idregra      : integer;
                   TabAlgoritmo : TabAlgRegra;
                 end;

  PtNodoInd    = ^NodoInd;
  NodoInd      = record
                     Pt:PtNodoInd;
                     moesigla : string[30];
                     Period   : string[1];
                     cotvalor    : double;
                     cotdata  : tdatetime;
                     flgUltimo   :str1;
                     cotmesref: string[6];
                 end;

    Procedure CriarPilha(var P:PtNodo);
    Procedure Empilhar(var P:PtNodo; id:longint; alg:longint);
    Procedure Desempilhar(var P:PtNodo);
    Function  Vazia(P:PtNodo):boolean;

    Procedure CriarPilhaRep(var P:PtNodoRep);
    Procedure EmpilharRep(var P:PtNodoRep; id,totreg:longint);
    Procedure DesempilharRep(var P:PtNodoRep);
    Function  VaziaRep(P:PtNodoRep):boolean;
    Function  LocalizaRep(idregra:longint;var p:PtNodoRep):Boolean;

    Procedure CriarPilhaInd(var P:PtNodoInd);
    Procedure EmpilharInd(var P:PtNodoInd;ind:str30;per:char;valor:double;cotdata:tdatetime;mes:str6;ult:str1);
    Procedure DesempilharInd(var P:PtNodoInd);
    Function  Vaziaind(P:PtNodoInd):boolean;
    Function  LocalizaInd(moesigla:str30;var p:PtNodoInd):Boolean;
    Function  LocalizaIndMes(moesigla:str30;cotmesref:str6;var p:PtNodoInd):Boolean;
    Function  LocalizaIndData(moesigla:str30;cotdata  :tdatetime;var p:PtNodoInd):Boolean;

implementation

uses uRegra, Dialogs;
{---------procedimentos para controle da pilha de execucao---------------}

Procedure CriarPilha(var P:PtNodo);
begin
    P:=Nil;
end;

Function Vazia(P:PtNodo):boolean;
begin
    Result:=P=Nil;
end;

Procedure Empilhar(var P:PtNodo; id:longint; alg:longint);
var
  tt:PtNodo;
  i :Integer;
begin
  ShowMessage('ATENÇÃO, ESTA REGRA ESTA USANDO UMA FUNCAO QUE FOI DESATIVADA!'+#13+
              'FAVOR COMUNICAR A GETIF.');
  New(tt);
  With tt^ do begin
    idregra:=id;
    idalgoritmo:=alg;
    fillchar(TabAlgoritmo,sizeof(TabAlgoritmo),#0);
    for i:=1 to ITOTREGS do begin
      TabAlgoritmo[i].AlgorRegra        :=aAlgorRegra[i];
      TabAlgoritmo[i].AlgorCampo        :=aAlgorCampo[i];
      TabAlgoritmo[i].AlgorCampo2       :=aAlgorCampo2[i];
      TabAlgoritmo[i].AlgorFormula1     :=aAlgorFormula1[i];
      TabAlgoritmo[i].AlgorExpressao    :=aAlgorExpressao[i];
      TabAlgoritmo[i].AlgorCorrelacao   :=aAlgorCorrelacao[i];
      TabAlgoritmo[i].AlgorValor        :=aAlgorValor[i];
      TabAlgoritmo[i].AlgorSubseqTrue   :=aAlgorSubseqTrue[i];
      TabAlgoritmo[i].AlgorSubseqFalse  :=aAlgorSubseqFalse[i];
      TabAlgoritmo[i].AlgorTipo         :=aAlgorTipo[i];
      TabAlgoritmo[i].Algortipocampo1   :=aAlgortipocampo1[i];
      TabAlgoritmo[i].Algortipocampo2   :=aAlgortipocampo2[i];
      TabAlgoritmo[i].Algornomecampo1   :=aAlgornomecampo1[i];
      TabAlgoritmo[i].Algornomecampo2   :=aAlgornomecampo2[i];
      TabAlgoritmo[i].AlgorFormatacao   :=aAlgorFormatacao[i];
    end;

    Pt:=P;
  end;

  P:=tt;
end;


Procedure Desempilhar(var P:PtNodo);
var
  tt:PtNodo;
begin
     If not Vazia(P) then
     begin
         tt:=P;
         p :=p^.pt;
         Dispose(tt)
     end
end;

{-------fim dos procedimentos para controle da pilha de execucao-------}


{---------procedimentos para controle da pilha do repositorio--------}

Procedure CriarPilhaRep(var P:PtNodoRep);
begin
  P:=Nil;
end;

Function VaziaRep(P:PtNodoRep):boolean;
begin
  Result:=P=Nil;
end;

Procedure EmpilharRep(var P:PtNodoRep; id,totreg:longint);
var
  tt:PtNodoRep;
  i :Integer;
begin
  ShowMessage('ATENÇÃO, ESTA REGRA ESTA USANDO UMA FUNCAO QUE FOI DESATIVADA!'+#13+
              'FAVOR COMUNICAR A GETIF.');
  new(tt);
  with tt^ do begin
    idregra:=id;
    fillchar(TabAlgoritmo,sizeof(TabAlgoritmo),#0);
    for i:=1 to TOTREG do begin
      TabAlgoritmo[i].AlgorRegra             :=aAlgorRegra[i];
      TabAlgoritmo[i].AlgorCampo             :=aAlgorCampo[i];
      TabAlgoritmo[i].AlgorCampo2            :=aAlgorCampo2[i];
      TabAlgoritmo[i].AlgorFormula1          :=aAlgorFormula1[i];
      TabAlgoritmo[i].AlgorExpressao         :=aAlgorExpressao[i];
      TabAlgoritmo[i].AlgorCorrelacao        :=aAlgorCorrelacao[i];
      TabAlgoritmo[i].AlgorValor             :=aAlgorValor[i];
      TabAlgoritmo[i].AlgorSubseqTrue        :=aAlgorSubseqTrue[i];
      TabAlgoritmo[i].AlgorSubseqFalse       :=aAlgorSubseqFalse[i];
      TabAlgoritmo[i].AlgorTipo              :=aAlgorTipo[i];
      TabAlgoritmo[i].Algortipocampo1        :=aAlgortipocampo1[i];
      TabAlgoritmo[i].Algortipocampo2        :=aAlgortipocampo2[i];
      TabAlgoritmo[i].Algornomecampo1        :=aAlgornomecampo1[i];
      TabAlgoritmo[i].Algornomecampo2        :=aAlgornomecampo2[i];
      TabAlgoritmo[i].AlgorFormatacao        :=aAlgorFormatacao[i];
    end;

    Pt:=P;
  end;

  P:=tt;
end;


Procedure DesempilharRep(var P:PtNodoRep);
var
  tt:PtNodoRep;
begin
     If not VaziaRep(P) then
     begin
         tt:=P;
         p:=p^.pt;
         Dispose(tt)
     end
end;

Function  LocalizaRep(idregra:longint;var p:PtNodoRep):Boolean;
var
   tt:ptnodoRep;
begin
     tt :=p;
     while not vaziarep(tt) do
     begin
         if tt^.idregra = idregra then
         begin
             p:=tt;
             result:=true;
             exit;
         end
         else
         tt:=tt^.Pt;
     end;
     result:=false;
end;
{-------fim dos procedimentos para controle da pilha do repositorio-------}


{---------procedimentos para controle da pilha de indices--------}

Procedure CriarPilhaInd(var P:PtNodoInd);
begin
    P:=Nil;
end;

Function VaziaInd(P:PtNodoInd):boolean;
begin
    Result:=P=Nil;
end;

Procedure EmpilharInd(var P:PtNodoInd;ind:str30;per:char;valor:double;cotdata:tdatetime;mes:str6;ult:str1);
var
  tt:PtNodoInd;
begin
  ShowMessage('ATENÇÃO, ESTA REGRA ESTA USANDO UMA FUNCAO QUE FOI DESATIVADA!'+#13+
              'FAVOR COMUNICAR A GETIF.');
  new(tt);
  with tt^ do begin
    moesigla  := Ind;
    Period    := Per;
    cotvalor  := valor;
    cotdata   := cotdata;
    cotmesref := mes;
    flgUltimo := ult;
    Pt:=P;
  end;

  P:=tt;
end;


Procedure DesempilharInd(var P:PtNodoInd);
var
  tt:PtNodoInd;
begin
     If not VaziaInd(P) then
     begin
         tt:=P;
         p:=p^.pt;
         Dispose(tt)
     end
end;

Function  LocalizaInd(moesigla:str30;var p:PtNodoInd):Boolean;
var
   tt:ptnodoInd;
begin
     tt :=p;
     while not vaziaInd(tt) do
     begin
         if tt^.moesigla = moesigla then
         begin
             p:=tt;
             result:=true;
             exit;
         end
         else
         tt:=tt^.Pt;
     end;
     result:=false;
end;

Function  LocalizaIndMes(moesigla:str30;cotmesref:str6;var p:PtNodoInd):Boolean;
var
   tt:ptnodoInd;
begin
      tt :=p;
     while not vaziaInd(tt) do
     begin
         if ((tt^.moesigla = moesigla) and (tt^.cotmesref = cotmesref)) or
            ((tt^.moesigla = moesigla) and (tt^.flgUltimo = '1')) then
         begin
             p:=tt;
             result:=true;
             exit;
         end
         else
         tt:=tt^.Pt;
     end;
     result:=false;
end;

Function  LocalizaIndData(moesigla:str30;cotdata  :tdatetime;var p:PtNodoInd):Boolean;
var
   tt:ptnodoInd;
begin
     tt := p;
     while not vaziaInd(tt) do
     begin
         if (tt^.moesigla = moesigla) and (tt^.cotdata = cotdata) or
            ((tt^.moesigla = moesigla) and (tt^.flgUltimo = '1')) then
         begin
             p := tt;
             result := true;
             exit;
         end
         else
         tt := tt^.Pt;
     end;
     result := false;
end;
{-------fim dos procedimentos para controle da pilha de indices-------}


end.
