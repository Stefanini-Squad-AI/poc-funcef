//Marcus Oliveira 31/01/2007 24363 Remoção do owner CM.
Unit rEmisEtiq;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppCache, ppClass, ppProd, ppReport, Db, DBTables,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCtrlParamIntegra,
  uCmRptManager, TXComp, CmParamReport, DBClient, uCMClientDataSet,
  uCmSqlParams, StdCtrls, TXRB;

Type
  TRptEmisEtiq = Class(TFrmCmReport)
    PpEtiq: TppBDEPipeline;
    DsEtiq: TwwDataSource;
    RptEtiq: TppReport;
    RptEtiqColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand16: TppDetailBand;
    RptEtiqColumnFooterBand1: TppColumnFooterBand;
    SqlEtiq: TCMSqlParams;
    CdsEtiq: TCMClientDataSet;
    CdsReports: TCMClientDataSet;
    SqlReports: TCMSqlParams;
    CdsModelos: TCMClientDataSet;
    SqlModelos: TCMSqlParams;
    MemReports: TMemo;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptEmisEtiq: TRptEmisEtiq;

Implementation

Uses uEtiquetaCm, uModeloRelatCM;

{$R *.DFM}

Procedure TRptEmisEtiq.CrmRptCMBeforePrint(Sender: TObject);
Var
  CPForCliForCliRegId,
    CmbModeloEtiqLookupValue,
    EdFaixaIniText,
    EdFaixaFimText,
    DtDataLanctoInicialText,
    DtDataLanctoFinalText,
    CmbCobrancaLookupValue,
    CdsTipoDocCODTIPDOC,
    RbAtencaoItemIndex,
    EdOutrostext,
    RbEnderecoItemIndex,
    EdDiaAtrasoText,
    EdLimiteAtrasoText,
    RgOrdemItemIndex,
    sLoteSelecionados,
    RbAtencaoItems,
    SistemaTempDir: String;

  CkbImprimeChecked,
    chkDistinctChecked,
    CkbMatricialChecked: Boolean;

  dInicio, dLimite, sAtencao: String;
  iAtraso, iFinal: Integer;
Begin
  Inherited;

  CPForCliForCliRegId := CmpRptCM.ParamValues[0].AsString;
  CmbModeloEtiqLookupValue := CmpRptCM.ParamValues[1].AsString;
  CkbMatricialChecked := CmpRptCM.ParamValues[2].AsBoolean;
  EdFaixaIniText := CmpRptCM.ParamValues[3].AsString;
  EdFaixaFimText := CmpRptCM.ParamValues[4].AsString;
  DtDataLanctoInicialText := CmpRptCM.ParamValues[5].AsString;
  DtDataLanctoFinalText := CmpRptCM.ParamValues[6].AsString;
  CmbCobrancaLookupValue := CmpRptCM.ParamValues[7].AsString;
  CkbImprimeChecked := CmpRptCM.ParamValues[8].AsBoolean;
  chkDistinctChecked := CmpRptCM.ParamValues[9].AsBoolean;
  CdsTipoDocCODTIPDOC := CmpRptCM.ParamValues[10].AsString;
  RbAtencaoItemIndex := CmpRptCM.ParamValues[11].AsString;
  EdOutrostext := CmpRptCM.ParamValues[12].AsString;
  RbEnderecoItemIndex := CmpRptCM.ParamValues[13].AsString;
  EdDiaAtrasoText := CmpRptCM.ParamValues[14].AsString;
  EdLimiteAtrasoText := CmpRptCM.ParamValues[15].AsString;
  RgOrdemItemIndex := CmpRptCM.ParamValues[16].AsString;
  sLoteSelecionados := CmpRptCM.ParamValues[17].AsString;
  RbAtencaoItems := CmpRptCM.ParamValues[18].AsString;
  SistemaTempDir := CmpRptCM.ParamValues[19].AsString;

  With SqlEtiq Do
  Begin
    Close;
    SQL.Clear;
    If chkDistinctChecked Then
      SQL.Append('SELECT DISTINCT')
    Else
      SQL.Append('SELECT');

    SQL.Append('P.IDPESSOA, P.RAZAOSOCIAL AS NOME, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, ');
    SQL.Append('C.NOME AS CIDADE, ES.CODESTADO, E.CEP, D.DATAEMISSAO, '' '' AS CONTATO'); // BY ALEX 25/06

    {Se marcar o AGRUPAR FORNECEDORES, NÃO seleciona o Número do Documento}
    If Not chkDistinctChecked Then
      SQL.Append(', D.NODOCUMENTO');

    SQL.Append('FROM ');
    SQL.Append('DOCUMENTO D, LANCTODOCUM L, PESSOA P, ENDPESS E, CIDADES C, ESTADO ES ');
    If ParamIntegra.RecPag = 'P' Then
      SQL.Append(', LOTEXDOCUM LD ');
    SQL.Append('WHERE ');
    SQL.Append('(D.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND (D.CODDOCUMENTO = L.CODDOCUMENTO) ');
    SQL.Append('AND (D.RECPAG = ''' + ParamIntegra.RecPag + ''') ');
    If CPForCliForCliRegId <> '' Then
      SQL.Append(' AND (D.IDFORCLI = ' + CPForCliForCliRegId + ') ');
    If (DtDataLanctoInicialText <> '') Then
      SQL.Append(' AND (L.DATALANCTO >= TO_DATE(''' + DtDataLanctoInicialText + ''',''DD/MM/YYYY'')) ');
    If (DtDataLanctoFinalText <> '') Then
      SQL.Append(' AND (L.DATALANCTO <= TO_DATE(''' + DtDataLanctoFinalText + ''',''DD/MM/YYYY'')) ');
    If ((EdFaixaIniText <> '') Or (EdFaixaFimText <> '')) Then
      SQL.Append(' AND ( D.NODOCUMENTO BETWEEN  ' + EdFaixaIniText + ' AND  ' + EdFaixaFimText + ' )');
    If (Trim(CmbCobrancaLookupValue) <> '') Then
      SQL.Append(' AND (D.CODPORTFORMA =  ' + CmbCobrancaLookupValue + ') ');
    If CkbImprimeChecked Then
      SQL.Append(' AND (D.EMISBLOQ = ''N'') ');

    If Trim(CdsTipoDocCODTIPDOC) <> '' Then
      SQL.Append(' AND (D.CODTIPDOC = ' + CdsTipoDocCODTIPDOC + ') ');

    If ((EdDiaAtrasoText <> '') Or (EdLimiteAtrasoText <> '')) Then
    Begin
      iAtraso := StrToInt(EdDiaAtrasoText);
      iFinal := StrToInt(EdLimiteAtrasoText);
      dInicio := DateToStr(Now - iAtraso);
      dLimite := DateToStr(Now - iFinal);
      SQL.Append('AND (D.DATAPROGRAMADA BETWEEN TO_DATE(''' + dLimite + ''',''DD/MM/YYYY'')');
      SQL.Append('AND TO_DATE(''' + dInicio + ''',''DD/MM/YYYY''))');
    End;

    If sLoteSelecionados <> '' Then
    Begin
      sLoteSelecionados := '(' + Copy(sLoteSelecionados, 1, Length(sLoteSelecionados) - 1) + ')';
      If ParamIntegra.recpag = 'P' Then
        SQL.Append(' AND (LD.NUMLOTE IN ' + sLoteSelecionados + ') ')
      Else
        SQL.Append(' AND (D.CONTROLEREMESSA IN ' + sLoteSelecionados + ') ');
    End;
    SQL.Append(' AND (D.IDFORCLI = P.IDPESSOA)      ');
    SQL.Append(' AND (P.IDPESSOA = E.IDPESSOA)      ');
    SQL.Append(' AND (E.IDCIDADES = C.IDCIDADES(+)) ');
    SQL.Append(' AND (ES.IDESTADO(+) = C.IDESTADO)  ');
    Case StrToInt(RbEnderecoItemIndex) Of
      0: SQL.Append(' AND (E.IDENDERECO(+) = P.IDENDCOMERCIAL) ');
      1: SQL.Append(' AND (E.IDENDERECO(+) = P.IDENDCOBRANCA) ');
    End;
    If ParamIntegra.RecPag = 'P' Then
      SQL.Append(' AND (D.CODDOCUMENTO = LD.coddocumento)');
    SQL.Append(' AND (L.OPERACAO = D.OPERACAO)   ');
    Case StrToInt(RgOrdemItemIndex) Of
      0: SQL.Append('ORDER BY D.DATAEMISSAO, NOME');
      1: SQL.Append('ORDER BY NOME');
      2: SQL.Append('ORDER BY NODOCUMENTO');
    End;
    Open;
  End;

  If Not CdsEtiq.IsEmpty Then
  Begin
    Case StrToInt(RbAtencaoItemIndex) Of
      0: sAtencao := '';
      1: sAtencao := 'A/C ' + RbAtencaoItems;
      2: sAtencao := 'A/C ' + EdOutrosText;
    End;

    If CkbMatricialChecked Then
    Begin
      EtiquetaCm := TEtiquetaCm.Create;
      EtiquetaCm.ModeloEtiq := StrToInt(CmbModeloEtiqLookupValue);
      EtiquetaCm.Imprime(CdsEtiq, sAtencao);
      EtiquetaCm.Free;
    End
    Else
    Begin
      SqlModelos.Prepare;
      SqlModelos.ParamByName('IDETIQUETA').AsInteger := StrToInt(CmpRptCM.ParamValues[1].AsString);
      SqlModelos.Open;
      SqlReports.Prepare;
      SqlReports.Params[0].AsInteger := CdsModelos.FieldByName('IDREPORTS').AsInteger;
      SqlReports.Params[1].AsInteger := CdsModelos.FieldByName('ORIGEMCM').AsInteger;
      SqlReports.Open;

      MemReports.Lines.Clear;
      MemReports.Lines.Text := CdsReports.FieldByName('TEMPLATE').AsString;

      {Substitui o Pipeline do Template pelo Pipeline do Report}
      ModeloRelatCM.SetaDataPipeline('rEmisEtiq', 'ppEtiq', 'FrmConfigEtiq', 'ppConsulta', MemReports);

      MemReports.Lines.SaveToFile(SistemaTempDir + ArqCmEtiqueta);

      RptEtiq.Template.FileName := SistemaTempDir + ArqCmEtiqueta;
      RptEtiq.Template.LoadFromFile;
    End;
  End;
End;

End.

