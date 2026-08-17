unit fCadMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, wwdbedit, Wwdatsrc,
  StdCtrls, ExtCtrls, DBCtrls, Mask, MontaSelect, Db, DBClient, uCMClientDataSet, ImgList,
  CmEventosCadastro, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, MConnect, SConnect, ObjBrkr, FCadastroMT, uCtrlMotivo;

type
  TfrmCadMotivo = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgGrupo: TDBRadioGroup;
    Bevel1: TBevel;
    Label3: TLabel;
    dbedCodRais: TDBEdit;
    Label4: TLabel;
    dbedCodFgts: TDBEdit;
    Label5: TLabel;
    dbedObs: TwwDBEdit;
    dbcbxFlgAbateAvos: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;
    procedure Sel(IdMotivo: integer);
    function GravarRegistro: boolean;
  end;

var
  frmCadMotivo: TfrmCadMotivo;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadMotivo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  CtrlMotivo.Cds := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690015;
    MODFOL : HelpContext := 210021;    
  end;
end;

procedure TfrmCadMotivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  inherited;
end;

procedure TfrmCadMotivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadMotivo.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('GRUPOMOTIVO').asString := 'A';
end;

procedure TfrmCadMotivo.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadMotivo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivo.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivo.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadMotivo.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
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

procedure TfrmCadMotivo.Sel(IdMotivo: integer);
begin
  Cds.Data := CtrlMotivo.ListGeral(IdMotivo, 0, '', '');
end;

function TfrmCadMotivo.GravarRegistro: boolean;
begin
  Result := CtrlMotivo.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlMotivo.MessageInfo);
end;

end.
