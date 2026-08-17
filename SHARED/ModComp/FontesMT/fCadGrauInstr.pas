unit fCadGrauInstr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, Grids, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Wwdbigrd, Wwdbgrid,
  ExtCtrls, Mask, DBCtrls, FCadastroMT, uCtrlGrInstr;

type
  TfrmCadGrauInstr = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbedRAIS: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlGrInstr: TCtrlGrInstr;

    procedure Sel(IdGrInstr: integer);
    function GravarRegistro: boolean;
  end;

var
  frmCadGrauInstr: TfrmCadGrauInstr;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadGrauInstr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);
  CtrlGrInstr.Cds := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690011;
    MODFOL : HelpContext := 210018;    
  end;
end;

procedure TfrmCadGrauInstr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrInstr);
  inherited;
end;

procedure TfrmCadGrauInstr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrauInstr.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadGrauInstr.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadGrauInstr.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrauInstr.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrauInstr.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrauInstr.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadGrauInstr.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadGrauInstr.Sel(IdGrInstr: integer);
begin
  Cds.Data := CtrlGrInstr.ListGrauInstrucao(IdGrInstr);
end;

function TfrmCadGrauInstr.GravarRegistro: boolean;
begin
  Result := CtrlGrInstr.GravarGrauInstrucao;
  if not(Result) then
    raise Exception.Create(CtrlGrInstr.MessageInfo);
end;

end.
