unit fCadTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, TB97, TB97Tlbr,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, FCadastroMT, uCtrlDstTipoDespesa, wwdbedit, uCtrlDstTarifa,
  wwdblook;

type
  TfrmCadTipoDespesa = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    lblDescricao: TLabel;
    dbedDescricao: TwwDBEdit;
    lblTarifa: TLabel;
    dblcTarifa: TwwDBLookupCombo;
    dbrgTipo: TDBRadioGroup;
    CdsTarifa: TCMClientDataSet;
    dbrgFlgDiaria: TDBRadioGroup;
    CdsDstDespesaDiaria: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dbrgTipoChange(Sender: TObject);
  private
    CtrlDstTipoDespesa: TCtrlDstTipoDespesa;
    CtrlDstTarifa: TCtrlDstTarifa;
    procedure Sel(IdDstTipoDespesa: double);
  end;

var
  frmCadTipoDespesa: TfrmCadTipoDespesa;

implementation

uses uMensErro, uCtrlPadroes, uSistema;

{$R *.DFM}

procedure TfrmCadTipoDespesa.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDstTipoDespesa := TCtrlDstTipoDespesa.Create;
  CtrlDstTipoDespesa.InitializeAs(Padroes);
  CtrlDstTipoDespesa.Cds := Cds;

  CtrlDstTarifa := TCtrlDstTarifa.Create;
  CtrlDstTarifa.InitializeAs(Padroes);
  CdsTarifa.Data := CtrlDstTarifa.ListTarifa;

  Sel(-1);
end;

procedure TfrmCadTipoDespesa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDstTipoDespesa);
  FreeAndNil(CtrlDstTarifa);
  inherited;
end;

procedure TfrmCadTipoDespesa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadTipoDespesa.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadTipoDespesa.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  CdsDstDespesaDiaria.Data := CtrlDstTipoDespesa.DstDespesaDiaria;
  if CdsDstDespesaDiaria.RecordCount > 1 then
    MsgDlg('Não deve ter mais de uma despesa correspondente a Acerto Automático de Diárias. Verifique.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);

end;

procedure TfrmCadTipoDespesa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlDstTipoDespesa.Gravar);
end;

procedure TfrmCadTipoDespesa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlDstTipoDespesa.Gravar);
end;

procedure TfrmCadTipoDespesa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := (CtrlDstTipoDespesa.Gravar);
end;

procedure TfrmCadTipoDespesa.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTipoDespesa.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbedDescricao.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescricao.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadTipoDespesa.Sel(IdDstTipoDespesa: double);
begin
  Cds.Data := CtrlDstTipoDespesa.ListDstTipoDespesa(IdDstTipoDespesa);
end;

procedure TfrmCadTipoDespesa.dbrgTipoChange(Sender: TObject);
begin
  inherited;
  lblTarifa.Visible := dbrgTipo.ItemIndex = 1;
  dblcTarifa.Visible := dbrgTipo.ItemIndex = 1;
end;

end.
