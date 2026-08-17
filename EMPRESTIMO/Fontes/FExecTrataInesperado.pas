{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecTrataInesperado;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel,
   ComCtrls, ExtCtrls, mListaPlano, mListaPatro, wwdblook, mContratoEmptmo,
   Mask, wwdbedit, Wwdbspin, Db, DBTables, Wwquery, Grids, Wwdbigrd,
   Wwdbgrid, Wwdatsrc, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,

   uTypesEmptmo,

   CMDateTimePicker;

type
   TOperacao         = (ttAbateIncorpora, ttCobraDevolve);
   TProventoDesconto = (ttProvento, ttDesconto);

   TNovosDados = record
      IDItemEmptmo   : Int64;
      ValorPrevisto  : Currency;
      ValorEfetivo   : Currency;
      DataEfetiva    : TDateTime;
      DataPrevista   : TDateTime;
      DataVencto     : TDateTime;
      FlgDivergPend  : Integer;
      FlgBaixado     : Integer;
      FlgEnvio       : Integer;
      AnoCompetencia : Integer;
      MesCompetencia : Integer;
      AnoCobranca    : Integer;
      MesCobranca    : Integer;
      IDRubrica      : Int64;
      FlgTipoDiverg  : Integer;
      SeqCobranca    : Integer;
      FormaCoranca   : String;
      TipoFolha      : String;
   end;

   TfrmExecTrataInesperado = class(TfrmWizardMTEP)
      Label2: TLabel;
      Label3: TLabel;
      Panel3: TPanel;
      Label1: TLabel;
      chkCobranca: TCheckBox;
      DBspnAnoCobranca: TwwDBSpinEdit;
      cboMesCobranca: TComboBox;
      GroupBox1: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      rdgOrdenacao: TRadioGroup;
      molContratoEmptmo: TmolContratoEmptmo;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      molListaPlano: TmolListaPlano;
      qryTmpDesc: TwwQuery;
      TabSheet3: TTabSheet;
      Panel2: TPanel;
      memResult: TMemo;
      DBgrdTmpDesc: TwwDBGrid;
      Panel4: TPanel;
      edtHoraEncerra: TCMDateTimePicker;
      lblHoraEncerra: TLabel;
      Label4: TLabel;
      edtDataVencto: TCMDateTimePicker;
      qryBuscaParcela: TwwQuery;
      qryBuscaParcelaIDITEMEMPTMO: TFloatField;
      qryBuscaParcelaHMEPARCELA: TFloatField;
      qryBuscaParcelaHMENUMPARCELAS: TFloatField;
      qryBuscaParcelaHMECENTRALIZA: TFloatField;
      qryBuscaParcelaHMEDESTACADO: TFloatField;
      qryBuscaParcelaHMESALDODEV: TFloatField;
      qryRubrica: TwwQuery;
      dtsTmpDesc: TwwDataSource;
      updTmpDesc: TUpdateSQL;
      qrySituacaoContrato: TwwQuery;
      qrySituacaoContratoFLGSITUACAO: TStringField;
      qryUpdateSituacao: TwwQuery;
      Bevel1: TBevel;
      edtVlrCobraDevolve: TEdit;
      edtVlrAbateIncorpora: TEdit;
      Label5: TLabel;
      Label7: TLabel;
      qryTmpDescFLGDEVOLVE: TFloatField;
      qryTmpDescFLGINCORPORA: TFloatField;
      qryTmpDescMESCOBRANCA: TStringField;
      qryTmpDescMESREFERENCIA: TStringField;
      qryTmpDescFLGDESCFOLHA: TStringField;
      qryTmpDescSITENVIO: TStringField;
      qryTmpDescIDDESCONTO: TFloatField;
      qryTmpDescORDEM: TFloatField;
      qryTmpDescVALOR: TFloatField;
      qryTmpDescVALORRECEBIDO: TFloatField;
      qryTmpDescDATARECEBIMENTO: TDateTimeField;
      qryTmpDescFLGTIPODESC: TStringField;
      qryTmpDescFLGATRASODEVOL: TStringField;
      qryTmpDescIDPROVENTO: TFloatField;
      qryTmpDescCODPROVDESC: TStringField;
      qryTmpDescMATRICULA: TStringField;
      qryTmpDescINSCRICAONUMERO: TFloatField;
      qryTmpDescIDTITULAR: TFloatField;
      qryTmpDescIDPESSOA: TFloatField;
      qryTmpDescIDPESSJUR: TFloatField;
      qryTmpDescIDPLANOPREV: TFloatField;
      qryTmpDescIDLOTE: TFloatField;
      qryTmpDescLOTEPREVIA: TFloatField;
      qryTmpDescNUMPRIORIDADE: TFloatField;
      qryTmpDescDESCRICAO: TStringField;
      qryTmpDescDATAREFERENCIA: TDateTimeField;
      qryTmpDescREFERENCIA: TStringField;
      qryTmpDescDATACOBRANCA: TDateTimeField;
      qryTmpDescFLGDESCONTO: TFloatField;
      qryTmpDescRECPAG: TStringField;
      qryTmpDescIDMODULO: TFloatField;
      qryTmpDescSISTORIGEM: TStringField;
      qryTmpDescIDMOTIVO: TFloatField;
      qryTmpDescIDEMPRESAPROP: TFloatField;
      qryTmpDescIDEMPRESA: TFloatField;
      qryTmpDescIDFUNDACAO: TFloatField;
      qryTmpDescSEQPROPOSTA: TFloatField;
      qryTmpDescNODOCUMENTO: TFloatField;
      qryTmpDescCOMPLDOCUMENTO: TStringField;
      qryTmpDescFLGSITUACAO: TStringField;
      qryTmpDescIDTIPOCONTREMPTMO: TFloatField;
      qryTmpDescNOME: TStringField;
      qryTmpDescIDTMPDESC: TFloatField;

      procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
      procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
      procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboTipoEmptmoExit(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);


   private  // Private declarations

      function  VerificaPreenchimento: Boolean;
      procedure MontaSQL;
      procedure AbreQueries;

      procedure RecebimentoTMPDESC;
      function  RecebeParcelaTmpDesc: Currency;

      procedure InsereInesperado(const IDContrato     : Extended;
                                 const IDTipoContr    : Int64;
                                 const fVlrInserir    : Currency;
                                 const dData          : TDateTime;
                                 const sFormaCobranca : String;
                                 const sTipoFolha     : String;
                                 const tOperacao      : TOperacao;
                                 const tProvDesc      : TProventoDesconto
                                );


   public   // Public declarations

   end;



var
  frmExecTrataInesperado: TfrmExecTrataInesperado;



implementation
{$R *.DFM}
uses
   dEmptmo, DLookEmptmo, uSistema, uDiasUteis, uFuncoesEmptmo, uVerificaPreenchimento, uMensErro,
   uDataBase, uCalcEmptmo, FProgresso, dBaseDados, dAtualizacaoDiaria, uIntegraEmptmo;




function TfrmExecTrataInesperado.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
      if not(chkCobranca.Checked) then
      begin
         if MsgDlg('Não foi indicado o Mês de Cobrança. ' + #13 + 'Deseja prosseguir?',
                   'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
      end
      else
      begin
         if cboMesCobranca.ItemIndex < 0 then
            raise EValidacao.CreateVal('É necessário indicar o Mês de Cobrança!', cboMesCobranca);

         if DBspnAnoCobranca.Value <= 1980 then
            raise EValidacao.CreateVal('É necessário indicar o Ano de Cobrança!', DBspnAnoCobranca);
      end;


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



procedure TfrmExecTrataInesperado.MontaSQL;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   0 AS FLGDEVOLVE, '                                                                          + #13 +
   '   0 AS FLGINCORPORA, '                                                                        + #13 +
   '   TMP.IDTMPDESC, '                                                                            + #13 +
   '   TMP.MESCOBRANCA, TMP.MESREFERENCIA, '                                                       + #13 +
   '   TMP.FLGDESCFOLHA, '                                                                         + #13 +
   '   TMP.SITENVIO, '                                                                             + #13 +
   '   TMP.IDDESCONTO, '                                                                           + #13 +
   '   TMP.ORDEM, '                                                                                + #13 +

   '   ROUND(NVL(TMP.VALOR, 0), 2)         AS VALOR, '                                             + #13 +
   '   ROUND(NVL(TMP.VALORRECEBIDO, 0), 2) AS VALORRECEBIDO, '                                     + #13 +
   '   TMP.DATARECEBIMENTO, '                                                                      + #13 +

   '   TMP.FLGTIPODESC, '                                                                          + #13 +
   '   TMP.FLGATRASODEVOL, '                                                                       + #13 +

   '   TMP.IDPROVENTO, TMP.CODPROVDESC, '                                                          + #13 +

   '   TMP.MATRICULA, TMP.INSCRICAONUMERO, '                                                       + #13 +
   '   TMP.IDTITULAR, TMP.IDPESSOA, '                                                              + #13 +

   '   TMP.IDPESSJUR, TMP.IDPLANOPREV, '                                                           + #13 +
   '   TMP.IDLOTE, '                                                                               + #13 +
   '   TMP.LOTEPREVIA, '                                                                           + #13 +

   '   TMP.NUMPRIORIDADE, '                                                                        + #13 +
   '   TMP.DESCRICAO, '                                                                            + #13 +

   '   TMP.DATAREFERENCIA, TMP.REFERENCIA, '                                                       + #13 +
   '   TMP.DATACOBRANCA, '                                                                         + #13 +
   '   TMP.FLGDESCONTO, '                                                                          + #13 +

   '   TMP.RECPAG, '                                                                               + #13 +
   '   TMP.IDMODULO, '                                                                             + #13 +
   '   TMP.SISTORIGEM, '                                                                           + #13 +
   '   TMP.IDMOTIVO, '                                                                             + #13 +
   '   TMP.IDEMPRESAPROP, '                                                                        + #13 +
   '   TMP.IDEMPRESA, '                                                                            + #13 +
   '   TMP.IDFUNDACAO, '                                                                           + #13 +

   '   TMP.SEQPROPOSTA, '                                                                          + #13 +
   '   TMP.NODOCUMENTO, TMP.COMPLDOCUMENTO, '                                                      + #13 +

   '   CON.FLGSITUACAO, '                                                                          + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                                                    + #13 +
   '   PES.NOME '                                                                                  + #13 +

   'FROM '                                                                                         + #13 +
   '   TMPDESC         TMP, '                                                                      + #13 +
   '   PESSOA          PES, '                                                                      + #13 +
   '   CONTRATOEMPTMO  CON, '                                                                      + #13 +
   '   TIPOCONTREMPTMO TCE, '                                                                      + #13 +
   '   TIPOEMPTMO      TEP '                                                                       + #13 +

   'WHERE '                                                                                        + #13 +
   '       TMP.IDEMPRESAPROP      = ' + IntToStr(Sistema.IDEmpresa)                                + #13 +
   '   AND TMP.IDMODULO           IN (15, 32) '                                                    + #13 +
   '   AND TMP.VALORRECEBIDO      IS NOT NULL '                                                    + #13 +
   '   AND TMP.FLGTIPODESC        = ''E'' '                                                        + #13 +
   '   AND RTRIM(TMP.MESCOBRANCA) = ' + QuotedStr(FormatFloat('0000', DBspnAnoCobranca.Value) +
                                        '/' + FormatFloat('00', cboMesCobranca.ItemIndex + 1))     + #13 +
   '   AND TMP.IDHISTMOVEMPTMO   IS NULL '                                                         + #13;

   if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
   begin
      if not((chkFolhaPatro.Checked) and (chkFolhaBenef.Checked)) then
      begin
         if chkFolhaPatro.Checked then sSQL := sSQL + '   AND TMP.FLGDESCFOLHA       = ''P'' '     + #13;
         if chkFolhaBenef.Checked then sSQL := sSQL + '   AND TMP.FLGDESCFOLHA       = ''B'' '     + #13;
      end;
   end;

   if DBcboTipoEmptmo.LookupValue <> '' then sSQL := sSQL +
   //Pendência 27205 - 09/01/2007
   //'   AND CON.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                                + #13;
   '   AND TEP.IDTIPOEMPTMO       = ' + DBcboTipoEmptmo.LookupValue                                + #13;

   if DBcboTipoContrato.LookupValue <> '' then sSQL := sSQL +
   //'   AND CON.IDTIPOEMPTMO       = ' + DBcboTipoContrato.LookupValue                              + #13;
   '   AND CON.IDTIPOCONTREMPTMO  = ' + DBcboTipoContrato.LookupValue                              + #13;
   //Fim Pendência 27205

   if molContratoEmptmo.IDContrato > 0 then sSQL := sSQL +
   '   AND TMP.IDDESCONTO         = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13 +
   '   AND CON.IDCONTRATOEMPTMO   = ' + FormatFloat('#0', molContratoEmptmo.IDContrato)            + #13;

   sSQL := sSQL +
   '   AND CON.IDPATRO           IN (' + molListaPatro.PegaPatro + ') '                            + #13 +
   '   AND TMP.IDPESSJUR         IN (' + molListaPatro.PegaPatro + ') '                            + #13 +

   '   AND CON.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                            + #13 +
   '   AND TMP.IDPLANOPREV       IN (' + molListaPlano.PegaPlano + ') '                            + #13 +

   '   AND TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO '                                         + #13 +
   '   AND TMP.IDPESSOA           = PES.IDPESSOA '                                                 + #13 +
   '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO '                                        + #13 +
   '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '                                             + #13 +

   'ORDER BY '                                                                                     + #13;

   case rdgOrdenacao.ItemIndex of
      0: sSQL := sSQL + '   PES.NOME, TMP.IDDESCONTO, TMP.MESREFERENCIA, TMP.IDPROVENTO ';
      1: sSQL := sSQL + '   TMP.MATRICULA, TMP.IDDESCONTO, TMP.MESCOBRANCA, TMP.MESREFERENCIA, TMP.IDPROVENTO ';
      2: sSQL := sSQL + '   TMP.IDDESCONTO, TMP.MESCOBRANCA, TMP.MESREFERENCIA, TMP.IDPROVENTO ';
   end;

   qryTmpDesc.SQL.Text := sSQL;
end;



procedure TfrmExecTrataInesperado.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



procedure TfrmExecTrataInesperado.RecebimentoTMPDESC;
var
   iContador            : Integer;
   sContrato            : String;
   sValorCobraDevolve   : String;
   sValorAbateIncorpora : String;
   fValor               : Currency;
   fTotalCobraDevolve   : Currency;
   fTotalAbateIncorpora : Currency;
begin
   fTotalCobraDevolve   := 0;
   fTotalAbateIncorpora := 0;

   try
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
      begin
         frmProgresso.MostraFormProgresso('Processando... ',
                                          True,
                                          True,
                                          True,
                                          0,
                                          qryTmpDesc.RecordCount
                                         );
         iContador   := 0;
         qryTmpDesc.First;
         // ----------------------------------------------------------------------------------------

         memResult.Lines.Add('                     Valor a              Valor a             ');
         memResult.Lines.Add('Contrato             Cobrar/Devolver      Abater/Incorporar   ');
         memResult.Lines.Add('-------------------- -------------------- --------------------');

         while not(qryTmpDesc.EOF) do
         begin
            if frmProgresso.Cancelou then Break; // interrompeu o processo

            if (qryTmpDescFLGDEVOLVE.AsInteger = 1) or (qryTmpDescFLGINCORPORA.AsInteger = 1) then
            begin
               try
                  if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

                  fValor := RecebeParcelaTmpDesc;

                  // -------------------------------------------------------------------------------------
                  //    Acerto da situação do Contrato
                  // -------------------------------------------------------------------------------------
                  CalcEmptmo.AcertaSituacaoContratual(qryTmpDescIDDESCONTO.AsFloat);
                  // -------------------------------------------------------------------------------------
                  //    FIM Acerto da situação do Contrato
                  // -------------------------------------------------------------------------------------

                  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
               except
                  if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
               end;

               sContrato := FormatFloat('#0', qryTmpDescIDDESCONTO.AsFloat);
               sContrato := CompletaInicio(sContrato, ' ', 20);

               // Totalizadores
               if qryTmpDescFLGDEVOLVE.AsInteger = 1 then
               begin
                  sValorCobraDevolve   := FormatFloat('#,#0.00', fValor);
                  sValorCobraDevolve   := CompletaInicio(sValorCobraDevolve, ' ', 20);
                  fTotalCobraDevolve   := fTotalCobraDevolve + fValor;

                  sValorAbateIncorpora := FormatFloat('#,#0.00', 0);
                  sValorAbateIncorpora := CompletaInicio(sValorAbateIncorpora, ' ', 20);

               end;

               if qryTmpDescFLGINCORPORA.AsInteger = 1 then
               begin
                  sValorAbateIncorpora := FormatFloat('#,#0.00', fValor);
                  sValorAbateIncorpora := CompletaInicio(sValorAbateIncorpora, ' ', 20);
                  fTotalAbateIncorpora := fTotalAbateIncorpora + fValor;

                  sValorCobraDevolve   := FormatFloat('#,#0.00', 0);
                  sValorCobraDevolve   := CompletaInicio(sValorCobraDevolve, ' ', 20);
               end;

            end;  // if (qryTmpDescFLGDEVOLVE.AsInteger = 1) or (qryTmpDescFLGINCORPORA.AsInteger = 1)

            memResult.Lines.Add(sContrato + ' ' + sValorCobraDevolve + ' ' + sValorAbateIncorpora);

            inc(iContador);
            frmProgresso.AndaFormProgresso(iContador);

            qryTmpDesc.Next;
         end;  // while not(EOF)

         memResult.Lines.Add('                     -------------------- --------------------');

         memResult.Lines.Add('                     ' +
                             CompletaInicio(FormatFloat('#,#0.00', fTotalCobraDevolve), ' ', 20) + ' ' +
                             CompletaInicio(FormatFloat('#,#0.00', fTotalAbateIncorpora), ' ', 20)
                            );

         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
   finally
      frmProgresso.EscondeFormProgresso;

      qryTmpDesc.Close;
   end;
end;



// Executa o recebimento de uma Parcela de Emprestimo enviada para TMPDESC
function TfrmExecTrataInesperado.RecebeParcelaTmpDesc: Currency;
var
   NovosDadosParcela                : TNovosDados;

   IDTmpDesc, IDHistMov, IDContrato : Extended;
   IDMutuario, IDRubrica            : Int64;

   iPlanilha, iDocumento            : Int64;

   fVlrPrevisto, fVlrEfetivo        : Currency;
   fVlrPrevistoHist                 : Currency;
   fDiferenca                       : Currency;

   bInesperado, bNaoProgramado      : Boolean;
   bBaixado                         : Boolean;
   bDivergente, bDivergTrat         : Boolean;

   iEvento, iTipoDiverg             : Integer;

   dDataEfetiva, dDataRecebimento   : TDateTime;

   sMsg                             : String;
   sSituacaoContrato                : String;
   sMesCobranca, sMesReferencia     : String;
   sTipoFolha                       : String;

   iAnoCobranca, iAnoCompetencia    : Integer;
   iMescobranca, iMesCompetencia    : Integer;
begin
   // ----------------------------------------------------------------------------------------------

   // Guarda os dados
   IDTmpDesc         := qryTmpDescIDTMPDESC.AsFloat;
   IDContrato        := qryTmpDescIDDESCONTO.AsFloat;
   IDMutuario        := qryTmpDescIDPESSOA.AsInteger;

   sMesCobranca      := qryTmpDescMESCOBRANCA.AsString;
   iAnoCobranca      := StrToInt(Copy(sMesCobranca, 1, 4));
   iMesCobranca      := StrToInt(Copy(sMesCobranca, 6, 2));

   sMesReferencia    := qryTmpDescMESREFERENCIA.AsString;
   iAnoCompetencia   := StrToInt(Copy(sMesReferencia, 1, 4));
   iMesCompetencia   := StrToInt(Copy(sMesReferencia, 6, 2));

   IDRubrica         := qryTmpDescIDPROVENTO.AsInteger;

   fVlrPrevisto      := Arredonda(qryTmpDescVALOR.AsCurrency, 2);
   fVlrEfetivo       := Arredonda(qryTmpDescVALORRECEBIDO.AsCurrency, 2);

   dDataRecebimento  := qryTmpDescDATARECEBIMENTO.AsDateTime;

   sSituacaoContrato := qryTmpDescFLGSITUACAO.AsString;

   sTipoFolha        := qryTmpDescFLGDESCFOLHA.AsString;

   iTipoDiverg       := -1;
   bDivergente       := False;
   bDivergTrat       := False;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if qryTmpDescFLGDEVOLVE.AsInteger = 1 then
   begin
      // ----------------------------------------------------------------------------------------
      //    Tratamento de devolução / cobrança
      // ----------------------------------------------------------------------------------------

      if qryTmpDescFLGDESCONTO.AsInteger = 0 then
      begin
         // -------------------------------------------------------------------------------------
         //    Provento (cobrar)
         // -------------------------------------------------------------------------------------
         InsereInesperado(qryTmpDescIDDESCONTO.AsFloat,
                          qryTmpDescIDTIPOCONTREMPTMO.AsInteger,
                          qryTmpDescVALORRECEBIDO.AsCurrency,
                          qryTmpDescDATARECEBIMENTO.AsDateTime,
                          'F',
                          sTipoFolha,
                          ttCobraDevolve,
                          ttProvento
                         );
         // -------------------------------------------------------------------------------------
         //    FIM Provento (cobrar)
         // -------------------------------------------------------------------------------------
      end
      else
      begin
         if qryTmpDescFLGDESCONTO.AsInteger = 1 then
         begin
            // ----------------------------------------------------------------------------------
            //    Desconto (devolver)
            // ----------------------------------------------------------------------------------
            InsereInesperado(qryTmpDescIDDESCONTO.AsFloat,
                             qryTmpDescIDTIPOCONTREMPTMO.AsInteger,
                             qryTmpDescVALORRECEBIDO.AsCurrency,
                             qryTmpDescDATARECEBIMENTO.AsDateTime,
                             'F',
                             sTipoFolha,
                             ttCobraDevolve,
                             ttDesconto
                            );
            // ----------------------------------------------------------------------------------
            //    FIM Desconto (devolver)
            // ----------------------------------------------------------------------------------
         end;
      end;
      // ----------------------------------------------------------------------------------------
      //    FIM Tratamento de devolução / cobrança
      // ----------------------------------------------------------------------------------------
   end
   else
   begin
      if qryTmpDescFLGINCORPORA.AsInteger = 1 then
      begin
         // ----------------------------------------------------------------------------------------
         //    Tratamento de incorporação / abatimento
         // ----------------------------------------------------------------------------------------

         if qryTmpDescFLGDESCONTO.AsInteger = 0 then
         begin
            // -------------------------------------------------------------------------------------
            //    Provento (incorporar)
            // -------------------------------------------------------------------------------------
            InsereInesperado(qryTmpDescIDDESCONTO.AsFloat,
                             qryTmpDescIDTIPOCONTREMPTMO.AsInteger,
                             qryTmpDescVALORRECEBIDO.AsCurrency,
                             qryTmpDescDATARECEBIMENTO.AsDateTime,
                             'F',
                             sTipoFolha,
                             ttAbateIncorpora,
                             ttProvento
                            );
            // -------------------------------------------------------------------------------------
            //    FIM Provento (incorporar)
            // -------------------------------------------------------------------------------------
         end
         else
         begin
            if qryTmpDescFLGDESCONTO.AsInteger = 1 then
            begin
               // ----------------------------------------------------------------------------------
               //    Desconto (abater)
               // ----------------------------------------------------------------------------------
               InsereInesperado(qryTmpDescIDDESCONTO.AsFloat,
                                qryTmpDescIDTIPOCONTREMPTMO.AsInteger,
                                qryTmpDescVALORRECEBIDO.AsCurrency,
                                qryTmpDescDATARECEBIMENTO.AsDateTime,
                                'F',
                                sTipoFolha,
                                ttAbateIncorpora,
                                ttDesconto
                               );
               // ----------------------------------------------------------------------------------
               //    FIM Desconto (abater)
               // ----------------------------------------------------------------------------------
            end;
         end;

         // ----------------------------------------------------------------------------------------
         //    FIM Tratamento de incorporação / abatimento
         // ----------------------------------------------------------------------------------------
      end;
   end;

   IntegraEmptmo.MarcaBaixaTMPDESC(IDTmpdesc);

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   Result := fVlrEfetivo;
end;



procedure TfrmExecTrataInesperado.InsereInesperado(const IDContrato     : Extended;
                                                   const IDTipoContr    : Int64;
                                                   const fVlrInserir    : Currency;
                                                   const dData          : TDateTime;
                                                   const sFormaCobranca : String;
                                                   const sTipoFolha     : String;
                                                   const tOperacao      : TOperacao;
                                                   const tProvDesc      : TProventoDesconto
                                                  );
var
   rItem             : TItemRecDep;
   rContrato         : TDadosContrato;
   IDHistMovEmptmo   : Extended;
   rSaldoDevAnt      : TSaldoDevAnt;
   dDataAtuDia       : TDateTime;
begin
   // *******************************************************************************************
   //
   // Não dá para usar a InserDiferencaHist pq a função se baseia em uma linha pré-exixtente
   // da HistMovEmptmo. Como se está querendo inserir um registro totalmente novo, é necessário
   // inicializar TODOS os campos necessários.
   //
   // Serão necessários também DOIS inserts na HistMovEmptmo:
   //    - o recebimento inesperado (baixado);
   //    - a devolução do valor inesperado (previsto);
   //
   // *******************************************************************************************

   LimpaRegistro(rItem);
   LimpaRegistroContrato(rContrato);

   rContrato.IDContratoEmptmo := IDContrato;

   // Busca o item para gravar na HISTMOVEMPTMO
   with qryBuscaParcela do
   begin
      LimpaParametros(qryBuscaParcela);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := IDContrato;
      Open;
   end;


   // ----------------------------------------------------------------------------------------------
   //    Se for abatimento/incorporação, precisa atualizar até a data
   // ----------------------------------------------------------------------------------------------
   if tOperacao = ttAbateIncorpora then
   begin
      dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(IDContrato, dData);

      if dDataAtuDia < dData then
      begin
         dtmAtualizacaoDiaria.ExecutaAtuDia(IDContrato,     // Contrato
                                            Sistema.IDModulo,
                                            -1,             // Tipo Contr
                                            -1,             // Tipo Emptmo
                                            -1,             // Patro
                                            -1,             // Plano
                                            1,              // Estorno
                                            0,              // Prov Perda
                                            1,              // Atu Saldo
                                            -1,             // In Arquivo
                                            -1,             // Not In Arquivo
                                            dDataAtuDia,    // Data Ini
                                            dData,          // Data Fim
                                            dDataAtuDia - 1 // Data Considera
                                           );
      end;  // if dDataAtuDia < qryHMEDATAPREVISTA.AsDateTime
   end;
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   // Busca o Saldo Devedor no dia
   rSaldoDevAnt         := CalcEmptmo.SaldoDevAnt(rContrato.IDContratoEmptmo,
                                                  dData,
                                                  -1,
                                                  -1
                                                 );
   // ----------------------------------------------------------------------------------------------


   // ----------------------------------------------------------------------------------------------
   case tOperacao of

      ttCobraDevolve  : rItem.CodigoItem := dtmEmptmo.qryParamEmptmoIDITEMINESPERADO.AsInteger;

      ttAbateIncorpora:
      begin
         case tProvDesc of
            ttProvento  : rItem.CodigoItem := dtmEmptmo.qryParamEmptmoIDITEMSLDMAIS.AsInteger;
            ttDesconto  : rItem.CodigoItem := dtmEmptmo.qryParamEmptmoIDITEMSLDMENOS.AsInteger;
         end;
      end;

   end;
   // ----------------------------------------------------------------------------------------------

   // preenche os outros campos necessários
   rItem.Parcela        := qryBuscaParcelaHMEPARCELA.AsInteger;
   rItem.ParcResta      := qryBuscaParcelaHMENUMPARCELAS.AsInteger;

   rItem.iEvento        := 7;    //

   rItem.FlgEnvio       := -1;
   rItem.FlgBaixado     := -1;

   if tOperacao = ttCobraDevolve then rItem.RecPag := 'R';

   rItem.FormaCobranca  := sFormaCobranca;
   rItem.TipoFolha      := sTipoFolha;
   rItem.Origem         := 14;   // Tratamento de valores não programados
   rItem.SeqCobranca    := 1;
   rItem.FlgTipoDiverg  := 2;    // Recebimento Inesperado

   rItem.AnoCompetencia := trunc(DBspnAnoCobranca.Value);
   rItem.MesCompetencia := (cboMesCobranca.ItemIndex + 1);
   rItem.AnoCobranca    := trunc(DBspnAnoCobranca.Value);
   rItem.MesCobranca    := (cboMesCobranca.ItemIndex + 1);

   rItem.FlgCentraliza  := 1; // qryBuscaParcelaHMECENTRALIZA.AsInteger;
   rItem.FlgDestacado   := 0; // qryBuscaParcelaHMEDESTACADO.AsInteger;

//   rItem.Rubrica        := qryTmpDescIDPROVENTO.AsInteger;

   rItem.DataPrevista   := dData;
   rItem.DataVencto     := dData;
   rItem.DataEfetiva    := dData;
   rItem.DataReceb      := Sysdate;

   rItem.Valor          := 0;

   // ----------------------------------------------------------------------------------------------
   rItem.ValorEfetivo   := fVlrInserir;

   if (tOperacao = ttCobraDevolve) and (tProvDesc = ttProvento) then
   begin
      rItem.ValorEfetivo := rItem.ValorEfetivo * (-1);
   end;
   // ----------------------------------------------------------------------------------------------

   rItem.TxJuros        := rSaldoDevAnt.fTxJurosAnt;

   // ----------------------------------------------------------------------------------------------
   rItem.SaldoDevedor   := rSaldoDevAnt.fSaldoDevAnt;

   if tOperacao = ttAbateIncorpora then
   begin
      case tProvDesc of
         ttProvento  : rItem.SaldoDevedor := rItem.SaldoDevedor + rItem.ValorEfetivo;
         ttDesconto  : rItem.SaldoDevedor := rItem.SaldoDevedor - rItem.ValorEfetivo;
      end;
   end;
   // ----------------------------------------------------------------------------------------------

   // faz o insert
   CalcEmptmo.InsertMovEmptmo(rItem, rContrato);


   // ----------------------------------------------------------------------------------------------
   //    Se for abatimento/incorporação, precisa atualizar após a data também...
   // ----------------------------------------------------------------------------------------------
   if tOperacao = ttAbateIncorpora then
   begin
      dDataAtuDia := dtmAtualizacaoDiaria.UltimaAtuDia(IDContrato, -1);

      if dDataAtuDia > dData then
      begin
         dtmAtualizacaoDiaria.ExecutaAtuDia(IDContrato,     // Contrato
                                            Sistema.IDModulo, 
                                            -1,             // Tipo Contr
                                            -1,             // Tipo Emptmo
                                            -1,             // Patro
                                            -1,             // Plano
                                            1,              // Estorno
                                            0,              // Prov Perda
                                            1,              // Atu Saldo
                                            -1,             // In Arquivo
                                            -1,             // Not In Arquivo
                                            dData      ,    // Data Ini
                                            dDataAtuDia,    // Data Fim
                                            dData - 1       // Data Considera
                                           );
      end;  // if dDataAtuDia < qryHMEDATAPREVISTA.AsDateTime
   end;
   // ----------------------------------------------------------------------------------------------

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   if tOperacao = ttCobraDevolve then
   begin
      // aproveitando o registro (do item) que já foi preparado,
      // altera apenas os dados necessários

      rItem.RecPag         := 'P';
      rItem.SeqCobranca    := 3;

      rItem.FlgEnvio       := 0;
      rItem.FlgBaixado     := 0;

      rItem.Valor          := rItem.ValorEfetivo * (-1);
      rItem.ValorEfetivo   := 0;

      rItem.DataEfetiva    := 0;

      rItem.FlgDivergPend  := 1;

      // -------------------------------------------------------------------------------------------
      // no caso da FUNCEF, já prepara a devolução para D + 2 (útil)
      if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and (tOperacao = ttCobraDevolve) then
      begin
         rItem.DataVencto     := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IDEmpresa,
                                                                    (rItem.DataVencto + 1),
                                                                    True,
                                                                    True,
                                                                    False
                                                                   );

         if Time > StrToTime(FormatDateTime('hh:nn:ss', dtmEmptmo.qryParamEmptmoHORAENCERRA.AsDateTime)) then
         begin
            rItem.DataVencto  := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IDEmpresa,
                                                                    (rItem.DataVencto + 1),
                                                                    True,
                                                                    True,
                                                                    False
                                                                   );
         end
      end;
      // -------------------------------------------------------------------------------------------

      // faz o insert
      CalcEmptmo.InsertMovEmptmo(rItem, rContrato);
   end;

   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------
   // ----------------------------------------------------------------------------------------------

   qryBuscaParcela.Close;
end;



procedure TfrmExecTrataInesperado.molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnBuscaContratoClick(Sender);
end;



procedure TfrmExecTrataInesperado.molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   molContratoEmptmo.btnLimpaContratoClick(Sender);
end;



procedure TfrmExecTrataInesperado.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecTrataInesperado.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecTrataInesperado.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TfrmExecTrataInesperado.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



procedure TfrmExecTrataInesperado.FormShow(Sender: TObject);
begin
   inherited;

   // preenche a data de lançamento e o ano de referência/competência
   cboMesCobranca.ItemIndex   := DiasUteis.ExtraiMes(Date) - 1;
   DBspnAnoCobranca.Value     := DiasUteis.ExtraiAno(Date);

   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      lblHoraEncerra.Visible := True;
      edtHoraEncerra.Visible := True;
      edtHoraEncerra.Time    := StrToTime(dtmEmptmo.qryParamEmptmoHORAENCERRA.AsString);
   end;

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



procedure TfrmExecTrataInesperado.DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecTrataInesperado.DBcboTipoEmptmoExit(Sender: TObject);
begin
   inherited;

   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;



procedure TfrmExecTrataInesperado.btnContinuarClick(Sender: TObject);
var
   i              : Integer;
   iContador      : Integer;
   fVlrReceb      : Currency;
   fVlrRecebPatro : Currency;
   fVlrRecebTotal : Currency;
   sSQL           : String;
begin
   ParametrosSistema;

   case pgcControle.ActivePageIndex of

      0:
      begin
         if not(VerificaPreenchimento) then Exit;

         MontaSQL;
         qryTmpDesc.Open;

         inherited;
      end;

      1:
      begin
         if MsgDlg('Será iniciado o tratamento dos itens selecionados. ' + #13 + 'Deseja prosseguir?',
                'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
         Repaint;

         RecebimentoTmpDesc;

         MsgDlg('Tratamento finalizado.', 'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

         inherited;
      end;

   end;
end;



end.
