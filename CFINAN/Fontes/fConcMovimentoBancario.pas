{-------------------------------------------------------------------------------
-------------------------- HISTÓRICO DE ALTERAÇÕES -----------------------------
--------------------------------------------------------------------------------

 N. Chamado..: WO6342
 Data........: 02/02/2024
 Responsável.: Everson Cunha
 Descrição...: Ajuste na rotina contabil, estava acumulando no cds
--------------------------------------------------------------------------------
 N. Chamado..: SIG132872
 Data........:
 Responsável.: Cássio Florencio Rovaroto
 Descrição...: Inclusão de definição de registros financeiros a conciliar.
--------------------------------------------------------------------------------}

unit fConcMovimentoBancario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, TREdit, DBCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlMovimFinanc, uCtrlParamFinanc,
  uCtrlListTercFinanc, uCtrlHistPadrao, uCtrlFinanc, uCtrlPlanPrevContabPatro,
  CMProcuraMask, FTelaAut, uCtrlIntBanco, uCtrlTarifaBancaria, uCMMath, UDatabase,
  MontaSelect, DBTables, Wwquery;

type
  TfrmConcMovimentoBancario = class(TfrmOkCancelar)
    lblCaixaBanco: TLabel;
    lkpPortadorConta: TwwDBLookupCombo;
    dbrEntradaSaida: TDBRadioGroup;
    dbrConcilia: TDBRadioGroup;
    pnlMovBanc: TPanel;
    lblPatro: TLabel;
    lkpPatrocinadorRateio: TwwDBLookupCombo;
    lblPlanoPrev: TLabel;
    lkpPlanoPrevRateio: TwwDBLookupCombo;
    grdMovimentoBancario: TwwDBGrid;
    pnlGrdMovBanc: TPanel;
    cdsMovimFinanc: TCMClientDataSet;
    cdsPortadorForma: TCMClientDataSet;
    cdsPortadorConta: TCMClientDataSet;
    cdsHistPadrao: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    cdsPrograma: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsUnidNeg: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cds: TCMClientDataSet;
    cdsDet: TCmClientDataSet;
    cdsContab: TCMClientDataSet;
    pnlMovimFinanc: TPanel;
    dtpDataLancamento: TCMDateTimePicker;
    dtpDataDisponib: TCMDateTimePicker;
    cdsTipoRecDes: TCMClientDataSet;
    lblUnidNegoc: TLabel;
    lkpAtividade: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    lkpCentroRespon: TwwDBLookupCombo;
    lblTpDocumento: TLabel;
    lkpTipoDocumento: TwwDBLookupCombo;
    lblTipoRD: TLabel;
    lkpTipoRecebDesemb: TwwDBLookupCombo;
    lblCentCusto: TLabel;
    lkpCentroCusto: TwwDBLookupCombo;
    lblHistPadrao: TLabel;
    lkpHistPadrao: TwwDBLookupCombo;
    lkpPrograma: TwwDBLookupCombo;
    lblPrograma: TLabel;
    dbEdtHistorico: TwwDBEdit;
    dbEdtNumDocumento: TwwDBEdit;
    pnlTitMovimFinanc: TPanel;
    lblDocumento: TLabel;
    lblData: TLabel;
    lblDataDisponib: TLabel;
    lblHistorico: TLabel;
    cdsMovimBancario: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsPatrocinadora: TCMClientDataSet;
    qryAux: TwwQuery;
    qryAux1: TwwQuery;
    sql: TCMSqlParams;
    MontaSelect: TMontaSelect;
    dsMovimBancario: TDataSource;
    cdsRateioFinanc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure lkpPortadorContaChange(Sender: TObject);
    procedure lkpTipoRecebDesembChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbrEntradaSaidaChange(Sender: TObject);
  private
    { Private declarations }
    CtrlMovimFinanc: TCtrlMovimFinanc;
    CtrlListTerceiros: TCtrlListTercFinanc;
    CtrlHistPadrao: TCtrlHistPadrao;
    CtrlParamFinanc: TCtrlParamFinanc;
    CtrlFinanc : TCtrlFinanc;
    CtrlPlanPrevContabPatro: TCtrlPlanPrevContabPatro;
    CtrlIntBanco: TCtrlIntBanco;
    sIdArquivoPagto: string;
    sCodForma: string;
    sHistLancFinancContab: string;
    sContaBanco : String;
    sContaRecDesemb: string;
    sCCustoBanco : String;
    rSubContaBanco: Double;
    iIndiceBanco: Integer;
    sListaDocumento: TStringList;
    sMsg: string;
    cdsRateioDocumArq: TCMClientDataSet;
    iQtdDoc: integer;
    sCodPortForma: string;
    iCodLancFinanc: Integer;
    procedure InicializaForm;
    procedure HabilitaMovimFinanc;
    procedure GerenciaObjetos;
    function LancaMovimFinanc: Boolean;
    function MontaRateioFinanc: Boolean;
    function MontaContab : Boolean;
    function MontaMovimFinanc : Boolean;
    function FazConciliacao(pDataLancamento, pDataDisponibilidade: TDateTime;
                            pHistoricoPadrao, pCodLancFinan, pIdMoxExtratoBancario: Integer): Boolean;
    function VerificaCampos: Boolean;
  public
    { Public declarations }
    dDataLancamento: TDate;
    iIdExtratoMovBancario: Integer;
    iCodPortador: Integer;
  end;

var
  frmConcMovimentoBancario: TfrmConcMovimentoBancario;

implementation
uses DBaseDados, uSistema, uCtrlParamIntegra;

{$R *.DFM}

{ TfrmConcMovimentoBancario }

procedure TfrmConcMovimentoBancario.InicializaForm;
begin
  CtrlMovimFinanc := TCtrlMovimFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                               Sistema.IdUsuario, Sistema.UsaPlanoPatro);
  CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlListTerceiros := TCtrlListTercFinanc.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlHistPadrao := TCtrlHistPadrao.Create;
  CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlParamFinanc := TCtrlParamFinanc.Create;
  CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

  CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, True);
  CtrlFinanc.InitiAlizeAs(ParamIntegra);

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(ParamIntegra);

  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs(ParamIntegra);

  CtrlMovimFinanc.CdsMovimFinanc := cdsMovimFinanc;
  CtrlMovimFinanc.CdsRateioFinanc := cdsRateioFinanc;
  CtrlMovimFinanc.CdsContabil := cdsContab;

  cdsRateioDocumArq := TCMClientDataSet.Create(nil);

  cdsPortadorForma.Data := CtrlListTerceiros.ListPortadorForma();
  cdsPortadorConta.Data := CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa, 0);
  cdsHistPadrao.Data := CtrlHistPadrao.ListHsitoricoPadrao(0);
  cdsTipoDoc.Data := CtrlListTerceiros.ListTipoDoc('');
  cdsTipoRecDes.Data := CtrlListTerceiros.ListTipoRDxCResponFinanc(Sistema.IdEmpresa, '', 'S');
  cdsPrograma.Data := CtrlListTerceiros.ListPrograma;
  cdsCentroCusto.Data := CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa, 0, '', ParamIntegra.PlanoCentroCusto);
  cdsUnidNeg.Data := CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa, 0, 'A', '');
  cdsCentroRespon.Data := CtrlListTerceiros.ListCentroResponxUsuario(Sistema.IdEmpresa, Sistema.IdUsuario, ParamIntegra.PlanoCentroRespon);
  cdsPlanoPrev.Data := CtrlListTerceiros.ListPlanoPrev;
  cdsPatrocinadora.Data := CtrlListTerceiros.ListPatrocinador;
  cds.Data := CtrlMovimFinanc.ListMovimFinancNulo;
  cdsMovimFinanc.Data := CtrlMovimFinanc.ListMovimFinancNulo;
  cdsDet.Data := CtrlMovimFinanc.ListRateioFinancNulo;
  cdsRateioFinanc.Data := CtrlMovimFinanc.ListRateioFinancNulo;
  cdsContab.Data := CtrlMovimFinanc.ListContabil(0);

  dtpDataLancamento.Enabled := True;
  dtpDataDisponib.Enabled := True;
  grdMovimentoBancario.RedrawGrid;

  dtpDataLancamento.Date := dDataLancamento;
  iCodPortador := -1;
end;

procedure TfrmConcMovimentoBancario.FormCreate(Sender: TObject);
begin
  inherited;
  InicializaForm;
  sListaDocumento := TStringList.Create;
  iQtdDoc:= 0;
  sCodPortForma := EmptyStr;
  dDataLancamento := Now();
end;

procedure TfrmConcMovimentoBancario.HabilitaMovimFinanc;
begin
  pnlMovimFinanc.Enabled := True;
  bbtnConfirmar .Enabled := True;
  bbtnCancelar.Enabled := True;
  dtpDataDisponib.Date := dDataLancamento;
  dtpDataLancamento.Date := dDataLancamento;
  iCodLancFinanc := -1;

  { TODO : Incluir locate na conta bancária, se houver... }
  cdsMovimBancario.Data := CtrlMovimFinanc.ListMovimBancario(dDataLancamento);

  if not cdsMovimBancario.IsEmpty then
    cdsMovimBancario.Edit;

  if cdsPortadorConta.Locate('CODPORTADOR', iCodPortador, []) then
    lkpPortadorConta.Text := cdsPortadorConta.FieldByName('DESCRICAO').AsString;

  if cdsCentroRespon.Locate('NOME', 'COFIN', []) then
    lkpCentroRespon.Text:= cdsCentroRespon.FieldByName('NOME').AsString;

  if cdsCentroCusto.Locate('NOME', 'COFIN', []) then
    lkpCentroCusto.Text := cdsCentroCusto.FieldByName('NOME').AsString;

  if cdsTipoDoc.Locate('CODTIPDOC', '51', []) then
    lkpTipoDocumento.Text := cdsTipoDoc.FieldByName('DESCRICAO').AsString;

  if cdsPrograma.Locate('IDPROGRAMA', '4', []) then
    lkpPrograma.Text := cdsPrograma.FieldByName('DESCPROGRAMA').asString;
end;

procedure TfrmConcMovimentoBancario.GerenciaObjetos;
begin
  if Assigned(CtrlMovimFinanc) then
    FreeAndNil(CtrlMovimFinanc);

  if Assigned(CtrlMovimFinanc) then
    FreeAndNil(CtrlListTerceiros);

  if Assigned(CtrlHistPadrao) then
    FreeAndNil(CtrlHistPadrao);

  if Assigned(CtrlParamFinanc) then
    FreeAndNil(CtrlParamFinanc);

  if Assigned(CtrlFinanc) then
    FreeAndNil(CtrlFinanc);

  if Assigned(CtrlPlanPrevContabPatro) then
    FreeAndNil(CtrlPlanPrevContabPatro);

  if Assigned(CtrlIntBanco) then
    FreeAndNil(CtrlIntBanco);

  if not cdsMovimFinanc.IsEmpty then
   cdsMovimFinanc.EmptyDataSet;

  if not cdsDet.IsEmpty then
   cdsDet.EmptyDataSet;

  if not cdsContab.IsEmpty then
   cdsContab.EmptyDataSet;

end;

procedure TfrmConcMovimentoBancario.bbtnConfirmarClick(Sender: TObject);
var
  sMsg: PChar;
begin
  inherited;
  sHistLancFinancContab := dbEdtHistorico.Text + ' - ' + lkpPortadorConta.Text;

  if LancaMovimFinanc then
  begin
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

    if iQtdDoc > 1 then
      sMsg := 'Lançamentos realizados com sucesso.'
    else
      sMsg := 'Lançamento realizado com sucesso.';

    Application.MessageBox(sMsg, 'Informação', MB_ICONINFORMATION + MB_OK);
    GerenciaObjetos;
    InicializaForm;
  end
  else
  begin
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

    Application.MessageBox('Ocorreu um erro no lançamento .', 'Informação', MB_ICONINFORMATION + MB_OK);
  end;
end;

function TfrmConcMovimentoBancario.LancaMovimFinanc: Boolean;
var
   bResposta: Boolean;
   iCodLancFinanc, iId: Integer;
begin
  Result := True;

  if VerificaCampos then
  begin
    cdsMovimBancario.First;
    while not cdsMovimBancario.Eof do
    begin
      if cdsMovimBancario.FieldByName('SEL').asString = '1' then
      begin
        if not MontaRateioFinanc then
        begin
          Result := False;
          Application.MessageBox('Há problemas na definição do rateio do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
          Exit;
        end;

        if not MontaContab then
        begin
          Result := False;
          Application.MessageBox('Há problemas na definição dos valores de contabilização do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
          Exit;
        end;

        if not MontaMovimFinanc then
        begin
          Result := False;
          Application.MessageBox('Há problemas na definição do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
          Exit;
        end;

        cdsContab.First;
        cdsMovimFinanc.Edit;

        bResposta := CtrlMovimFinanc.GravaFinanceiro(False, opInclusao, ParamIntegra.Plano, ParamIntegra.IntegraContab, False);

        if not (bResposta)then
        begin
          Application.MessageBox(PChar(CtrlMovimFinanc.MessageInfo), 'Erro', MB_ICONERROR + MB_OK);
          Abort;
          Exit;
        end
        else
        begin
          iCodLancFinanc := CtrlMovimFinanc.codLancFinanc;
          iIdExtratoMovBancario := cdsMovimBancario.FieldByName('IDMOVEXTRATOBANCARIO').AsInteger;
          if not FazConciliacao(dtpDataLancamento.DateTime,
                                dtpDataDisponib.DateTime,
                                cdsHistPadrao.FieldByName('HISTPADFINAN').AsInteger,
                                iCodLancFinanc,
                                iIdExtratoMovBancario) then
          begin
             Result := False;
             Application.MessageBox('Houve um problema na conciliação do lançamento.', 'Erro', MB_ICONERROR +  MB_OK);
             Exit;
          end;
        end;
      end;
      Inc(iQtdDoc);
      cdsRateioFinanc.EmptyDataSet;
      cdsContab.EmptyDataSet;      //Everson Cunha - WO6342
      cdsMovimFinanc.EmptyDataSet; //Everson Cunha - WO6342
      cdsMovimBancario.Next;
    end;
  end
  else
    Result := False;
end;

function TfrmConcMovimentoBancario.MontaRateioFinanc: Boolean;
begin
  Result := True;

  try
    cdsRateioFinanc.Append;
    cdsRateioFinanc.FieldByName('UNIDNEGOC').AsInteger := cdsUnidNeg.FieldByName('UNIDNEGOC').AsInteger;
    cdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString := cdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;
    cdsRateioFinanc.FieldByName('CODTIPRECDES').AsString := cdsTipoRecDes.FieldByName('CODTIPRECDES').AsString;
    cdsRateioFinanc.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
    cdsRateioFinanc.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    cdsRateioFinanc.FieldByName('IDPROGRAMA').AsInteger := cdsPrograma.FieldByName('IDPROGRAMA').AsInteger;
    cdsRateioFinanc.FieldByName('IDPLANOPREV').AsInteger := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;
    cdsRateioFinanc.FieldByName('IDPATRO').AsInteger := cdsPatrocinadora.FieldByName('IDPESSOA').AsInteger;
    cdsRateioFinanc.FieldByName('VALOR').AsFloat := cdsMovimBancario.FieldByName('VALORLANCTO').AsFloat;

    if cdsMovimBancario.FieldByName('TIPOLANCTO').asString = 'D' then
    begin
      cdsRateioFinanc.FieldByName('RECPAG').AsString := 'P';
      cdsRateioFinanc.FieldByName('CODTIPDOC').AsInteger := cdsTipoDoc.FieldByName('CODTIPDOC').AsInteger;
    end
    else
    begin
      cdsRateioFinanc.FieldByName('RECPAG').AsString := 'R';
      cdsRateioFinanc.FieldByName('CODTIPDOC').AsInteger := 93; // Diversos
    end;

    cdsRateioFinanc.Post;
  except
    Result := False;
  end;
end;

function TfrmConcMovimentoBancario.MontaContab: Boolean;
begin
  Result := True;
  try
    cdsContab.Append;
    cdsContab.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

    if cdsMovimBancario.FieldByName('TIPOLANCTO').AsString = 'D' then
      cdsContab.FieldByName('LACDEBCRE').AsString := 'D'
    else
      cdsContab.FieldByName('LACDEBCRE').AsString := 'C';

    cdsContab.FieldByName('LACTIPO').AsString := '0';
    cdsContab.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;
    cdsContab.FieldByName('LACNUMDOC').AsString := dbEdtNumDocumento.Text;
    cdsContab.FieldByName('UNIDNEGOC').AsInteger := cdsDet.FieldByName('UNIDNEGOC').AsInteger;
    cdsContab.FieldByName('LACVALOR').AsFloat := cdsMovimBancario.FieldByName('VALORLANCTO').AsFloat;
    cdsContab.FieldByName('LACHIST1').AsString := Copy(sHistLancFinancContab, 1, 50);
    cdsContab.FieldByName('LACHIST2').AsString := Copy(sHistLancFinancContab, 51, 50);
    cdsContab.FieldByName('LACHIST3').AsString := Copy(sHistLancFinancContab, 102, 50);
    cdsContab.FieldByName('IDPLANOPREV').AsInteger := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;
    cdsContab.FieldByName('IDPATRO').AsInteger := cdsPatrocinadora.FieldByName('IDPESSOA').AsInteger;
    cdsContab.FieldByName('PLACONTA').AsString := sContaRecDesemb;
    cdsContab.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
    cdsContab.Post;

    cdsContab.Insert;
    cdsContab.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;

    if cdsMovimBancario.FieldByName('TIPOLANCTO').AsString = 'D' then
      cdsContab.FieldByName('LACDEBCRE').AsString := 'C'
    else
      cdsContab.FieldByName('LACDEBCRE').AsString := 'D';

    cdsContab.FieldByName('LACTIPO').AsString := '0';
    cdsContab.FieldByName('PLANO').AsFloat := ParamIntegra.Plano;
    cdsContab.FieldByName('LACNUMDOC').AsString := dbEdtNumDocumento.Text;
    cdsContab.FieldByName('UNIDNEGOC').AsInteger := cdsDet.FieldByName('UNIDNEGOC').AsInteger;
    cdsContab.FieldByName('LACVALOR').AsFloat := cdsMovimBancario.FieldByName('VALORLANCTO').AsFloat;
    cdsContab.FieldByName('LACHIST1').AsString := Copy(sHistLancFinancContab, 1, 50);
    cdsContab.FieldByName('LACHIST2').AsString := Copy(sHistLancFinancContab, 51, 50);
    cdsContab.FieldByName('LACHIST3').AsString := Copy(sHistLancFinancContab, 102, 50);
    cdsContab.FieldByName('IDPLANOPREV').AsInteger := cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger;
    cdsContab.FieldByName('IDPATRO').AsInteger := cdsPatrocinadora.FieldByName('IDPESSOA').AsInteger;
    cdsContab.FieldByName('PLACONTA').AsString := sContaBanco;
    cdsContab.FieldByName('CODCENTROCUSTO').AsString := sCCustoBanco;
    cdsContab.Post;
  except
    Result := False;
  end;
end;

function TfrmConcMovimentoBancario.MontaMovimFinanc: Boolean;
begin
  Result := True;
  try
    cdsMovimFinanc.Append;
    cdsMovimFinanc.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
    cdsMovimFinanc.FieldByName('HISTPADFINAN').AsInteger := cdsHistPadrao.FieldByName('HISTPADFINAN').AsInteger;
    cdsMovimFinanc.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
    cdsMovimFinanc.FieldByName('CODPORTADOR').AsInteger := cdsPortadorConta.FieldByName('CODPORTADOR').AsInteger;
    cdsMovimFinanc.FieldByName('VALORLANCFINAN').AsFloat := cdsMovimBancario.FieldByName('VALORLANCTO').AsFloat;
    cdsMovimFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat := 0;
    cdsMovimFinanc.FieldByName('NUMCHQBORDERO').AsString := dbEdtNumDocumento.Text;
    cdsMovimFinanc.FieldByName('DATALANCFINAN').AsDateTime := dtpDataLancamento.DateTime;
    cdsMovimFinanc.FieldByName('ENTRADASAIDA').asString := dbrEntradaSaida.Value;
    cdsMovimFinanc.FieldByName('HISTORICO').AsString := dbEdtHistorico.Text;
    cdsMovimFinanc.FieldByName('STATUSCONCILIA').AsString := dbrConcilia.Value;
    cdsMovimFinanc.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    cdsMovimFinanc.FieldByName('DATADISPFINANC').AsDateTime := dtpDataDisponib.DateTime;
    cdsMovimFinanc.FieldByName('CONCILIADO').AsString := 'N';
    cdsMovimFinanc.Post;
  except
    Result := False;
  end;
end;

function TfrmConcMovimentoBancario.VerificaCampos: Boolean;
begin
Result := True;
  if lkpPortadorConta.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a Conta Bancária para o lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpPortadorConta.SetFocus;
    Result := False;
    Exit;
  end;

  if dbrEntradaSaida.ItemIndex = -1 then
  begin
    Application.MessageBox('Indique o Tipo de Movimento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Result := False;
    Exit;
  end;

  if dbrConcilia.ItemIndex = -1 then
  begin
    Application.MessageBox('Indique o Status da Conciliação.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Result := False;
    Exit;
  end;

  if dbEdtNumDocumento.Text = EmptyStr then
  begin
    Application.MessageBox('Indique o número do documento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dbEdtNumDocumento.SetFocus;
    Result := False;
    Exit;
  end;

  if dtpDataLancamento.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a data do lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dtpDataLancamento.SetFocus;
    Result := False;
    Exit;
  end;

  if dtpDataDisponib.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a data de disponibilidade.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dtpDataDisponib.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpTipoDocumento.Text = EmptyStr then
  begin
    Application.MessageBox('Indique o tipo de documento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpTipoDocumento.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpTipoRecebDesemb.Text =  EmptyStr then
  begin
    Application.MessageBox('Indique o tipo de desembolso.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpTipoRecebDesemb.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpHistPadrao.Text = EmptyStr then
  begin
    Application.MessageBox('Indique um histórico padrão.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpHistPadrao.SetFocus;
    Result := False;
    Exit;
  end;

  if dbEdtHistorico.Text = EmptyStr then
  begin
    Application.MessageBox('Informe o histórico do lançamento.', 'Informação', MB_ICONINFORMATION + MB_OK);
    dbEdtHistorico.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpCentroRespon.Text = EmptyStr then
  begin
    Application.MessageBox('Indique um centro de responsabilidade.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpCentroRespon.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpCentroCusto.Text = EmptyStr then
  begin
    Application.MessageBox('Indique um centro de custo.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpCentroCusto.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpAtividade.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a atividade e/ou projeto.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpAtividade.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpPrograma.Text = EmptyStr then
  begin
    Application.MessageBox('Indique o programa.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpPrograma.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpPatrocinadorRateio.Text = EmptyStr then
  begin
    Application.MessageBox('Indique a patrocinadora.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpPatrocinadorRateio.SetFocus;
    Result := False;
    Exit;
  end;

  if lkpPlanoPrevRateio.Text = EmptyStr then
  begin
    Application.MessageBox('Indique o plano previdenciário.', 'Informação', MB_ICONINFORMATION + MB_OK);
    lkpPlanoPrevRateio.SetFocus;
    Result := False;
    Exit;
  end;

  cdsMovimBancario.First;
  while not cdsMovimBancario.Eof do
  begin
    if (cdsMovimBancario.FieldByName('SEL').asString = '1') then
    begin
      if ((cdsMovimBancario.FieldByName('TIPOLANCTO').AsString = 'D') and
         (dbrEntradaSaida.ItemIndex =  0) or
         (cdsMovimBancario.FieldByName('TIPOLANCTO').AsString = 'C') and
         (dbrEntradaSaida.ItemIndex =  1))  then
      begin
        Application.MessageBox('Há um lançamento com tipo de movimento diferente do informado.', 'Informação', MB_ICONINFORMATION + MB_OK);
        Result := False;
        Break;
      end;
    end;
    cdsMovimBancario.Next;
  end;        
end;

procedure TfrmConcMovimentoBancario.lkpPortadorContaChange(
  Sender: TObject);
begin
  inherited;
  if (Trim(lkpPortadorConta.Text) <> '') Then
  begin
    if (ParamIntegra.IntegraContab) And (Sistema.IdModulo = 9) then
    begin
      if (Trim(cdsPortadorConta.FieldByName('PLACONTA').AsString) = '') Then
      begin
        Application.MessageBox('É obrigatório preencher a conta contabil' +
                              ' desta Conta Bancária/Caixa',
                              'Erro', MB_ICONERROR + MB_OK);
        Exit;
      end;

      sContaBanco := cdsPortadorConta.FieldByName('PLACONTA').AsString;
      sCCustoBanco := cdsPortadorConta.FieldByName('CODCENTROCUSTO').AsString;
      rSubContaBanco := cdsPortadorConta.FieldByName('CODSUBCONTA').AsFloat;
    end;
  end;
end;

procedure TfrmConcMovimentoBancario.lkpTipoRecebDesembChange(
  Sender: TObject);
begin
  inherited;
  sContaRecDesemb := cdsTipoRecDes.FieldByName('PLACONTA').asString;

  if (sContaRecDesemb = EmptyStr) then
  begin
    if cdsMovimBancario.FieldByName('TIPOLANCTO').AsString = 'D' then
      sContaRecDesemb := CtrlListTerceiros.ListContaContabDesemb(cdsTipoRecDes.FieldByName('CODTIPRECDES').asString, 'P')
    else
      sContaRecDesemb := CtrlListTerceiros.ListContaContabDesemb(cdsTipoRecDes.FieldByName('CODTIPRECDES').asString, 'R')
  end;
end;

function TfrmConcMovimentoBancario.FazConciliacao(pDataLancamento, pDataDisponibilidade: TDateTime;
                                           pHistoricoPadrao, pCodLancFinan, pIdMoxExtratoBancario: Integer): Boolean;
var
  sIdLancConciliado: string;
begin
  Result :=  True;

  try
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT SEQLANCCONCILIADO.NEXTVAL SEQ FROM DUAL');
    qryAux.Open;
    sIdLancConciliado := qryAux.FieldByName('SEQ').AsString;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('UPDATE MOVIMFINANC SET CONCILIADO = ''S'' ');
    qryAux.SQL.Add(', IDLANCCONCILIADO = ' + QuotedStr(sIdLancConciliado));
    qryAux.SQL.Add(', DATACONCILIACAOBANCARIA = ' + QuotedStr(DateToStr(pDataLancamento)));

    if (pHistoricoPadrao In [14, 19, 20]) and (pDataLancamento > pDataDisponibilidade) then
    begin
      qryAux.SQL.Add(', SITBLOQUEIOLANC = 1 ');
      qryAux.SQL.Add(', DATADESBLOQUEIO = NULL ');
    end;

    qryAux.SQL.Add('WHERE CODLANCFINANC = ' + IntToStr(pCodLancFinan));

    if not qryAux.Prepared then
      qryAux.Prepare;

    qryAux.ExecSQL;

    qryAux1.Close;
    qryAux1.SQL.Clear;
    qryAux1.SQL.Add('UPDATE MOVEXTRATOBANCARIO SET CONCILIADO = ''S'' ');
    qryAux1.SQL.Add(', IDLANCCONCILIADO = ' + QuotedStr(sIdLancConciliado));

    if (pHistoricoPadrao In [14, 19, 20]) and (pDataLancamento > pDataDisponibilidade) then
      qryAux1.SQL.Add(', SITBLOQUEIOLANC = 1 ');

    qryAux1.SQL.Add('WHERE IDMOVEXTRATOBANCARIO = ' + IntToStr(pIdMoxExtratoBancario));

    if Not qryAux1.Prepared then
      qryAux1.Prepare;
    qryAux1.ExecSQL;
  except
    Result := False;
  end;
end;

procedure TfrmConcMovimentoBancario.bbtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente cancelar o lançamento?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
    inherited;
end;

procedure TfrmConcMovimentoBancario.bbtnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente encerrar a funcionalidade?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      GerenciaObjetos
  else
    Exit;

  inherited;
end;

procedure TfrmConcMovimentoBancario.FormShow(Sender: TObject);
begin
  inherited;
  HabilitaMovimFinanc;
end;

procedure TfrmConcMovimentoBancario.dbrEntradaSaidaChange(Sender: TObject);
begin
  inherited;
  cdsTipoRecDes.Filtered := False;
  cdsTipoRecDes.Filter := EmptyStr;

  if dbrEntradaSaida.ItemIndex = 0 then
    cdsTipoRecDes.Filter := ' RECPAG =  ''R'''
  else
    cdsTipoRecDes.Filter := ' RECPAG =  ''P''';

  cdsTipoRecDes.Filtered := True;
end;

end.
