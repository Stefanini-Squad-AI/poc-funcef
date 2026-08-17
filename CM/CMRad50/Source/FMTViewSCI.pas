unit FMTViewSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Db, ComCtrls,
  DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, uCtrlConsultaCotacao;

type
  TFrmMTViewSCI = class(TfrmSairAjuda)
    plnTitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GrdSCI: TwwDBGrid;
    dsSCI: TwwDataSource;
    cdsSCI: TCMClientDataSet;
    lbStatus: TLabel;
    lbCodigo: TLabel;
    LbDescricao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Cotacao : TCtrlConsultaCotacao;
    FIdItemOC: Double;
    FExecuta_ListSCIOrigem: Boolean;
    procedure SetIdItemOC(const Value: Double);
  public
    { Public declarations }
    property IdItemOC: Double read FIdItemOC write SetIdItemOC;
  end;

var
  FrmMTViewSCI: TFrmMTViewSCI;

implementation

{$R *.DFM}

Uses DBaseDados, uSIstema;

procedure TFrmMTViewSCI.FormCreate(Sender: TObject);
begin
  inherited;
  Cotacao := TCtrlConsultaCotacao.Create;
  Cotacao.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  FExecuta_ListSCIOrigem := False;
end;

procedure TFrmMTViewSCI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cotacao.Free;
  inherited;
end;

procedure TFrmMTViewSCI.SetIdItemOC(const Value: Double);
begin
  FIdItemOC              := Value;
  FExecuta_ListSCIOrigem := True;
end;

procedure TFrmMTViewSCI.FormShow(Sender: TObject);
begin
  inherited;
  if FExecuta_ListSCIOrigem then
    cdsSCI.Data := Cotacao.ListSCIOrigem(IdItemOC);
end;

end.
