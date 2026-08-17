unit fHistoricoSuspensaoCob;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroGridCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc,
   MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn,
   StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, DBCtrls, DBCGrids, wwdbdatetimepicker, CMDateTimePicker,
   Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, UDataBase, mContratoEmptmo;

type
   TfrmHistoricoSuspensaoCob = class(TfrmCadastroGridCSImob)
      Panel1: TPanel;
      molContratoEmptmo: TmolContratoEmptmo;
      Label2: TLabel;
      dbcboSuspensao: TwwDBLookupCombo;
      rdgStatus: TDBRadioGroup;
      chkFerias: TDBCheckBox;
    DBcboMes: TwwDBComboBox;
      Label6: TLabel;
      DBspnAno: TwwDBSpinEdit;
      DBspnMeses: TwwDBSpinEdit;
      Label1: TLabel;
      Label15: TLabel;
      edtDataInicio: TCMDateTimePicker;
      edtDataFinal: TCMDateTimePicker;
      Label3: TLabel;
      edtDataLibSusp: TCMDateTimePicker;
      Label5: TLabel;
      qryContrato: TwwQuery;
      GroupBox1: TGroupBox;
      Label11: TLabel;
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      DBEdit9: TDBEdit;
      DBEdit10: TDBEdit;
      Label13: TLabel;
      Label4: TLabel;
      qryIDHISTSUSPCOBEP: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryFLGSTATUS: TStringField;
      qryFLGFERIAS: TFloatField;
      qryHSCINICIOSUSP: TDateTimeField;
      qryHSCFINALSUSP: TDateTimeField;
      qryHSCMESES: TFloatField;
      qryHSCUSUATEND: TStringField;
      qryHSCDATAATEND: TDateTimeField;
      qryHSCDATALIBER: TDateTimeField;
      qryHSCUSULIBER: TStringField;
      qryHSCDATAATU: TDateTimeField;
      qryHSCANOCOBRANCA: TFloatField;
      qryHSCMESCOBRANCA: TFloatField;
      qryTSEDESCRICAO: TStringField;
      qryIDPESSOA: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      Ms_Historico: TMontaSelect;
      qryMATRICULA: TStringField;
      qryNOME_MUTUARIO: TStringField;
      qrySTATUS: TStringField;
      qryFERIAS: TStringField;
      qryFLGINTERNO: TStringField;
      qryParcelasEmAberto: TwwQuery;
      qryParcelasEmAbertoTOTAL: TFloatField;
      qryParcelasPagas: TwwQuery;
      qryParcelasPagasTOTAL: TFloatField;
      qryUltimaSuspensaoEncerrada: TwwQuery;
      qryUltimaSuspensaoEncerradaHSCINICIOSUSP: TDateTimeField;
      qryContratoIDCONTRATOEMPTMO: TFloatField;
      qryContratoIDINSCRICAOEMPTMO: TFloatField;
      qryContratoIDCONTRQUITACAO: TFloatField;
      qryContratoIDVERBA: TFloatField;
      qryContratoFLGSITUACAO: TStringField;
      qryContratoFLGFORMAREC: TStringField;
      qryContratoPORTFORMAREC: TFloatField;
      qryContratoFLGFORMAPAG: TStringField;
      qryContratoCODFORMAPAG: TFloatField;
      qryContratoPORTFORMAPAG: TFloatField;
      qryContratoDATAASSINATURA: TDateTimeField;
      qryContratoDATACREDITO: TDateTimeField;
      qryContratoDATAPRIMPARC: TDateTimeField;
      qryContratoDATACANC: TDateTimeField;
      qryContratoDATASITUACAO: TDateTimeField;
      qryContratoPRAZO: TFloatField;
      qryContratoVLRCONTRATO: TFloatField;
      qryContratoVLRPARCELA: TFloatField;
      qryContratoTXJUROS: TFloatField;
      qryContratoVLRPARCELAMES: TFloatField;
      qryContratoVLRPARCATRASO: TFloatField;
      qryContratoVLRDEBITO: TFloatField;
      qryContratoVLRRESERVA: TFloatField;
      qryContratoVLRSALDODEV: TFloatField;
      qryContratoVLRPENDENCIA: TFloatField;
      qryContratoVLRSALBASE: TFloatField;
      qryContratoVLRMARGEM: TFloatField;
      qryContratoVLRMAXPERMIT: TFloatField;
      qryContratoDATASALDODEV: TDateTimeField;
      qryContratoDATAPENDENCIA: TDateTimeField;
      qryContratoFLGSUSPENSAOAUTO: TFloatField;
      qryContratoIDTIPOSUSPEMPTMO: TFloatField;
      qryContratoDATAINICIOSUSP: TDateTimeField;
      qryContratoDATAFIMSUSP: TDateTimeField;
      qryContratoANOSUSPENSAO: TFloatField;
      qryContratoMESSUSPENSAO: TFloatField;
      qryContratoUSUARIOLIBSUSP: TStringField;
      qryContratoDATALIBSUSP: TDateTimeField;
      qryContratoHORALIBSUSP: TStringField;
      qryContratoIDEMPRESAPROP: TFloatField;
      qryContratoIDPATRO: TFloatField;
      qryContratoIDPLANOPREV: TFloatField;
      qryContratoIDTIPOCONTREMPTMO: TFloatField;
      qryContratoTCEDESCRICAO: TStringField;
      qryContratoIDTIPOEMPTMO: TFloatField;
      qryContratoDESCTIPOEMPTMO: TStringField;
      qryContratoIDPESSOA: TFloatField;
      qryContratoIDBENEF: TFloatField;
      qryContratoIDCBANCARIA: TFloatField;
      qryContratoMOECODIGO: TFloatField;
      qryContratoMATRICULA: TStringField;
      qryContratoMATRICULA_TIT: TStringField;
      qryContratoINSCRICAONUMERO: TFloatField;
      qryContratoSALPARTICIPACAO: TFloatField;
      qryContratoSALMANTIDO: TFloatField;
      qryContratoSALAUXDOENCA: TFloatField;
      qryContratoIDREGRAMARGEM: TFloatField;
      qryContratoIDREGRARESERVA: TFloatField;
      qryContratoIDREGRAELEG: TFloatField;
      qryContratoIDREGRALIMITES: TFloatField;
      qryContratoTCEDIASVALIDINSC: TFloatField;
      qryContratoTCEDIASTOLERAINSC: TFloatField;
      qryContratoTCEMAXCONTRATO: TFloatField;
      qryContratoTCEMAXINSCR: TFloatField;
      qryContratoTCEMAXPARC: TFloatField;
      qryContratoTCEMINPARC: TFloatField;
      qryContratoTCEMINQUIT: TFloatField;
      qryContratoTCEMINRENOVA: TFloatField;
      qryContratoFLGSEGURO: TStringField;
      qryContratoIDSITPART: TFloatField;
      qryContratoFLGINTERNO: TStringField;
      qryContratoSIT_TITULAR: TStringField;
      qryContratoSITDESCRICAO: TStringField;
      qryContratoIDUSUARIO: TStringField;
      qryContratoNOME_TITULAR: TStringField;
      qryContratoCPF_TITULAR: TStringField;
      qryContratoNOME: TStringField;
      qryContratoNOME_MUTUARIO: TStringField;
      qryContratoNUMDOCUMENTO: TStringField;
      qryContratoCPF_MUTUARIO: TStringField;
      qryExistePrestacao: TwwQuery;
      qryExistePrestacaoHMEDATAPREVISTA: TDateTimeField;
      qryExistePrestacaoHMEVLRPREVISTO: TFloatField;

      procedure dbcboSuspensaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbtnProcurarClick(Sender: TObject);
      procedure dbcboSuspensaoEnter(Sender: TObject);
      procedure edtDataInicioExit(Sender: TObject);
      procedure qryAfterScroll(DataSet: TDataSet);
      procedure sbtnAlterarClick(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure DBspnMesesExit(Sender: TObject);
      procedure sbtnInserirClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure DBspnMesesEnter(Sender: TObject);


   private  // Private declarations

      dDataFimSusp   : TDateTime;

      iMesesIni      : Integer;
      iMesesFim      : Integer;

      function  VerificaPreenchimento: Boolean;
      function  ExistenciaSuspensaoAtiva : Boolean;
      procedure HabilitaControles(bDesabilita : Boolean);

      function  TestaSuspensao : Boolean;

      function  DataInicioSuspensao: TDateTime;


   public   // Public declarations

   end;



var
  frmHistoricoSuspensaoCob: TfrmHistoricoSuspensaoCob;



implementation
{$R *.DFM}
uses
   DBaseDados, USistema, DLookEmptmo, UCalcEmptmo, uMensErro, UFuncoesEmptmo,
   uDiasUteis, uVerificaPreenchimento;



function TfrmHistoricoSuspensaoCob.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      if qryIDCONTRATOEMPTMO.IsNull then
         raise EValidacao.CreateVal('É necessário indicar o Contrato!', molContratoEmptmo.btnBuscaContrato);

      if dbcboSuspensao.Text = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Suspensão!', dbcboSuspensao);

      if (qryFLGFERIAS.AsInteger = 1) and (qryHSCINICIOSUSP.IsNull) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Início da Suspensão!', edtDataInicio);

      if DBcboMes.ItemIndex >= 0 then
         if edtDataLibSusp.Text = '' then
            raise EValidacao.CreateVal('É necessário indicar a Data de Liberação!', edtDataLibSusp);

      if edtDataLibSusp.Text = '' then
         if not(TestaSuspensao) then
            raise EValidacao.CreateVal('Não é permitida a suspensão!', dbcboSuspensao);

      if dbSpnMeses.Value > dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger then
         raise EValidacao.CreateVal('O nº de meses de suspensão não pode ultrapassar ' +
                                    dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsString + '!', dbSpnMeses);

      if DiasUteis.SomaMeses(edtDataInicio.Date, trunc(dbSpnMeses.Value)) < edtDataFinal.Date then
         raise EValidacao.CreateVal('A Data Final de Suspensão não pode definir um período maior que ' +
                                    FormatFloat('#0', dbSpnMeses.Value) + ' meses!', edtDataFinal);

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



function  TfrmHistoricoSuspensaoCob.TestaSuspensao : Boolean;
var
   iNumParcAberto : Integer;
   iNumParcPagas  : Integer;
   dDataInicioAnt : TDateTime;
begin
   Result         := False;

   iNumParcAberto := 0;
   iNumParcPagas  := 0;
   dDataInicioAnt := -1;

   // ----------------------------------------------------------------------------------------------

   with qryParcelasEmAberto do
   begin
      LimpaParametros(qryParcelasEmAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := qryIDCONTRATOEMPTMO.AsInteger;
      ParamByName('PHMEDATAPREVISTA').AsDateTime := Date;
      Open;

      iNumParcAberto := qryParcelasEmAbertoTOTAL.AsInteger;

      Close;
   end;

   // ----------------------------------------------------------------------------------------------

   if qryFLGFERIAS.AsInteger = 1 then
   begin
      LimpaParametros(qryParcelasPagas);
      qryParcelasPagas.ParamByName('PIDCONTRATOEMPTMO').AsInteger := qryIDCONTRATOEMPTMO.AsInteger;
      qryParcelasPagas.Open;

      iNumParcPagas := qryParcelasPagasTOTAL.AsInteger;

      qryParcelasPagas.Close;
   end;

   // ----------------------------------------------------------------------------------------------

   with qryUltimaSuspensaoEncerrada do
   begin
      LimpaParametros(qryUltimaSuspensaoEncerrada);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := qryIDCONTRATOEMPTMO.AsInteger;
      Open;

      dDataInicioAnt := qryUltimaSuspensaoEncerradaHSCINICIOSUSP.AsDateTime;

      Close;
   end;

   // ----------------------------------------------------------------------------------------------

   dDataFimSusp := CalcEmptmo.ValidaSuspensao(dtmLookEmptmo.qryLookTipoSuspIDREGRAVALIDSUSP.AsInteger,
                                              molContratoEmptmo.IDContrato,
                                              qryContratoIDBENEF.AsInteger,
                                              qryContratoIDPATRO.AsInteger,
                                              qryContratoFLGINTERNO.AsString,
                                              StrToInt(dbcboSuspensao.LookupValue),
                                              trunc(dbSpnMeses.Value),
                                              qryHSCINICIOSUSP.AsDateTime,
                                              dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.AsDateTime,
                                              qryFLGFERIAS.AsInteger,
                                              iNumParcAberto,
                                              iNumParcPagas,
                                              dDataInicioAnt,
                                              qryHSCDATAATU.AsDateTime,
                                              qryContratoIDTIPOSUSPEMPTMO.AsInteger
                                             );

   // ----------------------------------------------------------------------------------------------

   if dDataFimSusp > Date then
   begin
      if qry.State in dsEditModes then qryHSCFINALSUSP.AsDateTime := dDataFimSusp;
      Result := True;
   end;
end;



function  TfrmHistoricoSuspensaoCob.DataInicioSuspensao: TDateTime;
begin
   with qryExistePrestacao do
   begin
      LimpaParametros(qryExistePrestacao);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := molContratoEmptmo.IDContrato;
      ParamByName('HMEDATAPREVISTA').AsDateTime := Date;

      Open;

      if not(isEmpty) then
      begin
         Result := qryExistePrestacaoHMEDATAPREVISTA.AsDateTime;
      end
      else
      begin
         Result := Date;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.dbcboSuspensaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if dbcboSuspensao.LookupValue <> '' then
   begin
      dbSpnMeses.MaxValue  := dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger;
      if dbSpnMeses.Text   = '' then dbSpnMeses.Value := dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger;

      if not(TestaSuspensao) then
      begin
         MsgDlg('Não é permitida a suspensão', 'Empréstimo', mtWarning, [mbOK], 0);
         Repaint;
         Exit;
      end
      else
      begin
         if qry.State in dsEditModes then
         begin
//             qryHSCINICIOSUSP.AsDateTime   := dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.AsDateTime;
            qryHSCFINALSUSP.AsDateTime    := dDataFimSusp;
            qryHSCMESES.AsInteger         := DiasUteis.IntervaloMeses(qryHSCINICIOSUSP.AsDateTime, qryHSCFINALSUSP.AsDateTime);
{
           if not(dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.IsNull) then
              qryHSCFINALSUSP.AsDateTime    := dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.AsDateTime
           else
           if not(dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.IsNull) then
              qryHSCFINALSUSP.AsDateTime    :=  DiasUteis.SomaMeses(dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.AsDateTime, qryHSCMESES.AsInteger);
}
            qryFLGFERIAS.AsInteger        := dtmLookEmptmo.qryLookTipoSuspFLGFERIAS.AsInteger;
            qryIDCONTRATOEMPTMO.AsFloat   := molContratoEmptmo.IDContrato;
            qryHSCUSUATEND.AsString       := Sistema.NomeUsuario;
            qryHSCDATAATEND.AsDateTime    := SysDate;
            qryFLGSTATUS.AsString         := 'A';
            qryIDPESSOA.AsInteger         := qryContratoIDPESSOA.AsInteger;
            qryIDBENEF.AsInteger          := qryContratoIDBENEF.AsInteger;
            qryIDPATRO.AsInteger          := qryContratoIDPATRO.AsInteger;
            qryFLGINTERNO.AsString        := qryContratoFLGINTERNO.AsString;
         end;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   iAno, iMes, iDia  : word;
   sMesAno           : String;
begin
   // Faz as verificaçòes necessárias

   Accept := VerificaPreenchimento;

   if not(Accept) then Exit;

   if ExistenciaSuspensaoAtiva then
   begin
      Accept := False;
      Repaint;
      Exit;
   end;

   if qry.State = dsInsert then qryIDHISTSUSPCOBEP.AsInteger  := LeUltRegistro(nil, 'HISTSUSPCOBEP');

   if qry.State = dsEdit then
   begin
      qryHSCUSULIBER.AsString          := Sistema.NomeUsuario;
      qryHSCDATAATU.AsDateTime         := SysDate;

      if edtDataLibSusp.Text <> '' then
      begin
         qryFLGSTATUS.AsString         := 'C';
         qrySTATUS.AsString            := 'Cancelada';

         DecodeDate(edtDataLibSusp.Date, iAno, iMes, iDia);

         qryHSCMESCOBRANCA.AsInteger   := iMes;
         qryHSCANOCOBRANCA.AsInteger   := iAno;
      end;
   end;

   inherited;
end;



procedure TfrmHistoricoSuspensaoCob.FormShow(Sender: TObject);
begin
  inherited;
   dtmLookEmptmo.qryLookTipoSusp.Open;
   qry.Open;
   molContratoEmptmo.edtIdContrato.Clear;
   molContratoEmptmo.edtMatricula.Clear;
   molContratoEmptmo.edtNome.Clear;
   HabilitaControles(True);
end;



procedure TfrmHistoricoSuspensaoCob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmLookEmptmo.qryLookTipoSusp.Close;
   qry.Close;
   inherited;
end;



procedure TfrmHistoricoSuspensaoCob.sbtnProcurarClick(Sender: TObject);
begin
   MontaSelect.Executar;
   Repaint;

   if MontaSelect.RetornouValor then
   begin
      LimpaParametros(qry);
      qry.ParamByName('PIDCONTRATOEMPTMO').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
      qry.Open;

      LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
      dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
      dtmLookEmptmo.qryLookTipoSusp.Open;

      sbtnAlterar.Enabled := True;
   end;

   sbtnProcurar.Down := False;
end;



procedure TfrmHistoricoSuspensaoCob.dbcboSuspensaoEnter(Sender: TObject);
begin
   inherited;

   LimpaParametros(qryContrato);
   qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := qryIDCONTRATOEMPTMO.AsFloat;
   qryContrato.Open;

   LimpaParametros(dtmLookEmptmo.qryLookTipoSusp);
   dtmLookEmptmo.qryLookTipoSusp.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryContratoIDTIPOCONTREMPTMO.AsInteger;
   dtmLookEmptmo.qryLookTipoSusp.Open;

   if qry.State = dsInsert then
      qryTSEDESCRICAO.AsString := dtmLookEmptmo.qryLookTipoSusp.FieldByName('TSEDESCRICAO').AsString;
end;



procedure TfrmHistoricoSuspensaoCob.edtDataInicioExit(Sender: TObject);
begin
   inherited;

   if not dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.IsNull then
      qryHSCFINALSUSP.AsDateTime    := dtmLookEmptmo.qryLookTipoSuspTSEFINALSUSP.AsDateTime
   else if not dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.IsNull then
      qryHSCFINALSUSP.AsDateTime    :=  DiasUteis.SomaMeses(dtmLookEmptmo.qryLookTipoSuspTSEINICIOSUSP.AsDateTime, qryHSCMESES.AsInteger);

   if (dbSpnMeses.Value > 0) and (edtDataInicio.Text <> '') then begin
      qryHSCFINALSUSP.AsDateTime := DiasUteis.SomaMeses(edtDataInicio.Date, qryHSCMESES.AsInteger);
      edtDataFinal.Date          := qryHSCFINALSUSP.AsDateTime;
   end;

end;



procedure TfrmHistoricoSuspensaoCob.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
   molContratoEmptmo.edtIdContrato.Text := qryIDCONTRATOEMPTMO.AsString;
   molContratoEmptmo.edtMatricula.Text  := qryMATRICULA.AsString;
   molContratoEmptmo.edtNome.Text       := qryNOME_MUTUARIO.AsString;
end;



function TfrmHistoricoSuspensaoCob.ExistenciaSuspensaoAtiva : Boolean;
var
   query : TwwQuery;
   sSql  : String;
begin
   Result := False;
   if qry.State = dsInsert then
   begin
      query  := TwwQuery.Create(nil);
      query.DatabaseName := 'BaseDados';
      try
         sSQL := 'SELECT COUNT(*) FROM HISTSUSPCOBEP ' + #13 +
                 'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString + #13 +
                 'AND    FLGSTATUS        = ' + QuotedStr('A') + #13;
         query.Sql.Text := sSql;
         query.Open;

         Result := (query.Fields[0].AsInteger > 0);

         if Result then begin
            MsgDlg('Existe uma suspensão ativa para este contrato.','Empréstimo',mtWarning,[mbOk],0);
            Repaint;
         end;

         query.Close;

      finally
         query.Close;
         query.Free;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.sbtnAlterarClick(Sender: TObject);
begin
   HabilitaControles(False);

   if qryFLGSTATUS.AsString = 'A' then
      inherited
   else
   begin
      MsgDlg('Status dessa suspensão não permite alteração.','Empréstimo',mtWarning,[mbOk],0);
      Repaint;

      sbtnAlterar.Down := False;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.CmeCadastroConfirma(Sender: TObject);
var
   query             : TwwQuery;
   sSql              : String;
   iAno, iMes, iDia  : Word;
   sAno, sMes        : String;
begin
   // faz as atualizacoes na tabela de contratoemptmo
   query                := TwwQuery.Create(nil);
   query.DatabaseName   := 'BaseDados';

   DecodeDate(qryHSCINICIOSUSP.AsDateTime, iAno, iMes, iDia);

   try
      if qry.State = dsInsert then
      begin
         sSQL := 'UPDATE CONTRATOEMPTMO '                                                                                 + #13 +
                 'SET IDTIPOSUSPEMPTMO    = ' + qryIDTIPOSUSPEMPTMO.AsString                                       + ', ' + #13 +
                 'DATAINICIOSUSP          = TO_DATE(' + QuotedStr(qryHSCINICIOSUSP.AsString) + ', ''DD/MM/YYYY'')' + ', ' + #13 +
                 'DATAFIMSUSP             = TO_DATE(' + QuotedStr(qryHSCFINALSUSP.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
                 'USUARIOLIBSUSP          = ' + QuotedStr(qryHSCUSULIBER.AsString)                                 + ', ' + #13 +
                 'DATALIBSUSP             = TO_DATE(' + QuotedStr(qryHSCDATALIBER.AsString)  + ', ''DD/MM/YYYY'')' + ', ' + #13 +
                 'ANOSUSPENSAO            = ' + IntToStr(iAno)                                                     + ', ' + #13 +
                 'MESSUSPENSAO            = ' + IntToStr(iMes)                                                            + #13 +
                 'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString                                              + #13;

         query.Sql.Text := sSql;
         query.ExecSql;
      end
      else
      begin
         sSQL := 'UPDATE CONTRATOEMPTMO '                                                           + #13 +
                 'SET IDTIPOSUSPEMPTMO    = NULL '                                           + ', ' + #13 +
                 'DATAINICIOSUSP          = NULL '                                           + ', ' + #13 +
                 'DATAFIMSUSP             = NULL '                                           + ', ' + #13 +
                 'USUARIOLIBSUSP          = NULL '                                           + ', ' + #13 +
                 'ANOSUSPENSAO            = NULL '                                           + ', ' + #13 +
                 'MESSUSPENSAO            = NULL '                                           + ', ' + #13 +
                 'DATALIBSUSP             = NULL '                                                  + #13 +
                 'WHERE  IDCONTRATOEMPTMO = ' + qryIDCONTRATOEMPTMO.AsString                        + #13;

         query.Sql.Text := sSql;
         query.ExecSql;
      end;

      inherited;

   finally
      query.Free;
   end;

   qry.ApplyUpdates;
   qry.Close;
   qry.Open;

   HabilitaControles(True);
end;



procedure TfrmHistoricoSuspensaoCob.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);

   LimpaParametros(qryContrato);
   qryContrato.ParamByName('PIDCONTRATOEMPTMO').AsFloat := molContratoEmptmo.IDContrato;
   qryContrato.Open;

   qryHSCINICIOSUSP.AsDateTime := DataInicioSuspensao;
end;



procedure TfrmHistoricoSuspensaoCob.DBspnMesesExit(Sender: TObject);
begin
   inherited;

   iMesesFim := trunc(DBspnMeses.Value);

   if iMesesIni <> iMesesFim then
   begin
      if dbSpnMeses.Value > dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsInteger then
      begin
         MsgDlg('Nº de meses não pode ser superior a ' + dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsString + '.',
                'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         dbSpnMeses.SetFocus;
      end
      else
      begin
         if not(TestaSuspensao) then
         begin
            MsgDlg('Nº de meses não pode ser superior a ' + dtmLookEmptmo.qryLookTipoSuspTSEMESES.AsString + '.',
                   'Empréstimo', mtWarning, [mbOk], 0);
            Repaint;
            dbSpnMeses.SetFocus;
         end;
      end;

      if (edtDataInicio.Text <> '') and (edtDataFinal.Text <> '') then
      begin
         if qry.State in dsEditModes then
         begin
            qryHSCMESES.AsInteger := DiasUteis.IntervaloMeses(qryHSCINICIOSUSP.AsDateTime, qryHSCFINALSUSP.AsDateTime);
         end
         else
         begin
            dbSpnMeses.Value      := DiasUteis.IntervaloMeses(qryHSCINICIOSUSP.AsDateTime, qryHSCFINALSUSP.AsDateTime);
         end;
      end;
   end;
end;



procedure TfrmHistoricoSuspensaoCob.HabilitaControles(bDesabilita : Boolean);
begin
   dbcboSuspensao.ReadOnly := bDesabilita;
//   dbSpnMeses.ReadOnly     := bDesabilita;
//   edtDataInicio.ReadOnly  := bDesabilita;
//   edtDataFinal.ReadOnly   := bDesabilita;
   chkFerias.ReadOnly      := bDesabilita;
   rdgStatus.ReadOnly      := bDesabilita;

   dbcboSuspensao.Enabled  := not(dbcboSuspensao.ReadOnly);
   dbSpnMeses.Enabled      := not(dbSpnMeses.ReadOnly);
//   edtDataInicio.Enabled   := not edtDataInicio.ReadOnly;
//   edtDataFinal.Enabled    := not edtDataFinal.ReadOnly;
   chkFerias.Enabled       := not(chkFerias.ReadOnly);
   rdgStatus.Enabled       := not(rdgStatus.ReadOnly);
end;



procedure TfrmHistoricoSuspensaoCob.sbtnInserirClick(Sender: TObject);
begin
   if qry.State in dsEditModes then bbtnCancelarClick(self); 

   HabilitaControles(False);
   inherited;
end;



procedure TfrmHistoricoSuspensaoCob.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   HabilitaControles(True);
end;



procedure TfrmHistoricoSuspensaoCob.CmeCadastroInsert(Sender: TObject);
begin
   inherited;

   CmeCadastro.RepetirInsert := False;

   qryHSCINICIOSUSP.AsDateTime := Date;
   molContratoEmptmobtnBuscaContratoClick(self);
end;



procedure TfrmHistoricoSuspensaoCob.DBspnMesesEnter(Sender: TObject);
begin
   inherited;

   iMesesIni := trunc(DBspnMeses.Value);
end;



end.
