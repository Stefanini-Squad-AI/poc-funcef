// Alterações:
// data : 27/10/2003 - André Tavares - pendência 14009
//        07/01/2004 - André Tavares - pendência 15871

unit FTransfereMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ComCtrls, wwriched, Mask, wwdbedit,
  StdCtrls, TREdit, ExtCtrls, MontaSelect, DBTables, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Wwdbspin, IvDictio, IvMulti,
  IvEMulti, ppPrvDlg, ppForms, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, FCadastroMT, DBClient,
  uCMClientDataSet, uCtrlAlterorcamento, uCtrlPeriodoOrcamen, uCtrlSaldoorcado,
  uCMTypes, uCmSqlParams, FCMPrincipal, uCMMath, uFuncoesOrcamento;

type
  TfrmTransfereMT = class(TFrmCadastroMT)
    lblCodigoConta: TLabel;
    lblNome: TLabel;
    lblDataIni: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    bbtnBuscaContaOri: TBitBtn;
    dbeDataRef: TCMDateTimePicker;
    dbrValor: TDBRealEdit;
    bbtnBuscaContaDes: TBitBtn;
    Label6: TLabel;
    dbrReservaNum: TDBRealEdit;
    Bevel2: TBevel;
    MontaSelectConta: TMontaSelect;
    dbspnExercicioOri: TwwDBSpinEdit;
    dbrPeriodoOri: TDBRealEdit;
    Label7: TLabel;
    Label8: TLabel;
    dbspnExercicioDes: TwwDBSpinEdit;
    Label9: TLabel;
    dbrPeriodoDes: TDBRealEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    redSaldo: TRealEdit;
    dbmemObs: TDBMemo;
    edtNomeContaOri: TEdit;
    edtCentroResp: TEdit;
    edtGrupo: TEdit;
    edtNomeContaDes: TEdit;
    dbeContaOrigem: TwwDBEdit;
    dbeContaDestino: TwwDBEdit;
    cdsPeriodo: TCMClientDataSet;
    cdsProxTransf: TCMClientDataSet;
    bbtnImprime: TToolbarButton97;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    function  VerificaPreenchimento : boolean;
    procedure bbtnBuscaContaOriClick(Sender: TObject);
    procedure bbtnBuscaContaDesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbeContaOrigemExit(Sender: TObject);
    procedure dbeContaDestinoExit(Sender: TObject);
    procedure dbrPeriodoOriExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure ImprimirTransf;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);


  private
    { Private declarations }
    rValorTransf: real;
    CtrlAlterorcamento: TCtrlAlterOrcamento;
    CtrlPeriodoOrcamen: TCtrlPeriodoOrcamen;
    CtrlSaldoorcado: TctrlSaldoorcado;
  public
    { Public declarations }
  end;

var
  frmTransfereMT: TfrmTransfereMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
  uCtrlOrcamento, ppTypes, rTransf;

{$R *.DFM}


procedure TfrmTransfereMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  rValorTransf := 0;
  bbtnImprime.enabled := false;
  edtNomeContaOri.text  := '';
  edtNomeContaDes.text  := '';
  edtCentroResp.text    := '';
  edtGrupo.text         := '';
end;

procedure TfrmTransfereMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
end;

Function TfrmTransfereMT.VerificaPreenchimento : boolean;
Var sDataRef, sTipo : string;
    iPeriodo, iPeriodoOrigem, iPeriodoDestino : integer;
Begin
  If (frmTransfereMT.CmeCadastro.Operacao in [opInserir, opAlterar]) Then Begin
    //Inicializa as variáveis
    sDataRef        := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
    iPeriodo        := OrcamentoBackMT.EncontraPeriodo(sDataRef);
    iPeriodoOrigem  := OrcamentoBackMT.DiasNoPeriodo
                       (trunc(dbspnExercicioOri.value),
                       trunc(dbrPeriodoOri.value));
    iPeriodoDestino := OrcamentoBackMT.DiasNoPeriodo
                       (trunc(dbspnExercicioDes.value),
                       trunc(dbrPeriodoDes.value));
    sTipo           := modulo.sTipoSaldo;

    //Faz a verificação do preenchimento dos campos
    if (dbeContaOrigem.Text = '') then begin
      MsgDlg('Código da Conta de Origem não informado.','Erro',mtError,
             [mbOk],0);
      if dbeContaOrigem.CanFocus then dbeContaOrigem.SetFocus;
      result := false;
      exit;
    end;

    if (dbeContaDestino.Text = '') then begin
      MsgDlg('Código da Conta de Destino não informado.','Erro',mtError,
             [mbOk],0);
      if dbeContaDestino.CanFocus then dbeContaDestino.SetFocus;
      result := false;
      exit;
    end;

    if (dbeDataRef.Text = '') then begin
      MsgDlg('Data de Referência não informada.','Erro',mtError,[mbOk],0);
      if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
      result := false;
      exit;
    end;

   if not CtrlPeriodoOrcamen.PeriodoLiberado(sDataRef,
                                             Sistema.IdEmpresa) then
     begin
       MsgDlg('Período BLOAQUEADO para lançamentos.','Erro',mtError,[mbOk],0);
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

    if iPeriodoOrigem = 0 then begin
      MsgDlg('Não existe um Período de Origem para o Exercício informado.',
             'Erro',mtError,[mbOk],0);
      if dbrPeriodoOri.CanFocus then dbrPeriodoOri.SetFocus;
      result := false;
      exit;
    end;

    if not CtrlPeriodoOrcamen.PeriodoLiberado(Cds.FieldByName('EXERCICIOORIGEM').AsInteger,
                                              Cds.FieldByName('PERIODOORIGEM').AsInteger,
                                              Sistema.IdEmpresa) then
      begin
        MsgDlg('Período Origem Bloqueado.','Erro',mtError,[mbOk],0);
        if dbrPeriodoOri.CanFocus then
          dbrPeriodoOri.SetFocus;
        result := false;
        exit;
      end;

    if iPeriodoDestino = 0 then begin
      MsgDlg('Não existe um Período de Destino para o Exercício informado.',
             'Erro',mtError,[mbOk],0);
      if dbrPeriodoDes.CanFocus then dbrPeriodoDes.SetFocus;
      result := false;
      exit;
    end;

    if not CtrlPeriodoOrcamen.PeriodoLiberado(Cds.FieldByName('PERIODODESTINO').AsInteger,
                                              Cds.FieldByName('EXERCICIODESTINO').AsInteger,
                                              Sistema.IdEmpresa) then
      begin
        MsgDlg('Período Destino Bloqueado.','Erro',mtError,[mbOk],0);
        if dbrPeriodoDes.CanFocus then dbrPeriodoDes.SetFocus;
        result := false;
        exit;
      end;

    if dbspnExercicioOri.value <> dbspnExercicioDes.value then begin
      MsgDlg('O Exercício de Origem deve ser igual ao Exercício de Destino.',
             'Erro',mtError,[mbOk],0);
      if dbspnExercicioOri.CanFocus then dbspnExercicioOri.SetFocus;
      result := false;
      exit;
    end;

    if (dbrValor.Value = 0) then begin
      MsgDlg('Valor da Transferência não informado.','Erro',mtError,[mbOk],0);
      if dbrValor.CanFocus then dbrValor.SetFocus;
      result := false;
      exit;
    end;

    //Verifica a tabela de Saldos para ver se a transferência pode ser feita
    if Modulo.sPermiteSaldoNeg = 'N' then begin
      if not OrcamentoBackMT.VerificaSaldoProcesso(Modulo.iPlanoOrc,
         dbeContaOrigem.text, trunc(dbspnExercicioOri.value),
         trunc(dbrPeriodoOri.value), abs(dbrValor.value), true) then begin
        result := false;

        MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
        Exit;
      End;
    End;
  End;
  Result := True;
End;
//************************************************

Procedure TfrmTransfereMT.CmeCadastroDelete(Sender: TObject);
var
  sDataOri,
  sDataRef,
  Mensagem  : string;

begin
  sDataRef := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);

  with cdsPeriodo Do
    Begin
      Data := CtrlPeriodoOrcamen.InicioFimPeriodo(trunc( dbspnExercicioOri.value ),
                                                  trunc( dbrPeriodoOri.value ),
                                                  sistema.idEmpresa );

      if dbspnExercicioOri.value <> dbspnExercicioDes.value then
        begin
          sDataOri := FormatDateTime('dd/mm/yyyy', FieldByName('DATAINIPERIODO').asDateTime);
        end
      else
        begin
          if dbrPeriodoOri.value <> dbrPeriodoDes.value then
            begin
              sDataOri := FormatDateTime('dd/mm/yyyy', FieldByName('DATAINIPERIODO').asDateTime);
            end
          else
            begin
              sDataOri := sDataRef;
            end;
        end;
    end;

  CtrlSaldoOrcado.PlanoOrc  := Modulo.iPlanoOrc;
  CtrlSaldoOrcado.IdEmpresa := Sistema.idEmpresa;

  try
    Mensagem := '';
    CtrlSaldoOrcado.CmeCadastroDelete( Mensagem,
                                       dbeContaOrigem.Text,
                                       dbeContaDestino.Text,
                                       sDataOri,
                                       sDataRef,
                                       rValorTransf );
    inherited;
  finally
    if ( Mensagem <> '' ) then
      begin
        MsgDlg( Mensagem, 'Aviso', mtWarning, [ mbOk ], 0 );
      end;
  end;
end;

procedure TfrmTransfereMT.CmeCadastroConfirma(Sender: TObject);
var
  sDataOri, sDataRef : string;
  TextoLog : String;

begin
  bbtnImprime.enabled := false;

  if (frmTransfereMT.CmeCadastro.Operacao in [opInserir, opAlterar]) then
    begin
      //Inicializa as variáveis
      sDataRef := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
      with cdsPeriodo do
        begin
          // Pega as Datas INICIAL e FINAL do PERÍODO
          Data := CtrlPeriodoOrcamen.InicioFimPeriodo(trunc(dbspnExercicioOri.value),
                                                      trunc(dbrPeriodoOri.value),
                                                      sistema.idEmpresa);

          if dbspnExercicioOri.value <> dbspnExercicioDes.value then
            begin
              // Se ANO for diferente entre ORIGEM e DESTINO
              sDataOri := FormatDateTime('dd/mm/yyyy',
                          FieldByName('DATAINIPERIODO').asDateTime);
            end
          else
            begin
              // Se MÊS for diferente dentre ORIGEM e DESTINO
              if dbrPeriodoOri.value <> dbrPeriodoDes.value then
                begin
                  sDataOri := FormatDateTime('dd/mm/yyyy',
                              FieldByName('DATAINIPERIODO').asDateTime);
                end
              else
                begin
                  // Se o ANO e MÊS forem iguais
                  sDataOri := sDataRef;
                end;
        end;
    end;

    CtrlSaldoorcado.StartTransactionOrc;

    try
      //Dá o Update no Saldo da Conta de Origem...
      //Repõe o valor antigo na conta de origem
      CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                    Sistema.idEmpresa,
                                    dbeContaOrigem.text,
                                    sDataOri,
                                    rValorTransf);

      //Tira o valor antigo na conta de destino
      CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                    Sistema.idEmpresa,
                                    dbeContaDestino.text,
                                    sDataRef,
                                    -(rValorTransf));


      //Atualiza a tabela de Saldos com o Valor da Transferência
      //Dá o Update no Saldo da Conta de Origem...


       // --->> CONTA ORIGEM
      if OrcamentoBackMT.VerificaSaldo(Modulo.iPlanoOrc,
                                       dbeContaOrigem.text,
                                       sDataRef) then
        begin
          // Se existir REGISTRO na tabela SALDOORCADO com a DATA DE REFERÊNCIA
          // passada como parâmetro, atualiza o SALDO
          CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                        Sistema.idEmpresa,
                                        dbeContaOrigem.text,
                                        sDataOri,
                                        -(dbrValor.value));
        end
      else
        begin
          // Senão, inclui um REGISTRO na tabela SALDOORCADO com a DATA DE REFERÊNCIA
          // passada como parâmetro e o valor da transferência.
          CtrlSaldoorcado.InsereSaldo(trunc(dbspnExercicioOri.value),
                                      trunc(dbrPeriodoOri.value),
                                      Modulo.iPlanoOrc,
                                      Sistema.idEmpresa,
                                      dbeContaOrigem.text,
                                      sDataRef,
                                      -(dbrValor.value),
                                      0,
                                      0,
                                      0,
                                      0,
                                      0);
        end;


      // --->> CONTA DESTINO
      if OrcamentoBackMT.VerificaSaldo(Modulo.iPlanoOrc,
                                       dbeContaDestino.text,
                                       sDataRef) then
        begin
          //Existindo registro na tabela, dá o Update no Saldo da Conta de Destino...
          CtrlSaldoorcado.AtualizaSaldo(Modulo.iPlanoOrc,
                                        Sistema.idEmpresa,
                                        dbeContaDestino.text,
                                        sDataRef,
                                        dbrValor.value);
       end
     else
       begin
         // Senão insere o registro na tabela com a data de referência passada no parâmetro
         CtrlSaldoorcado.InsereSaldo(trunc(dbspnExercicioDes.value),
                                     trunc(dbrPeriodoDes.value),
                                     Modulo.iPlanoOrc,
                                     Sistema.idEmpresa,
                                     dbeContaDestino.text,
                                     sDataRef,
                                     dbrValor.value,
                                     0,
                                     0,
                                     0,
                                     0,
                                     0);
       end;

      CtrlSaldoorcado.CommitOrc;

      inherited;

      MsgDlg('Transferência efetuada com sucesso.','Aviso',mtWarning,[mbOk],0);

    except
      CtrlSaldoorcado.RollbackOrc;
      MsgDlg('Foram detectados problemas na realização da Transferência.',
             'Aviso',mtWarning,[mbOk],0);
      raise;
    end;
    rValorTransf := 0;

    if MsgDlg('Deseja imprimir esta Tranferência?','Aviso',mtConfirmation,
       [mbYes, mbNo],0) = mrYes then begin
      ImprimirTransf;
    end;

  end;

  redSaldo.value := 0;
  edtNomeContaOri.text  := '';
  edtNomeContaDes.text  := '';
  edtCentroResp.text    := '';
  edtGrupo.text         := '';

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FTransfereMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;

procedure TfrmTransfereMT.CmeCadastroFind(Sender: TObject);
var
  sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
  sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro : string;
begin
  inherited;
  if MontaSelect.RetornouValor then begin

    Cds.Data := CtrlAlterorcamento.Procurar(StrtoFloat(MontaSelect.ValoresChave[0]));
    bbtnImprime.enabled := true;
    with cds do begin
      rValorTransf    := FieldByName('VLRSOLICITADO').asFloat;
      dbeDataRef.date := FieldByName('DATAREFERENCIA').asDateTime;
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
         FieldByName('IDCONTAORIGEM').asString,true,true,sNomeConta,
         sCodCentroRespon,sNomeCentroRespon,sCodGrupo,sNomeGrupo,sUnid,sPPrev,
         sCCusto,sPatro) = 0 then
         begin
        edtNomeContaOri.text := sNomeConta;
        edtCentroResp.text   := FormatMaskText(modulo.sMascaraCentRespon +
                                ';0; ',sCodCentroRespon) + ' - ' +
                                sNomeCentroRespon;
        edtGrupo.text        := FormatMaskText(modulo.sMascaraGrupo+ ';0; ',
                                sCodGrupo) + ' - ' + sNomeGrupo;
        redSaldo.value       := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                                FieldByName('IDCONTAORIGEM').asString,
                                DateToStr(date),modulo.sTipoSaldo);
      end;
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
         FieldByName('IDCONTADESTINO').asString,true,true,sNomeConta,
         sCodCentroRespon,sNomeCentroRespon,sCodGrupo,sNomeGrupo,sUnid,sPPrev,
         sCCusto,sPatro) = 0 then
         begin
        edtNomeContaDes.text  := sNomeConta;
      end;
    end;
  end;
end;

procedure TfrmTransfereMT.CmeCadastroInsert(Sender: TObject);
var sData : string;
begin
  rValorTransf :=0;
  edtNomeContaOri.text := '';
  edtNomeContaDes.text := '';
  edtCentroResp.text   := '';
  edtGrupo.text        := '';

  inherited;

  //Inicializa os valores default dos Exercícios e Periodos na tela
  sData := FormatDateTime ('dd/mm/yyyy',date);
  cds.FieldByName('EXERCICIOORIGEM').asInteger  := StrToInt(copy(sData,7,4));
  cds.FieldByName('EXERCICIODESTINO').asInteger := StrToInt(copy(sData,7,4));
  cds.FieldByName('PERIODOORIGEM').asInteger    := StrToInt(copy(sData,4,2));
  cds.FieldByName('PERIODODESTINO').asInteger   := StrToInt(copy(sData,4,2));
  cds.FieldByName('FLGTIPOALTER').asString := 'T';

  if dbeContaOrigem.CanFocus then dbeContaOrigem.SetFocus;
end;

procedure TfrmTransfereMT.bbtnBuscaContaOriClick(Sender: TObject);
var
  sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
  sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                          MontaSelectConta.ValoresChave[1], true, true, sNomeConta,
                                          sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
                                          sNomeGrupo, sUnid, sPPrev, sCCusto,sPatro) = 0 then begin

      dbeContaOrigem.text := MontaSelectConta.ValoresChave[1];
      cds.FieldByName('IDCONTAORIGEM').asString :=
                                               MontaSelectConta.ValoresChave[1];
      edtNomeContaOri.text := sNomeConta;
      edtCentroResp.text   := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                              sCodCentroRespon) + ' - ' + sNomeCentroRespon;
      edtGrupo.text        := FormatMaskText(modulo.sMascaraGrupo + ';0; ',
                              sCodGrupo) + ' - ' + sNomeGrupo;
      redSaldo.value       := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                              dbeContaOrigem.text, DateToStr(date),
                              modulo.sTipoSaldo);
    end else begin

      If ( OrcamentoBackMT.MessageInfo <> '' ) Then Begin
        MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
      End;

      dbeContaOrigem.clear;
      edtNomeContaOri.clear;
      edtCentroResp.clear;
      edtGrupo.clear;
      redSaldo.clear;
      if dbeContaOrigem.CanFocus then dbeContaOrigem.SetFocus;
    end;
  end;
end;

procedure TfrmTransfereMT.bbtnBuscaContaDesClick(Sender: TObject);
var sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then
  begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelectConta.ValoresChave[1], true, true, sNomeConta,
       sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
       sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then
     begin

      if Modulo.sPermiteTransf = 'N' then
      begin
        if (FormatMaskText(modulo.sMascaraGrupo + ';0; ',sCodGrupo) + ' - ' +
            sNomeGrupo) <> edtGrupo.text then
        begin
          MsgDlg('O Grupo da Conta Origem deve ser igual ao grupo da Conta ' +
                 'Destino.','Aviso',mtWarning,[mbOk],0);

          cds.fieldByName('IDCONTADESTINO').Clear;
          dbeContaDestino.text := '';
          edtNomeContaDes.clear;
          redSaldo.clear;
          if dbeContaDestino.CanFocus then dbeContaDestino.SetFocus;
          Exit;
        end;
      end;
      dbeContaDestino.text := MontaSelectConta.ValoresChave[1];
      cds.FieldByName('IDCONTADESTINO').asString := MontaSelectConta.ValoresChave[1];
      edtNomeContaDes.text  := sNomeConta;
    end
    else
    begin
      If ( OrcamentoBackMT.MessageInfo <> '' ) Then
      Begin
        MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
      End;

      dbeContaDestino.clear;
      edtNomeContaDes.clear;
      edtCentroResp.clear;
      edtGrupo.clear;
      redSaldo.clear;
      if dbeContaDestino.CanFocus then dbeContaDestino.SetFocus;
    end;
  end;


end;

procedure TfrmTransfereMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Adiciona o filtro por Empresa Proprietária no MontaSelect
  MontaSelect.Filtro.Add('ALTERORCAMENTO.IDPESSOA = ' +
                         IntToStr(Sistema.IdEmpresa));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                              IntToStr(modulo.iPlanoOrc));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN ' +
                              '(SELECT CODCENTRORESPON FROM PESSOAXCRESP ' +
                              'WHERE IDPESSOAACESSO = ' +
                              IntToStr(Sistema.idUsuario)+')');

  CtrlAlterorcamento := TCtrlAlterorcamento.Create;
  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;
  CtrlSaldoorcado    := TCtrlSaldoorcado.Create;

  CtrlAlterorcamento.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlPeriodoOrcamen.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlAlterorcamento.CdsAlterorcamento := cds;
  //
  cds.Data := CtrlAlterorcamento.Procurar(-1);
end;

procedure TfrmTransfereMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not VerificaPreenchimento then Exit;
  inherited;
  try
    Sistema.GravaLogOperacoes('Transferência Orçamentária');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;
end;

procedure TfrmTransfereMT.dbeContaOrigemExit(Sender: TObject);
var
  sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
  sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;

begin
  inherited;

  if dbeContaOrigem.text <> '' then
    begin
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
                                           dbeContaOrigem.text,
                                           true,
                                           true,
                                           sNomeConta,
                                           sCodCentroRespon,
                                           sNomeCentroRespon,
                                           sCodGrupo,
                                           sNomeGrupo,
                                           sUnid,
                                           sPPrev,
                                           sCCusto,
                                           sPatro) = 0 then
        begin
          edtNomeContaOri.text := sNomeConta;

          edtCentroResp.text   := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                                  sCodCentroRespon) + ' - ' + sNomeCentroRespon;

          edtGrupo.text        := FormatMaskText(modulo.sMascaraGrupo + ';0; ',
                                  sCodGrupo) + ' - ' + sNomeGrupo;

          redSaldo.value       := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                                  dbeContaOrigem.text, DateToStr(date),
                                  modulo.sTipoSaldo);
        end
      else
        begin
          dbeContaOrigem.clear;
          edtNomeContaOri.clear;
          edtCentroResp.clear;
          edtGrupo.clear;
          redSaldo.clear;
          if dbeContaOrigem.CanFocus then
            dbeContaOrigem.SetFocus;
        end;
    end;
end;

procedure TfrmTransfereMT.dbeContaDestinoExit(Sender: TObject);
var
  sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
  sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro : string;

begin
  inherited;
  if dbeContaDestino.text <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
                                         dbeContaDestino.text,
                                         true,
                                         true,
                                         sNomeConta,
                                         sCodCentroRespon,
                                         sNomeCentroRespon,
                                         sCodGrupo,
                                         sNomeGrupo,
                                         sUnid,
                                         sPPrev,
                                         sCCusto,
                                         sPatro) = 0 then
      begin

        if Modulo.sPermiteTransf = 'N' then
          begin
            if (FormatMaskText(modulo.sMascaraGrupo + ';0; ',sCodGrupo) + ' - ' +
                sNomeGrupo) <> edtGrupo.text then
              begin
                MsgDlg('O Grupo da Conta Origem deve ser igual ao grupo da Conta ' +
                       'Destino.','Aviso',mtWarning,[mbOk],0);

                cds.fieldByName('IDCONTADESTINO').Clear;
                dbeContaDestino.text := '';
                edtNomeContaDes.clear;
                redSaldo.clear;

                if dbeContaDestino.CanFocus then
                  dbeContaDestino.SetFocus;

                Exit;
              end;
          end;

        edtNomeContaDes.text  := sNomeConta;
      end
    else
      begin
        If ( OrcamentoBackMT.MessageInfo <> '' ) Then
          Begin
            MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
          End;

        dbeContaDestino.clear;
        edtNomeContaDes.clear;
        edtCentroResp.clear;
        edtGrupo.clear;
        redSaldo.clear;

        if dbeContaDestino.CanFocus then dbeContaDestino.SetFocus;
      end;
  end;

end;

procedure TfrmTransfereMT.dbrPeriodoOriExit(Sender: TObject);
begin
  inherited;

  with cdsPeriodo do
    begin
      Data := CtrlPeriodoOrcamen.InicioFimPeriodo(trunc(dbspnExercicioOri.value),
                                                  trunc(dbrPeriodoOri.value),
                                                  sistema.idEmpresa);

      if not isEmpty then
        redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                                                     dbeContaOrigem.text,
                                                     FormatDateTime('dd/mm/yyyy',
                                                     cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime),
                                                     modulo.sTipoSaldo);
    end;
end;

procedure TfrmTransfereMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //Inherited;
  cds.Data := CtrlAlterorcamento.Procurar(cds.FieldByName('IDALTERORCAMENTO').AsFloat);
end;

procedure TfrmTransfereMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;

  Cds.Close;
  Cds.Data := CtrlAlterorcamento.Procurar(-1);
end;

procedure TfrmTransfereMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
end;

procedure TfrmTransfereMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Inherited;
  Accept := CtrlAlterorcamento.AplicaOperacaoAlterorcamento;
end;

procedure TfrmTransfereMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  Accept := False;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
    begin
      //Cria o número da próxima reserva
      if CmeCadastro.Operacao = opInserir then
        begin
          cdsProxTransf.Close;
          cdsProxTransf.Data := CtrlAlterorcamento.ProxSuplemen(Sistema.idEmpresa);
          cds.FieldByName('NUMALTERACAO').asInteger := cdsProxTransf.FieldByName('PROXIMA').asInteger + 1;
        end;

      //Completa o código do plano orçamentario
      cds.FieldByName('IDPLANOORCAMEN').AsInteger := Modulo.iPlanoOrc;
      cds.FieldByName('IDPESSOA').AsFloat         := Sistema.idEmpresa;

      //Gera o ultimo sequencial da tabela
      if cds.FieldByName('IDALTERORCAMENTO').AsInteger <= 0 then
        begin
          cds.FieldByName('IDALTERORCAMENTO').AsInteger := CtrlAlterorcamento.LerUltimaSequencia;
        end;
    end;

  Accept := True;

  inherited;
end;

procedure TfrmTransfereMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  Inherited;
  If OrigemAbortConfirma <> OaBeforeConfirma Then
    Begin
      MsgDlg('Ocorreu o seguinte erro : '+ CtrlAlterorcamento.MessageInfo, 'Aviso', mtError,[mbOK],0);
    End;
end;

procedure TfrmTransfereMT.ImprimirTransf;
Var
  sMensagem : String;
begin
  cdsPeriodo.Data := CtrlPeriodoOrcamen.InicioFimPeriodo( Trunc( dbspnExercicioOri.value ),
                                                          Trunc( dbrPeriodoOri.value ),
                                                          Sistema.IdEmpresa );

  redSaldo.value := OrcamentoBackMT.ExibeSaldo( modulo.iPlanoOrc,
                                                dbeContaOrigem.text,
                                                FormatDateTime('dd/mm/yyyy', cdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime),
                                                modulo.sTipoSaldo);

  If Not TrptTransf.PrintReport( 3384, 1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                   cds.FieldByName('NUMALTERACAO').AsString + '|=|'+
                                   FloatToStr( redSaldo.Value )           + '|=|',
                                 '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem ) Then
    Begin
      MsgDlg(sMensagem, 'Impressão da Transferência ', mtError, [], 0);
    End;
End;
//************************************************
Procedure TfrmTransfereMT.sbtnInserirClick(Sender: TObject);
Begin
  Inherited;

  bbtnImprime.Enabled := False;
End;
//************************************************
Procedure TfrmTransfereMT.sbtnAlterarClick(Sender: TObject);
Begin
  Inherited;

  bbtnImprime.Enabled := False;
End;

procedure TfrmTransfereMT.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmTransfereMT.bbtnImprimeClick(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then
    Exit;

  ImprimirTransf;
end;

End.
