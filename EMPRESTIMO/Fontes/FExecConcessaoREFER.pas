unit FExecConcessaoREFER;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Db, DBTables, Wwquery,
   TREdit;

type
   TfrmExecConcessaoREFER = class(TfrmWizardMTEP)
      qryInscricaoLote: TwwQuery;
      Total: TLabel;
      Label15: TLabel;
      memResult: TMemo;
      Panel3: TPanel;
      memErro: TMemo;
      Panel2: TPanel;
      edtNumResult: TRealEdit;
      edtNumErro: TRealEdit;
      qryInscricao: TwwQuery;
      qryInscricaoLoteIDINSCRICAOEMPTMO: TFloatField;
      qryInscricaoLoteVALORLIQUIDO1: TFloatField;
      qryInscricaoLoteVALORLIQUIDO2: TFloatField;
      qryInscricaoLoteVALORLIQUIDO3: TFloatField;
      qryInscricaoLotePRESTACAO1: TFloatField;
      qryInscricaoLotePRESTACAO2: TFloatField;
      qryInscricaoLotePRESTACAO3: TFloatField;
      qryInscricaoLoteCQM1: TFloatField;
      qryInscricaoLoteCQM2: TFloatField;
      qryInscricaoLoteCQM3: TFloatField;
      qryInscricaoLoteIOF1: TFloatField;
      qryInscricaoLoteIOF2: TFloatField;
      qryInscricaoLoteIOF3: TFloatField;
      qryInscricaoLoteCPMF1: TFloatField;
      qryInscricaoLoteCPMF2: TFloatField;
      qryInscricaoLoteCPMF3: TFloatField;
      qryInscricaoLoteTXADM1: TFloatField;
      qryInscricaoLoteTXADM2: TFloatField;
      qryInscricaoLoteTXADM3: TFloatField;
      qryInscricaoLoteVALORBRUTO1: TFloatField;
      qryInscricaoLoteVALORBRUTO2: TFloatField;
      qryInscricaoLoteVALORBRUTO3: TFloatField;
      qryInscricaoLoteOPCAO: TFloatField;
      qryInscricaoLoteFLGPROCESSADO: TFloatField;
      qryInscricaoSemContrato: TwwQuery;
      qryInscricaoIDINSCRICAOEMPTMO: TFloatField;
      qryInscricaoIDTIPOCONTREMPTMO: TFloatField;
      qryInscricaoIDPESSOA: TFloatField;
      qryInscricaoIDPATRO: TFloatField;
      qryInscricaoIDPLANOPREV: TFloatField;
      qryInscricaoIDVERBA: TFloatField;
      qryInscricaoIDBENEF: TFloatField;
      qryInscricaoIDCBANCARIA: TFloatField;
      qryInscricaoFLGPENDENTE: TStringField;
      qryInscricaoFLGSITUACAO: TStringField;
      qryInscricaoFLGFORMAREC: TStringField;
      qryInscricaoFLGFORMAPAG: TStringField;
      qryInscricaoCODFORMAPAG: TFloatField;
      qryInscricaoPORTFORMAPAG: TFloatField;
      qryInscricaoPORTFORMAREC: TFloatField;
      qryInscricaoDATAINSC: TDateTimeField;
      qryInscricaoDATACANCINSC: TDateTimeField;
      qryInscricaoIDMOTIVOCANC: TFloatField;
      qryInscricaoVLRSOLIC: TFloatField;
      qryInscricaoNUMPARCELAS: TFloatField;
      qryInscricaoTRGDTINCLUSAO: TDateTimeField;
      qryInscricaoTRGUSERINCLUSAO: TStringField;
      qryInscricaoFLGSUSPENSAOAUTO: TFloatField;
      qryInscricaoVLRSALBASE: TFloatField;
      qryInscricaoVLRMARGEM: TFloatField;
      qryInscricaoVLRMAXPERMIT: TFloatField;
      qryInscricaoMOECODIGO: TFloatField;
      qryInscricaoDATAVALIDADE: TDateTimeField;
      qryInscricaoFLGALTSALARIO: TFloatField;
      qryInscricaoFLGALTMARGEM: TFloatField;
      qryInscricaoFLGALTVALMAX: TFloatField;
      qryInscricaoVLRPARCELAMES: TFloatField;
      qryInscricaoVLRPARCATRASO: TFloatField;
      qryInscricaoFLGINTERNET: TFloatField;
      qryInscricaoDATACREDITO: TDateTimeField;
      qryInscricaoTXJUROS: TFloatField;
      qryInscricaoIDCBANCARIADEB: TFloatField;
      qryInscricaoIDRESPONSAVEL: TFloatField;
      updInscricaoLote: TUpdateSQL;
      qryInsertContratoEmptmo: TwwQuery;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      FloatField7: TFloatField;
      FloatField8: TFloatField;
      FloatField9: TFloatField;
      FloatField10: TFloatField;
      FloatField11: TFloatField;
      FloatField12: TFloatField;
      FloatField13: TFloatField;
      FloatField14: TFloatField;
      FloatField15: TFloatField;
      FloatField16: TFloatField;
      FloatField17: TFloatField;
      FloatField18: TFloatField;
      FloatField19: TFloatField;
      FloatField20: TFloatField;
      FloatField21: TFloatField;
      FloatField22: TFloatField;
      FloatField23: TFloatField;
      DateTimeField1: TDateTimeField;
      StringField1: TStringField;
      DateTimeField2: TDateTimeField;
      FloatField24: TFloatField;
      StringField2: TStringField;
    chkElegibilidade: TCheckBox;

      procedure btnContinuarClick(Sender: TObject);


   private

      dDataFinal  : TDateTime;

      procedure InsereLinhaErro(const sErro: String);
      procedure InsereLinhaContrato(const iContrato: Extended;
                                    const sNome: String
                                   );

      function ContrataEmprestimo: Boolean;  // Private declarations


   public   // Public declarations

   end;



var
  frmExecConcessaoREFER: TfrmExecConcessaoREFER;



implementation
{$R *.DFM}
uses
   uSistema, uFuncoesEmptmo, fProgresso, uMensErro, dBaseDados, uDataBase, uDiasUteis,
   uTypesEmptmo, uCalcEmptmo;



procedure TfrmExecConcessaoREFER.InsereLinhaErro(const sErro: String);
var
   s1 : String;
begin
   s1 := CompletaInicio(IntToStr(qryInscricaoLoteIDINSCRICAOEMPTMO.AsInteger), ' ', 9);

   memErro.Lines.Add(s1 + ' ' + sErro);
end;



procedure TfrmExecConcessaoREFER.InsereLinhaContrato(const iContrato: Extended;
                                                     const sNome: String
                                                    );
var
   s1, s2, s3 : String;
begin
   s1 := CompletaInicio(IntToStr(qryInscricaoLoteIDINSCRICAOEMPTMO.AsInteger), ' ', 9);
   s2 := CompletaInicio(FormatFloat('#0', iContrato), ' ', 9);
   s3 := CompletaFim(sNome, ' ', 60);

   memResult.Lines.Add(s1 + ' ' + s2 + ' ' + s3);
end;



function TfrmExecConcessaoREFER.ContrataEmprestimo: Boolean;
var
   iAno, iMes  : Integer;
   Item        : TItemRecDep;
   Contrato    : TDadosContrato;
   fSaldoDev   : Currency;
begin
   try
      LimpaRegistroContrato(Contrato);

//      Contrato.IDContratoEmptmo := LeUltRegistro(nil, 'CONTRATOEMPTMO');
      Contrato.IDContratoEmptmo := qryInscricaoIDINSCRICAOEMPTMO.AsInteger;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      with qryInsertContratoEmptmo do
      begin
         LimpaParametros(qryInsertContratoEmptmo);
         ParamByName('PIDCONTRATOEMPTMO').AsFloat     := Contrato.IDContratoEmptmo;
         ParamByName('PMOECODIGO').AsInteger          := qryInscricaoMOECODIGO.AsInteger;
         ParamByName('PIDINSCRICAOEMPTMO').AsInteger  := qryInscricaoIDINSCRICAOEMPTMO.AsInteger;
         ParamByName('PIDTIPOCONTREMPTMO').AsInteger  := qryInscricaoIDTIPOCONTREMPTMO.AsInteger;
         ParamByName('PIDPESSOA').AsInteger           := qryInscricaoIDPESSOA.AsInteger;
         ParamByName('PIDPATRO').AsInteger            := qryInscricaoIDPATRO.AsInteger;
         ParamByName('PIDPLANOPREV').AsInteger        := qryInscricaoIDPLANOPREV.AsInteger;
         ParamByName('PIDBENEF').AsInteger            := qryInscricaoIDBENEF.AsInteger;
         ParamByName('PFLGFORMAREC').AsString         := qryInscricaoFLGFORMAREC.AsString;
         ParamByName('PFLGFORMAPAG').AsString         := qryInscricaoFLGFORMAPAG.AsString;
         ParamByName('PCODFORMAPAG').AsInteger        := qryInscricaoCODFORMAPAG.AsInteger;
         ParamByName('PPORTFORMAPAG').AsInteger       := qryInscricaoPORTFORMAPAG.AsInteger;
         ParamByName('PPORTFORMAREC').AsInteger       := qryInscricaoPORTFORMAREC.AsInteger;
         ParamByName('PDATAASSINATURA').AsDateTime    := SysDate;

         ParamByName('PIDCBANCARIA').AsInteger        := qryInscricaoIDCBANCARIA.AsInteger;
         ParamByName('PIDCBANCARIADEB').AsInteger     := qryInscricaoIDCBANCARIADEB.AsInteger;

         case qryInscricaoLoteOPCAO.AsInteger of
            1: fSaldoDev                              := qryInscricaoLoteVALORBRUTO1.AsCurrency;
            2: fSaldoDev                              := qryInscricaoLoteVALORBRUTO2.AsCurrency;
            3: fSaldoDev                              := qryInscricaoLoteVALORBRUTO3.AsCurrency;
         end;
         ParamByName('PVLRCONTRATO').AsCurrency       := fSaldoDev;

         case qryInscricaoLoteOPCAO.AsInteger of
            1: ParamByName('PVLRPARCELA').AsCurrency  := qryInscricaoLotePRESTACAO1.AsCurrency;
            2: ParamByName('PVLRPARCELA').AsCurrency  := qryInscricaoLotePRESTACAO2.AsCurrency;
            3: ParamByName('PVLRPARCELA').AsCurrency  := qryInscricaoLotePRESTACAO3.AsCurrency;
         end;

         ParamByName('PTXJUROS').AsCurrency           := qryInscricaoTXJUROS.AsCurrency;

         ParamByName('PNUMPARCELAS').AsInteger        := qryInscricaoNUMPARCELAS.AsInteger;

         ParamByName('PDATACREDITO').AsDateTime       := qryInscricaoDATACREDITO.AsDateTime;

         iAno := DiasUteis.ExtraiAno(qryInscricaoDATACREDITO.AsDateTime);
         iMes := DiasUteis.ExtraiMes(qryInscricaoDATACREDITO.AsDateTime);

         ParamByName('PDATAPRIMPARC').AsDateTime      := DiasUteis.SomaMeses(DiasUteis.UltDiaMes(iAno, iMes), 1);

         ExecSQL;
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      Item.iEvento            := 0;
      Item.FlgEnvio           := 0;
      Item.FlgBaixado         := 0;
      Item.FormaCobranca      := 'C';
      Item.RecPag             := 'P';
      Item.Origem             := 0;
      Item.Parcela            := 0;
      Item.SeqCobranca        := 1;
      Item.IDItemCentraliza   := 33;
      Item.AnoCompetencia     := iAno;
      Item.MesCompetencia     := iMes;
      Item.AnoCobranca        := iAno;
      Item.MesCobranca        := iMes;
      Item.DataPrevista       := qryInscricaoDATACREDITO.AsDateTime;
      Item.DataVencto         := qryInscricaoDATACREDITO.AsDateTime;
      Item.DataEfetiva        := 0;
      Item.DataReceb          := 0;
      Item.DataUltAtualiza    := DiasUteis.UltDiaMes(iAno, iMes);
      Item.TxJuros            := qryInscricaoTXJUROS.AsCurrency;

      Item.ValorEfetivo       := 0;
      Item.Regra              := 0;

      Item.FlgDivergPend      := -1;
      Item.FlgTipoDiverg      := -1;

      Item.ParcResta          := 12;
      Item.FlgDestacado       := 0;
      Item.FlgCentraliza      := 0;
      // -------------------------------------------------------------------------------------------


      // -------------------------------------------------------------------------------------------
      // Valor Solicitado
      Item.CodigoItem         := 1;
      Item.SaldoDevedor       := fSaldoDev;
      Item.Valor              := fSaldoDev;
      CalcEmptmo.InsertMovEmptmo(Item, Contrato);
      // -------------------------------------------------------------------------------------------
      // Valor do Seguro
      Item.CodigoItem         := 4;
      Item.SaldoDevedor       := fSaldoDev;
      case qryInscricaoLoteOPCAO.AsInteger of
         1: Item.Valor        := qryInscricaoLoteCQM1.AsCurrency;
         2: Item.Valor        := qryInscricaoLoteCQM2.AsCurrency;
         3: Item.Valor        := qryInscricaoLoteCQM3.AsCurrency;
      end;
      CalcEmptmo.InsertMovEmptmo(Item, Contrato);
      // -------------------------------------------------------------------------------------------
      // IOF
      Item.CodigoItem         := 5;
      Item.SaldoDevedor       := fSaldoDev;
      case qryInscricaoLoteOPCAO.AsInteger of
         1: Item.Valor        := qryInscricaoLoteIOF1.AsCurrency;
         2: Item.Valor        := qryInscricaoLoteIOF2.AsCurrency;
         3: Item.Valor        := qryInscricaoLoteIOF3.AsCurrency;
      end;
      CalcEmptmo.InsertMovEmptmo(Item, Contrato);
      // -------------------------------------------------------------------------------------------
      // CPMF
      Item.CodigoItem         := 3;
      Item.SaldoDevedor       := fSaldoDev;
      case qryInscricaoLoteOPCAO.AsInteger of
         1: Item.Valor        := qryInscricaoLoteCPMF1.AsCurrency;
         2: Item.Valor        := qryInscricaoLoteCPMF2.AsCurrency;
         3: Item.Valor        := qryInscricaoLoteCPMF3.AsCurrency;
      end;
      CalcEmptmo.InsertMovEmptmo(Item, Contrato);
      // -------------------------------------------------------------------------------------------
      // Tx.Adm.
      Item.CodigoItem         := 6;
      Item.SaldoDevedor       := fSaldoDev;
      case qryInscricaoLoteOPCAO.AsInteger of
         1: Item.Valor        := qryInscricaoLoteTXADM1.AsCurrency;
         2: Item.Valor        := qryInscricaoLoteTXADM2.AsCurrency;
         3: Item.Valor        := qryInscricaoLoteTXADM3.AsCurrency;
      end;
      CalcEmptmo.InsertMovEmptmo(Item, Contrato);
      // -------------------------------------------------------------------------------------------
      // Valor Líquido
      Item.FlgCentraliza      := 1;
      Item.CodigoItem         := 33;
      Item.SaldoDevedor       := fSaldoDev;
      case qryInscricaoLoteOPCAO.AsInteger of
         1: Item.Valor        := qryInscricaoLoteVALORLIQUIDO1.AsCurrency;
         2: Item.Valor        := qryInscricaoLoteVALORLIQUIDO2.AsCurrency;
         3: Item.Valor        := qryInscricaoLoteVALORLIQUIDO3.AsCurrency;
      end;
      CalcEmptmo.InsertMovEmptmo(Item, Contrato);
      // -------------------------------------------------------------------------------------------

      InsereLinhaContrato(Contrato.IDContratoEmptmo, ' ');

      Result := True;

   except
//      on E:Exception do
//      begin
         Result := False;
//         InsereLinhaErro(E.Message);
//      end;

//      Result := False;
   end;
end;



procedure TfrmExecConcessaoREFER.btnContinuarClick(Sender: TObject);
var
   iTotReg        : Integer;
   iRegAtu        : Integer;
   iTotConcessao  : Integer;
   iTotErro       : Integer;
   sMsg           : String;
   bErro          : Boolean;
begin
   memResult.Clear;
   memErro.Clear;

   iTotConcessao  := 0;
   iTotErro       := 0;

   // ----------------------------------------------------------------------------------------------
   sMsg := 'Antes de prosseguir, favor certificar-se de que não existe nehum outro processo de ' +
           'Empréstimo em andamento.' + #13 + #13 +
           'Deseja prosseguir?';

   if MsgDlg(sMsg, 'Empréstimo', mtConfirmation, [mbyes, mbNo], 0) = mrNo then
   begin
      Repaint;
      Abort;
   end;
   Repaint;
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // 1) Abre as inscrições pendentes
   MostraEspera('Selecionando Inscrições...');

   qryInscricaoLote.Open;
   if qryInscricaoLote.IsEmpty then
   begin
      EscondeEspera;

      sMsg := 'Não foram encontradas Inscrições a contratar.';
      MsgDlg(sMsg, 'Empréstimo', mtError, [mbOk], 0);

      Repaint;
      Abort;
   end;

   iTotReg := qryInscricaoLote.RecordCount;

   EscondeEspera;
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // 2) Itera pelas inscrições pendentes,
   //    encontrando a Inscrição correspondente (InscricaoEmptmo),
   //    para complementar os dados necessários à concessão
   qryInscricaoLote.First;
   iRegAtu := 0;

   frmProgresso.MostraFormProgresso('Efetuando Concessões...',
                                    True,
                                    True,
                                    True,
                                    iRegAtu,
                                    iTotReg,
                                   );

   memResult.Lines.Add('Inscricao Contrato  Nome');
   memResult.Lines.Add('--------- --------- ------------------------------------------------------------');

   memErro.Lines.Add('Inscricao Erro');
   memErro.Lines.Add('--------- ------------------------------------------------------------');
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------



   try
      while not(qryInscricaoLote.EOF) do
      begin
         // ----------------------------------------------------------------------------------------
         if frmProgresso.Cancelou then
         begin
            Repaint;
            Application.ProcessMessages;

            // Verifica se abortou processo
            if MsgDlg('Deseja realmente interromper o processo?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Repaint;

               MsgDlg('Processo interrompido pelo usuário.', 'Empréstimo', mtInformation, [mbOk], 0);
               Repaint;

               Break;
            end;
            Repaint;
         end;
         Repaint;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // 3) Procura a Inscrição correspondente
         //    a) QQ inscrição
         with qryInscricao do
         begin
            LimpaParametros(qryInscricao);
            ParamByName('PIDINSCRICAOEMPTMO').AsInteger := qryInscricaoLoteIDINSCRICAOEMPTMO.AsInteger;
            Open;
         end;

         if qryInscricao.IsEmpty then
         begin
            InsereLinhaErro('Inscrição não localizada');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;

            Application.ProcessMessages;
         end
         else
         begin
            // b) Inscricao ainda não contratada
            with qryInscricaoSemContrato do
            begin
               LimpaParametros(qryInscricaoSemContrato);
               ParamByName('PIDINSCRICAOEMPTMO').AsInteger := qryInscricaoLoteIDINSCRICAOEMPTMO.AsInteger;
               Open;
            end;

            if qryInscricaoSemContrato.IsEmpty then
            begin
               InsereLinhaErro('Inscrição já contratada');

               inc(iRegAtu);
               inc(iTotErro);
               frmProgresso.AndaFormProgresso(iRegAtu);

               qryInscricaoLote.Next;
               Continue;

               Application.ProcessMessages;
            end;
         end;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // 4) Últimas críticas pre-concessão: Inscrição
         //    a) Data de Crédito
         if (qryInscricaoDATACREDITO.IsNull) or (qryInscricaoDATACREDITO.AsDateTime < StrToDate('31/05/2003')) then
         begin
            InsereLinhaErro('Data de Crédito inválida');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    b) Conta Corrente de Crédito
         if (qryInscricaoIDCBANCARIA.IsNull) or (qryInscricaoIDCBANCARIA.AsInteger <= 0) then
         begin
            InsereLinhaErro('Conta bancária para Crédito não informada');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    c) Conta Corrente de Débito
         if (qryInscricaoIDCBANCARIADEB.IsNull) or (qryInscricaoIDCBANCARIADEB.AsInteger <= 0) then
         begin
            InsereLinhaErro('Conta bancária para Débito não informada');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    d) PortadorForma de Crédito
         if (qryInscricaoPORTFORMAPAG.IsNull) or (qryInscricaoPORTFORMAPAG.AsInteger <= 0) then
         begin
            InsereLinhaErro('Portador-Forma para Crédito não informado');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    e) PortadorForma de Débito
         if (qryInscricaoPORTFORMAREC.IsNull) or (qryInscricaoPORTFORMAREC.AsInteger <= 0) then
         begin
            InsereLinhaErro('Portador-Forma para Débito não informado');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // 5) Últimas críticas pre-concessão: InscricaoLote
         //    a) Valor Solic
         bErro := False;
         case qryInscricaoLoteOPCAO.AsInteger of
            1: if qryInscricaoLoteVALORBRUTO1.AsCurrency <= 0 then bErro := True;
            2: if qryInscricaoLoteVALORBRUTO2.AsCurrency <= 0 then bErro := True;
            3: if qryInscricaoLoteVALORBRUTO3.AsCurrency <= 0 then bErro := True;
         end;
         if bErro then
         begin
            InsereLinhaErro('Valor Solicitado inválido');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    b) Valor Prestação
         bErro := False;
         case qryInscricaoLoteOPCAO.AsInteger of
            1: if qryInscricaoLotePRESTACAO1.AsCurrency <= 0 then bErro := True;
            2: if qryInscricaoLotePRESTACAO2.AsCurrency <= 0 then bErro := True;
            3: if qryInscricaoLotePRESTACAO3.AsCurrency <= 0 then bErro := True;
         end;
         if bErro then
         begin
            InsereLinhaErro('Valor da Prestação inválido');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    c) Valor Líquido
         bErro := False;
         case qryInscricaoLoteOPCAO.AsInteger of
            1: if qryInscricaoLoteVALORLIQUIDO1.AsCurrency <= 0 then bErro := True;
            2: if qryInscricaoLoteVALORLIQUIDO2.AsCurrency <= 0 then bErro := True;
            3: if qryInscricaoLoteVALORLIQUIDO3.AsCurrency <= 0 then bErro := True;
         end;
         if bErro then
         begin
            InsereLinhaErro('Valor Líquido inválido');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    d) Valor do Seguro
         bErro := False;
         case qryInscricaoLoteOPCAO.AsInteger of
            1: if qryInscricaoLoteCQM1.AsCurrency <= 0 then bErro := True;
            2: if qryInscricaoLoteCQM2.AsCurrency <= 0 then bErro := True;
            3: if qryInscricaoLoteCQM3.AsCurrency <= 0 then bErro := True;
         end;
         if bErro then
         begin
            InsereLinhaErro('Valor do Seguro inválido');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    e) IOF
         bErro := False;
         case qryInscricaoLoteOPCAO.AsInteger of
            1: if qryInscricaoLoteIOF1.AsCurrency <= 0 then bErro := True;
            2: if qryInscricaoLoteIOF2.AsCurrency <= 0 then bErro := True;
            3: if qryInscricaoLoteIOF3.AsCurrency <= 0 then bErro := True;
         end;
         if bErro then
         begin
            InsereLinhaErro('Valor do IOF inválido');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;

         //    f) Tx.Adm.
         bErro := False;
         case qryInscricaoLoteOPCAO.AsInteger of
            1: if qryInscricaoLoteTXADM1.AsCurrency <= 0 then bErro := True;
            2: if qryInscricaoLoteTXADM2.AsCurrency <= 0 then bErro := True;
            3: if qryInscricaoLoteTXADM3.AsCurrency <= 0 then bErro := True;
         end;
         if bErro then
         begin
            InsereLinhaErro('Valor da Tx.Adm. inválido');

            inc(iRegAtu);
            inc(iTotErro);
            frmProgresso.AndaFormProgresso(iRegAtu);

            qryInscricaoLote.Next;
            Continue;
         end;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // 6) Últimas críticas pre-concessão: ELEGIBILIDADE
         if chkElegibilidade.Checked then
         begin
            if not(CalcEmptmo.VerificaElegibilidade(qryInscricaoIDPESSOA.AsInteger,   // Titular
                                                    qryInscricaoIDBENEF.AsInteger,    // Mutuário
                                                    //Pendências 23311 e 23312 - 25/09/2006 - Alberto
                                                    qryInscricaoIDPLANOPREV.AsInteger,
                                                    //Fim Pendências 23311 e 23312
                                                    19154,                            // Regra de Elegibilidade
                                                    0,                                // Meses renovação
                                                    0,                                // Parcelas pagas
                                                    dDataFinal,                       // Data final do benefício
                                                    False)) then
            begin
               InsereLinhaErro('NÃO Elegível para Empréstimo');

               inc(iRegAtu);
               inc(iTotErro);
               frmProgresso.AndaFormProgresso(iRegAtu);

               qryInscricaoLote.Next;
               Continue;
            end;
         end;

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
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

         try
            if ContrataEmprestimo then
            begin
               qryInscricaoLote.Edit;
               qryInscricaoLoteFLGPROCESSADO.Clear;
               qryInscricaoLote.Post;

               qryInscricaoLote.ApplyUpdates;

               CommitTransacao;

               qryInscricaoLote.CommitUpdates;

               inc(iTotConcessao);
            end
            else
            begin
               inc(iTotErro);
               RollBackTransacao;
            end;
         except
            InsereLinhaErro('ERRO ao tentar contratar');

            inc(iTotErro);
            RollBackTransacao;
         end;
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------



         // ----------------------------------------------------------------------------------------
         inc(iRegAtu);
         frmProgresso.AndaFormProgresso(iRegAtu);

         qryInscricaoLote.Next;
         Application.ProcessMessages;
         // ----------------------------------------------------------------------------------------
      end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   finally
      frmProgresso.EscondeFormProgresso;

      edtNumResult.Value := iTotConcessao;
      edtNumErro.Value   := iTotErro;

      qryInscricaoLote.Close;
      qryInscricao.Close;
      qryInscricaoSemContrato.Close;

      inherited;
   end;
end;



end.
