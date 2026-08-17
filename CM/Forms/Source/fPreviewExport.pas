{*********************************************************************************
  Histórico de Alterações:
---------------------------------------------------------------------------------
Data      : 12/07/2016
Autor     : Darivaldo Alencar
SIG       : 20724
Descrição : Criar Preview com export para exportar Consulta - log de auditoria
---------------------------------------------------------------------------------
*********************************************************************************}
unit fPreviewExport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPreview, TXComp, TXRB, Menus, ppComm, ppRelatv, ppProd, ppArchiv,
  StdCtrls, Spin, Buttons, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,
  ppViewr, QExport3Dialog,    ppReport,  uCMClientDataSet, QExport3, dbtables,  wwquery;

type
  TFrmPreviewExport = class(TFrmPreview)
    bbExportar: TBitBtn;
    BtnVisualizar: TBitBtn;
    qe3dPadrao: TQExport3Dialog;
    procedure bbExportarClick(Sender: TObject);
    procedure qe3dPadraoBeginExport(Sender: TQExport3);
  private
    { Private declarations }
  public

    Class Procedure CreateModalPreviewExp(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                     _qry: Twwquery ); overload;

    Class Procedure CreateModalPreviewExp(AOwner : TComponent; appReport: TppReport; ItemCaption : string;
                    _table : TTable ); overload;
  end;

var
  FrmPreviewExport: TFrmPreviewExport;

implementation

{$R *.DFM}

procedure TFrmPreviewExport.bbExportarClick(Sender: TObject);
begin
  inherited;
  if not (qe3dPadrao.DataSet.IsEmpty) then
     qe3dPadrao.Execute;
end;

class procedure TFrmPreviewExport.CreateModalPreviewExp(
  AOwner: TComponent; appReport: TppReport; ItemCaption: string;
  _qry: Twwquery);
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
       ShowModal;
     finally
       Free;
     End;
end;

class procedure TFrmPreviewExport.CreateModalPreviewExp(
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
       btnTelaUnica.Visible := true;
       qe3dPadrao.DataSet := _table;
       ShowModal;
     finally
       Free;
     End;
end;

procedure TFrmPreviewExport.qe3dPadraoBeginExport(Sender: TQExport3);
begin
  inherited;
  qe3dPadrao.DataSet.First;
end;

end.
