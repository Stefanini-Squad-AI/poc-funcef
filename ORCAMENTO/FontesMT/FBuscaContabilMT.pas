{******************************************************************************}
{* Marcio Motta - 01/04/2005 - 17570                                          *}
{*                                                                            *}
{******************************************************************************}


unit FBuscaContabilMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Spin, Db, DBTables,
  Wwquery, ComCtrls, Mask, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb, TREdit,
  MontaSelect, DBClient, uCMClientDataSet, uCmSqlParams, 
  uCtrlSaldoOrcado, uCMTypes;

type
  TfrmBuscaContabilMT = class(TfrmSairAjuda)
    lblExercicio: TLabel;
    spnedExercicio: TSpinEdit;
    bbtnEfetiva: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pbAguarde: TProgressBar;
    gbPeriodo: TGroupBox;
    dblcPeriodoIni: TCMDBLookupCombo;
    dblcPeriodoFim: TCMDBLookupCombo;
    lblDestino: TLabel;
    lblOrigem: TLabel;
    gbParametros: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    edConteudo1: TEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    edConteudo2: TEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    edConteudo3: TEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    edConteudo4: TEdit;
    MontaSelect: TMontaSelect;
    cbCenarios: TCheckBox;
    pcSaldoAnterior: TPageControl;
    tbsSaldoAnterior: TTabSheet;
    tbsSaldoAnteriorEsp: TTabSheet;
    cbBuscaSaldoAnterior: TCheckBox;
    Label3: TLabel;
    dblcPeriodoLimite: TCMDBLookupCombo;
    Label1: TLabel;
    edtCodigoConta: TEdit;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    Label4: TLabel;
    edtCodigoContaDe: TEdit;
    bbtnBuscaContaDe: TBitBtn;
    edtNomeContaDe: TEdit;
    Label6: TLabel;
    edtCodigoContaPara: TEdit;
    bbtnBuscaContaPara: TBitBtn;
    edtNomeContaPara: TEdit;
    lblHoraIni: TLabel;
    lblHoraFim: TLabel;
    bbtnCancelar: TBitBtn;
    Label8: TLabel;
    sqlPeriodoIni: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    sqlParamOrc: TCMSqlParams;
    cdsParamOrc: TCMClientDataSet;
    cdsComposicao: TCMClientDataSet;
    cdsSaldos: TCMClientDataSet;
    sqlPlanoData: TCMSqlParams;
    cdsPlanoData: TCMClientDataSet;
    sqlPeriodoLim: TCMSqlParams;
    cdsPeriodoLim: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    cdsContabilidade: TCMClientDataSet;
    cdsCenario: TCMClientDataSet;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    cdsContasOrcamen: TCMClientDataSet;
    edtLegenda: TEdit;
    edtPosicao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sqlContasOrcamenFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlContabilidadeFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlAuxFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlSaldosFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure spnedExercicioExit(Sender: TObject);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure edtCodigoContaDeExit(Sender: TObject);
    procedure bbtnBuscaContaDeClick(Sender: TObject);
    procedure edtCodigoContaParaExit(Sender: TObject);
    procedure bbtnBuscaContaParaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnEfetivaClick(Sender: TObject);
    procedure edtLegendaChange(Sender: TObject);
    procedure edtPosicaoChange(Sender: TObject);
  private

    { Private declarations }
    CtrlSaldoOrcado: TCtrlSaldoOrcado;
    HoraInicio     : TDateTime;

  public
    { Public declarations }
  end;

Var
  frmBuscaContabilMT : TfrmBuscaContabilMT;
  bCancelado       : Boolean;

implementation

{$R *.DFM}

Uses uMensErro, uDataBase, uSistema, uModulo, uString,
     uCtrlOrcamento, dBaseDados;

procedure TfrmBuscaContabilMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlSaldoOrcado    := TCtrlSaldoOrcado.Create;
  CtrlSaldoOrcado.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlSaldoOrcado.CdsCenario       := CdsCenario;
  CtrlSaldoOrcado.CdsSaldos        := CdsSaldos;
  CtrlSaldoOrcado.CdsContasOrcamen := CdsContasOrcamen;
  CtrlSaldoOrcado.CdsComposicao    := CdsComposicao;
  CtrlSaldoOrcado.CdsPeriodo       := CdsPeriodo;
  CtrlSaldoOrcado.CdsContabilidade := CdsContabilidade;
  CtrlSaldoOrcado.CdsAux           := CdsAux;

  CtrlSaldoOrcado.EdtLegenda := EdtLegenda;
  CtrlSaldoOrcado.EdtPosicao := EdtPosicao;
  CtrlSaldoOrcado.pbAguarde  := pbAguarde;

  CtrlSaldoOrcado.IdEmpresa  := Sistema.IdEmpresa;
  CtrlSaldoOrcado.PlanoOrc   := modulo.iPlanoOrc;

  MontaSelect.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                         IntToStr(modulo.iPlanoOrc));
  MontaSelect.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                         'CODCENTRORESPON FROM PESSOAXCRESP WHERE ' +
                         'IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+')');
end;

procedure TfrmBuscaContabilMT.FormActivate(Sender: TObject);
var sDataIni: string;
    iExercicio: integer;
begin
  inherited;

  cdsCenario.Data := CtrlSaldoOrcado.AbreCenario;

  sDataini    := FormatDateTime ('dd/mm/yyyy',date);
  iExercicio  := StrToInt(copy(sDataini,7,4));
  spnedExercicio.value := iExercicio;
  cdsPeriodoIni.Close;
  sqlPeriodoIni.Prepare;
  sqlPeriodoIni.ParamByName('PESSOA').AsInteger := Sistema.idEmpresa;
  sqlPeriodoIni.ParamByName('EXERCICIO').AsInteger := iExercicio;
  sqlPeriodoIni.Open;
  cdsPeriodoFim.Close;
  sqlPeriodoFim.Prepare;
  sqlPeriodoFim.ParamByName('PESSOA').AsInteger := Sistema.idEmpresa;
  sqlPeriodoFim.ParamByName('EXERCICIO').AsInteger := iExercicio;
  sqlPeriodoFim.Open;
  cdsPeriodoLim.Close;
  sqlPeriodoLim.Prepare;
  sqlPeriodoLim.ParamByName('PESSOA').AsInteger := Sistema.idEmpresa;
  sqlPeriodoLim.ParamByName('EXERCICIOANT').AsInteger := iExercicio - 1;
  sqlPeriodoLim.Open;
  cdsParamOrc.Close;
  sqlParamOrc.Prepare;
  sqlParamOrc.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  sqlParamOrc.Open;
  edtCodigoConta.Text := cdsParamOrc.FieldByName('IDCONTAORCRESULT').AsString;
  edtCodigoContaDe.Text := cdsParamOrc.FieldByName('IDCONTAORCDE').AsString;
  edtCodigoContaPara.Text := cdsParamOrc.FieldByName('IDCONTAORCPARA').AsString;
end;

procedure TfrmBuscaContabilMT.sqlContasOrcamenFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  sNewValue := sOldValue;
end;

procedure TfrmBuscaContabilMT.sqlContabilidadeFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  sNewValue := sOldValue;
end;

procedure TfrmBuscaContabilMT.sqlAuxFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  sNewValue := sOldValue;
end;

procedure TfrmBuscaContabilMT.sqlSaldosFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  sNewValue := sOldValue;
end;

procedure TfrmBuscaContabilMT.spnedExercicioExit(Sender: TObject);
begin
  inherited;
  cdsPeriodoIni.Close;
  sqlPeriodoIni.Prepare;
  sqlPeriodoIni.ParamByName('PESSOA').AsInteger    := Sistema.idEmpresa;
  sqlPeriodoIni.ParamByName('EXERCICIO').AsInteger := Trunc(spnedExercicio.Value);
  sqlPeriodoIni.Open;
  cdsPeriodoFim.Close;
  sqlPeriodoFim.Prepare;
  sqlPeriodoFim.ParamByName('PESSOA').AsInteger    := Sistema.idEmpresa;
  sqlPeriodoFim.ParamByName('EXERCICIO').AsInteger := Trunc(spnedExercicio.Value);
  sqlPeriodoFim.Open;
  cdsPeriodoLim.Close;
  sqlPeriodoLim.Prepare;
  sqlPeriodoLim.ParamByName('PESSOA').AsInteger       := Sistema.idEmpresa;
  sqlPeriodoLim.ParamByName('EXERCICIOANT').AsInteger := Trunc(spnedExercicio.Value) - 1;
  sqlPeriodoLim.Open;
end;

procedure TfrmBuscaContabilMT.edtCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoConta.Text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc, edtCodigoConta.Text,
       true, false, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
       sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then begin
      edtNomeConta.Text := sNomeConta;
    end else begin
      edtCodigoConta.Text := '';
      edtNomeConta.Text   := '';
    end;
  end;
end;

procedure TfrmBuscaContabilMT.bbtnBuscaContaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelect.ValoresChave[1], true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtCodigoConta.Text := MontaSelect.ValoresChave[1];
      edtNomeConta.Text   := sNomeConta;
    end else begin
      edtCodigoConta.Text := '';
      edtNomeConta.Text   := '';
    end;
  end;
end;

procedure TfrmBuscaContabilMT.edtCodigoContaDeExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoContaDe.Text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       edtCodigoContaDe.Text, true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtNomeContaDe.Text := sNomeConta;
    end else begin
      edtCodigoContaDe.Text := '';
      edtNomeContaDe.Text   := '';
    end;
  end;
end;

procedure TfrmBuscaContabilMT.bbtnBuscaContaDeClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelect.ValoresChave[1], true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtCodigoContaDe.Text := MontaSelect.ValoresChave[1];
      edtNomeContaDe.Text   := sNomeConta;
    end else begin
      edtCodigoContaDe.Text := '';
      edtNomeContaDe.Text   := '';
    end;
  end;
end;

procedure TfrmBuscaContabilMT.edtCodigoContaParaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoContaPara.Text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       edtCodigoContaPara.Text, true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtNomeContaPara.Text := sNomeConta;
    end else begin
      edtCodigoContaPara.Text := '';
      edtNomeContaPara.Text   := '';
    end;
  end;
end;

procedure TfrmBuscaContabilMT.bbtnBuscaContaParaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo, sNomeGrupo,
    sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelect.ValoresChave[1], true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtCodigoContaPara.Text := MontaSelect.ValoresChave[1];
      edtNomeContaPara.Text   := sNomeConta;
    end else begin
      edtCodigoContaPara.Text := '';
      edtNomeContaPara.Text   := '';
    end;
  end;
end;
//************************************************
Procedure TfrmBuscaContabilMT.bbtnEfetivaClick(Sender: TObject);
begin
  inherited;

  if (Trim(dblcPeriodoIni.Text) = '') or (Trim(dblcPeriodoFim.Text) = '') then
     begin
    if Trim(dblcPeriodoIni.Text) = '' then begin
      MsgDlg('Obrigatório indicar o Período Inicial.','Aviso',mtWarning,
             [mbOk],0);
      dblcPeriodoIni.SetFocus;
      exit;
    end;
    if Trim(dblcPeriodoFim.Text) = '' then begin
      MsgDlg('Obrigatório indicar o Período Final.','Aviso',mtWarning,[mbOk],0);
      dblcPeriodoFim.SetFocus;
      exit;
    end;
  end else begin
    if StrToInt(dblcPeriodoFim.LookupValue) < StrToInt(dblcPeriodoIni.LookupValue) then begin
      MsgDlg('Período Final não pode ser menor que o Período Inicial.','Aviso',
             mtWarning,[mbOk],0);
      dblcPeriodoFim.SetFocus;
      exit;
    end;
  end;

  bCancelado         := False;
  EdtLegenda.Tag     := 0;
  EdtLegenda.Visible := True;
  EdtPosicao.Visible := True;
  pbAguarde.Position := 1;
  lblHoraFim.Caption := 'Hora Fim   : ';
  HoraInicio         := Now;
  lblHoraIni.Caption := 'Hora Início: ' + FormatDateTime('hh:nn:ss',Now);

  If ( CtrlSaldoOrcado.EfetivaClick( edtCodigoConta.Text,
                                     edtCodigoContaDe.Text,
                                     edtCodigoContaPara.Text,
                                     dblcPeriodoIni.Text,
                                     EdConteudo1.Text,
                                     EdConteudo2.Text,
                                     EdConteudo3.Text,
                                     EdConteudo4.Text,
                                     sePosIni1.Value,
                                     sePosIni2.Value,
                                     sePosIni3.Value,
                                     sePosIni4.Value,
                                     sePosFim1.Value,
                                     sePosFim2.Value,
                                     sePosFim3.Value,
                                     sePosFim4.Value,
                                     spnedExercicio.Value,
                                     dblcPeriodoIni.LookupValue,
                                     dblcPeriodoFim.LookupValue,
                                     cbCenarios.Checked,
                                     cbBuscaSaldoAnterior.Checked ,
                                     dblcPeriodoLimite.Text,
                                     dblcPeriodoLimite.LookUpValue ) ) Then Begin

    MsgDlg('Atualizações Efetuadas com Sucesso', 'Aviso', mtWarning, [mbOk], 0);

  End Else Begin

    MsgDlg('Atualizações Não Efetuadas', 'Erro', mtError, [mbOk], 0);
  End;

  lblHoraFim.Caption := 'Hora Fim: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',Now);
  EdtLegenda.Text    := '';
  EdtPosicao.Text    := '';
  EdtLegenda.Visible := False;
  EdtPosicao.Visible := False;
End;
//************************************************
Procedure TfrmBuscaContabilMT.edtLegendaChange(Sender: TObject);
Begin

  EdtLegenda.Repaint;
End;
//************************************************
Procedure TfrmBuscaContabilMT.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  bCancelado := True;
  edtLegenda.Tag := -1;
  edtLegenda.Text := 'Encerrando tarefa';
End;
//************************************************
Procedure TfrmBuscaContabilMT.edtPosicaoChange(Sender: TObject);
Begin
  Inherited;

  lblHoraFim.Caption := 'Hora Fim:    ' + FormatDateTime( 'dd/mm/yyyy hh:mm:ss', Now + ( ( ( Now - HoraInicio ) / pbAguarde.Position ) ) * ( pbAguarde.Max - pbAguarde.Position ) ) + ' (estimado)';
  Application.ProcessMessages;
End;
//************************************************
End.
