unit fCancRecebimento;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL  165338 KINTANA  1430202
Responsável : Marcos Merola
Data        : 21/09/2011
Descrição   : Alteração na query
-----------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Bloquear usuario que for mutuario do contrato com a variavel
'bBuscaMutuario'.
--------------------------------------------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 13/06/2005
Autor     : André Pontes
Pendência : 19459
Descrição : Bloqueio do processo acordo com parâmetro contábil por módulo, além
            do TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 13/06/2005
Autor     : André Pontes
Pendência : 19459
Descrição : Bloqueio do processo acordo com parâmetro contábil por módulo, além
            do TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : TrocaSitEnvioTmpDesc (qryUpdateTmpDesc)
Data      : 27/07/2004
Autor     : André Pontes
Pendencia : -
Descrição : Alterada a qryUpdateTmpDesc, para receber apenas os campos
            IDDESCONTO e IDTMPDESC como filtro (são mais que suficientes)
--------------------------------------------------------------------------------
Rotina    : DesfazRecebimentoHist
Data      : 12/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : Alterada novamente a qryUpdateParcelasSeq, retirando-se:
            AND HMEDATAEFETIVA    IS NULL
            AND HMEVLREFETIVO     IS NULL
            AND FLGBAIXADO        = 0,
            pois, dessa forma, o registro do recebimento inesperado não era
            afetado, apenas sua devolução.

********************************************************************************
* PERSISTE O PROBLEMA DO QUE FAZER QUANDO O tratamento de divergências JÁ TIVER
* SIDO EXECUTADO "SOBRE" UM VALOR CUJO RECEBIMENTO SE DESEJA DESFAZER
* - DESFAZER TRATAMENTO DE DIVERGÊNCIAS ?
********************************************************************************

--------------------------------------------------------------------------------
Rotina    : DesfazItensPatroTMPDESC e DesfazItensPatroCAPCAR
Data      : 12/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : A query com os itens a desfazer passa as ser ordenada por:
            'HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, HME.HMEPARCELA,
             HME.HMESEQCOBRANCA '
--------------------------------------------------------------------------------
Rotina    : DesfazRecebimentoHist
Data      : 12/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : qryUpdateParcelasSeq alterada para receber IDITEMEMPTMO no filtro
--------------------------------------------------------------------------------
Rotina    : DesfazRecebimentoHist
Data      : 11/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : 1) Estava errado: 0 2º update não filtrava pelo Contrato;
            2) 1º update foi alterado para incluir 'HMEDATARECEB = NULL, '
            3) Queries foram otimizadas, estava lento demais;
--------------------------------------------------------------------------------
Rotina    : DesfazItensPatroTMPDESC
Data      : 11/09/2003
Autor     : André Pontes
Pendencia : -
Descrição : FieldByName estava pegando contexto errado -
            qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat
--------------------------------------------------------------------------------
Rotina    :
Data      : 04/08/2003
Autor     : Marchetti
Pendencia : 14763
Descrição : Filtro por Patro/Plano e gravação no LogTotalPrev
--------------------------------------------------------------------------------
Rotina    : DesfazItensPatroCAPCAR e DesfazItensPatroTMPDESC
Data      : 16/04/2003
Autor     : André Pontes
Descrição : Inclusão da função de atualização da situação contratual, como no
            Recebimento
--------------------------------------------------------------------------------
Rotina    : DesfazItensPatroTMPDESC
Data      : 07/01/2003
Autor     : André Pontes
Descrição : Filtro da query modificado para: CON.FLGSITUACAO <> ''C'' (para
            desfazer recebimentos inesperados de contratos quitados também)
--------------------------------------------------------------------------------
Rotina    : DesfazRecebimentoHist
Data      : 16/12/2002
Autor     : Marchetti
Descrição : Não deleta mais os registros, apenas estorna
--------------------------------------------------------------------------------
Rotina    : TrocaSitEnvioTmpDesc
Data      : 31/10/2002
Autor     : André Pontes
Descrição : Retirada dos parâmetros de MESCOMPETENCIA e dos 2 valores: o mês
            competência fazia com que o registro correto não fosse encontrado e
            os 2 valores de nada serviam, pois era da HIST, não da TMPDESC.
            Dentro da query de update foi criado um decode que define o SitEnvio
            correto.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 30/10/2002
Autor     : Marchetti
Descrição : Acerto na query que busca registros baixados pelo CaR
--------------------------------------------------------------------------------
Rotina    : -
Data      : 03/10/2002
Autor     : Marchetti
Descrição : Colocado filtro de selecção de contrato
--------------------------------------------------------------------------------
Rotina    : DesfazItensPatroTMPDESC e DesfazItensPatroCAPCAR
Data      : 03/10/2002
Autor     : Marchetti
Descrição : Colocado filtro de contrato quando selecionado
--------------------------------------------------------------------------------
Rotina    : TrocaSitEnvioTmpDesc
Data      : 03/10/2002
Autor     : Marchetti
Descrição : Acerto no parâmetro PSITENVIO
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, TREdit, StdCtrls, ExtCtrls, CheckLst, fcButton, fcImgBtn,
   fcShapeBtn, wwdblook, Mask, wwdbedit, Wwdbspin, fcLabel, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uTypesEmptmo, Db,
   DBTables, Wwquery, mContratoEmptmo,UFuncoesEmptmo, mListaPatro, mListaPlano, wwdbdatetimepicker,
   uCtrlContab, uCtrlPadroes;

type
   TfrmCancRecebimento = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      ntbPrincipal: TNotebook;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      btnContinuar: TfcShapeBtn;
      grbEnvio: TGroupBox;
      chkFolhaBenef: TCheckBox;
      chkFolhaPatro: TCheckBox;
      chkFinanceiroPag: TCheckBox;
      btnVoltar: TfcShapeBtn;
      memResult: TMemo;
      memErro: TMemo;
      Panel3: TPanel;
      Panel4: TPanel;
      qryDesfazRecebimento: TwwQuery;
      qryAux: TwwQuery;
      edtVlrDesfeito: TRealEdit;
      Label3: TLabel;
      qryUpdateTmpDesc: TwwQuery;
      chkFinanceiroRec: TCheckBox;
      molContratoEmptmo: TmolContratoEmptmo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryUpdateSituacao: TwwQuery;
      qrySituacaoContrato: TwwQuery;
      qrySituacaoContratoFLGSITUACAO: TStringField;
      qryUpdateParcelasSeq: TwwQuery;
      qryUpdateParcelaBase: TwwQuery;
      grpDataRecebimento: TGroupBox;
      edtDataRecebIni: TwwDBDateTimePicker;
      Label5: TLabel;
      edtDataRecebFim: TwwDBDateTimePicker;
      grpDataVencto: TGroupBox;
      Label6: TLabel;
      edtDataVenctoIni: TwwDBDateTimePicker;
      edtDataVenctoFim: TwwDBDateTimePicker;
      grpDataEfetiva: TGroupBox;
      Label4: TLabel;
      edtDataEfetivaIni: TwwDBDateTimePicker;
      edtDataEfetivaFim: TwwDBDateTimePicker;
      edtCodDocumento: TEdit;
      Label7: TLabel;

      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure ntbPrincipalPageChanged(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure edtCodDocumentoExit(Sender: TObject);
      procedure edtCodDocumentoKeyPress(Sender: TObject; var Key: Char);


   private  // Private declarations

      fVlrDesfeito   : Currency;
      dDataHoje      : TDateTime;
      rLogTotalPrev  : TLogTotalPrev;

      Contab         : TCtrlContab;   // André Pontes - 13/06/2005 - pendência 19459

      procedure HabilitaBotoes;
      procedure DesabilitaBotoes;
      procedure AbreQueries;

      procedure DesfazItensPatroTMPDESC(const iPatro: Int64;
                                        const sPatro: String
                                       );

      procedure DesfazItensPatroCAPCAR(const iPatro: Int64;
                                       const sPatro: String
                                      );

      procedure TrocaSitEnvioTmpDesc(IDContratoEmptmo : Extended;
                                     IDTmpDesc        : Extended
                                    );


      function  VerificaPreenchimento: Boolean;
      function  ExisteItemCobrado : Integer;

      function  DesfazRecebimentoHist(const IDHistMovEmptmo  : Extended;
                                      const IDContratoEmptmo : Extended;
                                      const IDItemEmptmo     : Integer;
                                      const iParcela         : Integer;
                                      const iSeqCobranca     : Integer
                                      ) : Boolean;


   public   // Public declarations

   
   end;



var
  frmCancRecebimento: TfrmCancRecebimento;



implementation
{$R *.DFM}
uses
   DLookEmptmo, USistema, UDataBase, UMensErro, FProgresso,
   dBaseDados, uModulo, uVerificaPreenchimento, dMS, uIntegraEmptmo, uLancContab,
   DEmptmo, uDiasUteis, UCalcEmptmo;





procedure TfrmCancRecebimento.HabilitaBotoes;
begin
   btnContinuar.Enabled := True;
   btnVoltar.Enabled    := True;
   bbtnSair.Enabled     := True;

   ntbPrincipal.Enabled := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmCancRecebimento.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   ntbPrincipal.Enabled := False;

   btnContinuar.Enabled := False;
   btnVoltar.Enabled    := False;
   bbtnSair.Enabled     := False;
end;



procedure TfrmCancRecebimento.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;



function TfrmCancRecebimento.VerificaPreenchimento: Boolean;
var
   sMsg        : String;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if not((edtDataVenctoIni.Text <> '')  and (edtDataVenctoFim.Text <> ''))  and
         not((edtDataEfetivaIni.Text <> '') and (edtDataEfetivaIni.Text <> '')) and
         not((edtDataRecebIni.Text <> '')   and (edtDataRecebFim.Text <> ''))   and
         not(length(trim(edtCodDocumento.Text)) > 0) then
      begin
         raise EValidacao.CreateVal('É necessário indicar pelo menos uma faixa de datas!', edtDataVenctoIni);
      end;

      // -------------------------------------------------------------------------------------------

      if Sistema.TipoCliente = 19991 then
         if not((edtDataEfetivaIni.Text <> '') and (edtDataEfetivaIni.Text <> '')) and
            not(length(trim(edtCodDocumento.Text)) > 0) then
               raise EValidacao.CreateVal('É necessário indicar pelo menos a faixa de Datas Efetivas!', edtDataEfetivaIni);

      // -------------------------------------------------------------------------------------------

      // André Pontes - 13/06/2005 - pendência 19459
      if Sistema.TipoCliente = 19991 then
      begin
         // ----------------------------------------------------------------------------------------

         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataEfetivaIni.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível desfazer recebimento de valores com data efetiva no perído indicado:' + #13 + '"' + sMsgContab + '"', edtDataEfetivaIni);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível desfazer recebimento de valores com data efetiva no perído indicado:' + #13 + '"' + sMsgContab + '"', edtDataEfetivaIni);
         end;

         // ----------------------------------------------------------------------------------------

         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataEfetivaIni.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível desfazer recebimento de valores com data efetiva no perído indicado:' + #13 + '"' + sMsgContab + '"', edtDataEfetivaIni);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível desfazer recebimento de valores com data efetiva no perído indicado:' + #13 + '"' + sMsgContab + '"', edtDataEfetivaIni);
         end;

         // ----------------------------------------------------------------------------------------
      end;
      // FIM André Pontes - 13/06/2005 - pendência 19459

      // -------------------------------------------------------------------------------------------

      if (edtDataRecebIni.Text = '') or (edtDataRecebFim.Text = '') then
      begin
         sMsg :=  'A não indicação de uma faixa de Datas de Recebimento pode ' +
                  'resultar na identificação incorreta dos registros! ' + #13 + #13 +
                  'Deseja realmente prosseguir? ';

         if MsgDlg(sMsg, 'Empréstimo', mtWarning, [mbYes, mbNo], 0) = mrNo then
         begin
            Repaint;
            Exit;
         end;
         Repaint;
      end;

      // -------------------------------------------------------------------------------------------

   except

      on ev : EValidacao do
      begin
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCancRecebimento.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   molContratoEmptmo.btnLimpaContrato.Click;

   AbreQueries;

   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   dDataHoje := Sysdate;
end;



procedure TfrmCancRecebimento.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContrato do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContrato);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      end;
      Open;

      DBcboTipoContrato.Enabled := True;
   end;
end;



procedure TfrmCancRecebimento.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;
   EscondeEspera;
end;



procedure TfrmCancRecebimento.btnContinuarClick(Sender: TObject);
var
   i         : Integer;
   sMsg      : String;
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

   if VerificaPreenchimento then
   try
      DesabilitaBotoes;

      (* limpa os memos de resultado e erro *)
      memResult.Clear;
      memErro.Clear;

      sMsg     := 'Deseja realmente DESFAZER RECEBIMENTO?';

      if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
      Repaint;

      try
         fVlrDesfeito := 0;

         // ----------------------------------------------------------------------------------------

         // Inicia uma transação - só se não ouver transação iniciada
         if dtmBaseDados.dbBaseDados.InTransaction then
         begin
            MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;

         StartTransacao;

         // ----------------------------------------------------------------------------------------

         // Folhas ---------------------------------------------------------------------------------
         if (chkFolhaBenef.Checked) or (chkFolhaPatro.Checked) then
         begin
            // Laço das Patrocinadoras escolhidas para TMPDESC
            for i := 0 to high(molListaPatro.vIDPatro) do
            begin
               if molListaPatro.lstPatro.Checked[i] then DesfazItensPatroTMPDESC(molListaPatro.vIDPatro[i],
                                                                                 molListaPatro.lstPatro.Items[i]
                                                                                );
               Application.ProcessMessages;
            end;

         end;
         // ----------------------------------------------------------------------------------------

         // CaP/CaR ou Ambos -----------------------------------------------------------------------
         if (chkFinanceiroPag.Checked) or (chkFinanceiroRec.Checked) then
         begin
            // Laço das Patrocinadoras escolhidas para CAPCAR
            for i := 0 to high(molListaPatro.vIDPatro) do
            begin
               if molListaPatro.lstPatro.Checked[i] then DesfazItensPatroCAPCAR(molListaPatro.vIDPatro[i],
                                                                                molListaPatro.lstPatro.Items[i]
                                                                               );
               Application.ProcessMessages;
            end;
         end;
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         // Log de operações
         if not(Sistema.GravaLogOperacoes('Desfazer Recebimento ref: ' +
                                          edtDataRecebIni.Text + ' e ' + edtDataRecebFim.Text)) then
         begin
            Raise Exception.Create('Falha na gravação do Log da operação.');
         end;
         // ----------------------------------------------------------------------------------------

         // ----------------------------------------------------------------------------------------

         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := Sistema.IDModulo;
         rLogTotalPrev.IDContrato := -1;
         if MolContratoEmptmo.IDContrato > 0 then rLogTotalPrev.IDContrato := MolContratoEmptmo.IDContrato;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 62;
         rLogTotalPrev.Operacao   := 'Desfazer Recebimento ref: ' + edtDataRecebIni.Text + ' e ' + edtDataRecebFim.Text + '-'+
                                     'Patro: ' + molListaPatro.PegaPatro + '- Plano: ' + molListaPlano.PegaPlano;
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);

         // -------------------------------------------------------------------------------------

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      except
         Raise;
         Repaint;

         if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end;

      (* vai para página de Resultados *)
      edtVlrDesfeito.Text     := FloatToStr(fVlrDesfeito);
      ntbPrincipal.PageIndex  := 1;

      Repaint;

   finally
      HabilitaBotoes;
   end;
end;



function TfrmCancRecebimento.ExisteItemCobrado : Integer;
var
   sSQL : String;
begin
   Result := 0;

   try
      MostraEspera('Verificando Itens já cobrados da(s) Patrocinadora(s)...');

      sSQL :=
      'SELECT '                                                                           + #13 +
      '   NVL(COUNT(*), 0) AS QUANTIDADE '                                                + #13 +

      'FROM '                                                                             + #13 +
      '  HISTMOVEMPTMO   HME, '                                                           + #13 +
      '  CONTRATOEMPTMO  CON, '                                                           + #13 +
      '  TIPOCONTREMPTMO TIP, '                                                           + #13 +
      '  TIPOEMPTMO      TEM, '                                                           + #13 +
      '  ITEMXTIPOCONTR  ITC  '                                                           + #13 +

      'WHERE '                                                                            + #13 +
      '      ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO  = 1) ) '                + #13;

      if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
      '   AND ( HME.HMEDATAVENCTO      >= ' + OraData(edtDataVenctoIni.Date) + ' ) '      + #13;

      if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
      '   AND ( HME.HMEDATAVENCTO      <= ' + OraData(edtDataVenctoFim.Date) + ' ) '      + #13;

      if edtDataEfetivaIni.Text <> '' then sSQL := sSQL +
      '   AND ( HME.HMEDATAEFETIVA     >= ' + OraData(edtDataEfetivaIni.Date) + ' ) '     + #13;

      if edtDataEfetivaFim.Text <> '' then sSQL := sSQL +
      '   AND ( HME.HMEDATAEFETIVA     <= ' + OraData(edtDataEfetivaFim.Date) + ' ) '     + #13;

      if edtDataRecebIni.Text <> '' then sSQL := sSQL +
      '   AND ( HME.HMEDATARECEB       >= ' + OraData(edtDataRecebIni.Date) + ' ) '       + #13;

      if edtDataRecebFim.Text <> '' then sSQL := sSQL +
      '   AND ( HME.HMEDATARECEB       <= ' + OraData(edtDataRecebFim.Date) + ' ) '       + #13;

      sSQL := sSQL +
      '  AND ( TEM.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa) + ' ) '          + #13 +
      '  AND ( (HME.PLNCODIGORECEB     IS NOT NULL) OR '                                  + #13 +
      '        (HME.CODDOCUMENTORECEB  IS NOT NULL ) ) '                                  + #13;

      // filtro por Contrato
      if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
      '   AND HME.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)      + #13;

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         sSQL := sSQL +
         '  AND ( TIP.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue + ' ) '         + #13;
      end;

      if DBcboTipoContrato.LookupValue <> '' then
      begin
      sSQL := sSQL +
         '  AND ( CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '       + #13 +
         '  AND ( TIP.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue + ' ) '       + #13;
      end;

      sSQL := sSQL +
      '  AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO ) '                           + #13 +
      '  AND ( CON.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) '                          + #13 +
      '  AND ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                               + #13 +
      '  AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) '                          + #13;

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;
         Result := (FieldByName('QUANTIDADE').AsInteger);
         Close;
      end;

   finally
      EscondeEspera;
   end;

end;



procedure TfrmCancRecebimento.DesfazItensPatroTMPDESC(const iPatro: Int64;
                                                      const sPatro: String
                                                     );
var
   sResult, sErro : TStringList;
   i              : Integer;
   fContratoAnt   : Extended;
   fContratoPos   : Extended;
	sSQL           : String;
   sTipoFolha     : String;
   sSituacao      : String;
   sNovaSituacao  : String;
begin
   sSQL :=
   'SELECT '                                                                           + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDHISTMOVEMPTMO, HME.IDTMPDESC, '                     + #13 +
   '   HME.HMEPARCELA, '                                                               + #13 +
   '   HME.HMEVLRPREVISTO, HME.HMERECPAG , HME.HMEVLREFETIVO,'                         + #13 +
   '   HME.HMEFORMACOBRANCA, HME.HMETIPOFOLHA, HME.CODDOCUMENTORECEB, '                + #13 +
   '   HME.IDRUBRICA, HME.IDITEMEMPTMO, HME.HMESEQCOBRANCA, '                          + #13 +

   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, ''0000'')))) '                          + #13 +
   '   || ''/'' || '                                                                   + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, ''00'')))) AS ANOMESCOMPETENCIA, '      + #13 +

   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOBRANCA, ''0000'')))) '                             + #13 +
   '   || ''/'' || '                                                                   + #13 +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOBRANCA, ''00'')))) AS ANOMESCOBRANCA, '            + #13 +

   '   ITC.CONTABAIXA, ITC.TIPCODIGO, '                                                + #13 +
   '   CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                      + #13 +
   '   CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, '                          + #13 +
   '   TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, SIT.FLGINTERNO '                       + #13 +

   'FROM '                                                                             + #13 +
   '  HISTMOVEMPTMO   HME, '                                                           + #13 +
   '  CONTRATOEMPTMO  CON, '                                                           + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                           + #13 +
   '  TIPOEMPTMO      TEM, '                                                           + #13 +
   '  ITEMEMPTMO      IRC, '                                                           + #13 +
   '  ITEMXTIPOCONTR  ITC, '                                                           + #13 +
   '  PARTPREVPLAN    PPP, '                                                           + #13 +
   '  ELEGPATRO       ELP, '                                                           + #13 +
   '  SITPART         SIT  '                                                           + #13 +

   'WHERE '                                                                            + #13 +
   '      HME.HMEFORMACOBRANCA         = ''F'' '                                       + #13 +
   '  AND TEM.IDEMPRESAPROP            = ' + IntToStr(Sistema.IDEmpresa)               + #13 +
   '  AND (HME.FLGBAIXAMANUAL          IS NULL OR HME.FLGBAIXAMANUAL = 0) '            + #13 +
   '  AND (HME.HMECENTRALIZA           = 1 OR HME.HMEDESTACADO  = 1) '                 + #13 +
   '  AND NVL(HME.FLGESTORNADO, 0)     = 0 '                                           + #13 +
   '  AND NVL(HME.FLGABONADO, 0)       = 0 '                                           + #13 +
   '  AND NVL(HME.FLGQUITADO, 0)       = 0 '                                           + #13 +
   '  AND ( '                                                                          + #13 +
   '      ((NVL(HME.HMEVLRPREVISTO, 0) <> 0 OR NVL(HME.HMEVLREFETIVO, 0) <> 0)) OR '   + #13 +
   '      ((NVL(HME.HMEVLRPREVISTO, 0) = 0 AND NVL(HME.HMEVLREFETIVO, 0)  = 0)) '      + #13 +
   '      ) '                                                                          + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND HME.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   if length(trim(edtCodDocumento.Text)) <> 0 then sSQL := sSQL +
   '   AND HME.CODDOCUMENTO            = ' + edtCodDocumento.Text                      + #13;

   if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
   '  AND HME.HMEDATAVENCTO            >= ' + OraData(edtDataVenctoIni.Date)           + #13;

   if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
   '  AND HME.HMEDATAVENCTO            <= ' + OraData(edtDataVenctoFim.Date)           + #13;

   if edtDataEfetivaIni.Text <> '' then sSQL := sSQL +
   '  AND HME.HMEDATAEFETIVA           >= ' + OraData(edtDataEfetivaIni.Date)          + #13;

   if edtDataEfetivaFim.Text <> '' then sSQL := sSQL +
   '  AND HME.HMEDATAEFETIVA           <= ' + OraData(edtDataEfetivaFim.Date)          + #13;

   if edtDataRecebIni.Text <> '' then sSQL := sSQL +
   '  AND HME.HMEDATARECEB             >= ' + OraData(edtDataRecebIni.Date)            + #13;

   if edtDataRecebFim.Text <> '' then sSQL := sSQL +
   '  AND HME.HMEDATARECEB             <= ' + OraData(edtDataRecebFim.Date)            + #13;

   sSQL := sSQL +
   '  AND ( CON.IDPATRO                = ' + IntToStr(iPatro) +
       ' OR ELP.IDPESSJURCEDIDO = ' + IntToStr(iPatro) + ' ) '                         + #13 +
   '  AND CON.FLGSITUACAO              <> ''C'' '                                      + #13 +
   '  AND HME.PLNCODIGORECEB           IS NULL '                                       + #13 +
   '  AND (HME.FLGRECEBIMENTO          IS NULL OR HME.FLGRECEBIMENTO = 0) '            + #13 +
   '  AND HME.CODDOCUMENTORECEB        IS NULL '                                       + #13;

   sTipoFolha     := '';

   if chkFolhaPatro.Checked then sTipoFolha := QuotedStr('P');

   if chkFolhaBenef.Checked then
   begin
      if sTipoFolha <> '' then
      begin
         sTipoFolha := sTipoFolha + ',' + QuotedStr('B')
      end
      else
      begin
         sTipoFolha := QuotedStr('B');
      end;
   end;

   if sTipoFolha <> '' then sSQL := sSQL +
   '  AND HME.HMETIPOFOLHA             IN (' + sTipoFolha + ') '                       + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '  AND TIP.IDTIPOEMPTMO             = ' + DBcboTipoEmptmo.LookupValue               + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '  AND CON.IDTIPOCONTREMPTMO        = ' + DBcboTipoContrato.LookupValue             + #13 +
   '  AND TIP.IDTIPOCONTREMPTMO        = ' + DBcboTipoContrato.LookupValue             + #13;

   sSQL := sSQL +
   '  AND HME.IDCONTRATOEMPTMO         = CON.IDCONTRATOEMPTMO '                        + #13 +
   '  AND CON.IDTIPOCONTREMPTMO        = TIP.IDTIPOCONTREMPTMO '                       + #13 +
   '  AND TIP.IDTIPOEMPTMO             = TEM.IDTIPOEMPTMO '                            + #13 +
   '  AND CON.IDPESSOA                 = PPP.IDPESSOA '                                + #13 +
   '  AND CON.IDPATRO                  = PPP.IDPESSJUR '                               + #13 +
   '  AND CON.IDPESSOA                 = ELP.IDPESSOA '                                + #13 +
   '  AND CON.IDPATRO                  = ELP.IDPESSJUR '                               + #13 +
   '  AND SIT.IDSITPART                = PPP.IDSITPART '                               + #13 +
   '  AND ITC.IDTIPOCONTREMPTMO        = CON.IDTIPOCONTREMPTMO '                       + #13 +
   '  AND ITC.IDITEMEMPTMO             = HME.IDITEMEMPTMO '                            + #13 +
   '  AND IRC.IDITEMEMPTMO             = HME.IDITEMEMPTMO '                            + #13 +
    //Marcos Merola SOL : 165338 Kintana : 1430202 - INICIO
   '  AND (PPP.IDPLANOPREV =                                                           '+ #13 +
   '      (SELECT MAX(PPP2.IDPLANOPREV)                                                '+ #13 +
   '       FROM PARTPREVPLAN PPP2                                                      '+ #13 +
   '       WHERE PPP2.FLGDESATIVADO = 0                                                '+ #13 +
   '          AND PPP2.IDPESSOA = PPP.IDPESSOA) OR                                     '+ #13 +
   '          (PPP.FLGDESATIVADO = 1 AND NOT EXISTS                                    '+ #13 +
   '       (SELECT 1                                                                   '+ #13 +
   '       FROM PARTPREVPLAN PPP1                                                      '+ #13 +
   '       WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                          '+ #13 +
   '          AND PPP1.FLGDESATIVADO = 0) AND                                          '+ #13 +
   '          (PPP.IDSITPLANOPREV = 25 OR                                              '+ #13 +
   '          (PPP.IDPLANOPREV =                                                       '+ #13 +
   '       (SELECT MAX(PPP1.IDPLANOPREV)                                               '+ #13 +
   '        FROM PARTPREVPLAN PPP1                                                     '+ #13 +
   '        WHERE PPP1.IDPESSOA = PPP.IDPESSOA                                         '+ #13 +
   '            AND NVL(PPP1.DATACANCELAMENTO, TRIM(SYSDATE)) =                        '+ #13 +
   '        (SELECT NVL(MAX(PPP2.DATACANCELAMENTO), TRIM(SYSDATE))                     '+ #13 +
   '        FROM PARTPREVPLAN PPP2                                                     '+ #13 +
   '        WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)                                       '+ #13 +
   '            AND NOT EXISTS (SELECT 1                                               '+ #13 +
   '        FROM PARTPREVPLAN PPP2                                                     '+ #13 +
   '        WHERE PPP2.IDPESSOA = PPP1.IDPESSOA                                        '+ #13 +
   '             AND PPP2.IDSITPLANOPREV = 25))))))                                    '+ #13 +
   'ORDER BY                                                                           '+ #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, HME.HMEPARCELA, HME.HMESEQCOBRANCA ';
   //Marcos Merola SOL : 165338 Kintana : 1430202 - FIM

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      with qryDesfazRecebimento do
      begin
         Close;
         Sql.Text := sSQL;
      // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
      // qryDesfazRecebimento.SQL.SaveToFile(Sistema.TempDir + 'EP-DesfazerRecebimentoFolha.txt');
         qryDesfazRecebimento.SQL.SaveToFile(ftempregra + '\' + 'EP-DesfazerRecebimentoFolha.txt');
         Open;

         First;
         i := 0;

         fContratoAnt := 0;

         frmProgresso.MostraFormProgresso('Desfazendo Recebimentos - ' + sPatro + '...',
                                          True,
                                          False,
                                          True,
                                          i,
                                          qryDesfazRecebimento.RecordCount
                                         );

         while not(qryDesfazRecebimento.EOF) do
         begin
            inc(i);
            frmProgresso.AndaFormProgresso(i);

            fContratoPos := qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat;

            // Se o código do documento estiver preenchido, mostra erro ----------------------------
            if not(qryDesfazRecebimento.FieldByName('CODDOCUMENTORECEB').IsNull) then
            begin
               sErro.Add(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsString + '/' +
                         qryDesfazRecebimento.FieldByName('ITEDESCRICAO').AsString + '/' +
                         qryDesfazRecebimento.FieldByName('HMEVLREFETIVO').AsString +
                         ' - [FOLHA] - Já cobrado para a Patrocinadora.'
                        );

               qryDesfazRecebimento.Next;
               Continue;
            end;
            // -------------------------------------------------------------------------------------

            if DesfazRecebimentoHist(qryDesfazRecebimento.FieldByName('IDHISTMOVEMPTMO').AsFloat,
                                     qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                     qryDesfazRecebimento.FieldByName('IDITEMEMPTMO').AsInteger,
                                     qryDesfazRecebimento.FieldByName('HMEPARCELA').AsInteger,
                                     qryDesfazRecebimento.FieldByName('HMESEQCOBRANCA').AsInteger) then
            begin
               TrocaSitEnvioTmpDesc(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                    qryDesfazRecebimento.FieldByName('IDTMPDESC').AsFloat
                                   );

               fVlrDesfeito := fVlrDesfeito + qryDesfazRecebimento.FieldByName('HMEVLREFETIVO').AsCurrency;


               // ----------------------------------------------------------------------------------
               //    Acerto da situação do Contrato
               // ----------------------------------------------------------------------------------
               CalcEmptmo.AcertaSituacaoContratual(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat, 62);

               // ----------------------------------------------------------------------------------
               sResult.Add(FieldByName('IDCONTRATOEMPTMO').AsString + '/' + FieldByName('ITEDESCRICAO').AsString + '/' +
                           FieldByName('HMEVLREFETIVO').AsString + ' - [FOLHA] - Recebimento Desfeito.');
               // ----------------------------------------------------------------------------------
            end
            else
            begin
               // ----------------------------------------------------------------------------------
               sErro.Add(FieldByName('IDCONTRATOEMPTMO').AsString + '/' + FieldByName('ITEDESCRICAO').AsString + '/' +
                         FieldByName('HMEVLREFETIVO').AsString    + ' - [FOLHA] - Erro ao Desfazer Recebimento.');
               // ----------------------------------------------------------------------------------
            end;

            qryDesfazRecebimento.Next;

            fContratoAnt := fContratoPos;
         end;
      end;

   finally
      frmProgresso.EscondeFormProgresso;

      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;



procedure TfrmCancRecebimento.DesfazItensPatroCAPCAR(const iPatro: Int64;
                                                     const sPatro: String
                                                    );
var
   sResult, sErro : TStringList;
   fContratoAnt   : Extended;
   fContratoPos   : Extended;
   sSQL           : String;
   sTipoPR        : String;
   sSituacao      : String;
   sNovaSituacao  : String;
begin
   sSQL :=
   'SELECT DISTINCT '                                                                        + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO , '                        + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, HME.HMEVLRPREVISTO, '                      + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, HME.HMEPARCELA, '               + #13 +
   '  HME.HMEVLREFETIVO, HME.IDRUBRICA, HME.HMESEQCOBRANCA, HME.CODDOCUMENTORECEB, '         + #13 +
   '  HME.CODDOCUMENTO, '                                                                    + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HMEANOCOBRANCA, ''0000'')))) '                                    + #13 +
   '  || '                                                                                   + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HMEMESCOBRANCA, ''00'')))) AS ANOMESCOBRANCA, '                   + #13 +

   '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                             + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, '                                 + #13 +
   '  TIP.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO '                                              + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +
   '  CONTRATOEMPTMO  CON, '                                                                 + #13 +
   '  TIPOCONTREMPTMO TIP, '                                                                 + #13 +
   '  TIPOEMPTMO      TEM, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC  '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '       TEM.IDEMPRESAPROP            = ' + IntToStr(Sistema.IDEmpresa)                    + #13 +
   '   AND HME.HMEFORMACOBRANCA         = ''C'' '                                            + #13 +
   '   AND (HME.FLGBAIXAMANUAL          IS NULL OR HME.FLGBAIXAMANUAL = 0) '                 + #13 +
   '   AND (HME.HMECENTRALIZA           = 1 OR HME.HMEDESTACADO  = 1) '                      + #13 +
   '   AND NVL(HME.FLGESTORNADO, 0)     = 0 '                                                + #13 +
   '   AND NVL(HME.FLGABONADO, 0)       = 0 '                                                + #13 +
   '   AND NVL(HME.FLGQUITADO, 0)       = 0 '                                                + #13 +
   '   AND (NVL(HME.HMEVLRPREVISTO, 0) <> 0 OR NVL(HME.HMEVLREFETIVO, 0) <> 0) '             + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND HME.IDCONTRATOEMPTMO        = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + #13;

   if length(trim(edtCodDocumento.Text)) <> 0 then sSQL := sSQL +
   '   AND HME.CODDOCUMENTO            = ' + edtCodDocumento.Text                            + #13;

   if edtDataVenctoIni.Text <> '' then sSQL := sSQL +
   '   AND ( HME.HMEDATAVENCTO        >= ' + OraData(edtDataVenctoIni.Date) + ' ) '          + #13;

   if edtDataVenctoFim.Text <> '' then sSQL := sSQL +
   '   AND ( HME.HMEDATAVENCTO        <= ' + OraData(edtDataVenctoFim.Date) + ' ) '          + #13;

   if edtDataEfetivaIni.Text <> '' then sSQL := sSQL +
   '   AND ( HME.HMEDATAEFETIVA       >= ' + OraData(edtDataEfetivaIni.Date) + ' ) '         + #13;

   if edtDataEfetivaFim.Text <> '' then sSQL := sSQL +
   '   AND ( HME.HMEDATAEFETIVA       <= ' + OraData(edtDataEfetivaFim.Date) + ' ) '         + #13;

   if edtDataRecebIni.Text <> '' then sSQL := sSQL +
   '   AND ( HME.HMEDATARECEB         >= ' + OraData(edtDataRecebIni.Date) + ' ) '           + #13;

   if edtDataRecebFim.Text <> '' then sSQL := sSQL +
   '   AND ( HME.HMEDATARECEB         <= ' + OraData(edtDataRecebFim.Date) + ' ) '           + #13;

   sSQL := sSQL +
   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13 +
   '   AND ( HME.CODDOCUMENTO       IS NOT NULL ) '                                          + #13 +
   '   AND ( HME.PLNCODIGORECEB     IS NULL ) '                                              + #13 +
   '   AND ( HME.FLGSUSPENSAO       IS NULL OR HME.FLGSUSPENSAO = 0 ) '                      + #13;

   sTipoPR := '';

   if chkFinanceiroPag.Checked then
   begin
      if sTipoPR <> '' then sTipoPR := sTipoPR + ',';
      sTipoPR := sTipoPR + QuotedStr('P');
   end;

   if chkFinanceiroRec.Checked then
   begin
      if sTipoPR <> '' then sTipoPR := sTipoPR + ',';
      sTipoPR := sTipoPR + QuotedStr('R');
   end;

   if sTipoPR <> '' then sSQL := sSQL +
   '   AND ( HME.HMERECPAG IN ( ' + sTipoPR + ' ) ) '                                        + #13;

   sSQL := sSQL +
   '   AND ( CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') ) '                 + #13 +
   '   AND ( CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') ) '                 + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND ( TIP.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13 +
   '   AND ( TIP.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   sSQL := sSQL +
   '   AND ( TEM.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +
   '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = TIP.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( TIP.IDTIPOEMPTMO       = TEM.IDTIPOEMPTMO ) '                                   + #13 +
   '   AND ( IRC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13 +

   'ORDER BY '                                                                               + #13 +
   '   HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, HME.HMEPARCELA, HME.HMESEQCOBRANCA ';

   try
      sResult := TStringList.Create;
      sErro   := TStringList.Create;

      with qryDesfazRecebimento do
      begin
         Close;
         Sql.Text := sSQL;
      // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
      // qryDesfazRecebimento.SQL.SaveToFile(Sistema.TempDir + 'EP-DesfazerRecebimentoCaPCaR.txt');
         qryDesfazRecebimento.SQL.SaveToFile(ftempregra + '\' + 'EP-DesfazerRecebimentoCaPCaR.txt');
         Open;

         First;
         fContratoAnt := 0;

         while not(qryDesfazRecebimento.EOF) do
         begin
            fContratoPos := qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat;

            if not(qryDesfazRecebimento.FieldByName('CODDOCUMENTORECEB').IsNull) then
            begin
               sErro.Add(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsString + '/' +
                         qryDesfazRecebimento.FieldByName('ITEDESCRICAO').AsString + '/' +
                         qryDesfazRecebimento.FieldByName('HMEVLREFETIVO').AsString
                         + ' - [Cap/CaR] - Já cobrado para a Patrocinadora.'
                        );
               Continue;
            end;

            if DesfazRecebimentoHist(qryDesfazRecebimento.FieldByName('IDHISTMOVEMPTMO').AsFloat,
                                     qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat,
                                     qryDesfazRecebimento.FieldByName('IDITEMEMPTMO').AsInteger,
                                     qryDesfazRecebimento.FieldByName('HMEPARCELA').AsInteger,
                                     qryDesfazRecebimento.FieldByName('HMESEQCOBRANCA').AsInteger) then
            begin
               fVlrDesfeito := fVlrDesfeito + qryDesfazRecebimento.FieldByName('HMEVLREFETIVO').AsCurrency;

               // Marchetti - Pendencia 16894
               IntegraEmptmo.ConciliaDocumento(qryDesfazRecebimento.FieldByName('CODDOCUMENTO').AsInteger, 1);

               // ----------------------------------------------------------------------------------
               //    Acerto da situação do Contrato
               // ----------------------------------------------------------------------------------
               CalcEmptmo.AcertaSituacaoContratual(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsFloat, 62);


               // ----------------------------------------------------------------------------------
               sResult.Add(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsString + '/' +
                           qryDesfazRecebimento.FieldByName('ITEDESCRICAO').AsString + '/' +
                           qryDesfazRecebimento.FieldByName('HMEVLREFETIVO').AsString +
                           ' - [Cap/CaR] - Recebimento Desfeito.');
               // ----------------------------------------------------------------------------------
            end
            else
            begin
               // ----------------------------------------------------------------------------------
               sErro.Add(qryDesfazRecebimento.FieldByName('IDCONTRATOEMPTMO').AsString + '/' +
                         qryDesfazRecebimento.FieldByName('ITEDESCRICAO').AsString + '/' +
                         qryDesfazRecebimento.FieldByName('HMEVLREFETIVO').AsString +
                         ' - [Cap/CaR] - Erro ao Desfazer Recebimento.');
               // ----------------------------------------------------------------------------------
            end;

            qryDesfazRecebimento.Next;

            fContratoAnt := fContratoPos;
         end;
      end;

   finally
      memResult.Lines.AddStrings(sResult);
      sResult.Free;

      memErro.Lines.AddStrings(sErro);
      sErro.Free;
   end;
end;



function TfrmCancRecebimento.DesfazRecebimentoHist(const IDHistMovEmptmo  : Extended;
                                                   const IDContratoEmptmo : Extended;
                                                   const IDItemEmptmo     : Integer;
                                                   const iParcela         : Integer;
                                                   const iSeqCobranca     : Integer
                                                  ) : Boolean;
begin
   Result := True;

   try
      // 1º - desfaz a própria parcela
      with qryUpdateParcelaBase do
      begin
         LimpaParametros(qryUpdateParcelaBase);
         ParamByName('PIDHISTMOVEMPTMO').AsFloat      := IDHistMovEmptmo;
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContratoEmptmo;

         if edtDataVenctoIni.Text <> '' then    ParamByName('PHMEDATAVENCTOINI').AsDateTime  := edtDataVENCTOIni.Date;
         if edtDataVenctoFim.Text <> '' then    ParamByName('PHMEDATAVENCTOFIM').AsDateTime  := edtDataVENCTOFim.Date;

         if edtDataEfetivaIni.Text <> '' then   ParamByName('PHMEDATAEFETIVAINI').AsDateTime := edtDataEFETIVAIni.Date;
         if edtDataEfetivaFim.Text <> '' then   ParamByName('PHMEDATAEFETIVAFIM').AsDateTime := edtDataEFETIVAFim.Date;

         if edtDataRecebIni.Text <> '' then     ParamByName('PHMEDATARECEBINI').AsDateTime   := edtDataRecebIni.Date;
         if edtDataRecebFim.Text <> '' then     ParamByName('PHMEDATARECEBFIM').AsDateTime   := edtDataRecebFim.Date;

         ExecSQL;
      end;

      // 2º - desfaz os registros criados em caso de recebimento parcial/a maior
      with qryUpdateParcelasSeq do
      begin
         LimpaParametros(qryUpdateParcelasSeq);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := IDContratoEmptmo;
         ParamByName('PIDUSUARIOESTORNO').AsInteger   := Sistema.IDUsuario;
         ParamByName('PIDITEMEMPTMO').AsFloat         := IDItemEmptmo;
         ParamByName('PHMEPARCELA').AsInteger         := iParcela;
         ParamByName('PHMESEQCOBRANCA').AsInteger     := iSeqCobranca;

         if edtDataVenctoIni.Text <> '' then    ParamByName('PHMEDATAVENCTOINI').AsDateTime  := edtDataVENCTOIni.Date;
         if edtDataVenctoFim.Text <> '' then    ParamByName('PHMEDATAVENCTOFIM').AsDateTime  := edtDataVENCTOFim.Date;

         if edtDataRecebIni.Text <> '' then     ParamByName('PHMEDATARECEBINI').AsDateTime   := edtDataRecebIni.Date;
         if edtDataRecebFim.Text <> '' then     ParamByName('PHMEDATARECEBFIM').AsDateTime   := edtDataRecebFim.Date;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



procedure TfrmCancRecebimento.TrocaSitEnvioTmpDesc(IDContratoEmptmo : Extended;
                                                   IDTmpDesc        : Extended
                                                  );
begin
   // Atualiza SITENVIO
   try
      with qryUpdateTmpDesc do
      begin
         LimpaParametros(qryUpdateTmpDesc);

         ParamByName('PIDDESCONTO').AsFloat  := IDContratoEmptmo;
         ParamByName('PIDTMPDESC').AsFloat   := IDTmpDesc;

         ExecSQL;
      end;
   except
      MsgDlg('Não foi possível atualizar SITENVIO do contrato ' + FormatFloat('#0', IDContratoEmptmo), 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmCancRecebimento.btnVoltarClick(Sender: TObject);
begin
   inherited;
   ntbPrincipal.PageIndex := 0;
end;



procedure TfrmCancRecebimento.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmCancRecebimento.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmCancRecebimento.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmCancRecebimento.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmCancRecebimento.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmCancRecebimento.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmCancRecebimento.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19459
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19459
end;



procedure TfrmCancRecebimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19459
   UFuncoesEmptmo.bBuscaMutuario := false;
   inherited;
end;



procedure TfrmCancRecebimento.edtCodDocumentoExit(Sender: TObject);
var
   iDocumento : Integer;
begin
   inherited;

   if length(trim(edtCodDocumento.Text)) > 0 then
   begin
      try
         iDocumento := StrToInt(edtCodDocumento.Text);
      except
         MsgDlg('É necessário indicar um valor numérico e inteiro para o código do Documento!', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;

         edtCodDocumento.SetFocus;
         Exit;
      end;
   end;
end;



procedure TfrmCancRecebimento.edtCodDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if IsCharAlpha(Key) then Key := #0;
end;



end.
