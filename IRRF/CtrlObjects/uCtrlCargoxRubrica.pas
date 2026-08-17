{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}
Unit uCtrlCargoxRubrica;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbCargoXRubrica, DB, classes,
   Wwquery, uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
   TCtrlCargoxRubrica = Class(TCmControlObject)

   Private
      FDbCargoxRubrica: TDbCargoxRubrica;

      FCdsCargoxRubrica: TClientDataSet;
      FCdsRubrica: TClientDataSet;
      FCdsRubricaBackup: TClientDataSet;
      Function ExcluirLinhasCdsRubricas: Boolean;
      Function InsereLinhasCadastradas(Const pIdNorma, pIdCargo: integer;
         Const pLista, pListaII: TStringList): Boolean;
      Function ListCargoxRubrica: OleVariant;
      Procedure SetCdsCargoxRubrica(Const Value: TClientDataSet);
      Procedure SetCdsRubrica(Const Value: TClientDataSet);
      Procedure SetDbCargoxRubrica(Const Value: TDbCargoxRubrica);

      Procedure CopiarRegistros(Const oCdsOrigem, oCdsDestino: TClientDataSet);
      Function ExcluirLinhasCargoxRubrica(Const pIdNorma,
         pIdCargo,
         pIdProvento: Integer;
         Const pIdAssociacao: Integer = 0): Boolean;
      Function InserirLinhaCargoxRubrica(Const pIdProvento: integer): Boolean;
      Procedure SetCdsRubricaBackup(Const Value: TClientDataSet);

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsCargoxRubrica: TClientDataSet Read FCdsCargoxRubrica Write SetCdsCargoxRubrica;
      Property CdsRubrica: TClientDataSet Read FCdsRubrica Write SetCdsRubrica;
      Property CdsRubricaBackup: TClientDataSet Read FCdsRubricaBackup Write SetCdsRubricaBackup;
      Property DbCargoxRubrica: TDbCargoxRubrica Read FDbCargoxRubrica Write SetDbCargoxRubrica;

      Function GravarCargoxRubrica: Boolean;
      Function CarregarListaCargos: OleVariant;
      Function CarregarListaRubricas: OleVariant;
      Function ProcurarCargoxRubrica(Const pIdNorma: Integer;
         Const pIdCargo: Integer): OleVariant;
      Function GravarLinhasAssociadas(Const pIdNorma, pIdCargo: Integer;
         Const pLista, pListaII: TStringList): Boolean;

      Function ExcluirCargoxRubrica(Const pIdNorma: Integer): Boolean;
      Function ExcluirLinhasAssociadas(Const pIdNorma,
         pIdCargo,
         pIdProvento: Integer;
         Const pIdAssociacao: Integer = 0): Boolean;

      function iRetIdDesconto(IdProvento: String) : Integer;

   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlCargoxRubrica.Create;
Begin
   Inherited;
   FDbCargoxRubrica := TDbCargoxRubrica.create(self);
End;

Destructor TCtrlCargoxRubrica.Destroy;
Begin
   FDbCargoxRubrica.Free;
   If isAppServer Then
      Begin
         FCdsCargoxRubrica.free;
      End;
   Inherited;
End;

Procedure TCtrlCargoxRubrica.DoChangeDataBase;
Begin
   Inherited;
   DbCargoxRubrica.DataBaseName := DataBaseName;
End;

Procedure TCtrlCargoxRubrica.SetCdsCargoxRubrica(Const Value: TClientDataSet);
Begin
   FCdsCargoxRubrica := Value;
End;

Procedure TCtrlCargoxRubrica.SetDbCargoxRubrica(Const Value: TDbCargoxRubrica);
Begin
   FDbCargoxRubrica := Value;
End;

Function TCtrlCargoxRubrica.GravarCargoxRubrica: Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsCargoxRubrica, FDbCargoxRubrica, [], []);
      Msg := FDbCargoxRubrica.MessageInfo;
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

Function TCtrlCargoxRubrica.ProcurarCargoxRubrica(Const pIdNorma: Integer;
   Const pIdCargo: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := 'select cr.idassociacao,' + #13#10 +
      '       cr.idnorma,' + #13#10 +
      '       cr.idcargo,' + #13#10 +
      '       c.titulo,' + #13#10 +
      '       cr.idprovento,' + #13#10 +
      '       pd.descricao' + #13#10 +
      '  from cargoxrubrica cr, cargo c, provdesc pd' + #13#10 +
      ' where cr.idcargo = c.idcargo' + #13#10 +
      '   and cr.idprovento = pd.idprovento' + #13#10 +
      '   and cr.idnorma = ' + IntToStr(pIdNorma) + #13#10 +
      '   and cr.idcargo = ' + IntToStr(pIdCargo) + #13#10 +
      'order by cr.idNorma,cr.idCargo';
   Result := GetDataPacket(sSql);
End;

Function TCtrlCargoxRubrica.CarregarListaRubricas: OleVariant;
Var
  sSql: String;
Begin
  sSql := 'select 0 as Selecao, ';
  sSql := sSql + 'pd.idProvento, ';
  sSql := sSql + 'pd.Descricao, ';
  sSql := sSql + 'pd.flgdesconto ';
  sSql := sSql + 'from provdesc pd ';
  sSql := sSql + 'where descricao is not null ';
  sSql := sSql + 'order by descricao ';
  Result := GetDataPacket(sSql);
End;

Procedure TCtrlCargoxRubrica.OnCreateAppServer;
Begin
   Inherited;
   FcdsCargoxRubrica := TClientDataSet.Create(Nil);
End;

Function TCtrlCargoxRubrica.ListCargoxRubrica: OleVariant;
Var sSql: String;
Begin
   sSql := 'SELECT *' + #13#10 +
      'FROM CargoxRubrica ' + #13#10 +
      'ORDER BY IdNorma';
   Result := GetDataPacket(sSql);
End;

Function TCtrlCargoxRubrica.ExcluirCargoxRubrica(Const pIdNorma: Integer): Boolean;
Var sSql: String;
Begin
   sSql := 'Delete from CargoxRubrica' + #13#10 +
      'where idNorma = ' + IntToStr(pIdNorma);
   Result := ExecSql(sSql);
End;

Function TCtrlCargoxRubrica.GravarLinhasAssociadas(Const pIdNorma, pIdCargo: Integer;
   Const pLista, pListaII: TStringList): Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      Result := InsereLinhasCadastradas(pIdNorma, pIdCargo, pLista, pListaII);
      If Result Then
         Result := ExcluirLinhasCdsRubricas;
      Msg := FDbCargoxRubrica.MessageInfo;
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

Function TCtrlCargoxRubrica.ExcluirLinhasCdsRubricas: Boolean;
Begin
   Result := True;
   With CdsRubrica Do
      Begin
         DisableControls;
         filter := 'Selecao = 1';
         filtered := True;
         While Not eof Do
            CdsRubrica.Delete;
         First;
         Filter := '';
         Filtered := False;
         EnableControls;
      End;
End;

Function TCtrlCargoxRubrica.InsereLinhasCadastradas(Const pIdNorma: Integer;
   Const pIdCargo: integer;
   Const pLista, pListaII: TStringList): Boolean;
Var iCount: Integer;
   sIdProvento: String;
   idDesconto: Integer;
Begin
   Result := True;
   For iCount := 0 To pLista.Count - 1 Do
      Begin
         sIdProvento := Copy(pLista[iCount], 1, 10);
//         idDesconto  := StrToInt(pListaII[iCount]);
         idDesconto  := iRetIdDesconto(sIdProvento);
         DbCargoxRubrica.IDNorma.asInteger := pIdNorma;
         DbCargoxRubrica.IdCargo.asInteger := pIdCargo;
         DbCargoxRubrica.IdProvento.asString := sIdProvento;
         DbCargoxRubrica.IdDesconto.asInteger := idDesconto;

         result := DbCargoxRubrica.Insert;
         If Not Result Then
            Break;
      End;
End;

function TCtrlCargoxRubrica.iRetIdDesconto(IdProvento: String) : Integer;
var
  qryAux  : Twwquery;
begin
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('select FlgDesconto from provdesc ');
  qryAux.SQL.Add('WHERE ');
  qryAux.SQL.Add('IDPROVENTO   = :IDPROVENTO ');
  qryAux.ParamByName('IDPROVENTO').AsString  := IdProvento;
  qryAux.Open;
  if not qryAux.Eof Then
    result := qryAux.FieldByName('FlgDesconto').asInteger
  else
    result := 0;
  freeandnil(qryAux);
end;


Procedure TCtrlCargoxRubrica.SetCdsRubrica(Const Value: TClientDataSet);
Begin
   FCdsRubrica := Value;
End;

Function TCtrlCargoxRubrica.CarregarListaCargos: OleVariant;
Var sSql: String;
Begin
   sSql := 'Select IdCargo,Titulo' + #13#10 +
      'From Cargo';
   Result := GetDataPacket(sSql);
End;

Function TCtrlCargoXRubrica.ExcluirLinhasAssociadas(Const pIdNorma,
   pIdCargo,
   pIdProvento: Integer;
   Const pIdAssociacao: Integer = 0): Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      Result := InserirLinhaCargoxRubrica(pIdProvento);
      If Result Then
         Result := ExcluirLinhasCargoxRubrica(pIdNorma, pIdCargo, pIdProvento, pIdAssociacao);
      Msg := FDbCargoxRubrica.MessageInfo;
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

Function TCtrlCargoXRubrica.InserirLinhaCargoxRubrica(Const pIdProvento: integer): Boolean;
Begin
   Result := False;
   If CdsRubricaBackup.Locate('IdProvento', pIdProvento, []) Then
      Begin
         CopiarRegistros(CdsRubricaBackup, CdsRubrica);
         CdsRubrica.first;
         Result := True;
      End
End;

Procedure TCtrlCargoXRubrica.CopiarRegistros(Const oCdsOrigem, oCdsDestino: TClientDataSet);
Var iCount: Integer;
   oCampo: TField;
   sNome: String;

Begin
   oCdsDestino.Insert;
   For iCount := 0 To oCdsOrigem.Fields.Count - 1 Do
      Begin
         sNome := oCdsOrigem.Fields[iCount].FieldName;
         oCampo := oCdsDestino.FindField(sNome);
         oCampo.Value := oCdsOrigem.Fields[iCount].Value
      End;
   oCdsDestino.Post;
End;

Function TCtrlCargoXRubrica.ExcluirLinhasCargoxRubrica(Const pIdNorma,
   pIdCargo,
   pIdProvento: Integer;
   Const pIdAssociacao: Integer = 0): Boolean;
Var sSql: String;
Begin
   sSql := 'Delete from CargoxRubrica' + #13#10 +
      'where idNorma = ' + IntToStr(pIdNorma) + #13#10 +
      '  and idCargo = ' + IntToStr(pIdCargo) + #13#10 +
      '  and idProvento = ' + IntToStr(pIdProvento);
   If pIdAssociacao <> 0 Then
      sSql := sSql + #13#10 + '  AND IdAssociacao = ' + IntToStr(pIdAssociacao);
   Result := ExecSql(sSql);
End;

Procedure TCtrlCargoxRubrica.SetCdsRubricaBackup(Const Value: TClientDataSet);
Begin
   FCdsRubricaBackup := Value;
End;

End.
