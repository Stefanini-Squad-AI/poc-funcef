{ Alterações                                                                   }
{*******************************************************************************
Analista.:
Pendencia:
Rotina...:
Descrição:
*******************************************************************************}
{*******************************************************************************
Analista.: Claudio Faria
Pendencia: 21820 - 27/02/2007
Rotina...:
Descrição: Tela para geração do arquivo da DCTF 1.3
*******************************************************************************}

unit fGeraDCTFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Spin, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, CMProcuraSubTipo, uCtrlGeraDCTF, uSistema, uMensErro, uDataBase,
  DBaseDados, uFuncoesUteisIR, Db, DBClient, DBCtrls;

type
  TfrmGeraDCTF = class(TfrmSairAjuda)
    gbxAnoMesRef: TLabel;
    Panel1: TPanel;
    spnAnoCalendario: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    grpSituacaoEspecial: TGroupBox;
    ckbSituacao: TCheckBox;
    lbDtEvento: TLabel;
    dtEvento: TCMDateTimePicker;
    lblEvento: TLabel;
    cbEvento: TComboBox;
    cbMes: TComboBox;
    grpRetificadora: TGroupBox;
    lbRetificadora: TLabel;
    cbkRetificada: TCheckBox;
    mkRecRetificada: TMaskEdit;
    Presponsavel: TCMProcuraSubTipo;
    Label8: TLabel;
    edCRCContador: TEdit;
    PRepresentante: TCMProcuraSubTipo;
    Panel2: TPanel;
    cbLucro: TComboBox;
    cbQualificacao: TComboBox;
    rgQualJuridica: TLabel;
    rgFormaLucro: TLabel;
    Label9: TLabel;
    mkNatureza: TMaskEdit;
    cbkEsteveInativa: TCheckBox;
    cbkLevantouBalanco: TCheckBox;
    cbkComDebitoSCP: TCheckBox;
    cbkComIncorporacao: TCheckBox;
    cbkObrigadaApresentacao: TCheckBox;
    lbEsteveInativa: TLabel;
    lbComIncorporacao: TLabel;
    rbtnGerar: TBitBtn;
    grpBoxImport: TGroupBox;
    edtImport: TEdit;
    btbtnSeleciona: TBitBtn;
    svDPrev: TSaveDialog;
    rgPeriodoBase: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    ckbBalancoReducao: TCheckBox;
    dblkEstados: TDBLookupComboBox;
    Label3: TLabel;
    cdsUF: TClientDataSet;
    procedure cbLucroChange(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure btbtnSelecionaClick(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure spnAnoCalendarioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure cbkRetificadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CtrlGeraDCTF : TCtrlGeraDCTF;

    procedure Periodos;
  end;

var
  frmGeraDCTF: TfrmGeraDCTF;

implementation

{$R *.DFM}

procedure TfrmGeraDCTF.Periodos;
Var iUltDia:Integer;
Begin
  Try
    dtInicio.MinDate := StrToDate('01/01/2006');
    dtInicio.MaxDate := StrToDate('31/12/2100');
    dtEvento.MinDate := dtInicio.MinDate;
    dtEvento.MaxDate := dtInicio.MaxDate;

    dtInicio.Text := '01/' + StrZero(2, IntToStr(cbMes.ItemIndex +1)) + '/' + spnAnoCalendario.Text;
    iUltDia       := TrazUltDiaMes((cbMes.ItemIndex +1), StrToInt(spnAnoCalendario.Text));
    dtFim.Text    := StrZero(2, IntToStr(iUltDia)) + '/' +
                     StrZero(2, IntToStr(cbMes.ItemIndex +1)) + '/' +
                     spnAnoCalendario.Text;

    If ckbSituacao.Checked Then
    Begin
      dtEvento.Text    := dtFim.Text;
      dtEvento.MinDate := dtInicio.Date;
      dtEvento.MaxDate := dtFim.Date;
    End
    Else
      dtEvento.Text := '';

  Except End;

  dtInicio.MinDate := dtInicio.Date;
  dtInicio.MaxDate := dtFim.Date;
End;

procedure TfrmGeraDCTF.cbLucroChange(Sender: TObject);
begin
  inherited;

  cbkLevantouBalanco.Enabled := (cbLucro.ItemIndex = 1);               
  If (cbLucro.ItemIndex <> 1) Then cbkLevantouBalanco.Checked := False;
end;

procedure TfrmGeraDCTF.rbtnGerarClick(Sender: TObject);
Var sRetificada, sSituacao,
    sLevantouBalanco, sComDebitoSCP,
    sEsteveInativa, sComIncorporacao,
    sObrigadaApresentacao,
    sBalancoReducao, sUF  : String;
begin
  inherited;

  { Criticas Para a Geração }

  If ( cbMes.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher Mês de Apuração', 'Informação', mtInformation, [mbOk], 0);
    cbMes.SetFocus;
    Exit;
  End;

  If ( cbkRetificada.Checked ) and ( mkRecRetificada.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher o nº do recibo, quando a declaração for do tipo Retificadora', 'Informação', mtInformation, [mbOk], 0);
    mkRecRetificada.SetFocus;
    Exit;
  End;

  If ( cbLucro.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher a Forma de Trib. do Lucro', 'Informação', mtInformation, [mbOk], 0);
    cbLucro.SetFocus;
    Exit;
  End;

  If ( cbQualificacao.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher a Quallificação P. Jurídica', 'Informação', mtInformation, [mbOk], 0);
    cbQualificacao.SetFocus;
    Exit;
  End;

  If ( mkNatureza.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher a Natureza Jurídica', 'Informação', mtInformation, [mbOk], 0);
    mkNatureza.SetFocus;
    Exit;
  End;

  If PRepresentante.SubTipoReg.RazaoSocial = '' Then
  Begin
    MsgDlg('É obrigatório o nome do representante da fundação', 'Informação', mtInformation, [mbOk], 0);
    PRepresentante.SetFocus;
    Exit;
  End;

  If PResponsavel.SubTipoReg.RazaoSocial = '' Then
  Begin
    MsgDlg('É obrigatório o nome do representante da fundação', 'Informação', mtInformation, [mbOk], 0);
    PResponsavel.SetFocus;
    Exit;
  End;

  If ( edtImport.Text = '' ) Then
  Begin
    MsgDlg('É Obrigatório preencher o local de gravação do arquuivo de exportação', 'Informação', mtInformation, [mbOk], 0);
    btbtnSelecionaClick(Sender);
    Exit;
  End;


  If dblkEstados.KeyValue = Null Then
    sUF := ''
  Else
    sUF := dblkEstados.KeyValue;

  { Geração do Arquivo }

  sRetificada := '0';
  If cbkRetificada.Checked Then sRetificada := '1';

  sLevantouBalanco := '0';
  If cbkLevantouBalanco.Checked Then sLevantouBalanco := '1';

  sComDebitoSCP := '0';
  If cbkComDebitoSCP.Checked Then sComDebitoSCP := '1';

  sEsteveInativa := '0';
  If cbkEsteveInativa.Checked Then sEsteveInativa := '1';

  sComIncorporacao := '0';
  If cbkComIncorporacao.Checked Then sComIncorporacao := '1';

  sObrigadaApresentacao := '0';
  If cbkObrigadaApresentacao.Checked Then sObrigadaApresentacao := '1';

  sBalancoReducao := '0';
  If ckbBalancoReducao.Checked Then sBalancoReducao := '1';

  If Trim(cbEvento.Text) = '' Then
  Begin
    ckbSituacao.OnClick(Sender);
    sSituacao := '00';
  End
  Else
    sSituacao := '0' + IntToStr(cbEvento.ItemIndex);

  If Trim(mkRecRetificada.Text) = '' Then cbkRetificada.OnClick(Sender);

  If Pos('.DEC', edtImport.Text) <= 0 Then
    edtImport.Text := edtImport.Text + '.DEC';

  try
    If not CtrlGeraDCTF.Exporta(edtImport.Text, IntToStr(Presponsavel.SubTipoReg.Id),
                                edCRCContador.Text, sUF,
                                IntToStr(PRepresentante.SubTipoReg.Id),
                                spnAnoCalendario.Text, IntToStr(cbMes.ItemIndex +1),
                                sRetificada, mkRecRetificada.Text, dtInicio.Text,
                                dtFim.Text, sSituacao, mkNatureza.Text,
                                '',  dtEvento.Text, sBalancoReducao,
                                IntToStr(cbLucro.ItemIndex),
                                IntToStr(cbQualificacao.ItemIndex +1), sLevantouBalanco,
                                sComDebitoSCP, sEsteveInativa, sComIncorporacao,
                                sObrigadaApresentacao  ) then
    Begin
      MsgDlg('Erros impediram a geração.','Aviso',mtWarning,[mbOK],0);
      exit;
    End
    Else
      MsgDlg('Arquivo gerado com sucesso.','Aviso',mtWarning,[mbOK],0);
  Except
    Raise;
  End;
end;

procedure TfrmGeraDCTF.btbtnSelecionaClick(Sender: TObject);
Var sTemp  : String;
    I      : integer;
    bbarra : Boolean;
begin
   edtImport.Text := '';

   If svDPrev.Execute then
     edtImport.Text := svDPrev.FileName;
end;

procedure TfrmGeraDCTF.cbMesChange(Sender: TObject);
begin
  inherited;
  Periodos;

  ckbSituacao.Enabled := (cbMes.Text <> '');

  If Not ckbSituacao.Checked Then
    ckbSituacao.OnClick(Sender);
end;

procedure TfrmGeraDCTF.spnAnoCalendarioChange(Sender: TObject);
begin
  inherited;
  Periodos;
end;

procedure TfrmGeraDCTF.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlGeraDCTF := TCtrlGeraDCTF.Create;
  CtrlGeraDCTF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer,
                          True,nil,nil,False);

  cdsUF.Data := CtrlGeraDCTF.ListaEstados;                          
end;

procedure TfrmGeraDCTF.ckbSituacaoClick(Sender: TObject);
begin
  inherited;

  dtEvento.Enabled                := ckbSituacao.Checked;
  lbDtEvento.Enabled              := ckbSituacao.Checked;
  cbEvento.Enabled                := ckbSituacao.Checked;
  lblEvento.Enabled               := ckbSituacao.Checked;
  cbkObrigadaApresentacao.Enabled := ckbSituacao.Checked;

  If Not ckbSituacao.Checked Then
  Begin
    dtEvento.Text := '';
    cbEvento.Text := '';
    cbkObrigadaApresentacao.Enabled := False;
  End;

  dtEvento.Date    := dtFim.Date;

  Periodos;
end;

procedure TfrmGeraDCTF.cbkRetificadaClick(Sender: TObject);
begin
  inherited;

  mkRecRetificada.Enabled := cbkRetificada.Checked;
  lbRetificadora.Enabled  := cbkRetificada.Checked;

  If Not cbkRetificada.Checked Then
    mkRecRetificada.Text := '';
end;

End.
