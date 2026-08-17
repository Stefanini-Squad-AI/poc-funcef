unit FSuplemenMT;
// data : 27/10/2003 - André Tavares - pendência 14009

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, TREdit,
  uCtrlAlterorcamento,uCtrlSaldoorcado, uCMTypes, uCmSqlParams,
  uCtrlPeriodoOrcamen, uFuncoesOrcamento;

type
  TfrmSuplemenMT = class(TFrmCadastroMT)
    Label4: TLabel;
    dbrReservaNum: TDBRealEdit;
    Bevel1: TBevel;
    lblCodigoConta: TLabel;
    lblNome: TLabel;
    dbeCodigoConta: TwwDBEdit;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    Label3: TLabel;
    Label11: TLabel;
    edtCentroResp: TEdit;
    edtGrupo: TEdit;
    lblDataIni: TLabel;
    dbeDataRef: TCMDateTimePicker;
    Label1: TLabel;
    dbrValor: TDBRealEdit;
    Label12: TLabel;
    redSaldo: TRealEdit;
    Label2: TLabel;
    dbmemObs: TDBMemo;
    MontaSelectConta: TMontaSelect;
    cdsProxSuplemen: TCMClientDataSet;
    bbtnImprime: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    function  VerificaPreenchimento: boolean;
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbeDataRefExit(Sender: TObject);
    procedure dbeCodigoContaExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure bbtnImprime2Click(Sender: TObject);
    procedure ImprimirSuplemen;
    procedure bbtnImprimeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlAlterorcamento : TCtrlAlterorcamento;
    CtrlSaldoorcado    : TCtrlSaldoorcado;
    CtrlPeriodoOrcamen : TCtrlPeriodoOrcamen;
  public
    { Public declarations }
  end;

var
  frmSuplemenMT: TfrmSuplemenMT;
  sDataRef1, sCodConta, sContaAnt  : String;
  rValor, rValorAnt : Double;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
     uCtrlOrcamento, ppTypes, rSuplemen;

{$R *.DFM}

procedure TfrmSuplemenMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Adiciona o filtro por Empresa Proprietária no MontaSelect
  MontaSelect.Filtro.Add('ALTERORCAMENTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + IntToStr(modulo.iPlanoOrc));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                              'CODCENTRORESPON FROM PESSOAXCRESP WHERE ' +
                              'IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+')');
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.TIPOCALCORCADO = ''V''' );    // Valor Informado Manualmente

  CtrlAlterorcamento := TCtrlAlterorcamento.Create;
  CtrlSaldoorcado    := TCtrlSaldoorcado.Create;

  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;

  CtrlAlterorcamento.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlPeriodoOrcamen.InitializeAs(CtrlAlterOrcamento);

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlAlterorcamento.CdsAlterorcamento := cds;
  //
  cds.Data := CtrlAlterorcamento.Procurar(-1);
end;

procedure TfrmSuplemenMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dbeDataRef.CanFocus then dbeDataRef.SetFocus;

  rValorAnt := cds.FieldByName('VLRSOLICITADO').AsFloat;
  sContaAnt := cds.FieldByName('IDCONTAORIGEM').AsString;
end;

procedure TfrmSuplemenMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := False;

  if not CtrlPeriodoOrcamen.PeriodoLiberado(dbeDataRef.Text, Sistema.IdEmpresa) then
    begin
      MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Erro',mtError,[mbOk],0);
      if dbeDataRef.CanFocus then
         dbeDataRef.SetFocus;
      EXIT;
    end;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then begin
    //Cria o número da próxima reserva
    if CmeCadastro.Operacao = opInserir then begin
      cdsProxSuplemen.Close;
      cdsProxSuplemen.Data := CtrlAlterorcamento.ProxSuplemen(Sistema.idEmpresa);
      cds.FieldByName('NUMALTERACAO').asInteger := cdsProxSuplemen.FieldByName('PROXIMA').asInteger + 1;
    end;
    //Completa o código do plano orçamentario
    cds.FieldByName('IDPLANOORCAMEN').AsInteger  := Modulo.iPlanoOrc;
    cds.FieldByName('IDPESSOA').AsFloat          := Sistema.idEmpresa;
    cds.FieldByName('EXERCICIOORIGEM').AsInteger := StrToInt(copy(FormatDateTime('dd/mm/yyyy', dbeDataRef.date),7,4));
    cds.FieldByName('PERIODOORIGEM').AsInteger   := OrcamentoBackMT.EncontraPeriodo(FormatDateTime('dd/mm/yyyy', dbeDataRef.date));
    //Gera o número sequencial da próxima suplementação
    if cds.FieldByName('IDALTERORCAMENTO').asInteger <= 0 then begin
      cds.FieldByName('IDALTERORCAMENTO').AsInteger := CtrlAlterorcamento.LerUltimaSequencia;
    end;
  end;

  Accept := True;
  inherited;
end;

procedure TfrmSuplemenMT.bbtnConfirmarClick(Sender: TObject);
begin
   if not VerificaPreenchimento then Exit;
   inherited;
  try
    Sistema.GravaLogOperacoes('Suplementação orçamentária');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;
end;

function TfrmSuplemenMT.VerificaPreenchimento: boolean;
var sDataRef : string;
    iPeriodo : integer;
begin
  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then begin
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
      MsgDlg('Não existe um Período ou Exercício para a Data de Referência ' + 'informada.','Erro',mtError,[mbOk],0);
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
      MsgDlg('Valor da Suplementação não informado.','Erro',mtError,[mbOk],0);
      if dbrValor.CanFocus then dbrValor.SetFocus;
      result := false;
      exit;
    end;
  end;
  result := true;
end;

procedure TfrmSuplemenMT.CmeCadastroConfirma(Sender: TObject);
var
  sDataRef : string;
  iExercicio, iPeriodo : integer;
  rValorAtu   : Extended;
  TextoLog : string;
begin
  bbtnImprime.enabled := false;

  if (CmeCadastro.Operacao in [opInserir, opAlterar]) then
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

        //Atualiza a tabela de Saldos com o Valor do Saldo Suplementado
        if OrcamentoBackMT.VerificaSaldo(Modulo.iPlanoOrc,dbeCodigoConta.text, sDataRef) then
          begin
            if sContaAnt <> dbeCodigoConta.Text then
              begin
                // Retira Valor da Conta Antiga porque a Conta foi ALTERADA
                CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                              Sistema.idEmpresa,
                                              sContaAnt,
                                              sDataRef,
                                              rValorAnt * -1);

                // Inclui Valor na Nova Conta porque a Conta foi ALTERADA
                CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                              Sistema.idEmpresa,
                                              dbeCodigoConta.text,
                                              sDataRef,
                                              dbrValor.Value);
              end
            else
              begin
                // Modifica o Valor na mesma conta
                CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                              Sistema.idEmpresa,
                                              dbeCodigoConta.text,
                                              sDataRef,
                                              (dbrValor.Value - rValorAnt));
              end
          end
        else
          begin
            CtrlSaldoorcado.InsereSaldo(iExercicio,
                                        iPeriodo,
                                        Modulo.iPlanoOrc,
                                        Sistema.idEmpresa,
                                        dbeCodigoConta.Text,
                                        sDataRef,
                                        dbrValor.value - rValorAnt,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0);
          end;

        CtrlSaldoorcado.CommitOrc;

        inherited;

        MsgDlg('Suplemento efetuado com sucesso.','Aviso',mtWarning,[mbOk],0);

        if MsgDlg('Deseja imprimir esta Suplementação?','Aviso',mtConfirmation, [mbYes, mbNo],0) = mrYes then
          begin
            ImprimirSuplemen;
          end;

      except
        CtrlSaldoorcado.RollBackOrc;
        MsgDlg('Foram detectados problemas na realização da Suplementação.', 'Aviso',mtWarning,[mbOk],0);
      end;

    end
  else
    begin
      try
        CtrlSaldoorcado.StartTransactionOrc;
        CtrlSaldoorcado.AtualizaSaldo( Modulo.iPlanoOrc,
                                       Sistema.idEmpresa,
                                       sCodConta,
                                       sDataRef1,
                                       rValor );
        CtrlSaldoorcado.CommitOrc;
      except
        CtrlSaldoorcado.RollBackOrc;
        MsgDlg('Foram detectados problemas na exclusão da Suplementação.', 'Aviso',mtWarning,[mbOk],0);
      end;
    end;

  redSaldo.value := 0;
  edtNomeConta.text  := '';
  edtCentroResp.text := '';
  edtGrupo.text      := '';
  inherited;

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FSuplemenMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;

procedure TfrmSuplemenMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //Inherited;
  cds.Data := CtrlAlterorcamento.Procurar(cds.FieldByName('IDALTERORCAMENTO').AsFloat);
end;

procedure TfrmSuplemenMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  Inherited;
  If OrigemAbortConfirma <> OaBeforeConfirma Then Begin
    MsgDlg('Ocorreu o seguinte erro : '+ CtrlAlterorcamento.MessageInfo, 'Aviso', mtError,[mbOK],0);
  End;
end;

procedure TfrmSuplemenMT.CmeCadastroFind(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  Inherited;
  If MontaSelect.RetornouValor Then Begin
    cds.Data := CtrlAlterorcamento.Procurar(StrtoFloat(MontaSelect.ValoresChave[0]));
    bbtnImprime.enabled := true;
    if OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
           cds.FieldByName('IDCONTAORIGEM').asString,true,False,sNomeConta,
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
  End;
end;

procedure TfrmSuplemenMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   bbtnImprime.enabled := false;
   edtNomeConta.text  := '';
   edtCentroResp.text := '';
   edtGrupo.text      := '';
end;

procedure TfrmSuplemenMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;

  {Após a exclusão de uma Transferência, sem sair da tela e inserir uma nova
   Transferência os dados atualizados no banco de dados eram os da Transferência
   excluída e não os da nova transferência. Os dados em memória no ClientDataSet
   não estavam sendo limpos mesmo adotando os procedimentos padrões de apagar
   os dados e carregá-lo novamente com os novos dados da nova Transferência.
   SOLUÇÃO 1: Dar um Close no ClientDataSet no evento e em seguida carregá-lo
   com um Conjunto de dados ou um conjunto vazio, apenas para recriar a
   estrutura do componente.
   SOLUÇÃO 2:(Alternativa): Utilizar a versão 7 do Midas.dll. Este problema
   não ocorre com esta versão da DLL}
  Cds.Close;
  Cds.Data := CtrlAlterorcamento.Procurar(-1);

end;

procedure TfrmSuplemenMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
end;

procedure TfrmSuplemenMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
end;

procedure TfrmSuplemenMT.CmeCadastroDelete(Sender: TObject);
begin
  sCodConta := dbeCodigoConta.text;
  sDataRef1 := dbeDataRef.Text;
  rValor    := dbrValor.value * -1;
  inherited;
end;

procedure TfrmSuplemenMT.CmeCadastroInsert(Sender: TObject);
begin
  edtNomeConta.text  := '';
  edtCentroResp.text := '';
  edtGrupo.text      := '';
  inherited;
  cds.FieldByName('FLGTIPOALTER').asString := 'S';
  rValorAnt := 0;
  if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
end;

procedure TfrmSuplemenMT.dbeDataRefExit(Sender: TObject);
begin
  inherited;
  if trim(dbeDataRef.Text) <> '' then begin
     redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                       dbeCodigoConta.text,FormatDateTime('dd/mm/yyyy',
                       dbeDataRef.date),modulo.sTipoSaldo);
  end;
end;

procedure TfrmSuplemenMT.dbeCodigoContaExit(Sender: TObject);
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

procedure TfrmSuplemenMT.bbtnBuscaContaClick(Sender: TObject);
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
      cds.FieldByName('IDCONTAORIGEM').asString := MontaSelectConta.ValoresChave[1];
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

procedure TfrmSuplemenMT.bbtnImprime2Click(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirSuplemen;
end;
//*************************************************
Procedure TfrmSuplemenMT.ImprimirSuplemen;
Var
  sMensagem : String;
Begin
  Try
    redSaldo.value     := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                               dbeCodigoConta.text,FormatDateTime('dd/mm/yyyy', dbeDataRef.date),
                               modulo.sTipoSaldo);

    If Not ( TrptSuplemen.PrintReport( 3386, 1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                             cds.FieldByName('NUMALTERACAO').asString + '|=|' +
                                             FloatToStr( redSaldo.value )           + '|=|',
                                       '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem ) ) Then Begin
        MsgDlg(sMensagem, 'Impressão da Suplementação ', mtError, [ mbOk ], 0);
    End;
  Except
    On E : Exception Do Begin
      MsgDlg( 'Erro durante a geração do relatório' + #13 + #10 +
              E.Message, 'Erro', mtError, [ mbOk ], 0 );
    End;
  End;
End;
//*************************************************
procedure TfrmSuplemenMT.bbtnImprimeClick(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirSuplemen;
end;

procedure TfrmSuplemenMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlAlterorcamento);
  FreeAndNil(CtrlSaldoorcado);

  inherited;
end;

End.
