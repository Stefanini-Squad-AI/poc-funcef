{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
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
Rotina    : Várias (VerificaPreenchimento e declarações em outros lugares)
Data      : 06/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
Rotina    : AjustaFinanceiro e bbtnConfirmarClick
Data      : 20/05/2005
Autor     : André Pontes
Pendência : 17565
Descrição : Rotinas de integração financeira chamando os métodos multicamadas
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecEstornoIndividual;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, Mask,
   DBCtrls, fcLabel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, wwdblook,
   ComCtrls, MontaSelect, uFiario, dbclient, Provider,

   uCMTypes, uCmControlObject, uCmDbObject, ucmClientDataSet,

   uCtrlDocumento, uCtrlContab, uCtrlPadroes,

   uTypesEmptmo;


type
   TfrmExecEstornoIndividual = class(TfrmSairAjudaImob)
      lblTitulo: TfcLabel;
      Panel1: TPanel;
      Label15: TLabel;
      edtDataCanc: TCMDateTimePicker;
      bbtnConfirmar: TBitBtn;
      dts: TwwDataSource;
      Label29: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      Label3: TLabel;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      Label22: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label11: TLabel;
      Label10: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtJuros: TDBEdit;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtValSolic: TDBEdit;
      DBedtValorParcela: TDBEdit;
      DBedtParcelas: TDBEdit;
      DBedtDataPrimParcela: TCMDateTimePicker;
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
      DBedtTipoEmptmo: TDBEdit;
      DBEdit3: TDBEdit;
      qryConcessao: TwwQuery;
      qryConcessaoIDCONTRATOEMPTMO: TFloatField;
      qryConcessaoHMEANOCOBRANCA: TFloatField;
      qryConcessaoHMEMESCOBRANCA: TFloatField;
      qryConcessaoCODDOCUMENTO: TFloatField;
      qryConcessaoHMEFORMACOBRANCA: TStringField;
      qryConcessaoSTATUS: TStringField;
      qryConcessaoEMISBLOQ: TStringField;
      qryConcessaoFLGENVIO: TFloatField;
      qryConcessaoHMEVLRPREVISTO: TFloatField;
      qryConcessaoIDPESSOA: TFloatField;
      qryConcessaoINSCRICAO: TFloatField;
      qryConcessaoHMEVLREFETIVO: TFloatField;
      qryConcessaoIDBENEF: TFloatField;
      qryMaisDeUmContrato: TwwQuery;
      qryMaisDeUmContratoNUMEROCONTRATOS: TFloatField;
      pnlAlterador: TPanel;
      Label2: TLabel;
      DBcboAlterador: TwwDBLookupCombo;
      qryConcessaoHMEDATAPREVISTA: TDateTimeField;
      qryConcessaoIDTIPOCONTREMPTMO: TFloatField;
      qryConcessaoIDPLANOORIGEM: TFloatField;
      qryConcessaoIDPLANOPREV: TFloatField;
      qryConcessaoIDPATRO: TFloatField;
      qryConcessaoIDITEMEMPTMO: TFloatField;
      qryConcessaoIDHISTMOVEMPTMO: TFloatField;
      qryConcessaoTIPCODIGO: TStringField;
      qryConcessaoIDCBANCARIA: TFloatField;
      qryConcessaoPORTFORMAREC: TFloatField;
      qryConcessaoHMEDATAVENCTO: TDateTimeField;
      qryConcessaoCONTABAIXA: TStringField;
      qryConcessaoITEDESCRICAO: TStringField;
      qryConcessaoANOMESCOMPETENCIA: TStringField;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);

      
   private  // Private declarations

      Contab   : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      procedure Sel(i: Extended);
      function  VerificaPreenchimento: Boolean;
      function  MontaSelectEnvio(const sRecPag : String) : String;

      procedure AjustaFinanceiro(CtrlDocumento : TCtrlDocumento);
      procedure LancaAlterador(CtrlDocumento : TCtrlDocumento);

      procedure LancaFinanceiro;


   public   // Public declarations


   end;



var
  frmExecEstornoIndividual: TfrmExecEstornoIndividual;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, (* LimpaParametros *)
   UMensErro,      (* MsgDlg *)
   USistema,       (* Sistema *)
   UDatabase,      (* StartTransacao *)
   DLookEmptmo,    (* qryLookPortadorFormaR *)
   ULancContab,
   dMS,
   uIntegraEmptmo,
   uCalcEmptmo,
   uVerificaPreenchimento,
   DBaseDados,
   uIntegraBack,
   uModulo,
   dEmptmo;




function TfrmExecEstornoIndividual.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // data de cancelamento
      if length(trim(edtDataCanc.Text))= 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Estorno!', edtDataCanc);

      // Verifica o alterador
      if (pnlAlterador.Visible) and (DBcboAlterador.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o tipo de alterador!', edtDataCanc);

      // verifica a situação do contrato
      if dtmEmptmo.qryDadosContratoDESCSITCONTRATO.AsString <> 'Ativo' then
         raise EValidacao.CreateVal('Este Contrato não está "Ativo"!', bbtnConfirmar);

      // verifica se a concessão já foi efetivada
      if not(qryConcessaoHMEVLREFETIVO.isNULL) then
      begin
         if not ( (qryConcessaoHMEVLREFETIVO.asCurrency = 0) and (qryConcessaoHMEVLRPREVISTO.asCurrency = 0) ) then
            raise EValidacao.CreateVal('A Concessão já foi efetivada!', bbtnConfirmar);
      end;

      // se houve documento, verifica
      if not(qryConcessaoCODDOCUMENTO.IsNull) then
      begin
         if qryConcessaoEMISBLOQ.AsString = 'S' then
            raise EValidacao.CreateVal('O Documento de pagamento já foi emitido!', bbtnConfirmar);
      end;

   except
      on ev: EValidacao do
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



procedure TfrmExecEstornoIndividual.Sel(i: Extended);
begin
   with dtmEmptmo.qryDadosContrato do
   begin
      LimpaParametros(dtmEmptmo.qryDadosContrato);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;
end;



procedure TfrmExecEstornoIndividual.btnBuscaContratoClick(Sender: TObject);
var
   iIdContratoEmptmo : Extended;
   iIdBenef          : Integer;
begin
   inherited;
   dtmMS.MS_ContrCancConc.Executar;
   Repaint;

   if dtmMS.MS_ContrCancConc.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;

      // abre a query principal com o participante escolhido
      Sel(StrToFloat(dtmMS.MS_ContrCancConc.ValoresChave[0]));

      LimpaParametros(qryConcessao);
      qryConcessao.ParamByName('PIDCONTRATOEMPTMO').AsFloat := StrToFloat(dtmMS.MS_ContrCancConc.ValoresChave[0]);
      qryConcessao.Open;
      iIdBenef := StrToInt(dtmMS.MS_ContrCancConc.ValoresChave[2]);
      UFuncoesEmptmo.buscaUsuarioMutuario(iIdBenef);


      // por default, a data do cancelamento será a data do crédito
      edtDataCanc.Date := dtmEmptmo.qryDadosContratoDATACREDITO.AsDateTime;

      if not qryConcessao.IsEmpty then
      begin
         LimpaParametros(qryMaisDeUmContrato);
         qryMaisDeUmContrato.ParamByName('PCODDOCUMENTO').AsInteger := qryConcessaoCODDOCUMENTO.AsInteger;
         qryMaisDeUmContrato.Open;

         if qryMaisDeUmContratoNUMEROCONTRATOS.AsInteger = 1 then
         begin
            MsgDlg('Essa concessão não foi enviada em Lote para o Contas a Pagar.',
                   'Empréstimo', mtInformation, [mbOk], 0);
            Repaint;
            Exit;
         end;

         pnlAlterador.Visible := qryConcessaoSTATUS.AsString <> '2';
         if pnlAlterador.Visible then
         begin
            LimpaParametros(dtmLookEmptmo.qryLookAlterador);
            dtmLookEmptmo.qryLookAlterador.ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
            dtmLookEmptmo.qryLookAlterador.ParamByName('PACRESDECRES').AsString      := 'C';
            dtmLookEmptmo.qryLookAlterador.Open;
         end;
         
      end;

      Application.ProcessMessages;

      Screen.Cursor := crDefault;
   end;  // if MontaSelect.RetornouValor
end;



procedure TfrmExecEstornoIndividual.bbtnConfirmarClick(Sender: TObject);
var
   CtrlDocumento : TCtrlDocumento;
begin
   inherited;

   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;


   if not VerificaPreenchimento then Exit;

   try
      // André Pontes - 20/05/2005 - pendência 17565
      // -------------------------------------------------------------------------------------------
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );

      CtrlDocumento.OpenTransaction := False;
      // -------------------------------------------------------------------------------------------
      // FIM André Pontes - 20/05/2005 - pendência 17565

      // -------------------------------------------------------------------------------------------

      // Inicia uma transação - só se não ouver transação iniciada
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      // -------------------------------------------------------------------------------------------

      try
         case qryConcessaoSTATUS.AsString[1] of

            '2':
            begin
               AjustaFinanceiro(CtrlDocumento);
            end;

         else  // case qryConcessaoSTATUS.AsString[1]
            begin
               LancaAlterador(CtrlDocumento);
            end;
         end;  // case qryConcessaoSTATUS.AsString[1]

         if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      except
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
      end;

      Sel(-1);

   finally
      CtrlDocumento.Free;
   end;
end;



procedure TfrmExecEstornoIndividual.AjustaFinanceiro(CtrlDocumento : TCtrlDocumento);
var
   rParam      : TParamIntegra;
   iTipoDocRec	: Int64;
   iTipoDocPag	: Int64;
   dDataVenc   : TDateTime;
   iTipoMov    : Integer;
   iFloat      : Integer;
   sErro       : TStringList;
   sHistorico  : String;
   vMsgCnab    : Array[0..8] of String;
   iPlanilha   : Integer;
begin
   // ----------------------------------------------------------------------------------------------

   if not(dtmEmptmo.qryParamEmptmoTIPODOCPAG.IsNULL) then
   begin
      iTipoDocPag := dtmEmptmo.qryParamEmptmoTIPODOCPAG.AsInteger;
   end
   else
   begin
      iTipoDocPag := -1;
   end;

   // ----------------------------------------------------------------------------------------------

   if not(dtmEmptmo.qryParamEmptmoTIPODOCREC.IsNULL) then
   begin
      iTipoDocRec := dtmEmptmo.qryParamEmptmoTIPODOCREC.AsInteger;
   end
   else
   begin
      iTipoDocRec := -1;
   end;

   // ----------------------------------------------------------------------------------------------

   dDataVenc   := qryConcessao.FieldByName('HMEDATAVENCTO').AsDateTime;
   iTipoMov    := 0;

   // ----------------------------------------------------------------------------------------------

   if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1 then
   begin
      with dtmEmptmo.qryBancoPortForma do
      begin
         LimpaParametros(dtmEmptmo.qryBancoPortForma);
         ParamByName('PCODPORTFORMA').AsInteger := qryConcessao.FieldByName('PORTFORMAPAG').AsInteger;
         Open;

         if not(dtmEmptmo.qryBancoPortForma.IsEmpty) then
         begin
            iFloat      := dtmEmptmo.qryBancoPortFormaDFLOATPAGTO.AsInteger;
            dDataVenc   := dDataVenc - iFloat;
         end;  // if not(dtmEmptmo.qryBancoPortForma.IsEmpty)
      end;  // with dtmEmptmo.qryBancoPortForma
   end;  // if dtmEmptmo.qryParamEmptmoFLGUSAFLOATCONC.AsInteger = 1

   // ----------------------------------------------------------------------------------------------

   IntegraEmptmo.BuscaParamIntegra('C',
                                   rParam,
                                   qryConcessao,
                                   ttFinanceiros
                                  );

   // ----------------------------------------------------------------------------------------------

   with qryConcessao do
   begin
      rParam.iContrato           := FieldByName('IDCONTRATOEMPTMO').AsFloat;
      rParam.iPessoa             := FieldByName('IDBENEF').AsInteger;
      rParam.sRecPag             := 'R';
      rParam.sCCBaixa            := FieldByName('CONTABAIXA').AsString;
      rParam.sDescricao          := FieldByName('ITEDESCRICAO').AsString;
      rParam.sAnoMesCompetencia  := FieldByName('ANOMESCOMPETENCIA').AsString;

      rParam.iParcela            := 0;

      rParam.IDCBancaria         := FieldByName('IDCBANCARIA').AsInteger;

      rParam.iCodPortForma       := FieldByName('PORTFORMAREC').AsInteger;
      rParam.bEmisBloq           := True;
      rParam.iCodForma           := -1;
      rParam.sDebCre             := 'D';
      rParam.iTipoDoc            := iTipoDocRec;
      rParam.iMoeda              := Modulo.iMoedaCorrente;
      rParam.dDataLanc           := SysDate;
      rParam.dDataVenc           := dDataVenc;
   end;

   vMsgCnab[0] := rParam.sDescricao + ' [ ' + rParam.sAnoMesCompetencia + ' ] = ' + FormatFloat('#0.00', rParam.fVlrLanc);

   // André Pontes - 20/05/2005 - pendência 17565
   // ----------------------------------------------------------------------------------------------

   if not(IntegraEmptmo.InsereDocumento(rParam, sErro, CtrlDocumento, sHistorico, False)) then Exit;

   if not(IntegraEmptmo.LancaRateio(Modulo.sCentroCusto, Modulo.iPrograma, CtrlDocumento, rParam, sErro)) then Exit;

   if not(IntegraEmptmo.SetMensagem(rParam.iDocumento, vMsgCnab, CtrlDocumento, sErro)) then Exit;

   if not(IntegraEmptmo.LancaDocumento(rParam, qryConcessaoHMEVLRPREVISTO.AsFloat, sHistorico, CtrlDocumento, iPlanilha, sErro)) then Exit;

   // ----------------------------------------------------------------------------------------------
   // FIM André Pontes - 20/05/2005 - pendência 17565
end;



procedure TfrmExecEstornoIndividual.LancaFinanceiro;
var
   sResult     : TStringList;
   sErro       : TStringList;
   iPlanilha   : Integer;
   sMensagem   : String;
begin
   sMensagem  := 'Concessoes/Pagamentos de Emprestimos - Contrato: ' + qryConcessaoIDCONTRATOEMPTMO.AsString;

   // ----------------------------------------------------------------------------------------------

   IntegraEmptmo.EnviaCAPCAR(MontaSelectEnvio('P'),
                             sMensagem,
                             qryConcessaoHMEDATAPREVISTA.AsDateTime,
                             -1,
                             Modulo.iMoedaCorrente,
                             Modulo.sCentroCusto,
                             Modulo.iPrograma,
                             iPlanilha,
                             sResult,
                             sErro
                            );

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmExecEstornoIndividual.LancaAlterador(CtrlDocumento : TCtrlDocumento);
var
   iNumLancto : Integer;
   iPlanilha  : Integer;
begin
   try
      iPlanilha  := 0;

      // -------------------------------------------------------------------------------------------

      CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);

      // -------------------------------------------------------------------------------------------

      CtrlDocumento.Lanctodocum.SetValues(edtDataCanc.Date,                      // dDataLancto
                                          qryConcessaoCODDOCUMENTO.AsInteger,    // liCodDocumento
                                          0,                                     // liNumLancto
                                          qryConcessaoHMEVLRPREVISTO.AsFloat,    // rVlrLiquido
                                          0,                                     // rValorOM
                                          qryConcessaoHMEVLRPREVISTO.AsFloat,    // rValor
                                          -1,                                    // liUnidNegoc
                                          iPlanilha,           // liPlnCodigo
                                          0,                   // liNumlotemanual,
                                          Sistema.IDusuario,   // liIdusuarioinclusao,
                                          Sistema.IDEmpresa,   // liIdempresa,
                                          0,                   // liIdnflivro,
                                          0,                   // liEstorno,
                                          0,                   // liCodtipdoc,
                                          0,                                                       // liCoddocinss,
                                          dtmLookEmptmo.qryLookAlteradorCODALTERADOR.AsInteger,    // liCodalterador
                                          '4',                                                     // sOperacao,
                                          '',                     // sNumrecibo,
                                          '',                     // sNumnf,
                                          '',                     // sNumfatura,
                                          '',                     // sHistoricocompl,
                                          '',                     // sFlgtipofatura,
                                          '',                     // sFlgrecebeunf,
                                          '',                     // sFlgfatemitida,
                                          'C',                    // DebCre
                                          15,                     // liIdModulo
                                          IntegraBack.Plano,      // liPlanoConta
                                          True                    // bUsaPlanoPatro
                                         );

      // -------------------------------------------------------------------------------------------

      if not(CtrlDocumento.Insert) then
      begin
         Exception.Create(CtrlDocumento.MessageInfo);
      end;

      // -------------------------------------------------------------------------------------------

   except
      Raise;
      Repaint;

      MsgDlg('Ocorreu um ERRO ao tentar lançar o Alterador!' + #13 +
             'Operação não efetuada.', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmExecEstornoIndividual.MontaSelectEnvio(const sRecPag : String) : String;
var
   sSQL : String;
begin
   Result :=
   'SELECT '                                                                                 + #13 +
   '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
   '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
   '  ABS(NVL(HME.HMEVLRPREVISTO, 0)) AS HMEVLRPREVISTO, '                                   + #13 +
   '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
   '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +
   '  HME.HMETIPOMOV, '                                                                      + #13 +

   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
   '  || ''/'' || '                                                                          + #13 +
   '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

   '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '  DECODE(HME.IDPLANOPREVCONTAB, NULL, CON.IDPLANOPREV, HME.IDPLANOPREVCONTAB) AS IDPLANOPREV, ' + #13 +
   '  HME.IDPLANOPREVCONTAB, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                         + #13 +

   '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIA,HME.IDCBANCARIA) AS IDCBANCARIA, '                + #13 +
   '  CON.IDCBANCARIADEB, CON.IDTIPOCONTREMPTMO, IRC.ITEDESCRICAO, CON.FLGINTERNO, '         + #13 +
   '  0 AS FLGATUALSALDOENV, -1 AS IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO '                  + #13 +

   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +

   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS               AS PRAZO, '                                           + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +

   //Pendência 23255 - 09/10/2006 - Alberto
   '     TEP.IDEMPRESAPROP,         CON.IDPATRO,  CON.IDPLANOPREV, '                         + #13 +

   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO, CON.IDCBANCARIADEB, '                                                + #13 +

   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

   '     ELP.MATRICULA                 AS MATRICULA_TIT, '                                   + #13 +

   '     CON.FLGSUSPENSAOAUTO,      CON.IDTIPOSUSPEMPTMO, '                                  + #13 +

   '     PPP.INSCRICAONUMERO, '                                                              + #13 +
   '     NVL(PPP.SALPARTICIPACAO, 0)   AS SALPARTICIPACAO, '                                 + #13 +
   '     NVL(PPP.SALMANTIDO, 0)        AS SALMANTIDO, '                                      + #13 +
   '     NVL(PPP.SALAUXDOENCA, 0)      AS SALAUXDOENCA, '                                    + #13 +

   '     SIT.IDSITPART,             SIT.FLGINTERNO, '                                        + #13 +
   '     SIT.DESCRICAO                 AS SIT_TITULAR, '                                     + #13 +
   '     DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, ''Pensionista'') AS SITDESCRICAO ' + #13 +
   '  FROM '                                                                                 + #13 +
   '     CONTRATOEMPTMO  CON, '                                                              + #13 +
   '     (SELECT * FROM PARTPREVPLAN WHERE SEQPROPOSTA = 1 AND FLGDESATIVADO = 0) PPP, '     + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     PLANPREV        PLP, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP '                                                               + #13 +
   '  WHERE '                                                                                + #13 +
   '         CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
   '  ) CON, '                                                                               + #13 +

   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      IRC '                                                                  + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( HME.HMEFORMACOBRANCA   = ''C'' ) '                                              + #13 +
   '   AND ( HME.HMERECPAG          = ''' + sRecPag + ''' ) '                                + #13 +

   '   AND ( HME.HMETIPOMOV         = 0 ) '                                                  + #13 +
   '   AND ( HME.FLGBAIXADO         = 0 ) '                                                  + #13 +
   '   AND ( HME.HMEVLREFETIVO      IS NULL ) '                                              + #13 +
   '   AND ( HME.HMEDATAEFETIVA     IS NULL ) '                                              + #13 +
   '   AND ( HME.HMEVLRPREVISTO     <> 0 ) '                                                 + #13 +

   '   AND ( HME.HMEANOCOBRANCA     = ' + FormatFloat('0000', qryConcessaoHMEANOCOBRANCA.AsInteger) + ' ) '  + #13 +
   '   AND ( HME.HMEMESCOBRANCA     = ' + IntToStr(qryConcessaoHMEMESCOBRANCA.AsInteger) + ' ) '             + #13 +

   '   AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       = 1 ) '                    + #13 +

   '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', qryConcessaoIDCONTRATOEMPTMO.AsFloat) + ' ) ' + #13 +
   '   AND ( CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +

   '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = IRC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = HME.IDITEMEMPTMO ) '                                   + #13 +

   'ORDER BY CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEDATAVENCTO'                        + #13;
end;



procedure TfrmExecEstornoIndividual.FormShow(Sender: TObject);
begin
   inherited;
   ParametrosSistema;
end;



procedure TfrmExecEstornoIndividual.FormCreate(Sender: TObject);
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
end;



procedure TfrmExecEstornoIndividual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UFuncoesEmptmo.bBuscaMutuario := false;
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   inherited;
end;



end.
