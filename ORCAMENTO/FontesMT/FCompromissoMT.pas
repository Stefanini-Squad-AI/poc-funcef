// Alterações:
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
// Descrição : Filtrar no MontaSelectConta apenas as contas orçamentárias ativas
//==============================================================================
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroInsert
Data      : 24/06/2004
Autor     : André Pontes
Pendencia : 16910 (parcialmente)
Descrição : Correção do padrão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroConfirma
Data      : 12/12/2003
Autor     : André Pontes
Pendencia : 15102
Descrição : Correção do valor reservado
---------------------------------------------------------------------------------------------------}
// data : 02/12/2003 - André Tavares - pendência - 15676
//        27/10/2003 - André Tavares - pendência 14009 - incluí o campo usuário

{ --------------------------------------------------------------------------------------------------
Rotina    : - MontaSelect
Data      : 09/10/2003
Autor     : André Pontes
Pendencia : 14005
Descrição : Retirada a obrigatoriedade da forma de cálculo do Orçado ser Fluxo de Caixa ('X') para
            registro de reservas e compromissos
---------------------------------------------------------------------------------------------------}

unit
   FCompromissoMT;

Interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, ComCtrls, wwriched,
   Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, DBCtrls, Mask, wwdbedit, TREdit, wwdbdatetimepicker,
   CMDateTimePicker, ExtCtrls, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect, DBTables, IvDictio,
   IvMulti, IvEMulti, Wwquery, MAHlpBtn, TB97,TB97Ctls,TB97Tlbr, ppPrvDlg, ppForms, FCadastroMT,
   DBClient, uCMClientDataSet, uCtrlReservaorcamen, uCtrlSaldoorcado, uCtrlCompromisso, uCtrlResxcomp,
   uCtrlPeriodoOrcamen, uCMTypes, uCmSqlParams, uCMMath, uCtrlOrcamento, uFuncoesOrcamento, uctrlParamIntegra;

type
   TfrmCompromissoMT = class(TFrmCadastroMT)
      PageControl1: TPageControl;
      TbsCompromisso: TTabSheet;
      TbsReserva: TTabSheet;
      lblCodigoConta: TLabel;
      lblNome: TLabel;
      lblDataIni: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Bevel1: TBevel;
      Label5: TLabel;
      Label6: TLabel;
      bbtnBuscaConta: TBitBtn;
      dbeDataRef: TCMDateTimePicker;
      dbrValor: TDBRealEdit;
      dbrReservaNum: TDBRealEdit;
      DBRealEdit1: TDBRealEdit;
      btnVaiUm: TSpeedButton;
      btnVoltaUm: TSpeedButton;
      Label7: TLabel;
      Label8: TLabel;
      dteDataIni: TCMDateTimePicker;
      dteDataFim: TCMDateTimePicker;
      Label10: TLabel;
      btnFiltra: TBitBtn;
      Label9: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      redSaldo: TRealEdit;
      dbmemObs: TDBMemo;
      edtNomeConta: TEdit;
      edtCentroResp: TEdit;
      edtGrupo: TEdit;
      dbeCodigoConta: TwwDBEdit;
      MontaSelectConta: TMontaSelect;
      cdsProxReserva: TCMClientDataSet;
      dbeStatus: TEdit;
      ltvReserva: TListView;
      CdsReservaECompromisso: TCMClientDataSet;
      DtsReservaECompromisso: TwwDataSource;
      ltvCompromisso: TListView;
      Label13: TLabel;
      dbedUsuario: TwwDBEdit;
      bbtnImprime: TToolbarButton97;

      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      function  VerificaPreenchimento: boolean;
      procedure bbtnBuscaContaClick(Sender: TObject);
      function  STATUS: String;
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnFiltraClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnImprime2Click(Sender: TObject);
      procedure dbeCodigoContaExit(Sender: TObject);
      procedure dbeDataRefExit(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure ImprimirCompromisso;
      procedure btnVaiUmClick(Sender: TObject);
      procedure btnVoltaUmClick(Sender: TObject);
      procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);

   private  // Private declarations

      iIndice              : longint;
      CtrlReservaorcamen   : TCtrlReservaorcamen;
      CtrlSaldoorcado      : TCtrlSaldoorcado;
      CtrlCompromisso      : TCtrlCompromisso;
      CtrlResxcomp         : TCtrlResxcomp;

      CtrlOrcamento        : TOrcamentoBackMT;

      CtrlPeriodoOrcamen   : TCtrlPeriodoOrcamen;
      function VerificaContasReservaCompromisso : boolean;

      procedure IncluirEm(pLtvDestino  : TListView;
                          pCaption     : String;
                          pSubItems0   : String;
                          pSubItems1   : String;
                          pSubItems2   : String
                         );

      procedure RetirarDe(pLtvDestino: TListView; pPosicao: Integer);

      procedure AtualizaReservaECompromisso;

      function PosicionaEm(pNumReserva: String): boolean;


   public   // Public declarations

   end;



var
   frmCompromissoMT  : TfrmCompromissoMT;
   rValorAnt         : Extended;
   rValorReservas    : Extended;
   sContaAnt         : string;


implementation
{$R *.DFM}
uses
   UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo,
   rCompromisso, ppTypes, uVerificaPreenchimento;



procedure TfrmCompromissoMT.FormCreate(Sender: TObject);
begin
   inherited;

   // Adiciona o filtro por Empresa Proprietária no MontaSelect
   MontaSelect.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MontaSelectConta.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
   MontaSelectConta.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT CODCENTRORESPON FROM PESSOAXCRESP WHERE IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+ ')');

   CtrlReservaorcamen   := TCtrlReservaorcamen.Create;
   CtrlSaldoorcado      := TCtrlSaldoorcado.Create;
   CtrlCompromisso      := TCtrlCompromisso.Create;
   CtrlResxcomp         := TCtrlResxcomp.Create;

   CtrlPeriodoOrcamen   := TCtrlPeriodoOrcamen.Create;

   CtrlOrcamento        := TOrcamentoBackMT.Create;

   CtrlReservaorcamen.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True,
                                 nil,
                                 nil,
                                 False
                                );

   CtrlSaldoorcado.InitializeAs(CtrlReservaorcamen);
   CtrlCompromisso.InitializeAs(CtrlReservaorcamen);
   CtrlResxcomp.InitializeAs(CtrlReservaorcamen);

   CtrlPeriodoOrcamen.InitializeAs(CtrlReservaorcamen);

   CtrlOrcamento.InitializeAs(CtrlReservaorcamen);

   // Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
   CtrlReservaorcamen.CdsReservaorcamen := cds;
   cds.Data := CtrlReservaorcamen.Procurar(-1);
end;



procedure TfrmCompromissoMT.FormShow(Sender: TObject);
begin
   inherited;
   PageControl1.ActivePage := TbsCompromisso;
end;



procedure TfrmCompromissoMT.CmeCadastroCancel(Sender: TObject);
begin
   inherited;

   bbtnImprime.Enabled  := False;
   edtNomeConta.Text    := '';
   edtCentroResp.Text   := '';
   edtGrupo.Text        := '';
   dbeStatus.Text       := '';

   ltvReserva.Items.Clear;
   ltvCompromisso.Items.Clear;

   RedSaldo.Value := 0;

   Cds.Close;
   CdsReservaECompromisso.Close;

   Cds.Data := CtrlReservaorcamen.Procurar(-1);

   PageControl1.ActivePage := TbsCompromisso;
end;

procedure TfrmCompromissoMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bbtnImprime.Enabled  := False;
   rValorAnt := cds.FieldByName('VLRRESERVA').AsFloat;
   sContaAnt := cds.FieldByName('IDCONTAORCAMEN').AsString;
   if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
end;



function TfrmCompromissoMT.VerificaPreenchimento: boolean;
var
   sTipo       : String;
   sDataRef    : String;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := True;

   if frmCompromissoMT.CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      Result := False;

      try
         // Inicializa as variáveis

         sDataRef    := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
         iExercicio  := StrToInt(copy(sDataRef,7,4));
         sTipo       := Modulo.sTipoSaldo;

         // Faz a verificação do preenchimento dos campos
         if dbeCodigoConta.Text = '' then
            raise EValidacao.CreateVal('É necessário indicar o código da Conta!', dbeCodigoConta);

         if dbeDataRef.Text = '' then
            raise EValidacao.CreateVal('Data de Referência não informada!', dbeDataRef);

         iPeriodo := OrcamentoBackMT.EncontraPeriodo(sDataRef);

         if iPeriodo = 0 then
            raise EValidacao.CreateVal('Não existe um Período ou Exercício para a Data de referência informada!', dbeDataRef);

         if iPeriodo = -1 then
            raise EValidacao.CreateVal('Período bloqueado!', dbeDataRef);

         if dbrValor.Value = 0 then
            raise EValidacao.CreateVal('Valor do Compromisso não pode ser igual a ZERO!', dbrValor);


         // Verifica a tabela de Saldos para ver se o compromisso pode ser feita
         // com o Saldo corrente
         if Modulo.sPermiteSaldoNeg = 'N' then
         begin
            if not(OrcamentoBackMT.VerificaSaldoProcesso(Modulo.iPlanoOrc,
                                                         dbeCodigoConta.Text,
                                                         iExercicio,
                                                         iPeriodo,
                                                         (dbrValor.value - rValorAnt - rValorReservas),
                                                         True)) then
            begin
               raise EValidacao.CreateVal(OrcamentoBackMT.MessageInfo, dbrValor);
            end;
         end;

      except
         on ev : EValidacao do
         begin
            if ev.Show then MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);
            Repaint;
            if ev.Control.CanFocus then ev.Control.SetFocus;
            Exit;
         end;
      end;

      Result := True;
   end;
end;



procedure TfrmCompromissoMT.CmeCadastroConfirma(Sender: TObject);
var
   sDataRef       : String;
   iExercicio     : Integer;
   iPeriodo       : Integer;
   iIdCompromisso : Integer;
   rValorAtu      : Extended;
   TextoLOG       : string;
begin
   bbtnImprime.Enabled := False;

   if (CmeCadastro.Operacao in [opInserir, opAlterar]) then
   begin
      // Inicializa as variáveis
      sDataRef   := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);
      iExercicio := StrToInt(copy(sDataRef, 7, 4));
      iPeriodo   := OrcamentoBackMT.EncontraPeriodo(sDataRef);

      iIndice    := cds.FieldByName('IDRESERVAORCAMEN').AsInteger;

      if dbrValor.Value <> rValorAnt then
        rValorAtu := dbrValor.Value - rValorAnt
      else
        rValorAtu := dbrValor.Value;

      // VERIFICAÇÃO NECESSÁRIA, POIS PODEMOS APENAS ESTAR ALTERANDO O REGISTRO
      if cds.FieldByName('IDRESERVAORCAMEN').asInteger <= 0 then
        begin
          iIdCompromisso := CtrlReservaOrcamen.LerUltimaSequencia;
        end
      else
        begin
          iIdCompromisso := cds.FieldByName('IDRESERVAORCAMEN').AsInteger;
        end;

      try
         // Atualiza a tabela de Saldos com o Valor do Saldo Compromissado
         if OrcamentoBackMT.VerificaSaldo(Modulo.iPlanoOrc,
                                          dbeCodigoConta.Text,
                                          OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio, iPeriodo)
                                         ) then
         begin
            if sContaAnt <> dbeCodigoConta.Text then
              begin
                // Retira Valor da Conta Antiga porque a Conta foi ALTERADA
                CtrlSaldoorcado.TrocaSaldoReservadopCompromissado(rValorReservas,
                                                                  (rValorAnt * -1),
                                                                  Sistema.idEmpresa,
                                                                  Modulo.iPlanoOrc,
                                                                  OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio, iPeriodo),
                                                                  sContaAnt
                                                                 );

                // Inclui Valor na Nova Conta porque a Conta foi ALTERADA
                CtrlSaldoorcado.TrocaSaldoReservadopCompromissado(rValorReservas,
                                                                  dbrValor.Value,
                                                                  Sistema.idEmpresa,
                                                                  Modulo.iPlanoOrc,
                                                                  OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio, iPeriodo),
                                                                  dbeCodigoConta.Text
                                                                 );
              end
            else
              begin
                // Modifica o Valor na mesma conta
                CtrlSaldoorcado.TrocaSaldoReservadopCompromissado(rValorReservas,
                                                                  (dbrValor.Value - rValorAnt),
                                                                  Sistema.idEmpresa,
                                                                  Modulo.iPlanoOrc,
                                                                  OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio, iPeriodo),
                                                                  dbeCodigoConta.Text
                                                                 );

              end;
         end
         else
         begin
            CtrlSaldoorcado.InsereSaldo(iExercicio,
                                        iPeriodo,
                                        Modulo.iPlanoOrc,
                                        Sistema.idEmpresa,
                                        dbeCodigoConta.Text,
                                        OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio, iPeriodo),
                                        0,
                                        0,
                                        0,
                                        (dbrValor.Value - rValorAnt),
                                        0,
                                        0
                                       );
         end;

         AtualizaReservaECompromisso;

         inherited;

         MsgDlg('Compromisso efetuado com sucesso.', 'Orçamento', mtInformation, [mbOk], 0);
         Repaint;

         if MsgDlg('Deseja imprimir este Compromisso?', 'Orçamento', mtConfirmation, [mbYes, mbNo],0) = mrYes then
         begin
            Repaint;
            ImprimirCompromisso;
         end;
         Repaint;

      except
         MsgDlg('Foram detectados problemas na realização do Compromisso.', 'Orçamento', mtError, [mbOk], 0);
         Repaint;
      end;

   end;

   redSaldo.Value       := 0;
   edtNomeConta.Text    := '';
   edtCentroResp.Text   := '';
   edtGrupo.Text        := '';
   dbeStatus.Text       := '';

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FCompromissoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

   try
      Sistema.GravaLogOperacoes('Cadastro de Compromisso Orçamentário.');
   except
      Raise Exception.Create('Não foi possível Gravar o Log');
      Repaint;
   end;

end;



procedure TfrmCompromissoMT.CmeCadastroFind(Sender: TObject);
var
   sNomeConta        : String;
   sCodCentroRespon  : String;
   sNomeCentroRespon : String;
   sCodGrupo         : String;
   sNomeGrupo        : String;
   sUnid             : String;
   sPPrev            : String;
   sCCusto           : String;
   sPatro            : String;
begin
   PageControl1.ActivePage := TbsCompromisso;

   CdsReservaECompromisso.Close;

   rValorReservas := 0;

   ltvReserva.Items.Clear;
   ltvCompromisso.Items.Clear;

   inherited;

   if MontaSelect.RetornouValor then
     begin
       Repaint;

       // Se houve busca, abre a query principal apenas com o registro buscado
       iIndice := StrToInt(MontaSelect.ValoresChave[0]);

       with cds do
         begin
           Data := CtrlReservaorcamen.Procurar(iIndice);

           if OrcamentoBackMT.BuscaContaOrcamen(Modulo.iPlanoOrc,
                                                FieldByName('IDCONTAORCAMEN').asString,
                                                True,
                                                True,
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
               edtNomeConta.Text    := sNomeConta;
               edtCentroResp.Text   := FormatMaskText(Modulo.sMascaraCentRespon + ';0; ', sCodCentroRespon) + ' - ' + sNomeCentroRespon;
               edtGrupo.Text        := FormatMaskText(Modulo.sMascaraGrupo + ';0; ', sCodGrupo) + ' - ' + sNomeGrupo;
               redSaldo.Value       := OrcamentoBackMT.ExibeSaldo(Modulo.iPlanoOrc,
                                                                  FieldByName('IDCONTAORCAMEN').AsString,
                                                                  FieldByName('DATAREFERENCIA').AsString,
                                                                  Modulo.sTipoSaldo
                                                                 );
               dbeStatus.Text       := STATUS;
             end;
         end;
     end;

   // Busca os registros detalhes
   with CdsReservaECompromisso do
     begin
       Data := CtrlResXComp.ListarReservasDoCompromisso(Cds.FieldByName('IDRESERVAORCAMEN').AsFloat, Sistema.IdEmpresa);
       while not(EOF) do
         begin
           begin
             IncluirEm(ltvCompromisso,
                       FieldByName('NUMRESERVA').AsString,
                       FieldByName('DATAREFERENCIA').AsString,
                       FormatFloat('###,###,##0.00',
                       FieldByName('VLRRESERVA').AsFloat),
                       FieldByName('CODCENTRORESPON').AsString);
           end;
           Next;
         end;
     end;


   Repaint;
end;



procedure TfrmCompromissoMT.CmeCadastroInsert(Sender: TObject);
begin
   PageControl1.ActivePage := TbsCompromisso;

   CdsReservaECompromisso.Close;

   rValorReservas       := 0;
   edtNomeConta.Text    := '';
   edtCentroResp.Text   := '';
   edtGrupo.Text        := '';
   dbeStatus.Text       := '';
   rValorAnt            := 0;

   Cds.Close;
   Cds.CreateDataSet;

   inherited;

   cds.FieldByName('FLGRESCOMP').asString := 'C';
   cds.FieldByName('IDMODULO').asInteger  := 52;

   if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
end;



procedure TfrmCompromissoMT.bbtnBuscaContaClick(Sender: TObject);
var
   sNomeConta        : String;
   sCodCentroRespon  : String;
   sNomeCentroRespon : String;
   sCodGrupo         : String;
   sNomeGrupo        : String;
   sUnid             : String;
   sPPrev            : String;
   sCCusto           : String;
   sPatro            : String;
begin
   inherited;

   dbrValor.Clear;
   dbeCodigoConta.Clear;
   edtNomeConta.Clear;
   edtCentroResp.Clear;
   edtGrupo.Clear;
   dbeDataRef.Clear;
   dteDataIni.Clear;
   dteDataFim.Clear;
   CdsReservaECompromisso.Close;
   ltvReserva.Items.Clear;
   ltvCompromisso.Items.Clear;
   if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;


   if CmeCadastro.Operacao = opAlterar then
     if not CdsReservaECompromisso.IsEmpty then
       begin
         MsgDlg('Este Compromisso possui Reservas relacionadas' +#13+
                'não sendo permitida a alteração!', 'Orçamento', mtWarning, [mbOk], 0);
         EXIT;
       end;


   // Busca a Conta Orçamentária
   MontaSelectConta.Executar;

   if MontaSelectConta.RetornouValor then
     begin
        if OrcamentoBackMT.BuscaContaOrcamen(Modulo.iPlanoOrc,
                                             MontaSelectConta.ValoresChave[1],
                                             True,
                                             True,
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
             cds.FieldByName('IDCONTAORCAMEN').asString := MontaSelectConta.ValoresChave[1];

             dbeCodigoConta.Text  := MontaSelectConta.ValoresChave[1];
             edtNomeConta.Text    := sNomeConta;
             edtCentroResp.Text   := FormatMaskText(Modulo.sMascaraCentRespon + ';0; ', sCodCentroRespon) + ' - ' + sNomeCentroRespon;
             edtGrupo.Text        := FormatMaskText(Modulo.sMascaraGrupo + ';0; ', sCodGrupo) + ' - ' + sNomeGrupo;
             redSaldo.value       := OrcamentoBackMT.ExibeSaldo(Modulo.iPlanoOrc,
                                                                dbeCodigoConta.Text,
                                                                DateToStr(date),
                                                                Modulo.sTipoSaldo
                                                               );
          end
        else
          begin
             dbeCodigoConta.clear;
             edtNomeConta.clear;
             edtCentroResp.clear;
             edtGrupo.clear;
             redSaldo.clear;

             if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
          end;
     end;
end;



function TfrmCompromissoMT.STATUS: String;
begin
   inherited;

   // Preenche o campo de Status do Compromisso
   if cds.FieldByName('FLGRESERVA').asString = 'A' then
   begin
      dbeStatus.Font.Color := clBlack;
      Result := ' Aguardando...';
   end
   else
   begin
      if cds.FieldByName('FLGRESERVA').asString = 'E' then
      begin
         dbeStatus.Font.Color := clBlue;
         Result := ' Efetivado';
      end
      else
      begin
         if cds.FieldByName('FLGRESERVA').asString = 'C' then
         begin
            dbeStatus.Font.Color := clRed;
            Result               := ' Cancelado';
         end
         else
         begin
            dbeStatus.Font.Color := clBlack;
            Result               := '';
         end;
      end;
   end;
end;



procedure TfrmCompromissoMT.btnFiltraClick(Sender: TObject);
begin
   inherited;
   if CmeCadastro.Operacao = opAlterar then
       begin
         MsgDlg('Não é permitido incluir/excluir Reservas' +#13+
                'na alteração de um Compromisso!', 'Orçamento', mtWarning, [mbOk], 0);
         EXIT;
       end;

   if dteDataIni.Text = '' then
     begin
       MsgDlg('A data Inicial do Filtro deve ser preenchida.', 'Orçamento', mtWarning, [mbOk],0);
       Repaint;
       if dteDataIni.CanFocus then dteDataIni.SetFocus;
       Exit;
     end;

   if dteDataFim.Text = '' then
     begin
       MsgDlg('A data Final do Filtro deve ser preenchida.', 'Orçamento', mtWarning, [mbOk],0);
       Repaint;
       if dteDataFim.CanFocus then dteDataFim.SetFocus;
       Exit;
     end;

   with CdsReservaECompromisso do
     begin
        // Busca as reservas existentes lançadas na Conta Orçamentária
        Data := CtrlCompromisso.ReservaECompromisso(Sistema.idEmpresa,
                                                    Modulo.iPlanoOrc,
                                                    Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                    dteDataIni.Text,
                                                    dteDataFim.Text,
                                                    Cds.FieldByName('NUMRESERVA').AsFloat
                                                   );
        ltvReserva.Items.Clear;

        while not(EOF) do
          begin
            if (FieldByName('FLGRESERVA').AsString = 'A') then
              begin
                if ltvCompromisso.FindCaption(0, FieldByName('NUMRESERVA').AsString, False, True, True) <> nil then
                  begin
                    CdsReservaECompromisso.Next;
                    CONTINUE;
                  end;

                IncluirEm(ltvReserva,
                          FieldByName('NUMRESERVA').AsString,
                          FieldByName('DATAREFERENCIA').AsString,
                          FormatFloat('###,###,##0.00',
                          FieldByName('VLRRESERVA').AsFloat),
                          FieldByName('CODCENTRORESPON').AsString);
              end;

            CdsReservaECompromisso.Next;

          end;
     end;
end;



procedure TfrmCompromissoMT.bbtnConfirmarClick(Sender: TObject);
begin
   if not(VerificaPreenchimento) then Exit;

   inherited;

   PageControl1.ActivePage := TbsCompromisso;
end;



procedure TfrmCompromissoMT.bbtnImprime2Click(Sender: TObject);
begin
   inherited;

   if not(VerificaPreenchimento) then Exit;

   ImprimirCompromisso;
end;



procedure TfrmCompromissoMT.dbeCodigoContaExit(Sender: TObject);
var
   sNomeConta        : String;
   sCodCentroRespon  : String;
   sNomeCentroRespon : String;
   sCodGrupo         : String;
   sNomeGrupo        : String;
   sUnid             : String;
   sPPrev            : String;
   sCCusto           : String;
   sPatro            : String;
begin
   inherited;

   if dbeCodigoConta.Text <> '' then
   begin
      if OrcamentoBackMT.BuscaContaOrcamen(Modulo.iPlanoOrc,
                                           dbeCodigoConta.Text,
                                           True,
                                           True,
                                           sNomeConta,
                                           sCodCentroRespon,
                                           sNomeCentroRespon,
                                           sCodGrupo,
                                           sNomeGrupo,
                                           sUnid,
                                           sPPrev,
                                           sCCusto,
                                           sPatro
                                          ) = 0 then
      begin
         edtNomeConta.Text  := sNomeConta;
         edtCentroResp.Text := FormatMaskText(Modulo.sMascaraCentRespon + ';0; ', sCodCentroRespon) + ' - ' + sNomeCentroRespon;
         edtGrupo.Text      := FormatMaskText(Modulo.sMascaraGrupo + ';0; ', sCodGrupo) + ' - ' + sNomeGrupo;
         redSaldo.value     := OrcamentoBackMT.ExibeSaldo(Modulo.iPlanoOrc,
                                                          dbeCodigoConta.Text,
                                                          DateToStr(date),
                                                          Modulo.sTipoSaldo
                                                         );
      end
      else
      begin
         dbeCodigoConta.clear;
         edtNomeConta.clear;
         edtCentroResp.clear;
         edtGrupo.clear;
         redSaldo.clear;

         if dbeCodigoConta.CanFocus then dbeCodigoConta.SetFocus;
      end;
   end;
end;



procedure TfrmCompromissoMT.dbeDataRefExit(Sender: TObject);
begin
   inherited;

   if trim(dbeDataRef.Text) <> '' then
   begin
      redSaldo.value := OrcamentoBackMT.ExibeSaldo(Modulo.iPlanoOrc,
                                                   dbeCodigoConta.Text,
                                                   FormatDateTime('dd/mm/yyyy', dbeDataRef.date),
                                                   Modulo.sTipoSaldo
                                                  );
   end;
end;



procedure TfrmCompromissoMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   sDataRef: String;
begin
   Accept := False;

  if CdsReservaECompromisso.Active then
    if not VerificaContasReservaCompromisso then
      begin
        MsgDlg('Existem Reservas com Conta Orçamentária diferente do Compromisso!',
               'Orçamento', mtWarning, [mbOk], 0);
        EXIT;
      end;


  if CmeCadastro.Operacao = opAlterar then
    if not CdsReservaECompromisso.IsEmpty then
      begin
        MsgDlg('Este Compromisso possui Reservas relacionadas' +#13+
               'não sendo permitida a alteração!', 'Orçamento', mtWarning, [mbOk], 0);
        EXIT;
      end;

  if not CtrlPeriodoOrcamen.PeriodoLiberado(dbeDataRef.Text, Sistema.IdEmpresa) then
    begin
      MsgDlg('Período BLOQUEADO para lançamentos e alterações.', 'Orçamento', mtError, [mbOk], 0);
      EXIT;
    end;

  if frmCompromissoMT.CmeCadastro.Operacao in [opAlterar] then
  begin
     if cds.FieldByName('FLGRESERVA').asString <> 'A' then
     begin
        MsgDlg('O Status do Compromisso não permite alteração.', 'Orçamento', mtError, [mbOk], 0);
        Repaint;
        if dbeDataRef.CanFocus then dbeDataRef.SetFocus;
        Exit;
     end;
  end;

  if rValorReservas > 0 then
  begin
     if StrToFloat(Format('%15.2f', [(dbrValor.Value - rValorAnt)])) > StrToFloat(Format('%15.2f', [rValorReservas])) then
     begin
        if MsgDlg('O Valor do Compromisso é superior ao valor das Reservas que o compõe. Deseja prosseguir mesmo assim?', 'Orçamento', mtConfirmation, [mbYes, mbNo],0) = mrNo then
        begin
           Repaint;
           Exit;
        end;
        Repaint;
     end;
  end;

  // Inicializa a variável
  sDataRef := FormatDateTime('dd/mm/yyyy', dbeDataRef.date);

  if frmCompromissoMT.CmeCadastro.Operacao = opInserir then
  begin
     // Cria o NÚMERO da próxima reserva
     with cdsProxReserva do
     begin
        Close;

        Data := CtrlReservaorcamen.ProximaReserva(Sistema.idEmpresa);

        cds.FieldByName('NUMRESERVA').asInteger := FieldByName('PROXIMA').asInteger + 1;
        dbrReservaNum.Value                     := FieldByName('PROXIMA').asInteger + 1;
     end;
  end;

  // Completa o código do plano orçamentario
  cds.FieldByName('IDPLANOORCAMEN').AsInteger := Modulo.iPlanoOrc;
  cds.FieldByName('FLGRESERVA').AsString      := 'A';
  cds.FieldByName('IDPESSOA').AsFloat         := Sistema.idEmpresa;
  cds.FieldByName('EXERCICIO').AsInteger      := StrToInt(copy(sDataRef,7,4));
  cds.FieldByName('PERIODO').AsInteger        := OrcamentoBackMT.EncontraPeriodo(sDataRef);
  dbeStatus.Text                              := STATUS;

  // Gera o ID do próximo Compromisso
  if cds.FieldByName('IDRESERVAORCAMEN').asInteger <= 0 then
    begin
      cds.FieldByName('IDRESERVAORCAMEN').AsInteger := CtrlReservaOrcamen.LerUltimaSequencia;
    end;

  Accept := True;

  inherited;
end;



procedure TfrmCompromissoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   Cds.Data := CtrlReservaorcamen.Procurar(Cds.FieldByName('IDRESERVAORCAMEN').AsFloat);
end;



procedure TfrmCompromissoMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlReservaOrcamen.AplicaOperacaoReservaOrcamen;
end;



procedure TfrmCompromissoMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlReservaOrcamen.AplicaOperacaoReservaOrcamen;
end;



procedure TfrmCompromissoMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlReservaOrcamen.AplicaOperacaoReservaOrcamen;

  if (Cds.State = dsbrowse)and not(CmeCadastro.Operacao = opApagar) then Cds.Edit;
end;



procedure TfrmCompromissoMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if OrigemAbortConfirma <> OaBeforeConfirma then
   begin
      MsgDlg('Ocorreu o seguinte erro : '+ CtrlReservaorcamen.MessageInfo, 'Orçamento', mtError, [mbOK], 0);
      Repaint;
   end;
end;



procedure TfrmCompromissoMT.ImprimirCompromisso;
var
   sMensagem : String;
begin
   try
      redSaldo.value := OrcamentoBackMT.ExibeSaldo(Modulo.iPlanoOrc,
                                                   dbeCodigoConta.Text,
                                                   FormatDateTime('dd/mm/yyyy', dbeDataRef.date),
                                                   Modulo.sTipoSaldo
                                                  );

      if not(TrptCompromisso.PrintReport(3154,
                                         1,
                                         Sistema.IdEmpresa,
                                         Sistema.IdUsuario,
                                         Sistema.IdModulo,
                                         cds.FieldByName('NUMRESERVA').AsString + '|=|' + FloatToStr(redSaldo.value) + '|=|',
                                         '',
                                         'BaseDados',
                                         Sistema.NomeEmpresa,
                                         Sistema.NomeModulo,
                                         sMensagem
                                        )) then
      begin
         MsgDlg(sMensagem, 'Impressão do Compromisso ', mtError, [], 0);
         Repaint;
      end;

   except
      on E : Exception do
      begin
         MsgDlg('Erro durante a geração do relatório' + #13 + #10 + E.Message, 'Erro', mtError, [mbOk], 0);
         Repaint;
      end;
   end;
end;



procedure TfrmCompromissoMT.btnVaiUmClick(Sender: TObject);
var
   Posicao : Integer;
begin
   if CmeCadastro.Operacao = opAlterar then
     if not CdsReservaECompromisso.IsEmpty then
       begin
         MsgDlg('Não é permitido incluir/excluir Reservas' +#13+
                'na alteração de um Compromisso!', 'Orçamento', mtWarning, [mbOk], 0);
         EXIT;
       end;

   if (ltvReserva.Items.Count > 0) then
   begin
      if (ltvReserva.Selected = nil) then
      begin
         Posicao := 0;
      end
      else
      begin
         Posicao := ltvReserva.Selected.Index;
      end;

      if ltvCompromisso.Items.IndexOf(ltvReserva.Items[Posicao]) > -1 then
        begin
          MsgDlg('Este Reserva já foi selecionada para este Compromisso',
                 'Orçamento', mtWarning, [mbOk], 0);
          EXIT;
        end;

      IncluirEm(ltvCompromisso,
                ltvReserva.Items[Posicao].Caption,
                ltvReserva.Items[Posicao].SubItems[0],
                ltvReserva.Items[Posicao].SubItems[1],
                ltvReserva.Items[Posicao].SubItems[2]
               );

      PosicionaEm(ltvReserva.Items[Posicao].Caption);
      rValorReservas := rValorReservas + CdsReservaECompromisso.FieldByName('VLRRESERVA').AsFloat;
      RetirarDe(ltvReserva, Posicao);
   end;
end;



procedure TfrmCompromissoMT.btnVoltaUmClick(Sender: TObject);
var
   Posicao : Integer;
begin
   if CmeCadastro.Operacao = opAlterar then
     if not CdsReservaECompromisso.IsEmpty then
       begin
         MsgDlg('Não é permitido incluir/excluir Reservas' +#13+
                'na alteração de um Compromisso!', 'Orçamento', mtWarning, [mbOk], 0);
         EXIT;
       end;

   if (ltvCompromisso.Items.Count > 0) then
   begin
      if (ltvCompromisso.Selected = nil) then
      begin
         Posicao := 0;
      end
      else
      begin
         Posicao := ltvCompromisso.Selected.Index;
      end;

      IncluirEm(ltvReserva,
                ltvCompromisso.Items[Posicao].Caption,
                ltvCompromisso.Items[Posicao].SubItems[0],
                ltvCompromisso.Items[Posicao].SubItems[1],
                ltvCompromisso.Items[Posicao].SubItems[2]
               );

      PosicionaEm(ltvCompromisso.Items[Posicao].Caption);
      rValorReservas := rValorReservas - CdsReservaECompromisso.FieldByName('VLRRESERVA').AsFloat;
      RetirarDe(ltvCompromisso, Posicao);
   end;
end;



procedure TfrmCompromissoMT.IncluirEm(pLtvDestino  : TListView;
                                      pCaption     : String;
                                      pSubItems0   : String;
                                      pSubItems1   : String;
                                      pSubItems2   : String
                                     );
begin
   pltvDestino.Items.Add;
   pltvDestino.Items.Item[pltvDestino.Items.Count - 1].Caption := pCaption;
   pltvDestino.Items.Item[pltvDestino.Items.Count - 1].SubItems.Add(pSubItems0);
   pltvDestino.Items.Item[pltvDestino.Items.Count - 1].SubItems.Add(pSubItems1);
   pltvDestino.Items.Item[pltvDestino.Items.Count - 1].SubItems.Add(pSubItems2);
end;



procedure TfrmCompromissoMT.RetirarDe(pLtvDestino : TListView;
                                      pPosicao    : Integer);
begin
  pLtvDestino.Items.Delete(pPosicao);
end;



procedure TfrmCompromissoMT.AtualizaReservaECompromisso;
var
  Posicao : Integer;
begin
  // Exclui as Reservas que saíram do relacionamento
  for Posicao := 0 to ltvReserva.Items.Count - 1 do
    begin
      with CdsReservaECompromisso do
        begin
           if PosicionaEm(ltvReserva.Items.Item[Posicao].Caption) then
             if (FieldByName('FLGRESERVA').AsString <> 'A') then
               begin
                CtrlReservaorcamen.AtualizaFLGRESERVA('A',
                                                      Sistema.idEmpresa,
                                                      FieldByName('NUMRESERVA').AsInteger);

                CtrlResxcomp.Excluir(FieldByName('IDRESXCOMP').AsInteger);

                Delete; // Exclui do ClientDataSet Detalhe
               end;
        end;
    end;

  // Inclui as novas reservas que entraram no relacionamento
  for Posicao := 0 to ltvCompromisso.Items.Count - 1 do
    begin
      with CdsReservaECompromisso do
        begin
           if PosicionaEm(ltvCompromisso.Items.Item[Posicao].Caption) then
             if (FieldByName('FLGRESERVA').AsString <> 'E') then
               begin
                 CtrlReservaorcamen.AtualizaFLGRESERVA('E',
                                                       Sistema.idEmpresa,
                                                       FieldByName('NUMRESERVA').asInteger);

                 CtrlResxcomp.Inserir(CtrlResxcomp.LerUltimaSequencia,
                                      Sistema.idEmpresa,
                                      FieldByName('IDRESERVAORCAMEN').asInteger,
                                      iIndice);
               end;
        end;
    end;
end;



function TfrmCompromissoMT.PosicionaEm(pNumReserva : String): boolean;
begin
  // Necessário saber se foi localizado o registro para a exclusão quando necessário
  Result := CdsReservaECompromisso.Locate('NUMRESERVA', pNumReserva, []);

end;



procedure TfrmCompromissoMT.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   dbedUsuario.Text := sistema.NomeUsuario;
end;



procedure TfrmCompromissoMT.bbtnImprimeClick(Sender: TObject);
begin
  inherited;
  if not VerificaPreenchimento then Exit;
  ImprimirCompromisso;

  bbtnImprime.Down := False;
end;

procedure TfrmCompromissoMT.FormDestroy(Sender: TObject);
begin

  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlReservaorcamen);
  FreeAndNil(CtrlSaldoorcado);
  FreeAndNil(CtrlCompromisso);
  FreeAndNil(CtrlResxcomp);
  FreeAndNil(CtrlOrcamento);

  inherited;
  
end;

procedure TfrmCompromissoMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if (Cds.RecordCount > 0) and (Ds.State in [dsBrowse]) then
    begin
      PnlFundo.Enabled := True;
      TbsReserva.Enabled := False;
      TbsCompromisso.Enabled := False;

      bbtnImprime.Enabled := True;
    end
  else
    begin
      inherited;
      TbsReserva.Enabled := True;
      TbsCompromisso.Enabled := True;

      bbtnImprime.Enabled := False;
    end;
end;

// Função para verificar se as contas das Reservas são iguais a conta do Compromisso
function TfrmCompromissoMT.VerificaContasReservaCompromisso: boolean;
begin
  Result := True;

  CdsReservaECompromisso.First;
  while not CdsReservaECompromisso.Eof do
    begin
      if CdsReservaECompromisso.FieldByName('IDCONTAORCAMEN').AsString <> dbeCodigoConta.Text then
        Result := False;

      CdsReservaECompromisso.Next;
    end;

  CdsReservaECompromisso.First;
end;




end.
