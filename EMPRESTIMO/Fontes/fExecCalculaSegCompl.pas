{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
--------------------------------------------------------------------------------
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
Data      : 03/06/2005
Autor     : André Pontes
Pendência : 19404
Descrição : Bloqueio de lançamento e contabilização / estorno / exclusão de
            acordo com parâmetro contábil por módulo + TestaPeríodo.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecCalculaSegCompl;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, mListaTipoContr, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
   TB97, ExtCtrls, Db, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, Mask,
   wwdbedit, Wwdbspin, uTypesEmptmo, wwdbdatetimepicker, IvDictio, IvMulti,
   IvEMulti,
   uCtrlContab, uCtrlPadroes, mContratoEmptmo;

type
   TfrmExecCalculaSegCompl = class(TFrmOkCancelarImob)
      qryContratos: TwwQuery;
      ntbCalculo: TNotebook;
      rgFormaCobranca: TRadioGroup;
      MolListaTipoContr1: TMolListaTipoContr;
      qryBuscaPeriodo: TwwQuery;
      wwDBGrid1: TwwDBGrid;
      dsResult: TDataSource;
      updResult: TUpdateSQL;
      Panel1: TPanel;
      Label15: TLabel;
      DBspnAnoIni: TwwDBSpinEdit;
      cboMesIni: TComboBox;
      Label1: TLabel;
      cboMesFIm: TComboBox;
      DBSpnAnoFim: TwwDBSpinEdit;
      Label2: TLabel;
      cboMesCob: TComboBox;
      spnAnoCob: TwwDBSpinEdit;
      qryResult: TwwQuery;
      qryContratosIDCONTRATOEMPTMO: TFloatField;
      qryContratosIDCONTRQUITACAO: TFloatField;
      qryContratosIDTIPOEMPTMO: TFloatField;
      qryContratosIDINSCRICAOEMPTMO: TFloatField;
      qryContratosIDTIPOCONTREMPTMO: TFloatField;
      qryContratosIDPATRO: TFloatField;
      qryContratosIDPLANOPREV: TFloatField;
      qryContratosIDVERBA: TFloatField;
      qryContratosIDPESSOA: TFloatField;
      qryContratosIDBENEF: TFloatField;
      qryContratosFLGSITUACAO: TStringField;
      qryContratosFLGFORMAREC: TStringField;
      qryContratosFLGFORMAPAG: TStringField;
      qryContratosCODFORMAPAG: TFloatField;
      qryContratosPORTFORMAREC: TFloatField;
      qryContratosPORTFORMAPAG: TFloatField;
      qryContratosIDCBANCARIA: TFloatField;
      qryContratosDATAASSINATURA: TDateTimeField;
      qryContratosDATASITUACAO: TDateTimeField;
      qryContratosDATACREDITO: TDateTimeField;
      qryContratosDATAPRIMPARC: TDateTimeField;
      qryContratosDATACANC: TDateTimeField;
      qryContratosMOECODIGO: TFloatField;
      qryContratosMOESIGLA: TStringField;
      qryContratosVLRCONTRATO: TFloatField;
      qryContratosVLRPARCELA: TFloatField;
      qryContratosTXJUROS: TFloatField;
      qryContratosNUMPARCELAS: TFloatField;
      qryContratosDATAINSC: TDateTimeField;
      qryContratosIDSITPART: TFloatField;
      qryContratosFLGINTERNO: TStringField;
      qrySaldoAnt: TwwQuery;
      qrySaldoAntHMESALDODEV: TFloatField;
      qryBuscaItem: TwwQuery;
      qryBuscaItemIDTIPOCONTREMPTMO: TFloatField;
      qryBuscaItemIDITEMEMPTMO: TFloatField;
      qryBuscaItemITCRECPAG: TStringField;
      qryBuscaItemIDREGRACALC: TFloatField;
      qryBuscaItemIDREGRADEVOL: TFloatField;
      qryBuscaItemIDREGRADIARIA: TFloatField;
      qryBuscaItemITCEVENTO: TFloatField;
      qryBuscaItemFLGCENTRALIZA: TFloatField;
      qryBuscaItemFLGDESTACADO: TFloatField;
      qryBuscaItemITCSEQCALCULO: TFloatField;
      qryBuscaItemITCPRIORIDADE: TFloatField;
      qryBuscaItemITCTRATASALDODEV: TFloatField;
      qryBuscaItemFLGTEMPORARIO: TFloatField;
      qryBuscaItemITCPERIODICIDADE: TFloatField;
      qryBuscaItemITCNUMVEZES: TFloatField;
      qryBuscaItemIDPROVENTON: TFloatField;
      qryBuscaItemIDPROVENTOA: TFloatField;
      qryBuscaItemIDPROVENTOD: TFloatField;
      qryBuscaItemPLANO: TFloatField;
      qryBuscaItemCONTABAIXA: TStringField;
      qryBuscaItemCODTIPDOC: TFloatField;
      qryBuscaItemTIPCODIGO: TStringField;
      qryBuscaItemIDPROVENTOS: TFloatField;
      qryBuscaItemFLGGRAVAZERO: TFloatField;
      qrySaldoAntHMETXJUROS: TFloatField;
      qryResultIDCONTRATOEMPTMO: TFloatField;
      qryResultMUTUARIO: TStringField;
      qryResultMATRICULA: TStringField;
      qryResultVALOR: TFloatField;
      qryContratosMATRICULA: TStringField;
      qryContratosNOME: TStringField;
      qrySaldoAntHMENUMPARCELAS: TFloatField;
      qrySaldoAntHMEPARCELA: TFloatField;
      qryBuscaPeriodoIDTIPOCONTREMPTMO: TFloatField;
      qryBuscaPeriodoPERIODOINICIAL: TStringField;
      qryBuscaPeriodoPERIODOFINAL: TStringField;
      qryBuscaPeriodoMESCOBRANCA: TStringField;
      qryInsertPeriodo: TwwQuery;
      FloatField1: TFloatField;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      qrySaldoAntHMEDATAATUALIZA: TDateTimeField;
      qryParcelasGeradas: TwwQuery;
      qryParcelasGeradasHMEVLRPREVISTO: TFloatField;
      bbtnAplicar: TBitBtn;
      Label5: TLabel;
      edtDatalancto: TwwDBDateTimePicker;
      qryParcelasAberto: TwwQuery;
      qryParcelasAbertoTOTAL: TFloatField;
      molContratoEmptmo: TmolContratoEmptmo;
    qryAux: TwwQuery;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnAplicarClick(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);

   private  // Private declarations

      Contab : TCtrlContab;   // André Pontes - 03/06/2005 - pendência 19404

      iPais       : Integer;
      sEstado     : String;
      iCidade     : Integer;

      vItens      : TListaItem;
      rContrato   : TDadosContrato;
      rConcessao  : TDadosConcessao;

      function  VerificaPreenchimento : Boolean;
      function  SelecionaContratos : String;


   public   // Public declarations


   end;



var
  frmExecCalculaSegCompl: TfrmExecCalculaSegCompl;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, uDatabase, dBaseDados, uModulo, uVerificaPreenchimento,
   uFuncoesEmptmo, dMS, uDiasUteis, dEmptmo, uLancContab,
   FProgresso, URegra, uCmFileUtils, UCalcEmptmo;



function TfrmExecCalculaSegCompl.VerificaPreenchimento: Boolean;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
   Result := False;

   try
      // André Pontes - 03/06/2005 - pendência 19404
      if dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1 then
      begin
         // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
         // estorno na data de cancelamento indicada
         sDataLanc   := FormatDateTime('dd/mm/yyyy', edtDatalancto.Date);
         iEmpresa    := Sistema.idEmpresa;
         sMsgContab  := '';

         if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDatalancto);

         if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
         begin
            sMsgContab := Contab.MessageInfo;
            raise EValidacao.CreateVal('Não é possível fazer lançamentos para a data escolhida:' + #13 + '"' + sMsgContab + '"', edtDatalancto);
         end;
      end;
      // FIM André Pontes - 03/06/2005 - pendência 19404

   except
      on ev : EValidacao do begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



procedure TfrmExecCalculaSegCompl.FormShow(Sender: TObject);
var
   dPeriodo         : TDateTime;
   dPeriodoCob      : TDateTime;
   iano, iMes, iDia : word;
   sPeriodo         : String;
begin
   inherited;

   MolListaTipoContr1.PreencheTipo;

   ntbCalculo.Visible   := True;
   ntbCalculo.PageIndex := 1;

   ParametrosSistema;

   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   edtDatalancto.Date := SysDate;

   sPeriodo := FormatDateTime('dd/mm/yyyy',SysDate);
   sPeriodo := Copy(sPeriodo,7,4) + Copy(sPeriodo,4,2);

   // Busca o periodo anterior calculado
   LimpaParametros(qryBuscaPeriodo);
   qryBuscaPeriodo.Open;
   if not qryBuscaPeriodo.IsEmpty then sPeriodo := qryBuscaPeriodoPERIODOFINAL.AsString;

   dPeriodo    := StrToDate('20/' + Copy(sPeriodo,5,2) + '/' + Copy(sPeriodo,1,4));
   dPeriodo    := dPeriodo + 20;
   dPeriodoCob := dPeriodo + 30;

   DecodeDate(dPeriodo, iAno, iMes, iDia);

   // Preenche as combos de periodos
   cboMesIni.ItemIndex := iMes - 1;
   cboMesFim.ItemIndex := iMes - 1;
   DbSpnAnoIni.Value   := iAno;
   DbSpnAnoFim.Value   := iAno;

   DecodeDate(dPeriodoCob, iAno, iMes, iDia);
   cboMesCob.ItemIndex := iMes - 1;
   spnAnoCob.Value     := iAno;
end;



procedure TfrmExecCalculaSegCompl.bbtnConfirmarClick(Sender: TObject);
var
   rSaldoDev                : TSaldoDevAnt;
   sSQLRegra, sValor        : String;
   i                        : Integer;
   sPeriodoIni, sPeriodoFim : String;
   rSitPart                 : TSitPart;
   dDataVencto              : TDateTime;
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

   qryResult.Close;
   qryResult.Open;

   ParametrosSistema;

   i := 0;

   SetLength(vItens,1);

   with qryContratos do
   begin
      Close;
      qryContratos.SQL.Text := SelecionaContratos;
   // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
   // qryContratos.SQL.SaveToFile(Sistema.TempDir + 'EP - ContratosCalcSegCompl.txt');
      qryContratos.SQL.SaveToFile(ftempregra + '\' + 'EP - ContratosCalcSegCompl.txt');
      Open;

      MostraFormProgresso('Processando Contratos ...',
                          0, RecordCount, True, True);

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

      while not(EOF) do
      begin
         rSaldoDev := CalcEmptmo.SaldoDevAnt(qryContratosIDContratoEmptmo.AsFloat,
                                             edtDatalancto.Date,
                                             -1,
                                             -1
                                            );
         inc(i);
         AndaFormProgresso(i);

         if rSaldoDev.fSaldoDevAnt > 0 then
         begin
            LimpaParametros(qryBuscaItem);
            qryBuscaItem.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryContratosIDTIPOCONTREMPTMO.AsInteger;
            qryBuscaItem.ParamByName('PIDITEMEMPTMO').AsInteger      := dtmEmptmo.qryParamEmptmoIDITEMSEGESPECIAL.AsInteger;
            qryBuscaItem.Open;

            LimpaRegistroContrato(rContrato);
            LimpaRegistroConcessao(rConcessao);

            rContrato.IDContratoEmptmo  := qryContratosIDContratoEmptmo.AsFloat;
            rContrato.IDPessoa          := qryContratosIDPESSOA.AsInteger;
            rContrato.IDTipoContrEmptmo := qryContratosIDTipoContrEmptmo.AsInteger;
            rContrato.IDTipoEmptmo      := qryContratosIDTIPOEMPTMO.AsInteger;
            rContrato.IDPlanoPrev       := qryContratosIDPLANOPREV.AsInteger;
            rContrato.IDPatro           := qryContratosIDPATRO.AsInteger;
            rContrato.IDBenef           := qryContratosIDBENEF.AsInteger;

            rContrato.NumParcelas       := qryContratosNUMPARCELAS.AsInteger;

            rContrato.DataCredito       := qryContratosDATACREDITO.AsDateTime;
            rContrato.DataSituacao      := qryContratosDATASITUACAO.AsDateTime;
            rContrato.DataAssinatura    := qryContratosDATAASSINATURA.AsDateTime;
            rContrato.DataPrimParc      := qryContratosDATAPRIMPARC.AsDateTime;
            rContrato.DataCanc          := qryContratosDATACANC.AsDateTime;
            rContrato.DataInscricao     := qryContratosDATAINSC.AsDateTime;
            rContrato.VlrContrato       := qryContratosVLRCONTRATO.AsCurrency;
            rContrato.VlrParcela        := qryContratosVLRPARCELA.AsCurrency;
            rContrato.Txjuros           := qryContratosTXJUROS.AsCurrency;
            rContrato.FlgFormaRec       := qryContratosFLGFORMAREC.AsString;
            rContrato.FlgFormaPag       := qryContratosFLGFORMAPAG.AsString;
            rContrato.Indexador         := qryContratosMOECODIGO.AsInteger;
            rContrato.SiglaIndexador    := qryContratosMOESIGLA.AsString;

            sPeriodoIni := FormatFloat('0000', DBspnAnoIni.Value) + '/' + FormatFloat('00', cboMesIni.ItemIndex + 1);
            sPeriodoFim := FormatFloat('0000', DBspnAnoFim.Value) + '/' + FormatFloat('00', cboMesFim.ItemIndex + 1);

            LimpaParametros(qryParcelasGeradas);
            qryParcelasGeradas.ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            qryParcelasGeradas.Open;

            LimpaParametros(qryParcelasAberto);
            qryParcelasAberto.ParamByName('PIDCONTRATOEMPTMO').AsFloat := rContrato.IDContratoEmptmo;
            qryParcelasAberto.Open;

            sSQLRegra :=
            'SELECT '                                                                                  + #13 +
            ' ' + FormatFloat('#0', rContrato.IDContratoEmptmo)             + ' AS IDCONTRATOEMPTMO, ' + #13 +
            '-1'                                                            + ' AS ORIGEM, '           + #13 +
            ' ' + IntToStr(iPais)                                           + ' AS IDPAIS, '           + #13 +
            ' ' + QuotedStr(sEstado)                                        + ' AS CODESTADO, '        + #13 +
            ' ' + IntToStr(iCidade)                                         + ' AS IDCIDADES, '        + #13 +
            ' ' + NumeroIngles(rSaldoDev.fSaldoDevAnt)                      + ' AS SALDODEV, '         + #13 +
            ' ' + NumeroIngles(qryParcelasGeradasHMEVLRPREVISTO.AsCurrency) + ' AS VALOREMABERTO, '    + #13 +
            ' ' + QuotedStr(DateToStr(rSaldoDev.dDataAtuAnt))               + ' AS DATAATUALIZACAO, '  + #13 +
            ' ' + NumeroIngles(rSaldoDev.fTxJurosAnt)                       + ' AS TXJUROS, '          + #13 +
            ' ' + QuotedStr(DateToStr(rContrato.DataCredito))               + ' AS DATACREDITO, '      + #13 +
            ' ' + QuotedStr(sPeriodoIni)                                    + ' AS PERIODOINI, '       + #13 +
            ' ' + QuotedStr(sPeriodoFim)                                    + ' AS PERIODOFIM, '       + #13 +
            ' ' + QuotedStr(DateToStr(edtDatalancto.Date))                  + ' AS DATAVENCTO, '       + #13 +
            ' ' + NumeroIngles(qryParcelasAbertoTOTAL.AsCurrency)           + ' AS VLRMAXPERMIT '      + #13 +
            'FROM DUAL';

            UtilizaRegraValor(qryBuscaItemIDREGRACALC.AsInteger,
                              sSQLRegra,
                              'e Seguro Complementar Especial' ,
                              sValor,
                              False
                             );

            vItens[0].CodigoItem       := qryBuscaItemIDITEMEMPTMO.AsInteger;
            vItens[0].Regra            := qryBuscaItemIDREGRACALC.AsInteger;
            vItens[0].Rubrica          := qryBuscaItemIDPROVENTON.AsInteger;
            vItens[0].iEvento          := qryBuscaItemITCEVENTO.AsInteger;
            vItens[0].FlgEnvio         := -1;
            vItens[0].FlgBaixado       := 0;
            vItens[0].RecPag           := 'R';

            // -------------------------------------------------------------------------------------
            case rgFormaCobranca.ItemIndex of

               0:
               begin
                  vItens[0].FormaCobranca := rContrato.FlgFormaRec;
                  if rContrato.FlgFormaRec = 'F' then  vItens[0].TipoFolha := 'P'
                  else                                 vItens[0].TipoFolha := '';
               end;

               1:
               begin
                  vItens[0].FormaCobranca := 'F';
                  vItens[0].TipoFolha     := 'B';
               end;

               2:
               begin
                  vItens[0].FormaCobranca := 'C';
                  vItens[0].TipoFolha     := '';
               end;

            end;
            // -------------------------------------------------------------------------------------

            vItens[0].Parcela          := rSaldoDev.iParcelaAnt;
            vItens[0].Parcela          := rSaldoDev.iParcelaAltAnt;
            vItens[0].ParcResta        := rSaldoDev.iParcRestaAnt;

            vItens[0].Origem           := 14;
            vItens[0].Prioridade       := qryBuscaItemITCPRIORIDADE.AsInteger;
            vItens[0].SeqCalculo       := qryBuscaItemITCSEQCALCULO.AsInteger;
            vItens[0].SeqCobranca      := 1;
            vItens[0].FlgCentraliza    := qryBuscaItemFLGCENTRALIZA.AsInteger;
            vItens[0].IDItemCentraliza := vItens[0].CodigoItem;
            vItens[0].AnoCompetencia   := Trunc(spnAnoCob.Value);
            vItens[0].MesCompetencia   := cboMesCob.ItemIndex + 1;
            vItens[0].AnoCobranca      := Trunc(spnAnoCob.Value);
            vItens[0].MesCobranca      := cboMesCob.ItemIndex + 1;

          //Pendência 24134 - 08/01/2007 - Alberto
            rSitPart                   := FuncoesEmptmo.BuscaSitPart(rContrato.IDPessoa);

          //vItens[0].DataPrevista     := StrToDate('20/' + IntToStr(cboMesCob.ItemIndex + 1) + '/' + IntToStr(Trunc(spnAnoCob.Value)));
            vItens[0].DataPrevista     := StrToDate(CalcEmptmo.CritDataEmptmo(qryAux, IntToStr(rContrato.IDPatro),
                                          IntToStr(rContrato.IDPlanoPrev), rSitPart.flgInterno, 'N', // NORMAL
                                          IntToStr(vItens[0].MesCompetencia), FloatToStr(vItens[0].AnoCompetencia),
                                          rContrato.FlgFormaRec, FormatDateTime('dd/mm/yyyy', rContrato.DataAssinatura),
                                          //Pendência 24408 - 05/02/2007 - Alberto
                                          //rSaldoDev.iParcelaAnt));
                                          1));
                                          //Fim Pendência 24408

            dDataVencto                := vItens[0].DataPrevista;

            if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
            begin
               if not(DiasUteis.DiaUtil(dDataVencto, iCidade, iPais, sEstado, True, True, False)) then
               begin
                  repeat
                     dDataVencto := dDataVencto + 1;
                  until
                     DiasUteis.DiaUtil(dDataVencto, iCidade, iPais, sEstado, True, True, False);
               end;
            end;

            vItens[0].DataVencto := dDataVencto;

          //Fim Pendência 24134

            vItens[0].DataUltAtualiza  := SysDate;
            vItens[0].Valor            := StrToFloat(ConverteVirg(sValor));


            // Marchetti - Pendencia 23053
            case qryBuscaItemITCTRATASALDODEV.AsInteger of
               0: vItens[0].SaldoDevedor := rSaldoDev.fSaldoDevAnt; (* Não Tratar *)
               1: vItens[0].SaldoDevedor := rSaldoDev.fSaldoDevAnt - vItens[0].Valor; (* Abater *)
               2: vItens[0].SaldoDevedor := rSaldoDev.fSaldoDevAnt + vItens[0].Valor; (* Incorporar *)
            end;
            // Fim Marchetti - Pendencia 23053

            vItens[0].FlgDestacado     := qryBuscaItemFLGDESTACADO.AsInteger;
            vItens[0].TxJuros          := rSaldoDev.fTxJurosAnt;
            vItens[0].ValorBase        := rSaldoDev.fSaldoDevAnt;

            // -------------------------------------------------------------------------------------

            CalcEmptmo.GravaMovEmptmo(rContrato,
                                      vItens,
                                      qryBuscaItemITCEVENTO.AsInteger,
                                      rSaldoDev.iParcelaAnt,
                                      vItens[0].AnoCompetencia,
                                      vItens[0].MesCompetencia,
                                      vItens[0].AnoCobranca,
                                      vItens[0].MesCobranca,
                                      rSaldoDev.iParcRestaAnt,
                                      vItens[0].DataPrevista,
                                      vItens[0].DataPrevista,  // vItens[0].DataUltAtualiza,
                                      '',
                                      '',
                                      False
                                     );

            qryResult.Insert;
            qryResultIDCONTRATOEMPTMO.AsFloat := rContrato.IDContratoEmptmo;
            qryResultMUTUARIO.AsString        := qryContratosNOME.AsString;
            qryResultMATRICULA.AsString       := qryContratosMATRICULA.AsString;
            qryResultVALOR.AsCurrency         := vItens[0].Valor;
            qryResult.Post;

         end;

         Next;
      end;

      First;
      while not(EOF) do
      begin
         try
            LimpaParametros(qryInsertPeriodo);
            qryInsertPeriodo.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryContratosIDTipoContrEmptmo.AsInteger;
            qryInsertPeriodo.ParamByName('PPERIODOINICIAL').AsString     := FormatFloat('0000', Trunc(dbSpnAnoIni.Value)) + FormatFloat('00', cboMesIni.ItemIndex + 1);
            qryInsertPeriodo.ParamByName('PPERIODOFINAL').AsString       := FormatFloat('0000', Trunc(dbSpnAnoFim.Value)) + FormatFloat('00', cboMesFim.ItemIndex + 1);
            qryInsertPeriodo.ParamByName('PMESCOBRANCA').AsString        := FormatFloat('0000', Trunc(SpnAnoCob.Value)) + FormatFloat('00', cboMesCob.ItemIndex + 1);
            qryInsertPeriodo.ExecSql;
         except
         end;

         Next;
      end;

      Close;
      EscondeFormProgresso;
   end;

   ntbCalculo.PageIndex   := 0;
   bbtnAplicar.Enabled    := True;
   bbtnConfirmar.Enabled  := False;

   Repaint;
end;



function TfrmExecCalculaSegCompl.SelecionaContratos : String;
var
  sSql : String;
begin
   sSql :=
   'SELECT '                                                                        + #13 +
   '   CON.IDCONTRATOEMPTMO, '                                                      + #13 +
   '   PES.NOME, '                                                                  + #13 +
   '   DEP.MATRICULA, '                                                             + #13 +

   '   CON.IDCONTRQUITACAO, TC.IDTIPOEMPTMO, '                                      + #13 +
   '   CON.IDINSCRICAOEMPTMO, CON.IDTIPOCONTREMPTMO, '                              + #13 +

   '   CON.IDPATRO, CON.IDPLANOPREV, CON.IDVERBA, '                                 + #13 +
   '   CON.IDPESSOA, CON.IDBENEF, '                                                 + #13 +

   '   CON.FLGSITUACAO, CON.FLGFORMAREC, CON.FLGFORMAPAG, '                         + #13 +
   '   CON.CODFORMAPAG, CON.PORTFORMAREC, CON.PORTFORMAPAG, '                       + #13 +
   '   CON.IDCBANCARIA, '                                                           + #13 +

   '   CON.DATAASSINATURA, CON.DATASITUACAO, '                                      + #13 +
   '   CON.DATACREDITO, CON.DATAPRIMPARC, '                                         + #13 +
   '   CON.DATACANC, CON.MOECODIGO, M.MOESIGLA, '                                   + #13 +

   '   CON.VLRCONTRATO, CON.VLRPARCELA, CON.TXJUROS, '                              + #13 +
   '   CON.NUMPARCELAS, '                                                           + #13 +

   '   TC.IDREGRAJURCONC, '                                                         + #13 +
   '   TC.IDREGRALIMITES, '                                                         + #13 +
   '   TC.IDREGRASUSPCOBR, '                                                        + #13 +
   '   TC.IDREGRASLDDIA, '                                                          + #13 +
   '   TC.IDREGRAJURANTCONC, '                                                      + #13 +
   '   TC.IDREGRAELEG, '                                                            + #13 +
   '   TC.IDREGRARESERVA, '                                                         + #13 +
   '   TC.IDREGRAMARGEM, '                                                          + #13 +
   '   TC.IDREGRAPRAZOSCONC, '                                                      + #13 +

   '   I.DATAINSC, '                                                                + #13 +
   '   SIT.IDSITPART, SIT.FLGINTERNO '                                              + #13 +
   'FROM '                                                                          + #13 +
   '   INSCRICAOEMPTMO I, '                                                         + #13 +
   '   CONTRATOEMPTMO  CON, '                                                       + #13 +
   '   PARTPREVPLAN    PPP, '                                                       + #13 +
   '   MOEDA           M, '                                                         + #13 +
   '   TIPOCONTREMPTMO TC, '                                                        + #13 +
   '   TIPOEMPTMO      TE,  '                                                       + #13 +
   '   SITPART         SIT, '                                                       + #13 +
   '   PESSOA          PES, '                                                       + #13 +
   '   DEPENTIT        DEP '                                                        + #13 +
   // ----------------------------------------------------------------------------------------------

   'WHERE ' + #13 +

   '       ( CON.FLGSITUACAO       IN (''A'', ''E'', ''J'') ) '                     + #13;

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND CON.IDCONTRATOEMPTMO      = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)   + #13;

   sSQL := sSQL +
   '   AND ( CON.IDTIPOCONTREMPTMO IN (' + MolListaTipoContr1.PegaTipo + ') ) '     + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO  IN (' + MolListaTipoContr1.PegaTipo + ') ) '     + #13 +
   '   AND ( TE.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa) + ' ) '        + #13 +

   '   AND ( CON.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                       + #13 +
   '   AND ( TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO ) '                            + #13 +
   '   AND ( PES.IDPESSOA          = CON.IDBENEF ) '                                + #13 +
   '   AND ( DEP.IDTITULAR         = CON.IDPESSOA ) '                               + #13 +
   '   AND ( DEP.IDPESSOA          = CON.IDBENEF ) '                                + #13 +
   '   AND ( CON.IDPESSOA          = PPP.IDPESSOA )'                                + #13 +
   '   AND ( PPP.IDSITPART         = SIT.IDSITPART ) '                              + #13 +
   '   AND ( CON.IDINSCRICAOEMPTMO = I.IDINSCRICAOEMPTMO(+) ) '                     + #13 +

   '   AND PPP.FLGDESATIVADO       = 0 '                                            + #13 +

   '   AND ( CON.MOECODIGO         = M.MOECODIGO(+) ) ';

   Result := sSql;
end;



procedure TfrmExecCalculaSegCompl.bbtnAplicarClick(Sender: TObject);
begin
   inherited;
   
   if UFuncoesEmptmo.bBuscaMutuario then
      begin
         MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                           'O usuário é o próprio mutuário do '+
                           'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
         Abort;
      end;


   if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
end;



procedure TfrmExecCalculaSegCompl.bbtnSairClick(Sender: TObject);
begin
   if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
   inherited;
end;



procedure TfrmExecCalculaSegCompl.FormCreate(Sender: TObject);
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



procedure TfrmExecCalculaSegCompl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;   // André Pontes - 03/06/2005 - pendência 19404
   UFuncoesEmptmo.bBuscaMutuario := false;
   inherited;
end;

procedure TfrmExecCalculaSegCompl.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnBuscaContratoClick(Sender);

end;

end.
