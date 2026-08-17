{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------

--------------------------------------------------------------------------------

Pendência   : SOL 163648 Kintana 1400248
Responsável : Fanuel Junior
Data        : 16/11/2010
Descrição   : Ajustar a funcionalidade de cancelamento de quitação para permitir
              o cancelamento de quitações por resgate 
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 30/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula
            passada pela CentralAP.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 28/09/2005
Autor     : André Pontes
Pendência : 20058
Descrição : Para FUNCEF, não permitir cancelamento de amortização/quitação já
            enviada.
--------------------------------------------------------------------------------
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : VerificaPreenchimento
Data      : 05/03/2004
Autor     : Marchetti
Pendencia : 16172
Descrição : Verifica se a quitação se encontra como enviada, mandando mensagem e
            bloqueando o processo.
--------------------------------------------------------------------------------
Rotina    : -
Data      : 09/12/2002
Autor     : André Pontes
Descrição : NÃO HÁ MAIS EXCLUSÃO CONTÁBIL, SÓ ESTORNO. A data de estorno é
            preenchida por default com a data da própria quitação.
--------------------------------------------------------------------------------
Rotina    : btnBuscaContratoClick
Data      : 23/10/2002
Autor     : Marchetti
Descrição : Limpa o resulta da consulta efetuada anteriormente.
--------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Acerto nos parâmetros do procedimento que exclui os dados do
            histórico.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina..........: FormShow
N. Sol..........: 90359
N. Kintana......: 379854
Data............: 14/07/2008
Responsável.....: Denise Arruda
Descrição.......: Ajuste na query de pesquisa de contratos em quitação
-------------------------------------------------------------------------------}

unit fCancQuitacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdblook, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
   Mask, DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, uFiario,
   uCtrlContab, uCtrlPadroes,
   uTypesEmptmo;

type
   TfrmCancQuitacao = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      Label2: TLabel;
      edtDataQuitacao: TCMDateTimePicker;
      dts: TwwDataSource;
      bbtnConfirmar: TBitBtn;
      DBedtFormaPagto: TDBEdit;
      Label5: TLabel;
      qryVerParcelaGerada: TwwQuery;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      DBedtPatro: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtBeneficiario: TDBEdit;
      grpTitular: TGroupBox;
      Label9: TLabel;
      Label16: TLabel;
      Label18: TLabel;
      DBedtMtrEmpresa: TDBEdit;
      DBedtCPF: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtParticipante: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      Label11: TLabel;
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      Label10: TLabel;
      Panel1: TPanel;
      Label15: TLabel;
      edtDataCanc: TCMDateTimePicker;
      ToolbarSep974: TToolbarSep97;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      Contab               : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      sFiltroContEmp       : String;
      bRepeteConsulta      : Boolean;

      procedure Sel(i: Extended);

      function VerificaPreenchimento: Boolean;


   public   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula : String;
      // Fim Marchetti - Pendencia 22042
      
   end;



var
  frmCancQuitacao: TfrmCancQuitacao;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo,   // LimpaParametros, AtualizaConjunto
   UMensErro,        // MsgDlg
   USistema,         // Sistema
   UDatabase,        // StartTransacao
   UCalcEmptmo,      // AtualizaFlgSituacao
   DLookEmptmo,      // qryLookPortadorFormaR
   UIntegraEmptmo,
   uVerificaPreenchimento,
   uLancContab,
   dMS,
   DBaseDados,
   FExecBuscaContrato,
   dEmptmo,
   dAtualizacaoDiaria,
   FExecSelecionaContrato,
   uIntegraModulo;          




function TfrmCancQuitacao.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      // Verifica se existe algum contrato no momento
      if dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.IsNULL then
         raise EValidacao.CreateVal('É necessário selecionar um Contrato!', btnBuscaContrato);

      // -------------------------------------------------------------------------------------------

      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

      // -------------------------------------------------------------------------------------------

      // Pega o contrato no historico de contrato e verifica se esta vazio
      if not(dtmEmptmo.AbreHistMov(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                   3,  // evento 3  = quitação
                                   -1, // origem -1 = qualquer uma
                                   dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime
                                  )) then
      begin
         raise EValidacao.CreateVal('Não foi encontrado registro de Quitação!', btnBuscaContrato);
      end;
      // -------------------------------------------------------------------------------------------

      // Verifica se a quitação é de resgate
      //Fanuel Junior SOL163648 Kintana1400248
      if (dtmEmptmo.qryHistoricoMovHMEORIGEM.AsFloat = 10) then
      begin
         if MessageDlg('Atenção! Uma quitação por resgate será cancelada. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
      end;
      //Fanuel Junior SOL163648 Kintana1400248


      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Cancelamento!', edtDataCanc);

      // -------------------------------------------------------------------------------------------

      if IntegraEmptmo.EventoBaixado(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, 3, edtDataQuitacao.Date) then
         raise EValidacao.CreateVal('A Quitação já foi Baixada!', btnBuscaContrato);

      // -------------------------------------------------------------------------------------------

      // Marchetti - Pendencia 16172
      if Sistema.TipoCliente = 19991 then // André Pontes - pendência 20058 - 28/09/2005
         if IntegraEmptmo.EventoEnviado(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat, 3, edtDataQuitacao.Date) then
            raise EValidacao.CreateVal('A Quitação já foi ENVIADA! ' + #13 + 'É necessário desfazer o Envio.', btnBuscaContrato);
      // Marchetti - FIM Pendencia 16172

      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDataCanc.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer o estorno contábil na data indicada:' + #13 + '"' + sMsgContab + '"', edtDataCanc);

         // André Pontes - 03/06/2005 - pendência 19404
         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDataCanc);
         end;
         // FIM André Pontes - 03/06/2005 - pendência 19404
      end;

      // -------------------------------------------------------------------------------------------

   except

      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCancQuitacao.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmCancQuitacao.btnBuscaContratoClick(Sender: TObject);
var
iIdBenef : integer;
begin
   inherited;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      if dtmMS.MS_ContratoEmptmo.Text <> '' then dtmMS.MS_ContratoEmptmo.Cancela;
   end;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);

      frmExecBuscaContrato.Filtro :=
      '   AND CON.FLGSITUACAO <> ''C'' '                             + #13 +
      '   AND EXISTS '                                               + #13 +
      '       ( '                                                    + #13 +
      '       SELECT '                                               + #13 +
      '          HME.IDCONTRATOEMPTMO '                              + #13 +
      '       FROM '                                                 + #13 +
      '          HISTMOVEMPTMO HME '                                 + #13 +
      '       WHERE '                                                + #13 +
      '              HME.HMETIPOMOV       = 3 '                      + #13 +
      '          AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO '   + #13 +
      '       ) '                                                    + #13;

      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(frmExecBuscaContrato.ValoresChave[0]));
         Screen.Cursor := crDefault;
         DBEdit1.Text  := frmExecBuscaContrato.ValoresChave[1];
         
         iIdBenef := StrToInt(frmExecBuscaContrato.ValoresChave[4]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);

         edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;
         frmExecBuscaContrato.Free;
      end;
   end
   else
   begin
      dtmMS.MS_ContratoEmptmo.Executar;
      Repaint;

      if dtmMS.MS_ContratoEmptmo.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));
         Screen.Cursor := crDefault;
         iIdBenef := StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[2]);
         UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


         edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;

      end;
   end;

   // Habilita botao de confirma se qry estiver populada
   bbtnConfirmar.Enabled := not(dtmEmptmo.qryDadosContrato.IsEmpty);
end;



procedure TfrmCancQuitacao.bbtnConfirmarClick(Sender: TObject);
var
   rLogTotalPrev : TLogTotalPrev;
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

   if not(VerificaPreenchimento) then Exit;

   // Confirmação do processo
   if MsgDlg('Deseja realmente CANCELAR a Quitação?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;
   Repaint;

   //-----------------------------------------------------------------------------------------------
   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   try

      if CalcEmptmo.CancelaQuitacao(dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat,
                                    dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime,
                                    edtDataCanc.Date,
                                    -1,
                                    True
                                   ) = 0 then
      begin
         // -----------------------------------------------------------------------------------------------------------------
         LimpaRegistroLog(rLogTotalPrev);

         rLogTotalPrev.IDModulo   := 15;
         rLogTotalPrev.IDContrato := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         rLogTotalPrev.IDHistMov  := -1;
         rLogTotalPrev.Origem     := 53;
         rLogTotalPrev.Operacao   := 'Cancelamento de Quitação : ' + FormatDateTime('dd/mm/yyyy', dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime);
         rLogTotalPrev.Data       := SysDate;
         rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
         rLogTotalPrev.Versao     := Sistema.Versao;

         GravaLogTotalPrev(rLogTotalPrev);
         // -----------------------------------------------------------------------------------------------------------------

         // Só "commita" se não houver transacao anterior
         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

         // Marchetti - Pendencia 22042
         IntegraModulo.iEvento         := 3;
         IntegraModulo.iContratoEmptmo := dtmEmptmo.qryDadosContratoIDCONTRATOEMPTMO.AsFloat;
         // Fim Marchetti - Pendencia 22042

         bbtnConfirmar.Enabled := False;
         MsgDlg('Quitação cancelada.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;
         Sel(-1);

         // Marchetti - Pendencia 22042
         if Sistema.IdModulo = 19 then bbtnSairClick(Self);
         // Fim Marchetti - Pendencia 22042
      end
      else
      begin
        // Houve erro
        if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

         MsgDlg('Não foi possível cancelar a Quitação.', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
      end;

   except
      // Houve erro
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

      Raise;
      Repaint;

      MsgDlg('Não foi possível cancelar a Quitação.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmCancQuitacao.FormCreate(Sender: TObject);
begin
   inherited;

   // André Pontes - 03/06/2005 - pendência 19404
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
   // FIM André Pontes - 03/06/2005 - pendência 19404

   // Armazena o Filtro Original do MontaSelect
   sFiltroContEmp := dtmMS.MS_ContratoEmptmo.Filtro.Text;

   // Faz o MontaSelect mostrar, somente os Contratos que estao pendentes de quitação
   bRepeteConsulta                  := dtmMS.MS_ContratoEmptmo.RepeteConsulta;
   dtmMS.MS_ContratoEmptmo.Filtro.Add('CON.FLGSITUACAO IN (''K'', ''Q'')');
end;



procedure TfrmCancQuitacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   UFuncoesEmptmo.bBuscaMutuario := false;
   dtmEmptmo.qryDadosContrato.Close;

   dtmMS.MS_ContratoEmptmo.Filtro.Clear;
   dtmMS.MS_ContratoEmptmo.Filtro.Text := sFiltroContEmp;
   dtmMS.MS_ContratoEmptmo.RepeteConsulta := bRepeteConsulta;

   dtmEmptmo.qryHistoricoMov.Close;

   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404

   inherited;
end;



procedure TfrmCancQuitacao.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   grpTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 19 then
   begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      // Denise Arruda 14/07/2008 N. Sol 90359, N. Kintana 379854
      with frmExecSelecionaContrato.qryResultado do
      begin
        Sql.Clear;
        Sql.Add('SELECT CON.IDCONTRATOEMPTMO ');
        Sql.Add('      ,DECODE(CON.FLGSITUACAO, ''A'', ''ATIVO'', ''E'', ''ENCERRADO'', ''J'', ''EM COBRANÇA JURÍDICA'', ''K'', ''EM QUITAÇÃO'', ''Q'',''QUITADO'', ''R'', ''RENOVADO'',''C'',''CANCELADO'') AS FLGSITUACAO ');
        Sql.Add('      ,DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NOME, PDP.NOME) AS NOME ');
        Sql.Add('      ,DECODE(DEP.IDTITULAR, NULL, ELP.MATRICULA, DEP.IDPESSOA, ELP.MATRICULA, DEP.MATRICULA) AS MATRICULA ');
        Sql.Add('      ,TCE.TCEDESCRICAO AS TIPO_CONTRATO ');
        Sql.Add('      ,DECODE(DEP.IDTITULAR, DEP.IDPESSOA, PEP.NUMDOCUMENTO, PDP.NUMDOCUMENTO) AS CPF ');
        Sql.Add('      ,PEP.NOME AS NOME_TIT ');
        Sql.Add('      ,CON.DATACREDITO ');
        Sql.Add('      ,ELP.MATRICULA AS MATRICULA_TIT ');
        Sql.Add('      ,TEP.DESCTIPOEMPTMO AS TIPO_EP ');
        Sql.Add('      ,PEP.NUMDOCUMENTO AS CPF_TIT ');
        Sql.Add('      ,CON.DATAASSINATURA C11 ');
        Sql.Add('      ,PPA.NOME AS NOME_PATRO ');
        Sql.Add('      ,PLP.NOME AS NOME_PLANO ');
        Sql.Add('      ,DECODE( INS.FLGINTERNET, 1, ''Sim'', ''Não'' ) as FLGINTERNET ');
        Sql.Add('      ,CON.IDCONTRATOEMPTMO ');
        Sql.Add('      ,CON.IDTIPOCONTREMPTMO ');
        Sql.Add('      ,CON.IDPESSOA ');
        Sql.Add('      ,CON.IDBENEF ');
        Sql.Add('  FROM PESSOA          PDP ');
        Sql.Add('      ,PESSOA          PEP ');
        Sql.Add('      ,PESSOA          PPA ');
        Sql.Add('      ,DEPENTIT        DEP ');
        Sql.Add('      ,ELEGPATRO       ELP ');
        Sql.Add('      ,PARTPREVPLAN    PPP ');
        Sql.Add('      ,PLANPREV        PLP ');
        Sql.Add('      ,SITPART         SIP ');
        Sql.Add('      ,SITPLANOPREV    SPP ');
        Sql.Add('      ,CONTRATOEMPTMO  CON ');
        Sql.Add('      ,TIPOCONTREMPTMO TCE ');
        Sql.Add('      ,TIPOEMPTMO      TEP ');
        Sql.Add('      ,INSCRICAOEMPTMO INS ');
        Sql.Add(' WHERE ELP.IDPESSOA          = PEP.IDPESSOA ');
        Sql.Add('   AND ELP.IDPESSJUR         = PPA.IDPESSOA ');
        Sql.Add('   AND ELP.IDPESSJUR         = PPP.IDPESSJUR ');
        Sql.Add('   AND ELP.IDPESSOA          = PPP.IDPESSOA ');
        Sql.Add('   AND ELP.IDPESSOA          = DEP.IDTITULAR ');
        Sql.Add('   AND DEP.IDPESSOA          = PDP.IDPESSOA ');
        Sql.Add('   AND CON.IDPLANOPREV       = PLP.IDPLANOPREV ');
        Sql.Add('   AND PPP.IDSITPART         = SIP.IDSITPART ');
        Sql.Add('   AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV ');
        Sql.Add('   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO ');
        Sql.Add('   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO ');
        Sql.Add('   AND CON.IDBENEF           = PDP.IDPESSOA ');
        Sql.Add('   AND CON.IDPESSOA          = PEP.IDPESSOA ');
        Sql.Add('   AND CON.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO ');
        Sql.Add('   AND PPP.FLGDESATIVADO     = 0 ');
        Sql.Add('   AND CON.FLGSITUACAO <> ''C'' ');
        Sql.Add('   AND EXISTS ( SELECT HME.IDCONTRATOEMPTMO ');
        Sql.Add('                  FROM HISTMOVEMPTMO HME ');
        Sql.Add('                 WHERE HME.HMETIPOMOV       = 3 ');
        Sql.Add('                   AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO ) ');
        Sql.Add('   AND DEP.MATRICULA         =:PMATRICULA ');
        Sql.Add(' ORDER BY DECODE(CON.FLGSITUACAO, ''A'', ''A'', ''K'',''B'', ''E'', ''C'', ''Q'', ''D'', ''C'', ''Z'', ''Y'') ');
        Sql.Add('         ,CON.DATACREDITO DESC ');
      end;
      // Fim
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;
      if frmExecSelecionaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;
         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));
         Screen.Cursor := crDefault;
         DBEdit1.Text  := frmExecSelecionaContrato.ValoresChave[0];
         edtDataCanc.Date := dtmEmptmo.qryDadosContratoQUIDATAPREVISTA.AsDateTime;

      end;
      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042
end;



end.
