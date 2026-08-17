//***************************************************************************************
//Rotina.............: ProcurarLinhaxContaContabil
//N. SIG.............: 72274
//Data da Alteração..: 21/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos campos da tabela LINHAXCONTACONTABIL
//******************************************************************************
//Responsável.....: Edilaine Ferraresi
//Data............: 09/04/2014
//N. Kintana......: 2051763
//N. Sol..........: 155850-15363
//Descrição.......: Inclusão da Funcionalidade SPED
//Rotina..........: CarregarListaPlanoContas, InsereLinhasContabeis, ProcurarLinhaxContaContabil
//*****************************************************************************}
{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
Unit uCtrlLinhaXContaContabil;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbLinhaXContaContabil, DB, classes,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF},
   DBaseDados, Wwquery;
Type
   TCtrlLinhaXContaContabil = Class(TCmControlObject)

   Private
      FDbLinhaXContaContabil: TDbLinhaXContaContabil;

      FCdsLinhaXContaContabil: TClientDataSet;
      FCdsContabil: TClientDataSet;

      Procedure SetDbLinhaXContaContabil(Const Value: TDbLinhaXContaContabil);
      Procedure SetCdsLinhaXContaContabil(Const Value: TClientDataSet);
      Function ExcluirLinhasContabeis(Const pIdLinha: Integer): Boolean;
      Function InsereLinhasContabeis(Const pIdLinha: Integer; Const pLista: TStringList): Boolean;
      Procedure SetCdsContabil(Const Value: TClientDataSet);
      Function ExcluirLinhasCdsContabil: Boolean;
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsLinhaXContaContabil: TClientDataSet Read FCdsLinhaXContaContabil Write SetCdsLinhaXContaContabil;
      Property CdsContabil: TClientDataSet Read FCdsContabil Write SetCdsContabil;
      Property DbLinhaXContaContabil: TDbLinhaXContaContabil Read FDbLinhaXContaContabil Write setDbLinhaXContaContabil;

      Function GravarLinhaxContaContabil: Boolean;
      Function ProcurarLinhaxContaContabil(iIdLinha: Integer): OleVariant;
      Function ProcurarLinhaxContaContabilNovaNorma(iIdLinha: Integer): TStringList;
      Function ListLinhasxContaContabil: OleVariant;
      Function CarregarListaPlanoContas: OleVariant;
      Function GravarLinhasAssociadas(Const pIdLinha: Integer; Const pLista: TStringList): Boolean;
      function PadLeft(aStr: string; aSize: Integer; aCh: char = ' '): string;

      function ExisteLinhaDesembolso(idLinha : Integer) : boolean;

   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlLinhaXContaContabil.Create;
Begin
  Inherited;
  FDbLinhaXContaContabil := TDbLinhaXContaContabil.create(self);
End;

Destructor TCtrlLinhaXContaContabil.Destroy;
Begin
  FDbLinhaXContaContabil.Free;
  If isAppServer Then
    Begin
      FCdsLinhaXContaContabil.free;
    End;
  Inherited;
End;

Procedure TCtrlLinhaXContaContabil.DoChangeDataBase;
Begin
  Inherited;
  DbLinhaXContaContabil.DataBaseName := DataBaseName;
End;

Procedure TCtrlLinhaXContaContabil.SetCdsLinhaXContaContabil(Const Value: TClientDataSet);
Begin
  FCdsLinhaXContaContabil := Value;
End;

Procedure TCtrlLinhaXContaContabil.SetDbLinhaXContaContabil(Const Value: TDbLinhaXContaContabil);
Begin
  FDbLinhaXContaContabil := Value;
End;

Function TCtrlLinhaXContaContabil.GravarLinhaXContaContabil: Boolean;
Var
  Msg: String;
Begin
  Try
    StartTransaction;
    // Pai
    Result := ApplyCds(FCdsLinhaXContaContabil, FDbLinhaXContaContabil, [], []);
    Msg := FDbLinhaXContaContabil.MessageInfo;
    If Not Result Then
      Raise Exception.Create(Msg);
    Commit;
  Except
    On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
  End;
End;

Function TCtrlLinhaXContaContabil.ProcurarLinhaxContaContabil(iIdLinha: Integer): OleVariant;
Var
  sSql: String;
Begin
  sSql:= '';
  sSql:= 'select lc.idassociacao, ';
  sSql:= sSql + 'lc.idlinha, ';
  sSql:= sSql + 'lc.plano, ';
  sSql:= sSql + 'lc.placonta, ';
  sSql:= sSql + 'pla.planome, ';
  //Cássio Rovaroto -  SIG nº 72274 - Início
  sSql := sSql + 'lc.tipobasecalc, ';
  sSql := sSql + 'lc.codajuste, ';
  sSql := sSql + 'lc.numprocesso, ';
  sSql := sSql + 'lc.descrajuste, ';
  sSql := sSql + 'lc.infoajuste, ';
  //Cássio Rovaroto -  SIG nº 72274 - Fim
  sSql:= sSql + 'decode(lc.planatureza, ''C'', ''Credora'', ''Devedora'') as NATUREZA ';  // Edilaine - SOL 155850-15363 / KTN 2051763
  sSql:= sSql + 'from linhaxcontacontabil lc, ';
  sSql:= sSql + 'planoconta pla ';
  sSql:= sSql + 'where pla.plano  = lc.plano ';
  sSql:= sSql + 'and pla.placonta = lc.placonta ';
  sSql:= sSql + 'and lc.IDLinha = ' + IntToStr(iIdLinha) + ' ' ;
  sSql:= sSql + 'order by idlinha,plano,placonta ';
  Result := GetDataPacket(sSql);
End;

Function TCtrlLinhaXContaContabil.CarregarListaPlanoContas: OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  // Edilaine - SOL 155850-15363 / KTN 2051763
  sSql := 'Select 0 as Selecao, pla.plano, pla.placonta, pla.planome, pla.planatureza, ';
  sSql := sSql +  'decode(pla.planatureza, ''D'', ''Devedora'', ''C'', ''Credora'', ''Credora e Devedora'') NATUREZA ';
  sSql := sSql +  'from planoconta pla ';
  //sSql := sSql +  'where pla.plano = 43 ';                              
  sSql := sSql +  'where pla.plano = (select plano from paramcontab) ';
  // Edilaine - SOL 155850-15363 / KTN 2051763
  Result := GetDataPacket(sSql);

End;

Procedure TCtrlLinhaXContaContabil.OnCreateAppServer;
Begin
  Inherited;
  FcdsLinhaXContaContabil := TClientDataSet.Create(Nil);
End;

Function TCtrlLinhaXContaContabil.ListLinhasxContaContabil: OleVariant;
Var
  sSql: String;
Begin
  sSql := 'SELECT * FROM LinhasXContaContabil ORDER BY IdLinha';
  Result := GetDataPacket(sSql);
End;

Function TCtrlLinhaXContaContabil.ExcluirLinhasContabeis(Const pIdLinha: Integer): Boolean;
Var
  sSql: String;
Begin
  sSql := 'Delete from LinhaxContaContabil where idLinha = ' + IntToStr(pIdLinha);
  Result := ExecSql(sSql);
End;

Function TCtrlLinhaXContaContabil.GravarLinhasAssociadas(Const pIdLinha: Integer; Const pLista: TStringList): Boolean;
Var
  Msg: String;
Begin
  Try
    StartTransaction;

    Result := InsereLinhasContabeis(pIdLinha, pLista);
    If Result Then
      Result := ExcluirLinhasCdsContabil;
    Msg := FDbLinhaXContaContabil.MessageInfo;
    If Not Result Then
      Raise Exception.Create(Msg);
    Commit;
  Except
    On E: Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
  End;
End;

Function TCtrlLinhaXContaContabil.ExcluirLinhasCdsContabil: Boolean;
Begin
  Result := True;
  With CdsContabil Do
    Begin
      if (CdsContabil <> nil) then
        begin
          DisableControls;
          filter := 'Selecao = 1';
          filtered := True;
          While Not eof Do
            cdsContabil.Delete;
          First;
          Filter := '';
          Filtered := False;
          EnableControls;
        end;
    End;
End;

Function TCtrlLinhaXContaContabil.InsereLinhasContabeis(Const pIdLinha: Integer; Const pLista: TStringList): Boolean;
Var
  iCount: Integer;
  sPlano: String;
  sConta: String;
  sNatureza : string;    // Edilaine - SOL 155850-15363 / KTN 2051763
Begin
  Result := True;

//if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;
  For iCount := 0 To pLista.Count - 1 Do
    Begin
      sPlano := Copy(pLista[iCount], 1, 3);
      sNatureza := Copy(pLista[iCount], 5, 1);
      sConta := Copy(pLista[iCount], 7, 50);
      DbLinhaXContaContabil.IDLINHA.asInteger := pIdLinha;
      DbLinhaXContaContabil.PLANO.asString := sPlano;
      DbLinhaXContaContabil.PLACONTA.asString := sConta;
      DbLinhaXContaContabil.PLANATUREZA.AsString := sNatureza;
      result := DbLinhaXContaContabil.Insert;
      If Not Result Then
        Break;
    End;

//if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
End;

Procedure TCtrlLinhaXContaContabil.SetCdsContabil(Const Value: TClientDataSet);
Begin
  FCdsContabil := Value;
End;

function TCtrlLinhaXContaContabil.ProcurarLinhaxContaContabilNovaNorma(iIdLinha: Integer): TStringList;
var
  cds  :TClientDataSet;
  Tsl  : TStringList;
begin
  cds := TClientDataSet.Create(nil);
  Tsl := TStringList.Create;

  with cds do
    try
      Data := ProcurarLinhaxContaContabil(iIdLinha);
      cds.First;
      while not eof do
        begin
          Tsl.Add(PadLeft(FieldByName('PLANO').AsString, 3,'0') + '-' + FieldByName('PLACONTA').AsString);
          Next;
        end;
      Result := Tsl;
    finally
      FreeAndNil(cds);
//    FreeAndNil(tsl);
    end;
end;

function TCtrlLinhaXContaContabil.PadLeft(aStr: string; aSize: Integer; aCh: char = ' '): string;
begin
  while Length(aStr) < aSize do
    aStr := aCh + aStr;
  Result := aStr;
end;



Function TCtrlLinhaXContaContabil.ExisteLinhaDesembolso(idLinha : Integer) : boolean;
Var
  sSql: String;
  qryAux: Twwquery;
Begin
  sSql := '';
  sSql := 'SELECT * FROM linhaxtipodesembolso ';
  sSql := sSql + ' WHERE ';
  sSql := sSql + ' IDLINHA   =  ' + IntToStr(idLinha);
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);
  qryAux.Open;  
  if not qryAux.Eof Then
    begin
      result := true
    end
  else
    result := false;
  freeandnil(qryAux);
End;



End.

