unit FEntSuplemenEspecialMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbedit, TREdit, Mask, Wwdbspin, Spin, Db, DBTables, Wwquery,
  MontaSelect, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar, DBCtrls,
  IvDictio, IvMulti, IvEMulti, wwdblook, CMDBLookupCombo, CMProcuraMask,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlAlterorcamento,
  uCtrlSaldoorcado, uCtrlCompromisso, uCtrlResxcomp, wwdbdatetimepicker,
  CMDateTimePicker, uCMTypes;

type
  TfrmEntSuplemenEspecialMT = class(TfrmOkCancelar)
    dbgrdConta: TwwDBGrid;
    dsConta: TwwDataSource;
    pnlValores: TPanel;
    Label6: TLabel;
    Label12: TLabel;
    redValor: TRealEdit;
    Panel1: TPanel;
    lblCodigoConta: TLabel;
    dbeCodigoGrupo: TEdit;
    bbtnBuscaGrupo: TBitBtn;
    lblNome: TLabel;
    edtNomeGrupo: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    dblcPlanoParamConta: TwwDBLookupCombo;
    Label23: TLabel;
    dblcPatroParamConta: TwwDBLookupCombo;
    Label3: TLabel;
    edtCentroResp: TEdit;
    MontaSelectGrupo: TMontaSelect;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    SqlPlano: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPatrocinadora: TCMSqlParams;
    cdsPatrocinadora: TCMClientDataSet;
    sqlConta: TCMSqlParams;
    cdsConta: TCMClientDataSet;
    bbtnCCusto: TBitBtn;
    cdsContaIDCONTAORCAMEN: TStringField;
    cdsContaCODCENTRORESPON: TStringField;
    cdsContaNOME: TStringField;
    cdsContaCODCENTROCUSTO: TStringField;
    cdsContaDATAR: TDateTimeField;
    edtCCusto: TEdit;
    Label1: TLabel;
    cdsProxSuplemen: TCMClientDataSet;
    dbeDataRef: TCMDateTimePicker;
    Label2: TLabel;
    redSaldo: TRealEdit;
    sqlPlanoTrabalho: TCMSqlParams;
    cdsPlanoTrabalho: TCMClientDataSet;
    dblcPlanoTrabalho: TwwDBLookupCombo;
    cdsContaVLRSOLICITADO: TCurrencyField;
    cdsContaCRESP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ZeraConta(Sender: TObject);
    procedure dbeCodigoGrupoExit(Sender: TObject);
    procedure dblcPlanoParamContaExit(Sender: TObject);
    procedure dblcPatroParamContaExit(Sender: TObject);
    procedure bbtnBuscaGrupoClick(Sender: TObject);
    procedure bbtnCCustoClick(Sender: TObject);
    procedure sqlContaFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure dbgrdContaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdContaTopRowChanged(Sender: TObject);
    procedure dbgrdContaEnter(Sender: TObject);
    procedure cdsContaBeforeScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CancelarOp(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbeDataRefChange(Sender: TObject);
    procedure dblcPlanoTrabalhoExit(Sender: TObject);
    procedure cdsContaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    iGrupo, iUnid, iPPrev, iPatro: integer;
    iConta: string;
    CtrlAlterorcamento: TCtrlAlterorcamento;
    CtrlSaldoorcado: TCtrlSaldoorcado;
  public
    { Public declarations }
  end;

var
  frmEntSuplemenEspecialMT: TfrmEntSuplemenEspecialMT;
  iGrupoAnt : LongInt;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, uString, UData, UCtrlOrcamento;

{$R *.DFM}

procedure TfrmEntSuplemenEspecialMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Inicializa variáveis
  iUnid := 0;
  iPPrev := -1;
  iPatro := -1;
  CtrlAlterorcamento := TCtrlAlterorcamento.Create;
  CtrlSaldoorcado := TCtrlSaldoorcado.Create;
  CtrlAlterorcamento.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );

  //Seleciona Unidades de Negócio
  with sqlPlanoTrabalho do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
    Open;
   end;
   with sqlPlano do begin
     Prepare;
     Open;
   end;
   with sqlPatrocinadora do begin
     Prepare;
     Open;
   end;
end;

procedure TfrmEntSuplemenEspecialMT.ZeraConta(Sender: TObject);
begin
  edtCCusto.Text := '';
  dbeDataRef.Text := '';
  redValor.Value := 0;
  redSaldo.Value := 0;
  dbeDataRef.Color := clBtnFace;
  dbeDataRef.ReadOnly := True;
  dbeDataRef.TabStop := False;
  redValor.Color := clBtnFace;
  redValor.ReadOnly := True;
  redValor.TabStop := False;
  if cdsConta.State in [dsEdit] then cdsConta.Cancel;
  cdsConta.Close;
  if Trim(dbeCodigoGrupo.Text) = '' then bbtnCCusto.Enabled := False;
end;

procedure TfrmEntSuplemenEspecialMT.dbeCodigoGrupoExit(Sender: TObject);
begin
  inherited;
  if dbeCodigoGrupo.text <> '' then begin
    with sqlGrupo do begin
      cdsGrupo.Close;
      Prepare;
      ParamByName('CODGRUPOORC').AsString := dbeCodigoGrupo.Text;
      Open;
    end;
    if cdsGrupo.IsEmpty then begin
      edtNomeGrupo.Clear;
      iGrupo         := -1;
      if dbeCodigoGrupo.CanFocus then dbeCodigoGrupo.SetFocus;
    end else begin
      with cdsGrupo do begin
        edtNomeGrupo.Text  := FieldByName('NOMEGRUPOORCAMEN').AsString;
        iGrupo             := FieldByName('IDGRUPOORCAMEN').AsInteger;
        bbtnCCusto.Enabled := True;
      end;
    end;
  end else begin
    edtNomeGrupo.Clear;
    iGrupo         := -1;
  end;
end;

procedure TfrmEntSuplemenEspecialMT.dblcPlanoParamContaExit(
  Sender: TObject);
begin
  inherited;
  if Trim(dblcPlanoParamConta.Text) <> '' then
    iPPrev := cdsPlano.FieldByName('IDPLANOPREV').AsInteger
  else
    iPPrev := -1;
end;

procedure TfrmEntSuplemenEspecialMT.dblcPatroParamContaExit(
  Sender: TObject);
begin
  inherited;
  if Trim(dblcPatroParamConta.Text) <> '' then
    iPatro := cdsPatrocinadora.FieldByName('IDPESSOA').AsInteger
  else
    iPatro := -1;
end;

procedure TfrmEntSuplemenEspecialMT.bbtnBuscaGrupoClick(Sender: TObject);
begin
  inherited;
  //Busca o Grupo Orçamentário
  MontaSelectGrupo.Executar;
  if MontaSelectGrupo.RetornouValor then begin
    ZeraConta(Sender);
    dbeCodigoGrupo.text := MontaSelectGrupo.ValoresChave[0];
    edtNomeGrupo.text  := MontaSelectGrupo.ValoresChave[2];
    iGrupo := StrToInt(MontaSelectGrupo.ValoresChave[3]);
    bbtnCCusto.Enabled := True;
  end;
end;

procedure TfrmEntSuplemenEspecialMT.bbtnCCustoClick(Sender: TObject);
begin
  inherited;
  //Faz a verificação do preenchimento dos campos e traz centros de custos
  with sqlConta do begin
    cdsConta.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := modulo.iPlanoOrc;
    ParamByName('IDPESSOAACESSO').AsInteger := sistema.IdUsuario;
    ParamByName('IDPESSOA').AsInteger       := sistema.idEmpresa;
    ParamByName('IDGRUPOORCAMEN').AsInteger := iGrupo;
    if iUnid = 0 then
      ParamByName('UNIDNEGOC').AsString    := '(C.UNIDNEGOC Is Null) AND '
    else
      ParamByName('UNIDNEGOC').AsString    := '(C.UNIDNEGOC = ' +
                                              IntToStr(iUnid) + ') AND ';
    if iPPrev = -1 then
      ParamByName('IDPLANOPREV').AsString  := '(C.IDPLANOPREV Is Null) AND '
    else
      ParamByName('IDPLANOPREV').AsString  := '(C.IDPLANOPREV = ' +
                                              IntToStr(iPPrev) + ') AND ';
    if iPatro = -1 then
      ParamByName('IDPATRO').AsString      := '(C.IDPATRO Is Null)'
    else
      ParamByName('IDPATRO').AsString      := '(C.IDPATRO = ' +
                                              IntToStr(iPatro) + ')';
    ParamByName('DATAREFERENCIA').AsString := 'TO_DATE(''' +
                                              FormatDateTime('dd/mm/yyyy',date)
                                              + ''',''DD/MM/YYYY'') AS DATAR ';
    Open;
  end;
  if (cdsConta.IsEmpty) then begin
    MsgDlg('Grupo, Atividade, Plano ou Patrocinadora com valor incompatível.',
           'Erro',mtError,[mbOk],0);
    if dbeCodigoGrupo.CanFocus then dbeCodigoGrupo.SetFocus;
    exit;
  end else begin
    with cdsConta do begin
      First;
      iConta := FieldByName('IDCONTAORCAMEN').AsString;
      edtCentroResp.text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                            FieldByName('CODCENTRORESPON').AsString) + ' - '
                            + FieldByName('CRESP').AsString;
    end;
  end;
end;

procedure TfrmEntSuplemenEspecialMT.sqlContaFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'UNIDNEGOC') or (sParamName = 'IDPLANOPREV') or
     (sParamName = 'IDPATRO') or (sParamName = 'DATAREFERENCIA') then
    sNewValue := sOldValue;
end;

procedure TfrmEntSuplemenEspecialMT.dbgrdContaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  //Faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then begin
    if not Highlight then begin
      if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
        ABrush.color := clwhite
      end else begin
        ABrush.Color := $00C0FFFF; //Amarelo Bebê
      end;
    end;
  end else begin
    ABrush.Color := clHighLight;
    AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmEntSuplemenEspecialMT.dbgrdContaTopRowChanged(
  Sender: TObject);
begin
  inherited;
  //Acerta as cores quando muda a linha da grid
  dbgrdConta.invalidate;
end;

procedure TfrmEntSuplemenEspecialMT.dbgrdContaEnter(Sender: TObject);
begin
  inherited;
  if cdsConta.State in [dsEdit] then cdsConta.Cancel;
  edtCCusto.Text := cdsConta.FieldByName('NOME').AsString;
  dbeDataRef.Text := cdsConta.FieldByName('DATAR').AsString;
  redValor.Value := cdsConta.FieldByName('VLRSOLICITADO').AsFloat;
  redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                    cdsConta.FieldByName('IDCONTAORCAMEN').asString,
                    FormatDateTime('dd/mm/yyyy',
                    cdsConta.FieldByName('DATAR').asDateTime),
                    modulo.sTipoSaldo);
  dbeDataRef.Color := clWhite;
  dbeDataRef.ReadOnly := False;
  dbeDataRef.TabStop := True;
  redValor.Color := clWhite;
  redValor.ReadOnly := False;
  redValor.TabStop := True;
end;

procedure TfrmEntSuplemenEspecialMT.cdsContaBeforeScroll(
  DataSet: TDataSet);
begin
  inherited;
  if cdsConta.State in [dsEdit] then cdsConta.Cancel;
end;

procedure TfrmEntSuplemenEspecialMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  CancelarOp(Sender);
end;

procedure TfrmEntSuplemenEspecialMT.CancelarOp(Sender: TObject);
begin
  dbeCodigoGrupo.Text := '';
  edtNomeGrupo.Text := '';
  dblcPlanoTrabalho.Text := '';
  dblcPlanoParamConta.Text := '';
  dblcPatroParamConta.Text := '';
  edtCentroResp.Text := '';
  ZeraConta(Sender);
  dbeCodigoGrupo.SetFocus;
end;

procedure TfrmEntSuplemenEspecialMT.bbtnConfirmarClick(Sender: TObject);
var iIdAlterorcamento, iIdPessoa, iExercicio, iPeriodo, iIdPlanoOrcamen,
    iNumAlteracao : integer;
    sIdContaOrcamen, sDataReferencia, sObsAlterOrcamen: string;
    dVlrSuplemen: real;
    bgravou: boolean;
begin
  inherited;
  // inicializa variáveis
  sIdContaOrcamen := cdsConta.FieldByName('IDCONTAORCAMEN').AsString;
  sDataReferencia := FormatDateTime('dd/mm/yyyy',dbeDataRef.Date);
  sObsAlterOrcamen := '';
  iIdAlterorcamento := CtrlAlterorcamento.LerUltimaSequencia;
  iIdPessoa := sistema.idEmpresa;
  iExercicio := Year(dbeDataRef.Date);
  iPeriodo := OrcamentoBackMT.EncontraPeriodo(sDataReferencia);
  iIdPlanoOrcamen := Modulo.iPlanoOrc;
  bgravou := True;
  cdsConta.FieldByName('DATAR').AsDateTime := dbeDataRef.Date;
  cdsConta.FieldByName('VLRSOLICITADO').AsFloat := redValor.Value;
  cdsConta.Post;
  if cdsConta.FieldByName('VLRSOLICITADO').AsFloat > 0 then begin
    with cdsProxSuplemen do begin
      Close;
      Data := CtrlAlterorcamento.ProxSuplemen(Sistema.idEmpresa);
      iNumAlteracao := FieldByName('PROXIMA').asInteger + 1;
    end;

    dVlrSuplemen := cdsConta.FieldByName('VLRSOLICITADO').AsFloat;
    try
      CtrlSaldoorcado.StartTransactionOrc;
      //Atualiza a tabela de Saldos com o Valor do Saldo Suplementado
      if OrcamentoBackMT.VerificaSaldo(iIdPlanoOrcamen,sIdContaOrcamen,
         sDataReferencia) then begin
        CtrlSaldoorcado.AtualizaSaldo(iIdPlanoOrcamen,iIdPessoa,
                        sIdContaOrcamen,sDataReferencia,dVlrSuplemen);
      end else begin
        CtrlSaldoorcado.InsereSaldo(iExercicio,iPeriodo,iIdPlanoOrcamen,
                        iIdPessoa,sIdContaOrcamen,sDataReferencia,
                        dVlrSuplemen,0,0,0,0,0);
      end;
      //Insere Compromisso
      CtrlAlterorcamento.CriaSuplementacao(iIdAlterorcamento, iNumAlteracao,
                         iIdPlanoOrcamen, iIdPessoa, iExercicio, iPeriodo,
                         sIdContaOrcamen, sDataReferencia, sObsAlterOrcamen,
                         dVlrSuplemen);
      CtrlSaldoorcado.CommitOrc;
    except
      CtrlSaldoorcado.RollBackOrc;
      bgravou := False;
    end;
    if bgravou then
      MsgDlg('Suplementação efetuada com sucesso.','Aviso',mtWarning,[mbOk],0)
    else
      MsgDlg('Foram detectados problemas na realização da Suplementação.',
             'Aviso',mtWarning,[mbOk],0);
  end else begin
    MsgDlg('Valor da Suplementação igual a ZERO. Suplementação não realizada.',
           'Aviso',mtWarning,[mbOk],0);
  end;
end;

procedure TfrmEntSuplemenEspecialMT.dbeDataRefChange(Sender: TObject);
begin
  inherited;
  if dbeDataRef.Focused then begin
    redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                      cdsConta.FieldByName('IDCONTAORCAMEN').asString,
                      FormatDateTime('dd/mm/yyyy',dbeDataRef.Date),
                      modulo.sTipoSaldo);
  end;
end;

procedure TfrmEntSuplemenEspecialMT.dblcPlanoTrabalhoExit(
  Sender: TObject);
begin
  inherited;
  if Trim(dblcPlanoTrabalho.Text) <> '' then
    iUnid := cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsInteger
  else
    iUnid := 0;
end;

procedure TfrmEntSuplemenEspecialMT.cdsContaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if dbgrdConta.Focused then dbgrdContaEnter(Self);
end;

end.
