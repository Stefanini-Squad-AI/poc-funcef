unit fCadOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT, 
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, TB97, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, Grids, ExtCtrls, DBCtrls, Mask, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, uCtrlTipOcMed;

type
  TfrmCadOcorr = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    Label3: TLabel;
    dbedAvaMin: TDBEdit;
    dbrgTipoOcor: TDBRadioGroup;
    dbrgFlagAcidTrab: TDBRadioGroup;
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
    procedure dbrgTipoOcorChange(Sender: TObject);
  private
    CtrlTipOcMed: TCtrlTipOcMed;
    
    procedure Sel(CodTipoOcMed: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadOcorr: TfrmCadOcorr;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  CtrlTipOcMed.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  inherited;
end;

procedure TfrmCadOcorr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadOcorr.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('FlgTipOcor').asInteger := 0;
  Cds.FieldByName('FlgAcidTrab').asInteger := 0;
end;

procedure TfrmCadOcorr.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadOcorr.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOcorr.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOcorr.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadOcorr.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadOcorr.bbtnConfirmarClick(Sender: TObject);
var
  bInsert: boolean;
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
  if (Trim(dbedAvaMin.Text) = '') then
  begin
    MsgDlg('Preencha a Avaliação Mínima.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedAvaMin.SetFocus;
  end
  else
  if (dbrgTipoOcor.ItemIndex = -1) then
  begin
    MsgDlg('Indique o Tipo de Ocorrência.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbrgTipoOcor.SetFocus;
  end
  else
  begin
    bInsert := (Cds.State = dsInsert);
    inherited;
    if not(bInsert) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadOcorr.Sel(CodTipoOcMed: double);
begin
  Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMed(CodTipoOcMed);
end;

function TfrmCadOcorr.GravarRegistro: boolean;
begin
  Result := CtrlTipOcMed.GravarTipoOcorrenciaMed;
  if not(Result) then
    raise Exception.Create(CtrlTipOcMed.MessageInfo);
end;

procedure TfrmCadOcorr.dbrgTipoOcorChange(Sender: TObject);
begin
  inherited;
  dbrgFlagAcidTrab.Visible := dbrgTipoOcor.ItemIndex = 1;
end;

end.
