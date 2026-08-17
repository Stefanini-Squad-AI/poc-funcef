{*******************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 28/08/2011                             }
{*******************************************************}
Unit uCtrlLinhaXRubrica;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbLinhaxRubrica, uDbLinhaxTipoDesemb,
   DB, classes, uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF}, Wwquery;

Type
   TCtrlLinhaxRubrica = Class(TCmControlObject)

   Private
      FDbLinhaxRubrica: TDbLinhaxRubrica;

      FCdsLinhaxRubrica: TClientDataSet;
      FCdsRubrica: TClientDataSet;
      FCdsRubricaBackup: TClientDataSet;
      FDbLinhaxTipoDesemb: TDBLinhaxTipoDesemb;
      FCdsTipoDesemb: TClientDataSet;
      FCdsTipoDesembBackup: TClientDataSet;
      Function ExcluirLinhasCdsRubricas: Boolean;
      Function ExcluirLinhasCdsDesemb: Boolean;
      Function InsereLinhasCadastradas(Const pIdLinha: integer; Const pIdNorma: Integer;
         Const pLista, pListaDesemb: TStringList): Boolean;

      Function ListLinhaxRubrica: OleVariant;
      Procedure SetCdsLinhaxRubrica(Const Value: TClientDataSet);
      Procedure SetCdsRubrica(Const Value: TClientDataSet);
      Procedure SetDbLinhaxRubrica(Const Value: TDbLinhaxRubrica);

      Procedure CopiarRegistros(Const oCdsOrigem, oCdsDestino: TClientDataSet);
      Function ExcluirLinhasLinhaxRubrica(Const pIdLinha,
         pIdProvento: Integer;
         Const pCodTipRecDes: String;
         Const pIdLRAssociacao: Integer = 0;
         Const pIdLDAssociacao: Integer = 0): Boolean;


      Function InserirLinhaLinhaxRubrica(Const pIdProvento: integer): Boolean;
      Procedure SetCdsRubricaBackup(Const Value: TClientDataSet);
      Procedure SetDbLinhaxTipoDesemb(Const Value: TDBLinhaxTipoDesemb);
      Procedure SetCdsTipoDesemb(Const Value: TClientDataSet);
      Procedure SetCdsTipoDesembBackup(Const Value: TClientDataSet);
      Function InserirLinhaLinhaxDesemb(Const pCodTipRecDes: String): Boolean;

   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsLinhaxRubrica: TClientDataSet Read FCdsLinhaxRubrica Write SetCdsLinhaxRubrica;
      Property CdsRubrica: TClientDataSet Read FCdsRubrica Write SetCdsRubrica;
      Property CdsRubricaBackup: TClientDataSet Read FCdsRubricaBackup Write SetCdsRubricaBackup;
      Property CdsTipoDesemb: TClientDataSet Read FCdsTipoDesemb Write SetCdsTipoDesemb;
      Property CdsTipoDesembBackup: TClientDataSet Read FCdsTipoDesembBackup Write SetCdsTipoDesembBackup;
      Property DbLinhaxRubrica: TDbLinhaxRubrica Read FDbLinhaxRubrica Write SetDbLinhaxRubrica;
      Property DbLinhaxTipoDesemb: TDBLinhaxTipoDesemb Read FDbLinhaxTipoDesemb Write SetDbLinhaxTipoDesemb;

      Function CarregarListaTipDes: OleVariant;
      Function ProcurarLinhaxRubrica(Const pIdLinha: Integer): OleVariant;

      Function ProcurarLinhaxDesemb(Const pIdLinha: Integer; Const pIdNorma: Integer): OleVariant;
      Function GravarLinhasAssociadas(Const pIdLinha: Integer; Const pIdNorma: Integer;
         Const pLista: TStringList;
         Const pListaDesemb: TStringList): Boolean;

      Function ExcluirLinhaxRubrica(Const pIdLinhaRub, pIdLinhaTip: Integer): Boolean;
      Function ExcluirLinhasAssociadas(Const pIdLinha,
         pIdProvento: Integer;
         Const pCodTipRecDes: String;
         Const pIdLRAssociacao: Integer = 0;
         Const pIdLDAssociacao: Integer = 0): Boolean;
      Function ExcluirLinhasLinhaxDesemb(Const pIdLinha, pIdNorma: Integer; Const pCodTipRecDes: String) : Boolean;

      Function ExisteLinhaContaContabil(pIdLinha : Integer) : boolean;

   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlLinhaxRubrica.Create;
Begin
   Inherited;
   FDbLinhaxRubrica := TDbLinhaxRubrica.Create(Self);
   FDbLinhaxTipoDesemb := TDBLinhaxTipoDesemb.Create(Self);
End;

Destructor TCtrlLinhaxRubrica.Destroy;
Begin
   FDbLinhaxRubrica.Free;
   FDbLinhaxTipoDesemb.Free;
   If isAppServer Then
      Begin
         FCdsLinhaxRubrica.free;
      End;
   Inherited;
End;

Procedure TCtrlLinhaxRubrica.DoChangeDataBase;
Begin
   Inherited;
   DbLinhaxRubrica.DataBaseName := DataBaseName;
   FDbLinhaxTipoDesemb.DataBaseName := DataBaseName;
End;

Procedure TCtrlLinhaxRubrica.SetCdsLinhaxRubrica(Const Value: TClientDataSet);
Begin
   FCdsLinhaxRubrica := Value;
End;

Procedure TCtrlLinhaxRubrica.SetDbLinhaxRubrica(Const Value: TDbLinhaxRubrica);
Begin
   FDbLinhaxRubrica := Value;
End;


Function TCtrlLinhaxRubrica.ProcurarLinhaxDesemb(Const pIdLinha: Integer; Const pIdNorma: Integer): OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + 'SELECT LT.IDASSOCIACAO, ';
  sSql := sSql + '       LR.IDLINHA            IDLINHA,';
  sSql := sSql + '       NV.IDNORMA            NORMA, ';
  sSql := sSql + '       LR.COD_LINHA          LINHA, ';
  sSql := sSql + '       LR.DESCRICAO          DESCRICAO_LINHA, ';
  sSql := sSql + '       TP.DESCRICAOCATEGORIA DESCRICAO_CATEGORIA, ';
  sSql := sSql + '       TR.CODTIPRECDES       CDES, ';
  sSql := sSql + '       TR.DESCRICAO          DESCRICAO_DESEMBOLSO  FROM LINHAXTIPODESEMBOLSO LT, ';
  sSql := sSql + '       LINHA_RELATORIO      LR, ';
  sSql := sSql + '       TIPORECEBDESEMB      TR, ';
  sSql := sSql + '       TIPODECATEGORIA      TP, ';
  sSql := sSql + '       NORMA_VIGENTE        NV ';
  sSql := sSql + ' WHERE LT.IDLINHA = LR.IDLINHA ';
  sSql := sSql + '   AND LT.CODTIPRECDES = TR.CODTIPRECDES ';
  sSql := sSql + '   AND TP.IDTIPODECATEGORIA = LR.IDTIPODECATEGORIA ';
  sSql := sSql + '   AND NV.IDNORMA = LT.IDNORMA ';
  sSql := sSql + '   AND   TR.RECPAG = ''P'' ';
  sSql := sSql + '   AND LT.IDLINHA  = ' + IntToStr(pIdLinha) ;
  sSql := sSql + '   AND NV.IDNORMA  = ' + IntToStr(pIdNorma);
  Result := GetDataPacket(sSql);
End;


Function TCtrlLinhaxRubrica.ProcurarLinhaxRubrica(Const pIdLinha: Integer): OleVariant;
Var
  sSql: String;
Begin
   sSql := '';
   sSql := sSql + 'Select lr.idassociacao  idLrAssociacao, ';
   sSql := sSql + 'ld.idassociacao  idLdAssociacao, ';
   sSql := sSql + 'lr.idLinha idlinha , ';
   sSql := sSql + 'ltr.descricao as descricaolinha, ';
   sSql := sSql + 'lr.idProvento, ';
   sSql := sSql + 'pd.descricao as descricaorubrica, ';
   sSql := sSql + 'ld.codtiprecdes, ';
   sSql := sSql + 'tp.descricao as descricaodesemb ';
   sSql := sSql + 'from linhaxrubrica lr ';
   sSql := sSql + 'left outer join linha_relatorio ltr on ltr.idlinha= lr.idlinha ';
   sSql := sSql + 'left outer join linhaxtipodesembolso ld on lr.idlinha = ld.idlinha ';
   sSql := sSql + 'left outer join provdesc pd on lr.idprovento = pd.idprovento ';
   sSql := sSql + 'left outer join tiporecebdesemb tp on tp.codtiprecdes = ld.codtiprecdes ';
   sSql := sSql + 'where lr.idLinha = ' + IntToStr(pIdLinha) + ' ';
   sSql := sSql + 'order by lr.idLinha';
   Result := GetDataPacket(sSql);
End;

Function TCtrlLinhaxRubrica.CarregarListaTipDes: OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + 'Select 0 as Selecao, ';
  sSql := sSql + 'td.codtiprecdes, ';
  sSql := sSql + 'td.Descricao Descricao ';
  sSql := sSql + 'from tiporecebdesemb td ';
  sSql := sSql + 'where descricao is not null ';
  sSql := sSql + 'and RECPAG = ''P'' ';  // baruc , de acordo com a Contabilidade da FUNCEF, apenas associar os desembolsos classe P(agamento).  
  sSql := sSql + 'order by descricao';
  Result := GetDataPacket(sSql);
End;

Procedure TCtrlLinhaxRubrica.OnCreateAppServer;
Begin
   Inherited;
   FcdsLinhaxRubrica := TClientDataSet.Create(Nil);
End;

Function TCtrlLinhaxRubrica.ListLinhaxRubrica: OleVariant;
Var sSql: String;
Begin
   sSql := 'select lr.idassociacao as idLrAssociacao,' + #13#10 +
      '       ld.idassociacao as idLdAssociacao,' + #13#10 +
      '       lr.idLinha,' + #13#10 +
      '       lr.idProvento,' + #13#10 +
      '       pd.descricao,' + #13#10 +
      '       ld.codtiprecdes,' + #13#10 +
      '       tp.descricao' + #13#10 +
      'from linhaxrubrica lr' + #13#10 +
      'left outer join linhaxtipodesembolso ld on lr.idlinha = ld.idlinha' + #13#10 +
      'left outer join provdesc pd on lr.idprovento = pd.idprovento' + #13#10 +
      'left outer join tiporecebdesemb tp on tp.codtiprecdes = ld.codtiprecdes';
   Result := GetDataPacket(sSql);
End;

Function TCtrlLinhaxRubrica.ExcluirLinhaxRubrica(Const pIdLinhaRub, pIdLinhaTip: Integer): Boolean;
Var sSql: String;
Begin
   sSql := 'Delete from LinhaxRubrica' + #13#10 +
      'where idAssociacao = ' + IntToStr(pIdLinhaRub);
   ExecSql(sSql);
   sSql := 'Delete from LinhaxTipoDesembolso' + #13#10 +
      'where idAssociacao = ' + IntToStr(pIdLinhaTip);
   Result := ExecSql(sSql);
End;

Function TCtrlLinhaxRubrica.GravarLinhasAssociadas(Const pIdLinha: Integer; Const pIdNorma: Integer;
   Const pLista: TStringList;
   Const pListaDesemb: TStringList): Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      Result := InsereLinhasCadastradas(pIdLinha, pIdNorma, pLista, pListaDesemb);

      If Result Then
         Result := ExcluirLinhasCdsRubricas;
      If Result Then
         Result := ExcluirLinhasCdsDesemb;
      Msg := FDbLinhaxRubrica.MessageInfo;

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

Function TCtrlLinhaxRubrica.ExcluirLinhasCdsRubricas: Boolean;
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

Function TCtrlLinhaxRubrica.ExcluirLinhasCdsDesemb: Boolean;
Begin
   Result := True;
   With CdsTipoDesemb Do
      Begin
         DisableControls;
         filter := 'Selecao = 1';
         filtered := True;
         While Not eof Do
            CdsTipoDesemb.Delete;
         First;
         Filter := '';
         Filtered := False;
         EnableControls;
      End;
End;

Function TCtrlLinhaxRubrica.InsereLinhasCadastradas(Const pIdLinha: Integer; Const pIdNorma: Integer;
   Const pLista, pListaDesemb: TStringList): Boolean;
Var iCount: Integer;
   iPos: Integer;
   sIdProvento,
      sCodTipRecDes: String;
Begin
   Result := True;
   For iCount := 0 To pLista.Count - 1 Do
      Begin
         sIdProvento := Copy(pLista[iCount], 1, 10);
         DbLinhaxRubrica.IDLinha.asInteger := pIdLinha;
         DbLinhaxRubrica.IDProvento.asString := sIdProvento;
         result := DbLinhaxRubrica.Insert;
         If Not Result Then
            Break
      End;

   If Result Then
      Begin
//         For iCount := 0 To pLista.Count - 1 Do
         For iCount := 0 To pListaDesemb.Count - 1 Do

            Begin
               iPos := Pos(' - ', pListaDesemb[iCount]);
               sCodTipRecDes := Copy(pListaDesemb[iCount], 1, ipos - 1);
               DbLinhaxTipoDesemb.IDLinha.asInteger := pIdLinha;
               DbLinhaxTipoDesemb.IDNorma.asInteger := pIdNorma;
               DbLinhaxTipoDesemb.CodTipRecDes.asString := Trim(sCodTipRecDes);
               result := DbLinhaxTipoDesemb.Insert;
               If Not Result Then
                  Break
            End;
      End;
End;

Procedure TCtrlLinhaxRubrica.SetCdsRubrica(Const Value: TClientDataSet);
Begin
   FCdsRubrica := Value;
End;

Function TCtrlLinhaxRubrica.ExcluirLinhasAssociadas(Const pIdLinha,
   pIdProvento: Integer;
   Const pCodTipRecDes: String;
   Const pIdLRAssociacao: Integer = 0;
   Const pIdLDAssociacao: Integer = 0): Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      Result := InserirLinhaLinhaxRubrica(pIdProvento);
      If Result Then
         Result := InserirLinhaLinhaxDesemb(pCodTipRecDes);
      If Result Then
         Result := ExcluirLinhasLinhaxRubrica(pIdLinha,
            pIdProvento,
            pCodTipRecDes,
            pIdLRAssociacao,
            pIdLDAssociacao);
      Msg := FDbLinhaxRubrica.MessageInfo;
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

Function TCtrlLinhaxRubrica.InserirLinhaLinhaxRubrica(Const pIdProvento: integer): Boolean;
Begin
   Result := False;
   If CdsRubricaBackup.Locate('IdProvento', pIdProvento, []) Then
      Begin
         CopiarRegistros(CdsRubricaBackup, CdsRubrica);
         CdsRubrica.first;
         Result := True;
      End
End;

Function TCtrlLinhaxRubrica.InserirLinhaLinhaxDesemb(Const pCodTipRecDes: String): Boolean;
Begin
   Result := False;
   If CdsTipoDesembBackup.Locate('CodTipRecDes', pCodTipRecDes, []) Then
      Begin
         CopiarRegistros(CdsTipoDesembBackup, CdsTipoDesemb);
         CdsTipoDesemb.first;
         Result := True;
      End
End;

Procedure TCtrlLinhaxRubrica.CopiarRegistros(Const oCdsOrigem, oCdsDestino: TClientDataSet);
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

Function TCtrlLinhaxRubrica.ExcluirLinhasLinhaxRubrica(Const pIdLinha,
   pIdProvento: Integer;
   Const pCodTipRecDes: String;
   Const pIdLRAssociacao: integer = 0;
   Const pIdLDAssociacao: Integer = 0): Boolean;
Var sSql: String;
Begin
   sSql := 'Delete from LinhaxRubrica' + #13#10 +
      'where idLinha = ' + IntToStr(pIdLinha) + #13#10 +
      '  and idProvento = ' + IntToStr(pIdProvento);
   If pIdLRAssociacao <> 0 Then
      sSql := sSql + #13#10 + '  AND IdAssociacao = ' + IntToStr(pIdLRAssociacao);
   Result := ExecSql(sSql);

   If Result Then
      Begin
         sSql := 'Delete from LinhaxTipoDesembolso' + #13#10 +
            'where idLinha = ' + IntToStr(pIdLinha) + #13#10 +
            '  and CodTipRecDes = ' + QuotedStr(pCodTipRecDes);
         If pIdLDAssociacao <> 0 Then
            sSql := sSql + #13#10 + '  AND IdAssociacao = ' + IntToStr(pIdLDAssociacao);
         Result := ExecSql(sSql);
      End;
End;

Function TCtrlLinhaxRubrica.ExcluirLinhasLinhaxDesemb(Const pIdLinha,
          pIdNorma: Integer; Const pCodTipRecDes: String) : Boolean;
Var
  sSql: String;
Begin
  sSql := 'Delete from linhaxtipodesembolso where ';
  sSql := sSql + ' idLinha = ' + IntToStr(pIdLinha) + ' and ' ;
  sSql := sSql + ' idNorma = ' + IntToStr(pIdNorma) + ' and ' ;
  sSql := sSql + ' CodTipRecDes = ' + pCodTipRecDes;
  Result := ExecSql(sSql);
End;


Procedure TCtrlLinhaxRubrica.SetCdsRubricaBackup(Const Value: TClientDataSet);
Begin
   FCdsRubricaBackup := Value;
End;

Procedure TCtrlLinhaxRubrica.SetDbLinhaxTipoDesemb(Const Value: TDBLinhaxTipoDesemb);
Begin
   FDbLinhaxTipoDesemb := Value;
End;

Procedure TCtrlLinhaxRubrica.SetCdsTipoDesemb(Const Value: TClientDataSet);
Begin
   FCdsTipoDesemb := Value;
End;

Procedure TCtrlLinhaxRubrica.SetCdsTipoDesembBackup(Const Value: TClientDataSet);
Begin
   FCdsTipoDesembBackup := Value;
End;


Function TCtrlLinhaxRubrica.ExisteLinhaContaContabil(pIdLinha :  Integer) : boolean;
var
  sSql: String;
  qryAux: Twwquery;
begin
  sSql := '';
  sSql := 'SELECT * FROM linhaxcontacontabil ';
  sSql := sSql + ' WHERE ';
  sSql := sSql + ' IDLINHA   =  ' + IntToStr(pIdLinha);
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
end;

End.
