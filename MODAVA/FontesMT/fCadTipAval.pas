unit fCadTipAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, CmEventosCadastro, ImgList,
  fCadastroMT, DBClient, uCMClientDataSet, uCtrlTipAval;

type
  TfrmCadTipAval = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgCategoria: TDBRadioGroup;
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
    CtrlTipAval: TCtrlTipAval;

    procedure Sel(CodTipoAval: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadTipAval: TfrmCadTipAval;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadTipAval.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);
  CtrlTipAval.Cds := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODAVA : HelpContext := 700007;
    MODRES : HelpContext := 730006;
  end;
end;

procedure TfrmCadTipAval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipAval);
  inherited;
end;

procedure TfrmCadTipAval.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipAval.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FLGTIPOAVAL').asInteger := 0;
end;

procedure TfrmCadTipAval.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTipAval.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipAval.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipAval.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := GravarRegistro;
end;

procedure TfrmCadTipAval.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipAval.bbtnConfirmarClick(Sender: TObject);
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
  if (dbrgCategoria.ItemIndex = -1) then
  begin
    MsgDlg('Indique a Categoria.', 'Aviso',  mtWarning, [mbOk,mbHelp], 0);
    dbrgCategoria.SetFocus;
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

procedure TfrmCadTipAval.Sel(CodTipoAval: double);
begin
  Cds.Data := CtrlTipAval.ListTipoAval(CodTipoAval);
end;

function TfrmCadTipAval.GravarRegistro: boolean;
begin
  Result := CtrlTipAval.GravarTipoAval;
  if not(Result) then
    raise Exception.Create(CtrlTipAval.MessageInfo);
end;

end.
