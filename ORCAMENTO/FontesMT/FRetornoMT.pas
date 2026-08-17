unit FRetornoMT;
// data : 27/10/2003 - André Tavares - pendência 14009

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ComCtrls, wwriched, Mask, wwdbedit,
  StdCtrls, TREdit, ExtCtrls, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, IvDictio, IvMulti, IvEMulti, 
  ppPrvDlg, ppForms, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet,
  uCtrlAlterorcamento, uCtrlSaldoorcado, uCMTypes, uCmSqlParams,
  uCtrlPeriodoOrcamen, uFuncoesOrcamento;

type
  TfrmRetornoMT = class(TFrmCadastroMT)
    MontaSelectConta: TMontaSelect;
    lblCodigoConta: TLabel;
    lblNome: TLabel;
    lblDataIni: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    bbtnBuscaConta: TBitBtn;
    dbeDataRef: TCMDateTimePicker;
    dbrValor: TDBRealEdit;
    dbrReservaNum: TDBRealEdit;
    Label11: TLabel;
    Label12: TLabel;
    redSaldo: TRealEdit;
    dbmemObs: TDBMemo;
    edtNomeConta: TEdit;
    edtCentroResp: TEdit;
    edtGrupo: TEdit;
    dbeCodigoConta: TwwDBEdit;
    cdsProxSuplemen: TCMClientDataSet;
    bbtnImprime: TToolbarButton97;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    function  VerificaPreenchimento: boolean;
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnImprime2Click(Sender: TObject);
    procedure dbeCodigoContaExit(Sender: TObject);
    procedure dbeDataRefExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure ImprimirRetorno;
    procedure bbtnImprimeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private
    { Private declarations }
    CtrlAlterorcamento : TCtrlAlterorcamento;
    CtrlSaldoorcado    : TCtrlSaldoorcado;

    CtrlPeriodoorcamen : TCtrlPeriodoOrcamen;

  public
    { Public declarations }
  end;

var
  frmRetornoMT: TfrmRetornoMT;
  sDataRef1, sCodConta, sContaAnt : String;
  rValor, rValorAnt : Double;


implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
  uCtrlOrcamento, ppTypes, rRetorno;

{$R *.DFM}


procedure TfrmRetornoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  bbtnImprime.enabled := false;
  edtNomeConta.text  := '';
  edtCentroResp.text := '';
  edtGrupo.text      := '';
end;

procedure TfrmRetornoMT.CmeCadastroDelete(Sender: TObject);
begin
  sCodConta := dbeCodigoConta.text;
  sDataRef1 := dbeDataRef.Text;
  rValor    := dbrValor.value;
  inherited;
end;

procedure TfrmRetornoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dbeDataRef.CanFocus then dbeDataRef.SetFocus;

  rValorAnt := cds.FieldByName('VLRSOLICITADO').AsFloat;
  sContaAnt := cds.FieldByName('IDCONTAORIGEM').AsString;
end;

function TfrmRetornoMT.VerificaPreenchimento: boolean;
var sDataRef : string;
    iPeriodo : integer;
begin
  if (frmRetornoMT.CmeCadastro.Operacao in [opInserir, opAlterar]) then begin
    //Inicializa as variáveis
    sDataRef       := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
    iPeriodo       := OrcamentoBackMT.EncontraPeriodo(sDataRef);
    //Faz a verificação do preenchimento dos campos
    if (dbeCodigoConta.text = '') then begin
      MsgDlg('Código da Conta não informado.','Erro',mtError,[mbOk],0);
      if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
      result := false;
      exit;
    end;
    if (dbeDataRef.Text = '') then begin
      MsgDlg('Data de Referência não informada.','Erro',mtError,[mbOk],0);
      if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
      result := false;
      exit;
    end;
    if iPeriodo = 0 then begin
      MsgDlg('Não existe um Período ou Exercício para a Data de Referência ' +
             'informada.','Erro',mtError,[mbOk],0);
      if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
      result := false;
      exit;
    end;
    if iPeriodo = -1 then begin
      MsgDlg('Período Bloqueado.','Erro',mtError,[mbOk],0);
      if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
      result := false;
      exit;
    end;
    if (dbrValor.Value = 0) then begin
      MsgDlg('Valor do Retorno não informado.','Erro',mtError,[mbOk],0);
      if dbrValor.CanFocus then dbrValor.SetFocus;
      result := false;
      exit;
    end;
    if (dbrValor.Value > RedSaldo.Value) then begin
      MsgDlg('O Valor do Retorno está maior que o Saldo da Conta.','Erro',mtError,[mbOk],0);
      if dbrValor.CanFocus then dbrValor.SetFocus;
      result := false;
      exit;
    end;
  end;
  result := true;
end;

procedure TfrmRetornoMT.CmeCadastroConfirma(Sender: TObject);
var
  sDataRef : string;
  iExercicio, iPeriodo : integer;
  rValorAtu   : Extended;
  TextoLog : string;
begin
  bbtnImprime.enabled := false;
  if ( frmRetornoMT.CmeCadastro.Operacao in [opInserir, opAlterar] ) then
    begin
      //Inicializa as variáveis
      sDataRef       := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
      iExercicio     := StrToInt(copy(sDataRef,7,4));
      iPeriodo       := OrcamentoBackMT.EncontraPeriodo(sDataRef);

      if dbrValor.Value <> rValorAnt then
        rValorAtu := dbrValor.Value - rValorAnt
      else
        rValorAtu := dbrValor.Value;

      try
        CtrlSaldoorcado.StartTransactionOrc;

        //Atualiza a tabela de Saldos com o Valor do Saldo Retornado
        if OrcamentoBackMT.VerificaSaldo(Modulo.iPlanoOrc,dbeCodigoConta.text, sDataRef) then
          begin
            if sContaAnt <> dbeCodigoConta.Text then
              begin
                // Retira Valor da Conta Antiga porque a Conta foi ALTERADA
                CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                              Sistema.idEmpresa,
                                              sContaAnt,
                                              sDataRef,
                                              rValorAnt);

                // Inclui Valor na Nova Conta porque a Conta foi ALTERADA
                CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                              Sistema.idEmpresa,
                                              dbeCodigoConta.text,
                                              sDataRef,
                                              -(dbrValor.value));
              end
            else
              begin
                // Modifica o Valor na mesma conta
                CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                              Sistema.idEmpresa,
                                              dbeCodigoConta.text,
                                              sDataRef,
                                              -(dbrValor.Value - rValorAnt));
              end
          end
        else
          begin
            CtrlSaldoorcado.InsereSaldo(iExercicio,
                                        iPeriodo,
                                        Modulo.iPlanoOrc,
                                        Sistema.idEmpresa,
                                        dbeCodigoConta.text,
                                        sDataRef,
                                        -(dbrValor.Value-rValorAnt),0,0,0,0,0);
          end;

        CtrlSaldoorcado.CommitOrc;

        inherited;

        MsgDlg('Retorno efetuado com sucesso.','Aviso',mtWarning,[mbOk],0);

        if MsgDlg('Deseja imprimir este retorno?','Aviso',mtConfirmation, [mbYes,mbNo],0) = mrYes then
          begin
            ImprimirRetorno;
          end;

      except
        CtrlSaldoorcado.RollBackOrc;

        MsgDlg('Foram detectados problemas na realização do Retorno.','Aviso', mtWarning,[mbOk],0);
      end;
    end
  else
    begin
      try
        CtrlSaldoorcado.StartTransactionOrc;

        CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                      Sistema.idEmpresa,
                                      sCodConta,
                                      sDataRef1,
                                      rValor);

        CtrlSaldoorcado.CommitOrc;
      except
        CtrlSaldoorcado.RollBackOrc;
        MsgDlg('Foram detectados problemas na exclusão da Suplementação.','Aviso', mtWarning,[mbOk],0);
      end;
    end;

  redSaldo.value := 0;
  edtNomeConta.text  := '';
  edtCentroResp.text := '';
  edtGrupo.text      := '';
  inherited;

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FRetornoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;

procedure TfrmRetornoMT.CmeCadastroFind(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if ((MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')) then begin
    cds.Data := CtrlAlterorcamento.Procurar
                                      (StrtoFloat(MontaSelect.ValoresChave[0]));
    bbtnImprime.enabled := true;
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       cds.FieldByName('IDCONTAORIGEM').asString,true, False,sNomeConta,
       sCodCentroRespon,sNomeCentroRespon,sCodGrupo,sNomeGrupo,sUnid,sPPrev,
       sCCusto,sPatro) = 0 then begin
      edtNomeConta.text  := sNomeConta;
      edtCentroResp.text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                            sCodCentroRespon) + ' - ' + sNomeCentroRespon;
      edtGrupo.text      := FormatMaskText(modulo.sMascaraGrupo + ';0; ',
                            sCodGrupo) + ' - ' + sNomeGrupo;
      redSaldo.value     := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                            cds.FieldByName('IDCONTAORIGEM').asString,
                            DateToStr(date),modulo.sTipoSaldo);
    end;
  end;
end;

procedure TfrmRetornoMT.CmeCadastroInsert(Sender: TObject);
begin
  edtNomeConta.text  := '';
  edtCentroResp.text := '';
  edtGrupo.text      := '';
  inherited;
  cds.FieldByName('FLGTIPOALTER').asString := 'R';
  rValorAnt := 0;
  if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
end;

procedure TfrmRetornoMT.bbtnBuscaContaClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelectConta.ValoresChave[1],true, False,sNomeConta,sCodCentroRespon,
       sNomeCentroRespon,sCodGrupo,sNomeGrupo,sUnid,sPPrev,sCCusto,sPatro) = 0
       then begin
      dbeCodigoConta.text := MontaSelectConta.ValoresChave[1];
      cds.FieldByName('IDCONTAORIGEM').asString :=
                                               MontaSelectConta.ValoresChave[1];
      edtNomeConta.text  := sNomeConta;
      edtCentroResp.text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                            sCodCentroRespon) + ' - ' + sNomeCentroRespon;
      edtGrupo.text      := FormatMaskText(modulo.sMascaraGrupo + ';0; ',
                            sCodGrupo) + ' - ' + sNomeGrupo;
      redSaldo.value     := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                            dbeCodigoConta.text,DateToStr(date),
                            modulo.sTipoSaldo);
    end else begin

      If ( OrcamentoBackMT.MessageInfo <> '' ) Then Begin
        MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
      End;

      dbeCodigoConta.clear;
      edtNomeConta.clear;
      edtCentroResp.clear;
      edtGrupo.clear;
      redSaldo.clear;
      if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRetornoMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Adiciona o filtro por Empresa Proprietária no MontaSelect
  MontaSelect.Filtro.Add('ALTERORCAMENTO.IDPESSOA = ' +
              IntToStr(Sistema.IdEmpresa));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                   IntToStr(modulo.iPlanoOrc));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                   'CODCENTRORESPON FROM PESSOAXCRESP WHERE IDPESSOAACESSO = '
                   + IntToStr(Sistema.idUsuario)+')');

  CtrlAlterorcamento := TCtrlAlterorcamento.Create;
  CtrlSaldoorcado    := TCtrlSaldoorcado.Create;

  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;

  CtrlAlterorcamento.Initialize( DtmBaseDados.dbBaseDados, True,
                             Sistema.ConnectionType,   Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                             Sistema.ConnectionType,   Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlPeriodoOrcamen.InitializeAs(CtrlAlterorcamento);

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlAlterorcamento.CdsAlterorcamento := cds;

  cds.Data := CtrlAlterorcamento.Procurar(-1);
end;

procedure TfrmRetornoMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not VerificaPreenchimento then Exit;
  inherited;
  try
    Sistema.GravaLogOperacoes('Retorno Orçamentário');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;
end;

procedure TfrmRetornoMT.bbtnImprime2Click(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirRetorno;
end;

procedure TfrmRetornoMT.dbeCodigoContaExit(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if dbeCodigoConta.text <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,dbeCodigoConta.text,
       true, False,sNomeConta,sCodCentroRespon,sNomeCentroRespon,sCodGrupo,
       sNomeGrupo,sUnid,sPPrev,sCCusto,sPatro) = 0 then begin
      edtNomeConta.text  := sNomeConta;
      edtCentroResp.text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                            sCodCentroRespon) + ' - ' + sNomeCentroRespon;
      edtGrupo.text      := FormatMaskText(modulo.sMascaraGrupo + ';0; ',
                            sCodGrupo) + ' - ' + sNomeGrupo;
      redSaldo.value     := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                            dbeCodigoConta.text,DateToStr(date),
                            modulo.sTipoSaldo);
    end else begin
      dbeCodigoConta.clear;
      edtNomeConta.clear;
      edtCentroResp.clear;
      edtGrupo.clear;
      redSaldo.clear;
      if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
    end;
  end;
end;

procedure TfrmRetornoMT.dbeDataRefExit(Sender: TObject);
begin
  inherited;
  if trim(dbeDataRef.Text) <> '' then begin
     redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                       dbeCodigoConta.text,FormatDateTime('dd/mm/yyyy',
                       dbeDataRef.date),modulo.sTipoSaldo);
  end;
end;

procedure TfrmRetornoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //Inherited;
  cds.Data :=
       CtrlAlterorcamento.Procurar(cds.FieldByName('IDALTERORCAMENTO').AsFloat);
end;

procedure TfrmRetornoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
  Cds.Close;
  Cds.Data := CtrlAlterorcamento.Procurar(-1);

end;

procedure TfrmRetornoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
end;

procedure TfrmRetornoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
end;

procedure TfrmRetornoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var sDataRef: string;
begin

  Accept := False;

  if not CtrlPeriodoOrcamen.PeriodoLiberado(dbeDataRef.Text, Sistema.IdEmpresa) then
    begin
      MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Erro',mtError,[mbOk],0);
      if dbeDataRef.CanFocus then
         dbeDataRef.SetFocus;
      EXIT;
    end;

  sDataRef := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then begin
    //Cria o número do próximo retorno
    if CmeCadastro.Operacao = opInserir then begin
      cdsProxSuplemen.Close;
      cdsProxSuplemen.Data :=
                             CtrlAlterorcamento.ProxSuplemen(Sistema.idEmpresa);
      cds.FieldByName('NUMALTERACAO').asInteger :=
                           cdsProxSuplemen.FieldByName('PROXIMA').asInteger + 1;
    end;
    //Completa o código do plano orçamentario
    cds.FieldByName('IDPLANOORCAMEN').AsInteger  := Modulo.iPlanoOrc;
    cds.FieldByName('IDPESSOA').AsFloat          := Sistema.idEmpresa;
    cds.FieldByName('EXERCICIOORIGEM').AsInteger :=
                                                   StrToInt(copy(sDataRef,7,4));
    cds.FieldByName('PERIODOORIGEM').AsInteger   :=
                                      OrcamentoBackMT.EncontraPeriodo(sDataRef);
    //Gera o número sequencial da próxima suplementação
    if cds.FieldByName('IDALTERORCAMENTO').asInteger <= 0 then begin
      cds.FieldByName('IDALTERORCAMENTO').AsInteger := CtrlAlterorcamento.LerUltimaSequencia;
    end;
  end;

  Accept := True;
  inherited;
end;

procedure TfrmRetornoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  Inherited;
  If OrigemAbortConfirma <> OaBeforeConfirma Then Begin
    MsgDlg('Ocorreu o seguinte erro : '+ CtrlAlterorcamento.MessageInfo,'Aviso', mtError, [mbOK],0);
  End;
end;
//************************************************
Procedure TfrmRetornoMT.ImprimirRetorno;
Var
  sMensagem : String;
Begin
  redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                                     dbeCodigoConta.text,FormatDateTime('dd/mm/yyyy', dbeDataRef.date),
                                     modulo.sTipoSaldo );

  If Not ( TrptRetorno.PrintReport( 3388, 1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                        cds.FieldByName('NUMALTERACAO').AsString + '|=|' +
                                        FloatToStr( redSaldo.value )             + '|=|',
                                    '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem ) ) Then Begin
    MsgDlg(sMensagem, 'Impressão do Retorno', mtError, [], 0);
  End;
End;
//************************************************
procedure TfrmRetornoMT.bbtnImprimeClick(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirRetorno;
end;

procedure TfrmRetornoMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlAlterorcamento);
  FreeAndNil(CtrlSaldoorcado);
  inherited;
end;

End.
