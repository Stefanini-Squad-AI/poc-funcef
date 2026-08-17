unit UFuncaoGeral;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
 ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
 Wwdatsrc, DBCtrls;

type TFuncaoGeral = Class
  public
    function OraNumero(rNumero : Double ):string;
    function TestaCotacaoMoeda(iCodMoeda: LongInt;sDataLanc,sExato: String):Real;
    Procedure ArrumaHistorico(sHistorico:String;var sHist1,sHist2,sHist3,sHist4,sHist5:String);
    Procedure TiraIcone;
    Function CalcGrau(sMascara,sConteudo : String): Integer;
    Function CalcGrauMax(sMascara : String): Integer;
    Function CalcNumEleGrau(sMascara :String;iGrau:Integer): Integer;
    Function VerificaGrau(sMascara,sConteudo : String): Integer;
    Function VerificaPai(sNomeTabela,sNomeCampo,sMascara,sConteudo : String): Integer;
    Function CalcMascaraPorGrau(sMascara : String; iGrau : integer): string;
    Procedure TestaContaCC(bAceitaSin:Boolean;iPlanoC:LongInt;sConta:String;var sObrigaCC,sNome,sSubConta:String);
    Function TestaCentroCusto(iEmpresa:LongInt;sCcusto:String): String;
    Function TestaContaxCC(iPlano,iEmpresa:LongInt;sCcusto,sConta:String;bExibeMensagem:Boolean): Boolean;
    Function Spc (QTD:Integer):String;
    Function AD(S:string; T:Integer):String;
    Function AE(S:string; T:Integer):String;
    Function UltimoDiaMes(sData:String): String;
    Function RetUneCodigo(iUnidNegoc : LongInt): String;
    Function Decode(Expr,Exprc, ResultTrue,ResultFalse: Variant): Variant;
    Function RemoveChar(sChar:Char; sTexto: String): String;
    Procedure FechaQry(QryUpd: Array of TwwQuery;bFree, bUnPrepare:Boolean);
    Function Elevado(nBase,nExpoente:Double):Double;
    procedure MoveRegistros(GrdOrigem,GrdDestino:TwwDbGrid);
    function  VerificaLinhaGrid(Qry:TwwQuery;iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
  end;

var
  FuncaoGeral : TFuncaoGeral;

implementation

uses uMensErro,uDataBase,DBaseDados,USistema;

// ************* Parametros ************************
// icoddoc = CODDOCUMENTO da Tabela DOCUMENTO
// sRecPag = passar  SisrecPag na Unit USistema
//           ('P'- Contas a Pagar,'R'-Contas a Receber)
// rSaldo  = Saldo que retornara Calculado do registro em questao
// rSaldoOutraMoeda = Saldo referente a outra moeda que retornara calculado


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

function TFuncaoGeral.TestaCotacaoMoeda(iCodMoeda: LongInt;sDataLanc,sExato: String):Real;
var
  qryCotacaoMoeda,qryMoeda:TwwQuery;
Begin
    qryCotacaoMoeda :=TwwQuery.Create(Application);
    qryCotacaoMoeda.DatabaseName  := 'BASEDADOS';
    qryMoeda :=TwwQuery.Create(Application);
    qryMoeda.DatabaseName  := 'BASEDADOS';
Try
    qryMoeda.Close;
    qryMoeda.SQL.text := 'SELECT MOECODIGO,MOEDESC,MOESIGLA,FLGPERCVALOR,MOEPERIODICIDADE FROM '+Sistema.PrefixoServidor+'MOEDA WHERE MOECODIGO = '+InttoStr(iCodMoeda);
    qryMoeda.Open;
    //
    qryCotacaoMoeda.Close;
    if sExato = 'S' then
       qryCotacaoMoeda.SQL.text := 'SELECT M.MOECODIGO,C.COTVALOR,M.MOEDESC,M.MOESIGLA FROM COTACAOMOEDA C, MOEDA M WHERE C.MOECODIGO = M.MOECODIGO AND C.MOECODIGO = '+InttoStr(iCodMoeda)+' AND to_date('''+sDataLanc+''',''dd/MM/yyyy'') >= C.COTDATA AND to_date('''+sDataLanc+''',''dd/MM/yyyy'') <= DECODE(C.COTDATAFIM,NULL,C.COTDATA,C.COTDATAFIM)'
    else
       qryCotacaoMoeda.SQL.text := 'SELECT M.MOECODIGO,C.COTVALOR,M.MOEDESC,M.MOESIGLA FROM COTACAOMOEDA C, MOEDA M WHERE C.MOECODIGO = M.MOECODIGO AND C.MOECODIGO = '+InttoStr(iCodMoeda)+' AND C.COTDATA <= to_date('''+sDataLanc+''',''dd/MM/yyyy'') ORDER BY C.COTDATA DESC';
    qryCotacaoMoeda.Open;
    qryCotacaoMoeda.First;
    If not qryCotacaoMoeda.IsEmpty then
       result:=qryCotacaoMoeda.FieldByName('COTVALOR').AsFloat
    else
       result:=0;

    if result = 0 then
    Begin
       If sExato = 'S' then
          MsgDlg('Não existe cotação cadastrada para a Moeda '+qryMoeda.FieldByName('MOEDESC').AsString+' no dia '+sDataLanc+'. Verifique.','Erro',mtError,[mbOk],0)
       else
          MsgDlg('Não existe cotação cadastrada para a Moeda '+qryMoeda.FieldByName('MOEDESC').AsString+' anterior ao dia '+sDataLanc+'. Verifique.','Erro',mtError,[mbOk],0);
    end;
Finally
    qryCotacaoMoeda.Free;
    qryMoeda.Free;
End;
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
   //Result:= 0 => OK,  Result:= -1 Errado
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
   qryPai:TwwQuery;
begin
// Testa se tem pai e se o código já está cadastrado.
// Result:= 0 => tem pai,  Result:= -1 => não tem pai, Result:= -2 => Já Cadastrado
   qryPai :=TwwQuery.Create(Application);
   qryPai.DatabaseName  := 'BASEDADOS';
Try
   //
   qryPai.Close;
   qryPai.SQL.Text := 'SELECT '+sNomeCampo+' FROM '+Sistema.PrefixoServidor+sNomeTabela+
                      ' WHERE '+sNomeCampo+' = '''+sConteudo+'''';
   qryPai.open;
   //
   if not qryPai.IsEmpty then
   Begin
      Result   :=-2;
      exit;
   end;
   Result   :=0;
   sMascara :=trim(sMascara);
   sConteudo:=trim(sConteudo);
   iGrau    :=CalcGrau(sMascara,sConteudo);
   dec(iGrau);
   if iGrau = 0 then
   Begin
      exit;
   End;

   iNumEleC :=CalcNumEleGrau(sMascara,iGrau);
   sConteudo:=Copy(sConteudo,1,iNumEleC);
   qryPai.Close;
   qryPai.SQL.Text := 'SELECT '+sNomeCampo+' FROM '+Sistema.PrefixoServidor+sNomeTabela+
                      ' WHERE '+sNomeCampo+' = '''+sConteudo+'''';
   qryPai.open;
   if qryPai.IsEmpty then
      Result:=-1;
   qryPai.Close;
Finally
   qryPai.Free;
End;
end;

Function TFuncaoGeral.CalcMascaraPorGrau(sMascara : String; iGrau : integer): string;
var iNumElem: integer;
begin
   //Retorna a mascara até o grau solicitado
   //Ex.: Suponhamos a conta 11101 (grau 4) e a Mascara: 9.9.9.99.999
   //     CalcMascaraPorGrau('9.9.9.99.999',4) = '9.9.9.99'
   iNumElem := CalcNumEleGrau(sMascara,iGrau);
   result := copy(sMascara, 1, (iNumElem + iGrau - 1 ));
end;

Procedure TFuncaoGeral.TestaContaCC(bAceitaSin:Boolean;iPlanoC:LongInt;sConta:String;var sObrigaCC,sNome,sSubConta:String);
var
  qryTestaC:TwwQuery;
begin
  qryTestaC :=TwwQuery.Create(Application);
  qryTestaC.DatabaseName  := 'BASEDADOS';
Try
  //
  qryTestaC.Close;
  qryTestaC.SQL.Clear;
  qryTestaC.SQL.text :='SELECT PLATIPO,PLANOME,PLACCUST,PLASUBCONTA FROM '+Sistema.PrefixoServidor+'PLANOCONTA WHERE PLANO = '+IntToStr(iPlanoC)+' AND PLAINATIVA = ''A'' AND PLACONTA = '''+sConta+'''';
  qryTestaC.Open;
  //
  sObrigaCC:='';
  sSubConta:='';
  sNome    :='';
  if qryTestaC.IsEmpty then
  Begin
     MsgDlg('Conta Contábil '+sConta+' Não Cadastrada. Verifique.','Erro',mtError,[mbOk],0);
     exit;
  end;
  if (qryTestaC.FieldByName('PLATIPO').AsString <> 'A') and (bAceitaSin = False) then
  Begin
     MsgDlg('Conta Contábil '+sConta+' Tem que ser Analítica.','Erro',mtError,[mbOk],0);
     exit;
  end;
  sObrigaCC:= qryTestaC.FieldByName('PLACCUST').AsString;
  sSubConta:= qryTestaC.FieldByName('PLASUBCONTA').AsString;
  sNome    := qryTestaC.FieldByName('PLANOME').AsString;
  //
Finally
  qryTestaC.Free;
end;
end;

Function TFuncaoGeral.TestaCentroCusto(iEmpresa:LongInt;sCcusto:String): String;
var
  qryTestaC:TwwQuery;
begin
// Result:='' => Centro de Custo não existe
// Result:=Nome do Centro de Custo  => Centro de Custo existe
qryTestaC :=TwwQuery.Create(Application);
qryTestaC.DatabaseName  := 'BASEDADOS';
Try
  //
  qryTestaC.Close;
  qryTestaC.SQL.text :=  'SELECT NOME FROM '+Sistema.PrefixoServidor+'CENTCUST WHERE CODCENTROCUSTO  = '''+sCCusto+''''+
                         ' AND IDEMPRESA = '+IntToStr(iEmpresa)+' AND (ATIVO = ''S'' OR ATIVO IS NULL)';
  qryTestaC.Open;
  //
  Result:='';
  if qryTestaC.IsEmpty then
  Begin
     MsgDlg('Centro de Custo '+sCcusto+' Não Cadastrado. Verifique.','Erro',mtError,[mbOk],0);
     exit;
  end;
  Result:= qryTestaC.FieldByName('NOME').AsString;
Finally
  qryTestaC.Free;
End;
end;

Function TFuncaoGeral.AD(S:string; T:Integer):String;
var temp:string;
    tam, cont:Integer;
Begin
     If S <> '' Then
     Begin
          temp := Trim(s);

          If length(Temp) > T Then
             temp := Copy(Temp,1,T);

          tam := length(temp);

          for cont:=1 to t - tam do
             temp:=' '+temp;

          result := temp;
     End
     Else
          result := Spc(T);
end;

Function TFuncaoGeral.AE(S:string; T:Integer):String;
var temp:string;
    cont, tam:Integer;
Begin
   If S <> '' Then
   Begin
     temp := Trim(s);

     If length(Temp) > T Then
          temp := Copy(Temp,1,T);

     tam := length(temp);

     for cont:=1 to t - tam do
     temp:=temp+' ';
     result := temp;
   End
     Else
          result := Spc(T);
end;

Function TFuncaoGeral.Spc (QTD:Integer):String;
var cont: Integer;
    t:string;
begin
   t:='';
   for cont:=1 to qtd do
   t:=t+' ';
   result := t;
end;


function  TFuncaoGeral.UltimoDiaMes(sData : String): String;
Begin
    Result:='';
    if (StrToInt(copy(sData,4,2)) = 1) or (StrToInt(copy(sData,4,2)) = 3) or
       (StrToInt(copy(sData,4,2)) = 5) or (StrToInt(copy(sData,4,2)) = 7) or
       (StrToInt(copy(sData,4,2)) = 8) or (StrToInt(copy(sData,4,2)) = 10) or
       (StrToInt(copy(sData,4,2)) = 12) then
       Result:='31/';
    if (StrToInt(copy(sData,4,2)) = 2) then
    Begin
       Result:='28/';
       if (StrToInt(copy(sData,7,4)) mod 4 = 0) then begin
          if (StrToInt(copy(sData,7,4)) mod 100 = 0) then begin
             if (StrToInt(copy(sData,7,4)) mod 400 = 0) then begin
                Result:='29/';
             end;
          end else begin
             Result:='29/';
          end;
       end;
    end;
    if (StrToInt(copy(sData,4,2)) = 4) or (StrToInt(copy(sData,4,2)) = 6) or
       (StrToInt(copy(sData,4,2)) = 9) or (StrToInt(copy(sData,4,2)) = 11) then
       Result:='30/';
    Result:=Result+copy(sData,4,7);
end;

function  TFuncaoGeral.RetUneCodigo(iUnidNegoc : LongInt): String;
var
   qryPai:TwwQuery;
begin
   qryPai :=TwwQuery.Create(Application);
   qryPai.DatabaseName  := 'BASEDADOS';
Try
   //
   qryPai.Close;
   qryPai.SQL.Text := 'SELECT UNECODIGO FROM UNIDNEGOCIO '+
                      'WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') '+
                      'AND  UNIDNEGOC = '+IntToStr(iUnidNegoc);
   qryPai.open;
   //
   Result   :='';
   if not qryPai.IsEmpty then
   Begin
      Result:=qryPai.FieldByName('UNECODIGO').AsString;
   end;
Finally
   qryPai.Close;
   qryPai.Free;
End;
End;

Function TFuncaoGeral.Decode(Expr,Exprc, ResultTrue,ResultFalse: Variant): Variant;
Begin
   If Expr = Exprc Then
      Result     := ResultTrue
   Else
      Result     := ResultFalse;
End;

Function TFuncaoGeral.RemoveChar(sChar:Char; sTexto: String): String;
Var
 sAux: String;
Begin
  sAux := sTexto;
  While Pos(sChar,sAux) <> 0 Do
        Delete(sAux,Pos(sChar,sAux),1);
  Result := sAux;
End;

Procedure TFuncaoGeral.FechaQry(QryUpd: Array of TwwQuery;bFree, bUnPrepare:Boolean);
Var
  NumQry: Integer;
Begin
  For NumQry := 0 To High(QryUpd) Do
  Begin
      If QryUpd[NumQry].Active Then
      Begin
        If QryUpd[NumQry].CachedUpdates And
           QryUpd[NumQry].UpdatesPending Then
           QryUpd[NumQry].CancelUpdates;
        QryUpd[NumQry].Close;
      End;

      If bUnPrepare And QryUpd[NumQry].Prepared Then
         QryUpd[NumQry].UnPrepare;

      If bFree Then
         QryUpd[NumQry].Free;
  End;
End;

Function TFuncaoGeral.TestaContaxCC(iPlano,iEmpresa:LongInt;sCcusto,sConta:String;bExibeMensagem:Boolean): Boolean;
Begin
  If Trim(sCcusto) <> '' Then
  Begin
     Result := FazQuery(DtmBaseDados.Qry,'SELECT IDEMPRESA FROM CONTASXCC WHERE ' +
                                         ' (PLANO = '     + IntToStr(iPlano) + ') AND ' +
                                         ' (IDEMPRESA = ' + IntToStr(iEmpresa) + ') AND ' +
                                         ' (RTRIM(PLACONTA) = ''' + Trim(sConta) + ''') AND ' +
                                         ' (RTRIM(CODCENTROCUSTO) = ''' + Trim(sCcusto) + ''')  ');
     If Not Result And bExibeMensagem Then
        MsgDlg(' O Centro de Custo ' + sCcusto + ' não está associado a conta ' + sConta,'Erro',mtError,[mbOk],0);
  End
  Else
     Result := True;
End;

Function TFuncaoGeral.Elevado(nBase,nExpoente:Double):Double;
begin
     if nExpoente <= 0 then
        Result := 1
     else
        Result := Exp(nExpoente*Ln(nBase));
end;

procedure TFuncaoGeral.MoveRegistros(GrdOrigem,GrdDestino:TwwDbGrid);
Var X,Y,iTotCampos: Integer;
Begin
  If (Not GrdOrigem.DataSource.DataSet.IsEmpty) and (GrdOrigem.SelectedList.count > 0) Then
  Begin
    For Y := 0 To GrdOrigem.SelectedList.count - 1 Do
    Begin
       GrdOrigem.DataSource.DataSet.GotoBookmark(GrdOrigem.SelectedList[Y]);

       GrdDestino.DataSource.DataSet.Append;

       iTotCampos := GrdOrigem.DataSource.DataSet.FieldCount - 1;

       For X:=0 To iTotCampos Do
           GrdDestino.DataSource.DataSet.Fields[x].Value := GrdOrigem.DataSource.DataSet.Fields[x].Value;

       GrdDestino.DataSource.DataSet.Post;
       GrdOrigem.DataSource.DataSet.Delete;
    End;
    GrdOrigem.SelectedList.Clear;
    GrdDestino.DataSource.Dataset.First;
    GrdOrigem.DataSource.Dataset.First;
  End;
End;

Function TFuncaoGeral.VerificaLinhaGrid(Qry:TwwQuery; iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
Var X:Integer;
    sChave: String;
    ListaChave: TStrings;
Begin
   ListaChave := TStringList.Create;

   If Qry.IsEmpty Then
   Begin
      Result := True;
      Exit;
   End;

   Try
      Qry.First;
      While Not Qry.Eof Do
      Begin
          sChave := '';
          For X:=0 To Qry.FieldCount - 1 Do
              If (Qry.Fields[X].Tag = iTagChave) Or (Qry.Fields[X].Tag = iTagVazio) Then
              Begin
                 sChave  := sChave + Trim(Qry.Fields[X].AsString);
                 If (Not bPermiteChaveVazia) And (Qry.Fields[X].Tag <> iTagVazio) Then
                 Begin
                     If Qry.Fields[X].IsNull Then
                     Begin
                       Application.MessageBox(PChar('O Campo ' + Qry.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
                       Result := False;
                       Exit;
                     End;
                 End;
              End;
          If ListaChave.IndexOf(sChave) <> -1 Then
          Begin
               Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
          End
          Else
            If sChave = '' Then
            Begin
               Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
            End
            Else
               ListaChave.Add(sChave);
          Qry.Next;
      End;
      Qry.First;
      Result := True;
   Finally
      ListaChave.Free;
   End;
End;


end.

