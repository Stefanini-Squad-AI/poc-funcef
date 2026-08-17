// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RHorasTrabOutro;
// 4212                
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, TXComp,
  uCmRptManager, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppDB, ppDBPipe,
  ppDBBDE, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, IvDictio, IvMulti, TXRB;

type
  TRptHorasTrabOutro = class(TFrmCmReport)
    rpHorasTrabOutro: TppReport;
    HdrBnd: TppHeaderBand;
    Lbl1: TppLabel;
    DBTxt1: TppDBText;
    Lbl3: TppLabel;
    Lbl4: TppLabel;
    Lbl5: TppLabel;
    DBTxt6: TppDBText;
    Line1: TppLine;
    Lbl6: TppLabel;
    Lbl7: TppLabel;
    Lbl13: TppLabel;
    Lbl9: TppLabel;
    SysVar1: TppSystemVariable;
    SysVar2: TppSystemVariable;
    Lbl12: TppLabel;
    DtlBnd: TppDetailBand;
    DBTxt7: TppDBText;
    DBTxt8: TppDBText;
    DBTxt10: TppDBText;
    DBTxt11: TppDBText;
    DBTxt12: TppDBText;
    DBTxt14: TppDBText;
    DBTxt15: TppDBText;
    FootBnd: TppFooterBand;
    SmryBnd: TppSummaryBand;
    Line2: TppLine;
    Lbl15: TppLabel;
    DBCalc1: TppDBCalc;
    ppHorasTrabOutro: TppDBPipeLine;
    dsHorasTrabOutro: TDataSource;
    sqlHorasTrabOutro: TCMSqlParams;
    CdsHorasTrabOutro: TCMClientDataSet;
    DBTxt13: TppDBText;
    DBTxt16: TppDBText;
    Lbl10: TppLabel;
    Lbl11: TppLabel;
    Lbl14: TppLabel;
    Lbl8: TppLabel;
    DBTxt9: TppDBText;
    Group0: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    LblEmpresa_CC: TppLabel;
    DBTxtEmpresa_CC: TppDBText;
    ppLabel1: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsHorasTrabOutroAfterScroll(DataSet: TDataSet);
    procedure SmryBndAfterPrint(Sender: TObject);
    procedure DtlBndBeforePrint(Sender: TObject);
  end;

var
  RptHorasTrabOutro: TRptHorasTrabOutro;

implementation

uses uSistema, fAguarde, uCtrlUsoGeralRH, uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_DE_ATE = ':1 a :2';

{$R *.DFM}

procedure TRptHorasTrabOutro.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlHorasTrabOutro.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  ' +QuotedStr(FU.CMTranslateMsg(MSG_DE_ATE,
      [CmpRptCM.ParamByName('InicioPeriodo').asString,
       CmpRptCM.ParamByName('FinalPeriodo').asString]))+ ' AS REFERENCIA,');
    Add('  F.MATRICULA,');
    Add('  RTRIM(PECCF.NOME) AS EMPRESA_CENTROCUSTO,');
    Add('  HT.IDEMPRESA AS ID_EMPRESA_CENTROCUSTO,');
    Add('  RTRIM(CCF.NOME) AS NOME_CENTROCUSTO,');
    Add('  F.CODCENTROCUSTO,');
    Add('  (CASE');
    Add('     WHEN HT.FLGPERMANENTE = 1 THEN ' +QuotedStr(FU.CMTranslate('SIM')));
    Add('     ELSE ' +QuotedStr(FU.CMTranslate('NÃO')));
    Add('   END) AS PERMANENTE,');
    Add('  (CASE');
    Add('     WHEN HT.FLGCARGATOTAL = 1 THEN HR.JORNADAMENSAL');
    Add('     ELSE HT.HORASTRAB');
    Add('   END) AS HORASTRAB,');
    //Add('  DECODE(HT.INDHORAPERC, 0, ' +QuotedStr(FU.CMTranslate('Hrs'))+ ', ''%'') AS TIPO,');
    Add('  ' +QuotedStr(FU.CMTranslate('Hrs'))+' AS TIPO,');
    Add('  HT.DATATRAB,');
    Add('  UN.NOME AS ATIVPROJ,');
    Add('  CC.NOME AS SETOR,');
    Add('  (CASE');
    Add('     WHEN HT.FLGRATEIO = 1 THEN ' +QuotedStr(FU.CMTranslate('SIM')));
    Add('     ELSE ' +QuotedStr(FU.CMTranslate('NÃO')));
    Add('   END) AS RATEIO');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOA PECCF, FUNCIONARIO F, HORATRABOUTROCC HT,');
    Add('  CENTCUST CC, CENTCUST CCF, UNIDNEGOCIO UN, HORATRAB HR, SITFUNC SF');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(FU.MontaLinhaSelSQL('  (PJ.IDPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString,6));
    Add('  ((HT.FLGPERMANENTE = 1) OR');
    Add('   (HT.DATATRAB     >= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('InicioPeriodo').asString)+ ',''DD/MM/YYYY''))) AND');
    Add('  (HT.DATATRAB      <= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('FinalPeriodo').asString)+ ',''DD/MM/YYYY'')) AND');

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',CmpRptCM.ParamByName('ListaIdFunc').asString,6))
    else
    begin
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
        Add(FU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO',CmpRptCM.ParamByName('ListaCodCCusto').asString,1))
      else
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        Add(FU.MontaLinhaSelSQL('  (F.CODCENTROCUSTO',CtrlUsoGeralRH.UsuXCCusto,1));

      Add(FU.MontaLinhaSelSQL('  (SF.TIPOSIT',CmpRptCM.ParamByName('SitFunc').asString,7));
      Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',CmpRptCM.ParamByName('TipoContrato').asString,3));
    end;

    Add('  (F.IDSITFUNC       = SF.IDSITFUNC) AND');
    Add('  (F.IDPESSOA        = HT.IDPESSOA) AND');
    Add('  (F.IDHORARIO       = HR.IDHORARIO) AND');
    Add('  (F.CODCENTROCUSTO  = CCF.CODCENTROCUSTO) AND');
    Add('  (F.IDEMPRESA       = CCF.IDEMPRESA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (HT.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (HT.IDEMPRESA      = CC.IDEMPRESA) AND');
    Add('  (CC.IDEMPRESA      = PECCF.IDPESSOA(+)) AND');
    Add('  (HT.IDEMPRESAPROP  = UN.IDPESSOA(+)) AND');
    Add('  (HT.UNIDNEGOC      = UN.UNIDNEGOC(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, EMPREGADO, MATRICULA');
      1 : Add('  EMPRESA, MATRICULA, EMPREGADO');
      2 : Add('  EMPRESA, F.CODCENTROCUSTO, EMPREGADO');
      3 : Add('  EMPRESA, F.CODCENTROCUSTO, MATRICULA');
      4 : Add('  EMPRESA, F.CODCENTROCUSTO, DATATRAB, EMPREGADO');
      5 : Add('  EMPRESA, F.CODCENTROCUSTO, DATATRAB, MATRICULA');
      6 : Add('  EMPRESA, DATATRAB, EMPREGADO');
      7 : Add('  EMPRESA, DATATRAB, MATRICULA');
      8 : Add('  EMPRESA, DATATRAB, F.CODCENTROCUSTO, EMPREGADO');
      9 : Add('  EMPRESA, DATATRAB, F.CODCENTROCUSTO, MATRICULA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlHorasTrabOutro.Open;

  frmAguarde.Max := CdsHorasTrabOutro.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptHorasTrabOutro.CdsHorasTrabOutroAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;                                          

procedure TRptHorasTrabOutro.DtlBndBeforePrint(Sender: TObject);
begin
  LblEmpresa_CC.Top := 5.027;
  DbTxtEmpresa_CC.Top := LblEmpresa_CC.Top;
  LblEmpresa_CC.Visible :=
    not(CdsHorasTrabOutro.FieldByName('ID_EMPRESA_CENTROCUSTO').IsNull) and
    (CdsHorasTrabOutro.FieldByName('ID_EMPRESA_CENTROCUSTO').asInteger <> Sistema.IdEmpresa);
  DbTxtEmpresa_CC.Visible := LblEmpresa_CC.Visible;
  if (LblEmpresa_CC.Visible) then
    DtlBnd.Height := 8.996
  else
    DtlBnd.Height := 4.763;
end;

procedure TRptHorasTrabOutro.SmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
