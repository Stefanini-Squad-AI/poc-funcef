unit fCadAssuntoAgenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlAssuntoAgenda, uSistema, dBaseDados;

type
  TfrmCadAssuntoAgenda = class(TFrmCadastroMT)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    CdsIDASSUNTOAGENDA: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsOBSERVACAO: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    CtrlAssuntoAgenda : TCtrlAssuntoAgenda;

    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  frmCadAssuntoAgenda: TfrmCadAssuntoAgenda;

implementation

{$R *.DFM}

{ TfrmCadAssuntoAgenda }

procedure TfrmCadAssuntoAgenda.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadAssuntoAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAssuntoAgenda := TCtrlAssuntoAgenda.Create;
  CtrlAssuntoAgenda.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  CtrlAssuntoAgenda.CdsAssuntoAgenda := Cds;
  Cds.CreateDataset;
end;

procedure TfrmCadAssuntoAgenda.FormDestroy(Sender: TObject);
begin
  CtrlAssuntoAgenda.Free;
  inherited;
end;

procedure TfrmCadAssuntoAgenda.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAssuntoAgenda.GravaAssuntoAgenda;
end;

procedure TfrmCadAssuntoAgenda.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAssuntoAgenda.GravaAssuntoAgenda;
end;

procedure TfrmCadAssuntoAgenda.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlAssuntoAgenda.GravaAssuntoAgenda;
end;

procedure TfrmCadAssuntoAgenda.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    cds.Data := CtrlAssuntoAgenda.SelecionaAssuntoAgenda( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TfrmCadAssuntoAgenda.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Close;
  Cds.CreateDataSet;
end;

end.
