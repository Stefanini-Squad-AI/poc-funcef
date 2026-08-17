unit fBolqueiaHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Provider, Db,
  DBClient, DBTables, Wwquery, Wwdatsrc;

type
  TFrmBolqueiaHist = class(TfrmOkCancelar)
    PnlDesemb: TPanel;
    PnlTitDesemb: TPanel;
    GrdHistLib: TwwDBGrid;
    PnlCtrls: TPanel;
    BtnIncluiHist: TSpeedButton;
    BtnIncluiTodosHist: TSpeedButton;
    BtnExcluiHistAssoc: TSpeedButton;
    BtnExcluiAllHistAssoc: TSpeedButton;
    PnlCadastro: TPanel;
    GrdHistBloq: TwwDBGrid;
    PnlTitTipoAgreAssoc: TPanel;
    CdsHistBloq: TClientDataSet;
    DspHistoricos: TDataSetProvider;
    CdsHistLib: TClientDataSet;
    QryHistoricos: TwwQuery;
    DsHistBloq: TwwDataSource;
    DsHistLIb: TwwDataSource;
    CdsHistLibIDHISTORICOSAF: TFloatField;
    CdsHistLibDESCHISTORICOSAF: TStringField;
    CdsHistLibRECPAG: TStringField;
    CdsHistLibFLGBLOQUEADO: TStringField;
    CdsHistBloqIDHISTORICOSAF: TFloatField;
    CdsHistBloqDESCHISTORICOSAF: TStringField;
    CdsHistBloqRECPAG: TStringField;
    CdsHistBloqFLGBLOQUEADO: TStringField;
    QryHistoricosIDHISTORICOSAF: TFloatField;
    QryHistoricosDESCHISTORICOSAF: TStringField;
    QryHistoricosRECPAG: TStringField;
    QryHistoricosFLGBLOQUEADO: TStringField;
    procedure BtnIncluiHistClick(Sender: TObject);
    procedure BtnExcluiHistAssocClick(Sender: TObject);
    procedure BtnExcluiAllHistAssocClick(Sender: TObject);
    procedure BtnIncluiTodosHistClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBolqueiaHist: TFrmBolqueiaHist;

implementation

{$R *.DFM}

procedure TFrmBolqueiaHist.BtnIncluiHistClick(Sender: TObject);
begin
  inherited;
  CdsHistLib.Edit;
  CdsHistLibFLGBLOQUEADO.AsString := 'S';

  CdsHistBloq.DisableControls;
  CdsHistBloq.Filtered := False;
  CdsHistBloq.Locate('IDHISTORICOSAF',CdsHistLibIDHISTORICOSAF.AsFloat,[]);
  CdsHistBloq.Edit;
  CdsHistBloqFLGBLOQUEADO.AsString := 'S';
  CdsHistBloq.Post;
  CdsHistBloq.Filtered := True;
  CdsHistBloq.EnableControls;

  CdsHistLib.Post;     
end;

procedure TFrmBolqueiaHist.BtnExcluiHistAssocClick(Sender: TObject);
begin
  inherited;
  CdsHistBloq.Edit;
  CdsHistBloqFLGBLOQUEADO.AsString := 'N';

  CdsHistLib.DisableControls;
  CdsHistLib.Filtered := False;
  CdsHistLib.Locate('IDHISTORICOSAF',CdsHistBloqIDHISTORICOSAF.AsFloat,[]);
  CdsHistLib.Edit;
  CdsHistLibFLGBLOQUEADO.AsString := 'N';
  CdsHistLib.Post;
  CdsHistLib.Filtered := True;
  CdsHistLib.EnableControls;

  CdsHistBloq.Post;  
end;

procedure TFrmBolqueiaHist.BtnExcluiAllHistAssocClick(Sender: TObject);
begin
  inherited;
  CdsHistBloq.First;
  While Not CdsHistBloq.Eof Do
     BtnExcluiHistAssoc.Click;
end;

procedure TFrmBolqueiaHist.BtnIncluiTodosHistClick(Sender: TObject);
begin
  inherited;
  CdsHistLib.First;
  While Not CdsHistLib.Eof Do
     BtnIncluiHist.Click;
end;

procedure TFrmBolqueiaHist.FormCreate(Sender: TObject);
begin
  inherited;
  CdsHistBloq.Open;
  CdsHistLib.Open;
end;

procedure TFrmBolqueiaHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CdsHistBloq.Close;
  CdsHistLib.Close;
end;

procedure TFrmBolqueiaHist.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If CdsHistBloq.ChangeCount > 0 Then CdsHistBloq.CancelUpdates;
  If CdsHistLib.ChangeCount > 0 Then CdsHistLib.CancelUpdates;
end;

procedure TFrmBolqueiaHist.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  CdsHistBloq.DisableControls;
  CdsHistLib.DisableControls;

  Try
    If CdsHistBloq.ChangeCount > 0 Then CdsHistBloq.ApplyUpdates(0);
    If CdsHistLib.ChangeCount > 0 Then CdsHistLib.CancelUpdates;

    CdsHistLib.CLose;
    CdsHistBloq.Close;

    CdsHistLib.Open;
    CdsHistBloq.Open;;

  finally
    CdsHistBloq.EnableControls;
    CdsHistLib.EnableControls;
  End;


end;

end.
