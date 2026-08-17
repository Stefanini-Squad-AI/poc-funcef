unit fCadPaisEstadoTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  uCtrlPaisEstadoTeste, uCtrlPadroes, uMensErro, usistema;

type
  TfrmCadPaisEstadoTeste = class(TFrmCadastroMestreDetMT)
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    dbgEstado: TwwDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    cdsEstado: TCMClientDataSet;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dbgEstadoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    CtrlPaisEstadoTeste : TCtrlPaisEstadoTeste;
    procedure AbreQueries (const iIdPais: integer);
  public
    { Public declarations }
  end;

var
  frmCadPaisEstadoTeste: TfrmCadPaisEstadoTeste;

implementation

{$R *.DFM}

procedure TfrmCadPaisEstadoTeste.AbreQueries(const iIdPais: integer);
begin
  Cds.Data := CtrlPaisEstadoTeste.ListaPais (iIdPais);
  cdsEstado.Data := CtrlPaisEstadoTeste.ListaEstado (iIdPais);
end;

procedure TfrmCadPaisEstadoTeste.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPaisEstadoTeste := TCtrlPaisEstadoTeste.Create;

  CtrlPaisEstadoTeste.InitializeAs (padroes);
  CtrlPaisEstadoTeste.cdsPaisTeste := cds;
  CtrlPaisEstadoTeste.cdsEstadoTeste := cdsEstado;

  AbreQueries (-2);
end;

procedure TfrmCadPaisEstadoTeste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil (CtrlPaisEstadoTeste);
  inherited;
end;

procedure TfrmCadPaisEstadoTeste.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    AbreQueries (StrToInt (MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadPaisEstadoTeste.dbgEstadoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsEstado.IndexFieldNames := AFieldName;
end;

procedure TfrmCadPaisEstadoTeste.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPaisEstadoTeste.GravarPaisEstado;
  if not Accept then
    MsgDlg (CtrlPaisEstadoTeste.MessageInfo, 'GlobalCM', mtWarning, [mbok], 0);
end;

procedure TfrmCadPaisEstadoTeste.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPaisEstadoTeste.ExcluiPaisEstado;
  if not accept then MsgDlg (CtrlPaisEstadoTeste.MessageInfo, Sistema.NomeModulo, mtWarning, [mbok], 0;

end;

procedure TfrmCadPaisEstadoTeste.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  AbreQueries(-2);
end;

end.
