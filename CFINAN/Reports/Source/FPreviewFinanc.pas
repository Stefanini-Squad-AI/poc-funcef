unit FPreviewFinanc;

{-----------------------------------------------------------------------------------------
Nº SOL......: 136203
Nº KINTANA..: 813205
Data........: 16/06/2014
Responsável.: Edilaine Ferraresi
Descrição...: Nova funcionalidade para Fluxo de Caixa
-----------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPreview, TXComp, TXRB, Menus, ppComm, ppRelatv, ppProd, ppArchiv,
  StdCtrls, Spin, Buttons, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,
  ppViewr, ppReport, QExport3Dialog, uCMClientDataSet, QExport3, dbtables, wwclient;


type
  TFrmPreviewFinanc = class(TFrmPreview)
    rbtnImprimir1: TBitBtn;
    bbExportar: TBitBtn;
    qe3dPadrao: TQExport3Dialog;
    procedure bbExportarClick(Sender: TObject);
    procedure rbtnImprimir1Click(Sender: TObject);
    procedure qe3dPadraoBeginExport(Sender: TQExport3);
  private
    { Private declarations }
  public
    { Public declarations }
    Class Procedure CreateModalPreviewFinanc(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                    _table : TTable ); overload;

    Class Procedure CreateModalPreviewFinanc(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                    _cds : TwwClientDataSet ); overload;

    Class Procedure CreateModalPreviewFinanc(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                    _cds : TCMClientDataSet ); overload;


    Class Procedure CreateModalPreviewFinanc(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                    _cds, _cdsExporta : TCMClientDataSet ); overload;

  end;

var
  FrmPreviewFinanc: TFrmPreviewFinanc;

implementation

{$R *.DFM}

class procedure TFrmPreviewFinanc.CreateModalPreviewFinanc(AOwner: TComponent;
  appReport: TppReport; ItemCaption: string; _cds : TwwClientDataSet );
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
       btnTelaUnica.Visible := false;
       qe3dPadrao.DataSet := _cds;
       ShowModal;
     finally
       Free;
     End;
end;


class procedure TFrmPreviewFinanc.CreateModalPreviewFinanc(AOwner: TComponent;
  appReport: TppReport; ItemCaption: string; _cds, _cdsExporta : TCMClientDataSet );
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
       btnTelaUnica.Visible := false;
       qe3dPadrao.DataSet := _cdsExporta;
       ShowModal;
     finally
       Free;
     End;
end;

procedure TFrmPreviewFinanc.bbExportarClick(Sender: TObject);
begin
  inherited;
  if not (qe3dPadrao.DataSet.IsEmpty) then
     qe3dPadrao.Execute;
end;

procedure TFrmPreviewFinanc.rbtnImprimir1Click(Sender: TObject);
begin
  inherited;
   ppViewer1.Print;
end;

procedure TFrmPreviewFinanc.qe3dPadraoBeginExport(Sender: TQExport3);
begin
  inherited;
  qe3dPadrao.DataSet.First;
end;

class procedure TFrmPreviewFinanc.CreateModalPreviewFinanc(
  AOwner: TComponent; appReport: TppReport; ItemCaption: string;
  _table: TTable);
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
       btnTelaUnica.Visible := false;
       qe3dPadrao.DataSet := _table;
       ShowModal;
     finally
       Free;
     End;
end;

class procedure TFrmPreviewFinanc.CreateModalPreviewFinanc(
  AOwner: TComponent; appReport: TppReport; ItemCaption: string;
  _cds: TCMClientDataSet);
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
       btnTelaUnica.Visible := false;
       qe3dPadrao.DataSet := _cds;
       ShowModal;
     finally
       Free;
     End;
end;

end.
