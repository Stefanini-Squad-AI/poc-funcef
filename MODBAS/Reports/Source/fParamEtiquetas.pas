unit fParamEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TB97, wwdblook, ExtCtrls, Spin, TEdNum,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, DBClient, uCmSqlParams,
  CMDateTimePicker, uCMClientDataSet, CmParamReport;

type
  TfrmParamEtiquetas = class(TfrmSelPessoalMT)
    tbsConfiguracoes: TTabSheet;
    rgTipoEtiq: TRadioGroup;
    gbxConfigEtiq: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    spedAltura: TSpinEdit;
    spedQuantCarreiras: TSpinEdit;
    spedMargemSuperior: TSpinEdit;
    spedMargEsquerda: TSpinEdit;
    gbxIntervRef: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    dtedInicial: TCMDateTimePicker;
    dtedFinal: TCMDateTimePicker;
    gbxMesAnoRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    rgPonto: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoEtiqClick(Sender: TObject);
    procedure cbxCandidatosClick(Sender: TObject);
    procedure rgPontoClick(Sender: TObject);
  end;

var
  frmParamEtiquetas: TfrmParamEtiquetas;

implementation

uses fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamEtiquetas.FormCreate(Sender: TObject);
begin
  inherited;
  cmbMes.ItemIndex := FU.ExtraiMes(Date) - 1;
  speAno.Value := FU.ExtraiAno(Date);
  dtedInicial.Date := Date - 30;
  dtedFinal.Date := Date;
  IrPaginaResult := false;
end;

procedure TfrmParamEtiquetas.cbxCandidatosClick(Sender: TObject);
begin
  rgTipoEtiq.Enabled := not(cbxCandidatos.Checked);
  if (cbxCandidatos.Checked) then
    rgTipoEtiq.ItemIndex := 0;
end;

procedure TfrmParamEtiquetas.rgTipoEtiqClick(Sender: TObject);
begin
  gbxIntervRef.Visible := (rgTipoEtiq.ItemIndex > 2);
  rgPonto.Visible := (rgTipoEtiq.ItemIndex = 2);
  gbxMesAnoRef.Visible := (rgTipoEtiq.ItemIndex = 2) and (rgPonto.ItemIndex = 0);
end;

procedure TfrmParamEtiquetas.rgPontoClick(Sender: TObject);
begin
  inherited;
  gbxMesAnoRef.Visible := (rgTipoEtiq.ItemIndex = 2) and (rgPonto.ItemIndex = 0);
end;

procedure TfrmParamEtiquetas.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel: string;
begin
  frmAguarde.Mostra('Impressão de Etiquetas');
  frmAguarde.Pos := 0;

  inherited;
  sListaIdFuncSel := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFuncSel = '') then
      sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('TipoEtiqueta').asInteger := rgTipoEtiq.ItemIndex;
  Cmp_Padrao.ParamByName('BuscarCargoAlternativo').asBoolean := cbxCargoAltern.Checked;
  Cmp_Padrao.ParamByName('PeriodoInicial').asDateTime := dtedInicial.Date;
  Cmp_Padrao.ParamByName('PeriodoFinal').asDateTime := dtedFinal.Date;
  Cmp_Padrao.ParamByName('Altura').asFloat := spedAltura.Value;
  Cmp_Padrao.ParamByName('QuantCarreiras').asFloat := spedQuantCarreiras.Value;
  Cmp_Padrao.ParamByName('MargemSuperior').asFloat := spedMargemSuperior.Value;
  Cmp_Padrao.ParamByName('MargemEsquerda').asFloat := spedMargEsquerda.Value;
  Cmp_Padrao.ParamByName('OpcaoPonto').asInteger := rgPonto.ItemIndex;
  Cmp_Padrao.ParamByName('MesRef').asString := cmbMes.Text + ' de ' + speAno.Text;
end;

end.
