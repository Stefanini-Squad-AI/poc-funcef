{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/04/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}

unit RCadPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uCtrlGlobalRH, TXRB, uModulo;

type
  TRptCadPessoal = class(TFrmCmReport)
    rpCadPessoal: TppReport;
    rpCadPessoalHdrBnd: TppHeaderBand;
    rpCadPessoalDBTxt1: TppDBText;
    rpCadPessoalLbl1: TppLabel;
    rpCadPessoalLbl4: TppLabel;
    rpCadPessoalLbl5: TppLabel;
    rpCadPessoalLbl6: TppLabel;
    rpCadPessoalLbl7: TppLabel;
    rpCadPessoalLine1: TppLine;
    rpCadPessoalLbl8: TppLabel;
    rpCadPessoalLbl2: TppLabel;
    rpCadPessoalSysVar1: TppSystemVariable;
    rpCadPessoalLbl3: TppLabel;
    rpCadPessoalSysVar2: TppSystemVariable;
    rpCadPessoalLbl9: TppLabel;
    rpCadPessoalLbl10: TppLabel;
    rpCadPessoalLbl11: TppLabel;
    rpCadPessoalLblDtNasc: TppLabel;
    rpCadPessoalDtlBnd: TppDetailBand;
    rpCadPessoalDBTxt2: TppDBText;
    rpCadPessoalDBTxt3: TppDBText;
    rpCadPessoalDbCargo: TppDBText;
    rpCadPessoalDBTxt5: TppDBText;
    rpCadPessoalDBTxt8: TppDBText;
    rpCadPessoalDBTxt9: TppDBText;
    rpCadPessoalDbDtNasc: TppDBText;
    rpCadPessoalDBTxt6: TppDBText;
    rpCadPessoalDBTxt7: TppDBText;
    rpCadPessoalFootBnd: TppFooterBand;
    rpCadPessoalSmryBnd: TppSummaryBand;
    rpCadPessoalGrp1: TppGroup;
    rpCadPessoalGrpHdrBnd: TppGroupHeaderBand;
    rpCadPessoalGrpFootBnd: TppGroupFooterBand;
    rpCadPessoalLbl13: TppLabel;
    rpCadPessoalDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppCadPessoal: TppBDEPipeline;
    ppCadPessoalppField1: TppField;
    ppCadPessoalppField2: TppField;
    ppCadPessoalppField3: TppField;
    ppCadPessoalppField4: TppField;
    ppCadPessoalppField5: TppField;
    ppCadPessoalppField6: TppField;
    ppCadPessoalppField7: TppField;
    ppCadPessoalppField8: TppField;
    ppCadPessoalppField9: TppField;
    ppCadPessoalppField10: TppField;
    dsCadPessoal: TwwDataSource;
    sqlCadPessoal: TCMSqlParams;
    CdsCadPessoal: TCMClientDataSet;
    rpCadPessoalLblDtDem: TppLabel;
    rpCadPessoalLblSit: TppLabel;
    ppDBText1: TppDBText;
    SITUACAO: TppField;
    rpCadPessoalLblNivel: TppLabel;
    rpCadPessoalDbNivel: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCadPessoalAfterOpen(DataSet: TDataSet);
    procedure CdsCadPessoalAfterScroll(DataSet: TDataSet);
    procedure rpCadPessoalHdrBndBeforePrint(Sender: TObject);
    procedure rpCadPessoalSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    bNivelIndiv: boolean;
  end;

var
  RptCadPessoal: TRptCadPessoal;

implementation

uses fAguarde, uCtrlFuncoesRH, dCds, uCtrlPadroes;

{$R *.DFM}

procedure TRptCadPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGNIVELINDIV');
  bNivelIndiv := dmCds.Cds.FieldByName('FLGNIVELINDIV').asInteger = 1;
end;

procedure TRptCadPessoal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGlobalRH);
end;

procedure TRptCadPessoal.CrmRptCMBeforePrint(Sender: TObject);
const
  ORDENACAO_FUNC: array[0..11] of string =
    ('UPPER(PF.NOME)',
     'F.MATRICULA',
     'F.IDCARGO, UPPER(PF.NOME)',
     'F.IDCARGO, F.MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA');

  ORDENACAO_CAND: array[0..3] of string =
    ('UPPER(PF.NOME)',
     'C.IDPESSOA',
     'C.IDCARGO, UPPER(PF.NOME)',
     'C.IDCARGO, C.IDPESSOA');
var
  sPefixo: string;
begin
  inherited;
  if (Modulo.IdContraCheque = FUNCEF) and (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
  begin
    rpCadPessoalDbNivel.Visible := true;
    rpCadPessoalLblNivel.Visible := true;
    rpCadPessoalDbCargo.Width := 181;
  end;

  if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
    sPefixo := 'F'
  else
    sPefixo := 'CD';

  with (sqlCadPessoal.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  RTRIM(PF.NOME) AS NOME,');

    if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
    begin
      Add('  F.MATRICULA, CC.NOME AS C_CUSTO, C.TITULO AS CARGO,');
      Add('  F.DATAADMISSAO, (''F'') AS TIPO_PESSOA, F.NIVELINDIV1,');
      Add('  DECODE(ST.TIPOSIT,''A'','' '',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'')) AS DATADESLIGAMENTO,');
      Add('  DECODE(ST.TIPOSIT,''A'',''Ativ'',''F'',''Afas'',''Desl'') AS SITUACAO,');
      if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 1) then
        Add('  F.SALARIOATUAL AS DATANASC,')
      else if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) then
        Add('  DECODE(F.IDFUNCAO,NULL,F.SALARIOATUAL,'+
          'DECODE(F.NIVELINDIV2,1,FX.STEP1,2,FX.STEP2,3,FX.STEP3,4,FX.STEP4,'+
//        '5,FX.STEP5,6,FX.STEP6,7,FX.STEP7,8,FX.STEP8,FX.STEP9)) AS DATANASC,');
          '5,FX.STEP5,6,FX.STEP6,7,FX.STEP7,8,FX.STEP8,9,FX.STEP9,10,FX.STEP10,11,FX.STEP11,12,FX.STEP12,'+ //Douglas.Siqueira SOL 171426 Kintana 1537613
          '13,FX.STEP13,14,FX.STEP14,15,FX.STEP15,16,FX.STEP16,17,FX.STEP17,18,FX.STEP18,19,FX.STEP19,FX.STEP20)) AS DATANASC,');//Douglas.Siqueira SOL 171426 Kintana 1537613
    end
    else
    begin
      Add('  TO_CHAR(CD.IDPESSOA) AS MATRICULA, ('''') AS C_CUSTO, C.TITULO AS CARGO,');
      Add('  CD.DAT_ADMIS AS DATAADMISSAO, (''C'') AS TIPO_PESSOA, 0 AS NIVELINDIV1,');
      Add('  ('''') AS DATADESLIGAMENTO, ('' '') AS SITUACAO,');
      if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger >= 1) then
        Add('  CD.SALARIO AS DATANASC,');
    end;

    if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 0) then
      Add('  PEFIS.DATANASC,');

    Add('  DECODE(PEFIS.SEXO,''F'',''Fem.'',''Masc'') AS SEXO,');

    if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 0) then
    begin
      Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
      Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''O'',''Outro'') AS ESTCIVIL');
    end
    else
      Add('    GRINSTR.DESCRICAO AS ESTCIVIL');

    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, ' +
      FU.IFF((CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) and
        (CmpRptCM.ParamByName('PorFuncionario').asBoolean), ' FAIXASAL FX, PARAMRH PR,', '') +
      FU.IFF(CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 0, '', ' GRINSTR, ') +
      FU.IFF(CmpRptCM.ParamByName('PorFuncionario').asBoolean,'FUNCIONARIO F, CENTCUST CC, SITFUNC ST',
      'CANDIDAT CD')+ ', CARGO C');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    if (Trim(CmpRptCM.ParamByName('ListaIdFunc').asString) <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (PF.IDPESSOA     IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (PF.IDPESSOA      = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
      Add('  (PF.IDPESSOA      = -1) AND');

    Add('  ('+sPefixo+'.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (PF.IDPESSOA      = PEFIS.IDPESSOA) AND');

    if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 1) then
      Add('  (PEFIS.IDGRINSTR      = GRINSTR.IDGRINSTR(+)) AND');

    if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
    begin
      Add('  (F.IDSITFUNC      = ST.IDSITFUNC) AND');
      Add('  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND');
      Add('  (F.IDEMPRESA      = CC.IDEMPRESA(+)) AND');

      if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) then
        if (bNivelIndiv) then
        Add('  (F.IDFAIXAFUNCAO  = FX.IDFAIXASALARIAL(+)) AND')
      else
        Add('  (C.IDFAIXASALARIAL  = FX.IDFAIXASALARIAL(+)) AND');

      if (CmpRptCM.ParamByName('BuscarCargoAlternativo').asBoolean) then
        Add(' DECODE('+sPefixo+'.IDFUNCAO,NULL,'+sPefixo+'.IDCARGO,'+sPefixo+
          '.IDFUNCAO) = C.IDCARGO(+) ')
      else
        Add(' '+sPefixo+'.IDCARGO     = C.IDCARGO(+) ');
    end
    else
      Add('  ('+sPefixo+'.IDCARGO        = C.IDCARGO(+))');

    if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
      Add('ORDER BY ' + ORDENACAO_FUNC[CmpRptCM.ParamByName('Ordenacao').asInteger])
    else
      Add('ORDER BY ' + ORDENACAO_CAND[CmpRptCM.ParamByName('Ordenacao').asInteger]);

    SaveToFile('c:\qry.txt');
  end;
  sqlCadPessoal.Open;

  if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 0) then
  begin
    rpCadPessoalLblDtNasc.Caption := 'Data Nasc.';
    rpCadPessoalDbDtNasc.DisplayFormat := '';
  end
  else
  begin
    rpCadPessoalLblDtNasc.Caption := '  Salário';
    rpCadPessoalDbDtNasc.DisplayFormat := '###,##0.00';
  end;

  if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 0) then
    rpCadPessoalLbl11.Caption := 'Estado Civil'
  else
    rpCadPessoalLbl11.Caption := 'Escolaridade';
end;

procedure TRptCadPessoal.CdsCadPessoalAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCadPessoal.CdsCadPessoalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCadPessoal.rpCadPessoalHdrBndBeforePrint(Sender: TObject);
begin
  rpCadPessoalLbl9.Visible := (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F') and
    ((CmpRptCM.ParamByName('SelDemitidos').asBoolean) or
     (CmpRptCM.ParamByName('SelAfastados').asBoolean));
  rpCadPessoalDBTxt7.Visible := rpCadPessoalLbl9.Visible;
  rpCadPessoalLblDtDem.Visible := rpCadPessoalLbl9.Visible;
  rpCadPessoalLbl7.Visible := (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F');
  rpCadPessoalLblSit.Visible := (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F');

  if (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F') then
    rpCadPessoalLbl8.Caption := 'Data Adm.'
  else
    rpCadPessoalLbl8.Caption := 'Adm. Prev.';
end;

procedure TRptCadPessoal.rpCadPessoalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
