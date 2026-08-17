unit RDossieCand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppMemo, ppBands, ppReport, ppStrtch, ppSubRpt,
  ppCtrls, ppClass, ppPrnabl, ppCache, ppProd, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlPadroes, uCtrlListTerceirosRH,
  uCtrlGlobalRH, uCtrlRegTrein, uCtrlRegExp, uCtrlRegAval, uCtrlRegOcorr,
  DBTables, Wwquery;

type
  TRptDossieCand = class(TFrmCmReport)
    dsDossieCand: TwwDataSource;
    ppDossieCand: TppBDEPipeline;
    rpDossieCand: TppReport;
    rpDossieCandHdrBnd: TppHeaderBand;
    rpDossieCandLbl1: TppLabel;
    rpDossieCandDBTxt1: TppDBText;
    ppLine1: TppLine;
    rpDossieCandDtlBnd: TppDetailBand;
    rpDossieCandLbl7: TppLabel;
    rpDossieCandLbl8: TppLabel;
    rpDossieCandLbl9: TppLabel;
    rpDossieCandLbl10: TppLabel;
    rpDossieCandLbl11: TppLabel;
    rpDossieCandLbl12: TppLabel;
    rpDossieCandDBTxt7: TppDBText;
    rpDossieCandDBTxt8: TppDBText;
    rpDossieCandDBTxt11: TppDBText;
    rpDossieCandDBTxt9: TppDBText;
    rpDossieCandDBTxt12: TppDBText;
    rpDossieCandDBTxt10: TppDBText;
    rpDossieCandDBTxt17: TppDBText;
    rpDossieCandDBTxt18: TppDBText;
    rpDossieCandDBTxt19: TppDBText;
    rpDossieCandDBTxt20: TppDBText;
    rpDossieCandDBTxt21: TppDBText;
    rpDossieCandDBTxt14: TppDBText;
    rpDossieCandDBTxt15: TppDBText;
    rpDossieCandDBTxt16: TppDBText;
    rpDossieCandDBTxt13: TppDBText;
    rpDossieCandSmryBnd: TppSummaryBand;
    ppGroup1: TppGroup;
    rpDossieCandGrpHdrBnd: TppGroupHeaderBand;
    rpDossieCandLbl2: TppLabel;
    rpDossieCandDBTxt2: TppDBText;
    rpDossieCandLbl3: TppLabel;
    rpDossieCandLbl4: TppLabel;
    rpDossieCandLbl5: TppLabel;
    rpDossieCandLbl6: TppLabel;
    rpDossieCandDBTxt4: TppDBText;
    rpDossieCandDBTxt5: TppDBText;
    rpDossieCandDBTxt6: TppDBText;
    rpDossieCandDBImage1: TppDBImage;
    rpDossieCandLine2: TppLine;
    rpDossieCandDBTxt3: TppDBText;
    rpDossieCandGrpFootBnd: TppGroupFooterBand;
    rpDossieCandReport1: TppSubReport;
    DossieCandCR1: TppChildReport;
    rpDossieCandSubReport1TitBnd: TppTitleBand;
    rpDossieCandSubReport1Lbl1: TppLabel;
    rpDossieCandSubReport1Lbl2: TppLabel;
    rpDossieCandSubReport1Lbl3: TppLabel;
    rpDossieCandSubReport1Lbl4: TppLabel;
    rpDossieCandSubReport1Lbl5: TppLabel;
    rpDossieCandSubReport1DtlBnd: TppDetailBand;
    rpDossieCandSubReport1DBTxt1: TppDBText;
    rpDossieCandSubReport1DBTxt2: TppDBText;
    rpDossieCandSubReport1DBTxt3: TppDBText;
    rpDossieCandSubReport1DBTxt4: TppDBText;
    rpDossieCandSubReport1DBTxt5: TppDBText;
    rpDossieCandReport2: TppSubReport;
    DossieCandCR2: TppChildReport;
    rpDossieCandSubReport2TitBnd: TppTitleBand;
    rpDossieCandSubReport2Lbl1: TppLabel;
    rpDossieCandSubReport2Lbl2: TppLabel;
    rpDossieCandSubReport2Lbl3: TppLabel;
    rpDossieCandSubReport2Lbl4: TppLabel;
    rpDossieCandSubReport2Lbl5: TppLabel;
    rpDossieCandSubReport2DtlBnd: TppDetailBand;
    rpDossieCandSubReport2DBTxt1: TppDBText;
    rpDossieCandSubReportDBTxt2: TppDBText;
    rpDossieCandSubReport2DBTxt3: TppDBText;
    rpDossieCandSubReport2DBTxt4: TppDBText;
    rpDossieCandSubReport2DBTxt5: TppDBText;
    rpDossieCandSubReport2DBTxt6: TppDBText;
    rpDossieCandReport3: TppSubReport;
    DossieCandCR3: TppChildReport;
    rpDossieCandSubReport3TitBnd: TppTitleBand;
    rpDossieCandSubReport3Lbl1: TppLabel;
    rpDossieCandSubReport3Lbl2: TppLabel;
    rpDossieCandSubReport3Lbl3: TppLabel;
    rpDossieCandSubReport3Lbl4: TppLabel;
    rpDossieCandSubReport3Lbl5: TppLabel;
    rpDossieCandSubReport3Lbl6: TppLabel;
    rpDossieCandSubReport3Lbl7: TppLabel;
    rpDossieCandSubReport3DtlBnd: TppDetailBand;
    rpDossieCandSubReport3DBTxt1: TppDBText;
    rpDossieCandSubReport3DBTxt2: TppDBText;
    rpDossieCandSubReport3DBTxt3: TppDBText;
    rpDossieCandSubReport3DBTxt4: TppDBText;
    rpDossieCandSubReport3LblAVALTEOR: TppLabel;
    rpDossieCandSubReport3LblAVALPRAT: TppLabel;
    rpDossieCandSubReport3LblRESULT: TppLabel;
    rpDossieCandSubReport3DBMemo1: TppDBMemo;
    rpDossieCandReport4: TppSubReport;
    DossieCandCR4: TppChildReport;
    rpDossieCandSubReport4TitBnd: TppTitleBand;
    rpDossieCandSubReport4Lbl1: TppLabel;
    rpDossieCandSubReport4Lbl2: TppLabel;
    rpDossieCandSubReport4Lbl3: TppLabel;
    rpDossieCandSubReport4DtlBnd: TppDetailBand;
    rpDossieCandSubReportDBText1: TppDBText;
    rpDossieCandSubReportDBText2: TppDBText;
    rpDossieCandSubReportDBText3: TppDBText;
    rpDossieCandReport5: TppSubReport;
    DossieCandCR5: TppChildReport;
    rpDossieCandSubReport5TitBnd: TppTitleBand;
    rpDossieCandSubReport5Lbl1: TppLabel;
    rpDossieCandSubReport5Lbl2: TppLabel;
    rpDossieCandSubReport5Lbl3: TppLabel;
    rpDossieCandSubReport5Lbl4: TppLabel;
    rpDossieCandSubReport5DtlBnd: TppDetailBand;
    rpDossieCandSubReport5DBTxt1: TppDBText;
    rpDossieCandSubReport5DBTxt2: TppDBText;
    rpDossieCandSubReport5DBTxt3: TppDBText;
    rpDossieCandSubReport5DBMemo1: TppDBMemo;
    rpDossieCandSubReport5DBTxt4: TppDBText;
    rpDossieCandReport6: TppSubReport;
    DossieCandCR6: TppChildReport;
    rpDossieCandSubReport6TitBnd: TppTitleBand;
    rpDossieCandSubReport6Lbl1: TppLabel;
    rpDossieCandSubReport6Lbl2: TppLabel;
    rpDossieCandSubReport6Lbl3: TppLabel;
    rpDossieCandSubReport6Lbl4: TppLabel;
    rpDossieCandSubReport6DtlBnd: TppDetailBand;
    rpDossieCandSubReport6DBTxt1: TppDBText;
    rpDossieCandSubReport6DBTxt2: TppDBText;
    rpDossieCandSubReport6DBTxt3: TppDBText;
    rpDossieCandSubReport6DBMemo1: TppDBMemo;
    rpDossieCandSubReport6DBTxt4: TppDBText;
    CdsIMG: TCMClientDataSet;
    ppIMG: TppBDEPipeline;
    dsIMG: TwwDataSource;
    dsDossieCand1: TwwDataSource;
    ppDossieCand1: TppBDEPipeline;
    dsDossieCand2: TwwDataSource;
    ppDossieCand2: TppBDEPipeline;
    dsDossieCand3: TwwDataSource;
    ppDossieCand3: TppBDEPipeline;
    dsDossieCand4: TwwDataSource;
    ppDossieCand4: TppBDEPipeline;
    dsDossieCand5: TwwDataSource;
    ppDossieCand5: TppBDEPipeline;
    dsDossieCand6: TwwDataSource;
    ppDossieCand6: TppBDEPipeline;
    qryDossieCand1: TwwQuery;
    qryDossieCand2: TwwQuery;
    qryDossieCand3: TwwQuery;
    qryDossieCand4: TwwQuery;
    qryDossieCand5: TwwQuery;
    qryDossieCand6: TwwQuery;
    qryDossieCand: TwwQuery;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsDossieCandAfterScroll(DataSet: TDataSet);
    procedure rpDossieCandSubReport1DBTxt1Print(Sender: TObject);
    procedure rpDossieCandSubReport3DtlBndBeforePrint(Sender: TObject);
    procedure rpDossieCandSubReport5DtlBndBeforePrint(Sender: TObject);
    procedure rpDossieCandSubReport6DtlBndBeforePrint(Sender: TObject);
    procedure rpDossieCandSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlRegTrein: TCtrlRegTrein;
    CtrlRegExp: TCtrlRegExp;
    CtrlRegAval: TCtrlRegAval;
    CtrlRegOcorr: TCtrlRegOcorr;

    procedure SelDetalhes;
  end;

var
  RptDossieCand: TRptDossieCand;

implementation

uses uSistema, uFuncoesUteisRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptDossieCand.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlRegTrein := TCtrlRegTrein.Create(false, false, false, false, 0, 0, '',
    CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlRegExp := TCtrlRegExp.Create;
  CtrlRegExp.InitializeAs(Padroes);

  CtrlRegAval := TCtrlRegAval.Create;
  CtrlRegAval.InitializeAs(Padroes);

  CtrlRegOcorr := TCtrlRegOcorr.Create;
  CtrlRegOcorr.InitializeAs(Padroes);
end;

procedure TRptDossieCand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlRegExp);
  FreeAndNil(CtrlRegAval);
  FreeAndNil(CtrlRegOcorr);
  inherited;
end;

procedure TRptDossieCand.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (qryDossieCand.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados da Empresa
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    // Dados do Candidato
    Add('  RTRIM(PF.NOME) AS NOME,');
    Add('  PF.IDIMAGEM, PF.IDPESSOA,');
    Add('  PEFIS.DATANASC,');
    Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
    Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  DECODE(CA.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Efetivo Especial'',');
    Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
    Add('    ''P'',''Proprietário'', ''A'',''Autônomo'', ''Indefinido'') AS VINCULO,');
    Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
    Add('  E.CODESTADO, E.COMPLEMENTO, C.TITULO AS CARGO,');
    Add('  PR.DESCRICAO AS PROFISSAO, NVL(CA.SALARIO,0) AS SALARIOPRET,');
    Add('  DECODE(CA.TIPOPAGAMENTO, NULL,'''',');
    Add('    ''('' || DECODE(CA.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
    Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
    Add('  GR.DESCRICAO AS GRINSTR,');
    Add('  DECODE(RTRIM(TELEFONE.DDI),NULL,'''',''(''||RTRIM(TELEFONE.DDI)||'')'') AS DDI,');
    Add('  DECODE(RTRIM(TELEFONE.DDD),NULL,'''',''(''||RTRIM(TELEFONE.DDD)||'')'') AS DDD,');
    Add('  RTRIM(TELEFONE.NUMERO) AS TELEFONE');
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, CANDIDAT CA,');
    Add('  CIDADES CI, CARGO C, PROFISS PR, GRINSTR GR,');
    // -------------------------------------------------------------------- //
    // Telefone do Funcionário
    Add('  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMERO');
    Add('   FROM');
    Add('     TELENDPESS TE,');
    Add('     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO');
    Add('      FROM     TELENDPESS');
    Add('      GROUP BY IDENDERECO) END');
    Add('   WHERE');
    Add('     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PF.IDPESSOA         = ' +CmpRptCM.ParamByName('IdCandidato').asString+ ') AND');
    Add('  (PF.IDPESSOA         = CA.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (CA.IDCARGO          = C.IDCARGO(+)) AND');
    Add('  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND');
    Add('  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND');
    Add('  (PF.IDPESSOA         = E.IDPESSOA(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES         = CI.IDCIDADES(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))');
    Add('ORDER BY NOME');
    SaveToFile('c:\qry.txt');
  end;
  frmAguarde.Mostra('Dossiê do Candidato');
  frmAguarde.Pos := 0;

  qryDossieCand.Open;
  frmAguarde.Max := qryDossieCand.RecordCount;
  frmAguarde.Min := 0;
  SelDetalhes;
end;

procedure TRptDossieCand.CdsDossieCandAfterScroll(DataSet: TDataSet);
begin
  CdsIMG.Data := CtrlListTerceirosRH.ListImagem(qryDossieCand.FieldByName('IDIMAGEM').asFloat);
  SelDetalhes;
end;

procedure TRptDossieCand.rpDossieCandSubReport1DBTxt1Print(Sender: TObject);
begin
  if (Trim(qryDossieCand1.FieldByName('MASCARA').asString) <> '') then
    rpDossieCandSubReport1DBTxt2.DisplayFormat := qryDossieCand1.FieldByName('MASCARA').asString + ';0'
  else
    rpDossieCandSubReport1DBTxt2.DisplayFormat := '';
end;

procedure TRptDossieCand.rpDossieCandSubReport3DtlBndBeforePrint(Sender: TObject);
begin
  rpDossieCandSubReport3LblAVALTEOR.Caption := 'N/A';
  rpDossieCandSubReport3LblAVALPRAT.Caption := 'N/A';
  rpDossieCandSubReport3LblRESULT.Caption   := 'N/A';

  with (qryDossieCand3) do
  begin
    if (FieldByName('FLGAVALTEOR').Value = 1) then
      rpDossieCandSubReport3LblAVALTEOR.Caption := FieldByName('AVALTEOR').asString;

    if (FieldByName('FLGAVALPRAT').Value = 1) then
      rpDossieCandSubReport3LblAVALPRAT.Caption := FieldByName('AVALPRAT').asString;

    if ((FieldByName('TEMAVAL').Value = 1) and (FieldByName('FLGAVALTEOR').Value = 1) or
        (FieldByName('TEMAVPR').Value = 1) and (FieldByName('FLGAVALPRAT').Value = 1)) then
    begin
      if ((FieldByName('TEMAVAL').Value = 1) and (FieldByName('FLGAVALTEOR').Value = 1) and
          (FieldByName('AVALIACAO').Value > FieldByName('AVALTEOR').Value)) or
         ((FieldByName('TEMAVPR').Value = 1) and (FieldByName('FLGAVALPRAT').Value = 1) and
          (FieldByName('AVALPRAT').Value > FieldByName('AVALPRAT').Value)) then
        rpDossieCandSubReport3LblRESULT.Caption := 'Reprovad'
      else
        rpDossieCandSubReport3LblRESULT.Caption := 'Aprovad';

      if (qryDossieCand.FieldByName('SEXO').Value = 'Masculino') then
        rpDossieCandSubReport3LblRESULT.Caption := rpDossieCandSubReport3LblRESULT.Caption + 'o'
      else
        rpDossieCandSubReport3LblRESULT.Caption := rpDossieCandSubReport3LblRESULT.Caption + 'a';
    end;

    if (CmpRptCM.ParamByName('IdCandidato').asBoolean) and
       (FieldByName('OBSERVACAO').Value <> '') then
    begin
      rpDossieCandSubReport3DBMemo1.Visible := true;
      rpDossieCandSubReport3DBMemo1.Top := 21;
      rpDossieCandSubReport3DtlBnd.Height := 77;
    end
    else
    begin
      rpDossieCandSubReport3DBMemo1.Visible := false;
      rpDossieCandSubReport3DtlBnd.Height := 20;
    end
  end;
end;

procedure TRptDossieCand.rpDossieCandSubReport5DtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('IdCandidato').asBoolean) and
     (qryDossieCand5.FieldByName('COMENT').Value <> '') then
  begin
    rpDossieCandSubReport5DBMemo1.Visible := true;
    rpDossieCandSubReport5DBMemo1.Top := 21;
    rpDossieCandSubReport5DtlBnd.Height := 77;
  end
  else
  begin
    rpDossieCandSubReport5DBMemo1.Visible := false;
    rpDossieCandSubReport5DtlBnd.Height := 20;
  end
end;

procedure TRptDossieCand.rpDossieCandSubReport6DtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('IdCandidato').asBoolean) and
     (qryDossieCand6.FieldByName('OBSERVACAO').Value <> '') then
  begin
    rpDossieCandSubReport6DBMemo1.Visible := true;
    rpDossieCandSubReport6DBMemo1.Top := 21;
    rpDossieCandSubReport6DtlBnd.Height := 77;
  end
  else
  begin
    rpDossieCandSubReport6DBMemo1.Visible := false;
    rpDossieCandSubReport6DtlBnd.Height := 20;
  end;
end;

procedure TRptDossieCand.rpDossieCandSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptDossieCand.SelDetalhes;
begin
  {qryDossieCand1.Data := CtrlListTerceirosRH.ListDocPessoa(
    qryDossieCand.FieldByName('IDPESSOA').asFloat);
  qryDossieCand2.Data := CtrlGlobalRH.ListUltimosEmpregosPessoa(
    qryDossieCand.FieldByName('IDPESSOA').asFloat);
  qryDossieCand3.Data := CtrlRegTrein.ListHistoricoTreinamentoPorPessoa(
    qryDossieCand.FieldByName('IDPESSOA').asFloat,
    '  H.*, C.DESCRICAO, C.TEMAVAL, C.TEMAVPR, C.AVALIACAO, C.AVALPRAT, C.OBSERVACAO,'+CR_LF+
    '  NVL(DATREINI, DATPLINI) AS DATAREF');
  qryDossieCand4.Data := CtrlRegExp.ListHstExperSimples(
    qryDossieCand.FieldByName('IDPESSOA').asFloat);
  qryDossieCand5.Data := CtrlRegAval.ListHistorico_e_Tipo(
    qryDossieCand.FieldByName('IDPESSOA').asFloat);
  qryDossieCand6.Data := CtrlRegOcorr.ListHistorico(
    qryDossieCand.FieldByName('IDPESSOA').asFloat);}
end;

end.
