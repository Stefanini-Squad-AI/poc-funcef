{-------------------------------------------------------------------------------
-------------------------  REGISTRO DE ALTERAÇÕES ------------------------------
--------------------------------------------------------------------------------

 Responsável : Everson Cunha
 Data        : 26/08/2020
 SIG         : 101852
 Descricao   : Disponibilizar a visualização do campo flgadiantapagtoferias
--------------------------------------------------------------------------------
 Autor(a)    : Ádler Teodoro de Souza
 Data        : 19/02/2009
 Pendência   : SOL 109421 KINTANA 496332
 Descricao   : Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------}

unit RFeriasProgram;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, TXComp,
  uCmRptManager, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppDB, ppDBPipe,
  ppDBBDE, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, TXRB;

type
  TRptFeriasProgram = class(TFrmCmReport)
    rpFeriasProgram: TppReport;
    ProvisaoFeriasppHeaderBand5: TppHeaderBand;
    ProvisaoFeriasppLblTitulo: TppLabel;
    ProvisaoFeriasppDBTxtEmpresa: TppDBText;
    ProvisaoFeriasppDBTxtCPFCGC: TppDBText;
    ProvisaoFeriasppDBTxtTipo: TppDBText;
    ProvisaoFeriasppDBTxtEndereco: TppDBText;
    ProvisaoFeriasrpLabel1: TppLabel;
    ProvisaoFeriasrpLabel2: TppLabel;
    rpProvisaoFeriasLabel1: TppLabel;
    rpProvisaoFeriasDBText1: TppDBText;
    rpCadDependenteLabel5: TppLabel;
    rpCadDependenteDBText1: TppDBText;
    rpGerencialChildReport1Line1: TppLine;
    ProvisaoFeriasrpLblMatricula: TppLabel;
    ProvisaoFeriasrpLblNome: TppLabel;
    ProvisaoFeriasrpLblAvos1: TppLabel;
    rpCadDependenteLabel2: TppLabel;
    rpCadDependenteLabel6: TppLabel;
    rpFeriasProgramLabel1: TppLabel;
    rpFeriasProgramLabel2: TppLabel;
    rpFeriasProgramLabel3: TppLabel;
    ProvisaoFeriasrpCalc1: TppSystemVariable;
    ProvisaoFeriasrpCalc2: TppSystemVariable;
    ppLabel34: TppLabel;
    ProvisaoFeriasppDetailBand15: TppDetailBand;
    ProvisaoFeriasrpDBText1: TppDBText;
    ProvisaoFeriasrpDBText2: TppDBText;
    rpCadDependenteDBText3: TppDBText;
    rpCadDependenteDBText4: TppDBText;
    rpCadDependenteDBText6: TppDBText;
    rpCadDependenteDBText7: TppDBText;
    rpFeriasProgramDBText1: TppDBText;
    ppDBText11: TppDBText;
    ppDBText18: TppDBText;
    ProvisaoFeriasppFooterBand3: TppFooterBand;
    ProvisaoFeriasrpSummaryBand1: TppSummaryBand;
    ProvisaoFeriasrpLine2: TppLine;
    rpCadDependenteLabel3: TppLabel;
    rpCadDependenteDBCalc1: TppDBCalc;
    ppFeriasProgram: TppBDEPipeline;
    dsFeriasProgram: TDataSource;
    sqlFeriasProgram: TCMSqlParams;
    CdsFeriasProgram: TCMClientDataSet;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpFeriasProgramLabel_ParcDev: TppLabel;
    rpFeriasProgramDBText_ParcDev: TppDBText;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    pfldadto: TppField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFeriasProgramAfterScroll(DataSet: TDataSet);
    procedure ProvisaoFeriasrpSummaryBand1AfterPrint(Sender: TObject);
  private
    procedure GerarDadosRelat;
  end;

var
  RptFeriasProgram: TRptFeriasProgram;

implementation

uses fAguarde, dCds, uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}

procedure TRptFeriasProgram.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  ProvisaoFeriasrpSummaryBand1.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) > 0;

  // Monta Query Auxiliar
  with (dmCds.SQL.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,'''',');
    Add('    ''Inscrição Municipal: '' || MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  ('+QuotedStr(CmpRptCM.ParamByName('InicioFerias').asString +' / '+
      CmpRptCM.ParamByName('FinalFerias').asString)+') AS REFERENCIA,');
    Add('  F.MATRICULA, F.CODCENTROCUSTO,');
    Add('  DECODE(FERIAS.FLGABONO,0,''NÃO'', 1,''SIM'') AS ABONO_PEC,');
    Add('  FERIAS.QTDPARCDEVOL,');
    Add('  FERIAS.INDMESDEVOL,');
    Add('  FERIAS.INIPERIODOFERIAS,');
    Add('  FERIAS.INIGOZOFERIAS,');
    Add('  FERIAS.FIMGOZOFERIAS,');
    Add('  DECODE(FERIAS.FLGOCORRIDA,0,''NÃO'', 1,''SIM'') AS FERIAS_PROP');
    Add('  ,DECODE(NVL(FERIAS.FLGADIANTAPAGTOFERIAS, 0), 0, ''NÃO'', 1, ''SIM'') AS PAGA_ADTO_FERIAS'); //Everson Cunha - SIG101852
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES, ESTADO ES, FERIAS,');
    Add('  SITFUNC ST,');
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA          IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');
    Add('  (FERIAS.INIGOZOFERIAS BETWEEN TO_DATE('+QuotedStr(
      CmpRptCM.ParamByName('InicioFerias').asString)+',''DD/MM/YYYY'') AND '+
      'TO_DATE('+QuotedStr(CmpRptCM.ParamByName('FinalFerias').asString)+',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',', CmpRptCM.ParamByName('ListaCodCCusto').asString) > 0) then
          Add('  (F.CODCENTROCUSTO IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        begin
          if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
            Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;
      end;

      if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
        Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
      else
        Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (FERIAS.IDPESSOA   = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, EMPREGADO, MATRICULA');
      1 : Add('  EMPRESA, MATRICULA, EMPREGADO');
      2 : Add('  EMPRESA, CODCENTROCUSTO, EMPREGADO');
      3 : Add('  EMPRESA, CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, EMPREGADO');
      5 : Add('  EMPRESA, CODCENTROCUSTO, INIGOZOFERIAS, MATRICULA');
      6 : Add('  INIGOZOFERIAS, EMPRESA, EMPREGADO');
      7 : Add('  INIGOZOFERIAS, EMPRESA, MATRICULA');
      8 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, EMPREGADO');
      9 : Add('  INIGOZOFERIAS, EMPRESA, CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    //SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.SQL.Open;

  // Monta Query Principal
  GerarDadosRelat;

  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    rpFeriasProgramLabel_ParcDev.Visible := true;
    rpFeriasProgramDBText_ParcDev.Visible := true;
    rpFeriasProgramLabel2.Caption := 'Parc. Dev.';
    rpFeriasProgramLabel2.Left := 127;
    rpFeriasProgramLabel2.Width := 14.288;
    rpCadDependenteDBText7.Left := rpFeriasProgramLabel2.Left;
    rpCadDependenteDBText7.Width := rpFeriasProgramLabel2.Width;
  end
  else
  begin
    rpFeriasProgramLabel_ParcDev.Visible := false;
    rpFeriasProgramDBText_ParcDev.Visible := false;
    rpFeriasProgramLabel2.Caption := 'Parcelas a Devolver';
    rpFeriasProgramLabel2.Left := 112;
    rpFeriasProgramLabel2.Width := 29.633;
    rpCadDependenteDBText7.Left := rpFeriasProgramLabel2.Left;
    rpCadDependenteDBText7.Width := rpFeriasProgramLabel2.Width;
  end;

  frmAguarde.Max := CdsFeriasProgram.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptFeriasProgram.CdsFeriasProgramAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFeriasProgram.ProvisaoFeriasrpSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptFeriasProgram.GerarDadosRelat;
var
  dtPerAquiFinal, dtDataIniParcDevol: TDateTime;
begin
  CdsFeriasProgram.IndexName := '';
  if (CdsFeriasProgram.IndexDefs.Count > 0) then
    CdsFeriasProgram.DeleteIndex('Index1');

  sqlFeriasProgram.Open;
  if not(dmCds.Cds.IsEmpty) then
  begin
    repeat
      CdsFeriasProgram.Insert;
      CdsFeriasProgram.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
      CdsFeriasProgram.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
      CdsFeriasProgram.FieldByName('REFERENCIA').asString := dmCds.Cds.FieldByName('REFERENCIA').asString;
      CdsFeriasProgram.FieldByName('ABONO_PEC').asString := dmCds.Cds.FieldByName('ABONO_PEC').asString;
      CdsFeriasProgram.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
      CdsFeriasProgram.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;
      CdsFeriasProgram.FieldByName('INSCRICAO').asString := dmCds.Cds.FieldByName('ESTADUALMUNICIPAL').asString;
      CdsFeriasProgram.FieldByName('ENDERECO').asString := dmCds.Cds.FieldByName('ENDERECO').asString;
      CdsFeriasProgram.FieldByName('UF').asString := dmCds.Cds.FieldByName('UF').asString;
      CdsFeriasProgram.FieldByName('QTDPARCDEVOL').asInteger := dmCds.Cds.FieldByName('QTDPARCDEVOL').asInteger;

      dtDataIniParcDevol := StrToDate(FU.IncData(
        dmCds.Cds.FieldByName('INIGOZOFERIAS').asString,
        0, dmCds.Cds.FieldByName('INDMESDEVOL').asInteger, 0));
      CdsFeriasProgram.FieldByName('MES_INI_PARCDEVOL').asString :=
        FU.PoeZero(FU.ExtraiMes(dtDataIniParcDevol)) +'/'+
        IntToStr(FU.ExtraiAno(dtDataIniParcDevol));

      CdsFeriasProgram.FieldByName('FERIAS_PROP').asString := dmCds.Cds.FieldByName('FERIAS_PROP').asString;
      CdsFeriasProgram.FieldByName('INIGOZOFERIAS').asString := dmCds.Cds.FieldByName('INIGOZOFERIAS').asString;
      CdsFeriasProgram.FieldByName('FIMGOZOFERIAS').asString := dmCds.Cds.FieldByName('FIMGOZOFERIAS').asString;
      CdsFeriasProgram.FieldByName('INIPERIODOFERIAS').asString := dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString;
      CdsFeriasProgram.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;

      CdsFeriasProgram.FieldByName('DATA_LIMITE').asString :=
        FU.IncData(dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString,0,23,0);

      dtPerAquiFinal := StrToDate(FU.IncData(dmCds.Cds.FieldByName('INIPERIODOFERIAS').asString,0,0,1))-1;
      if (dtPerAquiFinal >= dmCds.Cds.FieldByName('INIGOZOFERIAS').asDateTime) then
        CdsFeriasProgram.FieldByName('FIMPERIODOFERIAS').asString :=
          DateToStr(dmCds.Cds.FieldByName('INIGOZOFERIAS').asDateTime-1)
      else
        CdsFeriasProgram.FieldByName('FIMPERIODOFERIAS').asString := DateToStr(dtPerAquiFinal);

      CdsFeriasProgram.FieldByName('PAGA_ADTO_FERIAS').AsString := dmCds.Cds.FieldByName('PAGA_ADTO_FERIAS').AsString; //Everson Cunha - SIG101852

      CdsFeriasProgram.Post;

      dmCds.Cds.Next;
    until (dmCds.Cds.EOF);
  end
  else
  begin
    CdsFeriasProgram.Insert;
    CdsFeriasProgram.Post;
  end;

  case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
    0 : CdsFeriasProgram.AddIndex('Index1', 'CGC;EMPREGADO;MATRICULA', []);
    1 : CdsFeriasProgram.AddIndex('Index1', 'CGC;MATRICULA;EMPREGADO', []);
    2 : CdsFeriasProgram.AddIndex('Index1', 'CGC;CODCENTROCUSTO;EMPREGADO', []);
    3 : CdsFeriasProgram.AddIndex('Index1', 'CGC;CODCENTROCUSTO;MATRICULA', []);
    4 : CdsFeriasProgram.AddIndex('Index1', 'CGC;CODCENTROCUSTO;INIGOZOFERIAS;EMPREGADO', []);
    5 : CdsFeriasProgram.AddIndex('Index1', 'CGC;CODCENTROCUSTO;INIGOZOFERIAS;MATRICULA', []);
    6 : CdsFeriasProgram.AddIndex('Index1', 'CGC;INIGOZOFERIAS;EMPREGADO', []);
    7 : CdsFeriasProgram.AddIndex('Index1', 'CGC;INIGOZOFERIAS;MATRICULA', []);
    8 : CdsFeriasProgram.AddIndex('Index1', 'CGC;INIGOZOFERIAS;CODCENTROCUSTO;EMPREGADO', []);
    9 : CdsFeriasProgram.AddIndex('Index1', 'CGC;INIGOZOFERIAS;CODCENTROCUSTO;MATRICULA', []);
  end;
  CdsFeriasProgram.IndexName := 'Index1';
  CdsFeriasProgram.First;
end;

end.
