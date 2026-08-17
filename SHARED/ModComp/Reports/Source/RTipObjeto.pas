// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTipObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptTipObjeto = class(TFrmCmReport)
    rpTipObjeto: TppReport;
    rpTipObjetoHdrBnd: TppHeaderBand;
    rpTipObjetoLbl1: TppLabel;
    rpTipObjetoLbl2: TppLabel;
    rpTipObjetoLbl3: TppLabel;
    rpTipObjetoLbl4: TppLabel;
    rpTipObjetoLbl5: TppLabel;
    rpTipObjetoLine1: TppLine;
    rpTipObjetoDBTxt1: TppDBText;
    rpTipObjetoLbl6: TppLabel;
    rpTipObjetoSysVar1: TppSystemVariable;
    rpTipObjetoSysVar2: TppSystemVariable;
    rpTipObjetoLbl7: TppLabel;
    rpTipObjetoDtlBnd: TppDetailBand;
    rpTipObjetoDBTxt3: TppDBText;
    rpTipObjetoDBTxt2: TppDBText;
    rpTipObjetoDBTxt4: TppDBText;
    rpTipObjetoDBTxt5: TppDBText;
    rpTipObjetoFootBnd: TppFooterBand;
    rpTipObjetoSmryBnd: TppSummaryBand;
    rpTipObjetoGrp1: TppGroup;
    rpTipObjetoGrpHdrBnd: TppGroupHeaderBand;
    rpTipObjetoGrpFootBnd: TppGroupFooterBand;
    rpTipObjetoLbl8: TppLabel;
    rpTipObjetoDBCalc1: TppDBCalc;
    ppTipObjeto: TppBDEPipeline;
    ppTipObjetoppField1: TppField;
    ppTipObjetoppField2: TppField;
    ppTipObjetoppField3: TppField;
    ppTipObjetoppField4: TppField;
    ppTipObjetoppField5: TppField;
    dsTipObjeto: TwwDataSource;
    sqlTipObjeto: TCMSqlParams;
    CdsTipObjeto: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTipObjetoAfterOpen(DataSet: TDataSet);
    procedure CdsTipObjetoAfterScroll(DataSet: TDataSet);
    procedure rpTipObjetoSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTipObjeto: TRptTipObjeto;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptTipObjeto.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTipObjeto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  TP.CODTIPOOBJETO, TP.DESCRICAO,');
    Add('  GP.DESCRICAO AS GRUPOOBJETO, PD.DESCRICAO AS PROVENTO');
    Add('FROM');
    Add('  TIPOOBJPROCTRAB TP, PROVDESC PD, GRPOBJPROCJUR GP');
    Add('WHERE');
    Add('  (TP.IDGRUPOOBJETO = GP.IDGRUPOOBJETO(+)) AND');
    Add('  (TP.IDPROVENTO    = PD.IDPROVENTO(+))');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODTIPOOBJETO');
      1 : Add('  DESCRICAO');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTipObjeto.Open;

  frmAguarde.Mostra('Listagem dos Tipos de Objetos');
  frmAguarde.Pos := 0;
end;

procedure TRptTipObjeto.CdsTipObjetoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTipObjeto.CdsTipObjetoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTipObjeto.rpTipObjetoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
