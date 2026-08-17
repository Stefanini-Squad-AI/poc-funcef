{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Alterações  : ProcessaDevolucao
Pendência   : 62639
Responsável : Edilaine
Data        : 02/02/2018
Descrição   : inserir no rateio o plano contábil do perfil de investimento do
participante e não o plano contábil do empréstimo
--------------------------------------------------------------------------------
//Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
Pendência   : SOL 253185 PPM 771995
Responsável : Wylliam Leite da Silva
Data        : 18/05/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
Pendência   : SOL 200924 KINTANA 1958353
Responsável : BRUNO AZEVEDO
Data        : 12/03/2013
Descrição   : Ajuste no campo obs ao salvar o numero de contrato.
--------------------------------------------------------------------------------
Pendência   : SOL 195538 KINTANA 1917765
Responsável : Otacilio Aquino
Data        : 25/01/2013
Descrição   : Implementado para adicionar o numero do contrato no campo obs
------------------------------------------------------------------------------
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
Rotina    : ProcessaDevolucao
Data      : 03/08/2004
Pendência :
Autor     : André Pontes
Descrição : Passagem do campo "MATRICULA"
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecDevolucaoLote;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, wwdbdatetimepicker,
  wwdblook, mListaPlano, mListaPatro, mContratoEmptmo, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc;

type
   TfrmExecDevolucaoLote = class(TfrmWizardMTEP)
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      Label1: TLabel;
      Label2: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      Panel2: TPanel;
      edtDataIni: TwwDBDateTimePicker;
      Label5: TLabel;
      qryUpdatePag: TwwQuery;
      qryUpdateRec: TwwQuery;
      Panel3: TPanel;
      Label3: TLabel;
      edtDataVenc: TwwDBDateTimePicker;
      Panel4: TPanel;
      DBgrdHistMov: TwwDBGrid;
      molContratoEmptmo: TmolContratoEmptmo;
      chkDiverg: TCheckBox;
      Label4: TLabel;
      DBcboSitPart: TwwDBLookupCombo;
      updHistMovVirtual: TUpdateSQL;
      qryHistMovVirtual: TwwQuery;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtualFLGESCOLHA: TFloatField;
      qryHistMovVirtualIDHISTMOVEMPTMO: TFloatField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      qryHistMovVirtualHMEFORMACOBRANCA: TStringField;
      qryHistMovVirtualIDITEMCENTRALIZA: TFloatField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMERECPAG: TStringField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEDATAVENCTO: TDateTimeField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualHMENUMPARCELAS: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualANOMESCOMPETENCIA: TStringField;
      qryHistMovVirtualCONTABAIXA: TStringField;
      qryHistMovVirtualTIPCODIGO: TStringField;
      qryHistMovVirtualITCTRATASALDODEV: TFloatField;
      qryHistMovVirtualIDPLANOPREV: TFloatField;
      qryHistMovVirtualIDPATRO: TFloatField;
      qryHistMovVirtualIDBENEF: TFloatField;
      qryHistMovVirtualIDPESSOA: TFloatField;
      qryHistMovVirtualCODFORMAPAG: TFloatField;
      qryHistMovVirtualPORTFORMAPAG: TFloatField;
      qryHistMovVirtualPORTFORMAREC: TFloatField;
      qryHistMovVirtualIDCBANCARIA: TFloatField;
      qryHistMovVirtualIDTIPOCONTREMPTMO: TFloatField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualFLGINTERNO: TStringField;
      chkTodos: TCheckBox;
      qryUpdateDevolucao: TwwQuery;
      qryHistMovVirtualNOME: TStringField;
      edtQuantidade: TEdit;
      Label6: TLabel;
    gbFormaRecDif: TGroupBox;
    DBcboFormaRecebimento: TwwDBLookupCombo;
    btnAtribuiParametro: TSpeedButton;

      procedure btnContinuarClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure btnAtribuiParametroClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);

   private // Private declarations

      bAtualizouRecPag : Boolean;

      procedure AbreQueries;

      function  AtualizaRecPag(var sMsgErro: String): Boolean;

      function  AbreItensADevolver: boolean;
      procedure ProcessaDevolucao;


   public // Public declarations

   end;



var
  frmExecDevolucaoLote: TfrmExecDevolucaoLote;



implementation
{$R *.DFM}
uses
   dLookEmptmo, dEmptmo, uMensErro, uIntegraEmptmo, uSistema, UFuncoesEmptmo, uDataBase,
   dBaseDados, uDiasUteis, uModulo;




procedure TfrmExecDevolucaoLote.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   LimpaParametros(dtmLookEmptmo.qryLookSitPart);
   dtmLookEmptmo.qryLookSitPart.Open;
   
   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;

   with dtmLookEmptmo.qryLookPortadorFormaP do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookPortadorFormaP);
      ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      Open;
   end;
end;



function TfrmExecDevolucaoLote.AtualizaRecPag(var sMsgErro: String): Boolean;
var
   i           : Integer;
   qryAux      : TwwQuery;
   sSQL        : String;
   sRubrica    : String;
   sCondicao   : String;
begin
   Result := True;

   MostraEspera('Atualizando Forma de Envio (recebimentos e devoluções)...');

   try
      try
         // A Receber
         with qryUpdateRec do
         begin
            LimpaParametros(qryUpdateRec);
            if molContratoEmptmo.IDContrato > 0 then ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;
            ExecSQL;
         end;

         // A Pagar
         with qryUpdatePag do
         begin
            LimpaParametros(qryUpdatePag);
            if molContratoEmptmo.IDContrato > 0 then ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;
            ExecSQL;
         end;

      except
         on E:Exception do
         begin
            sMsgErro := E.Message;
            ShowMessage(sMsgErro);
            Result := False;
            Exit;
         end;
      end;

   finally
      EscondeEspera;
   end;
end;





function TfrmExecDevolucaoLote.AbreItensADevolver: boolean;
var
   sSQL     : String;
   sMsgErro : String;
begin
   Result := True;

   try
      try
         if not(bAtualizouRecPag) then
         begin
            // -------------------------------------------------------------------------------------------
            //    Atualização do RecPag
            // -------------------------------------------------------------------------------------------
            if not(AtualizaRecPag(sMsgErro)) then
            begin
               MsgDlg('Erro ' + #13 +  sMsgErro, 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;
         end;


         MostraEspera('Selecionando Itens a Devolver...');


         sSQL :=
         'SELECT '                                                                                 + #13 +
         '  0 AS FLGESCOLHA, '                                                                     + #13 +
         '  CON.NOME, '                                                                            + #13 +
         '  HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, '                         + #13 +
         '  HME.HMEFORMACOBRANCA, HME.IDITEMCENTRALIZA, '                                          + #13 +
         '  NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO, '                                        + #13 +
         '  HME.HMERECPAG, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO, '                               + #13 +
         '  HME.HMEPARCELA, HME.HMENUMPARCELAS, HME.HMESALDODEV, '                                 + #13 +

         '  (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, ''00'')))) '                               + #13 +
         '  || ''/'' || '                                                                          + #13 +
         '  (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, ''0000'')))) AS ANOMESCOMPETENCIA, '       + #13 +

         '  ITC.CONTABAIXA, ITC.TIPCODIGO, ITC.ITCTRATASALDODEV, '                                 + #13 +
         '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, '                             + #13 +
         '  CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIA,HME.IDCBANCARIA) AS IDCBANCARIA, ' + #13 +
         '  CON.IDTIPOCONTREMPTMO, ITE.ITEDESCRICAO, CON.FLGINTERNO '                              + #13 +

         'FROM '                                                                                   + #13 +
         '  HISTMOVEMPTMO   HME, '                                                                 + #13 +

         '  ( '                                                                                    + #13;

         if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
         begin
            sSQL := sSQL +
         //Wylliam Leite da Silva SOL 253185 PPM 771995 - Início
         '  SELECT '                                                                   + #13;
         //Wylliam Leite da Silva SOL 253185 PPM 771995 - Fim
         end
         else
         begin
            sSQL := sSQL +
         '  SELECT '                                                                               + #13;
         end;

            sSQL := sSQL +
         '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
         '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
         '     CON.NUMPARCELAS               AS PRAZO, '                                           + #13 +
         '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +

         '     TEP.IDEMPRESAPROP,         CON.IDPATRO,                  CON.IDPLANOPREV, '         + #13 +
         '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
         '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
         '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
         '     CON.MOECODIGO,             PES.NOME, '                                              + #13 +

         '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

         '     ELP.MATRICULA, ELP.MATRICULA AS MATRICULA_TIT, '                                    + #13 +

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
         '     PARTPREVPLAN    PPP, '                                                              + #13 +
         '     ELEGPATRO       ELP, '                                                              + #13 +
         '     PATRO           PTR, '                                                              + #13 +
         '     PLANPREV        PLP, '                                                              + #13 +
         '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
         '     TIPOEMPTMO      TEP, '                                                              + #13 +
         '     PESSOA          PES, '                                                              + #13 +
         '     SITPART         SIT, '                                                              + #13 +
         '     SITPLANOPREV    SPP '                                                               + #13 +
         '  WHERE '                                                                                + #13 +
         '         TEP.IDEMPRESAPROP     = ' + IntToStr(Sistema.IDEmpresa)                         + #13 +
         '     AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                    + #13 +
         '     AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                    + #13;

         if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
         '     AND CON.IDCONTRATOEMPTMO  = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)     + #13;

         if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
         '     AND TCE.IDTIPOEMPTMO      = ' + DBcboTipoEmptmo.LookupValue                         + #13;

         if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
         '     AND CON.IDTIPOCONTREMPTMO = ' + DBcboTipoContrato.LookupValue                       + #13;

         // Situação do Participante
         if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
         '     AND PPP.IDSITPART         = ' + DBcboSitPart.LookupValue                            + #13;

         sSQL := sSQL +
         '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
         '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
         '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
         '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
         '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
         '     AND PES.IDPESSOA          = CON.IDBENEF '                                           + #13 +
         '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
         '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
         '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
         '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
         '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
         '     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +
         '  ) CON, '                                                                               + #13 +

         '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
         '  ITEMEMPTMO      ITE  '                                                                 + #13 +

         'WHERE '                                                                                  + #13 +
         '       ( HME.HMERECPAG          = ''P'' ) '                                              + #13 +
         '   AND ( HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) ) '                                   + #13 +
         '   AND ( HME.FLGENVIO           = 0 ) '                                                  + #13 +
         '   AND ( HME.FLGBAIXADO         = 0 ) '                                                  + #13 +
         '   AND ( HME.HMEVLREFETIVO      IS NULL ) '                                              + #13 +
         '   AND ( HME.HMEDATAEFETIVA     IS NULL ) '                                              + #13 +
         '   AND ( HME.CODDOCUMENTO       IS NULL ) '                                              + #13 +

         '   AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       = 1 ) '                    + #13 +
         '   AND ( HME.FLGESTORNADO       IS NULL OR HME.FLGESTORNADO   = 0 ) '                    + #13 +
         '   AND ( HME.FLGABONADO         IS NULL OR HME.FLGABONADO     = 0 ) '                    + #13 +
         '   AND ( HME.FLGQUITADO         IS NULL OR HME.FLGQUITADO     = 0 ) '                    + #13 +

         '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13;

         // ----------------------------------------------------------------------------------------------

         if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
         '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '     + #13;

         if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
         '   AND ( CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

         if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
         '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

         // Situação do Participante
         if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
         '   AND ( CON.IDSITPART          = ' + DBcboSitPart.LookupValue + ' ) '                   + #13;

         if chkDiverg.Checked then sSQL := sSQL +
         '   AND ( HME.FLGDIVERGPEND      IS NULL OR HME.FLGDIVERGPEND  = 0 ) '                    + #13;

         // ----------------------------------------------------------------------------------------------

         sSQL := sSQL +
         '   AND ( CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +

         '   AND ( CON.IDPATRO            IN (' + molListaPatro.PegaPatro + ') ) '                 + #13 +
         '   AND ( CON.IDPLANOPREV        IN (' + molListaPlano.PegaPlano + ') ) '                 + #13 +

         '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
         '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
         '   AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                   + #13 +
         '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
         '   AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +

         'ORDER BY '                                                                               + #13 +
         '   CON.NOME, CON.IDCONTRATOEMPTMO, HME.HMEDATAVENCTO, HME.HMEPARCELA, HME.IDITEMEMPTMO ';

         with qryHistMovVirtual do
         begin
            SQL.Clear;
            SQL.Text := sSQL;
          //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
          //qryHistMovVirtual.SQL.SaveToFile(Sistema.TempDir + 'EP-ItensADevolver.txt');
            qryHistMovVirtual.SQL.SaveToFile(ftempregra + '\' + 'EP-ItensADevolver.txt');

            Open;

            edtQuantidade.Text := IntToStr(qryHistMovVirtual.RecordCount);
         end;

      except
         Result := False;

         Raise;
         Repaint;
      end;

   finally
      EscondeEspera;
   end;
end;



procedure TfrmExecDevolucaoLote.ProcessaDevolucao;
var
   sResult           : TStringList;
   sErro             : TStringList;
   iPlanilha         : Integer;
   sIDHistMov        : String;
   sIDContrato       : String;
   sSQL, sMensagem   : String;
begin
   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------
   //    Preparação do Envio (update da Hist)
   // ----------------------------------------------------------------------------------------------
   with qryHistMovVirtual do
   begin
      DisableControls;

      sIDHistMov  := '0';
      sIDContrato := '0';

      First;
      while not(qryHistMovVirtual.EOF) do
      begin
         if (chkTodos.Checked) or (qryHistMovVirtualFLGESCOLHA.AsInteger = 1) then
         begin
            sIDHistMov  := sIDHistMov  + ', ' + FloatToStr(qryHistMovVirtualIDHISTMOVEMPTMO.AsFloat);
            sIDContrato := sIDContrato + ', ' + FloatToStr(qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat);

            try
               with qryUpdateDevolucao do
               begin
                  LimpaParametros(qryUpdateDevolucao);
                  ParamByName('PIDHISTMOVEMPTMO').AsFloat    := qryHistMovVirtualIDHISTMOVEMPTMO.AsFloat;
                  ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat;
                  ParamByName('PHMEANOCOBRANCA').AsInteger   := DiasUteis.ExtraiAno(edtDataVenc.Date);
                  ParamByName('PHMEMESCOBRANCA').AsInteger   := DiasUteis.ExtraiMes(edtDataVenc.Date);
                  ParamByName('PHMEDATAVENCTO').AsDateTime   := edtDataVenc.Date;

                  ExecSQL;
               end;
            except
               RollbackTransacao;

               Raise;
               Repaint;

               Exit;
            end;
         end;

         qryHistMovVirtual.Next;
      end;
   end;

   CommitTransacao;

   if qryHistMovVirtual.Active and qryHistMovVirtual.UpdatesPending then qryHistMovVirtual.CancelUpdates;

   if MsgDlg('Parâmetros para Devolução atualizados. ' + #13 + #13 +
             'Deseja prosseguir com o Envio?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Exit;
   end;

   Repaint;

   // ----------------------------------------------------------------------------------------------
   //    Envio
   // ----------------------------------------------------------------------------------------------

   sSQL :=
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
   '  CON.IDPLANOPREV, CON.IDPATRO, CON.IDBENEF, CON.IDPESSOA, CON.MATRICULA, '              + #13 +
   '  CON.CODFORMAPAG, CON.PORTFORMAREC, DECODE(HME.IDCBANCARIA,NULL,CON.IDCBANCARIA,HME.IDCBANCARIA) AS IDCBANCARIA, ' + #13 +
   '  CON.IDTIPOCONTREMPTMO, ITE.ITEDESCRICAO, CON.FLGINTERNO, '                             + #13 +
   '  TSE.FLGATUALSALDOENV, TSE.IDREGRAENVIOPARC, CON.IDTIPOSUSPEMPTMO, '                    + #13 +

   //edilaine - SIG62639 - inicio
   {// André Pontes - 08/07/2004
   //Pendência 23251 - 09/10/2006 - Alberto
   '  NVL(MIG.IDPLANOCONTATU, CON.IDPLANOPREV) AS IDPLANOORIGEM, '                           + #13;
   //Fim Pendência 23251
   // FIM André Pontes - 08/07/2004
   } // comentado

   '  NVL(CASE                                                                            '+ #13 +
   '       WHEN EXISTS (SELECT 1                                                          '+ #13 +
   '                      FROM TRANSPERFILINVEST T                                        '+ #13 +
   '                     WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + DateToStr(Sysdate) + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '+ #13 +
   '                           T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) THEN            '+ #13 +
   '         (SELECT MAX(PI.IDPLANPREVCONTAB)                                             '+ #13 +
   '            FROM CM.TRANSPERFILINVEST T                                               '+ #13 +
   '                 JOIN PERFILINVEST PI ON T.IDPERFILINVESTANT = PI.IDPERFILINVEST      '+ #13 +
   '           WHERE T.MESANOCOMPET = TO_CHAR(TO_DATE(''' + DateToStr(Sysdate) + ''',''DD/MM/YYYY''),''YYYY/MM'') AND '+ #13 +
   '                 T.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO)                           '+ #13 +
   '       ELSE                                                                           '+ #13 +
   '         (SELECT MAX(PI.IDPLANPREVCONTAB)                                             '+ #13 +
   '            FROM PERFILINVXELEG PIE                                                   '+ #13 +
   '                 JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST       '+ #13 +
   '           WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                      '+ #13 +
   '                 PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                '+ #13 +
   '                 PIE.IDPESSJUR = CON.IDPATRO AND                                      '+ #13 +
   '                 PIE.DTFIM IS NULL)                                                   '+ #13 +
   '     END, -1) AS IDPLANOORIGEM,                                                       '+ #13;
   //edilaine - SIG62639 - fim

   // Marchetti - Pendencia 21225
   if DBcboFormaRecebimento.LookupValue <> '' then
        sSQL := sSQL + DBcboFormaRecebimento.LookupValue + ' AS PORTFORMAPAG '               + #13
   else sSQL := sSQL + 'CON.PORTFORMAPAG '                                                   + #13;
   // Fim Marchetti - Pendencia 21225

   sSQL := sSQL +
   'FROM '                                                                                   + #13 +
   '  HISTMOVEMPTMO   HME, '                                                                 + #13 +

   //Pendência 23251 - 09/10/2006 - Alberto
   '  VWMIGRACONTRATOEP MIG, '                                                               + #13 +
   //Fim Pendência 23251

   '  ( '                                                                                    + #13 +
   '  SELECT '                                                                               + #13 +
   '     CON.IDCONTRATOEMPTMO,      CON.IDINSCRICAOEMPTMO,        CON.IDCONTRQUITACAO, '     + #13 +
   '     CON.IDVERBA,               CON.FLGSITUACAO, '                                       + #13 +
   '     CON.NUMPARCELAS               AS PRAZO, '                                           + #13 +
   '     CON.VLRCONTRATO,           CON.VLRPARCELA,               CON.TXJUROS, '             + #13 +

   '     TEP.IDEMPRESAPROP, '                                                                + #13 +
   '     DECODE(ELP.IDPESSJURCEDIDO, NULL, CON.IDPATRO, ELP.IDPESSJURCEDIDO) AS IDPATRO, '   + #13 +
   '     CON.IDPLANOPREV, '                                                                  + #13 +
   '     CON.IDTIPOCONTREMPTMO,     TCE.TCEDESCRICAO, '                                      + #13 +
   '     TCE.IDTIPOEMPTMO,          TEP.DESCTIPOEMPTMO, '                                    + #13 +
   '     CON.IDPESSOA,              CON.IDBENEF, '                                           + #13 +
   '     CON.MOECODIGO, '                                                                    + #13 +

   // André Pontes - 08/07/2004
   '     NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM, '                         + #13 +

   '     CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.PORTFORMAREC, CON.IDCBANCARIA, '             + #13 +

   '     ELP.MATRICULA, ELP.MATRICULA AS MATRICULA_TIT, '                                    + #13 +

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
   '     PARTPREVPLAN    PPP, '                                                              + #13 +
   '     ELEGPATRO       ELP, '                                                              + #13 +
   '     PATRO           PTR, '                                                              + #13 +
   '     PLANPREV        PLP, '                                                              + #13 +
   '     TIPOCONTREMPTMO TCE, '                                                              + #13 +
   '     TIPOEMPTMO      TEP, '                                                              + #13 +
   '     SITPART         SIT, '                                                              + #13 +
   '     SITPLANOPREV    SPP '                                                               + #13 +
   '  WHERE '                                                                                + #13 +
   '         CON.IDCONTRATOEMPTMO  IN (' + sIDContrato + ') '                                + #13 +
   '     AND CON.IDPATRO           = PTR.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = ELP.IDPESSOA '                                          + #13 +
   '     AND CON.IDPESSOA          = PPP.IDPESSOA '                                          + #13 +
   '     AND PTR.IDPESSOA          = ELP.IDPESSJUR '                                         + #13 +
   '     AND PTR.IDPESSOA          = PPP.IDPESSJUR '                                         + #13 +
   '     AND CON.IDPLANOPREV       = PLP.IDPLANOPREV '                                       + #13 +
   '     AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO '                                 + #13 +
   '     AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO '                                      + #13 +
   '     AND PPP.IDSITPART         = SIT.IDSITPART '                                         + #13 +
   '     AND PPP.IDSITPLANOPREV    = SPP.IDSITPLANOPREV '                                    + #13 +
   '     AND PPP.FLGDESATIVADO     = 0 '                                                     + #13 +
   '  ) CON, '                                                                               + #13 +

   '  ITEMXTIPOCONTR  ITC, '                                                                 + #13 +
   '  ITEMEMPTMO      ITE, '                                                                 + #13 +
   '  TIPOSUSPEMPTMO  TSE  '                                                                 + #13 +

   'WHERE '                                                                                  + #13 +
   '       ( CON.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                + #13 +
   '   AND ( HME.HMEFORMACOBRANCA   = ''C'' ) '                                              + #13 +
   '   AND ( HME.HMERECPAG          = ''P'' ) '                                              + #13 +

   '   AND ( HME.IDHISTMOVEMPTMO    IN (' + sIDHistMov + ') ) '                              + #13 +
   '   AND ( HME.IDCONTRATOEMPTMO   IN (' + sIDContrato + ') ) '                             + #13 +

   '   AND ( HME.HMETIPOMOV         IN (1, 2, 3, 4, 7) ) '                                   + #13 +
   '   AND ( HME.FLGENVIO           = 0 ) '                                                  + #13 +
   '   AND ( HME.FLGBAIXADO         = 0 ) '                                                  + #13 +
   '   AND ( HME.HMEVLREFETIVO      IS NULL ) '                                              + #13 +
   '   AND ( HME.HMEDATAEFETIVA     IS NULL ) '                                              + #13 +
   '   AND ( HME.CODDOCUMENTO       IS NULL ) '                                              + #13 +

   '   AND ( HME.HMEANOCOBRANCA     = ' + FormatDateTime('yyyy', edtDataVenc.Date)  + ' ) '  + #13 +
   '   AND ( HME.HMEMESCOBRANCA     = ' + FormatDateTime('mm', edtDataVenc.Date)    + ' ) '  + #13;

   // ----------------------------------------------------------------------------------------------

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND ( CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato) + ' ) '     + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue + ' ) '                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue + ' ) '              + #13;

   // Situação do Participante
   if DBcboSitPart.LookupValue <> '' then sSQL := sSQL +
   '   AND ( CON.IDSITPART          = ' + DBcboSitPart.LookupValue + ' ) '                   + #13;

   // ----------------------------------------------------------------------------------------------

   sSQL := sSQL +
   '   AND ( HME.HMECENTRALIZA      = 1 OR HME.HMEDESTACADO       = 1 ) '                    + #13 +
   '   AND ( HME.FLGESTORNADO       IS NULL OR HME.FLGESTORNADO   = 0 ) '                    + #13 +
   '   AND ( HME.FLGABONADO         IS NULL OR HME.FLGABONADO     = 0 ) '                    + #13 +
   '   AND ( HME.FLGQUITADO         IS NULL OR HME.FLGQUITADO     = 0 ) '                    + #13 +
   '   AND ( HME.FLGSUSPENSAO       IS NULL OR HME.FLGSUSPENSAO   = 0 ) '                    + #13 +

   '   AND ( CON.FLGSITUACAO        <> ''C'' ) '                                             + #13 +

   '   AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO  ) '                              + #13 +
   '   AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '                              + #13 +
   '   AND ( ITC.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '                                   + #13 +
   '   AND ( CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+) ) '                            + #13 +

   //Pendência 23251 - 09/10/2006 - Alberto
   '   AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '                                     + #13 +
   '   AND MIG.DATAMIGRA        = (select max(DATAMIGRA) '                                   + #13 +
   '                               from   VWMIGRACONTRATOEP '                                + #13 +
   '                               where  IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO '          + #13 +
   '                               and    DATAMIGRA <= HME.HMEDATAPREVISTA) '                + #13 +
   //Fim Pendência 23251

   'ORDER BY '                                                                               + #13 +
   '   CON.IDCONTRATOEMPTMO, HME.HMEPARCELA, HME.HMEDATAVENCTO ';

   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   StartTransacao;

   // ----------------------------------------------------------------------------------------------

   sResult := TStringList.Create;
   sErro   := TStringList.Create;

   iPlanilha := 0;

   (* prepara o Histórico-padrão que será passado adiante *)
   //BRUNO AZEVEDO SOL 200924 KINTANA 1958353
   //sMensagem  := 'Devolucao de itens de Emprestimo, ref: ' + edtDataVenc.Text + ', Contrato: ' + FloatToStr(molContratoEmptmo.IDContrato) ;  // SOL 195538 KTN 1917765 Otacilio
   sMensagem  := 'Devolucao de itens de Emprestimo, ref: ' + edtDataVenc.Text;  // SOL 195538 KTN 1917765 Otacilio

   if IntegraEmptmo.EnviaCAPCAR(sSQL,
                                sMensagem,
                                Sysdate,
                                -1,
                                Modulo.iMoedaCorrente,
                                Modulo.sCentroCusto,
                                Modulo.iPrograma,
                                iPlanilha,
                                sResult,
                                sErro
                                ) <> 0 then
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         RollbackTransacao;

         Showmessage(sMensagem);

         Repaint;
         Exit;
      end;
   end
   else
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

      MsgDlg('Devolução(ões) Enviada(s)', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
   end;
end;



procedure TfrmExecDevolucaoLote.btnContinuarClick(Sender: TObject);
begin
   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;

   if AbreItensADevolver then inherited;
end;



procedure TfrmExecDevolucaoLote.bbtnConfirmarClick(Sender: TObject);
begin
   if length(trim(edtDataVenc.Text)) = 0 then
   begin
      MsgDlg('É necessário indicar a nova Data de Vencimento!', 'Empréstimo', mtWarning, [mbOK], 0);
      Repaint;

      if edtDataVenc.CanFocus then edtDataVenc.SetFocus;
      Exit;
   end;

   ProcessaDevolucao;

   qryHistMovVirtual.Close;

   inherited;
end;



procedure TfrmExecDevolucaoLote.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecDevolucaoLote.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecDevolucaoLote.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecDevolucaoLote.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecDevolucaoLote.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecDevolucaoLote.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecDevolucaoLote.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;
   
   bAtualizouRecPag := False;

   // limpa a seleção de Contrato
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
end;



procedure TfrmExecDevolucaoLote.btnVoltarClick(Sender: TObject);
begin
   qryHistMovVirtual.Close;
   inherited;
end;



procedure TfrmExecDevolucaoLote.btnAtribuiParametroClick(Sender: TObject);
begin
   inherited;
   DBcboFormaRecebimento.LookupValue := IntToStr(dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger);
end;

procedure TfrmExecDevolucaoLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    UFuncoesEmptmo.bBuscaMutuario := false;
end;

end.
