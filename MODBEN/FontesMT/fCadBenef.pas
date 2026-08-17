unit fCadBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ImgList, Db,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, Mask, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, DBClient,
  CmEventosCadastro, FCadastroMT, uCMClientDataSet, uCtrlTipoBenSal;

type
  TfrmCadBenef = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
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
    CtrlTipoBenSal: TCtrlTipoBenSal;

    procedure Sel(IdBenefSalar: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadBenef: TfrmCadBenef;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadBenef.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipoBenSal := TCtrlTipoBenSal.Create;
  CtrlTipoBenSal.InitializeAs(Padroes);
  CtrlTipoBenSal.CdsTipoBenSal := Cds;
  Sel(-1);
end;

procedure TfrmCadBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipoBenSal);
  inherited;
end;

procedure TfrmCadBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadBenef.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadBenef.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadBenef.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadBenef.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadBenef.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadBenef.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadBenef.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadBenef.Sel(IdBenefSalar: double);
begin
  Cds.Data := CtrlTipoBenSal.ListTipoBenSal(IdBenefSalar);
end;

function TfrmCadBenef.GravarRegistro: boolean;
begin
  Result := CtrlTipoBenSal.GravarTipoBenSal;
  if not(Result) then
    raise Exception.Create(CtrlTipoBenSal.MessageInfo);
end;

end.
