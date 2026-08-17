// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RRelRecContribSind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptRelRecContribSind = class(TFrmCmReport)
    rpRelRecContribSind: TppReport;
    rpRelRecContribSindHdrBnd: TppHeaderBand;
    rpRelRecContribSindLbl2: TppLabel;
    rpRelRecContribSindLbl3: TppLabel;
    rpRelRecContribSindLbl1: TppLabel;
    rpRelRecContribSindDBTxt1: TppDBText;
    rpRelRecContribSindDBTxt2: TppDBText;
    rpRelRecContribSindDBTxt3: TppDBText;
    rpRelRecContribSindDBTxt4: TppDBText;
    rpRelRecContribSindSysVar1: TppSystemVariable;
    rpRelRecContribSindSysVar2: TppSystemVariable;
    rpRelRecContribSindLbl4: TppLabel;
    rpRelRecContribSindDtlBnd: TppDetailBand;
    rpRelRecContribSindDBTxt6: TppDBText;
    rpRelRecContribSindDBTxt8: TppDBText;
    rpRelRecContribSindDBTxt9: TppDBText;
    rpRelRecContribSindDBTxt7: TppDBText;
    rpRelRecContribSindFootBnd: TppFooterBand;
    rpRelRecContribSindSmryBnd: TppSummaryBand;
    rpRelRecContribSindGrp1: TppGroup;
    rpRelRecContribSindGrpHdrBnd1: TppGroupHeaderBand;
    rpRelRecContribSindDBTxt5: TppDBText;
    rpRelRecContribSindLine1: TppLine;
    rpRelRecContribSindGrpFooTBnd1: TppGroupFooterBand;
    rpRelRecContribSindLbl9: TppLabel;
    rpRelRecContribSindDBCalc1: TppDBCalc;
    rpRelRecContribSindLbl10: TppLabel;
    rpRelRecContribSindDBCalc2: TppDBCalc;
    rpRelRecContribSindLine3: TppLine;
    rpRelRecContribSindGrp2: TppGroup;
    rpRelRecContribSindGrpHdrBnd2: TppGroupHeaderBand;
    rpRelRecContribSindLine2: TppLine;
    rpRelRecContribSindLbl5: TppLabel;
    rpRelRecContribSindLbl8: TppLabel;
    rpRelRecContribSindLbl6: TppLabel;
    rpRelRecContribSindLbl7: TppLabel;
    rpRelRecContribSindGrpFootBnd2: TppGroupFooterBand;
    ppRelRecContribSind: TppBDEPipeline;
    dsRelRecContribSind: TDataSource;
    sqlRelRecContribSind: TCMSqlParams;
    CdsRelRecContribSind: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsRelRecContribSindAfterScroll(DataSet: TDataSet);
    procedure rpRelRecContribSindSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptRelRecContribSind: TRptRelRecContribSind;

implementation

uses uSistema, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TRptRelRecContribSind.CrmRptCMBeforePrint(Sender: TObject);
var
  sPeriodo: string;
begin
  inherited;
  sPeriodo := CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger);

  with (sqlRelRecContribSind.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados do Estabelecimento
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  ''CNPJ: '' || DECODE(RTRIM(PJ.NUMDOCUMENTO),NULL,NULL,RTRIM(PJ.NUMDOCUMENTO)) AS CNPJ,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(RTRIM(E.COMPLEMENTO),NULL,NULL,');
    Add('    '' - '' || RTRIM(E.COMPLEMENTO ||'' - '')) || RTRIM(E.BAIRRO) ||'' - ''||');
    Add('    RTRIM(CI.NOME) || '' - CEP: '' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''||');
    Add('    RTRIM(SUBSTR(E.CEP,6,3) || DECODE(ES.CODESTADO,NULL,NULL,'' - '' || ES.CODESTADO)) AS ENDERECO,');
    // Dados do Sindicato
    Add('  UPPER(PS.RAZAOSOCIAL) AS SINDICATO,');
    // Dados do Empregado
    Add('  PF.NOME AS EMPREGADO,');
    Add('  C.TITULO AS CARGO,');
    Add('  ' +QuotedStr(FU.MesExtensoAno(sPeriodo))+ ' AS MES_REF,');
    Add('  VLR_REM.VALOR AS REMUNERACAO,');
    Add('  VLR_CONTRIB.VALOR AS CONTRIBUICAO');
    // ------------------------------------------------------------------ //
    Add('FROM');
    Add('  PESSOA PS, PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F,');
    Add('  ENDPESS E, CIDADES CI, ESTADO ES, CARGO C, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------------- //
    // Remuneração de cada Empregado
    Add('  (SELECT F.IDPESSOA, F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PESSOAFISICA PF, FUNCIONARIO F, RUBRICAXPESS RP, SINDICATO S');
    Add('   WHERE');
    Add(FU.MontaLinhaSelSQL('     (S.IDPESSOA',CmpRptCM.ParamByName('ListaIdSindicato').asString,5));
    Add(FU.MontaLinhaSelSQL('     (RP.CODPROVDESC',CmpRptCM.ParamByName('ListaIdRubrica1').asString,1));
    Add('     (RP.IDPESSOA     = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES           = ' +QuotedStr(sPeriodo)+ ') AND');

    if (CmpRptCM.ParamByName('TipoPagamento').asInteger > 0) then
      Add('     (H.IDMOTIVO      = ' +CmpRptCM.ParamByName('TipoPagamento').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      Add(FU.MontaLinhaSelSQL('     (F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString,6))
    else
      Add('     (F.IDEMPRESA     = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    Add('     (RP.IDRUBRICA    = H.IDRUBRICA) AND');
    Add('     (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('     (F.IDPESSOA      = H.IDPESSOA) AND');
    Add('     (PF.IDSINDICATO  = S.IDPESSOA)');
    Add('   GROUP BY F.IDPESSOA, F.IDESTAB) VLR_REM,');
    // -------------------------------------------------------------------------------- //
    // Contribuição de cada Empregado
    Add('  (SELECT F.IDPESSOA, F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   HISTRUBSAL H, PESSOAFISICA PF, FUNCIONARIO F, RUBRICAXPESS RP, SINDICATO S');
    Add('   WHERE');
    Add(FU.MontaLinhaSelSQL('     (S.IDPESSOA',CmpRptCM.ParamByName('ListaIdSindicato').asString,5));
    Add(FU.MontaLinhaSelSQL('     (RP.CODPROVDESC',CmpRptCM.ParamByName('ListaIdRubrica2').asString,1));
    Add('     (RP.IDPESSOA     = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES           = ' +QuotedStr(sPeriodo)+ ') AND');

    if (CmpRptCM.ParamByName('TipoPagamento').asInteger > 0) then
      Add('     (H.IDMOTIVO      = ' +CmpRptCM.ParamByName('TipoPagamento').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      Add(FU.MontaLinhaSelSQL('     (F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString,6))
    else
      Add('     (F.IDEMPRESA     = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    Add('     (RP.IDRUBRICA    = H.IDRUBRICA) AND');
    Add('     (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('     (F.IDPESSOA      = H.IDPESSOA) AND');
    Add('     (PF.IDSINDICATO  = S.IDPESSOA)');
    Add('   GROUP BY F.IDPESSOA, F.IDESTAB) VLR_CONTRIB');
    // ------------------------------------------------------------------ //
    Add('WHERE');
    Add(FU.MontaLinhaSelSQL('  (PS.IDPESSOA',CmpRptCM.ParamByName('ListaIdSindicato').asString,6));
    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (FP.IDFILIALPESSOA = F.IDESTAB) AND');
    Add('  (FP.IDFILIALPESSOA = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CI.IDCIDADES) AND');
    Add('  (CI.IDESTADO       = ES.IDESTADO) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PEFIS.IDPESSOA) AND');
    Add('  (PS.IDPESSOA       = PEFIS.IDSINDICATO) AND');
    Add('  (F.IDPESSOA        = VLR_REM.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = VLR_CONTRIB.IDPESSOA)');
    Add('ORDER BY');
    Add('  SINDICATO, EMPREGADO');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlRelRecContribSind.Open;
  frmAguarde.Max := CdsRelRecContribSind.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptRelRecContribSind.CdsRelRecContribSindAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptRelRecContribSind.rpRelRecContribSindSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
