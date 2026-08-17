unit RMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport;

type
  TRptMotivo = class(TFrmCmReport)
    rpMotivo: TppReport;
    MotivoHdrBnd1: TppHeaderBand;
    MotivoLbl1: TppLabel;
    MotivoLbl2: TppLabel;
    MotivoLbl3: TppLabel;
    MotivoLbl4: TppLabel;
    MotivoLbl5: TppLabel;
    MotivoLine1: TppLine;
    MotivoDBTxt1: TppDBText;
    rpMotivoLabel1: TppLabel;
    MotivoCalc1: TppSystemVariable;
    MotivoCalc2: TppSystemVariable;
    MotivoDtlBnd1: TppDetailBand;
    MotivoDBTxt3: TppDBText;
    MotivoDBTxt2: TppDBText;
    rpMotivoDBText1: TppDBText;
    MotivoFootBnd1: TppFooterBand;
    MotivoSmryBnd1: TppSummaryBand;
    MotivoGrp1: TppGroup;
    MotivoGrpHdrBnd1: TppGroupHeaderBand;
    MotivoGrpFootBnd1: TppGroupFooterBand;
    MotivoLbl6: TppLabel;
    MotivoDBCalc1: TppDBCalc;
    ppMotivo: TppBDEPipeline;
    dsMotivo: TwwDataSource;
    sqlMotivo: TCMSqlParams;
    CdsMotivo: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsMotivoAfterOpen(DataSet: TDataSet);
    procedure CdsMotivoAfterScroll(DataSet: TDataSet);
    procedure MotivoSmryBnd1AfterPrint(Sender: TObject);
  end;

var
  RptMotivo: TRptMotivo;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptMotivo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlMotivo.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDMOTIVO, DESCRICAO,');
    Add('  DECODE(GRUPOMOTIVO,''F'',''Tipo de Folha'', ''D'',''Desligamento/Afastamento'',');
    Add('    ''A'',''Alteração Funcional'', ''O'',''Outro'') AS GRUPO');
    Add('FROM');
    Add('  MOTIVO');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDMOTIVO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile('c:\qry.txt');
  end;

  frmAguarde.Mostra ('Listagem de Motivos e Ações');
  frmAguarde.Pos := 0;
  sqlMotivo.Open;
end;

procedure TRptMotivo.CdsMotivoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptMotivo.CdsMotivoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptMotivo.MotivoSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
