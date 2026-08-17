{*********************************************************************************
  Histórico de Alterações:
---------------------------------------------------------------------------------
SIG       : 115304
Data MERGE: 25/01/2023
Data      : 21/10/2021
Autor     : Edilaine
Descrição : Criar Preview com export associado ao ExportD (manual)
---------------------------------------------------------------------------------
*********************************************************************************}
unit fPreviewExportD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPreview, TXComp, TXRB, Menus, StdCtrls, Spin, Buttons, TB97Ctls, MAHlpBtn,
  TB97Tlbr, TB97, ExtCtrls, QExport3Dialog, uCMClientDataSet, QExport3,
  dbtables, wwquery, fExportDManual,
  ppViewr, ppReport, ppDBPipe, ppClass, ppComm, ppRelatv, ppProd, ppArchiv,
  ppForms, ppTypes, ppFilDev, ppDBBDE, ppCache, ppDB,  ppBands;



type
  TFrmPreviewExportD = class(TFrmPreview)
    bbExportar: TBitBtn;
    BtnVisualizar: TBitBtn;
    qe3dPadrao: TQExport3Dialog;
    procedure bbExportarClick(Sender: TObject);
    procedure qe3dPadraoBeginExport(Sender: TQExport3);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    lstColunas       : TStringList;
    lstColNaoExporta : TStringList;

    Class Procedure CreateModalPreviewExp(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                     _qry: Twwquery; lstCampos : TStringList = nil; lstNaoExportar : string = ''); overload;

    Class Procedure CreateModalPreviewExp(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                    _table : TTable; lstCampos : TStringList = nil; lstNaoExportar : string = ''); overload;
  end;

var
  FrmPreviewExportD: TFrmPreviewExportD;

implementation

{$R *.DFM}

procedure TFrmPreviewExportD.bbExportarClick(Sender: TObject);
var
  ind : integer;
begin
  inherited;
  if not qe3dPadrao.DataSet.IsEmpty then
  begin
    for ind := 0 to lstColunas.count-1 do
      qe3dPadrao.ExportedFields.Add(lstColunas.Strings[ind]);

    qe3dPadrao.execute;
  end;

  {
  if TppBDEPipeline(TppReport(ppViewer1.Report).DataPipeline).DataSource.DataSet.IsEmpty then
     Exit;

  bFiltra := TppBDEPipeline(TppReport(ppViewer1.Report).DataPipeline).DataSource.DataSet.Filtered;

  fmQrExportDManual := TfmQrExportDManual.Create(nil);
  try
    with fmQrExportDManual do
    begin
      fmQrExportDManual.bGeraCabecalho := true;
      fmQrExportDManual.sTituloExporta := Self.Caption;
      fmQrExportDManual.DataSet(TppBDEPipeline(TppReport(ppViewer1.Report).DataPipeline).DataSource.DataSet, -1, bFiltra);
      fmQrExportDManual.lstCamposNaoExportar.commatext := lstColNaoExporta.commatext;
      fmQrExportDManual.lstNomeColunas.commatext       := lstColunas.commatext;
      fmQrExportDManual.ShowModal;
    end;
  finally
    FreeAndNil(fmQrExportDManual);
  end;
  }
end;

class procedure TFrmPreviewExportD.CreateModalPreviewExp(
  AOwner: TComponent; appReport: TppReport; ItemCaption: string;
  _qry: Twwquery; lstCampos : TStringList = nil; lstNaoExportar : string = '');
begin
   With Self.Create(AOwner) Do
     Try
       formStyle := fsNormal;
       Visible := False;
       ppViewer1.Report := appReport;
       Caption := ItemCaption;
       ChangeZoom := True;
       ppViewer1.Report.ResetDevices;
       ppViewer1.Report.PrintToDevices;
       btnTelaUnica.Visible := true;
       qe3dPadrao.DataSet := _qry;
       lstColunas                 := lstCampos;
//       lstColNaoExporta.commatext := lstNaoExportar;
       ShowModal;
     finally
       Free;
     End;
end;

class procedure TFrmPreviewExportD.CreateModalPreviewExp(
  AOwner: TComponent; appReport: TppReport; ItemCaption: string;
  _table: TTable; lstCampos : TStringList = nil; lstNaoExportar : string = '');
begin
   With Self.Create(AOwner) Do
     Try
       formStyle := fsNormal;
       Visible := False;
       ppViewer1.Report := appReport;
       Caption := ItemCaption;
       ChangeZoom := True;
       ppViewer1.Report.ResetDevices;
       ppViewer1.Report.PrintToDevices;
       btnTelaUnica.Visible := true;
       //qe3dPadrao.DataSet := _table;
       lstColunas                 := lstCampos;
       lstColNaoExporta.commatext := lstNaoExportar;
       ShowModal;
     finally
       Free;
     End;
end;

procedure TFrmPreviewExportD.qe3dPadraoBeginExport(Sender: TQExport3);
begin
  inherited;
  qe3dPadrao.DataSet.First;
end;

procedure TFrmPreviewExportD.FormCreate(Sender: TObject);
begin
  inherited;
  lstColunas       := TStringList.create;
  lstColNaoExporta := TStringList.create;
end;

procedure TFrmPreviewExportD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(lstColunas);
  FreeAndNil(lstColNaoExporta);

  inherited;
end;

end.
