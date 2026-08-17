// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnDevolveClick
Nº SOL......: 154508
Nº KINTANA..: 1185732
Data........: 17/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Ao realizar as validações, deverá ser feita em cima do cds: cdsReservasTotal
              por causa do agrupamento realizado no SOL 151941 Kintana 1121546 

Rotina......: bbtnDevCompClick
Descrição...: * Ao realizar as validações, deverá ser feita em cima do cds: cdsReservasTotal
              por causa do agrupamento realizado no SOL 151941 Kintana 1121546
              * Retirada da chamada do formulário de Documentos a receber (frmDocReceberMT)
              * Retirado comando de LOOP do clientdataset.

Rotina......: bbtnFiltraClick
Descrição...: Ordenação De Dados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento...
Data      : 25/06/2004
Autor     : André Pontes
Pendencia : -
Descrição : Críticas de preenchimento passadas para as funções VerificaPreenchimento...
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - (cdsReservas)
Data      : 25/06/2004
Autor     : André Pontes
Pendencia : 16910, 16723
Descrição : Incluído na grid o campo IDCOMPROMISSO da tabela RESXCOMP
---------------------------------------------------------------------------------------------------}

{*******************************************************************************
 Atualizado em: 17/10/2003 - André Tavares - pendência 14008
                27/10/2003 - André Tavares - pendência 14009
********************************************************************************}


unit FEfetivacaoMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
   Wwdbigrd, Db, DBTables, Wwquery, Wwdatsrc, IvDictio,
   IvMulti, IvEMulti, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
   uCtrlEfetivacao, uCtrlReservaOrcamen, uCtrlPeriodoOrcamen, uCtrlSaldoOrcado,
   uCtrlOrcamento, DBClient, uCMClientDataSet, uCMTypes, uCmSqlParams, uFuncoesOrcamento,
   //Renan Cristiano SOL 151941 Kintana 1121546
   uCtrlTransacoesPorGrupo, uCtrlPadroes;

type
   TfrmEfetivacaoMT = class(TfrmSairAjuda)
     ds: TwwDataSource;
     dbgrdReservas: TwwDBGrid;
     dsDocRec: TwwDataSource;
     cdsReservas: TCMClientDataSet;
     cdsAltReservas: TCMClientDataSet;
     cdsDocRec: TCMClientDataSet;
     cdsTestaDocxComp: TCMClientDataSet;
     CMSqlParams1: TCMSqlParams;
     cdsReservasNUMRESERVA: TFloatField;
     cdsReservasNUMCOMPROMISSO: TFloatField;
     cdsReservasDATAREFERENCIA: TDateTimeField;
     cdsReservasVALOR: TFloatField;
     cdsReservasVLRCOMPROMISSO: TFloatField;
     cdsReservasFLGRESERVA: TStringField;
     cdsReservasIDRESERVAORCAMEN: TFloatField;
     cdsReservasIDCONTAORCAMEN: TStringField;
     cdsReservasNOMECONTAORCAMEN: TStringField;
     cdsReservasFLGRESCOMP: TStringField;
     cdsReservasVLRDEVOLVIDO: TFloatField;
     cdsReservasIDPLANOORCAMEN: TFloatField;
     cdsReservasEXERCICIO: TFloatField;
     cdsReservasPERIODO: TFloatField;
     cdsReservasCODCENTRORESPON: TStringField;
     cdsReservasSTATUS: TStringField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    chkCanceladas: TCheckBox;
    chkReservas: TCheckBox;
    chkCompromissos: TCheckBox;
    dteDataIni: TCMDateTimePicker;
    dteDataFim: TCMDateTimePicker;
    bbtnFiltra: TBitBtn;
    bbtnDevolve: TBitBtn;
    bbtnEfetiva: TBitBtn;
    bbtnDevComp: TBitBtn;
    bbtnCancela: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    cdsReservasIDOPERACAO: TFloatField;
    cdsReservasTotal: TCMClientDataSet;
    DateTimeField1: TDateTimeField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    FloatField5: TFloatField;
    StringField3: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField8: TFloatField;

     // Procedimentos Definidos
     procedure HabilitaControles;
     procedure DesabilitaControles;
     procedure LimpaTela;

     // Procedimentos Delphi
     procedure bbtnFiltraClick(Sender: TObject);
     procedure bbtnEfetivaClick(Sender: TObject);
     procedure bbtnCancelaClick(Sender: TObject);
     procedure dbgrdReservasCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
     procedure MostraSTATUS;
     procedure dteDataIniChange(Sender: TObject);
     procedure dbgrdReservasTopRowChanged(Sender: TObject);
     procedure bbtnDevolveClick(Sender: TObject);
     procedure bbtnDevCompClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


   private  // Private declarations

     CtrlReservaOrcamen: TCtrlReservaOrcamen;
     CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;

     CtrlSaldoOrcado: TCtrlSaldoOrcado;
     CtrlOrcamento  : TOrcamentoBackMT;

     function  VerificaPreenchimentoFiltro  : Boolean;
     function  VerificaPreenchimentoEfetiva : Boolean;
     function  VerificaPreenchimentoCancela : Boolean;

   public   // Public declarations

     CtrlEfetivacao     : TCtrlEfetivacao;
     CtrlPeriodoOrcamen : TCtrlPeriodoOrcamen;

   end;



var
  frmEfetivacaoMT: TfrmEfetivacaoMT;




implementation
{$R *.DFM}
uses
   UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, FDocReceberMT,
   uVerificaPreenchimento;


var
  TextoLog : string;


function  TfrmEfetivacaoMT.VerificaPreenchimentoFiltro: Boolean;
begin
	Result := False;

	try

      if (trim(dteDataIni.Text) = '') or (trim(dteDataFim.Text) = '') then
         raise EValidacao.CreateVal('É necessário indicar o período de Datas de Referência!', dteDataIni);

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



function  TfrmEfetivacaoMT.VerificaPreenchimentoEfetiva : Boolean;
begin
	Result := False;

	try
      // Se for um COMPROMISSO
      //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
      if cdsReservasTotal.FieldByName('FLGRESCOMP').asString = 'C' then
        begin
           if cdsReservasTotal.FieldByName('FLGRESERVA').asString = 'C' then
              raise EValidacao.CreateVal('Não se pode efetivar um Compromisso já cancelado!', bbtnEfetiva);

           if cdsReservasTotal.FieldByName('FLGRESERVA').asString = 'U' then
              raise EValidacao.CreateVal('Não se pode efetivar um Compromisso já em uso!', bbtnEfetiva);

           if cdsReservasTotal.FieldByName('FLGRESERVA').asString = 'E' then
              raise EValidacao.CreateVal('Não se pode efetivar um Compromisso já Efetivado!', bbtnEfetiva);

           // Verifica a tabela de Usuarios x Centros de Resp. para saber se pode ser feita a reserva
           if not(OrcamentoBackMT.VerificaDotacao(Trim(cdsReservasTotal.FieldByName('CODCENTRORESPON').AsString))) then
              raise EValidacao.CreateVal('O Usuário corrente não tem permissão para efetivar esse Compromisso!', bbtnEfetiva);
        end
      // Se for uma RESERVA
      else
        begin
           if cdsReservasTotal.FieldByName('FLGRESERVA').asString = 'C' then
              raise EValidacao.CreateVal('Não se pode efetivar uma Reserva já cancelada!', bbtnEfetiva);

           if cdsReservasTotal.FieldByName('FLGRESERVA').asString = 'U' then
              raise EValidacao.CreateVal('Não se pode efetivar uma Reserva já em uso!', bbtnEfetiva);

           if cdsReservasTotal.FieldByName('FLGRESERVA').asString = 'E' then
              raise EValidacao.CreateVal('Não se pode efetivar uma Reserva já Efetivada!', bbtnEfetiva);

           // Verifica a tabela de Usuarios x Centros de Resp. para saber se pode ser feita a reserva
           if not(OrcamentoBackMT.VerificaDotacao(Trim(cdsReservasTotal.FieldByName('CODCENTRORESPON').AsString))) then
              raise EValidacao.CreateVal('O Usuário corrente não tem permissão para efetivar essa Reserva!', bbtnEfetiva);
        end;
      //Renan Cristiano SOL 151941 Kintana 1121546 Fim

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



function  TfrmEfetivacaoMT.VerificaPreenchimentoCancela : Boolean;
begin
	Result := False;

	try

      // Se for uma RESERVA
      if cdsReservas.FieldByName('FLGRESCOMP').asString = 'R' then
        begin
          if cdsReservas.FieldByName('FLGRESERVA').asString = 'E' then
           raise EValidacao.CreateVal('Não se pode cancelar uma Reserva efetivada!', bbtnCancela);

          if cdsReservas.FieldByName('FLGRESERVA').asString = 'C' then
            raise EValidacao.CreateVal('Não se pode cancelar uma Reserva já cancelada!', bbtnCancela);

          if not(cdsReservas.FieldByName('NUMCOMPROMISSO').IsNULL) then
            raise EValidacao.CreateVal('Não é possível cancelar uma Reserva já utilizada por um Compromisso!', bbtnCancela);
        end
      // Se for um COMPROMISSO
      else
        begin
          if cdsReservas.FieldByName('FLGRESERVA').asString = 'E' then
            raise EValidacao.CreateVal('Não se pode cancelar um Compromisso efetivado!', bbtnCancela);

          if cdsReservas.FieldByName('FLGRESERVA').asString = 'C' then
            raise EValidacao.CreateVal('Não se pode cancelar um Compromisso já cancelado!', bbtnCancela);
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

procedure TfrmEfetivacaoMT.HabilitaControles;
begin
   Autorizacao.AutorizarForm(self, afNormal);
end;

procedure TfrmEfetivacaoMT.LimpaTela;
begin
   DesabilitaControles;
   cdsReservas.Close;
end;



procedure TfrmEfetivacaoMT.DesabilitaControles;
begin
   bbtnEfetiva.Enabled := false;
   bbtnCancela.Enabled := false;
   bbtnDevolve.Enabled := false;
   bbtnDevComp.Enabled := false;
end;



procedure TfrmEfetivacaoMT.bbtnFiltraClick(Sender: TObject);
begin
   inherited;
   try
   GravaLogPLANEORC('FEfetivacaoMT.bbtnFiltra.Click',
                    Sistema.IdModulo,
                    Sistema.IdUsuario);

    cdsReservas.DisableControls;

    if not(VerificaPreenchimentoFiltro) then Exit;

    // Filtra as Reservas/Compromissos a partir das datas de referência Informadas
    dteDataIni.Date := StrToDate(FormatDateTime('dd/mm/yyyy', Trunc(dteDataIni.Date)));
    dteDataFim.Date := StrToDate(FormatDateTime('dd/mm/yyyy', Trunc(dteDataFim.Date)));

    if OrcamentoBackMT.VerificaDatas(dteDataIni.date, dteDataFim.date) then
    begin
       DesabilitaControles;
       cdsReservas.Data := CtrlEfetivacao.Reservas(Sistema.IDUsuario,
                                          Sistema.IDEmpresa,
                                          dteDataIni.Text,
                                          dteDataFim.Text,
                                          chkReservas.Checked,
                                          chkCompromissos.Checked,
                                          chkCanceladas.Checked
                                         );

       //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
       cdsReservasTotal.data := CtrlEfetivacao.Reservas(Sistema.IDUsuario,
                                          Sistema.IDEmpresa,
                                          dteDataIni.Text,
                                          dteDataFim.Text,
                                          chkReservas.Checked,
                                          chkCompromissos.Checked,
                                          chkCanceladas.Checked,
                                          True);
       //Renan Cristiano SOL 151941 Kintana 1121546 Fim

       //Ricardo SOL 154508 Kintana 1185732
       cdsReservasTotal.IndexFieldNames := 'DATAREFERENCIA;IDOPERACAO;PERIODO';


       MostraSTATUS;
       HabilitaControles;
    end;
   finally
     cdsReservas.EnableControls;
   end;

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FEfetivacaoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;



procedure TfrmEfetivacaoMT.bbtnEfetivaClick(Sender: TObject);
begin
   inherited;
   //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
   cdsReservas.Filtered := False;
   cdsReservas.Filter := 'IDOPERACAO = ' + cdsReservasTotal.FieldByName('IDOPERACAO').AsString +
                         ' AND FLGRESERVA = ' + QuotedStr(cdsReservasTotal.FieldByName('FLGRESERVA').AsString);
   cdsReservas.Filtered := True;
   //Renan Cristiano SOL 151941 Kintana 1121546 Fim

   GravaLogPLANEORC('FEfetivacaoM1111T.bbtnEfetiva.Click',
                    Sistema.IdModulo,
                    Sistema.IdUsuario);

   //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
   Try
      Try
        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

         while not(cdsReservas.Eof) do
         begin
            if not CtrlPeriodoOrcamen.PeriodoLiberado(CdsReservas.FieldByName('PERIODO').AsInteger,
                                                    CdsReservas.FieldByName('EXERCICIO').AsInteger,
                                                    Sistema.IdEmpresa) then
            begin
               MsgDlg('Período BLOQUEADO para Lançamentos e Alterações!','Orçamento', mtWarning,[mbOk],0);
               if not(dtmBaseDados.dbBaseDados.InTransaction) then
                  dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

            if not(VerificaPreenchimentoEfetiva) then
            begin
               if dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback;
               Exit;
            end;

            // **************************************************//
            // Efetiva a Reserva/Compromisso selecionada no Grid //
            // **************************************************//

            // Se for um COMPROMISSO
            if cdsReservas.FieldByName('FLGRESCOMP').asString = 'C' then
            begin
               DesabilitaControles;

               // Muda a flag da Reserva/Compromisso
               if not(CtrlReservaOrcamen.EfetivaClick(cdsReservas.FieldByName('IDRESERVAORCAMEN').AsInteger, Sistema.idEmpresa)) then
               begin
                  MsgDlg('Efetivação de Compromisso não efetuada!','Orçamento', mtWarning,[mbOk],0);
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Rollback;
                  Exit;
               end;
            end
            // se for uma RESERVA
            else
            begin
               DesabilitaControles;

               // Muda a flag da Reserva/Compromisso
               // 1) Atualiza Valores na Tabela SALDOOCADO

               CtrlSaldoOrcado.TrocaSaldoReservadopCompromissado(cdsReservas.FieldByName('VALOR').AsFloat,
                                                                 cdsReservas.FieldByName('VALOR').AsFloat, //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
                                                                 Sistema.IdEmpresa,
                                                                 Modulo.iPlanoOrc,
                                                                 CtrlOrcamento.PrimeiroDiaPeriodo(cdsReservas.FieldByName('EXERCICIO').AsInteger,
                                                                                                  cdsReservas.FieldByName('PERIODO').AsInteger),
                                                                 cdsReservas.FieldByName('IDCONTAORCAMEN').AsString);
               // 2) Atualiza FLG na Tabela RESERVAORCAMEN
               CtrlReservaOrcamen.AtualizaFLGRESERVA('E',
                                                     Sistema.IdEmpresa,
                                                     cdsReservas.FieldByName('NUMRESERVA').AsInteger);
            end;

            cdsReservas.Next;
         end;

         MsgDlg('Efetivação efetuada com Sucesso!','Orçamento', mtWarning,[mbOk],0);

      Except
         on E: Exception do
         begin
            MsgDlg('Efetivação NÃO efetuada!' + #13 + #10 + E.message, 'Orçamento', mtError, [mbOk], 0);
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
         end;
      end;

   finally
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         cdsReservas.Filtered := False;
         cdsReservas.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                     sistema.idEmpresa,
                                                     dteDataIni.text,
                                                     dteDataFim.text,
                                                     chkReservas.checked,
                                                     chkCompromissos.checked,
                                                     chkCanceladas.checked);
         //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
         cdsReservasTotal.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                          sistema.idEmpresa,
                                                          dteDataIni.text,
                                                          dteDataFim.text,
                                                          chkReservas.checked,
                                                          chkCompromissos.checked,
                                                          chkCanceladas.checked,
                                                          True);
         //Renan Cristiano SOL 151941 Kintana 1121546 Fim
         MostraSTATUS;
         HabilitaControles;
   end;

  //Renan Cristiano SOL 151941 Kintana 1121546 Fim

   try
      Sistema.GravaLogOperacoes('Efetivação de Reservas e Compromissos (Efetiva)');
   except
      Raise Exception.Create('Não foi possível Gravar o Log');
   end;

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FEfetivacaoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;



procedure TfrmEfetivacaoMT.bbtnCancelaClick(Sender: TObject);
var
  sMsgResOuComp,
  sFieldResOuComp : string;
begin
   inherited;
   //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
   cdsReservas.Filtered := False;
   cdsReservas.Filter := 'IDOPERACAO = ' + cdsReservasTotal.FieldByName('IDOPERACAO').AsString +
                         ' AND FLGRESERVA = ' + QuotedStr(cdsReservasTotal.FieldByName('FLGRESERVA').AsString) ;
   cdsReservas.Filtered := True;

   cdsReservas.First;
   While not(cdsReservas.Eof) do
   begin
      cdsReservas.Edit;
      cdsReservas.FieldByName('VALIDAR').AsString := 'S';
      cdsReservas.Post;
      cdsReservas.Next;
   End;
   //Renan Cristiano SOL 151941 Kintana 1121546 Fim


   GravaLogPLANEORC('FEfetivacaoMT.bbtnCancela.Click',
                    Sistema.IdModulo,
                    Sistema.IdUsuario);

   //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
   Try
      Try
         if cdsReservas.FieldByName('FLGRESCOMP').asString = 'R' then
            sMsgResOuComp   := 'Deseja REALMENTE cancelar a Reserva selecionada?'
         else
            sMsgResOuComp   := 'Deseja REALMENTE cancelar o Compromisso selecionado?';

         if MsgDlg(sMsgResOuComp, 'Mensagem', mtConfirmation,[mbYes, mbNo],0) = mrNo then
            Exit;

         if not CtrlPeriodoOrcamen.PeriodoLiberado(CdsReservas.FieldByName('PERIODO').AsInteger,
                                                   CdsReservas.FieldByName('EXERCICIO').AsInteger,
                                                   Sistema.IdEmpresa) then
         begin
            MsgDlg('Período BLOQUEADO para Lançamentos e Alterações!','Orçamento', mtWarning,[mbOk],0);
            Exit;
         end;

         if not(VerificaPreenchimentoCancela) then
         begin
            Exit;
         end;

         Repaint;
         DesabilitaControles;

         if not CtrlTransacoesPorGrupo.CancelaReservaCompromisso(cdsReservas.Data,
                                                                 cdsReservas.FieldByName('FLGRESCOMP').asString,
                                                                 False, //(PageControl.ActivePageIndex = 1)
                                                                 Sistema.IdEmpresa) then
         begin
            MsgDlg('Cancelamento NÃO efetuado!' + #13 + #10 +
                   'Motivo: ' + CtrlTransacoesPorGrupo.MessageInfo,'Erro',mtError,[mbOk],0);
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            Exit;
         end
         else
            MsgDlg('Cancelamento efetuado com Sucesso!','Orçamento', mtWarning,[mbOk],0);

      Except
         on E: Exception do
         begin
            MsgDlg('Cancelamento NÃO efetuado!' + #13 + #10 + E.message, 'Orçamento', mtError, [mbOk], 0);
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
         end;
      end;

   finally

      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      cdsReservas.Filtered := False;
      cdsReservas.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                  sistema.idEmpresa,
                                                  dteDataIni.text,
                                                  dteDataFim.text,
                                                  chkReservas.checked,
                                                  chkCompromissos.checked,
                                                  chkCanceladas.checked);

      //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
      cdsReservasTotal.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                       sistema.idEmpresa,
                                                       dteDataIni.text,
                                                       dteDataFim.text,
                                                       chkReservas.checked,
                                                       chkCompromissos.checked,
                                                       chkCanceladas.checked,
                                                       True);
      //Renan Cristiano SOL 151941 Kintana 1121546 Fim
      MostraSTATUS;
      HabilitaControles;
   end;
   //Renan Cristiano SOL 151941 Kintana 1121546 Fim   

   try
      Sistema.GravaLogOperacoes('Efetivação de Reservas e Compromissos (Cancela)');
   except
      Raise Exception.Create('Não foi possível Gravar o Log');
   end;
   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
      GravarLOGLocal('FEfetivacaoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;



procedure TfrmEfetivacaoMT.dbgrdReservasCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  //Evento utilizado para mudar a cor das células de status de acordo
  //com o valor da flad FLGRESERVA (A, E, C, D, U)
  if Field.FieldName = 'STATUS' then
    begin
      if (Trim(Field.value) = 'Reserva Aguardando...') and (Highlight = false) then
        begin
          AFont.color := clBlack;
        end
      else
        begin
          if (Trim(Field.AsString) = 'Reserva Efetivada') and (Highlight = false) then
            begin
              AFont.color := clBlue;
            end
          else
            begin
              if (Trim(Field.AsString) = 'Reserva Cancelada') and (Highlight = false) then
                begin
                  AFont.color := clRed;
                end
              else
                begin
                  if (Trim(Field.AsString) = 'Reserva em Uso') and (Highlight = false) then
                    begin
                      AFont.color := clGreen;
                    end
                  else
                    begin
                      if (Trim(Field.AsString) = 'Compromisso Aguardando...') and (Highlight = false) then
                        begin
                          AFont.color := clBlack;
                        end
                      else
                        begin
                          if (Trim(Field.AsString) = 'Compromisso Cancelado') and (Highlight = false) then
                            begin
                              AFont.color := clRed;
                            end
                          else
                            begin
                              if (Trim(Field.AsString) = 'Compromisso Efetivado') and (Highlight = false) then
                                begin
                                  AFont.color := clBlue;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

  //Faz com que as linhas do grid tenham cores alternadas
  if State <> [gdSelected] then
    begin
      if not(Highlight) then
        begin
          if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
            begin
              ABrush.color := clwhite
            end
          else
            begin
              ABrush.Color := $00C0FFFF; //Amarelo Bebê
            end;
        end;
    end
  else
    begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
    end;

end;



procedure TfrmEfetivacaoMT.dbgrdReservasTopRowChanged(Sender: TObject);
begin
  inherited;
  //Acerta as cores quando muda a linha da grid
  dbgrdReservas.invalidate;
end;

procedure TfrmEfetivacaoMT.MostraSTATUS;
begin
  inherited;
  //Cria o calcField STATUS para mostrar a descrição da flag FLGRESERVA
  with cdsReservasTotal do     //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
  begin
    First;
    while not(EOF) do
    begin
      Edit;
      // É uma reserva
      if FieldByName('FLGRESCOMP').asString = 'R' then
      begin
        if FieldByName('FLGRESERVA').asString = 'A' then
        begin
          FieldByName('STATUS').asString := 'Reserva Aguardando...';
        end
        else
        begin
          if FieldByName('FLGRESERVA').asString = 'E' then
          begin
            FieldByName('STATUS').asString := 'Reserva Efetivada';
          end
          else
          begin
            if FieldByName('FLGRESERVA').asString = 'C' then
            begin
              FieldByName('STATUS').asString := 'Reserva Cancelada';
            end
            else
            begin
              if FieldByName('FLGRESERVA').asString = 'U' then
              begin
                FieldByName('STATUS').asString := 'Reserva em Uso';
              end;
            end;
          end;
        end;
      //É um Compromisso
      end
      else
      begin
        if FieldByName('FLGRESERVA').asString = 'A' then
        begin
          FieldByName('STATUS').asString := 'Compromisso Aguardando...';
        end
        else
        begin
          if FieldByName('FLGRESERVA').asString = 'E' then
          begin
            FieldByName('STATUS').asString := 'Compromisso Efetivado';
          end
          else
          begin
            if FieldByName('FLGRESERVA').asString = 'C' then
            begin
              FieldByName('STATUS').asString := 'Compromisso Cancelado';
            end;
          end;
        end;
      end;
      Post;
      Next;
    end;
    First
  end;

end;



procedure TfrmEfetivacaoMT.dteDataIniChange(Sender: TObject);
begin
  inherited;
  //Evento utilizado por todos os controles de entrada de dados da tela
  LimpaTela;
end;
//************************************************
procedure TfrmEfetivacaoMT.bbtnDevolveClick(Sender: TObject);
var
  sMsgResOuComp, sFieldResOuComp : string;
begin
  inherited;

  GravaLogPLANEORC('FEfetivacaoMT.bbtnDevolve.Click',
                   Sistema.IdModulo,
                   Sistema.IdUsuario);

  //Ricardo SOL 154508 Kintana 1185732
  if not(cdsReservasTotal.IsEmpty) then
  begin
       if not CtrlPeriodoOrcamen.PeriodoLiberado(cdsReservasTotal.FieldByName('PERIODO').AsInteger,
                                                cdsReservasTotal.FieldByName('EXERCICIO').AsInteger,
                                                Sistema.IdEmpresa) then
        begin
          MsgDlg('Período BLOQUEADO para Lançamentos e Alterações!','Orçamento', mtWarning,[mbOk],0);
          EXIT;
        end;

      //Inicializa as variáveis
      if cdsReservasTotal.FieldByName('FLGRESCOMP').asString <> 'C' then
      begin
          MsgDlg('Não se pode devolver uma reserva, somente um compromisso!', 'Orçamento', mtWarning,[ mbOk ], 0);
          Repaint;
        end
      else
        begin
          if cdsReservasTotal.FieldByName('FLGRESERVA').asString <> 'A' then
            begin
              MsgDlg('Não se pode devolver um Compromisso que não esteja aguardando!', 'Orçamento', mtWarning, [ mbOk ], 0);
              Repaint;
            end
          else
            begin
              sMsgResOuComp   := 'Deseja REALMENTE devolver o saldo do Compromisso selecionado?';
              sFieldResOuComp := 'VLRCOMPROMETIDO';

              //Cancela a reserva/compromisso selecionada
              if MsgDlg(sMsgResOuComp,'Mensagem',mtConfirmation,[mbYes, mbNo],0) = mrYes then
                begin
                  DesabilitaControles;
                  try
                    if (CtrlReservaOrcamen.DevolveClick(Sistema.IdEmpresa,
                                                        sFieldResOuComp,
                                                        // Necessário passar o primeiro dia do período
                                                        // para dar o UPDATE na Tabela SALDOORCADO
                                                        OrcamentoBackMT.PrimeiroDiaPeriodo(cdsReservasTotal.FieldByName('EXERCICIO').AsInteger,
                                                                                           cdsReservasTotal.FieldByName('PERIODO').AsInteger) )) then
                      begin
                        MsgDlg('Devolução do Saldo do Compromisso efetuado com Sucesso!', 'Orçamento',mtWarning,[mbOk],0);
                      end
                    else
                      begin
                        MsgDlg('Devolução do Saldo do Compromisso NÃO efetuado!' + #13 + #10 +
                               CtrlReservaOrcamen.MessageInfo, 'Erro',  mtError, [ mbOk ], 0);
                      end;
                  finally
                    cdsReservas.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                                sistema.idEmpresa,
                                                                dteDataIni.text,
                                                                dteDataFim.text,
                                                                chkReservas.checked,
                                                                chkCompromissos.checked,
                                                                chkCanceladas.checked);
                    //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
                    cdsReservasTotal.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                                sistema.idEmpresa,
                                                                dteDataIni.text,
                                                                dteDataFim.text,
                                                                chkReservas.checked,
                                                                chkCompromissos.checked,
                                                                chkCanceladas.checked,
                                                                True);
                    //Renan Cristiano SOL 151941 Kintana 1121546 Fim
                    MostraSTATUS;
                    HabilitaControles;

                  end; // finally

                end; // if interno

            end; // else interno

        end; // else externo

    end; // if externo

   try
      Sistema.GravaLogOperacoes('Efetiv. de Res. e Compromissos (Devolve Saldo)');
   except
      Raise Exception.Create('Não foi possível Gravar o Log');
   end;

   TextoLog := EncontrouDiferenca;
   if TextoLog <> '' then
     GravarLOGLocal('FEfetivacaoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;



procedure TfrmEfetivacaoMT.bbtnDevCompClick(Sender: TObject);
var
  sMsgResOuComp, sFieldResOuComp : string;
begin
  inherited;

  GravaLogPLANEORC('FEfetivacaoMT.bbtnDevComp.Click',
                   Sistema.IdModulo,
                   Sistema.IdUsuario);

//  if not(cdsReservas.IsEmpty) then
//  begin

  //Ricardo SOL 154508 Kintana 1185732 - comentado
  {while not(CdsReservas.eof) do
  begin}
  //Ricardo SOL 154508 Kintana 1185732 - fim
  
      if not CtrlPeriodoOrcamen.PeriodoLiberado(cdsReservasTotal.FieldByName('PERIODO').AsInteger,
                                              cdsReservasTotal.FieldByName('EXERCICIO').AsInteger,
                                              Sistema.IdEmpresa) then
      begin
        MsgDlg('Período BLOQUEADO para Lançamentos e Alterações!','Orçamento', mtWarning,[mbOk],0);
        EXIT;
      end;

    //Inicializa as variáveis
    if cdsReservasTotal.FieldByName('FLGRESCOMP').asString <> 'C' then
    begin
        MsgDlg('Não se pode devolver uma Reserva, somente um Compromisso!', 'Orçamento',mtWarning,[mbOk],0);
        Repaint;
    end
    else
        if cdsReservasTotal.FieldByName('FLGRESERVA').asString <> 'E' then
        begin
             MsgDlg('Esta função não permite devolver um Compromisso que não esteja Efetivado!', 'Orçamento',mtWarning,[mbOk],0);
             Repaint;
        end
        else
        begin
             sMsgResOuComp   := 'Deseja REALMENTE devolver o saldo do Compromisso selecionado?';
             sFieldResOuComp := 'VLRCOMPROMETIDO';

             //Cancela a reserva/compromisso selecionada
             if MsgDlg(sMsgResOuComp,'Mensagem',mtConfirmation,[mbYes, mbNo],0) = mrYes then
             begin
                  Repaint;
                  cdsDocRec.Data := CtrlEfetivacao.DocRec;

                  //Ricardo SOL 154508 Kintana 1185732 - comentado
                  Application.CreateForm(TfrmDocReceberMT,frmDocReceberMT);
                  if (mrOk = frmDocReceberMT.ShowModal) then
                  begin
                  //Ricardo SOL 154508 Kintana 1185732 - FIM
                  DesabilitaControles;
                  try
                     if (CtrlReservaOrcamen.DevCompClick(Sistema.idEmpresa, sFieldResOuComp)) then
                     begin
                          MsgDlg('Devolução do Compromisso Efetivado efetuado com Sucesso!', 'Orçamento', mtWarning, [ mbOk ], 0);
                          Repaint;
                     end
                     else
                     begin
                          MsgDlg('Devolução do Compromisso Efetivado NÃO efetuado!' + #13 + #10 +
                               CtrlReservaOrcamen.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
                          Repaint;
                     end;
                  finally
                     cdsReservas.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                                 sistema.idEmpresa,
                                                                 dteDataIni.text,
                                                                 dteDataFim.text,
                                                                 chkReservas.checked,
                                                                 chkCompromissos.checked,
                                                                 chkCanceladas.checked);

                     //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
                     cdsReservasTotal.Data := CtrlEfetivacao.Reservas(sistema.idUsuario,
                                                                      sistema.idEmpresa,
                                                                      dteDataIni.text,
                                                                      dteDataFim.text,
                                                                      chkReservas.checked,
                                                                      chkCompromissos.checked,
                                                                      chkCanceladas.checked,
                                                                      True);
                     //Renan Cristiano SOL 151941 Kintana 1121546 Fim
                     MostraSTATUS;
                     HabilitaControles;
                  end; //try...finally...

             //Ricardo SOL 154508 Kintana 1185732 - comentado
             end; //if (mrOk = frmDocReceberMT.ShowModal) then
         end; //if cdsReservas.FieldByName('FLGRESERVA').asString <> 'E' then

      Repaint;

    end; //if cdsReservas.FieldByName('FLGRESCOMP').asString <> 'C' then

    //Ricardo SOL 154508 Kintana 1185732
    //end; //while not(CdsReservas.eof) do

    try
         Sistema.GravaLogOperacoes('Efetiv. de Res. e Compromissos (Dev. comp. Efet.)');
    except
         Raise Exception.Create('Não foi possível Gravar o Log');
    end;

    TextoLog := EncontrouDiferenca;
    if TextoLog <> '' then
       GravarLOGLocal('FEfetivacaoMT: ' + TextoLog, Sistema.IdModulo, Sistema.IdUsuario);

end;

procedure TfrmEfetivacaoMT.FormCreate(Sender: TObject);
begin
   inherited;

   LimpaTela;

   //Renan Cristiano SOL 151941 Kintana 1121546 Inicio
   CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
   CtrlTransacoesPorGrupo.InitializeAs(padroes);
   //Renan Cristiano SOL 151941 Kintana 1121546 Fim

   CtrlEfetivacao       := TCtrlEfetivacao.Create;
   CtrlReservaOrcamen   := TCtrlReservaOrcamen.Create;

   CtrlSaldoOrcado      := TCtrlSaldoOrcado.Create;
   CtrlOrcamento        := TOrcamentoBackMT.Create;

   CtrlPeriodoOrcamen   := TCtrlPeriodoOrcamen.Create;

   CtrlEfetivacao.Initialize(DtmBaseDados.dbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True,
                             nil,
                             nil,
                             False
                            );

   CtrlReservaOrcamen.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True,
                                 nil,
                                 nil,
                                 False
                                );

   CtrlPeriodoOrcamen.InitializeAs(CtrlReservaOrcamen);

   CtrlSaldoOrcado.InitializeAs(CtrlReservaOrcamen);
   CtrlOrcamento.InitializeAs(CtrlReservaOrcamen);

   CtrlReservaOrcamen.CdsReservaOrcamen := CdsReservas;
   CtrlReservaOrcamen.cdsAltReservas    := CdsAltReservas;
   CtrlReservaOrcamen.cdsDocRec         := CdsDocRec;
end;



procedure TfrmEfetivacaoMT.FormDestroy(Sender: TObject);
begin
   inherited;
   FreeAndNil(CtrlEfetivacao);
   FreeAndNil(CtrlReservaOrcamen);

   FreeAndNil(CtrlSaldoOrcado);
   FreeAndNil(CtrlOrcamento);

   FreeAndNil(CtrlPeriodoOrcamen);
end;

procedure TfrmEfetivacaoMT.FormShow(Sender: TObject);
begin
  inherited;
  DesabilitaControles;
end;

procedure TfrmEfetivacaoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlTransacoesPorGrupo);   //Renan Cristiano SOL 151941 Kintana 1121546
end;

end.

