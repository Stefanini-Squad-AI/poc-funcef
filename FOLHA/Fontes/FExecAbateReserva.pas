unit FExecAbateReserva;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 24/10/2006
Autor     : André Pontes
Pendencia : 18949
Descrição : Implementação de chamada à rotina de atualização do valor de IR utilizado nos resgates
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnContinuarClick
Data      : 11/10/2006
Autor     : André Pontes
Pendencia : 18949
Descrição : Implementação de chamada à rotina de atualização do Prazo de Acumulação (para cálculo
            de IRRF pela tabela regressiva)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RetiraReserva
Data      : 06/09/2006 a 08/09/2006
Autor     : Claudio Faria
Pendencia : 20442
Descrição : Permitir que a reserva individual tenha valores negativos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 14/08/2006 a 17/08/2006
Autor     : André Pontes
Pendencia : 21612
Descrição : Nova tela criada
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, fcLabel, Db,
   DBTables, Wwquery, FWizardMT, fcButton, fcImgBtn, fcShapeBtn, ComCtrls,
   MontaSelect;

type
   TfrmExecAbateReserva = class(TfrmWizardMT)

      qryBeneficios: TwwQuery;
      Label8: TLabel;
      Label2: TLabel;
      edtNome: TEdit;
      edtMatricula: TEdit;
      btnBuscaPart: TBitBtn;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      Panel3: TPanel;
      memResult: TMemo;
      qryBeneficiosVALOR: TFloatField;
      qryBeneficiosIDPESSJUR: TFloatField;
      qryBeneficiosIDPLANOPREV: TFloatField;
      qryBeneficiosSEQPROPOSTA: TFloatField;
      qryBeneficiosMESREFERENCIA: TStringField;
      qryBeneficiosDTEFETPGTO: TDateTimeField;
      qryBeneficiosIDTITULAR: TFloatField;
      qryBeneficiosIDBENEFICIO: TFloatField;
      qryBeneficiosFLGALIMRESERVA: TFloatField;
      qryBeneficiosIDSEQINTERNOFB: TFloatField;
      qryBeneficiosMATRICULA: TStringField;
      Panel2: TPanel;
      memErro: TMemo;
      qryAux1: TwwQuery;
      qryAux2: TwwQuery;
      MS_Assistido: TMontaSelect;
      btnLimpaPart: TBitBtn;
      qryUpdateHstBenef: TwwQuery;

      procedure btnContinuarClick(Sender: TObject);
      procedure btnLimpaPartClick(Sender: TObject);
      procedure btnBuscaPartClick(Sender: TObject);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      IDPessoa : Integer;

      // manipulação de Strings --------------------------------------------------------------------
      function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
      function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
      // ----------------------------------------------------------------------------------------------

      function VerificaPreenchimento: Boolean;

      function RetiraReserva(pDataRef              : String;
                             pDataCob              : String;
                             pMesRef               : String;
                             pMesCob               : String;
                             piSeqProposta         : Integer;
                             pIdPessoa             : Integer;
                             pIdPessJur            : Integer;
                             pIdPlanoPrev          : Integer;
                             pIdBeneficio          : Integer;
                             pIdMotivo             : Integer;
                             pValor                : Double;
                             var pIDREGRAABATERESE : String;
                             var dUltIndice        : Double;
                             var sMsg              : String
                            ): Boolean;

      // ----------------------------------------------------------------------------------------------

   public   // Public declarations

   end;



var
  frmExecAbateReserva: TfrmExecAbateReserva;



implementation
{$R *.DFM}
uses
   uSistema, uDataBase, uMensErro, uDiasUteis, FProgresso, uAdmPrevFB, UFuncoesUteisFB,
   uFuncoesFolha, uObjFolha, uMovReservaFB, uVerificaPreenchimento;



function TfrmExecAbateReserva.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try
      // -------------------------------------------------------------------------------------------

      if cboMes.ItemIndex < 0 then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Referência!', cboMes);

      if DBspnAno.Value < 1970 then
         raise EValidacao.CreateVal('É necessário indicar o Ano de Referência!', DBspnAno);

      // -------------------------------------------------------------------------------------------

   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Folha de Benefícios', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmExecAbateReserva.btnContinuarClick(Sender: TObject);
var
   sSQL     : String;
   sAnoMes  : String;
   sDataRef : String;
   sRegra   : String;
   sMsg     : String;
   fIndice  : Double;
   fPrazo   : Double;
   iPos     : Integer;
begin
   if not(VerificaPreenchimento) then Exit;

   iPos     := 0;
   sRegra   := '';
   fIndice  := -1;

   sAnoMes  := QuotedStr(FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1));
   sDataRef := FormatDateTime('dd/mm/yyyy', DiasUteis.UltDiaMes(trunc(DBspnAno.Value), cboMes.ItemIndex + 1));

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   SUM(DECODE(HBB.FLGDEVOLUCAO, 1, -HBB.VLBENEFPGTO, HBB.VLBENEFPGTO)) AS VALOR, '       + #13 +
   '   HBB.IDPESSJUR, HBB.IDPLANOPREV, HBB.SEQPROPOSTA, HBB.MESREFERENCIA, HBB.DTEFETPGTO, ' + #13 +
   '   HBB.IDTITULAR, HBB.IDBENEFICIO, HBB.FLGALIMRESERVA, HBB.IDSEQINTERNOFB, '             + #13 +
   '   ELP.MATRICULA '                                                                       + #13 +

   'FROM '                                                                                   + #13 +
   '   HSTBENEFBFCIARIO HBB, '                                                               + #13 +
   '   ELEGPATRO        ELP  '                                                               + #13 +

   'WHERE '                                                                                  + #13 +
   '       HBB.MES                     = ' + sAnoMes                                         + #13 +
   '   AND NVL(HBB.FLGALIMRESERVA, 0)  = 0 '                                                 + #13;

   if IDPessoa > 0 then sSQL := sSQL  +
   '   AND ELP.IDPESSOA                = ' + FormatFloat('#0', IDPessoa)                     + #13;

   sSQL := sSQL  +
   '   AND HBB.IDHSTFOLHABENEF         IS NOT NULL '                                         + #13 +
   '   AND HBB.IDSEQINTERNOFB          IS NOT NULL '                                         + #13 + 

   '   AND HBB.IDTITULAR               = ELP.IDPESSOA '                                      + #13 +
   '   AND HBB.IDPESSJUR               = ELP.IDPESSJUR '                                     + #13 + 

   '   AND EXISTS ( '                                                                        + #13 +
   '              SELECT 1 '                                                                 + #13 + 
   '              FROM '                                                                     + #13 +
   '                 BENEFRESERVA   BNR, '                                                   + #13 +
   '                 RESERVAPART    RSP, '                                                   + #13 + 
   '                 RESERVAXPLANO  RXP '                                                    + #13 +
   '              WHERE '                                                                    + #13 +
   '                     BNR.IDBENEFICIO     = HBB.IDBENEFICIO '                             + #13 + 
   '                 AND RSP.IDPESSJUR       = HBB.IDPESSJUR '                               + #13 + 
   '                 AND RSP.IDPLANOPREV     = HBB.IDPLANOPREV '                             + #13 +
   '                 AND RSP.IDPESSOA        = HBB.IDTITULAR '                               + #13 +
   '                 AND RSP.SEQPROPOSTA     = HBB.SEQPROPOSTA '                             + #13 +
   '                 AND RSP.IDTIPORESERVA   = BNR.IDTIPORESERVA '                           + #13 + 
   '                 AND RXP.IDPLANOPREV     = HBB.IDPLANOPREV '                             + #13 +
   '                 AND RXP.IDTIPORESERVA   = BNR.IDTIPORESERVA '                           + #13 +
   '              ) '                                                                        + #13 +

   'GROUP BY '                                                                               + #13 +
   '   HBB.IDPESSJUR, HBB.IDPLANOPREV, HBB.SEQPROPOSTA, HBB.MESREFERENCIA, HBB.DTEFETPGTO, ' + #13 +
   '   HBB.IDTITULAR, HBB.IDBENEFICIO, HBB.FLGALIMRESERVA, HBB.IDSEQINTERNOFB, ELP.MATRICULA';


   qryBeneficios.Close;
   qryBeneficios.SQL.Text := sSQL;
   qryBeneficios.Open;

   memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Início do processo de Abatimento de Reservas.');
   memResult.Lines.Add(' ');

   if qryBeneficios.isEmpty then
   begin
      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Não foram encontrados benefícios a processar.');
      memResult.Lines.Add(' ');
   end
   else
   begin
      memResult.Lines.Add('         Matricula     Mês Cob Mês Ref Plano Patro Valor');
      memResult.Lines.Add('         ------------- ------- ------- ----- ----- -------------');
   end;


   frmProgresso.MostraFormProgresso('Processando Benefícios...',
                                    True,
                                    True,
                                    True,
                                    0,
                                    qryBeneficios.RecordCount
                                   );

   try

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      while not(qryBeneficios.EOF) do
      begin
         // ----------------------------------------------------------------------------------------
         if frmProgresso.Cancelou then
         begin
            memResult.Lines.Add(' ');
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Processo interrompido pelo usuário.');
            memResult.Lines.Add(' ');

            MsgDlg('Processo interrompido pelo usuário.', 'Folha', mtInformation, [mbOk], 0);
            Repaint;

            Break;
         end;
         // ----------------------------------------------------------------------------------------

         StartTransacao;

         try
            if RetiraReserva(sDataRef,
                             FormatDateTime('dd/mm/yyyy', qryBeneficiosDTEFETPGTO.AsDateTime),
                             qryBeneficiosMESREFERENCIA.AsString,
                             (FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', cboMes.ItemIndex + 1)),
                             qryBeneficiosSEQPROPOSTA.AsInteger,
                             qryBeneficiosIDTITULAR.AsInteger,
                             qryBeneficiosIDPESSJUR.AsInteger,
                             qryBeneficiosIDPLANOPREV.AsInteger,
                             qryBeneficiosIDBENEFICIO.AsInteger,
                             prmIDMotivoFolhaBen,
                             qryBeneficiosVALOR.AsCurrency,
                             sRegra,
                             fIndice,
                             sMsg
                            ) then
            begin

               // ----------------------------------------------------------------------------------
               // ----------------------------------------------------------------------------------
               // Processo de gravação do valor efetivamente utilizado

               SistemaFolha.objIrrf.AtualizaValorIRFinal(qryBeneficiosIDTITULAR.AsInteger,
                                                         qryBeneficiosIDPLANOPREV.AsInteger,
                                                         qryBeneficiosVALOR.AsCurrency,
                                                         StrToDate(sDataRef)
                                                        );

               // ----------------------------------------------------------------------------------

               CommitTransacao;

               with qryUpdateHstBenef do
               begin
                  Close;
                  if not(Prepared) then Prepare;
                  ParamByName('PIDSEQINTERNOFB').AsInteger := qryBeneficiosIDSEQINTERNOFB.AsInteger;
                  ExecSQL;
               end;

               memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now)                                 + ' '  +
                                   CompletaFim(qryBeneficiosMATRICULA.AsString, ' ', 13)           + ' '  +
                                   CompletaFim(sAnoMes, ' ', 7)                                    + ' '  +
                                   CompletaFim(qryBeneficiosMESREFERENCIA.AsString, ' ', 7)        + ' '  +
                                   CompletaFim(qryBeneficiosIDPLANOPREV.AsString, ' ', 5)          + ' '  +
                                   CompletaFim(qryBeneficiosIDPESSJUR.AsString, ' ', 5)            + ' '  +
                                   CompletaInicio(FormatFloat('#,#0.00', qryBeneficiosVALOR.AsCurrency), ' ', 13)
                                  );
            end
            else
            begin
               RollbackTransacao;

               memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now)                                   + ' '  +
                                 CompletaFim(qryBeneficiosMATRICULA.AsString, ' ', 13)             + ' '  +
                                 CompletaFim(sAnoMes, ' ', 7)                                      + ' '  +
                                 CompletaFim(qryBeneficiosMESREFERENCIA.AsString, ' ', 7)          + ' '  +
                                 CompletaFim(qryBeneficiosIDPLANOPREV.AsString, ' ', 5)            + ' '  +
                                 CompletaFim(qryBeneficiosIDPESSJUR.AsString, ' ', 5)              + ' '  +
                                 CompletaFim('Erro', ' ', 13)                                      + ' '  +
                                 '- ' + sMsg
                                );
            end;
         except
            RollbackTransacao;

            memErro.Lines.Add(FormatDateTime('hh:nn:ss', Now)                                      + ' '  +
                              CompletaFim(qryBeneficiosMATRICULA.AsString, ' ', 13)                + ' '  +
                              CompletaFim(sAnoMes, ' ', 7)                                         + ' '  +
                              CompletaFim(qryBeneficiosMESREFERENCIA.AsString, ' ', 7)             + ' '  +
                              CompletaFim(qryBeneficiosIDPLANOPREV.AsString, ' ', 5)               + ' '  +
                              CompletaFim(qryBeneficiosIDPESSJUR.AsString, ' ', 5)                 + ' '  +
                              CompletaFim('Erro', ' ', 13)                                         + ' '  +
                              '- ' + sMsg
                             );
         end;

         // ----------------------------------------------------------------------------------------
         qryBeneficios.Next;
         inc(iPos);
         frmProgresso.AndaFormProgresso(iPos);
      end;

      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------

      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Início do processo de atualização dos Prazos de Acumulação.');
      memResult.Lines.Add(' ');

      // Busca apenas os participantes que tenham optado pela tributação regressiva e que ainda
      // possuem benefício ativo
      sSQL :=
      'SELECT DISTINCT '                                 + #13 +
      '   PPP.IDPESSOA, PPP.IDPLANOPREV, '               + #13 +
      '   DEP.MATRICULA '                                + #13 +

      'FROM '                                            + #13 +
      '   BENEFBFCIARIO BFC, '                           + #13 +
      '   PARTPREVPLAN  PPP, '                           + #13 +
      '   DEPENTIT      DEP  '                           + #13 +

      'WHERE '                                           + #13 +
      '       BFC.IDSITBENEFICIO IN (1, 2) '             + #13 +
      '   AND PPP.TIPOOPCAOIR    = 2 '                   + #13 +
      '   AND BFC.IDPESSOA       = PPP.IDPESSOA '        + #13 +
      '   AND BFC.IDPLANOPREV    = PPP.IDPLANOPREV '     + #13 +
      '   AND PPP.IDPESSOA       = DEP.IDPESSOA '        + #13 +
      '   AND PPP.IDPESSOA       = DEP.IDTITULAR ';

      qryAux1.Close;
      qryAux1.SQL.Text := sSQL;
      qryAux1.Open;

      if qryAux1.IsEmpty then
      begin
         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Não foram encontrados Prazos de Acumulação a atualizar.');
         memResult.Lines.Add(' ');

         Exit;
      end
      else
      begin
         memResult.Lines.Add('         Matricula Tit Plano Prazo de Acumulação');
         memResult.Lines.Add('         ------------- ----- -------------------');
      end;

      iPos := 0;

      frmProgresso.MostraFormProgresso('Atualizando Prazos de Acumulação...',
                                       True,
                                       True,
                                       True,
                                       0,
                                       qryAux1.RecordCount
                                      );

      // -------------------------------------------------------------------------------------------

      qryAux1.First;
      while not(qryAux1.EOF) do
      begin
         // ----------------------------------------------------------------------------------------
         if frmProgresso.Cancelou then
         begin
            memResult.Lines.Add(' ');
            memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Processo interrompido pelo usuário.');
            memResult.Lines.Add(' ');

            MsgDlg('Processo interrompido pelo usuário.', 'Folha', mtInformation, [mbOk], 0);
            Repaint;

            Break;
         end;
         // ----------------------------------------------------------------------------------------

         fPrazo := SistemaFolha.objIrrf.AtualizaPrazoAcumulacao(qryAux1.FieldByName('IDPESSOA').AsInteger,
                                                                qryAux1.FieldByName('IDPLANOPREV').AsInteger,
                                                                ''
                                                               );

         memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now)                                    + ' '  +
                             CompletaFim(qryAux1.FieldByName('MATRICULA').AsString, ' ', 13)    + ' '  +
                             CompletaFim(qryAux1.FieldByName('IDPLANOPREV').AsString, ' ', 5)   + ' '  +
                             CompletaInicio(FormatFloat('#,#0.0000000000', fPrazo), ' ', 18)
                            );

         qryAux1.Next;
         inc(iPos);
         frmProgresso.AndaFormProgresso(iPos);
      end;

      // -------------------------------------------------------------------------------------------

   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' - ' + 'Final do processo.');

      frmProgresso.EscondeFormProgresso;
      inherited;
   end;
end;




function TfrmExecAbateReserva.RetiraReserva(pDataRef              : String;
                                            pDataCob              : String;
                                            pMesRef               : String;
                                            pMesCob               : String;
                                            piSeqProposta         : Integer;
                                            pIdPessoa             : Integer;
                                            pIdPessJur            : Integer;
                                            pIdPlanoPrev          : Integer;
                                            pIdBeneficio          : Integer;
                                            pIdMotivo             : Integer;
                                            pValor                : Double;
                                            var pIDREGRAABATERESE : String;
                                            var dUltIndice        : Double;
                                            var sMsg              : String
                                           ): Boolean;
var
   dValorDescontado  : Double;
   dValorCotas       : Double;
   dValorReserva     : Double;
   sidregraabaterese : String;
   iOrdem            : Integer;
   dIndice           : Double;
   IndiceReajuste    : Integer;
   sCodMoedaData     : String;
   sUltCodMoedaData  : String;
   irethist          : Integer;
   lbAbate           : Boolean;
   lidebcre          : Integer;
   sSQLRegra         : String;
   bErroRegra        : Boolean;
   sValorRegra       : String;
   lssql             : String;
begin
   Result   := False;
   sMsg     := '';

   try
      lbAbate  := True;
      lidebcre := 0;
      iOrdem   := 0;

      pIdRegraAbateRese := 'NULL ';

      if pValor < 0 then
      begin
         pValor   := -pValor;
         lbAbate  := False;   
         lidebcre := 1;
      end;

      // -------------------------------------------------------------------------------------------

      lssql :=
      'SELECT '                                                                     + #13 +
      '   BR.IDPLANOPREV, BR.NUMORDEM, BR.IDBENEFICIO, BR.IDTIPORESERVA, '          + #13 +
      '   BR.IDREGRAABATERESE, P.NOME, B.NOME AS BENEFICIO, RPL.NOME AS RESERVA, '  + #13 +
      '   RPL.INDICEREAJUSTE, RP.IDTIPORESERVA, RP.IDPLANOPREV, RP.IDPESSJUR, '     + #13 +
      '   RP.IDPESSOA, RP.DATAREFERENCIASA, RP.VALORRESERVA, RP.PERCENTUALSAQUE '   + #13 +

      'FROM '                                                                       + #13 +
      '   BENEFRESERVA  BR,  '                                                      + #13 +
      '   RESERVAPART   RP,  '                                                      + #13 +
      '   RESERVAXPLANO RPL, '                                                      + #13 +
      '   BENEFICIO     B,   '                                                      + #13 +
      '   PESSOA        P    '                                                      + #13 +

      'WHERE '                                                                      + #13 +
      '       BR.IDPLANOPREV     = ' + IntToStr(pIdPlanoPrev)                       + #13 +
      '   AND BR.IDBENEFICIO     = ' + IntToStr(pIdBeneficio)                       + #13 +
      '   AND RP.IDPESSJUR       = ' + IntToStr(pIdPessJur)                         + #13 +
      '   AND RP.IDPLANOPREV     = BR.IDPLANOPREV '                                 + #13 + 
      '   AND RP.IDPESSOA        = ' + IntToStr(pIdPessoa)                          + #13 + 
      '   AND RP.SEQPROPOSTA     = ' + IntToStr(piSeqProposta)                      + #13 + 
      '   AND RP.IDTIPORESERVA   = BR.IDTIPORESERVA '                               + #13 + 
      '   AND RPL.IDPLANOPREV    = BR.IDPLANOPREV '                                 + #13 + 
      '   AND RPL.IDTIPORESERVA  = BR.IDTIPORESERVA'                                + #13 + 
      '   AND B.IDBENEFICIO      = BR.IDBENEFICIO '                                 + #13 + 
      '   AND P.IDPESSOA         = RP.IDPESSOA '                                    + #13;

      // CONTROLA PARA PROCESSAR APENAS RESERVAS COM REGRA
      if SistemaFolha.FlgAbateTodasReservasRegra then lssql := lssql  +
      '   AND NVL(BR.IDREGRAABATERESE,0) > 0 '                                      + #13;

      lssql := lssql  +
      'ORDER BY '                                                                   + #13 +
      '   BR.NUMORDEM '                                                             + #13;

      qryaux1.close;
      qryaux1.sql.clear;
      qryaux1.sql.add(lssql);

      try
         qryaux1.open;
      except
         on E:EDBEngineError do
         begin
            qryaux1.close;
            sMsg := 'Erro ao tentar obter informação para abatimento das reserva '  + #13#10 +
                    'Beneficiário: ' + IntToStr(pidpessoa)                          + #13#10 +
                    'Benefício: ' + IntToStr(pidbeneficio)                          + #13#10;
            Exit;
         end;
      end;

      // -------------------------------------------------------------------------------------------

      while not(qryaux1.EOF) and (pValor > 0) do
      begin
         sIdRegraAbateRese := qryaux1.FieldByName('IDREGRAABATERESE').AsString;
         IndiceReajuste    := qryaux1.FieldByName('INDICEREAJUSTE').AsInteger;

         if sIdRegraAbateRese = '' then
         begin
            dValorCotas    := 0;
            sCodMoedaData  := IntCod(IndiceReajuste, 3) + pDataRef;

            if sCodMoedaData = sUltCodMoedaData then      // Para não fazer acesso desnecessário a tabela de Cotacao.
               dIndice := dUltIndice
            else
            begin
               sUltCodMoedaData := sCodMoedaData;
               if not PegaIndiceData(IndiceReajuste,pDataRef,dIndice) then dIndice := 0;
               dUltIndice := dIndice;
            end;

            if (abs(dIndice) > 0.0000001) then dValorCotas := pValor / dIndice;
         end
         else
         begin
            dIndice := 0;

            sSQLRegra :=
            'SELECT '                                                                                       + #13 +
            '   ' + OraNumero(FloatToStr(pValor))                                + ' AS VALORPROVENTO, '    + #13 +
            '   ' + OraNumero(FloatToStr(pValor))                                + ' AS VALORTOTAL, '       + #13 +
            '   ' + Quotedstr(IntToStr(IndiceReajuste))                          + ' AS INDICEREAJUSTE, '   + #13 +
            '   ' + QuotedStr(pMesRef)                                           + ' AS MESREF, '           + #13 +
            '   0 '                                                              + ' AS FLGCONCESSAO, '     + #13 +
            '   ' + IntToStr(pidpessoa)                                          + ' AS IDPESSOA, '         + #13 +
            '   ' + IntToStr(pIdPlanoPrev)                                       + ' AS IDPLANOPREV, '      + #13 +
            '   ' + IntToStr(pIdPessJur)                                         + ' AS IDPESSJUR, '        + #13 +
            '   ' + IntToStr(piSeqProposta)                                      + ' AS SEQPROPOSTA, '      + #13 +
            '   TO_DATE(''' + pDataRef + ''', ''DD/MM/YYYY'') '                  + ' AS DATAINICIOFUND, '   + #13 +
            '   TO_DATE(''' + pDataRef + ''', ''DD/MM/YYYY'') '                  + ' AS DATAREF, '          + #13 +
            '   ' + IntToStr(qryaux1.FieldByName('IdTipoReserva').AsInteger)     + ' AS IDTIPORESERVA '     + #13 +
            'FROM DUAL';

            try
               sValorRegra := RegraNumerica(sIdRegraAbateRese, sSQLRegra, bErroRegra, iIdCalculoGeral);
               dValorCotas := 0;

               if sValorRegra <> '0' then
               begin
                  if sValorRegra <> '' then
                  begin
                     sValorRegra := ClienteNumero(sValorRegra);
                     dValorCotas := StrToFloat(sValorRegra);
                     dIndice     := pValor / dValorCotas;
                  end
                  else
                  begin
                     if bErroRegra then
                        sMsg := sMsg +
                        'Erro na execução da Regra de Abatimento da Reserva: num. ' + sIdRegraAbateRese  + #13#10 +
                        'Beneficiário: ' + qryaux1.FieldByName('Nome').AsString                          + #13#10 +
                        'Benefício: ' + qryaux1.FieldByName('Beneficio').AsString                        + #13#10 +
                        'Reserva: ' + qryaux1.FieldByName('Reserva').AsString                            + #13#10 +
                        'SQL para Regra:' +  sSQLRegra                                                   + #13#10;

                     qryaux1.Close;
                     Exit;
                  end;
               end
               else
               begin
                  sMsg := sMsg +
                  'Regra de Abatimento da Reserva retornou valor <= 0: num. ' + sIdRegraAbateRese  + #13#10 +
                  'Beneficiário: ' + qryaux1.FieldByName('Nome').AsString                          + #13#10 +
                  'Benefício: ' + qryaux1.FieldByName('Beneficio').AsString                        + #13#10 +
                  'Reserva: ' + qryaux1.FieldByName('Reserva').AsString                            + #13#10 +
                  'SQL para Regra:' +  sSQLRegra                                                   + #13#10;
               end;

            except
               sMsg := sMsg +
               'Erro na execução da Regra de Abatimento da Reserva: num. ' + sIdRegraAbateRese  + #13#10 +
               'Beneficiário: ' + qryaux1.FieldByName('Nome').AsString                          + #13#10 +
               'Benefício: ' + qryaux1.FieldByName('Beneficio').AsString                        + #13#10 +
               'Reserva: ' + qryaux1.FieldByName('Reserva').AsString                            + #13#10 +
               'SQL para Regra:' + sSQLRegra                                                    + #13#10;

               qryaux1.Close;
               Exit;
            end;  // try..except
         end;  // if sIdRegraAbateRese = ''

         if dValorCotas > 0 then
         begin
            if dIndice < 0.0000001 then
            begin
               sMsg := sMsg +
               'Erro na busca do valor da cota'                            + #13#10 +
               'Beneficiário: ' + qryaux1.FieldByName('Nome').AsString     + #13#10 +
               'Benefício: ' + qryaux1.FieldByName('Beneficio').AsString   + #13#10 +
               'Reserva: ' + qryaux1.FieldByName('Reserva').AsString       + #13#10;

               qryaux1.Close;
               Exit;
            end;

            if lbAbate then
            begin
               if not SistemaFolha.FlgAbateTodasReservasRegra then 
               begin
                  if dValorCotas < qryaux1.FieldByName('ValorReserva').AsFloat then
                  begin
                     dValorReserva     := qryaux1.FieldByName('ValorReserva').AsFloat-dValorCotas;
                     dValorDescontado  := dValorCotas;
                     pValor := 0;
                  end
                  else
                  begin
                     dValorReserva := 0;

                     if dValorCotas > qryaux1.FieldByName('ValorReserva').AsFloat then
                     begin
                        pValor            := (dValorCotas-qryaux1.FieldByName('ValorReserva').AsFloat)*dIndice;
                        dValorDescontado  := qryaux1.FieldByName('ValorReserva').AsFloat;
                     end
                     else
                        pValor := 0;
                  end;
               end
               else
               begin
                  dValorReserva     := qryaux1.FieldByName('ValorReserva').AsFloat-dValorCotas;
                  dValorDescontado  := dValorCotas;
               end;
            end
            else
            begin
               dValorReserva     := qryaux1.FieldByName('ValorReserva').AsFloat + dValorCotas;
               dValorDescontado  := dValorCotas;
            end;

            lssql :=
            'UPDATE RESERVAPART RP '                                                      + #13 +
            'SET RP.VALORRESERVA       = ' + oranumero(floattostr(dValorReserva)) + '  '  + #13 +
            'WHERE (RP.IDPESSJUR       = ' + IntToStr(pIdPessJur)                 + ') '  + #13 +
            '  AND (RP.IDPLANOPREV     = ' + IntToStr(pIdPlanoPrev)               + ') '  + #13 +
            '  AND (RP.IDPESSOA        = ' + IntToStr(pIdPessoa)                  + ') '  + #13 +
            '  AND (RP.SEQPROPOSTA     = ' + IntToStr(piSeqProposta)              + ') '  + #13 +
            '  AND (RP.IDTIPORESERVA   = ' + IntToStr(qryaux1.FieldByName('IdTipoReserva').AsInteger) + ') ' + #13 ;

            qryaux2.sql.clear;
            qryaux2.sql.add(lssql);
            try
               qryAux2.execsql;
            except
               on E:EDBEngineError do
               begin
                  sMsg := sMsg +
                  'Erro na atualização da Reserva' + #13#10 +
                  'Beneficiário: ' + qryaux1.FieldByName('Nome').AsString + #13#10 +
                  'Benefício: ' + qryaux1.FieldByName('Beneficio').AsString + #13#10 +
                  'Reserva: ' + qryaux1.FieldByName('Reserva').AsString + #13#10;

                  Exit;
               end;
            end;

            Inc(iOrdem);
            // Lanca no Historico de Movimentacao de Reserva
            if not(AlimentaHistorico(qryAux2,
                                     IntToStr(pIdPessJur),
                                     IntToStr(pIdPlanoPrev),
                                     qryaux1.FieldByName('IdTipoReserva').AsString,
                                     IntToStr(pIdPessoa),
                                     IntToStr(piSeqProposta),
                                     Oranumero(floattostr(dValorDescontado)),
                                     OraNumero(floattostr(dValorReserva)),
                                     IntToStr(pIdBeneficio),
                                     '',
                                     '',
                                     sIdRegraAbateRese,
                                     pMesRef,
                                     lidebcre,
                                     StrToDate(pDataRef),
                                     True,
                                     StrToDate(pDataRef),
                                     IntToStr(pIdPessoa),
                                     qryBeneficiosIDSEQINTERNOFB.AsInteger,  
                                     irethist
                                    )) then
            begin
               sMsg := sMsg + 'Erro na gravação do Histórico de Alimentação de Reserva' + #13#10;
               Exit;
            end;

         end;

         if not(lbAbate) then break;

         qryaux1.Next;
      end;

   except
      on e:exception do
      begin
         sMsg := sMsg + 'Erro:' + e.message;
         Exit;
      end;
   end;

   pIdRegraAbateRese := sIdRegraAbateRese;
   Result            := True;
end;



function TfrmExecAbateReserva.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;

function TfrmExecAbateReserva.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;



procedure TfrmExecAbateReserva.btnBuscaPartClick(Sender: TObject);
begin
   inherited;

   MS_Assistido.Executar;

   Repaint;

   if MS_Assistido.RetornouValor then
   begin
      Screen.Cursor     := crHourGlass;

      IDPessoa          := StrToInt(MS_Assistido.ValoresChave[0]);

      edtMatricula.Text := MS_Assistido.ValoresChave[2];
      edtNome.Text      := MS_Assistido.ValoresChave[1];
   end;

   if btnBuscaPart.CanFocus then btnBuscaPart.SetFocus;

   Screen.Cursor  := crDefault;
end;



procedure TfrmExecAbateReserva.btnLimpaPartClick(Sender: TObject);
begin
   inherited;

   edtMatricula.Clear;
   edtNome.Clear;

   IDPessoa := -1
end;



procedure TfrmExecAbateReserva.FormShow(Sender: TObject);
begin
   inherited;

   IDPessoa       := -1;
   DBspnAno.Value := DiasUteis.ExtraiAno(Date);
end;



end.



SELECT
   HMR.IDHISTRESERVA, HMR.IDPLANOPREV, HMR.IDTIPORESERVA, HMR.IDPESSJUR, HMR.IDCONTRIBUICAO,
   HMR.DATAALIMENTACAO, 
   ROUND(HMR.VLRREAL, 2) AS VLRREAL,
   ROUND(HMR.VLRCOTAS, 2) AS VLRCOTAS,
   ROUND(HMR.SALDOREAL, 2) AS SALDOREAL,
   ROUND(HMR.SALDOREALCONT, 2) AS SALDOREALCONT,
   ROUND(HMR.SALDOCOTAS, 2) AS SALDOCOTAS,
   HMR.FLGENTRADA, 
   HMR.VALORINDICE, HMR.MESREFERENCIA, HMR.VLRCOTASIRPREVIA, HMR.VLRCOTASIR,
   RXP.INDICEREAJUSTE, HMR.DATAMOV

FROM
   HISTMOVRESERVA HMR,
   RESERVAXPLANO  RXP

WHERE
       HMR.IDPESSOA       = 25722
   AND HMR.IDPLANOPREV    = 7
   AND RXP.IDPLANOPREV    = 7
   AND (HMR.IDCONTRIBUICAO IS NOT NULL OR HMR.IDBENEFICIO IS NOT NULL)
   AND RXP.FLGREGRESSIVA  = 1
   AND HMR.IDPLANOPREV    = RXP.IDPLANOPREV
   AND HMR.IDTIPORESERVA  = RXP.IDTIPORESERVA

ORDER BY
   HMR.DATAALIMENTACAO



