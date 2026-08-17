unit FExecAtualizaVlrReceb;

//	-------------------------------------------------------------------------------------------------
//
//	Reajuste de Cobranças em Atraso
//
//	Autor          :  André Pontes
//
//	Data de Início	:
//	Data de Término:  10/12/1999
//
//	Modificações	:  13/12/1999  1) Gravação dos Alteradores no Documento (Contas a Pagar/Receber)
//                   15/12/1999  2) Gravação da data da última correção no Lançamento
//                               3) Gravação da flag que indica se a multa já foi calculada
//                   16/12/1999  4) Nova metologia para o cálculo (ver abaixo)
//                               5) 1 dia somado ao 2º período, ie, só se passa a considerar atraso
//                                  a partir do 1º dia subseqüente
//                   24/01/2000  6) Alimentação da Carteira com os alteradores
//                               7) Tela totalmente refeita, para exibição (e posterior exclusão /
//                                  estorno dos alteradores)
//                   26/01/2000  9) Modificação da HistCartInv para gravar o LancoDocum, para posterior
//                                  estorno
//
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Nova metodologia de cálculo (início: 16/12/1999, término: __/12/1999):
//
//    1º) Cálculo da Correção Monetária sobre o montante devido;
//    2º) Cálculo da multa sobre o montante corrigido (montante devido + correção monetária)
//    3º) Cálculo dos juros sobre o montante corrigido (montante devido + correção monetária)
//
//    obs:  aplicar correção monetária "cheia" (não há pró-rata) a cada período de 1 mês de atraso
//    obs2: indicar no Aviso de Cobrança a data de pagamento (ie, considerar a tolerância quando
//          for o vencimento original do contrato
//
// -------------------------------------------------------------------------------------------------


interface

uses
  windows, Messages, sysutils, classes, graphics, controls, forms, dialogs,
  fokcancelar, grids, wwdbigrd, wwdbgrid, mask,
  wwdbedit, wwdbspin, wwdblook, ivdictio, ivmulti, ivemulti, mahlpbtn,
  buttons, tb97tlbr, tb97, extctrls, comctrls, db, wwdatsrc, dbtables,
  wwquery, MontaSelect, fcButton, fcImgBtn, fcShapeBtn, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, FOkCancelarImob;

type
  TfrmExecAtualizaVlrReceb = class(TFrmOkCancelarImob)
    qry: twwquery;
    ds: twwdatasource;
    qrySaldoDoc: TwwQuery;
    qryDataUltCorrecao: TwwQuery;
    qrySaldoDocSALDO: TFloatField;
    qryDataUltCorrecaoDATAULTCORRECAO: TDateTimeField;
    upd: TUpdateSQL;
    PageControl1: TPageControl;
    tbsParametros: TTabSheet;
    tbsResult: TTabSheet;
    DBgrdReajuste: TwwDBGrid;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    chkCorrecao: TCheckBox;
    chkMesAnterior: TCheckBox;
    Label11: TLabel;
    DBgrdAlteradoresLanc: TwwDBGrid;
    btnExcluiAlterador: TBitBtn;
    Panel3: TPanel;
    Label5: TLabel;
    edtNovaData: TCMDateTimePicker;
    btnCalcula: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    lblMesVencimento: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    edtNomeContrato: TEdit;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    chkCompetencia: TCheckBox;
    btnSeleciona: TBitBtn;
    Label7: TLabel;
    edtNomeLocatario: TEdit;
    btnBuscaLocatario: TBitBtn;
    btnLimpaLocatario: TBitBtn;
    edtNumContrato: TEdit;
    edtDataLancamento: TCMDateTimePicker;
    Label2: TLabel;
    qryIMOVEL_EXTENSO: TStringField;
    qryDESCCUSTORECIMO: TStringField;
    qryVLRLANCRECEB: TFloatField;
    qryVLRMULTA: TFloatField;
    qryVLRJUROS: TFloatField;
    qryVLRCORRECAOMON: TFloatField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryDATAVENCIMENTO: TDateTimeField;
    qryIDLANCIMOVEL: TFloatField;
    qryIDIMOVEL: TFloatField;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryIDTIPOCUSTORECIMO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryVLRLANCOMRECEB: TFloatField;
    qryMOEDARECEB: TFloatField;
    qryFLGTIPOLANCAMENTO: TStringField;
    qryRECPAG: TStringField;
    qryDATALANCAMENTO: TDateTimeField;
    qryDATACORRECAO: TDateTimeField;
    qryFLGMULTACALCULADA: TFloatField;
    qryCONDIASTOLERANCIA: TFloatField;
    qryFLGTIPODIATOLERA: TStringField;
    qryIDLOCATARIO: TFloatField;
    qryCONINDICEREAJUSTE: TFloatField;
    qryAlteradoresLanc: TwwQuery;
    dsAlterador: TwwDataSource;
    cboMes: TComboBox;
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
    qryAlteradoresLancNODOCUMENTO: TFloatField;
    qryDataIni: TwwQuery;
    qryDataIniCODDOCUMENTO: TFloatField;
    qryDataIniDATALANCTO: TDateTimeField;
    qryIDCIDADES: TFloatField;
    qryIDPAIS: TFloatField;
    qryCODESTADO: TStringField;
    qryCONVLRMULTA: TFloatField;
    qryCONMOEDAMULTA: TFloatField;
    qryCONPERCENTMULTA: TFloatField;
    qryCONVLRMORA: TFloatField;
    qryCONMOEDAMORA: TFloatField;
    qryCONINDICEMORA: TFloatField;
    qryCONPERCENTMORA: TFloatField;
    qryCONPERMORA: TStringField;
    qryFLGMORAPROPORC: TFloatField;
    qryCODALTMULTA: TFloatField;
    qryCODALTJUROS: TFloatField;
    qryCODALTCORRMON: TFloatField;
    qryMultaCalculada: TwwQuery;
    ToolbarSep975: TToolbarSep97;

    // procedimentos definidos
    function VerificaPreenchimentoSelecao: boolean;
    function VerificaPreenchimentoCalculo: boolean;
    function VerificaPreenchimentoCAPCAR: boolean;

    function VerificaDataUltCorrecao: TDateTime;

    procedure ReajustaDocumento;

    function MultaCalculada: boolean;
    function CalculaCorrecao(fBaseCalculo: currency): currency;
    function CalculaMulta(fBaseCalculo: currency): currency;
    function CalculaJuros(fBaseCalculo: currency): currency;

    procedure VerificaParametrosReajuste;

    // outros procedimentos
    procedure btnBuscaContratoclick(sender: tobject);
    procedure btnlimpacontratoclick(sender: tobject);
    procedure DBgrdReajusteEnter(Sender: TObject);
    procedure btnCalculaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBgrdReajusteExit(Sender: TObject);
    procedure edtNovaDataExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkCompetenciaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure btnBuscaLocatarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimpaLocatarioClick(Sender: TObject);


  private { private declarations }
    iContrato, iLocatario     : integer;

    iMoedaMora, iMoedaMulta, iIndiceMora  : integer;
    iDiasTolerancia                       : integer;

    dDataUltCorrecao, dDataTolerancia     : TDateTime;

    fConVlrMulta, fConPercentMulta        : double;
    fConVlrMora, fConPercentMora          : double;

    fSaldoDoc                             : real;

    sConPeriodoMora                       : string;

    bMultaValor, bMoraValor, bMoraProporc : boolean;
    bToleranciaUtil                       : boolean;

  public { public declarations }


  end;



var
  frmExecAtualizaVlrReceb: tfrmExecAtualizaVlrReceb;




implementation
{$R *.DFM}

uses
   uModulo, uMensErro, uSistema, uDataBase, Math, uData, uFuncaoGeral, uDiasInUteis,
   UComunsImobiliario, uVerificaPreenchimento, uDocumento, uOperComum, uIntegraBack, uLancContab, uFuncoesImob,
   dLookImobiliario, dImobiliario, DMS;


procedure TfrmExecAtualizaVlrReceb.VerificaParametrosReajuste;
begin
   iDiasTolerancia      := qryCONDIASTOLERANCIA.asInteger;
   bToleranciaUtil      := qryFLGTIPODIATOLERA.asString = 'U';

   if bToleranciautil then begin
      dDataTolerancia   := DiasInUteis.SomaDiasUteis(edtDataVenc.Date, iDiasTolerancia,
                           qryIDCIDADES.asInteger,
                           qryIDPAIS.asInteger,
                           qryCODESTADO.asString,
                           True, False, False);
   end else begin
      dDataTolerancia   := edtDataVenc.Date + iDiasTolerancia;
   end;

   // parâmetros p/ Multa
   fConVlrMulta         := qryCONVLRMULTA.asFloat;
   iMoedaMulta          := qryCONMOEDAMULTA.asInteger;
   fConPercentMulta     := qryCONPERCENTMULTA.asFloat;

   // flag que indica o tipo de multa
   bMultaValor          := fConVlrMulta > 0;

   // parâmetros p/ Mora
   fConVlrMora          := qryCONVLRMORA.asFloat;
   iMoedaMora           := qryCONMOEDAMORA.asInteger;
   iIndiceMora          := qryCONINDICEMORA.asInteger;
   fConPercentMora      := qryCONPERCENTMORA.asFloat;
   sConPeriodoMora      := qryCONPERMORA.asString;

   // flag que indica se a mora deve ser proporcional
   bMoraProporc         := qryFLGMORAPROPORC.asInteger = 1;

   // flag que indica o tipo de mora
   bMoraValor           := fConVlrMora > 0;
end;



function TfrmExecAtualizaVlrReceb.VerificaDataUltCorrecao: TDateTime;
begin
   LimpaParametros(qryDataIni);
   qryDataIni.ParamByName('PCODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
   qryDataIni.Open;

   if qryDataIniDATALANCTO.IsNull then result := qryDATAVENCIMENTO.AsDateTime
   else result := qryDataIniDATALANCTO.AsDateTime;
end;



procedure TfrmExecAtualizaVlrReceb.ReajustaDocumento;
var
   fVlrMora       : currency;
   fVlrMulta      : currency;
   fVlrCorrecao   : currency;
   fSaldoDocOM    : real;
   sData          : string;
begin
   dDataUltCorrecao := VerificaDataUltCorrecao;

   // verifica na tabela Contrato os parâmetros que afetam a forma de reajuste
   VerificaParametrosReajuste;

   sData := DateToStr(edtNovaData.Date);

   // verifica o saldo do documento
   Documento.Saldo.GetSaldoDoc(qryCODDOCUMENTO.AsInteger, sData, 'R', fSaldoDoc, fSaldoDocOM);

   fVlrCorrecao   := Arredonda(CalculaCorrecao(fSaldoDoc), 2);
   fVlrMulta      := Arredonda(CalculaMulta(fSaldoDoc + fVlrCorrecao), 2);
   fVlrMora       := Arredonda(CalculaJuros(fSaldoDoc + fVlrCorrecao), 2);

   with qry do begin
      if not(State = dsEdit) then Edit;
      FieldByName('VLRMULTA').asFloat       := fVlrMulta;
      FieldByName('VLRJUROS').asFloat       := fVlrMora;
      FieldByName('VLRCORRECAOMON').asFloat := fVlrCorrecao;
      Post;
   end;
end;



function TfrmExecAtualizaVlrReceb.MultaCalculada: boolean;
begin
   LimpaParametros(qryMultaCalculada);
   qryMultaCalculada.ParamByName('PCODDOCUMENTO').AsInteger := qryCODDOCUMENTO.AsInteger;
   qryMultaCalculada.Open;
   if qryMultaCalculada.IsEmpty then Result := false
   else Result := true;
end;



function TfrmExecAtualizaVlrReceb.CalculaCorrecao(fBaseCalculo: currency): currency;
var
   iNumDias: integer;
begin
   Result := 0;

   if chkCorrecao.Checked then begin

      // total de dias de intervalo
      iNumDias := DiasInUteis.IntervaloDias(dDataUltCorrecao, edtNovaData.Date);

      if iNumDias >= 30 then begin
         if not chkMesAnterior.Checked then
            Result := fSaldoDoc * FuncoesImob.CalculaFatorCorrecao(qryCONINDICEREAJUSTE.AsInteger, dDataUltCorrecao, edtNovaData.Date, true) - fSaldoDoc
         else
            Result := fSaldoDoc * FuncoesImob.CalculaFatorCorrecao(qryCONINDICEREAJUSTE.AsInteger, IncMonth(dDataUltCorrecao,-1), IncMonth(edtNovaData.Date,-1), true) - fSaldoDoc;
      end;

   end;
end;



function TfrmExecAtualizaVlrReceb.CalculaMulta(fBaseCalculo: currency): currency;
begin
   // verifica se a multa ainda não foi calculada
   if not(MultaCalculada) then begin

      // verifica a tolerância do contrato
      if edtNovaData.Date > dDataTolerancia then begin

         // verifica se a multa é por valor ou percentual
         if bMultaValor then begin
            Result := FuncoesImob.ConverteMoeda(iMoedaMulta, fConVlrMulta, edtNovaData.Date, False);
         end else begin
            Result := fBaseCalculo * (fConPercentMulta / 100);
         end;

      end else begin
         Result := 0;
      end;

   end else begin
      Result := 0;
   end;
end;



function TfrmExecAtualizaVlrReceb.CalculaJuros(fBaseCalculo: currency): currency;
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

            case sConPeriodoMora[1] of

               'D':  Result := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * iNumDias;

               'M': // mensal --> verifica se é proporcional ou não
               if bMoraProporc then begin
                  Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * (iNumDias / iNumDiasMesVenc);
               end else begin
                  Result    := 0;
               end;

            end;

         end else begin

            if iNumDias = 0 then result := 0  // se não a mora pode vir negativa.
            else begin
               case sConPeriodoMora[1] of

                  'D':  Result := (fBaseCalculo * ( 1 + (fConPercentMora / 100) ) * iNumDias) - fBaseCalculo;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     Result    := (fBaseCalculo * ( 1 + (fConPercentMora / 100)) * (iNumDias / iNumDiasMesVenc)) - fBaseCalculo;
                  end else begin
                     // não passou 1 mes --> a mora não é cobrada
                     Result    := 0;
                  end;
               end;
            end;
         end;

      end else begin

// ----- 2º) Verifica se os meses são contíguos ----------------------------------------------------
         if DiasInUteis.MesesEntre(dDataUltCorrecao, edtNovaData.Date) = 0 then begin

            // verifica se a multa é por valor ou percentual
            if bMoraValor then begin

               case sConPeriodoMora[1] of

                  'D':  Result := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * iNumDias;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     // calcula-se a mora proporcional de cada período e soma-se tudo
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * (iNumDiasUlt / iNumDiasMesUlt);
                     Result    := Result + FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * (iNumDiasVenc / iNumDiasMesVenc);
                  end else begin
                     // passou 1 mês --> é aplicada 1 vez a mora mensal
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False);
                  end;

               end;

            end else begin

               case sConPeriodoMora[1] of

                  // faz juros do 1º mes + juros do outro mês
                  'D':  Result   := fBaseCalculo * (fConPercentMora / 100) * iNumDiasUlt  +
                                    fBaseCalculo * (fConPercentMora / 100) * iNumDiasVenc;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     Result   := fBaseCalculo * (fConPercentMora / 100) * (iNumDiasUlt / iNumDiasMesUlt)  +
                                 fBaseCalculo * (fConPercentMora / 100) * (iNumDiasVenc / iNumDiasMesVenc);
                  end else begin
                     Result    := fBaseCalculo * (fConPercentMora / 100);
                  end;

               end;
            end;

         end else begin

// -------- 3º) Os meses são espaçados -------------------------------------------------------------

            iMesesIntervalo := DiasInUteis.MesesEntre(dDataUltCorrecao, edtNovaData.Date);

            // verifica se a multa é por valor ou percentual
            if bMoraValor then begin

               case sConPeriodoMora[1] of

                  'D':  Result := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * iNumDias;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     // calcula-se a mora proporcional de cada período e soma-se tudo
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * (iNumDiasUlt / iNumDiasMesUlt);
                     Result    := Result + FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * iMesesIntervalo;
                     Result    := Result + FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * (iNumDiasVenc / iNumDiasMesVenc);
                  end else begin
                     // passou 1 mês --> é aplicada 1 vez a mora mensal
                     Result    := FuncoesImob.ConverteMoeda(iMoedaMora, fConVlrMora, edtNovaData.Date, False) * (iMesesIntervalo + 1);
                  end;

               end;

            end else begin

               case sConPeriodoMora[1] of

                  // faz juros compostos com os juros de 1 mês * os juros do outro mês
                  'D':  Result   := fBaseCalculo * (fConPercentMora / 100) * iNumDiasUlt  +
                                    fBaseCalculo * (fConPercentMora / 100) * 30 * iMesesIntervalo +
                                    fBaseCalculo * (fConPercentMora / 100) * iNumDiasVenc;

                  'M': // mensal --> verifica se é proporcional ou não
                  if bMoraProporc then begin
                     Result   := fBaseCalculo * (fConPercentMora / 100) * (iNumDiasUlt / iNumDiasMesUlt) +
                                 fBaseCalculo * (fConPercentMora / 100) * iMesesIntervalo +
                                 fBaseCalculo * (fConPercentMora / 100) * (iNumDiasVenc / iNumDiasMesVenc);

                  end else begin
                     Result    := fBaseCalculo * (fConPercentMora / 100) * (iMesesIntervalo + 1);
                  end;

               end;
            end;

         end;
      end;
   end;
end;



procedure TfrmExecAtualizaVlrReceb.btnBuscaContratoclick(sender: tobject);
begin
   inherited;

   dtmMS.MS_Contrato.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de custos/recebimentos por imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iContrato            := StrToInt(dtmMS.MS_Contrato.valoresChave[0]);
      edtNumContrato.Text  := dtmMS.MS_Contrato.ValoresChave[1];
      edtNomeContrato.Text := dtmMS.MS_Contrato.ValoresChave[2];

      LimpaParametros(qry);
      LimpaParametros(qryAlteradoresLanc);
      Screen.Cursor := crDefault;
   end;

   btnBuscaContrato.SetFocus;
end;



procedure tfrmExecAtualizaVlrReceb.btnlimpacontratoclick(sender: tobject);
begin
   inherited;
   iContrato := -1;
   edtNumContrato.Clear;
   edtNomeContrato.Clear;
end;



procedure TfrmExecAtualizaVlrReceb.btnCalculaClick(Sender: TObject);
begin
   if VerificaPreenchimentoCalculo then begin

      try

         Screen.Cursor := crHourGlass;
         btnCalcula.Enabled := False;

         qry.First;
         while not(qry.EOF) do begin
            ReajustaDocumento;
            qry.Next;
         end;

      finally
         btnCalcula.Enabled := True;
         Screen.Cursor := crDefault;
      end;

   end;
end;


function TfrmExecAtualizaVlrReceb.VerificaPreenchimentoSelecao: boolean;
begin
	Result := False;

	try

      if (iContrato = -1) and (iLocatario = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Contrato ou Locatário!', btnBuscaContrato);

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



function TfrmExecAtualizaVlrReceb.VerificaPreenchimentoCalculo: boolean;
begin
	Result := False;

	try

      if (iContrato = -1) and (iLocatario = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Contrato ou o Locatário!', btnBuscaContrato);

      if trim(edtDataVenc.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if chkCompetencia.Checked then begin

         if cboMes.ItemIndex < 0 then
            raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

         if DBspnAno.Value < 1980 then
            raise EValidacao.CreateVal('É necessário indicar o Ano de Competência!', DBspnAno);

      end;

      if trim(edtNovaData.Text)= '' then
         raise EValidacao.CreateVal('É necessário indicar a Data de Recálculo!', edtNovaData);

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



function TfrmExecAtualizaVlrReceb.VerificaPreenchimentoCAPCAR: boolean;
begin
	Result := False;

	try

      if length(trim(edtDataLancamento.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento dos Alteradores!', edtDataLancamento);

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



procedure TfrmExecAtualizaVlrReceb.bbtnConfirmarClick(Sender: TObject);
var
   iNumLancto, iPlanilha   : integer;
   sDataLancamento         : string;
begin
   if VerificaPreenchimentoCAPCAR then begin

      if MsgDlg('Deseja realmente lançar os valores no Contas a Pagar/Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

         try

            inherited;
            sDataLancamento := DateToStr(edtDataLancamento.Date);

            if ( (qry.Active) and not(qry.isEmpty) ) then begin

               qry.First;
               while not(qry.EOF) do begin

                  // Multa -------------------------------------------------------------------------------
                  if qryVLRMULTA.asFloat > 0 then begin

                     iNumLancto  := Documento.GerarNumLancto(dtmImobiliario.qryAux, qryCODDOCUMENTO.AsInteger);
                     iPlanilha   := 0;

                     Documento.CriarLanctoDoc(dtmImobiliario.qryAux, qryCODDOCUMENTO.AsInteger, iNumLancto,
                                 qryCODALTMULTA.asInteger,
                                 iPlanilha,
                                 sDataLancamento, qryVLRMULTA.asFloat, 0{valor OM}, -1{estorno}, 'D',
                                 '4'{alterador}, 'Multa', Sistema.idUsuario, True{contabiliza},
                                 -1{portador-forma}, ''{nº cheque/borderô});

                     if not(qry.State in [dsInsert, dsEdit]) then qry.Edit;
                     qryFLGMULTACALCULADA.asInteger := 1;
                  end;

                  // Juros (Mora) ------------------------------------------------------------------------
                  if qryVLRJUROS.asFloat > 0 then begin

                     iNumLancto  := Documento.GerarNumLancto(dtmImobiliario.qryAux, qryCODDOCUMENTO.AsInteger);
                     iPlanilha   := 0;

                     Documento.CriarLanctoDoc(dtmImobiliario.qryAux, qryCODDOCUMENTO.AsInteger, iNumLancto,
                                 qryCODALTJUROS.AsInteger,
                                 iPlanilha,
                                 sDataLancamento, qryVLRJUROS.asFloat, 0{valor OM}, -1{estorno}, 'D',
                                 '4'{alterador}, 'Juros', Sistema.idUsuario, True{contabiliza},
                                 -1{portador-forma}, ''{nº cheque/borderô});
                  end;

                  // Correção Monetária ------------------------------------------------------------------
                  if qryVLRCORRECAOMON.asFloat > 0 then begin

                     iNumLancto  := Documento.GerarNumLancto(dtmImobiliario.qryAux, qryCODDOCUMENTO.AsInteger);
                     iPlanilha   := 0;

                     Documento.CriarLanctoDoc(dtmImobiliario.qryAux, qryCODDOCUMENTO.AsInteger, iNumLancto,
                                 qryCODALTCORRMON.AsInteger,
                                 iPlanilha,
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
            end;

            if (qry.Active) and qry.UpdatesPending then qry.CancelUpdates;

            // -------------------------------------------------------------------------------------

            MsgDlg('Os valores foram lançados com sucesso no Contas a Pagar/Receber.', 'Informação', mtInformation, [mbOk], 0);

         except
            MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.', 'Erro', mtError, [mbOk], 0)
         end;

      end;
   end;
end;



procedure TfrmExecAtualizaVlrReceb.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   if (qry.Active) and qry.UpdatesPending then qry.CancelUpdates;
   qry.Close;
   qryAlteradoresLanc.Close;

   edtNumContrato.Clear;
   edtNomeContrato.Clear;
   edtDataVenc.Clear;
   iLocatario := -1;
   iContrato  := -1;
   edtNumContrato.Clear;
   edtNomeContrato.Clear;
   edtNomeLocatario.Clear;
   PageControl1.ActivePage := tbsParametros;
end;



procedure TfrmExecAtualizaVlrReceb.DBgrdReajusteEnter(Sender: TObject);
begin
   inherited;

   if (qry.Active) and (not(qry.isEmpty)) and (qry.State = dsBrowse) then qry.Edit;
end;



procedure TfrmExecAtualizaVlrReceb.DBgrdReajusteExit(Sender: TObject);
begin
   inherited;

   if (qry.Active) and (not(qry.isEmpty)) and (qry.State = dsEdit) then qry.Post;
end;



procedure TfrmExecAtualizaVlrReceb.edtNovaDataExit(Sender: TObject);
begin
   inherited;
   if length(trim(edtDataLancamento.Text)) = 0 then edtDataLancamento.Date := edtNovaData.Date;
end;



procedure TfrmExecAtualizaVlrReceb.FormShow(Sender: TObject);
var
   dMesAnterior : TDateTime;
begin
   inherited;

   dtmLookImobiliario.qryLookMoeda.Open;

   // preenche a data de lançamento e o ano de referência/competência
   dMesAnterior      := DiasInUteis.SomaMeses(Date, -1);
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(dMesAnterior) - 1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(dMesAnterior);

   edtNovaData.Date  := Date;
   edtDataLancamento.Date := date;
   iContrato  := -1;
   iLocatario := -1;
end;



procedure TfrmExecAtualizaVlrReceb.chkCompetenciaClick(Sender: TObject);
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



procedure TfrmExecAtualizaVlrReceb.btnSelecionaClick(Sender: TObject);
begin
   if VerificaPreenchimentoSelecao then begin

      try
         Screen.Cursor := crHourGlass;
         btnSeleciona.Enabled := False;

         LimpaParametros(qry);
         with qry do begin
            ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            if iContrato <> -1 then begin
               ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
            end;

            if iLocatario <>  -1 then begin
               ParamByName('PIDLOCATARIO').AsInteger := iLocatario;
            end;
            ParamByName('PDATAVENCIMENTO').AsDate := edtDataVenc.Date;

            if chkCompetencia.Checked then begin
               ParamByName('PMESCOMPETENCIA').AsInteger := cboMes.ItemIndex + 1;
               ParamByName('PANOCOMPETENCIA').AsInteger := word(trunc(DBspnAno.Value));
            end;
            Open;
         end;
      finally
         btnSeleciona.Enabled := True;
         Screen.Cursor := crDefault;
         PageControl1.ActivePage := tbsResult;
      end;

      LimpaParametros(qryAlteradoresLanc);
      qryAlteradoresLanc.Open;

   end;
end;



procedure TfrmExecAtualizaVlrReceb.btnExcluiAlteradorClick(Sender: TObject);
var
   iNumeroLancto        : integer;
   iCodDocumento        : integer;
   iPlanilhaAEstornar   : integer;
begin
   inherited;

   if ( (qryAlteradoresLanc.Active) and (not(qryAlteradoresLanc.isEmpty)) ) then begin

      if MsgDlg('Deseja realmente EXCLUIR esse alterador?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

         StartTransacao;
         try
            Screen.Cursor := crHourGlass;

            iNumeroLancto        := qryAlteradoresLancNUMLANCTO.AsInteger;
            iCodDocumento        := qryAlteradoresLancCODDOCUMENTO.AsInteger;
            iPlanilhaAEstornar   := qryAlteradoresLancPLNCODIGO.AsInteger;

            // Some com o LanctoDocum
            Documento.Excluir(dtmImobiliario.qryAux, iCodDocumento, iNumeroLancto);

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



procedure TfrmExecAtualizaVlrReceb.btnBuscaLocatarioClick(Sender: TObject);
begin
  inherited;

   // @H Faz sentido selecionar o locatário , se fizer não deveria que selecionar o contrato
   dtmMS.MS_Locatario.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de custos/recebimentos por imovel com apenas o registro buscado
   if dtmMS.MS_Locatario.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iLocatario            := StrToInt(dtmMS.MS_Locatario.valoresChave[0]);
      edtNomeLocatario.Text := dtmMS.MS_Locatario.ValoresChave[1];

      LimpaParametros(qry);
      LimpaParametros(qryAlteradoresLanc);

      Screen.Cursor := crDefault;
   end;

   btnBuscaContrato.SetFocus;
end;

procedure TfrmExecAtualizaVlrReceb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   dtmLookImobiliario.qryLookMoeda.Close;
   qryAlteradoresLanc.Close;
   qry.Close;

end;

procedure TfrmExecAtualizaVlrReceb.DBgrdReajusteCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmExecAtualizaVlrReceb.DBgrdReajusteTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmExecAtualizaVlrReceb.FormCreate(Sender: TObject);
begin
   inherited;
   PageControl1.ActivePage := tbsParametros;
end;

procedure TfrmExecAtualizaVlrReceb.btnLimpaLocatarioClick(Sender: TObject);
begin
   inherited;
   iLocatario := -1;
   edtNomeLocatario.Clear;
end;

end.


