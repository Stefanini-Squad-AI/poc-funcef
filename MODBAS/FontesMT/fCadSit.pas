unit fCadSit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroMT,
  StdCtrls, ExtCtrls, DBCtrls, Mask, MontaSelect, Db, DBClient, uCMClientDataSet, ImgList,
  CmEventosCadastro, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, uCtrlSitFunc;

type
  TfrmCadSit = class(TFrmCadastroMT)
    Label5: TLabel;
    dbedCodigo: TDBEdit;
    Label6: TLabel;
    dbedDescr: TDBEdit;
    dbrgTipoSit: TDBRadioGroup;
    Bevel1: TBevel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlSitFunc: TCtrlSitFunc;
    procedure Sel(IdSitFunc: integer);
    function GravarRegistro: boolean;
  end;

var
  frmCadSit: TfrmCadSit;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadSit.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);
  CtrlSitFunc.Cds := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690008;
    MODFOL : HelpContext := 210011;    
  end;
end;

procedure TfrmCadSit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlSitFunc);
  inherited;
end;

procedure TfrmCadSit.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadSit.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FlgUso').asString := 'R';
  Cds.FieldByName('TipoSit').asString := 'A';
end;

procedure TfrmCadSit.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadSit.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadSit.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadSit.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadSit.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadSit.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (dbrgTipoSit.ItemIndex = -1) then
  begin
    MsgDlg('Preencha o Tipo.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbrgTipoSit.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadSit.Sel(IdSitFunc: integer);
begin
  Cds.Data := CtrlSitFunc.ListGeral(IdSitFunc, '', 'G,R', '');
end;

function TfrmCadSit.GravarRegistro: boolean;
begin
  Result := CtrlSitFunc.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlSitFunc.MessageInfo);
end;

end.
