unit RGrupoObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, TXRB;

type
  TRptGrupoObjeto = class(TFrmCmReport)
    rpGrupoObjeto: TppReport;
    rpGrupoObjetoHdrBnd: TppHeaderBand;
    rpGrupoObjetoLbl1: TppLabel;
    rpGrupoObjetoLbl2: TppLabel;
    rpGrupoObjetoLbl3: TppLabel;
    rpGrupoObjetoLbl4: TppLabel;
    rpGrupoObjetoLbl5: TppLabel;
    rpGrupoObjetoLine1: TppLine;
    rpGrupoObjetoDBTxt1: TppDBText;
    rpGrupoObjetoSysVar1: TppSystemVariable;
    rpGrupoObjetoSysVar2: TppSystemVariable;
    rpGrupoObjetoDtlBnd: TppDetailBand;
    rpGrupoObjetoDBTxt3: TppDBText;
    rpGrupoObjetoDBTxt2: TppDBText;
    rpGrupoObjetoFootBnd: TppFooterBand;
    rpGrupoObjetoSmryBnd: TppSummaryBand;
    ppGroup4: TppGroup;
    rpGrupoObjetoGrpHdrBnd: TppGroupHeaderBand;
    rpGrupoObjetoGrpFootBnd: TppGroupFooterBand;
    rpGrupoObjetoLbl6: TppLabel;
    rpGrupoObjetoDBCalc1: TppDBCalc;
    ppGrupoObjeto: TppBDEPipeline;
    ppGrpObjetoppField1: TppField;
    ppGrpObjetoppField2: TppField;
    ppGrpObjetoppField3: TppField;
    dsGrupoObjeto: TwwDataSource;
    sqlGrupoObjeto: TCMSqlParams;
    CdsGrupoObjeto: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsGrupoObjetoAfterOpen(DataSet: TDataSet);
    procedure CdsGrupoObjetoAfterScroll(DataSet: TDataSet);
    procedure rpGrupoObjetoSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptGrupoObjeto: TRptGrupoObjeto;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptGrupoObjeto.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlGrupoObjeto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDGRUPOOBJETO, DESCRICAO');
    Add('FROM');
    Add('  GRPOBJPROCJUR');
    Add('WHERE');
    Add('  (CLASSEOBJ = ''1'')');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDGRUPOOBJETO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlGrupoObjeto.Open;

  frmAguarde.Mostra('Listagem dos Grupos de Objetos');
  frmAguarde.Pos := 0;
end;

procedure TRptGrupoObjeto.CdsGrupoObjetoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptGrupoObjeto.CdsGrupoObjetoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptGrupoObjeto.rpGrupoObjetoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
