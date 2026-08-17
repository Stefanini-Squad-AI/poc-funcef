// Alterações:
{ --------------------------------------------------------------------------------------------------
Data      : 03/01/2006
Autor     : André Tavares
Pendencia : 19150
Descrição : Incluir o campo valot total efetivado da reserva (somatória dos valores dos comprometidos da reserva).
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Data      : 10/10/2005
Autor     : Rodolpho da Silva
Pendencia : 20383
Descrição : Incluir os campos Cód. e Nome do Centro de Responsabilidade no MontaSelect
---------------------------------------------------------------------------------------------------}
//==============================================================================
// Data      : 10/10/2005
// Autor     : Rodolpho da Silva
// Pendência : 18321
// Descrição : Filtrar no MontaSelect apenas as contas orçamentárias ativas
//==============================================================================
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroInsert
Data      : 24/06/2004
Autor     : André Pontes
Pendencia : 16910 (parcialmente)
Descrição : Correção do padrão
---------------------------------------------------------------------------------------------------}
// Alterações:
// data : 02/12/2003 - André Tavares - pendência - 15677
//        27/10/2003 - André Tavares - pendência 14009
//
{ --------------------------------------------------------------------------------------------------
Rotina    : - MontaSelect
Data      : 09/10/2003
Autor     : André Pontes
Pendencia : 14005
Descrição : Retirada a obrigatoriedade da forma de cálculo do Orçado ser Fluxo de Caixa ('X') para
            registro de reservas e compromissos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : MontaSelectConta
Autor(a)  : Gleyber
Data      : 18/08/2003
Pendência : 14006
Alteração : Incluído filtros para refinar a busca.
---------------------------------------------------------------------------------------------------}

unit FReservaMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
   wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, TREdit, 
   uCtrlReservaorcamen, uCtrlSaldoorcado, uCMTypes, uCmSqlParams, uCtrlRptOrcamen,
   AppEvnts, CMApplicationEvents, uCMMath, uCtrlPeriodoOrcamen, uFuncoesOrcamento;

type
  TfrmReservaMT = class(TFrmCadastroMT)
    dbrReservaNum: TDBRealEdit;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    lblCodigoConta: TLabel;
    dbeCodigoConta: TwwDBEdit;
    lblNome: TLabel;
    edtNomeConta: TEdit;
    Label3: TLabel;
    edtCentroResp: TEdit;
    Label11: TLabel;
    edtGrupo: TEdit;
    lblDataIni: TLabel;
    dbeDataRef: TCMDateTimePicker;
    Label1: TLabel;
    dbrValor: TDBRealEdit;
    Label12: TLabel;
    redSaldo: TRealEdit;
    Label2: TLabel;
    dbmemObs: TDBMemo;
    cdsSaldos: TCMClientDataSet;
    cdsProxReserva: TCMClientDataSet;
    MontaSelectConta: TMontaSelect;
    bbtnPermiteNeg: TBitBtn;
    bbtnBuscaConta: TBitBtn;
    dbeStatus: TEdit;
    Label13: TLabel;
    dbedUsuario: TwwDBEdit;
    bbtnImprime: TToolbarButton97;
    Label6: TLabel;
    DBredVlrEfet: TDBRealEdit;

    procedure FormCreate(Sender: TObject);
    procedure dbeCodigoContaExit(Sender: TObject);
    procedure dbeDataRefExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    function  STATUS:String;
    procedure bbtnImprime2Click(Sender: TObject);
    function  VerificaPreenchimento:boolean;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure ImprimirReserva;
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

   private  // Private declarations

      iIndice : longint;
      CtrlReservaorcamen: TCtrlReservaorcamen;
      CtrlSaldoorcado:    TCtrlSaldoorcado;

      CtrlPeriodoOrcamen: TCtrlPeriodoOrcamen;

   public   // Public declarations

   end;



var
  frmReservaMT: TfrmReservaMT;
  rValorAnt   : Extended;
  sContaAnt   : string;


implementation
{$R *.DFM}
uses
   UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, ppTypes,
   uCtrlOrcamento, rReserva, uCtrlParamIntegra;




procedure TfrmReservaMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Adiciona o filtro por Empresa Proprietária no MontaSelect
  MontaSelect.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + IntToStr(modulo.iPlanoOrc));
  MontaSelectConta.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                              'CODCENTRORESPON FROM PESSOAXCRESP WHERE ' +
                              'IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+')');

  CtrlReservaorcamen := TCtrlReservaorcamen.Create;
  CtrlSaldoorcado    := TCtrlSaldoorcado.Create;

  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;

  CtrlReservaorcamen.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlSaldoorcado.Initialize   ( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlPeriodoOrcamen.InitializeAs(CtrlReservaOrcamen);

  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlReservaorcamen.CdsReservaorcamen := cds;
  cds.Data := CtrlReservaorcamen.Procurar(-1);
end;



procedure TfrmReservaMT.dbeCodigoContaExit(Sender: TObject);
var
  sNomeConta, sCodCentroRespon, sNomeCentroRespon,
  sCodGrupo,  sNomeGrupo,       sUnid,
  sPPrev,     sCCusto,          sPatro            : String;
begin
  inherited;
  if ( dbeCodigoConta.text <> '' ) then begin

    if ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                           dbeCodigoConta.text,
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
                                           sPatro) = 0 ) then begin
      edtNomeConta.text  := sNomeConta;
      edtCentroResp.text := FormatMaskText( modulo.sMascaraCentRespon +
                                            ';0; ',
                                            sCodCentroRespon ) + ' - ' + sNomeCentroRespon;
      edtGrupo.text      := FormatMaskText( modulo.sMascaraGrupo +
                                            ';0; ',
                                            sCodGrupo ) + ' - ' + sNomeGrupo;
      redSaldo.value     := OrcamentoBackMT.ExibeSaldo( modulo.iPlanoOrc,
                                                        dbeCodigoConta.text,
                                                        DateToStr(date),
                                                        modulo.sTipoSaldo );
    end else begin

      dbeCodigoConta.clear;
      edtNomeConta.clear;
      edtCentroResp.clear;
      edtGrupo.clear;
      redSaldo.clear;
      if ( dbeCodigoConta.CanFocus ) then dbeCodigoConta.SetFocus;
    end;
  end;
end;



procedure TfrmReservaMT.dbeDataRefExit(Sender: TObject);
begin
  inherited;
  if trim(dbeDataRef.Text) <> '' then begin
    redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                      dbeCodigoConta.text,FormatDateTime('dd/mm/yyyy',
                      dbeDataRef.date),modulo.sTipoSaldo);
  end;
end;



procedure TfrmReservaMT.bbtnBuscaContaClick(Sender: TObject);
var
   sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
   sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro : String;
begin
  inherited;
  //Busca a Conta Orçamentária

  MontaSelectConta.Executar;
  if MontaSelectConta.RetornouValor then
   begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelectConta.ValoresChave[1],true,true,sNomeConta,sCodCentroRespon,
       sNomeCentroRespon,sCodGrupo,sNomeGrupo, sUnid,sPPrev,sCCusto,sPatro) = 0
       then begin
      dbeCodigoConta.text := MontaSelectConta.ValoresChave[1];
      cds.FieldByName('IDCONTAORCAMEN').asString := MontaSelectConta.ValoresChave[1];
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



function TfrmReservaMT.STATUS: String;
begin
  inherited;
  //Preenche o campo de Status da Reserva
  if cds.FieldByName('FLGRESERVA').asString = 'A' then begin
    dbeStatus.Font.Color := clBlack;
    Result := ' Aguardando...';
  end else begin
    if cds.FieldByName('FLGRESERVA').asString = 'E' then begin
      dbeStatus.Font.Color := clBlue;
      Result := ' Efetivada';
    end else begin
      if cds.FieldByName('FLGRESERVA').asString = 'C' then begin
        dbeStatus.Font.Color := clRed;
        Result := ' Cancelada';
      end else begin
        if cds.FieldByName('FLGRESERVA').asString = 'U' then begin
          dbeStatus.Font.Color := clGreen;
          Result := ' Em Uso';
        end else begin
          dbeStatus.Font.Color := clBlack;
          Result := '';
        end;
      end;
    end;
  end;
end;



procedure TfrmReservaMT.bbtnImprime2Click(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirReserva;
end;



function TfrmReservaMT.VerificaPreenchimento:boolean;
var sDataRef, sTipo : String;
    iExercicio, iPeriodo : Integer;
begin
  if ( frmReservaMT.CmeCadastro.Operacao in [opInserir, opAlterar] ) then begin
    //Inicializa as variáveis
    sTipo          := modulo.sTipoSaldo;
    sDataRef       := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
    iExercicio     := StrToInt(copy(sDataRef,7,4));
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
    if iPeriodo = -1 then begin
      MsgDlg('Período Bloqueado.','Erro',mtError,[mbOk],0);
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
    if (dbrValor.Value = 0) then begin
      MsgDlg('Valor da Reserva não informado.','Erro',mtError,[mbOk],0);
      if dbrValor.CanFocus then dbrValor.SetFocus;
      result := false;
      exit;
    end;
    //Verifica a tabela de Saldos para ver se a reserva pode ser feita
    //com o Saldo corrente
    if ( Modulo.sPermiteSaldoNeg = 'N' ) then begin

      if ( Not OrcamentoBackMT.VerificaSaldoProcesso( Modulo.iPlanoOrc,
                                                      dbeCodigoConta.text,
                                                      iExercicio,
                                                      iPeriodo,
                                                      ( dbrValor.value - rValorAnt),
                                                      True ) ) then begin
        Result := false;
        MsgDlg( 'Não existe saldo suficiente para esta Reserva.', 'Aviso', mtWarning, [ mbOk ], 0 );
        Exit;
      end;
    end;
  end;
  Result := True;
end;



procedure TfrmReservaMT.bbtnConfirmarClick(Sender: TObject);
begin
  if not VerificaPreenchimento then Exit;
  inherited;
  try
    Sistema.GravaLogOperacoes('Cadastro de Reserva Orçamentária');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;

end;



procedure TfrmReservaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlReservaorcamen.AplicaOperacaoReservaOrcamen;
end;



procedure TfrmReservaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlReservaorcamen.AplicaOperacaoReservaOrcamen;
end;



procedure TfrmReservaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlReservaorcamen.AplicaOperacaoReservaOrcamen;
end;



procedure TfrmReservaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  bbtnImprime.enabled := false;
  edtNomeConta.text  := '';
  edtCentroResp.text := '';
  edtGrupo.text      := '';
  dbeStatus.text     := '';
end;



procedure TfrmReservaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  rValorAnt := cds.FieldByName('VLRRESERVA').AsFloat;
  sContaAnt := cds.FieldByName('IDCONTAORCAMEN').AsString;
  if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
end;



procedure TfrmReservaMT.CmeCadastroFind(Sender: TObject);
var
   sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
   sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: String;
begin
  inherited;
  if MontaSelect.RetornouValor then begin
    //Se houve busca, abre a query principal apenas com o registro buscado
    iIndice := StrToInt(MontaSelect.ValoresChave[0]);
    bbtnImprime.enabled := true;
    with cds do begin
      Data := CtrlReservaorcamen.Procurar(iIndice);
      if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
         FieldByName('IDCONTAORCAMEN').asString,true,true,sNomeConta,
         sCodCentroRespon,sNomeCentroRespon,sCodGrupo,sNomeGrupo,sUnid,sPPrev,
         sCCusto,sPatro) = 0 then
         begin
        edtNomeConta.text  := sNomeConta;
        edtCentroResp.text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                              sCodCentroRespon) + ' - ' + sNomeCentroRespon;
        edtGrupo.text      := FormatMaskText(modulo.sMascaraGrupo + ';0; ',
                              sCodGrupo) + ' - ' + sNomeGrupo;
        redSaldo.value     := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                              FieldByName('IDCONTAORCAMEN').asString,
                              DateToStr(date),modulo.sTipoSaldo);
      end;
    end;
    dbeStatus.text := STATUS;
  end;
end;



procedure TfrmReservaMT.CmeCadastroInsert(Sender: TObject);
begin
   rValorAnt := 0;
   edtNomeConta.text  := '';
   edtCentroResp.text := '';
   edtGrupo.text      := '';
   dbeStatus.text     := '';

   Cds.Close;
   Cds.CreateDataSet;

   inherited;

   cds.FieldByName('FLGRESCOMP').asString := 'R';
   cds.FieldByName('IDMODULO').asInteger  := 52;
   if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
end;



procedure TfrmReservaMT.ImprimirReserva;
var
  sMensagem : String;
begin

  redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                    dbeCodigoConta.text,FormatDateTime('dd/mm/yyyy', dbeDataRef.date),
                    modulo.sTipoSaldo);

  if Not TrptReserva.PrintReport( 3155, 1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                  cds.FieldByName('NUMRESERVA').AsString + '|=|' +
                                  FloatToStr( redSaldo.value )         + '|=|',
                                  '', 'BaseDados', Sistema.NomeEmpresa, Sistema.NomeModulo, sMensagem ) then begin
    MsgDlg(sMensagem, 'Impressão da Reserva', mtError, [], 0);
  end;
end;



procedure TfrmReservaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := False;

  if not CtrlPeriodoOrcamen.PeriodoLiberado(dbeDataRef.Text, Sistema.IdEmpresa) then
  begin
      MsgDlg('Período BLOQUEADO para lançamentos e alterações.', 'Orçamento', mtError, [mbOk], 0);
      EXIT;
  end;

  if frmReservaMT.CmeCadastro.Operacao in [opAlterar] then begin
    if cds.FieldByName('FLGRESERVA').asString <> 'A' then begin
      MsgDlg('O Status da Reserva não permite alteração.','Erro',mtError,
             [mbOk],0);
      if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
      exit;
    end;
  end;

  if frmReservaMT.CmeCadastro.Operacao = opInserir then begin
    //Cria o número da próxima reserva
    with cdsProxReserva do begin
      Close;
      Data := CtrlReservaorcamen.ProximaReserva(Sistema.idEmpresa);
      cds.FieldByName('NUMRESERVA').asInteger := FieldByName('PROXIMA').asInteger + 1;
    end;
  end;

  //Completa o código do plano orçamentario
  cds.FieldByName('IDPLANOORCAMEN').AsInteger := Modulo.iPlanoOrc;
  cds.FieldByName('FLGRESERVA').AsString      := 'A';
  cds.FieldByName('IDPESSOA').AsFloat         := Sistema.idEmpresa;
  cds.FieldByName('EXERCICIO').AsInteger      :=
                                    StrToInt( copy( FormatDateTime( 'dd/mm/yyyy', dbeDataRef.date ), 7,4));
  cds.FieldByName('PERIODO').AsInteger := OrcamentoBackMT.EncontraPeriodo
                                 (FormatDateTime('dd/mm/yyyy',dbeDataRef.date));
  dbeStatus.text := STATUS;

  //Gera o número sequencial da próxima reserva
  if cds.FieldByName('IDRESERVAORCAMEN').asInteger <= 0 then begin
    cds.FieldByName('IDRESERVAORCAMEN').AsInteger := CtrlReservaOrcamen.LerUltimaSequencia;
  end;

  Accept := True;

  inherited;

end;



procedure TfrmReservaMT.CmeCadastroConfirma(Sender: TObject);
var
   sDataRef: String;
   iExercicio, iPeriodo: Integer;
   rValorAtu   : Extended;
   TextoLog : string;
begin
   bbtnImprime.enabled := false;
   if ( frmReservaMT.CmeCadastro.Operacao in [opInserir, opAlterar] ) then begin
     //Inicializa as variáveis
     sDataRef       := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
     iExercicio     := StrToInt(copy(sDataRef,7,4));
     iPeriodo       := OrcamentoBackMT.EncontraPeriodo(sDataRef);

     if dbrValor.Value <> rValorAnt then
       rValorAtu := dbrValor.Value - rValorAnt
     else
       rValorAtu := dbrValor.Value;

     try
       //Atualiza a tabela de Saldos com o Valor do Saldo Reservado
       if ( OrcamentoBackMT.VerificaSaldo( Modulo.iPlanoOrc,
                                           dbeCodigoConta.text,
                                           OrcamentoBackMT.PrimeiroDiaPeriodo( iExercicio,
                                                                               iPeriodo ) ) ) then
       begin
         if sContaAnt <> dbeCodigoConta.Text then
           begin
             // Retira Valor da Conta Antiga porque a Conta foi ALTERADA
             CtrlSaldoorcado.AtualizaVlrReservado( Modulo.iPlanoOrc,
                                                   Sistema.idEmpresa,
                                                   sContaAnt,
                                                   OrcamentoBackMT.PrimeiroDiaPeriodo( iExercicio, iPeriodo ),
                                                   (rValorAnt * -1) );

             // Inclui Valor na Nova Conta porque a Conta foi ALTERADA
             CtrlSaldoorcado.AtualizaVlrReservado( Modulo.iPlanoOrc,
                                                   Sistema.idEmpresa,
                                                   dbeCodigoConta.Text,
                                                   OrcamentoBackMT.PrimeiroDiaPeriodo( iExercicio, iPeriodo ),
                                                   dbrValor.Value );
           end
         else
           begin
             // Modifica o Valor na mesma conta
             CtrlSaldoorcado.AtualizaVlrReservado( Modulo.iPlanoOrc,
                                                   Sistema.idEmpresa,
                                                   dbeCodigoConta.Text,
                                                   OrcamentoBackMT.PrimeiroDiaPeriodo( iExercicio, iPeriodo ),
                                                   (dbrValor.Value - rValorAnt) );

           end;
       end
       else
       begin

         CtrlSaldoorcado.InsereSaldo( iExercicio,
                                      iPeriodo,
                                      Modulo.iPlanoOrc,
                                      Sistema.idEmpresa,
                                      dbeCodigoConta.Text,
                                      OrcamentoBackMT.PrimeiroDiaPeriodo ( iExercicio,
                                                                           iPeriodo),
                                      0,
                                      0,
                                      dbrValor.value-rValorAnt,
                                      0,
                                      0,
                                      0);
       end;

       inherited;
       MsgDlg( 'Reserva efetuada com sucesso.', 'Aviso', mtWarning, [ mbOk ], 0 );

       if ( MsgDlg( 'Deseja imprimir esta reserva?', 'Aviso', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes ) then begin

         ImprimirReserva;
       end;
     except

       MsgDlg( 'Foram detectados problemas na realização da Reserva.', 'Aviso', mtWarning, [ mbOk ], 0 );
     end;
   end;

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FReservaMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

   redSaldo.value     := 0;
   edtNomeConta.text  := '';
   edtCentroResp.text := '';
   edtGrupo.text      := '';
   dbeStatus.text     := '';
end;



procedure TfrmReservaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   // inherited;
   cds.Data := CtrlReservaorcamen.Procurar(cds.FieldByName('IDRESERVAORCAMEN').AsFloat);
end;



procedure TfrmReservaMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if OrigemAbortConfirma <> OaBeforeConfirma then MsgDlg('Ocorreu o seguinte erro : '+ CtrlReservaorcamen.MessageInfo, 'Aviso', mtError, [mbOK], 0);
end;



procedure TfrmReservaMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedUsuario.text := sistema.NomeUsuario;
end;

procedure TfrmReservaMT.bbtnImprimeClick(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirReserva;
end;


procedure TfrmReservaMT.FormDestroy(Sender: TObject);
begin

  FreeAndNil(CtrlReservaorcamen);
  FreeAndNil(CtrlSaldoorcado);
  FreeAndNil(CtrlPeriodoOrcamen);

  inherited;

end;

end.
