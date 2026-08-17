//***************************************************************************************
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação da funcionalidade de cadastro de tarifas bancárias.
//***************************************************************************************
//Rotina.............: lkpFormaRecPagChange
//N. SIG.............: 80588
//Data da Alteração..: 28/02/2020
//Alteração Form.....: fCadTarifasBancarias
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhoria sobre o procedimento de conciliação de tarifa.
//***************************************************************************************
unit fCadTarifasBancarias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBClient, uCMClientDataSet,
  uCtrlTarifaBancaria, uCtrlListTercFinanc, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, wwdblook, Mask, wwdbedit;


type
  TfrmCadTarifaBancaria = class(TFrmCadastroMT)
    cdsPortadorForma: TCMClientDataSet;
    cdsFormaRecPag: TCMClientDataSet;
    lblDescricao: TLabel;
    lblConvBancario: TLabel;
    lblFormaReceb: TLabel;
    lblValor: TLabel;
    lblValorAntecip: TLabel;
    lblDtInicio: TLabel;
    lblDtFim: TLabel;
    edtDescricao: TwwDBEdit;
    lkpPortadorForma: TwwDBLookupCombo;
    lkpFormaRecPag: TwwDBLookupCombo;
    edtValor: TDBRealEdit;
    edtValorAntecip: TDBRealEdit;
    dtpDataInicio: TCMDateTimePicker;
    dtpDataFim: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure lkpPortadorFormaChange(Sender: TObject);
    procedure LimpaCampos;
    procedure CmeCadastroCancel(Sender: TObject);
    procedure lkpFormaRecPagChange(Sender: TObject); //Cássio Rovaroto - SIG nº 80588
  private
    { Private declarations }
    CtrlTarifaBancaria: TCtrlTarifaBancaria;
    CtrlListTerceiros: TCtrlListTercFinanc;

  public
    { Public declarations }
  end;

var
  frmCadTarifaBancaria: TfrmCadTarifaBancaria;

implementation

uses uCtrlParamIntegra, uMensErro;

{$R *.DFM}

procedure TfrmCadTarifaBancaria.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTarifaBancaria := TCtrlTarifaBancaria.Create;
  CtrlTarifaBancaria.InitializeAs(ParamIntegra);

  CtrlListTerceiros := TCtrlListTercFinanc.Create;
  CtrlListTerceiros.InitializeAs(ParamIntegra);

  Cds.Data := CtrlTarifaBancaria.ListTarifaBancaria(-1);
  CtrlTarifaBancaria.CdsTarifaBancaria := Cds;

  cdsPortadorForma.Data := CtrlListTerceiros.ListPortadorForma();
  cdsFormaRecPag.Data := CtrlTarifaBancaria.ListaFormaRecPag();
end;

procedure TfrmCadTarifaBancaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FreeAndNil(CtrlTarifaBancaria);
  FreeAndNil(CtrlListTerceiros);

  inherited;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTarifaBancaria.AplicaTarifaBancaria;

  if Accept then
    LimpaCampos;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTarifaBancaria.AplicaTarifaBancaria;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTarifaBancaria.AplicaTarifaBancaria;
  if Accept then
    LimpaCampos;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := True;

  if edtDescricao.Text = EmptyStr then
  begin
    Accept := False;
    MsgDlg('Informe um nome descritivo para a tarifa.', 'Atenção', mtWarning, [mbOk], 0);
    edtDescricao.SetFocus;
    Exit;
  end;

  if lkpPortadorForma.Text = EmptyStr then
  begin
    Accept := False;
    MsgDlg('Defina o convênio bancário relacionado.', 'Atenção', mtWarning, [mbOk], 0);
    lkpPortadorForma.SetFocus;
    Exit;
  end;


  if (edtValor.Value = 0) and (edtValorAntecip.Value = 0) then
  begin
    Accept := False;
    MsgDlg('Defina um valor para a tarifa bancária.', 'Atenção', mtWarning, [mbOk], 0);
    lkpFormaRecPag.SetFocus;
    Exit;
  end;

  if dtpDataInicio.Text = EmptyStr then
  begin
    Accept := False;
    MsgDlg('Indique a data de início da vigência da tarifa bancária.', 'Atenção', mtWarning, [mbOk], 0);
    edtValor.SetFocus;
    Exit;
  end;

  if not(dtpDataFim.Text = EmptyStr) and (dtpDataFim.Date < dtpDataInicio.Date) then
  begin
    Accept := False;
    MsgDlg('A data de finalização da tarifa não deve menor que a data de início.', 'Atenção', mtWarning, [mbOk], 0);
    dtpDataFim.SetFocus;
    Exit;
  end;

  if Cds.State in [dsInsert] then
  begin
    if CtrlTarifaBancaria.VerificaDadosTarifa(Cds.FieldByName('CODFORMA').AsInteger, Cds.FieldByName('CODPORTFORMA').AsInteger) then
    begin
      Accept := False;
      MsgDlg('Já existe um cadastro de tarifa ativo com esta configuração.' +#13#10+
             'Por favor, altere as informações ou finalize o cadastro atual, ' +#13#10+
             'informando a Data de Finalização.', 'Atenção', mtWarning, [mbOk], 0);
      lkpPortadorForma.SetFocus;
      Exit;
    end
    else
    begin
      Cds.FieldByName('DATAINICIO').AsString := dtpDataInicio.Text;
      Cds.FieldByName('DATAFIM').AsString := dtpDataFim.Text;
    end;
  end;

  inherited;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    Cds.Close;
    Cds.Data:= CtrlTarifaBancaria.ListTarifaBancaria(StrToInt(MontaSelect.ValoresChave[0]));
    dtpDataInicio.Date := Cds.FieldByName('DATAINICIO').asDateTime;
    dtpDatafim.Date := cds.FieldByName('DATAFIM').asDateTime;
  end;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CtrlTarifaBancaria.ListTarifaBancaria(-1);
  edtDescricao.SetFocus;
end;

procedure TfrmCadTarifaBancaria.lkpPortadorFormaChange(Sender: TObject);
begin
  inherited;
  cdsFormaRecPag.Filtered := False;
  cdsFormaRecPag.Filter := 'RECPAG = ' + QuotedStr(cdsPortadorForma.FieldByName('RECPAG').asString);
  cdsFormaRecPag.Filtered := True;
end;

procedure TfrmCadTarifaBancaria.LimpaCampos;
begin
  edtDescricao.Text := EmptyStr;
  edtValor.Value := 0;
  edtValorAntecip.Value := 0;
  dtpDataFim.Text := EmptyStr;
  dtpDataInicio.Text := EmptyStr;
  lkpFormaRecPag.Text := EmptyStr;
  lkpPortadorForma.Text := EmptyStr;
end;

procedure TfrmCadTarifaBancaria.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TfrmCadTarifaBancaria.lkpFormaRecPagChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (lkpFormaRecPag.Text = EmptyStr) then
    Cds.FieldByName('CODFORMA').AsInteger := 0;
end;

end.
