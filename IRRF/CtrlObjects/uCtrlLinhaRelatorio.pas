{
//******************************************************************************
//Responsável.....: Edilaine Ferraresi
//Data............: 09/04/2014
//N. Kintana......: 2051763
//N. Sol..........: 155850-15363
//Descrição.......: Inclusão da Funcionalidade SPED
//Rotina..........: ListLinhaRelatorioVigente, CopiarRegistros
//******************************************************************************
//N. Sol..........: SOL 206751
//N. Kintana......: ktn 1999210
//Data............: 13/05/2013
//Responsável.....: Thiago Melo
//Descrição.......: Não grava alterações inclusoes de linhas de relatorio
//******************************************************************************

********************************************************}
{ Softtek                                               }
{ Analista Responsável: Arnaldo V. Scarin               }
{ Atualizado Em: 19/09/2011                             }
{*******************************************************}
//Responsável.....: Arnaldo Scarin
//Revisão.........: Paulo Nobre
Unit uCtrlLinhaRelatorio;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, UDbLinhaRelatorio, DB, Classes,
   uDataBase, uSistema, DbClient, {$IFNDEF VERSAO0505}uCMTypes{$ENDIF},
   uCtrlNormaVigente, uCtrlTipoRelatorio, uCtrlLinhaxContaContabil,
   uCmClientDataSet, UCtrlPadroes;

Type
   TCtrlLinhaRelatorio = Class(TCmControlObject)
   Private
      FDbLinhaRelatorio: TDbLinhaRelatorio;
      FCdsLinhaRelatorio: TCMClientDataSet;
      fNormaVigente: TCtrlNormaVigente;
      fTipoRelatorio: TCtrlTipoRelatorio;
      oLinhaContabil : TCtrlLinhaXContaContabil;
      Procedure SetDbLinhaRelatorio(Const Value: TDbLinhaRelatorio);
      Procedure SetCdsLinhaRelatorio(Const Value: TCMClientDataSet);
      Procedure InserirDadosLinhaRelatorio;
      Function ValidarTipoRelatorio(Const pDescricao: String): Integer;
      Function ExcluirLinhasContabeis(Const pCodLinha: String;
         Const pIdNorma: Integer;
         Const pIdAssociacao: Integer = 0): Boolean;
      Function ValidarNormaVigente: Integer;
      Function EncerraNormasAbertas(Const pIDTipo: Integer): Boolean;
      Function GravarLinhaRelatorioCds(iNorma: Integer; oCds: TClientDataSet): Boolean;
      Function InserirLinhaContabil(Const pIdAssociacao: integer): Boolean;
      Procedure CopiarRegistros(Const oCdsOrigem, oCdsDestino: TClientDataSet);
   Protected
      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
   Public
      CdsContabil: TCMClientDataSet;
      CdsContabilBackup: TCMClientDataSet;
      cdsLinhaxConta: TCmClientDataSet;
      pintIDNormaAntiga : Integer;
      pintIDNormaNova : Integer;

      Constructor Create; Override;
      Destructor Destroy; Override;

      Property CdsLinhaRelatorio: TCMClientDataSet Read FCdsLinhaRelatorio Write SetCdsLinhaRelatorio;
      Property DbLinhaRelatorio: TDbLinhaRelatorio Read FDbLinhaRelatorio Write setDbLinhaRelatorio;

      Property NormaVigente: TCtrlNormaVigente Read fNormaVigente Write fNormaVigente;
      Property TipoRelatorio: TCtrlTipoRelatorio Read fTipoRelatorio Write fTipoRelatorio;

      Function GravarLinhaRelatorio: Boolean;
      Function ProcurarLinhaRelatorio(iIdLinha: Integer): OleVariant;
      Function ProcurarLinhaRelatorioBYCodigo(Const sCodigoLinha: String; Const pIdNorma: Integer; pTpRel : Integer; pIdCategoria : Integer): OleVariant;
      Function ExisteLinhaRelatorioByCodigo(Const pCodigoLinha: String; Const pIdNorma: Integer; pTpRel : Integer; pIdCategoria: Integer): boolean;
      Function ListLinhaRelatorio: OleVariant;
      Function InserirDados(): boolean;
      Function AlterarDados(Const pIdLinha: Integer; Const pIdCategoria: Integer): Boolean;
      Function ExcluirDados(Const pCodLinha: String; Const pIdNorma: Integer; Const pIdCategoria: Integer): Boolean;

      Function ExcluirLinhasAssociadas(Const pCodLinha: String;
         Const pIdNorma: Integer;
         Const pIdAssociacao: Integer = 0): Boolean;
      Function ListLinhaRelatorioVigente(Const pIdNorma: Integer = 0; pIdTipo: Integer = 0; pTpRel : Integer = 0): OleVariant;
      Function ExisteRelatorioImpresso(Const idNorma: Integer): Boolean;
      Function InserirNormaVigente: Boolean;
      Function AlterarNormaVigente: Boolean;
      Function ExisteLinhaRelatorioByDescricao(Const pDescricao: String): Integer;
      Function InserirLinhasNovaNorma : boolean;

      function ListaTipoPlano : OleVariant;    // Edilaine - SOL 155850-15363 / KTN 2051763

   End;

Implementation

{ TCtrlNatuRendimento }

Constructor TCtrlLinhaRelatorio.Create;
Begin
   Inherited;
   FDbLinhaRelatorio := TDbLinhaRelatorio.create(self);
End;

Destructor TCtrlLinhaRelatorio.Destroy;
Begin
   FDbLinhaRelatorio.Free;
   If isAppServer Then
      Begin
         FCdsLinhaRelatorio.free;
      End;
   Inherited;
End;

Procedure TCtrlLinhaRelatorio.DoChangeDataBase;
Begin
   Inherited;
   DbLinhaRelatorio.DataBaseName := DataBaseName;
End;

Procedure TCtrlLinhaRelatorio.SetCdsLinhaRelatorio(Const Value: TCMClientDataSet);
Begin
   FCdsLinhaRelatorio := Value;
End;

Procedure TCtrlLinhaRelatorio.SetDbLinhaRelatorio(Const Value: TDbLinhaRelatorio);
Begin
   FDbLinhaRelatorio := Value;
End;

Function TCtrlLinhaRelatorio.GravarLinhaRelatorio: Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      // Pai
      Result := ApplyCds(FCdsLinhaRelatorio, FDbLinhaRelatorio, [], []);
      Msg := FDbLinhaRelatorio.MessageInfo;
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

Function TCtrlLinhaRelatorio.GravarLinhaRelatorioCds(iNorma: Integer; oCds: TClientDataSet): Boolean;
Begin
   Result := True;
   While Not oCds.Eof Do
      Begin
         FDbLinhaRelatorio.IDNORMA.AsInteger := iNorma;
         FDbLinhaRelatorio.IDNATUREZA.asInteger := oCds.FieldByName('idNatureza').asInteger;
         FDbLinhaRelatorio.DESCRICAO.asString := oCds.FieldByName('DescricaoLinha').asString;
         FDbLinhaRelatorio.COD_LINHA.asString := oCds.FieldByName('COD_LINHA').asString;
         Result := FDbLinhaRelatorio.Insert;
         If Not Result Then
            break;
         oCds.Next;
      End;
End;

Function TCtrlLinhaRelatorio.ProcurarLinhaRelatorio(iIdLinha: Integer): OleVariant;
Var
   sSql: String;
Begin
   sSql := 'SELECT * ' + #13#10 +
      'FROM Linha_Relatorio' + #13#10 +
      'WHERE IDLinha = ' + IntToStr(iIdLinha);
   Result := GetDataPacket(sSql);
End;

Function TCtrlLinhaRelatorio.ExisteLinhaRelatorioByCodigo(Const pCodigoLinha: String; Const pIdNorma: Integer ; pTpRel : Integer; pIdCategoria: Integer): boolean;
Var oCds: TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   oCds.Data := ProcurarLinhaRelatorioByCodigo(pCodigoLinha, pIdNorma, pTpRel, pIdCategoria);
   result := Not oCds.IsEmpty;
End;

Function TCtrlLinhaRelatorio.ProcurarLinhaRelatorioBYCodigo(Const sCodigoLinha: String;
   Const pIdNorma: Integer; pTpRel : Integer; pIdCategoria: Integer): OleVariant;
Var
  sSql: String;
Begin
   sSql := '';
   sSql := sSql + 'select tp.Descricao as TipoRelatorio, ';
   sSql := sSql + 'tp.idTipo, ';
   sSql := sSql + 'nv.idnorma, ';
   sSql := sSql + 'nv.Descricao as Norma, ';
   sSql := sSql + 'nv.DataInicio, ';
   sSql := sSql + 'nv.datafim, ';
   sSql := sSql + 'lr.idlinha, ';
   sSql := sSql + 'lr.cod_linha, ';
   sSql := sSql + 'lr.descricao as DescricaoLinha, ';
   sSql := sSql + 'na.idNatureza, ';
   sSql := sSql + 'na.descricao as NaturezaLinha, ';
   sSql := sSql + 'tc.descricaocategoria as categoria, ';
  // Thiago Melo SOL 206751 ktn 1999210
   //  sSql := sSql + 'tc.idtipodecategoria as idcategoria ';
  // Thiago Melo SOL 206751 ktn 1999210
   sSql := sSql + 'tc.idtipodecategoria ';
   sSql := sSql + 'from Tipo_relatorio  TP, ';
   sSql := sSql + 'Norma_vigente   NV, ';
   sSql := sSql + 'Linha_Relatorio LR, ';
   sSql := sSql + 'Natureza_Linha  NA, ';
   sSql := sSql + 'TipoDeCategoria TC ';
   sSql := sSql + 'where lr.idnorma    = nv.idnorma ';
   sSql := sSql + 'and lr.idnatureza = na.idnatureza ';
   sSql := sSql + 'and tc.idtipodecategoria = lr.idtipodecategoria ';
   sSql := sSql + 'and nv.idtipo     = tp.idtipo ';
   sSql := sSql + 'and lr.cod_linha  = ' + QuotedStr(sCodigoLinha) + ' ';
   sSql := sSql + 'and lr.idNorma     = ' + IntToStr(pIdNorma) + ' ';
   sSql := sSql + 'and tc.idtipodecategoria     = ' + IntToStr(pIdCategoria) + ' ';
   Result := GetDataPacket(sSql);
End;


Procedure TCtrlLinhaRelatorio.OnCreateAppServer;
Begin
   Inherited;
   FcdsLinhaRelatorio := TCMClientDataSet.Create(Nil);
End;

Function TCtrlLinhaRelatorio.ListLinhaRelatorio: OleVariant;
Var sSql: String;
Begin
   sSql := 'select tp.Descricao as TipoRelatorio,' + #13#10 +
      '       tp.idTipo,' + #13#10 +
      '       nv.idnorma,' + #13#10 +
      '       nv.Descricao as Norma,' + #13#10 +
      '       nv.DataInicio,' + #13#10 +
      '       nv.datafim,' + #13#10 +
      '       lr.idlinha,' + #13#10 +
      '       lr.cod_linha,' + #13#10 +
      '       lr.descricao as DescricaoLinha,' + #13#10 +
      '       na.idNatureza,' + #13#10 +
      '       na.descricao as NaturezaLinha' + #13#10 +
      'from tipo_relatorio  TP,' + #13#10 +
      '     Norma_vigente   NV,' + #13#10 +
      '     Linha_Relatorio LR,' + #13#10 +
      '     Natureza_Linha  NA' + #13#10 +
      'where lr.idnorma    = nv.idnorma' + #13#10 +
      '  and lr.idnatureza = na.idnatureza' + #13#10 +
      '  and nv.idtipo     = tp.idtipo';
   Result := GetDataPacket(sSql);
End;

Function TCtrlLinhaRelatorio.ListLinhaRelatorioVigente(Const pIdNorma: Integer = 0; pIdTipo: Integer = 0; pTpRel : Integer = 0): OleVariant;
Var
  sSql: String;
Begin
  sSql := '';
  sSql := sSql + 'select tp.Descricao as TipoRelatorio, ';
  sSql := sSql + '       tp.idTipo, ';
  sSql := sSql + '       nv.idnorma, ';
  sSql := sSql + '       nv.Descricao as Norma, ';
  sSql := sSql + '       nv.DataInicio, ';
  sSql := sSql + '       nv.datafim, ';
  sSql := sSql + '       lr.idlinha, ';
  sSql := sSql + '       lr.cod_linha, ';
  sSql := sSql + '       lr.descricao as DescricaoLinha, ';
  sSql := sSql + '       na.idNatureza, ';
  sSql := sSql + '       na.descricao as NaturezaLinha, ';
  sSql := sSql + '       tc.descricaocategoria as categoria, ';
  sSql := sSql + '       tpp.Descricao as TipoPlano, ';       // Edilaine - SOL 155850-15363 / KTN 2051763
  sSql := sSql + '       lr.TipoContabilizacao, ';            // Edilaine - SOL 155850-15363 / KTN 2051763
  // Thiago Melo SOL 206751 ktn 1999210
  //  sSql := sSql + 'tc.idtipodecategoria as idcategoria ';
  // Thiago Melo SOL 206751 ktn 1999210
  sSql := sSql + '       tc.idtipodecategoria ';
  sSql := sSql + '  from tipo_relatorio  TP, ';
  sSql := sSql + '       Norma_vigente   NV, ';
  sSql := sSql + '       Linha_Relatorio LR, ';
  sSql := sSql + '       Natureza_Linha  NA, ';
  sSql := sSql + '       TIPOPLANOPREV_EFD TPP, ';   // Edilaine - SOL 155850-15363 / KTN 2051763
  sSql := sSql + '       TipoDeCategoria TC  ';
  sSql := sSql + ' where na.idnatureza = lr.idnatureza ';
  sSql := sSql + '   and tc.idtipodecategoria = lr.idtipodecategoria  ';
  sSql := sSql + '   and lr.idnorma    = nv.idnorma ';
  sSql := sSql + '   and nv.idtipo     = tp.idtipo ';
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
  sSql := sSql + '   and tp.idTipo = ' + IntToStr(pIdTipo);
  sSql := sSql + '   and nv.IdNorma = ' + IntToStr(pIdNorma);
  sSql := sSql + '   and (nv.datafim    = to_date(''30/12/1899'',''dd/mm/yyyy'')or nv.datafim is null) ';
  //Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
//  sSql := sSql + 'order by idNorma,cod_linha, idcategoria';
  sSql := sSql + '   and LR.TipoContabilizacao = Tpp.IdTipoPlano(+) ';  // Edilaine - SOL 155850-15363 / KTN 2051763

  sSql := sSql + 'order by  descricaocategoria, cod_linha  ';
  Result := GetDataPacket(sSql);
End;


Function TCtrlLinhaRelatorio.InserirDados(): boolean;
Var Msg: String;
Begin
   Result := True;
   Try
      StartTransaction;

      InserirDadosLinhaRelatorio();

      Msg := FDbLinhaRelatorio.MessageInfo;
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

Procedure TCtrlLinhaRelatorio.InserirDadosLinhaRelatorio;
Var iNormaVigente: Integer;
Begin
   iNormaVigente := ValidarNormaVigente();

   FDbLinhaRelatorio.IDNORMA.AsInteger := iNormaVigente;
   FDbLinhaRelatorio.IDNATUREZA.asInteger := CdsLinhaRelatorio.FieldByName('idNatureza').asInteger;
   FDbLinhaRelatorio.DESCRICAO.asString := CdsLinhaRelatorio.FieldByName('DescricaoLinha').asString;
   FDbLinhaRelatorio.COD_LINHA.asString := CdsLinhaRelatorio.FieldByName('COD_LINHA').asString;
  // Thiago Melo SOL 206751 ktn 1999210
   FDbLinhaRelatorio.idTipoDeCategoria.AsInteger := CdsLinhaRelatorio.FieldByName('IDTIPODECATEGORIA').AsInteger;
  // Thiago Melo SOL 206751 ktn 1999210

   FDbLinhaRelatorio.Insert;
End;

Function TCtrlLinhaRelatorio.InserirNormaVigente(): Boolean;
Var Msg: String;
   iIdTipo: Integer;
   oCds: TClientDataSet;
Begin
   iIdTipo := 0;
   Try
      StartTransaction;
      oCds := TClientDataSet.Create(Nil);
      oCds.Data := ListLinhaRelatorioVigente;
      // A correção do erro foi aqui.
      If iIdTipo = 0 Then
         iIdTipo := ValidarTipoRelatorio(NormaVigente.DescricaoTipo);
      Result := EncerraNormasAbertas(iIdTipo);
      If Result Then
         Begin
            iIdTipo := NormaVigente.IdTipo;
            fNormaVigente.DbNormaVigente.IDTIPO.asInteger := iIdTipo;
            fNormaVigente.DbNormaVigente.DESCRICAO.asString := NormaVigente.Descricao;
            fNormaVigente.DbNormaVigente.DATAINICIO.asDateTime := NormaVigente.DataInicio;
            fNormaVigente.DbNormaVigente.DATAFIM.asDateTime := NormaVigente.DataFim;//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
            fNormaVigente.DbNormaVigente.Insert;
//             Result := (NormaVigente.DbNormaVigente.IDNORMA.AsInteger > 0);
//            If Result Then
               Result := GravarLinhaRelatorioCds(NormaVigente.DbNormaVigente.IDNORMA.AsInteger, oCds);
         End;
      Msg := FDbLinhaRelatorio.MessageInfo;
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

Function TCtrlLinhaRelatorio.EncerraNormasAbertas(Const pIdTipo: Integer): Boolean;
Var sSql: String;
    cds : TCMClientDataSet;

Begin
  cds := TCMClientDataSet.Create(nil);
  cds.data := GetDataPacket('SELECT IDNORMA FROM NORMA_VIGENTE WHERE '+
  '(datafim = to_date(''30/12/1899'',''dd/mm/yyyy'') or datafim is null)' + #13#10 +//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
  '  and idTipo = ' + IntToStr(pIdTipo));


  pintIDNormaAntiga := cds.FieldByName('IDNORMA').AsInteger;

   sSql := 'Update Norma_Vigente' + #13#10 +
      'Set DataFim = To_Date(' + QuotedStr(DateToStr(NormaVigente.DataInicio - 1)) + ',''dd/mm/yyyy'')' + #13#10 +
      'where (datafim = to_date(''30/12/1899'',''dd/mm/yyyy'') or datafim is null)' + #13#10 +//Marcio Sanches Spinosa SOL: 126124/126125 Kintana: 656907/656908
      '  and idTipo = ' + IntToStr(pIdTipo);
   Result := ExecSql(sSql);
End;

Function TCtrlLinhaRelatorio.ValidarNormaVigente(): Integer;
Var iIdTipo: integer;
Begin
   If FCdsLinhaRelatorio.FieldByName('IdNorma').asInteger > 0 Then
      Result := FCdsLinhaRelatorio.FieldByName('IdNorma').asInteger
   Else
      Begin
         iIdTipo := ValidarTipoRelatorio(FCdsLinhaRelatorio.FieldByName('TipoRelatorio').asString);
         fNormaVigente.DbNormaVigente.IDTIPO.asInteger := iIdTipo;
         fNormaVigente.DbNormaVigente.DESCRICAO.asString := FCdsLinhaRelatorio.FieldByName('Norma').asString;
         fNormaVigente.DbNormaVigente.DATAINICIO.asDateTime := FCdsLinhaRelatorio.FieldByName('DataInicio').asDateTime;
         fNormaVigente.DbNormaVigente.Insert;
         Result := fNormaVigente.DbNormaVigente.IDNORMA.AsInteger;
      End;
End;

Function TCtrlLinhaRelatorio.ValidarTipoRelatorio(Const pDescricao: String): Integer;
Begin
   If FCdsLinhaRelatorio.FieldByName('IdTipo').asInteger > 0 Then
      Result := FCdsLinhaRelatorio.FieldByName('IdTipo').asInteger
   Else
      Begin
         Result := ExisteLinhaRelatorioByDescricao(pDescricao);
         If Result = 0 Then
            Begin
               fTipoRelatorio.DbTipoRelatorio.DESCRICAO.asString := pDescricao;
               fTipoRelatorio.DbTipoRelatorio.Insert;
               Result := fTipoRelatorio.DbTipoRelatorio.IDTIPO.AsInteger;
            End;
      End;
End;

Function TCtrlLinhaRelatorio.ExcluirDados(Const pCodLinha: String;
   Const pIdNorma: Integer; Const pIdCategoria: Integer): Boolean;
Var sSql: String;
Begin
   Result := True;
   Try
      StartTransaction;

      Result := ExcluirLinhasContabeis(pCodLinha, pIdNorma);

      If Result Then
         Begin
            sSql := 'Delete from Linha_relatorio where idNorma = ' + IntToStr(pIdNorma);
            sSql := sSql + ' and Cod_linha = ' + QuotedStr(pCodLinha);
            sSql := sSql + ' and idtipodecategoria =  ' + IntToStr(pIdCategoria);
            Result := ExecSql(sSql);
         End;
      If Not Result Then
         Rollback
      Else
         Commit;
   Except
      Rollback;
   End;
End;

Function TCtrlLinhaRelatorio.AlterarDados(Const pIdLinha: Integer; Const pIdCategoria: Integer): Boolean;
Var
  Msg, sSql: String;
Begin
  sSql := '';
  Try
    StartTransaction;
    sSql := 'Update Linha_Relatorio Set ';
    sSql := sSql + 'IdNatureza = ' + FCdsLinhaRelatorio.FieldByName('idNatureza').asString + ' , ';
    sSql := sSql + 'Descricao = ' + QuotedStr(FCdsLinhaRelatorio.FieldByName('DescricaoLinha').asString) + ' , ';
    sSql := sSql + 'COD_LINHA = ' + QuotedStr(FCdsLinhaRelatorio.FieldByName('COD_LINHA').asString) + ' , ' ;
    // Thiago Melo SOL 206751 ktn 1999210
    //  sSql := sSql + 'IDTIPODECATEGORIA = ' + QuotedStr(FCdsLinhaRelatorio.FieldByName('idcategoria').asString) + ' ' ;
    // Thiago Melo SOL 206751 ktn 1999210
    sSql := sSql + 'TIPOCONTABILIZACAO = ' + QuotedStr(FCdsLinhaRelatorio.FieldByName('TIPOCONTABILIZACAO').asString) + ', ' ;  // Edilaine - SOL 155850-15363 / KTN 2051763
    sSql := sSql + 'IDTIPODECATEGORIA = ' + QuotedStr(FCdsLinhaRelatorio.FieldByName('IDTIPODECATEGORIA').asString) + ' ' ;
    sSql := sSql + 'Where IdLinha = ' + IntToStr(pIdLinha) + ' and ' ;
    sSql := sSql + 'IDTIPODECATEGORIA = ' +  IntToStr(pIdCategoria);
    REsult := ExecSQL(sSql);
    Msg := FDbLinhaRelatorio.MessageInfo;
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


Function TCtrlLinhaRelatorio.ExcluirLinhasAssociadas(Const pCodLinha: String;
   Const pIdNorma: Integer;
   Const pIdAssociacao: Integer = 0): Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      Result := InserirLinhaContabil(pIdAssociacao);
      If Result Then
         Result := ExcluirLinhasContabeis(pCodLinha, pIdNorma, pIdAssociacao);
      Msg := FDbLinhaRelatorio.MessageInfo;
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

Function TCtrlLinhaRelatorio.InserirLinhaContabil(Const pIdAssociacao: integer): Boolean;
Var sPlano,
   sConta: String;
Begin
   Result := False;
   If cdsLinhaxConta.Locate('idAssociacao', pIdAssociacao, []) Then
      Begin
         sPlano := cdsLinhaxConta.FieldbyName('Plano').asString;
         sConta := cdsLinhaxConta.FieldByName('PlaConta').asString;
         If CdsContabilBackup.Locate('Plano;PlaConta', VarArrayOf([sPlano, sConta]), []) Then
            Begin
               CopiarRegistros(CdsContabilBackup, cdsContabil);
               cdsContabil.first;
               Result := True;
            End;
      End
End;

Procedure TCtrlLinhaRelatorio.CopiarRegistros(Const oCdsOrigem, oCdsDestino: TClientDataSet);
Var iCount: Integer;
    sNomeCampo : string;   // Edilaine - SOL 155850-15363 / KTN 2051763
Begin
   oCdsDestino.Insert;
   For iCount := 0 To oCdsOrigem.Fields.Count - 1 Do
      Begin
        // Edilaine - SOL 155850-15363 / KTN 2051763 - inicio
        sNomeCampo := oCdsOrigem.Fields[iCount].fieldname;
        oCdsDestino.FieldByName(sNomeCampo).Value := oCdsOrigem.FieldByName(sNomeCampo).Value
        //oCdsDestino.Fields[iCount].Value := oCdsOrigem.Fields[iCount].Value
        // Edilaine - SOL 155850-15363 / KTN 2051763 - fim
      End;                                                      
   oCdsDestino.Post;
End;

Function TCtrlLinhaRelatorio.ExcluirLinhasContabeis(Const pCodLinha: String;
   Const pIdNorma: Integer;
   Const pIdAssociacao: Integer = 0): Boolean;
Var sSql: String;
Begin
   sSql := 'Delete from LinhaxContaContabil' + #13#10 +
      'where idLinha in (Select IdLinha from Linha_Relatorio' + #13#10 +
      '                  where idNorma = ' + IntToStr(pIdNorma) + #13#10 +
      '                    and Cod_linha = ' + QuotedStr(pCodLinha) + ')';
   If pIdAssociacao <> 0 Then
      sSql := sSql + #13#10 + '  AND IdAssociacao = ' + IntToStr(pIdAssociacao);
   Result := ExecSql(sSql);
End;

Function TCtrlLinhaRelatorio.ExisteRelatorioImpresso(Const idNorma: Integer): Boolean;
Var qryAux: TCMClientDataSet;
   sSql: String;
Begin
   // PNOBRE
   qryAux := TCmClientDataSet.Create(Nil);
   sSql := 'SELECT IDTIPO FROM RELATORIO_DADOS_CADASTRAIS WHERE IDNORMA = ' + IntToStr(idNorma);
   qryAux.data := GetDataPacket(sSql);
   Result := Not qryAux.isEmpty;
   qryAux.Close;
   FreeAndNil(qryAux);
End;

Function TCtrlLinhaRelatorio.AlterarNormaVigente: Boolean;
Var Msg: String;
Begin
   Try
      StartTransaction;
      fNormaVigente.DbNormaVigente.IDNORMA.asInteger := NormaVigente.IdNorma;
      fNormaVigente.DbNormaVigente.IDTIPO.asInteger := NormaVigente.IdTipo;
      fNormaVigente.DbNormaVigente.DESCRICAO.asString := NormaVigente.Descricao;
      fNormaVigente.DbNormaVigente.DATAINICIO.asDateTime := NormaVigente.DataInicio;
      Result := fNormaVigente.DbNormaVigente.Update;
      Msg := FDbLinhaRelatorio.MessageInfo;
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

Function TCtrlLinhaRelatorio.ExisteLinhaRelatorioByDescricao(Const pDescricao: String): Integer;
Var oCds: TClientDataSet;
Begin
   oCds := TClientDataSet.Create(Nil);
   oCds.Data := GetDataPacket('Select IDTipo From Tipo_Relatorio Where Descricao = ' + quotedStr(pDescricao));
   result := oCds.FieldByName('IdTipo').asInteger;
   oCds.Close;
   FreeAndNil(oCds);
End;

function TCtrlLinhaRelatorio.InserirLinhasNovaNorma : boolean;
VAR CdsAux          : TCMClientDataSet;
    sSql            : string;
    oLinhaContabil  : TCtrlLinhaXContaContabil;
    sListLinha      : TStringList;
begin
    CdsAux          :=       TCMClientDataSet.Create(nil);
    oLinhaContabil  :=       TCtrlLinhaXContaContabil.Create;
    sListLinha      :=       Tstringlist.create;
    oLinhaContabil.InitializeAs(Padroes);


    sSql := 'SELECT * FROM linha_relatorio WHERE IDNORMA = ' + IntToStr(pintIDNormaAntiga);

    CdsAux.Data := GetDataPacket(sSql);
    CdsAux.First;
    CdsAux.First;

    while NOT CdsAux.Eof do
    begin
      FDbLinhaRelatorio.IDNORMA.asinteger := pintIDNormaNova ;
      FDbLinhaRelatorio.IDNATUREZA.AsInteger :=CdsAux.FieldByName('IDNATUREZA').asinteger;
      FDbLinhaRelatorio.DESCRICAO.AsString := CdsAux.FieldByName('DESCRICAO').AsString;
      FDbLinhaRelatorio.COD_LINHA.AsString := CdsAux.FieldByName('COD_LINHA').AsString;
      FDbLinhaRelatorio.Insert;

      sListLinha := oLinhaContabil.ProcurarLinhaxContaContabilnovaNorma(CdsAux.FieldByName('IDLINHA').AsInteger);

      if (sListLinha.Count > 0) then
         oLinhaContabil.GravarLinhasAssociadas(FDbLinhaRelatorio.IDLINHA.AsInteger, sListLinha);
      CdsAux.Next;

    end;


end;

function TCtrlLinhaRelatorio.ListaTipoPlano: OleVariant;
begin

  Result := GetDataPacket('SELECT * FROM  TIPOPLANOPREV_EFD ORDER BY DESCRICAO');

end;

End.

