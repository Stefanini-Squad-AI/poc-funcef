{*********************************************************************************
  Histórico de Alterações:
---------------------------------------------------------------------------------
Rotina    : CreateModalPreviewExpPipe
Data      : 14/03/2017
Autor     : Edilaine
SIG       : 41804
Descrição : Preview com export migrado da CmForms para CmCompo e novo método CREATE
            para tratar apresentação de relatorios pela herança do CmRptManager
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
  ppViewr, QExport3Dialog,    ppReport,  uCMClientDataSet, QExport3, dbtables,
  wwquery, ppDBBDE;

type
  TFrmPreviewExport = class(TFrmPreview)
    qe3dPadrao: TQExport3Dialog;
    bbExportar: TBitBtn;
    procedure bbExportarClick(Sender: TObject);
    procedure qe3dPadraoBeginExport(Sender: TQExport3);
  private
    { Private declarations }
  public
    { Public declarations }

    //edilaine - SIG41804 - inicio
    Class Procedure CreateModalPreviewExpPipe(AOwner : TComponent; appReport: TppReport; ItemCaption : string);
    //edilaine - SIG41804 - fim

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

//edilaine - SIG41804 - inicio
class Procedure TFrmPreviewExport.CreateModalPreviewExpPipe(
  AOwner : TComponent; appReport: TppReport; ItemCaption : string);
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
       qe3dPadrao.DataSet   := TppBDEPipeline(appReport.DataPipeLine).DataSource.DataSet;
       ShowModal;
     finally
       Free;
     End;
end;
//edilaine - SIG41804 - fim

end.
