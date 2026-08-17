// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{*******************************************************************************
 N. SIG......: 134476
 Data........: 04/04/2023
 Responsável.: Everson Cunha
 Descrição...: Substituição da função RequestAPI
********************************************************************************
 N. SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: Inclusão dos caracteres 'ê' 'Ê' na função RemoveCaracterEspecial
******************************************************************************** 
 N. SIG......: 112010
 Data........: 17/09/2020
 Responsável.: Andre Imakawa
 Descrição...:  Criação das funções para remover caracter especial.
********************************************************************************
 N. SIG......: 102321
 Data........: 17/09/2020
 Responsável.: Andre Imakawa
 Descrição...: Criação de novo parametro na RequestAPI.
********************************************************************************
 N. SIG......: Recuperação de Senha
 Data........: 06/07/2020
 Responsável.: Everson Cunha
 Descrição...: Implementação do link "Esqueceu a senha?" na FLogin
               Criação da função RequestAPI
********************************************************************************
 N. SIG......: 100668
 Data........: 29/06/2020
 Responsável.: Andre Imakawa
 Descrição...: Rotina para utilizar serviço de monitoramento
********************************************************************************
 N. SIG......: 18865
 Data........: 12/07/2005
 Responsável.: Rodolpho da Silva
 Descrição...: Corrigir o o método de montagem de histórico
******************************************************************************** }


unit UFuncaoGeral;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
   ToolWin, Db, DBTables, DBCtrls, math, wwDbGrid,
   IdHTTP, // Andre Imakawa - SIG 100668
   uCmControlObject, 
   IdBaseComponent, IdIntercept, IdSSLIntercept, IdSSLOpenSSL, ComObj; //Everson Cunha / Recuperação de Senha

type TFuncaoGeral = class(TCmControlObject)
  public
    {** Descontinuadas **}
    function OraNumero(rNumero : Double ):string;
    Procedure TiraIcone;
    Function Elevado(nBase,nExpoente:Double):Double;

    {** Implementado na uString **}
    Function Spc (QTD:Integer):String;
    Function AD(S:string; T:Integer):String;
    Function AE(S:string; T:Integer):String;
    Function RemoveChar(sChar:Char; sTexto: String): String;

    {** Implementado na uDataBase **}
    procedure FechaQry(DataSets: array of TDataSet; bFree,
      bUnPrepare: Boolean);

    procedure MoveRegistros(GrdOrigem, GrdDestino: TwwDbGrid);

    function VerificaLinhaGrid(DataSet: TDataSet; iTagChave,
      iTagVazio: Integer; sTabelaMensagem: String;
      bPermiteChaveVazia: Boolean): Boolean;

    function TestaCotacaoMoeda(iCodMoeda: LongInt;sDataLanc,sExato: String):Real;
    Procedure ArrumaHistorico(sHistorico:String;var sHist1,sHist2,sHist3,sHist4,sHist5:String);
    Function CalcGrau(sMascara,sConteudo : String): Integer;
    Function CalcGrauMax(sMascara : String): Integer;
    Function CalcNumEleGrau(sMascara :String;iGrau:Integer): Integer;
    Function VerificaGrau(sMascara,sConteudo : String): Integer;
    Function VerificaPai(sNomeTabela,sNomeCampo,sMascara,sConteudo : String): Integer;
    Function CalcMascaraPorGrau(sMascara : String; iGrau : integer): string;
    Procedure TestaContaCC(bAceitaSin:Boolean;iPlanoC:LongInt;sConta:String;var sObrigaCC,sNome,sSubConta:String);
    Function TestaCentroCusto(iEmpresa:LongInt;sCcusto:String): String;
    Function TestaContaxCC(iPlano,iEmpresa:LongInt;sCcusto,sConta:String;bExibeMensagem:Boolean): Boolean;
    Function RetUneCodigo(iUnidNegoc, liIdEmpresa: LongInt): String;
    Function Decode(Expr,Exprc, ResultTrue,ResultFalse: Variant): Variant;
    function converte_utf8_ansi(const Source: string):string;  // Andre Imakawa - SIG 100249
    Function EnviaMonitoramento(pHost, pType, pMensagem: String):Boolean; // Andre Imakawa - SIG 100668

    function RequestAPI(const pURL, pMensagem : string; var pRetorno: string ; pType : string = ''; pToken : string = ''):Boolean; //Everson Cunha / Recuperação de Senha
    function GetNomeComputador: String; //Andre Imakawa - SIG 102321
    function RemoveCaracterEspecial(pTexto: String; pRemoveExtra: boolean): String;
    function RetiraEnter(aText : string): string;
  end;
                
implementation

uses uString, uMensErro, uDataBase;


function TFuncaoGeral.OraNumero(rNumero : Double ):string;
var
   sNumero : string;
   AuxDec      : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result:=sNumero;
   DecimalSeparator:=AuxDec;
end;

function TFuncaoGeral.TestaCotacaoMoeda(iCodMoeda: LongInt; sDataLanc, sExato: String):Real;
Var
   sDescMoeda: String;
Begin
   If _Cds.Active Then _Cds.Close;
   _Cds.Data := GetDataPacket('SELECT MOEDESC FROM MOEDA WHERE MOECODIGO = '+InttoStr(iCodMoeda));
   sDescMoeda := _Cds.FieldByName('MOEDESC').AsString;
   _Cds.Close;

   if sExato = 'S' then
      _Cds.Data := GetDataPacket('SELECT C.COTVALOR FROM COTACAOMOEDA C, MOEDA M WHERE C.MOECODIGO = M.MOECODIGO AND C.MOECODIGO = '+InttoStr(iCodMoeda)+' AND to_date('''+sDataLanc+''',''dd/MM/yyyy'') >= C.COTDATA AND to_date('''+sDataLanc+''',''dd/MM/yyyy'') <= DECODE(C.COTDATAFIM,NULL,C.COTDATA,C.COTDATAFIM)')
   else
      _Cds.Data := GetDataPacket('SELECT C.COTVALOR, C.COTDATA FROM COTACAOMOEDA C, MOEDA M WHERE C.MOECODIGO = M.MOECODIGO AND C.MOECODIGO = '+InttoStr(iCodMoeda)+' AND C.COTDATA <= to_date('''+sDataLanc+''',''dd/MM/yyyy'') ORDER BY C.COTDATA DESC');

   _Cds.First;
   If not _Cds.IsEmpty then
      result := _Cds.FieldByName('COTVALOR').AsFloat
   else
      result := 0;

   if result = 0 then
   Begin
      If sExato = 'S' then
         Raise Exception.Create('Não existe cotação cadastrada para a Moeda ' + sDescMoeda + ' no dia ' + sDataLanc + '. Verifique.')
      else
         Raise Exception.Create('Não existe cotação cadastrada para a Moeda ' + sDescMoeda + ' anterior ao dia ' + sDataLanc + '. Verifique.');
   end;

   _Cds.Close;
end;


Procedure TFuncaoGeral.ArrumaHistorico(sHistorico:String;var sHist1,sHist2,sHist3,sHist4,sHist5:String);
var iFator,ia,i,iNumero:Integer;
    aHistorico:Array[1..5] of String;
Begin
   iFator:=0;
   aHistorico[1]:='';
   aHistorico[2]:='';
   aHistorico[3]:='';
   aHistorico[4]:='';
   aHistorico[5]:='';
   for ia := 1 to 5 do
   Begin
      aHistorico[ia]:=copy(sHistorico,(iFator+1),40);
      if length(trim(copy(sHistorico,(iFator+1),200))) <= 40 then
         Break;
      iNumero:=40;
      for i := 1 to 40 do
      begin
        if copy(aHistorico[ia],iNumero,1) = ' ' then
        Begin
           aHistorico[ia]:=copy(sHistorico,(iFator+1),iNumero);
           Break;
        end;
        iNumero:=(iNumero-1);
      end;


      if (iNumero = 0) and (aHistorico[ia] <> '') then
        iFator := iFator + 40
      else
      

        iFator:=iFator+iNumero;

   end;

   sHist1:=aHistorico[1];
   sHist2:=aHistorico[2];
   sHist3:=aHistorico[3];
   sHist4:=aHistorico[4];
   sHist5:=aHistorico[5];
end;

Procedure TFuncaoGeral.TiraIcone;
Begin
  screen.Cursor:=crDefault;
End;

function  TFuncaoGeral.CalcGrau(sMascara,sConteudo : String): Integer;
var
   iNumEleSP,iNumDigC,iNumDigM,i: Integer;
begin
   //Calcula o grau da conta indicada
   Result   := 1;
   sConteudo:=trim(sConteudo);
   sMascara :=trim(sMascara);
   iNumDigM :=Length(sMascara);
   iNumDigC :=Length(sConteudo);
   iNumEleSP:=0;
   for i:= 1 to iNumDigM do
   Begin
      if iNumEleSP>=iNumDigC then
         Break;
      if Copy(sMascara,i,1)='.' then
         Result:=Result+1
      else
         iNumEleSP:=iNumEleSP+1;
   end;
end;

function  TFuncaoGeral.CalcGrauMax(sMascara :String): Integer;
var
   iNumDigM,i: Integer;
begin
   //Calcula o número de graus máximo de acordo com a mascara
   Result   := 1;
   sMascara :=trim(sMascara);
   iNumDigM :=Length(sMascara);
   for i:= 1 to iNumDigM do
   Begin
      if Copy(sMascara,i,1)='.' then
         Result:=Result+1;
   end;
end;

function  TFuncaoGeral.CalcNumEleGrau(sMascara :String;iGrau:Integer): Integer;
var
   iNumDigM,iNumPontos,i: Integer;
begin
   //Retorna o número de elementos até o grau sem os pontos
   Result    := 0;
   iNumPontos:=1;
   sMascara  :=trim(sMascara);
   iNumDigM  :=Length(sMascara);
   for i:= 1 to iNumDigM do
   Begin
      if iNumPontos>iGrau then
         Break;
      if Copy(sMascara,i,1)='.' then
         iNumPontos:=iNumPontos+1
      else
         Result:=Result+1;
   end;
end;

function  TFuncaoGeral.VerificaGrau(sMascara,sConteudo : String): Integer;
var
   iGrau,iNumEleC,iNumEle,iNumDigM,i: Integer;
begin
//Testa se o que foi digitado é valido
// Result:= 0 => OK,  Result:= -1 Errado
   Result   :=0;
   sMascara :=trim(sMascara);
   sConteudo:=trim(sConteudo);
   iGrau    :=CalcGrau(sMascara,sConteudo);
   iNumEleC :=CalcNumEleGrau(sMascara,iGrau);
   iNumEle  :=0;
   iNumDigM :=Length(trim(sConteudo));
   for i:= 1 to iNumDigM do
   Begin
      if Copy(sConteudo,i,1) <> '.' then
         iNumEle:=iNumEle+1;
   end;
   if iNumEle <> iNumEleC then
      Result:=-1;
end;

function  TFuncaoGeral.VerificaPai(sNomeTabela,sNomeCampo,sMascara,sConteudo : String): Integer;
var
   iGrau,iNumEleC: Integer;
begin
   //
   _Cds.Data := GetDataPacket('SELECT '+sNomeCampo+' FROM '+sNomeTabela+
                            ' WHERE '+sNomeCampo+' = '''+sConteudo+'''');

   if not _Cds.IsEmpty then
      Result   :=-2
   Else
   Begin
      Result   :=0;
      sMascara :=trim(sMascara);
      sConteudo:=trim(sConteudo);
      iGrau    :=CalcGrau(sMascara,sConteudo);
      dec(iGrau);

      if iGrau = 0 then exit;

      iNumEleC :=CalcNumEleGrau(sMascara,iGrau);
      sConteudo:=Copy(sConteudo,1,iNumEleC);

      _Cds.Data := GetDataPacket('SELECT '+sNomeCampo+' FROM '+sNomeTabela+
                               ' WHERE '+sNomeCampo+' = '''+sConteudo+'''');

      if _Cds.IsEmpty then  Result:=-1;
   End;

   If _Cds.Active Then _Cds.Close;
end;

Function TFuncaoGeral.CalcMascaraPorGrau(sMascara : String; iGrau : integer): string;
var
   iNumElem: integer;
begin
   //Retorna a mascara até o grau solicitado
   //Ex.: Suponhamos a conta 11101 (grau 4) e a Mascara: 9.9.9.99.999
   //     CalcMascaraPorGrau('9.9.9.99.999',4) = '9.9.9.99'
   iNumElem := CalcNumEleGrau(sMascara,iGrau);
   result := copy(sMascara, 1, (iNumElem + iGrau - 1 ));
end;

Procedure TFuncaoGeral.TestaContaCC(bAceitaSin:Boolean;iPlanoC:LongInt;sConta:String;var sObrigaCC,sNome,sSubConta:String);
begin
  //
  _Cds.Data := GetDataPacket(' SELECT PLATIPO,PLANOME,PLACCUST,PLASUBCONTA FROM PLANOCONTA WHERE PLANO = '+IntToStr(iPlanoC)+' AND PLAINATIVA = ''A'' AND PLACONTA = '''+sConta+'''');
  //
  sObrigaCC:='';
  sSubConta:='';
  sNome    :='';

  if _Cds.IsEmpty then
     Raise Exception.Create('Conta Contábil '+sConta+' Não Cadastrada. Verifique.')
  Else
  Begin
     if (_Cds.FieldByName('PLATIPO').AsString <> 'A') and
        (bAceitaSin = False) then
        Raise Exception.Create('Conta Contábil '+sConta+' Tem que ser Analítica.')
     ELse
     Begin
        sObrigaCC:= _Cds.FieldByName('PLACCUST').AsString;
        sSubConta:= _Cds.FieldByName('PLASUBCONTA').AsString;
        sNome    := _Cds.FieldByName('PLANOME').AsString;
     End;
  End;

   If _Cds.Active Then _Cds.Close;
end;

Function TFuncaoGeral.TestaCentroCusto(iEmpresa:LongInt;sCcusto:String): String;
begin
  Result:='';
  //
  _Cds.Data := GetDataPacket('SELECT NOME FROM CENTCUST WHERE CODCENTROCUSTO  = '''+sCCusto+''''+
                                                 ' AND IDEMPRESA = '+IntToStr(iEmpresa)+' AND (ATIVO = ''S'' OR ATIVO IS NULL)');
  //
  if _Cds.IsEmpty then
     Raise Exception.Create('Centro de Custo '+sCcusto+' Não Cadastrado. Verifique.')
  Else
     Result:= _Cds.FieldByName('NOME').AsString;

  If _Cds.Active Then _Cds.Close;
end;

Function TFuncaoGeral.AD(S:string; T:Integer):String;
Begin
   Result := uString.AlDireita(S,T);
end;

Function TFuncaoGeral.AE(S:string; T:Integer):String;
Begin
   Result := uString.AlEsquerda(S,T);
end;

Function TFuncaoGeral.Spc (QTD:Integer):String;
begin
   Result := uString.Spc(QTD);
end;

function  TFuncaoGeral.RetUneCodigo(iUnidNegoc, liIdEmpresa: LongInt): String;
begin
   Result   :='';
   _Cds.Data := GetDataPacket(' SELECT UNECODIGO FROM UNIDNEGOCIO ' +
                                                  ' WHERE (IDPESSOA = ' + IntToStr(liIdEmpresa) + ') ' +
                                                  ' AND  UNIDNEGOC = ' + IntToStr(iUnidNegoc));

   if not _Cds.IsEmpty then
      Result := _Cds.FieldByName('UNECODIGO').AsString;

   If _Cds.Active Then _Cds.Close;
End;

Function TFuncaoGeral.Decode(Expr,Exprc, ResultTrue,ResultFalse: Variant): Variant;
Begin
   If Expr = Exprc Then
      Result     := ResultTrue
   Else
      Result     := ResultFalse;
End;

Function TFuncaoGeral.RemoveChar(sChar:Char; sTexto: String): String;
Begin
  Result := uString.RemoveChar(sChar, sTexto);
End;

Function TFuncaoGeral.TestaContaxCC(iPlano, iEmpresa:LongInt; sCcusto, sConta:String; bExibeMensagem:Boolean): Boolean;
Begin
  If Trim(sCcusto) <> '' Then
  Begin
     _Cds.Data := GetDataPacket('SELECT IDEMPRESA FROM CONTASXCC WHERE ' +
                                ' (PLANO = '     + IntToStr(iPlano) + ') AND ' +
                                ' (IDEMPRESA = ' + IntToStr(iEmpresa) + ') AND ' +
                                ' (RTRIM(PLACONTA) = ''' + Trim(sConta) + ''') AND ' +
                                ' (RTRIM(CODCENTROCUSTO) = ''' + Trim(sCcusto) + ''')  ');

     Result := Not _Cds.IsEmpty;

     If Not Result And bExibeMensagem Then
        MsgDlg(' O Centro de Custo ' + sCcusto + ' não está associado a conta ' + sConta, 'Erro', mtError, [ mbOk ], 0);

     _Cds.Close;   
  End
  Else
     Result := True;
End;

Function TFuncaoGeral.Elevado(nBase,nExpoente:Double):Double;
begin
   Result := Power(nBase, nExpoente);
end;

procedure TFuncaoGeral.FechaQry(DataSets: array of TDataSet; bFree,
  bUnPrepare: Boolean);
begin
  uDataBase.FechaQry(DataSets, bFree, bUnPrepare);
end;

procedure TFuncaoGeral.MoveRegistros(GrdOrigem, GrdDestino: TwwDbGrid);
begin
  uDataBase.MoveRegistros(GrdOrigem, GrdDestino);
end;

function TFuncaoGeral.VerificaLinhaGrid(DataSet: TDataSet; iTagChave,
  iTagVazio: Integer; sTabelaMensagem: String;
  bPermiteChaveVazia: Boolean): Boolean;
begin
  result := uDataBase.VerificaLinhaGrid(DataSet, iTagChave, iTagVazio, sTabelaMensagem, bPermiteChaveVazia)
end;

// Andre Imakawa - SIG 100668 - Inicio
Function TFuncaoGeral.EnviaMonitoramento(pHost, pType, pMensagem: String):Boolean;
var lParams : TStringList;
    lResponse : TStringStream;
    sMensagem: string;
    IdHTTP1: TIdHTTP;
begin
  Try         // André, favor verificar para descontinuar o uso desta função e
              // passar a usar a RequestAPI          !!!!!!
    try
      IdHTTP1 := TidHTTP.Create(Nil);
      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');

      lParams.Add(pMensagem);
      IdHTTP1.Request.ContentType := pType;
      IdHTTP1.Post(pHost, lParams, lResponse);
      Result := True;
      
    Except
      on E: Exception do
      begin
        Result := False;
      end;
    end;
  finally
    FreeAndNil(IdHTTP1);
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
  end;
end;
// Andre Imakawa - SIG 100668 - Fim

// Andre Imakawa - SIG 100249 - Inicio
function TFuncaoGeral.converte_utf8_ansi(const Source: string):string;
var
   Iterator, SourceLength, FChar, NChar: Integer;
begin
   Result := '';
   Iterator := 0;
   SourceLength := Length(Source);
   while Iterator < SourceLength do
   begin
      Inc(Iterator);
      FChar := Ord(Source[Iterator]);
      if FChar >= $80 then
      begin
         Inc(Iterator);
         if Iterator > SourceLength then break;
         FChar := FChar and $3F;
         if (FChar and $20) <> 0 then
         begin
            FChar := FChar and $1F;
            NChar := Ord(Source[Iterator]);
            if (NChar and $C0) <> $80 then break;
            FChar := (FChar shl 6) or (NChar and $3F);
            Inc(Iterator);
            if Iterator > SourceLength then break;
         end;
         NChar := Ord(Source[Iterator]);
         if (NChar and $C0) <> $80 then break;
         Result := Result + WideChar((FChar shl 6) or (NChar and $3F));
      end
      else
         Result := Result + WideChar(FChar);
   end;
end;
// Andre Imakawa - SIG 100249 - Fim

//SIG134476 - Everson Cunha - Ini
// Função descontinuada //Error connecting with SSL
{
//Everson Cunha / Recuperação de Senha - Início
function TFuncaoGeral.RequestAPI(pHost, pMensagem: string; var pRetorno: string; pType,
  pToken: String): Boolean;
var lParams :TStringList;
    lResponse : TStringStream;
    IdHTTP1: TIdHTTP;
    SSL: TIdConnectionInterceptOpenSSL;
begin
  Try
    try
      IdHTTP1 := TidHTTP.Create(Nil);
      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');
      SSL := TIdConnectionInterceptOpenSSL.Create(nil);

      lParams.Add(pMensagem);

      if pType <> '' then
        IdHTTP1.Request.ContentType := pType;

      if pToken <> '' then
        IdHTTP1.Request.ExtraHeaders.Values['TokenSistema'] := pToken;

      SSL.SSLOptions.Method := sslvSSLv23;
      SSL.SSLOptions.Mode := sslmClient;

      //Caso ocorra problemas com o Indy "could not load ssl library indy"
      //baixar as dlls libeay32.dll e ssleay32.dll e adicionar ao system32 ou
      //sysWOW64 de acordo com a versão dos componentes Indy instalados
      //Atualmente nossa versão é 8.0.21
      //https://indy.fulgan.com/SSL/Archive/
      if (Pos('HTTPS', UpperCase(pHost)) > 0) then
      begin
        IdHTTP1.Intercept := SSL;
        IdHTTP1.InterceptEnabled := True;
      end;

      IdHTTP1.Post(pHost, lParams, lResponse);
      pRetorno := lResponse.DataString;   // Andre Imakawa - SIG 102321
      Result := True;
      
    Except
      on E:Exception do
      begin
        pRetorno := e.message;         // Andre Imakawa - SIG 102321 // Andre Imakawa - SIG 112010
        Result := False;
      end;
    end;
  finally
    FreeAndNil(IdHTTP1);
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
    FreeAndNil(SSL);
  end;
end;
//Everson Cunha / Recuperação de Senha - Fim }

function TFuncaoGeral.RequestAPI(const pURL, pMensagem: string; var pRetorno: string; pType, pToken: String): Boolean;
var
  lHTTP: OleVariant;
begin
  try
    lHTTP := CreateOleObject('MSXML2.XMLHTTP');
    lHTTP.open('POST', pURL, False);

    if pType <> '' then
        lHTTP.setRequestHeader('Content-Type', pType);

      if pToken <> '' then
        lHTTP.setRequestHeader('TokenSistema', pToken);

    lHTTP.send(pMensagem);

    pRetorno := lHTTP.responseText;
    Result := True;

  except
    on E: Exception do
    begin
      pRetorno := E.Message;
      Result := False;
    end;
  end;
end;
//SIG134476 - Everson Cunha - Fim

//Andre Imakawa - SIG 102321 - Inicio
function TFuncaoGeral.GetNomeComputador: String;
var
  lpBuffer : PChar;
  nSize    : DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize    := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result   := String(lpBuffer);
  StrDispose(lpBuffer);
end;
//Andre Imakawa - SIG 102321 - Fim
//Andre Imakawa - SIG 112010 - Inicio
function TFuncaoGeral.RemoveCaracterEspecial(pTexto: String;
  pRemoveExtra: boolean): String;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..40] of String = ('á', 'à', 'ã', 'â', 'ä', 'Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è', 'ê', 'É', 'È', 'Ê', 'í', 'ì', 'Í', 'Ì',
                                     'ó', 'ò', 'ö', 'õ', 'ô', 'Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü', 'Ú', 'Ù', 'Ü', 'ç', 'Ç', 'ñ', 'Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..40] of String = ('a', 'a', 'a', 'a', 'a', 'A', 'A', 'A', 'A', 'A',
                                     'e', 'e', 'e', 'E', 'E', 'E', 'i', 'i', 'I', 'I',
                                     'o', 'o', 'o', 'o', 'o', 'O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u', 'u', 'u', 'u', 'c', 'C', 'n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := pTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.
   if (pRemoveExtra) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], ' ', [rfreplaceall]);
   Result := xTexto;
end;

function TFuncaoGeral.RetiraEnter(aText : string): string;
begin
  { Retirando as quebras de linha em campos blob }
  Result := StringReplace(aText, #$D#$A, '', [rfReplaceAll]);

  { Retirando caracter especial }
  Result := StringReplace(Result, #$A, '', [rfReplaceAll]);
 
  { Retirando as quebras de linha em campos blob }
  Result := StringReplace(Result, #13#10, '', [rfReplaceAll]);
end;
//Andre Imakawa - SIG 112010 - Fim
end.

