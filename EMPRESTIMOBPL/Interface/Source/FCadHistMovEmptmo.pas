{-------------------------------------------------------------------------------
------------------------- HISTÓRICO DE ALTERAÇÕES ------------------------------
--------------------------------------------------------------------------------
Pendência     : SIG135534
Responsável   : Marcos Lima
Data          : 26/05/2022
Descrição     : Ajuste na observação -> CmeCadastroConfirma()
--------------------------------------------------------------------------------
Pendência     : SIG127928
Responsável   : Everson Cunha
Data          : 05/10/2022
Descrição     : Criado o campo Observação
--------------------------------------------------------------------------------
Pendência     : SOL 167451   Kintana 1469701
Responsável   : Vinicius Eduardo Nascimento Maciel
Data          : 02/03/2012
Descrição     : Criado procedimento para bloquear os cmapos para edição quando
                a Disponibilidade estiver bloqueada.
Alteração dfm : Alterada a propriedade ModalResult do botão bbtnConfirmar, de
                mrOk para mrNone.
--------------------------------------------------------------------------------
Pendência   : SOL 168993 Kintana 1495750
Responsável : Fernando Xavier
Data        : 23/11/2011
Descrição   : Erro ao tentar alterar um registro utilizando a chave mestra
--------------------------------------------------------------------------------
Pendência   : SOL 162081 Kintana 1374877
Responsável : Fernando Xavier
Data        : 13/10/2011
Descrição   : Melhorar o log gerado pela funcionalidade "Alteração de Histórico"
--------------------------------------------------------------------------------
Pendência   : SOL 162129 Kintana 1374883
Responsável : Fernando Xavier
Data        : 27/07/2011
Descrição   : incluir trava na alteração de histórico dos itens (Chave Mestra)
--------------------------------------------------------------------------------}

unit FCadHistMovEmptmo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, StdCtrls,
   CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
   IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
   TB97Ctls, TB97, ExtCtrls, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
   UDataBase, uCtrlContab, uCtrlPadroes,

   UAutorizacao,

   uTypesEmptmo, UIntegraModulo, uCMFileUtils, ComCtrls;

type
TstatusChave = (alterar,excluir,inserir,aguardar,alterarBloq);//Vinicius Maciel - SOL 167451 - KINTANA 1469701

type
   TfrmCadHistMovEmptmo = class(TfrmCadastroCSImob)
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      DBspnParcela: TwwDBSpinEdit;
      Label5: TLabel;
      DBspnSeq: TwwDBSpinEdit;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      dbsParcRest: TwwDBSpinEdit;
      Label11: TLabel;
      DBedtDtCancelamento: TCMDateTimePicker;
      DBedtDtEfetiva: TCMDateTimePicker;
      Label12: TLabel;
      Label13: TLabel;
      DBedtContrato: TwwDBEdit;
      dbeValorPrevisto: TwwDBEdit;
      dbeValorEfetivo: TwwDBEdit;
      dbeSaldoDeve: TwwDBEdit;
      qryIDHISTMOVEMPTMO: TFloatField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDITEMEMPTMO: TFloatField;
      qryHMEPARCELA: TFloatField;
      qryHMETIPOMOV: TFloatField;
      qryHMEORIGEM: TFloatField;
      qryHMEFORMACOBRANCA: TStringField;
      qryHMESEQCOBRANCA: TFloatField;
      qryHMEDATA: TDateTimeField;
      qryHMEDATAPREVISTA: TDateTimeField;
      qryHMEDATAEFETIVA: TDateTimeField;
      qryHMEDATAATUALIZA: TDateTimeField;
      qryHMEANOCOMPETENCIA: TFloatField;
      qryHMEMESCOMPETENCIA: TFloatField;
      qryHMEANOCOBRANCA: TFloatField;
      qryHMEMESCOBRANCA: TFloatField;
      qryHMEVLRPREVISTO: TFloatField;
      qryHMEVLREFETIVO: TFloatField;
      qryHMESALDODEV: TFloatField;
      qryHMENUMPARCELAS: TFloatField;
      qryFLGBAIXADO: TFloatField;
      qryHMEDATAVENCTO: TDateTimeField;
      qryHMECENTRALIZA: TFloatField;
      qryHMEDESTACADO: TFloatField;
      DBchkDivergPend: TDBCheckBox;
      Label14: TLabel;
      CMDateTimePicker1: TCMDateTimePicker;
      DBCheckBox3: TDBCheckBox;
      DBCheckBox4: TDBCheckBox;
      DBCheckBox5: TDBCheckBox;
      qryFLGDIVERGPEND: TFloatField;
      DBcboTipoDiverg: TwwDBComboBox;
      qryFLGTIPODIVERG: TFloatField;
      DBchkEnviado: TDBCheckBox;
      qryFLGENVIO: TFloatField;
      CMDateTimePicker2: TCMDateTimePicker;
      Label15: TLabel;
      Bevel1: TBevel;
      qryHMEDATAQUITABONO: TDateTimeField;
      qryFLGABONADO: TFloatField;
      qryFLGQUITADO: TFloatField;
      qryFLGBAIXAMANUAL: TFloatField;
      wwDBEdit1: TwwDBEdit;
      DBRadioGroup1: TDBRadioGroup;
      DBRadioGroup2: TDBRadioGroup;
      wwDBEdit2: TwwDBEdit;
      Label16: TLabel;
      Label17: TLabel;
      qryHMETIPOFOLHA: TStringField;
      qryCODDOCUMENTO: TFloatField;
      qryPLNCODIGO: TFloatField;
      DBedtItem: TwwDBEdit;
      DBedtEvento: TwwDBEdit;
      Label18: TLabel;
      Label19: TLabel;
      DBCheckBox1: TDBCheckBox;
      DBchkSuspensao: TDBCheckBox;
      qryFLGSUSPENSAO: TFloatField;
      Bevel2: TBevel;
      DBchkEstornado: TDBCheckBox;
      CMDateTimePicker3: TCMDateTimePicker;
      Label2: TLabel;
      qryHMEDATAESTORNO: TDateTimeField;
      qryFLGESTORNADO: TFloatField;
      wwDBEdit3: TwwDBEdit;
      wwDBEdit5: TwwDBEdit;
      wwDBEdit4: TwwDBEdit;
      wwDBEdit6: TwwDBEdit;
      DBCheckBox6: TDBCheckBox;
      qryFLGDIVERGTRAT: TFloatField;
      CMDateTimePicker4: TCMDateTimePicker;
      Label20: TLabel;
      Label21: TLabel;
      wwDBEdit7: TwwDBEdit;
      qryPLNCODIGOESTORNO: TFloatField;
      qryFLGENTRADAMANUAL: TFloatField;
      DBCheckBox7: TDBCheckBox;
      DBCheckBox8: TDBCheckBox;
      DBCheckBox9: TDBCheckBox;
      qryVERSAO: TStringField;
      Label22: TLabel;
      wwDBEdit8: TwwDBEdit;
      qryIDTMPDESC: TFloatField;
      wwDBEdit9: TwwDBEdit;
      Label23: TLabel;
      qryHMEVLRBASE: TFloatField;
      qryHMEPARCELAALT: TFloatField;
      wwDBSpinEdit1: TwwDBSpinEdit;
      Label24: TLabel;
      wwDBEdit10: TwwDBEdit;
      Label25: TLabel;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      Label26: TLabel;
      wwDBEdit11: TwwDBEdit;
      qryHMETXJUROS: TFloatField;
      DBRadioGroup3: TDBRadioGroup;
      qryHMERECPAG: TStringField;
      qryIDUSUARIOESTORNO: TFloatField;
      qryHMEDATAESTORNOALT: TDateTimeField;
    QryOld: TwwQuery;
    lblObservacao: TLabel;
    qryHMEOBSERVACAO: TMemoField;
    redtObservacao: TRichEdit;
    dbredtObservacao: TDBRichEdit;

      procedure sbtnInserirClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBchkDivergPendClick(Sender: TObject);
      procedure DBedtDtEfetivaExit(Sender: TObject);
      procedure dbeValorPrevistoExit(Sender: TObject);
      procedure dbeValorEfetivoExit(Sender: TObject);
      procedure wwDBEdit3Exit(Sender: TObject);
      procedure wwDBEdit5Exit(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);


   private  // Private declarations

      bEstornado  : Boolean;
      Contab      : TCtrlContab;
      function  VerificaPreenchimento: Boolean;
      Function  VerificaPlnCodigo(pIdContratoEmptmo: string;
                                  pHmeDataPrevista : string;
                                  pIdItemEmptmo    : string;
                                  pHmeTipomov      : string
                                  ): boolean;
      Procedure  GeraRegistroLog(pDescricao  : string ); // xavier
   public   // Public declarations

      iAcao       : Integer;
      IDContrato  : Int64;
      IDItem      : Int64;
      IDTipoEP    : Integer;
      statusChave : TstatusChave; //Vinicius Maciel - SOL 167451 - KINTANA 1469701
      procedure bloqueiaCampos;

   end;



var
   frmCadHistMovEmptmo: TfrmCadHistMovEmptmo;



implementation
{$R *.DFM}
uses
   RContrato, uSistema, uMensErro, dEmptmo, uFuncoesEmptmo, uVerificaPreenchimento, uLancContab,
   DDividaEP, dCalcEmptmo, uCalcEmptmo, DBaseDados,
   uIntegraBack, FExecSelecionaContrato;



procedure TfrmCadHistMovEmptmo.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   qryIDCONTRATOEMPTMO.AsFloat := frmRelContrato.qryIDCONTRATOEMPTMO.AsFloat;

   if DBedtEvento.CanFocus then DBedtEvento.SetFocus;
end;

Procedure TfrmCadHistMovEmptmo.GeraRegistroLog(pDescricao  : string );
var
   rLogTotalPrev : TLogTotalPrev;
begin

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := qryIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.Origem     := 15;
   rLogTotalPrev.Operacao   := pDescricao;
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

end;

Function TfrmCadHistMovEmptmo.VerificaPlnCodigo(pIdContratoEmptmo: string;
                                                pHmeDataPrevista : string;
                                                pIdItemEmptmo    : string;
                                                pHmeTipomov      : string
                                                ): boolean;
var sSql   : string;
    qryAux : TwwQuery;
begin
   result := false;
   try
      sSQL := ' SELECT DISTINCT 1 AS PlnCodigo '+
              ' FROM histmovemptmo h '+
              ' WHERE h.idcontratoemptmo    = '+pIdContratoEmptmo+
              ' AND   h.hmedataprevista     = '+quotedstr(pHmeDataPrevista)+
              ' AND   h.iditemcentraliza    = '+pIdItemEmptmo+
              ' AND   h.hmetipomov          = '+pHmeTipomov+
              ' AND   h.plncodigo IS NOT NULL '+
              ' AND   h.hmecentraliza       = 0 '+
              ' AND   h.hmedestacado        = 0 '+
              ' AND   NVL(h.flgestornado,0) = 0 ';

      (* Cria a Query Auxiliar *)
      qryAux               := TwwQuery.Create(Application);
      qryAux.DatabaseName  := 'BASEDADOS';
      qryAux.SQL.Text      := sSQL;

      qryAux.Open;

      result := (qryAux.FieldByName('PlnCodigo').asinteger = 1 );

   finally
      qryAux.Free;
   end;
end;

function TfrmCadHistMovEmptmo.VerificaPreenchimento: Boolean;
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
      // SOL 168993 Kintana 1495750
      //sDataLanc   := FormatDateTime('dd/mm/yyyy', qryHMEDATAATUALIZA.AsDateTime);
      sDataLanc   := FormatDateTime('dd/mm/yyyy', qryHMEDATAPREVISTA.AsDateTime);
      // SOL 168993 Kintana 1495750
      iEmpresa    := Sistema.idEmpresa;
      sMsgContab  := '';




      if statusChave <> alterarBloq then //Vinicius Maciel - SOL 167451 - KINTANA 1469701
      begin

      {O Sol 167451, mudou a regra da chave mestre - alteração. Em caso de disponibilidade bloqueada
      deixar carregar a tela mas apenas com o Flag e a Data de abono liberados.}

          if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
             raise EValidacao.CreateVal('Não é possível usar a Data indicada:' + #13 + '"' + sMsgContab + '"', bbtnConfirmar);

          if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
          begin
             sMsgContab := Contab.MessageInfo;
             raise EValidacao.CreateVal('Não é possível usar a Data indicada:' + #13 + '"' + sMsgContab + '"', bbtnConfirmar);
          end;

      end;
      //Vinicius Maciel - SOL 167451 - KINTANA 150688 -FIM
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

procedure TfrmCadHistMovEmptmo.FormShow(Sender: TObject);
var sSql : string;
begin
   inherited;

   bEstornado := qryFLGESTORNADO.AsInteger = 1;

   case iAcao of

      1: // Inserção
      begin
         sbtnInserirClick(Self);
         dbeValorEfetivo.Text := '';

         qryHMEFORMACOBRANCA.AsString  := 'F';
         qryHMETIPOFOLHA.AsString      := 'B';

         qryHMECENTRALIZA.AsInteger    := 1;
         qryHMEDESTACADO.AsInteger     := 0;

         qryFLGBAIXADO.AsInteger       := 0;
         qryFLGENVIO.AsInteger         := 0;

         qryFLGABONADO.Clear;
         qryFLGQUITADO.Clear;
         qryFLGESTORNADO.Clear;

         qryFLGBAIXAMANUAL.Clear;
         qryFLGENTRADAMANUAL.Clear;
         qryFLGSUSPENSAO.Clear;
         qryFLGDIVERGPEND.Clear;
         qryFLGDIVERGTRAT.Clear;
         qryFLGENTRADAMANUAL.Clear;
      end;

      2: // Alteração
      begin
         sSql := ' SELECT IDHISTMOVEMPTMO, IDCONTRATOEMPTMO, IDITEMEMPTMO,  HMEPARCELA, HMETIPOMOV,  HMEORIGEM,  HMERECPAG, HMEFORMACOBRANCA, '+
                 ' HMESEQCOBRANCA, HMEDATA, HMEDATAPREVISTA, HMEDATAEFETIVA, HMEDATAATUALIZA, HMEANOCOMPETENCIA, HMEMESCOMPETENCIA, HMEANOCOBRANCA, '+
                 ' HMEMESCOBRANCA, HMEVLRPREVISTO, HMEVLREFETIVO, HMECENTRALIZA, HMEDESTACADO, HMESALDODEV, HMENUMPARCELAS, HMEDATAVENCTO, HMEDATAQUITABONO, '+
                 ' HMEDATAESTORNO, FLGTIPODIVERG,  HMETIPOFOLHA,  CODDOCUMENTO,  PLNCODIGO,  PLNCODIGOESTORNO, IDUSUARIOESTORNO, HMEDATAESTORNOALT, '+
                 ' HMETXJUROS, VERSAO, IDTMPDESC, IDTIPOSUSPEMPTMO, HMEVLRBASE, HMEPARCELAALT, NVL(FLGENTRADAMANUAL, 0)   AS FLGENTRADAMANUAL, '+
                 ' NVL(FLGDIVERGPEND, 0)      AS FLGDIVERGPEND, NVL(FLGDIVERGTRAT, 0) AS FLGDIVERGTRAT,  NVL(FLGBAIXADO, 1) AS FLGBAIXADO, NVL(FLGENVIO, 1) '+
                 ' AS FLGENVIO, NVL(FLGABONADO, 0)  AS FLGABONADO,  NVL(FLGQUITADO, 0) AS FLGQUITADO, NVL(FLGBAIXAMANUAL, 0)     AS FLGBAIXAMANUAL, '+
                 ' NVL(FLGSUSPENSAO, 0)       AS FLGSUSPENSAO,   NVL(FLGESTORNADO, 0)       AS FLGESTORNADO FROM   HISTMOVEMPTMO WHERE IDHISTMOVEMPTMO = '+qryIDHISTMOVEMPTMO.AsString;

         QryOld.close;
         QryOld.sql.clear;
         QryOld.sql.add(sSql);
         QryOld.open;

         sbtnAlterarClick(Self);
      end;

   end;
end;



procedure TfrmCadHistMovEmptmo.CmeCadastroConfirma(Sender: TObject);
var
  sObservacao: String; //Everson Cunha - SIG127928
begin
   if iAcao = 1 then
   begin
      dtmEmptmo.qrySeqHistMov.Open;
      qryIDHISTMOVEMPTMO.AsFloat := dtmEmptmo.qrySeqHistMovSEQHISTMOVEMPTMO.AsFloat;
      dtmEmptmo.qrySeqHistMov.Close;
   end;


   if iAcao = 1 then qryHMEORIGEM.AsInteger        := 12;
   if iAcao = 1 then qryHMEFORMACOBRANCA.AsString  := 'F';
   if iAcao = 1 then qryFLGENTRADAMANUAL.AsInteger := 1;
   if iAcao = 1 then qryHMEORIGEM.AsInteger        := 12;
   if iAcao = 1 then qryVERSAO.AsString            := Sistema.Versao;

   qryHMEDATA.AsDateTime         := qryHMEDATAPREVISTA.AsDateTime;

   if DBchkEnviado.Checked then
   begin
      qryFLGENVIO.Clear;
   end
   else
   begin
      qryFLGENVIO.AsInteger := 0;
   end;

   if qryHMEFORMACOBRANCA.AsString = 'C' then
   begin
      qryHMETIPOFOLHA.Clear;
   end;

   // ----------------------------------------------------------------------------------------------

   if iAcao = 1 then
   begin
      if (qryFLGESTORNADO.AsInteger = 1) then
      begin
         qryHMEDATAESTORNOALT.AsDateTime  := Now;
         qryIDUSUARIOESTORNO.AsInteger    := Sistema.IDUsuario;
      end;
   end
   else
   begin
      if not(bEstornado) and (qryFLGESTORNADO.AsInteger = 1) then
      begin
         qryHMEDATAESTORNOALT.AsDateTime  := Now;
         qryIDUSUARIOESTORNO.AsInteger    := Sistema.IDUsuario;
      end;
   end;

   //Everson Cunha - SIG127928 - Ini
   sObservacao := 'Chave Mestra - ' + DateTimeToStr(now) + ' - ' + Sistema.NomeUsuario + ' - ' + redtObservacao.Text;

   //Marcos Lima - SIG135534 - Inicio
   //if trim(qryHMEOBSERVACAO.asString) <> '' then
   // sObservacao := #$D#$A + sObservacao;

   dbredtObservacao.Lines.Append(sObservacao);
   GeraRegistroLog(sObservacao);
   //Marcos Lima - SIG135534 - Fim
   //Everson Cunha - SIG127928 - Fim

   // ----------------------------------------------------------------------------------------------

   inherited;

   AplicaAlteracoes([qry]);

   bbtnSairClick(self);
end;



procedure TfrmCadHistMovEmptmo.DBchkDivergPendClick(Sender: TObject);
begin
   inherited;

   DBcboTipoDiverg.Enabled := DBchkDivergPend.Checked;
end;



procedure TfrmCadHistMovEmptmo.DBedtDtEfetivaExit(Sender: TObject);
begin
   inherited;


   if not(qryHMEDATAEFETIVA.IsNull) then
   begin
      qryFLGBAIXADO.AsInteger := 1;
      qryFLGENVIO.AsInteger   := 1;
   end;
end;



procedure TfrmCadHistMovEmptmo.dbeValorPrevistoExit(Sender: TObject);
begin
   inherited;

   if qryHMEVLRPREVISTO.AsInteger = 0 then
   begin
      qryFLGDIVERGPEND.AsInteger := 0;
      qryFLGTIPODIVERG.AsInteger := 2;
      qryFLGDIVERGTRAT.AsInteger := 1;
   end;
end;



procedure TfrmCadHistMovEmptmo.dbeValorEfetivoExit(Sender: TObject);
begin
   inherited;


   if qryHMEVLREFETIVO.AsCurrency <> 0 then
   begin
      qryFLGBAIXADO.AsInteger := 1;
      qryFLGENVIO.AsInteger   := 1;
   end;
end;



procedure TfrmCadHistMovEmptmo.wwDBEdit3Exit(Sender: TObject);
begin
   inherited;
   if iAcao = 1 then qryHMEMESCOBRANCA.AsInteger := qryHMEMESCOMPETENCIA.AsInteger;
end;



procedure TfrmCadHistMovEmptmo.wwDBEdit5Exit(Sender: TObject);
begin
   inherited;
   if iAcao = 1 then qryHMEANOCOBRANCA.AsInteger := qryHMEANOCOMPETENCIA.AsInteger;
end;



procedure TfrmCadHistMovEmptmo.bbtnConfirmarClick(Sender: TObject);
var
   sDescricao : string;
//   rLogTotalPrev : TLogTotalPrev;
     bEfetuaGravacao : boolean;
begin
   // ----------------------------------------------------------------------------------------------
   bEfetuaGravacao := true;
   // SOL 162129 Kintana 1374883
   if not(VerificaPreenchimento) then
   //Exit
   bEfetuaGravacao := false;

 {  if qryHMECENTRALIZA.asstring <> '1' then
   begin
      if qryPLNCODIGO.asstring <> '' then
      begin
         MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
        // Exit;
        bEfetuaGravacao := false;
      end;
   end
   else   }

   //Vinicius Maciel - SOL 167451 - KINTANA 1469701
  if ((statusChave = alterarBloq) and (CMDateTimePicker2.text<> '')) then
  // if CMDateTimePicker2.date <= now then
      if not (Contab.TestaDataBloqueadaProc(Sistema.idEmpresa, 15,FormatDateTime('dd/mm/yyyy', CMDateTimePicker2.date) )) then
      begin
          MsgDlg('A data de Abono informada não pode corresponder a períodos já bloqueados pela Contabilidade','Aviso',mtWarning, [mbOk],0);
          //Exit;
          bEfetuaGravacao := false;
      end;
  //Vinicius Maciel - SOL 167451 - KINTANA 1469701 - FIM

  //Everson Cunha - SIG127928 - Ini
  if trim(redtObservacao.text) = '' then
  begin
    MsgDlg('Preencha o campo Observação', 'Aviso', mtWarning, [mbOk], 0);
    bEfetuaGravacao := false;
  end;
  //Everson Cunha - SIG127928 - Fim

  { if VerificaPlnCodigo(qryIDCONTRATOEMPTMO.asstring,
                        qryHMEDATAPREVISTA.asstring,
                        qryIDITEMEMPTMO.Asstring,
                        qryHMETIPOMOV.asstring ) then
   begin
      if (statusChave <> alterarBloq) then
      begin
          MessageDlg('Este item não pode ser alterado, pois foi contabilizado.', mtInformation, [mbOK], 0);
         // Exit;
         bEfetuaGravacao := false;
      end;
   end;     }
   // SOL 162129 Kintana 1374883

   {LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := qryIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.Origem     := 15;
   rLogTotalPrev.Operacao   := 'Ajuste de Historico';
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);}

   if bEfetuaGravacao then
   begin
   //Vinicius Maciel - SOL 167451 - KINTANA 1469701 - FIM
   //AO passar no Ponto abaixo na inserção estava gerando erro de Field Not Found,
   //pois a QryOld só deu o open na alteração e não na inserção.
       if iAcao = 2 then
       begin
       // ----------------------------------------------------------------------------------------------
       // // SOL 162081 Kintana 1374877
           if QryOld.fieldByname('HMEPARCELA').asinteger       <> QryHMEPARCELA.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEPARCELA - Valor Anterior: '+QryOld.fieldByname('HMEPARCELA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMETIPOMOV').asinteger       <> QryHMETIPOMOV.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMETIPOMOV - Valor Anterior: '+QryOld.fieldByname('HMETIPOMOV').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('IDITEMEMPTMO').asinteger       <> QryIDITEMEMPTMO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: IDITEMEMPTMO - Valor Anterior: '+QryOld.fieldByname('IDITEMEMPTMO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEORIGEM').asinteger        <> QryHMEORIGEM.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEORIGEM - Valor Anterior: '+QryOld.fieldByname('HMEORIGEM').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEFORMACOBRANCA').Asstring <> QryHMEFORMACOBRANCA.asstring then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEFORMACOBRANCA - Valor Anterior: '+QryOld.fieldByname('HMEFORMACOBRANCA').Asstring;
              GeraRegistroLog(sDescricao);
              // se era folha e mudou para banco limpar o tipo folha
              if (QryOld.fieldByname('HMEFORMACOBRANCA').Asstring <> QryHMEFORMACOBRANCA.asstring) and (QryOld.fieldByname('HMEFORMACOBRANCA').Asstring = 'F') then
              begin
                 sDescricao := 'Chave Mestra - Campo Alterado: HMETIPOFOLHA - Valor Anterior: '+QryOld.fieldByname('HMETIPOFOLHA').Asstring;
                 GeraRegistroLog(sDescricao);
              end;
           end;
           if QryOld.fieldByname('HMESEQCOBRANCA').asinteger   <> QryHMESEQCOBRANCA.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMESEQCOBRANCA - Valor Anterior: '+QryOld.fieldByname('HMESEQCOBRANCA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATA').asdatetime          <> QryHMEDATA.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATA - Valor Anterior: '+QryOld.fieldByname('HMEDATA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAPREVISTA').asdatetime  <> QryHMEDATAPREVISTA.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAPREVISTA - Valor Anterior: '+QryOld.fieldByname('HMEDATAPREVISTA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAEFETIVA').asdatetime   <> QryHMEDATAEFETIVA.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAEFETIVA - Valor Anterior: '+QryOld.fieldByname('HMEDATAEFETIVA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAATUALIZA').asdatetime   <> QryHMEDATAATUALIZA.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAATUALIZA - Valor Anterior: '+QryOld.fieldByname('HMEDATAATUALIZA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEANOCOMPETENCIA').asinteger <> QryHMEANOCOMPETENCIA.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEANOCOMPETENCIA - Valor Anterior: '+QryOld.fieldByname('HMEANOCOMPETENCIA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEMESCOMPETENCIA').asinteger <> QryHMEMESCOMPETENCIA.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEMESCOMPETENCIA - Valor Anterior: '+QryOld.fieldByname('HMEMESCOMPETENCIA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEANOCOBRANCA').asinteger   <> QryHMEANOCOBRANCA.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEANOCOBRANCA - Valor Anterior: '+QryOld.fieldByname('HMEANOCOBRANCA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEMESCOBRANCA').asinteger   <> QryHMEMESCOBRANCA.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEMESCOBRANCA - Valor Anterior: '+QryOld.fieldByname('HMEMESCOBRANCA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEVLRPREVISTO').asinteger   <> QryHMEVLRPREVISTO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEVLRPREVISTO - Valor Anterior: '+QryOld.fieldByname('HMEVLRPREVISTO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEVLREFETIVO').asinteger    <> QryHMEVLREFETIVO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEVLREFETIVO - Valor Anterior: '+QryOld.fieldByname('HMEVLREFETIVO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMESALDODEV').asinteger      <> QryHMESALDODEV.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMESALDODEV - Valor Anterior: '+QryOld.fieldByname('HMESALDODEV').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMENUMPARCELAS').asinteger   <> QryHMENUMPARCELAS.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMENUMPARCELAS - Valor Anterior: '+QryOld.fieldByname('HMENUMPARCELAS').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGBAIXADO').asinteger       <> QryFLGBAIXADO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGBAIXADO - Valor Anterior: '+QryOld.fieldByname('FLGBAIXADO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAVENCTO').asdatetime    <> QryHMEDATAVENCTO.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAVENCTO - Valor Anterior: '+QryOld.fieldByname('HMEDATAVENCTO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMECENTRALIZA').Asinteger    <> QryHMECENTRALIZA.Asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMECENTRALIZA - Valor Anterior: '+QryOld.fieldByname('HMECENTRALIZA').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDESTACADO').Asinteger     <> QryHMEDESTACADO.Asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDESTACADO - Valor Anterior: '+QryOld.fieldByname('HMEDESTACADO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGDIVERGPEND').asinteger    <> QryFLGDIVERGPEND.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGDIVERGPEND - Valor Anterior: '+QryOld.fieldByname('FLGDIVERGPEND').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGTIPODIVERG').asinteger    <> QryFLGTIPODIVERG.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGTIPODIVERG - Valor Anterior: '+QryOld.fieldByname('FLGTIPODIVERG').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGENVIO').asinteger         <> QryFLGENVIO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGENVIO - Valor Anterior: '+QryOld.fieldByname('FLGENVIO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAQUITABONO').asdatetime <> QryHMEDATAQUITABONO.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAQUITABONO - Valor Anterior: '+QryOld.fieldByname('HMEDATAQUITABONO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGABONADO').asinteger       <> QryFLGABONADO.asinteger  then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGABONADO - Valor Anterior: '+QryOld.fieldByname('FLGABONADO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGQUITADO').asinteger       <> QryFLGQUITADO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGQUITADO - Valor Anterior: '+QryOld.fieldByname('FLGQUITADO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGBAIXAMANUAL').asinteger    <> QryFLGBAIXAMANUAL.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGBAIXAMANUAL - Valor Anterior: '+QryOld.fieldByname('FLGBAIXAMANUAL').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMETIPOFOLHA').Asstring      <> QryHMETIPOFOLHA.Asstring then
           begin
              if (QryHMETIPOFOLHA.Asstring = 'F') then
              begin
                 sDescricao := 'Chave Mestra - Campo Alterado: HMETIPOFOLHA - Valor Anterior: '+QryOld.fieldByname('HMETIPOFOLHA').Asstring;
                 GeraRegistroLog(sDescricao);
              end;
           end;
           if QryOld.fieldByname('CODDOCUMENTO').asinteger      <> QryCODDOCUMENTO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: CODDOCUMENTO - Valor Anterior: '+QryOld.fieldByname('CODDOCUMENTO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('PLNCODIGO').asinteger         <> QryPLNCODIGO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: PLNCODIGO - Valor Anterior: '+QryOld.fieldByname('PLNCODIGO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGSUSPENSAO').asinteger      <> QryFLGSUSPENSAO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGSUSPENSAO - Valor Anterior: '+QryOld.fieldByname('FLGSUSPENSAO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAESTORNO').asdatetime    <> QryHMEDATAESTORNO.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAESTORNO - Valor Anterior: '+QryOld.fieldByname('HMEDATAESTORNO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGESTORNADO').asinteger      <> QryFLGESTORNADO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGESTORNADO - Valor Anterior: '+QryOld.fieldByname('FLGESTORNADO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGDIVERGTRAT').asinteger     <> QryFLGDIVERGTRAT.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGDIVERGTRAT - Valor Anterior: '+QryOld.fieldByname('FLGDIVERGTRAT').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('PLNCODIGOESTORNO').asinteger  <> QryPLNCODIGOESTORNO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: PLNCODIGOESTORNO - Valor Anterior: '+QryOld.fieldByname('PLNCODIGOESTORNO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('FLGENTRADAMANUAL').asinteger  <> QryFLGENTRADAMANUAL.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: FLGENTRADAMANUAL - Valor Anterior: '+QryOld.fieldByname('FLGENTRADAMANUAL').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('VERSAO').Asstring            <> QryVERSAO.Asstring then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: VERSAO - Valor Anterior: '+QryOld.fieldByname('VERSAO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('IDTMPDESC').asinteger         <> QryIDTMPDESC.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: IDTMPDESC - Valor Anterior: '+QryOld.fieldByname('IDTMPDESC').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEVLRBASE').asinteger        <> QryHMEVLRBASE.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEVLRBASE - Valor Anterior: '+QryOld.fieldByname('HMEVLRBASE').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEPARCELAALT').asinteger     <> QryHMEPARCELAALT.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEPARCELAALT - Valor Anterior: '+QryOld.fieldByname('HMEPARCELAALT').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('IDTIPOSUSPEMPTMO').asinteger  <> QryIDTIPOSUSPEMPTMO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: IDTIPOSUSPEMPTMO - Valor Anterior: '+QryOld.fieldByname('IDTIPOSUSPEMPTMO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMETXJUROS').asinteger        <> QryHMETXJUROS.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMETXJUROS - Valor Anterior: '+QryOld.fieldByname('HMETXJUROS').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMERECPAG').Asstring         <> QryHMERECPAG.Asstring then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMERECPAG - Valor Anterior: '+QryOld.fieldByname('HMERECPAG').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('IDUSUARIOESTORNO').asinteger  <> QryIDUSUARIOESTORNO.asinteger then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: IDUSUARIOESTORNO - Valor Anterior: '+QryOld.fieldByname('IDUSUARIOESTORNO').Asstring;
              GeraRegistroLog(sDescricao);
           end;
           if QryOld.fieldByname('HMEDATAESTORNOALT').asdatetime <> QryHMEDATAESTORNOALT.asdatetime then
           begin
              sDescricao := 'Chave Mestra - Campo Alterado: HMEDATAESTORNOALT - Valor Anterior: '+QryOld.fieldByname('HMEDATAESTORNOALT').Asstring;
              GeraRegistroLog(sDescricao);
           end;
       end;//Vinicius Maciel - SOL 167451 - KINTANA 1469701



       // SOL 162081 Kintana 1374877
       // Abertura da query de log da Hist
       with  frmRelContrato do
       begin
          with qryLogTotalPrevHist do
          begin
             LimpaParametros(qryLogTotalPrevHist);
             ParamByName('PIDHISTMOVEMPTMO').AsFloat   := qryHistMovIDHISTMOVEMPTMO.AsFloat;
             Open;
          end;
       end;
       // SOL 162081 Kintana 1374877

       // // SOL 162081 Kintana 1374877
       statusChave := aguardar; //Vinicius Maciel - SOL 167451 - KINTANA 1469701
       inherited;
   end;
end;



procedure TfrmCadHistMovEmptmo.FormCreate(Sender: TObject);
begin
   inherited;
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );

   Contab.OpenTransaction := False;
end;

procedure TfrmCadHistMovEmptmo.bloqueiaCampos;
var
i : integer;
begin
for  i:= 0 to ComponentCount-1 do
begin;
    if(((Components[i] is TcmDateTimePicker) or (Components[i] is TwwDBEdit)
    or (Components[i] is TdbCheckBox) or (Components[i] is TdbRadioGroup)
    or(Components[i] is TwwDbComboBox) or(Components[i] is TwwDbSpinEdit))
    and not ((TControl(Components[i]).name ='CMDateTimePicker2')
    or (TControl(Components[i]).name ='DBCheckBox3')) )then
    TControl(Components[i]).enabled := false;
   // if(Components[i] is TcmDateTimePicker) then
  //  TcmDateTimePicker(Components[i]).enabled := false;
end;
end;



end.
