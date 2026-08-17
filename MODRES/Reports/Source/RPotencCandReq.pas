unit RPotencCandReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, ppBands,
  ppClass, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCmRptManager, TXComp, CmParamReport;

type
  TRptPotencCandReq = class(TFrmCmReport)
    sqlPotencCandReq: TCMSqlParams;
    CdsPotencCandReq: TCMClientDataSet;
    dsPotencCandReq: TwwDataSource;
    ppPotencCandReq: TppBDEPipeline;
    rpPotencCandReq: TppReport;
    rpPotencCandReqHdrBnd: TppHeaderBand;
    rpPotencCandReqLbl3: TppLabel;
    rpPotencCandReqLbl4: TppLabel;
    rpPotencCandReqCalc1: TppSystemVariable;
    rpPotencCandReqCalc2: TppSystemVariable;
    rpPotencCandReqLbl7: TppLabel;
    rpPotencCandReqLbl6: TppLabel;
    rpPotencCandReqLbl5: TppLabel;
    rpPotencCandReqLbl1: TppLabel;
    rpPotencCandReqDBTxt3: TppDBText;
    rpPotencCandReqDBTxt2: TppDBText;
    rpPotencCandReqDBTxt4: TppDBText;
    rpPotencCandReqLbl8: TppLabel;
    rpPotencCandReqDBTxt5: TppDBText;
    rpPotencCandReqLine1: TppLine;
    rpPotencCandReqDtlBnd: TppDetailBand;
    rpPotencCandReqLine2: TppLine;
    rpPotencCandReqSmryBnd: TppSummaryBand;
    rpPotencCandReqGrpEMPRESA: TppGroup;
    rpPotencCandReqGrpHdrBnd: TppGroupHeaderBand;
    rpPotencCandReqGrpFootBnd: TppGroupFooterBand;
    rpPotencCandReqLbl9: TppLabel;
    rpPotencCandReqDBCalc1: TppDBCalc;
    rpPotencCandReqDBTxt1: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpPotencCandReqSmryBndAfterPrint(Sender: TObject);
  public
    ListaIdPessoa: string;
    bCandidato: boolean;
  end;

var
  RptPotencCandReq: TRptPotencCandReq;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptPotencCandReq.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlPotencCandReq.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  ' +QuotedStr(Sistema.NomeEmpresa)+ ' AS EMPRESA, P.NOME,');

    if bCandidato then
      Add('  ''Candidato Externo '' AS SITUACAO,')
    else
      Add('  SF.DESCRICAO AS SITUACAO,');

    Add('  C.TITULO AS CARGO, PF.DATANASC');
    Add('FROM');

    if bCandidato then
      Add('  PESSOA P, PESSOAFISICA PF, CANDIDAT F, CARGO C')
    else
      Add('  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, CARGO C, SITFUNC SF');

    Add('WHERE');

    if (ListaIdPessoa <> '') then
      if (Pos(',', ListaIdPessoa) > 0) then
        Add('  (F.IDPESSOA IN (' +ListaIdPessoa+ ')) AND')
      else
        Add('  (F.IDPESSOA = ' +ListaIdPessoa+ ') AND');

    if bCandidato then
      Add('  (F.IDCARGO   = C.IDCARGO(+)) AND')
    else
    begin
      Add('  (F.IDCARGO   = C.IDCARGO) AND');
      Add('  (F.IDSITFUNC = SF.IDSITFUNC) AND');
    end;
    
    Add('  (F.IDPESSOA  = PF.IDPESSOA) AND');
    Add('  (F.IDPESSOA  = P.IDPESSOA)');
    Add('ORDER BY');
    Add('  UPPER(EMPRESA), UPPER(NOME)');
  end;
  sqlPotencCandReq.Open;
end;

procedure TRptPotencCandReq.rpPotencCandReqSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
