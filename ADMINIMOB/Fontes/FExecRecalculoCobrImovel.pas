unit FExecRecalculoCobrImovel;

//	-------------------------------------------------------------------------------------------------
//
//	   Reajuste de Cobranças em Atraso
//
//	Autor          :  Telma
//
//	Data de Início	:  18/07/2000
//	Data de Término:  19/07/2000
//
//	Modificações	:  19/07/2000  1) Alterações visuais no form (André Pontes)
//                   20/07/2000  2) Alteração no filtro do MontaSelect (Telma)
//                   02/08/2000  3) Alteração no parâmetro da qryCotacao (Telma)
//                   03/08/2000  4) Indicação do % de correção na grid (Telma)
//                               5) Ajuste nas colunas da grid (André)
//
//                            ? 15) Mais nova metodologia de Cálculo (ver abaixo) (Telma)
//                   15/08/2000 16) Alteração no layout das combos de alteradores
//
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Mais Nova metodologia de cálculo (a pedido do SERPROS)
//
//    1º) Tentar usar sempre o índice mais recente (até o mês corrente);
//    2º) Não existindo (por não estar cadastrado), usar o índice do mês de aplicação (+ correto !);
//
// -------------------------------------------------------------------------------------------------


interface

uses
  windows, Messages, sysutils, classes, graphics, controls, forms, dialogs,
  fokcancelar, grids, wwdbigrd, wwdbgrid, mask,
  wwdbedit, wwdbspin, wwdblook, ivdictio, ivmulti, ivemulti, mahlpbtn,
  buttons, tb97tlbr, tb97, extctrls, comctrls, db, wwdatsrc, dbtables,
  wwquery, MontaSelect, fcButton, fcImgBtn, fcShapeBtn, TREdit, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, FOkCancelarImob;

type
  TfrmExecRecalculoCobrImovel = class(TFrmOkCancelarImob)
    qrylookmoeda: twwquery;
    qrylookmoedamoesigla: tstringfield;
    qrylookmoedamoedesc: tstringfield;
    qrylookmoedamoecodigo: tfloatfield;
    qry: twwquery;
    ds: twwdatasource;
    qrySaldoDoc: TwwQuery;
    qryIndice: TwwQuery;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    qryCotacao: TwwQuery;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoCOTVALOR: TFloatField;
    qryCotacaoMOEDESC: TStringField;
    qryCotacaoMOESIGLA: TStringField;
    qryDataUltCorrecao: TwwQuery;
    qryLookAlterador: TwwQuery;
    qrySaldoDocSALDO: TFloatField;
    qryDataUltCorrecaoDATAULTCORRECAO: TDateTimeField;
    qryLookAlteradorCODALTERADOR: TFloatField;
    qryLookAlteradorDESCRICAO: TStringField;
    qryAux: TwwQuery;
    upd: TUpdateSQL;
    pgc: TPageControl;
    tbsParametros: TTabSheet;
    tbsResultado: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    chkCorrecao: TCheckBox;
    chkMesAnterior: TCheckBox;
    Panel3: TPanel;
    Label5: TLabel;
    edtNovaData: TCMDateTimePicker;
    DBgrdAlteradoresLanc: TwwDBGrid;
    btnExcluiAlterador: TBitBtn;
    Label11: TLabel;
    btnCalcula: TBitBtn;
    qryAlteradoresLanc: TwwQuery;
    dsAlteradoresLanc: TwwDataSource;
    qryAlteradoresLancCODDOCUMENTO: TFloatField;
    qryAlteradoresLancNUMLANCTO: TFloatField;
    qryAlteradoresLancCODALTERADOR: TFloatField;
    qryAlteradoresLancPLNCODIGO: TFloatField;
    qryAlteradoresLancDATALANCTO: TDateTimeField;
    qryAlteradoresLancVALOR: TFloatField;
    qryAlteradoresLancVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresLancDEBCRE: TStringField;
    qryAlteradoresLancOPERACAO: TStringField;
    qryAlteradoresLancHISTORICOCOMPL: TStringField;
    qryAlteradoresLancDESCRICAO: TStringField;
    tbsAlteradores: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    qryAchaHistCart: TwwQuery;
    qryApagaHistCart: TwwQuery;
    qryAchaHistCartIDHISTCARTINV: TFloatField;
    MontaSelectImovel: TMontaSelect;
    qryParametros: TwwQuery;
    qryParametrosIDIMOVELMESTRE: TFloatField;
    qryParametrosIDIMOVEL: TFloatField;
    qryParametrosIDPESSOA: TFloatField;
    qryParametrosIDMARCA: TFloatField;
    qryParametrosCODESTADO: TStringField;
    qryParametrosIDPAIS: TFloatField;
    qryParametrosIDADMINIMOVEL: TFloatField;
    qryParametrosFLGTIPOIMOVEL: TFloatField;
    qryParametrosIMODATACONSTRUCAO: TDateTimeField;
    qryParametrosIMOAREA: TFloatField;
    qryParametrosIMOFRACAOIDEAL: TFloatField;
    qryParametrosIMODESCRICAO: TMemoField;
    qryParametrosFLGSTATUSOCUPACAO: TStringField;
    qryParametrosQTDETOTALCOTAS: TFloatField;
    qryParametrosIMONOME: TStringField;
    qryParametrosIMONUMERO: TStringField;
    qryParametrosIMOCOMPLEMENTO: TStringField;
    qryParametrosIMOBAIRRO: TStringField;
    qryParametrosIMOCIDADE: TStringField;
    qryParametrosIMONOMEENDERECO: TStringField;
    qryParametrosIMOCEP: TStringField;
    qryParametrosCODSUBCONTA: TFloatField;
    qryParametrosIDCARTEIRAINVEST: TFloatField;
    qryParametrosCODTIPIMOVEL: TStringField;
    qryParametrosIDCIDADES: TFloatField;
    qryParametrosFLGATIVO: TFloatField;
    qryParametrosIMOPERCENTRATEIO: TFloatField;
    qryParametrosIMOMOEDACOMPRA: TFloatField;
    qryParametrosIMOVLRCOMPRA: TFloatField;
    qryParametrosIMODATACOMPRA: TDateTimeField;
    qryParametrosIMOMATRICULA: TStringField;
    qryParametrosIMOOBSERVACAO: TMemoField;
    qryParametrosIMODATAHABITESE: TDateTimeField;
    qryParametrosIDCARTORIO: TFloatField;
    qryParametrosFLGSTATUS: TStringField;
    qryParametrosIMOCODIGO: TStringField;
    DBcboIndiceCorrecao: TwwDBLookupCombo;
    qryIDLANCIMOVEL: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryVLRLANCRECEB: TFloatField;
    qryVLRLANCOMRECEB: TFloatField;
    qryMOEDARECEB: TFloatField;
    qryVLRMULTA: TFloatField;
    qryVLRJUROS: TFloatField;
    qryVLRCORRECAOMON: TFloatField;
    qryFLGTIPOLANCAMENTO: TStringField;
    qryRECPAG: TStringField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryDATALANCAMENTO: TDateTimeField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryDATACORRECAO: TDateTimeField;
    qryFLGMULTACALCULADA: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryHISTMOVCARTINV: TStringField;
    qryDESCCUSTORECIMO: TStringField;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    chkMoraProp: TCheckBox;
    edtPercMulta: TRealEdit;
    edtPercMora: TRealEdit;
    cboPerMora: TComboBox;
    Label56: TLabel;
    Label17: TLabel;
    qryNOME_IMOVEL: TStringField;
    qryVALORTOTAL: TFloatField;
    qryPERCCORRMONET: TFloatField;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBcboAltMulta: TwwDBLookupCombo;
    DBcboAltJuros: TwwDBLookupCombo;
    DBcboAltCorrecao: TwwDBLookupCombo;
    Panel2: TPanel;
    edtDataLancamento: TCMDateTimePicker;
    Label10: TLabel;
    qryParametrosIMOLOGRADOURO: TStringField;
    Label4: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    lblMesVencimento: TLabel;
    btnBuscaImovel: TBitBtn;
    btnLimpaContrato: TBitBtn;
    edtNomeContrato: TEdit;
    edtDataVenc: TCMDateTimePicker;
    DBgrdReajuste: TwwDBGrid;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    chkCompetencia: TCheckBox;
    btnSeleciona: TBitBtn;
    ToolbarSep975: TToolbarSep97;

    // procedimentos definidos
    function VerificaPreenchimentoSelecao: boolean;
    function VerificaPreenchimentoCalculo: boolean;
    function VerificaPreenchimentoCAPCAR: boolean;

    function VerificaDataUltCorrecao: TDateTime;
    function GetSaldoDoc: currency;

    procedure ReajustaDocumento;

    function MultaCalculada: boolean;
    function CalculaCorrecao(fBaseCalculo: currency): currency;
    function CalculaMulta(fBaseCalculo: currency): currency;
    function CalculaJuros(fBaseCalculo: currency): currency;

    procedure VerificaParametrosReajuste;
    function CalculaFatorReajuste(iIndice: integer; dDataIni, dDataFim: TDateTime): double;

    function AchaHistCart(iDocumento, iLancto: integer): integer;
    procedure ApagaHistCart(iHistCartInv: integer);

    // outros procedimentos
    procedure btnBuscaImovelClick(sender: tobject);
    procedure btnlimpacontratoclick(sender: tobject);
    procedure DBgrdReajusteEnter(Sender: TObject);
    procedure btnCalculaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBcboAltMultaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboAltJurosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBcboAltCorrecaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBgrdReajusteExit(Sender: TObject);
    procedure chkCorrecaoClick(Sender: TObject);
    procedure edtNovaDataExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkCompetenciaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure edtDataVencExit(Sender: TObject);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);


  private { private declarations }

    iImovel, iDocumento                   : integer;
    iAltJuros, iAltMulta, iAltCorrecao    : integer;

    iMoedaMora, iMoedaMulta, iIndiceMora  : integer;
    iDiasTolerancia                       : integer;

    dDataUltCorrecao, dDataTolerancia     : TDateTime;

    fVlrMulta, fPercentMulta              : double;
    fVlrMora, fPercentMora                : double;
    fFatorCorrecaoMonet                   : double;

    fSaldoDoc                             : currency;

    sPerMora                              : string;

    bMultaValor, bMoraValor, bMoraProporc : boolean;


  public { public declarations }


  end;

var
  frmExecRecalculoCobrImovel: tfrmExecRecalculoCobrImovel;


implementation
{$R *.DFM}
uses
   uModulo, uMensErro, uSistema, uDataBase, Math, uData, uFuncaoGeral, uDiasInUteis,
   UComunsImobiliario, uVerificaPreenchimento, uDocumento, uOperComum, uIntegraBack, uLancContab, uFuncoesImob;



function TfrmExecRecalculoCobrImovel.GetSaldoDoc: currency;
var
   sData : string;
begin
   sData := DateToStr(edtNovaData.Date);

   with qrySaldoDoc do begin
      LimpaParametros(qrySaldoDoc);
      ParamByName('DOCUMENTO').asInteger  := iDocumento;
      Open;
      Result := qrySaldoDocSALDO.asFloat;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.VerificaParametrosReajuste;
begin
   with qryParametros do begin
      LimpaParametros(qryParametros);
      ParamByname('IDIMOVEL').asInteger := iImovel;
      Open;

      dDataTolerancia   := edtDataVenc.Date;

      // parâmetros p/ Multa
      fPercentMulta     := StrToFloat(edtPercMulta.Text);

      // flag que indica o tipo de multa
      bMultaValor       := fVlrMulta > 0;

      // parâmetros p/ Mora
      fPercentMora   := StrToFloat(edtPercMora.Text);

      Case cboPerMora.ItemIndex of
         0: sPerMora := 'D';
         1: sPerMora := 'M';
      end;

      // flag que indica se a mora deve ser proporcional
      if (chkMoraProp.Checked = True) then begin
        bMoraProporc := True;
      end else begin
        bMoraProporc := False;
      end;

      // flag que indica o tipo de mora
      bMoraValor  := fVlrMora > 0;
   end;
end;



function TfrmExecRecalculoCobrImovel.CalculaFatorReajuste(iIndice: integer; dDataIni, dDataFim: TDateTime): double;
var
   sTipoCotacao, sPeriodicidade              : string;
   fCotacaoIni, fCotacaoFim, fFatorCorrecao  : double;

   iAnoIniCorrecao, iAnoFimCorrecao          : integer;
   iMesIniCorrecao, iMesFimCorrecao, iMeses  : integer;

   sAnoIni, sMesIni, sAnoFim, sMesFim        : string;
begin
   // primeiro verifica a periodicidade e tipo da cotação
   sTipoCotacao   := qryIndiceFLGPERCVALOR.asString;
   sPeriodicidade := qryIndiceMOEPERIODICIDADE.asString;

   iMeses         := DiasInUteis.IntervaloMeses(dDataIni, dDataFim);
   if iMeses = 0 then iMeses := 1;

   // verifica os meses cujas cotações se deseja buscar
   iAnoFimCorrecao   := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(dDataFim, -1));
   iMesFimCorrecao   := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(dDataFim, -1));
   iMesIniCorrecao   := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(dDataFim, iMeses * -1));
   iAnoIniCorrecao   := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(dDataFim, iMeses * -1));

   // Se o índice precisar ser relativo ao mês anterior, diminui 1 mês da Data
   if chkMesAnterior.Checked then begin
      iAnoFimCorrecao   := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(dDataFim, -2));
      iMesFimCorrecao   := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(dDataFim, -2));
      iMesIniCorrecao   := DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(dDataFim, (iMeses * -1) -1));
      iAnoIniCorrecao   := DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(dDataFim, (iMeses * -1) -1));
   end;

   dDataIni := DiasInUteis.SomaMeses(dDataIni, +1);
   sAnoIni := IntToStr(DiasInUteis.ExtraiAno(dDataIni));
   sMesIni := IntToStr(DiasInUteis.ExtraiMes(dDataIni));
   if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

   sAnoFim := IntToStr(DiasInUteis.ExtraiAno(dDataFim));
   sMesFim := IntToStr(DiasInUteis.ExtraiMes(dDataFim));
   if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

   case sTipoCotacao[1] of
      // percentual --------------------------------------------------------------------------------
      'P':
      begin
         with qryCotacao do begin
            LimpaParametros(qryCotacao);
            ParamByName('MOEDA').asInteger   := iIndice;
            ParamByName('DATAINI').asString  := sAnoFim + sMesFim;
            ParamByName('DATAFIM').asString  := sAnoFim + sMesFim;
            Open;

            If IsEmpty Then Begin // não tem índice para o último mês, pego índice do mês anterior
                                  // ando para trás com o mês inicial e final
              sAnoIni  := IntToStr(DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(dDataIni, -1)));
              sMesIni  := IntToStr(DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(dDataIni, -1)));

              sAnoFim  := IntToStr(DiasInUteis.ExtraiAno(DiasInUteis.SomaMeses(dDataFim, -1)));
              sMesFim  := IntToStr(DiasInUteis.ExtraiMes(DiasInUteis.SomaMeses(dDataFim, -1)));

              if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

              ParamByName('MOEDA').asInteger   := iIndice;
              ParamByName('DATAINI').asString  := sAnoIni + sMesIni;
              if (iMeses = 1) then begin
                ParamByName('DATAFIM').asString  := sAnoIni + sMesIni
              end else begin
                ParamByName('DATAFIM').asString  := sAnoFim + sMesFim;
              end;
              Open;
            end else Begin
                // telma fim
              with qryCotacao do begin
                  LimpaParametros(qryCotacao);

                 ParamByName('MOEDA').asInteger   := iIndice;
                 ParamByName('DATAINI').asString  := sAnoIni + sMesIni;
                 if (iMeses = 1) then begin
                   ParamByName('DATAFIM').asString  := sAnoIni + sMesIni
                 end else begin
                   ParamByName('DATAFIM').asString  := sAnoFim + sMesFim;
                 end;

                 Open;
                 First;
            end;
            fFatorCorrecao := 1;

            while not(EOF) do begin
               fCotacaoFim := FieldByName('COTVALOR').asFloat;

               if fCotacaoFim >= 0 then begin
                  fFatorCorrecao := fFatorCorrecao * (1 + abs(fCotacaoFim / 100) );
               end else begin
                  fFatorCorrecao := fFatorCorrecao / (1 + abs(fCotacaoFim / 100) );
               end;

               Next;
            end;
          end;
         end;
      end;

      // valor -------------------------------------------------------------------------------------
      'V':
      begin
         fCotacaoIni    := FuncoesImob.BuscaCotacao(iIndice, dDataIni, False);
         fCotacaoFim    := FuncoesImob.BuscaCotacao(iIndice, dDataFim, False);

         fFatorCorrecao := fCotacaoFim / fCotacaoIni;
      end;

      else fFatorCorrecao := 1;
   end;

   if fFatorCorrecao < 1 then fFatorCorrecao := 1;

   Result := fFatorCorrecao;
end;



function TfrmExecRecalculoCobrImovel.VerificaDataUltCorrecao: TDateTime;
begin
   Result := qryDATACORRECAO.asDateTime;
end;



procedure TfrmExecRecalculoCobrImovel.ReajustaDocumento;
var
   fVlrMora       : currency;
   fVlrMulta      : currency;
   fVlrCorrecao   : currency;
begin
   dDataUltCorrecao := VerificaDataUltCorrecao;

   // verifica na tabela Contrato os parâmetros que afetam a forma de reajuste
   VerificaParametrosReajuste;

   // verifica o saldo do documento
   fSaldoDoc      := Arredonda(GetSaldoDoc, 2);

   fVlrCorrecao   := Arredonda(CalculaCorrecao(fSaldoDoc), 2);
   fVlrMulta      := Arredonda(CalculaMulta(fSaldoDoc + fVlrCorrecao), 2);
   If (edtPercMora.Value <> 0) Or (Trim(edtPercMora.Text) <> '') Then
     fVlrMora       := Arredonda(CalculaJuros(fSaldoDoc + fVlrCorrecao), 2);

   if not(qry.State = dsEdit) then qry.Edit;
   qryVLRMULTA.AsFloat       := fVlrMulta;
   qryVLRJUROS.AsFloat       := fVlrMora;
   qryVLRCORRECAOMON.AsFloat := fVlrCorrecao;
   qryPERCCORRMONET.AsFloat  := fFatorCorrecaoMonet;   
   qry.Post;
end;



function TfrmExecRecalculoCobrImovel.MultaCalculada: boolean;
begin
   Result   := True;
   // aqui deve entrar a rotina que verifica se a multa já foi calculada e incorporada
   Result   := False;
end;



function TfrmExecRecalculoCobrImovel.CalculaCorrecao(fBaseCalculo: currency): currency;
var
   iNumDias, iIndiceCorrecao : integer;
begin
   Result := 0;

   if chkCorrecao.Checked then begin

      // total de dias de intervalo
      iNumDias := DiasInUteis.IntervaloDias(dDataUltCorrecao, edtNovaData.Date);

      if iNumDias >= DiasInuteis.ExtraiDia(DiasInuteis.UltDiaMes(DiasInuteis.ExtraiAno(edtNovaData.Date), DiasInuteis.ExtraiMes(edtNovaData.Date))) then begin
         iIndiceCorrecao   := StrToInt(DBcboIndiceCorrecao.LookupValue);
         Result            := fSaldoDoc * CalculaFatorReajuste(iIndiceCorrecao, dDataUltCorrecao, edtNovaData.Date) - fSaldoDoc;
      end;
   end;
end;



function TfrmExecRecalculoCobrImovel.CalculaMulta(fBaseCalculo: currency): currency;
begin
   // verifica se a multa ainda não foi calculada
   if not(MultaCalculada) then begin

      // verifica a tolerância do contrato
      if edtNovaData.Date > dDataTolerancia then begin

         // verifica se a multa é por valor ou percentual
         if bMultaValor then begin
            Result := FuncoesImob.ConverteMoeda(iMoedaMulta, fVlrMulta, edtNovaData.Date, False);
         end else begin
            Result := fBaseCalculo * (fPercentMulta / 100);
         end;

      end else begin
         Result := 0;
      end;

   end else begin
      Result := 0;
   end;
end;



function TfrmExecRecalculoCobrImovel.CalculaJuros(fBaseCalculo: currency): currency;
var
   iAnoNovo, iMesNovo: word;
   iAnoUlt, iMesUlt: word;

   iNumDias                      : smallint;
   iNumDiasUlt                   : smallint;
   iNumDiasVenc                  : smallint;

   iNumDiasMesVenc               : word;
   iNumDiasMesUlt                : word;

   iMesesIntervalo               : integer;
begin
   Result := 0;

   // verifica a tolerancia do contrato
   if edtNovaData.Date > dDataTolerancia then begin

      // total de dias de intervalo
      iNumDias          := DiasInUteis.IntervaloDias(dDataUltCorrecao, edtNovaData.Date);

      // dias no mes da última correção e dias no mes de novo vencimento
      iNumDiasMesUlt    := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(dDataUltCorrecao), DiasInUteis.ExtraiMes(dDataUltCorrecao)));
      iNumDiasMesVenc   := DiasInUteis.ExtraiDia(DiasInUteis.UltDiaMes(DiasInUteis.ExtraiAno(edtNovaData.Date), DiasInUteis.ExtraiMes(edtNovaData.Date)));

      // mes e ano das 2 datas
      iAnoNovo          := DiasInUteis.ExtraiAno(edtNovaData.Date);
      iMesNovo          := DiasInUteis.ExtraiMes(edtNovaData.Date);
      iAnoUlt           := DiasInUteis.ExtraiAno(dDataUltCorrecao);
      iMesUlt           := DiasInUteis.ExtraiMes(dDataUltCorrecao);

      // dias entre a data e o início/fim dos respectivos meses
      iNumDiasUlt       := DiasInUteis.IntervaloDias(dDataUltCorrecao, DiasInUteis.UltDiaMes(iAnoUlt, iMesUlt) );
      iNumDiasVenc      := 1 + DiasInUteis.IntervaloDias(EncodeDate(iAnoNovo, iMesNovo, 1), edtNovaData.Date);

//--- 1º) Verifica se é o mesmo mês ----------------------------------------------------------------
      if ( (iAnoNovo = iAnoUlt) and (iMesUlt = iMesNovo) ) then begin

         // verifica se a multa é por valor ou percentual
         if bMoraValor then begin

            case sPerMora[1] of

               'D':  Result := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * iNumDias;

               'M': // mensal --> verifica se é proporcional ou não
               if bMoraProporc then begin
                  Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * (iNumDias / iNumDiasMesVenc);
               end else begin
                  Result    := 0;
               end;

            end;

         end else begin

            case sPerMora[1] of

               'D':  Result := (fBaseCalculo * ( 1 + (fPercentMora / 100) ) * iNumDias) - fBaseCalculo;

               'M': // mensal --> verifica se é proporcional ou não
               if bMoraProporc then begin
                  Result    := (fBaseCalculo * ( 1 + (fPercentMora / 100)) * (iNumDias / iNumDiasMesVenc)) - fBaseCalculo;
               end else begin
                  // não passou 1 mes --> a mora não é cobrada
                  Result    := 0;
               end;

            end;
         end;

      end else begin

// ----- 2º) Verifica se os meses são contíguos ----------------------------------------------------
         if DiasInUteis.MesesEntre(dDataUltCorrecao, edtNovaData.Date) = 0 then begin

            // verifica se a multa é por valor ou percentual
            if bMoraValor then begin

               case sPerMora[1] of

                  'D':  Result := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * iNumDias;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     // calcula-se a mora proporcional de cada período e soma-se tudo
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * (iNumDiasUlt / iNumDiasMesUlt);
                     Result    := Result + FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * (iNumDiasVenc / iNumDiasMesVenc);
                  end else begin
                     // passou 1 mês --> é aplicada 1 vez a mora mensal
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False);
                  end;

               end;

            end else begin

               case sPerMora[1] of

                  // faz juros do 1º mes + juros do outro mês
                  'D':  Result   := fBaseCalculo * (fPercentMora / 100) * iNumDiasUlt  +
                                    fBaseCalculo * (fPercentMora / 100) * iNumDiasVenc;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     Result   := fBaseCalculo * (fPercentMora / 100) * (iNumDiasUlt / iNumDiasMesUlt)  +
                                 fBaseCalculo * (fPercentMora / 100) * (iNumDiasVenc / iNumDiasMesVenc);
                  end else begin
                     Result    := fBaseCalculo * (fPercentMora / 100);
                  end;

               end;
            end;

         end else begin

// -------- 3º) Os meses são espaçados -------------------------------------------------------------

            iMesesIntervalo := DiasInUteis.MesesEntre(dDataUltCorrecao, edtNovaData.Date);

            // verifica se a multa é por valor ou percentual
            if bMoraValor then begin

               case sPerMora[1] of

                  'D':  Result := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * iNumDias;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     // calcula-se a mora proporcional de cada período e soma-se tudo
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * (iNumDiasUlt / iNumDiasMesUlt);
                     Result    := Result + FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * iMesesIntervalo;
                     Result    := Result + FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * (iNumDiasVenc / iNumDiasMesVenc);
                  end else begin
                     // passou 1 mês --> é aplicada 1 vez a mora mensal
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fVlrMora, edtNovaData.Date, False) * (iMesesIntervalo + 1);
                  end;

               end;

            end else begin

               case sPerMora[1] of

                  // faz juros compostos com os juros de 1 mês * os juros do outro mês
                  'D':  Result   := fBaseCalculo * (fPercentMora / 100) * iNumDiasUlt  +
                                    fBaseCalculo * (fPercentMora / 100) * 30 * iMesesIntervalo +
                                    fBaseCalculo * (fPercentMora / 100) * iNumDiasVenc;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     Result   := fBaseCalculo * (fPercentMora / 100) * (iNumDiasUlt / iNumDiasMesUlt) +
                                 fBaseCalculo * (fPercentMora / 100) * iMesesIntervalo +
                                 fBaseCalculo * (fPercentMora / 100) * (iNumDiasVenc / iNumDiasMesVenc);

                  end else begin
                     Result    := fBaseCalculo * (fPercentMora / 100) * (iMesesIntervalo + 1);
                  end;

               end;
            end;

         end;
      end;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.btnBuscaImovelClick(sender: tobject);
begin
   inherited;

   MontaSelectImovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de custos/recebimentos por imovel com apenas o registro buscado
   if MontaSelectImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel              := StrToInt(MontaSelectImovel.valoresChave[0]);
      edtNomeContrato.Text := MontaSelectImovel.ValoresChave[3] + ' - ' + MontaSelectImovel.ValoresChave[2];

      Screen.Cursor := crDefault;
   end;
   btnBuscaImovel.SetFocus;
end;



procedure tfrmExecRecalculoCobrImovel.btnlimpacontratoclick(sender: tobject);
begin
  inherited;
  iImovel := -1;
end;


procedure TfrmExecRecalculoCobrImovel.btnCalculaClick(Sender: TObject);
begin
   if VerificaPreenchimentoCalculo then begin

      try

         Screen.Cursor      := crHourGlass;
         btnCalcula.Enabled := False;

         if ( (qry.Active) and not(qry.IsEmpty) ) then begin
            qry.First;
            while not(qry.EOF) do begin
               iDocumento := qryCODDOCUMENTO.asInteger;
               ReajustaDocumento;
               qry.Next;
            end;
         end;

      finally
         btnCalcula.Enabled := True;
         Screen.Cursor := crDefault;
      end;

   end;
end;



function TfrmExecRecalculoCobrImovel.VerificaPreenchimentoSelecao: boolean;
begin
	Result := False;

	try

      if iImovel = -1 then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel !', btnBuscaImovel);

      if trim(edtDataVenc.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if chkCompetencia.Checked then
         if cboMes.ItemIndex < 0 then
            raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if chkCompetencia.Checked then
         if DBspnAno.Value < 1980 then
            raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;

   Result := True;
end;



function TfrmExecRecalculoCobrImovel.VerificaPreenchimentoCalculo: boolean;
begin
	Result := False;

	try

      if iImovel = -1 then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel !', btnBuscaImovel);

      if trim(edtDataVenc.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if ((edtPercMora.Value <> 0) And (cboPerMora.Text = '')) then
          raise EValidacao.CreateVal('É necessário indicar a periodicidade !', cboPerMora);

      if chkCompetencia.Checked then
         if cboMes.ItemIndex < 0 then
            raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if chkCompetencia.Checked then
         if DBspnAno.Value < 1980 then
            raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

      if trim(edtNovaData.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Recálculo!', edtNovaData);

      if trim(edtPercMulta.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar o percentual de multa !', edtPercMulta);

      if chkCorrecao.Checked then
         if trim(DBcboIndiceCorrecao.Text) = '' then
            raise EValidacao.CreateVal('É necessário indicar o Índice de Correção!', DBcboIndiceCorrecao);

      if ( not(qry.Active) or (qry.IsEmpty) ) then
         raise EValidacao.CreateVal('É necessário indicar pelo menos um Lançamento!', btnSeleciona);

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



function TfrmExecRecalculoCobrImovel.VerificaPreenchimentoCAPCAR: boolean;
begin
	Result := False;

	try

         if length(trim(DBcboAltMulta.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar o Alterador para Multa!', DBcboAltMulta);

         if length(trim(DBcboAltJuros.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar o Alterador para Juros!', DBcboAltJuros);

         if length(trim(DBcboAltCorrecao.Text)) = 0 then
            raise EValidacao.CreateVal('É necessário indicar o Alterador para Correção Monetária!', DBcboAltCorrecao);

      if length(trim(edtDataLancamento.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLancamento);

	except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmExecRecalculoCobrImovel.bbtnConfirmarClick(Sender: TObject);
var
   iLancImovel, iImovel    : integer;
   iNumLancto, iPlanilha   : integer;
   iCarteira               : integer;
   sDataLancamento         : string;
begin
   if VerificaPreenchimentoCAPCAR then begin

      if MsgDlg('Deseja realmente lançar os valores no Contas a Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
         Repaint;

         try
            inherited;
            sDataLancamento := DateToStr(edtDataLancamento.Date);

            if ( (qry.Active) and not(qry.isEmpty) ) then begin

               qry.First;
               while not(qry.EOF) do begin

                  iImovel     := qryIDIMOVEL.asInteger;
                  iCarteira   := qryIDCARTEIRAINVEST.asInteger;
                  iDocumento  := qry.FieldByName('CODDOCUMENTO').asInteger;

                  // Multa --------------------------------------------------------------------------
                  if ( not(qryVLRMULTA.isNULL) and (qryVLRMULTA.asFloat > 0) ) then begin

                     iNumLancto  := Documento.GerarNumLancto(qryAux, iDocumento);
                     iPlanilha   := 0;

                     Documento.CriarLanctoDoc(qryAux, iDocumento, iNumLancto, iAltMulta, iPlanilha,
                                 sDataLancamento, qryVLRMULTA.asFloat, 0{valor OM}, -1{estorno}, 'D',
                                 '4'{alterador}, 'Multa', Sistema.idUsuario, True{contabiliza},
                                 -1{portador-forma}, ''{nº cheque/borderô});
                     if not(qry.State in [dsInsert, dsEdit]) then qry.Edit;

                     // marca que já houve cálculo da multa
                     qryFLGMULTACALCULADA.asInteger := 1;
                  end;

                  // Juros (Mora) -------------------------------------------------------------------
                  if ( not(qryVLRJUROS.isNULL) and (qryVLRJUROS.asFloat > 0) ) then begin

                     iNumLancto  := Documento.GerarNumLancto(qryAux, iDocumento);
                     iPlanilha   := 0;

                     Documento.CriarLanctoDoc(qryAux, iDocumento, iNumLancto, iAltJuros, iPlanilha,
                                 sDataLancamento, qryVLRJUROS.asFloat, 0{valor OM}, -1{estorno}, 'D',
                                 '4'{alterador}, 'Juros', Sistema.idUsuario, True{contabiliza},
                                 -1{portador-forma}, ''{nº cheque/borderô});
                  end;

                  // Correção Monetária -------------------------------------------------------------
                  if ( not(qryVLRCORRECAOMON.isNULL) and (qryVLRCORRECAOMON.asFloat > 0) ) then begin

                     iNumLancto  := Documento.GerarNumLancto(qryAux, iDocumento);
                     iPlanilha   := 0;

                     Documento.CriarLanctoDoc(qryAux, iDocumento, iNumLancto, iAltCorrecao, iPlanilha,
                                 sDataLancamento, qryVLRCORRECAOMON.asFloat, 0{valor OM}, -1{estorno},
                                 'D', '4'{alterador}, 'Correção Monetária', Sistema.idUsuario,
                                 True{contabiliza}, -1{portador-forma}, ''{nº cheque/borderô});
                  end;

                  // -------------------------------------------------------------------------------------

                  if not(qry.State in [dsInsert, dsEdit]) then qry.Edit;
                  qryDATACORRECAO.asDateTime := edtNovaData.Date;

                  qry.Post;
                  qry.Next;
               end;

            end else begin
               MsgDlg('Não há valores a serem lançados no Contas a Receber.', 'Aviso', mtWarning, [mbOk], 0);
               Repaint;
            end;

            if (qry.Active) and qry.UpdatesPending then qry.CancelUpdates;

            // -------------------------------------------------------------------------------------

            MsgDlg('Os valores foram lançados com no Contas a Receber.', 'Informação', mtInformation, [mbOk], 0);
            Repaint;

         except
            MsgDlg('Houve erro durante a tentativa de integração com o Contas a Receber.', 'Erro', mtError, [mbOk], 0);
            Repaint;
            Raise;
            Repaint;
         end;
      end;

      Repaint;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   if ( (qry.Active) and (qry.UpdatesPending) ) then qry.CancelUpdates;
   qry.Close;

   edtNomeContrato.Clear;
   edtDataVenc.Clear;
end;



procedure TfrmExecRecalculoCobrImovel.DBcboAltMultaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if length(trim(DBcboAltMulta.Text)) > 0 then begin
      iAltMulta := StrToInt(DBcboAltMulta.LookupValue);
   end else begin
      iAltMulta := -1;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.DBcboAltJurosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if length(trim(DBcboAltJuros.Text)) > 0 then begin
      iAltJuros := StrToInt(DBcboAltJuros.LookupValue);
   end else begin
      iAltJuros := -1;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.DBcboAltCorrecaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if length(trim(DBcboAltCorrecao.Text)) > 0 then begin
      iAltCorrecao := StrToInt(DBcboAltCorrecao.LookupValue);
   end else begin
      iAltCorrecao := -1;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.DBgrdReajusteEnter(Sender: TObject);
begin
   inherited;
   if (qry.Active) and (not(qry.isEmpty)) and (qry.State = dsBrowse) then qry.Edit;
end;



procedure TfrmExecRecalculoCobrImovel.DBgrdReajusteExit(Sender: TObject);
begin
   inherited;
   if (qry.Active) and (not(qry.isEmpty)) and (qry.State = dsEdit) then qry.Post;
end;



procedure TfrmExecRecalculoCobrImovel.chkCorrecaoClick(Sender: TObject);
begin
   inherited;
   DBcboIndiceCorrecao.Enabled := True;
end;



procedure TfrmExecRecalculoCobrImovel.edtNovaDataExit(Sender: TObject);
begin
   inherited;
   if length(trim(edtDataLancamento.Text)) = 0 then edtDataLancamento.Date := edtNovaData.Date;
end;



procedure TfrmExecRecalculoCobrImovel.FormShow(Sender: TObject);
var
   dMesAnterior : TDateTime;
begin
   inherited;

   qryIndice.Open;
   qryLookMoeda.Open;

   with qryLookAlterador do begin
      LimpaParametros(qryLookAlterador);
      ParamByName('EMPRESAPROP').asInteger := Sistema.idEmpresa;
      Open;
   end;

   iAltMulta := -1;
   iAltJuros := -1;

   // preenche a data de lançamento e o ano de referência/competência
   dMesAnterior      := DiasInUteis.SomaMeses(Date, -1);
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(dMesAnterior) - 1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(dMesAnterior);

   edtNovaData.Date  := Date;
end;



procedure TfrmExecRecalculoCobrImovel.chkCompetenciaClick(Sender: TObject);
begin
  inherited;

  if chkCompetencia.Checked then begin
     cboMes.Enabled    := True;
     DBspnAno.Enabled  := True;
  end else begin
     cboMes.Enabled    := False;
     DBspnAno.Enabled  := False;
  end;
end;



procedure TfrmExecRecalculoCobrImovel.btnSelecionaClick(Sender: TObject);
begin
   if VerificaPreenchimentoSelecao then begin
      try
         Screen.Cursor        := crHourGlass;
         btnSeleciona.Enabled := False;

         with qry do begin
            Close;

            SQL.Text :=
            'SELECT ' + chr(13) +
            '   (IM.IMONOME||'' - ''||I.IMONOME) AS NOME_IMOVEL, ' + chr(13) +
            '   LI.IDLANCIMOVEL,  I.IMONOME, ' + chr(13) +
            '   LI.IDIMOVEL, LI.IDCONTRATOIMOVEL, LI.IDTIPOCUSTORECIMO, ' + chr(13) +
            '   LI.IDPESSOA, LI.PLNCODIGO, LI.CODDOCUMENTO, ' + chr(13) +
            '   LI.VLRLANCRECEB, LI.VLRLANCOMRECEB, LI.MOEDARECEB, ' + chr(13) +
            '   LI.VLRMULTA, LI.VLRJUROS, LI.VLRCORRECAOMON, ' + chr(13) +
            '   LI.FLGTIPOLANCAMENTO, LI.RECPAG, ' + chr(13) +
            '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + chr(13) +
            '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, ' + chr(13) +
            '   LI.DATACORRECAO, LI.FLGMULTACALCULADA, ' + chr(13) +
            '   0 AS PERCCORRMONET, ' + chr(13) +
            '   I.IDCARTEIRAINVEST, H.HISTMOVCARTINV, T.DESCCUSTORECIMO ' + chr(13) +

            'FROM ' + chr(13) +
            '   LANCAMENTOSIMOVEL LI, IMOVEL I, IMOVEL IM, ' + chr(13) +
            '   HISTCARTINV H, TIPOCUSTORECIMOV T, ' + chr(13) +
            '   DOCUMENTO D ' + chr(13) +

            'WHERE ' + chr(13) +
            '       ( LI.RECPAG         = ''R'' ) ' + chr(13) +
            '   AND ( D.STATUS         <> ''2'' ) ' + chr(13) +
            '   AND ( LI.IDIMOVEL       = ' + IntToStr(iImovel) + ' )' + chr(13) +
            '   AND ( LI.DATAVENCIMENTO = to_date(''' + edtDataVenc.Text + ''',''dd/mm/yyyy'') ) ' + chr(13);

            if chkCompetencia.Checked then
            SQL.Text := SQL.Text +
            '   AND ( LI.MESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1) + ' )' + chr(13) +
            '   AND ( LI.ANOCOMPETENCIA = ' + FloatToStr(DBspnAno.Value) + ' )' + chr(13);

            SQL.Text := SQL.Text +
            '   AND ( LI.IDIMOVEL          = I.IDIMOVEL ) ' + chr(13) +
            '   AND ( LI.IDLANCIMOVEL      = H.IDLANCIMOVEL ) ' + chr(13) +
            '   AND ( LI.CODDOCUMENTO      = D.CODDOCUMENTO ) ' + chr(13) +
            '   AND ( I.IDIMOVELMESTRE     = IM.IDIMOVEL )' + chr(13) +
            '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ';

            Open;

            if qry.isEmpty then begin
               Close;
               MsgDlg('Não há documentos em aberto com a Data de Vencimento indicada.', 'Informação', mtInformation, [mbOk], 0);
               Repaint;
            end;
            
         end;

      finally
         btnSeleciona.Enabled := True;
         Screen.Cursor := crDefault;
      end;
   end;
end;



function TfrmExecRecalculoCobrImovel.AchaHistCart(iDocumento, iLancto: integer): integer;
begin
   with qryAchaHistCart do begin
      LimpaParametros(qryAchaHistCart);
      ParamByName('DOCUMENTO').asInteger  := iDocumento;
      ParamByName('LANCTO').asInteger     := iLancto;
      Open;

      Result := qryAchaHistCartIDHISTCARTINV.asInteger;

      Close;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.ApagaHistCart(iHistCartInv: integer);
begin
   with qryApagaHistCart do begin
      LimpaParametros(qryApagaHistCart);
      ParamByName('HISTORICO').asInteger  := iHistCartInv;
      ExecSQL;
      Close;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.btnExcluiAlteradorClick(Sender: TObject);
var
   iNumeroLancto        : integer;
   iCodDocumento        : integer;
   iPlanilhaAEstornar   : integer;
   iHistoricoCarteira   : integer;
begin
   inherited;

   if ( (qryAlteradoresLanc.Active) and (not(qryAlteradoresLanc.isEmpty)) ) then begin

      if MsgDlg('Deseja realmente EXCLUIR esse alterador?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

         Repaint;
         StartTransacao;

         try
            Screen.Cursor := crHourGlass;

            iNumeroLancto        := qryAlteradoresLancNUMLANCTO.asInteger;
            iCodDocumento        := qryAlteradoresLancCODDOCUMENTO.asInteger;
            iPlanilhaAEstornar   := qryAlteradoresLancPLNCODIGO.asInteger;

            // Some com o LanctoDocum
            Documento.Excluir(qryAux, iCodDocumento, iNumeroLancto);

            // Desfaz a contabilização
            ExcluiLanc(True, iPlanilhaAEstornar, 'BASEDADOS', '64', IntegraBack.Plano, Sistema.idEmpresa,
                        Sistema.idUsuario, True, 0, IntegraBack.MascaraPlano);

            CommitTransacao;
            qryAlteradoresLanc.Close;
            qryAlteradoresLanc.Open;

            MsgDlg('Alterador excluído.', 'Informação', mtInformation, [mbOk], 0);
            Repaint;

            Screen.Cursor := crDefault;

         except

            RollBackTransacao;
            Raise;
            Repaint;
            Screen.Cursor := crDefault;

         end;

      end;

   end;
end;



procedure TfrmExecRecalculoCobrImovel.edtDataVencExit(Sender: TObject);
begin
   inherited;
   if ( (qry.Active) and not(qry.IsEmpty) ) then btnSeleciona.Click;
end;



procedure TfrmExecRecalculoCobrImovel.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
  inherited;
  // acerta as cores quando muda a linha da grid
  DBgrdReajuste.Invalidate;
end;



procedure TfrmExecRecalculoCobrImovel.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;

   with qryAlteradoresLanc do begin
      LimpaParametros(qryAlteradoresLanc);
      ParamByName('DOCUMENTO').asInteger := qryCODDOCUMENTO.asInteger;
      Open;
   end;
end;



procedure TfrmExecRecalculoCobrImovel.qryCalcFields(DataSet: TDataSet);
begin
   inherited;

   // totaliza os valores
   qryVALORTOTAL.AsFloat := qryVLRLANCRECEB.AsFloat + qryVLRCORRECAOMON.AsFloat + qryVLRJUROS.AsFloat;
end;



procedure TfrmExecRecalculoCobrImovel.FormCreate(Sender: TObject);
begin
   inherited;

   // exibe no MontaSelect apenas os contratos que possuam lançamentos em aberto
   MontaSelectImovel.Filtro.Add('EXISTS ( SELECT L.IDIMOVEL FROM LANCAMENTOSIMOVEL L, DOCUMENTO D WHERE (I.IDIMOVEL = L.IDIMOVEL) AND (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ((RTRIM(D.STATUS) <> ''2'') OR (D.STATUS IS NULL) ))' );
end;



end.


