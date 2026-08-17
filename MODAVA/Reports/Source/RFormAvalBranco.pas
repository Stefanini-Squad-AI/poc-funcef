unit RFormAvalBranco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppClass, ppMemo, ppStrtch, ppRegion, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, uCtrlGlobalRH;

type
  TRptFormAvalBranco = class(TFrmCmReport)
    rpFormAvalBranco: TppReport;
    rpFormAvalBrancoHdrBnd: TppHeaderBand;
    rpFormAvalBrancoLbl1: TppLabel;
    rpFormAvalBrancoLbl2: TppLabel;
    rpFormAvalBrancoDBTxt1: TppDBText;
    rpFormAvalBrancoCalc1: TppSystemVariable;
    rpFormAvalBrancoCalc2: TppSystemVariable;
    rpFormAvalBrancoDBTxt2: TppDBText;
    rpFormAvalBrancoDtlBnd: TppDetailBand;
    rpFormAvalBrancoDBTxt5: TppDBText;
    rpFormAvalBrancoLbl7: TppLabel;
    rpFormAvalBrancoRegiaoObserv: TppRegion;
    rpFormAvalBrancoDBObserv: TppDBMemo;
    rpFormAvalBrancoSmryBnd: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpFormAvalBrancoLbl3: TppLabel;
    rpFormAvalBrancoLbl4: TppLabel;
    rpFormAvalBrancoDBTxt3: TppDBText;
    rpFormAvalBrancoDBTxt4: TppDBText;
    ppLine1: TppLine;
    rpFormAvalBrancoLbl5: TppLabel;
    rpFormAvalBrancoLbl6: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText2: TppDBText;
    ppLabel13: TppLabel;
    ppDBText3: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppGroup1: TppGroup;
    rpFormAvalBrancoGrpHdrBnd: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    rpFormAvalBrancoGrpFootBnd: TppGroupFooterBand;
    ppFormAvalBranco: TppBDEPipeline;
    ppFormAvalBrancoppField1: TppField;
    ppFormAvalBrancoppField2: TppField;
    ppFormAvalBrancoppField3: TppField;
    ppFormAvalBrancoppField4: TppField;
    ppFormAvalBrancoppField5: TppField;
    ppFormAvalBrancoppField6: TppField;
    ppFormAvalBrancoppField7: TppField;
    ppFormAvalBrancoppField8: TppField;
    ppFormAvalBrancoppField9: TppField;
    ppFormAvalBrancoppField10: TppField;
    ppFormAvalBrancoppField11: TppField;
    ppFormAvalBrancoppField12: TppField;
    dsFormAvalBranco: TwwDataSource;
    CdsFormAvalBranco: TCMClientDataSet;
    sqlFormAvalBranco: TCMSqlParams;
    rpFormAvalBrancoRegiaoObservGrupo: TppRegion;
    rpFormAvalBrancoDBObservGrupo: TppDBMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    FlgFiltraFator: integer;
  end;

var
  RptFormAvalBranco: TRptFormAvalBranco;

implementation

uses uSistema, uCtrlPadroes, dCds;

const
  TituloOrdFuncionario: array[0..11] of string =
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

{$R *.DFM}

procedure TRptFormAvalBranco.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGFILTRAFATOR');
  FlgFiltraFator := dmCds.Cds.FieldByName('FLGFILTRAFATOR').asInteger;
end;

procedure TRptFormAvalBranco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGlobalRH);
end;

procedure TRptFormAvalBranco.CrmRptCMBeforePrint(Sender: TObject);
var
  sSQL: string;
begin
  inherited;
  rpFormAvalBrancoRegiaoObserv.Visible := (CmpRptCM.ParamByName('ComObserv').asInteger = 0);
  rpFormAvalBrancoRegiaoObservGrupo.Visible := (CmpRptCM.ParamByName('ComObserv').asInteger = 0);

  with (sqlFormAvalBranco.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  TA.DESCRTIPOAVAL, PF.NOME, C.TITULO AS CARGO,');
    Add('  GA.IDGRUPOFATORAVAL, GA.DESCRICAO, FA.OBSFATORAVAL,');
    Add('  FA.DESCRFATORAVAL, F.DATAADMISSAO, CC.NOME AS CENTROCUSTO, PC.NOME AS CHEFE,');
    Add('  (F.DATAADMISSAO + 89) AS FIMEXPERIENCIA, GA.OBSGRUPOFATOR');
    Add('FROM');
    Add('  PESSOA PF, PESSOA PC, FUNCIONARIO F, CARGO C, FATORAVAL FA,');
    Add('  CENTCUST CC, TIPOAVAL TA, GRUPOFATORAVAL GA ');

    if (FlgFiltraFator = 1) then
      Add('  , PESOFATGRP PS');

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

    Add('  (FA.INDFATORAVAL    IN (0,1)) AND');
    Add('  (TA.CODTIPOAVAL      = ' +CmpRptCM.ParamByName('TipoAval').asString+ ') AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND');
    Add('  (F.IDCARGO           = C.IDCARGO) AND');

    if (FlgFiltraFator = 1) then
    begin
      Add('  (FA.IDFATORAVAL = PS.IDFATORAVAL) AND');
      Add('  (C.CODGRPFUNC   = PS.CODGRPFUNC) AND');
    end;

    Add('  (FA.IDGRUPOFATORAVAL = GA.IDGRUPOFATORAVAL(+)) AND');
    Add('  (F.IDCHEFE           = PC.IDPESSOA(+))');
    Add('ORDER BY');

    sSQL := TituloOrdFuncionario[CmpRptCM.ParamByName('SeqRelat').asInteger];
    case (CmpRptCM.ParamByName('SeqAval').asInteger) of
      0 : sSQL := sSQL + ', GA.IDGRUPOFATORAVAL, FA.IDFATORAVAL';
      1 : sSQL := sSQL + ', GA.DESCRICAO, FA.DESCRFATORAVAL';
    end;
    Add('  ' + sSQL);

    SaveToFile('c:\qry.txt');
  end;
  sqlFormAvalBranco.Open;
end;

end.
