{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit UModulo;

interface

uses Classes, UAutorizacao, dbTables, Forms, SysUtils, Dialogs;

type TModulo = Class

   private

   public
      sSistema : String;
      sMascaraPlano,
      sMascaraDesemb,
      sIntegraContab: String;
      iEmpresaProp,
      iPlano : Integer;
      iUsuario : Integer;
      SisCodOrigem : String;
      UnidNegoc : Integer;
      sLancFinanc:string;
      sEstorna:string;
      bTipoOper:boolean;
      ObrigaCrespon,
      ObrigaAbc:string;
      //**********Incluir#####################
      bUsaCentRespon,bUsaUnidNegoc,bIntegraContab : boolean;
      iUnidNegoc : integer;
      sCODCENTRORESPON : string;

      function GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
//      Function AD2(S:string; T:Integer): String;
//      Function AE2(S:string; T:Integer): String;
//      Function ZD2(N:string; T:Integer): String;
//      Function ZE2(N:string; T:Integer): String;
end;

var Modulo : TModulo;

implementation

uses UDataBase, USistema, DBaseDados;

function TModulo.GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
var iIdLogTotalPREV : longint;
begin
  Result := False;
  iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
  if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';
  with dtmBaseDados.qry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA) '+
            ' VALUES ('+IntToStr(iIdLogTotalPREV)+','+
                        IntToStr(Sistema.IdModulo)+','+
                        ''''+Copy(psDescOperacao,1,100)+''','+
                        IntToStr(Sistema.IdUsuario)+', '+
                        ' SYSDATE )');
    try
      ExecSQL;
    except
      Exit;
    end;
  end;
  Result := True;
end; // GravaLogTOTALPREV

//Function TModulo.AD2(S:string; T:Integer): String;
//var tam, cont: Integer;
//Begin
//  If S <> '' Then
//  Begin
//    If length(S) > T Then
//      S:=Copy(S,1,T);
//    tam:=length(S);
//    for cont:=1 to t - tam do
//      S:=' '+S;
//    result:=S;
//  End
//  Else
//    result:=Spc(T);
//end;
//
//Function TModulo.AE2(S:string; T:Integer): String;
//var temp:string;
//    cont, tam:Integer;
//Begin
//  If S <> '' Then
//  Begin
//    If length(S) > T Then
//      S:=Copy(S,1,T);
//    tam:=length(S);
//    for cont:=1 to t-tam do
//      S:=S+' ';
//    result:=S;
//  End
//  Else
//    result:=Spc(T);
//end;
//
//Function TModulo.ZD2(N:string; T:Integer): String;
//var cont, Tam: Integer;
//Begin
//  If length(N) > T Then
//    N:=Copy(N,1,T);
//  Tam:=length(N);
//  for cont:=1 to t-Tam do
//    N:='0'+N;
//  result:=N;
//end;
//
//Function TModulo.ZE2(N:string; T:Integer): String;
//var cont, Tam: Integer;
//Begin
//  If length(N) > T Then
//    N:=Copy(N,1,T);
//  Tam := length(N);
//  for cont:=1 to t-Tam do
//    N:=N+'0';
//  result:=N;
//end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}
