//Rotina..........: GetDataAmortizacao
//N. Sol..........: 91849
//N. Kintana......: 390045
//Data............: 05/09/2008
//Responsável.....: Emerson s.
//Descrição.......: Criação de um componente twwquery para tratar especificamente do chamado em questão
unit DFinanciamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwdatsrc, Wwquery,Math, DBClient, MConnect, uFuncAlienacao;


type
  TdtmFinanciamento = class(TDataModule)
    updParc: TUpdateSQL;
    qryCondPag: TwwQuery;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagFLGPERCVALOR: TStringField;
    qryContrato: TwwQuery;
    qryContratoIDCONTRATOIMOVEL: TFloatField;
    qryContratoCONNUMERO: TStringField;
    qryContratoCONNOME: TStringField;
    qryContratoCONDATAASSINATURA: TDateTimeField;
    qryContratoCONDATAINICIO: TDateTimeField;
    qryContratoFLGTIPOCONTRATO: TStringField;
    qryContratoCONTAXAADMIN: TFloatField;
    qryContratoCONVLRAJUSTADO: TFloatField;
    qryContratoCONVLRTOTAL: TFloatField;
    qryContratoCONDESCRICAO: TMemoField;
    qryContratoVLRPROPOSTA: TFloatField;
    qryContratoVLRPRESENTE: TFloatField;
    qryContratoVLRCONTABIL: TFloatField;
    qryContratoCONINDICEMORA: TFloatField;
    qryContratoCONINDICEREAJUSTE: TFloatField;
    qryContratoCONDATAREAJUSTE: TDateTimeField;
    qryContratoIDLOCATARIO: TFloatField;
    qryContratoRAZAOSOCIAL: TStringField;
    qryParc: TwwQuery;
    qryParcNUMPARCELA: TFloatField;
    qryParcVLRSALDODEVEDOR: TFloatField;
    qryParcVLRJUROS: TFloatField;
    qryParcVLRAMORTIZACAO: TFloatField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcVLRPRESTATUALIZADA: TFloatField;
    qryParcVLRRESIDUO: TFloatField;
    qryParcVLRRESIDUOATUALI: TFloatField;
    qryParcVLRCORRIGIDOATRASO: TFloatField;
    qryParcVLRMULTAATRASO: TFloatField;
    qryParcVLRMORAATRASO: TFloatField;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryVerifAmortiz: TwwQuery;
    qryIndice: TwwQuery;
    qryIndiceMOECODIGO: TFloatField;
    qryIndiceMOEDESC: TStringField;
    qryIndiceMOESIGLA: TStringField;
    qryIndiceMOEPERIODICIDADE: TStringField;
    qryIndiceMOEINATIVO: TStringField;
    qryIndiceFLGPERCVALOR: TStringField;
    qryIndiceDATAINICIO: TDateTimeField;
    qryIndiceDATAFIM: TDateTimeField;
    qryCotacoesIntervalo: TwwQuery;
    qryCotacoesIntervaloMOECODIGO: TFloatField;
    qryCotacoesIntervaloCOTVALOR: TFloatField;
    qryCotacoesIntervaloCOTMESREF: TStringField;
    qryCotacoesIntervaloMOEDESC: TStringField;
    qryCotacoesIntervaloMOESIGLA: TStringField;
    qryCotacaoExata: TwwQuery;
    qryCotacaoExataMOECODIGO: TFloatField;
    qryCotacaoExataCOTVALOR: TFloatField;
    qryCotacaoExataMOEDESC: TStringField;
    qryCotacaoExataMOESIGLA: TStringField;
    qryCotacaoNaoExata: TwwQuery;
    qryCotacaoNaoExataMOECODIGO: TFloatField;
    qryCotacaoNaoExataCOTVALOR: TFloatField;
    qryCotacaoNaoExataMOEDESC: TStringField;
    qryCotacaoNaoExataMOESIGLA: TStringField;
    qryContratoPERALUGUELIDEAL: TFloatField;
    qryContratoPERCTXJURMERC: TFloatField;
    qryContratoPERITXJURMERC: TStringField;
    qryCondPagIDINDCORRPROJ: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcCAL_TIPO: TStringField;
    qryParcPLNCODIGO: TFloatField;
    qryUpdateDocumento: TwwQuery;
    qryAux: TwwQuery;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryParcIDINDCORRECAO: TFloatField;
    qryParcDATALANCINTEGRA: TDateTimeField;
    qryParcFATORCORRECAO: TFloatField;
    qryVerifAmortizVLRPRESTACAO: TFloatField;
    qryVerifAmortizFATORCORRECAO: TFloatField;
    qryVerifAmortizDATAVENCIMENTO: TDateTimeField;
    qryVerifAmortizVLRSALDODEVEDOR: TFloatField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryUpdCondPag: TwwQuery;
    qryParcFLGRESIDUOINCORP: TStringField;
    qryCalcCorrecao: TwwQuery;
    qryUpdCorrecao: TwwQuery;
    qryCalcCorrecaoIDCONTRATOIMOVEL: TFloatField;
    qryCalcCorrecaoIDPARCFINANCIMOV: TFloatField;
    qryCalcCorrecaoIDCONDPAGIMOVEL: TFloatField;
    qryCalcCorrecaoFLGTIPOLANC: TFloatField;
    qryCalcCorrecaoVLRPRESTACAO: TFloatField;
    qryCalcCorrecaoNUMPARCELA: TFloatField;
    qryCalcCorrecaoIDCIDADES: TFloatField;
    qryCalcCorrecaoIDPAIS: TFloatField;
    qryCalcCorrecaoCODESTADO: TStringField;
    qryParcFLGCONCILIADO: TStringField;
    qryImovelxbem: TwwQuery;
    qryImovelxbemIDIMOVEL: TFloatField;
    qryImovelxbemIDBEM: TFloatField;
    qryCalcCorrecaoVLRPAGO: TFloatField;
    qryCalcCorrecaoDATAPAGAMENTO: TDateTimeField;
    qryCalcCorrecaoVLRMULTAATRASO: TFloatField;
    qryCalcCorrecaoVLRMORAATRASO: TFloatField;
    qryCalcCorrecaoVLRCORRIGIDOATRASO: TFloatField;
    qryCalcCorrecaoVLRPRESTCORRIG: TFloatField;
    qryCalcCorrecaoVLRMULTACORRIG: TFloatField;
    qryCalcCorrecaoVLRJUROSCORRIG: TFloatField;
    qryCalcCorrecaoDATAVENCIMENTO: TDateTimeField;
    qryCalcCorrecaoDATALIMITE: TDateTimeField;
    qryParcVLRSALDOATUAL: TFloatField;
    qryParcVLRJUROSPARC: TFloatField;
    qryParcVLRNOMINAL: TFloatField;
    qryParcVLRCORRSALDO: TFloatField;
    qryInsParcExtra: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField1: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField2: TStringField;
    FloatField7: TFloatField;
    StringField3: TStringField;
    FloatField8: TFloatField;
    DateTimeField1: TDateTimeField;
    qryInsParcela: TwwQuery;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField4: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField5: TStringField;
    FloatField15: TFloatField;
    StringField6: TStringField;
    FloatField16: TFloatField;
    DateTimeField2: TDateTimeField;
    qryCalcCorrecaoCODDOCUMENTO: TFloatField;
    qryVerifAmortizVLRAMORTIZACAO: TFloatField;
    //Inicio - Emerson Silva, KT 390045, SOL 91849
    qryVerifAmortiz_new: TwwQuery;
    //Fim - Emerson Silva, KT 390045, SOL 91849
    qryVerifAmortiz_newVLRPRESTACAO: TFloatField;
    qryVerifAmortiz_newFATORCORRECAO: TFloatField;
    qryVerifAmortiz_newDATAVENCIMENTO: TDateTimeField;
    VLRSALDODEVEDOR: TFloatField;
    qryVerifAmortiz_newVLRAMORTIZACAO: TFloatField;
    procedure qryParcCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SelContrato( idContrato : LongInt );
    procedure SelParcela(IdCondPag : Int64 );
    procedure FechaContrato;

    // função de busca de cotação de moeda
    function BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;
    // calcula o fator de correção (baseado em 1 índice) entre 2 determinadas datas
    function CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;
  end;


var
  dtmFinanciamento: TdtmFinanciamento;

implementation

{$R *.DFM}

{ TDtmFinanciamento }

Uses uSistema,dBaseDados,uDataBase, uDiasUteis, uMensErro, 
     FTelaAut, FAguarde, UDiasInUteis, FCadPropFinanc, DCalcDocumento,
     uCalcDocumento, UFuncoesImob;


procedure TdtmFinanciamento.SelContrato(idContrato: Integer);
begin
  qryContrato.Close;
  If Not qryContrato.Prepared then qryContrato.Prepare;
  qryContrato.ParamByName('IDCONTRATOIMOVEL').AsFloat := idContrato;
  qryContrato.Open;
end;

procedure TdtmFinanciamento.SelParcela(IdCondPag: Int64);
begin
   qryCondPag.Close;
   if not qryCondPag.Prepared then qryCondPag.Prepare;
   qryCondPag.ParamByName('IDCONDPAGIMOVEL').AsFloat := IdCondPag;
   qryCondPag.Open;

   qryParc.Close;
   if not qryParc.Prepared then qryParc.Prepare;
   qryParc.ParamByName('IDCONDPAGIMOVEL').AsFloat := qryCondPagIDCONDPAGIMOVEL.AsFloat;
   qryParc.Open;
end;

procedure TdtmFinanciamento.FechaContrato;
begin
   if qryContrato.Active then  qryContrato.Close;
   if qryCondPag.Active  then  qryCondPag.Close;
   if qryParc.Active     then  qryParc.Close;
end;


//==================================================================================================
//    Funções ligadas a moeda / cotação
//==================================================================================================

function TdtmFinanciamento.BuscaCotacao(iMoeda: integer; dDataCotacao : TDateTime; bDataExata: boolean): extended;
var
   qryCotacao : TwwQuery;
begin
   // escolhe qual query usar de acordo com o tipo de cotação
   if bDataExata then begin
      qryCotacao := TwwQuery(qryCotacaoExata);
   end else begin
      qryCotacao := TwwQuery(qryCotacaoNaoExata);
   end;

   with qryCotacao do begin
      LimpaParametros(qryCotacao);

      ParamByName('MOEDA').AsInteger   := iMoeda;
      ParamByName('DATA').AsDateTime   := dDataCotacao;

      Open;
      First;
   end;

   // retorna -1 se não houver cotação
   if qryCotacao.IsEmpty then begin
      Result := -1;
   end else begin
      Result := qryCotacao.FieldByName('COTVALOR').AsFloat;
   end;
end;

//--------------------------------------------------------------------------------------------------

function TdtmFinanciamento.CalculaFatorCorrecao(iIndice: integer; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean): double;
var
   sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim : string;
   fCotacaoIni, fCotacaoFim, fFatorCorrecao : extended;
begin
   fFatorCorrecao := 1;

   // primeiro verifica a periodicidade e tipo da cotação
   with qryIndice do begin
      LimpaParametros(qryIndice);
      ParamByName('MOEDA').AsInteger := iIndice;

      Open;

      // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
      if ( (qryIndice.IsEmpty) or (qryIndiceFLGPERCVALOR.isNull) or (qryIndiceMOEPERIODICIDADE.isNULL) ) then begin
         Result := 1;
         qryIndice.Close;
         Exit;
      end;

      sTipoCotacao      := qryIndiceFLGPERCVALOR.asString;
      sPeriodicidade    := qryIndiceMOEPERIODICIDADE.asString;

      Close;
   end;

   sAnoIni := IntToStr(DiasInUteis.ExtraiAno(dDataIni));
   sMesIni := IntToStr(DiasInUteis.ExtraiMes(dDataIni));
   if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

   sAnoFim := IntToStr(DiasInUteis.ExtraiAno(dDataFim));
   sMesFim := IntToStr(DiasInUteis.ExtraiMes(dDataFim));
   if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

   case sTipoCotacao[1] of

      'P': // percentual
      with qryCotacoesIntervalo do begin

         LimpaParametros(qryCotacoesIntervalo);

         ParamByName('INDICE').AsInteger     := iIndice;
         ParamByName('ANOMESINI').AsString   := sAnoIni + sMesIni;
         ParamByName('ANOMESFIM').AsString   := sAnoFim + sMesFim;

         Open;
         First;

         while not(EOF) do begin
            fCotacaoFim := qryCotacoesIntervaloCOTVALOR.asFloat;

            fFatorCorrecao := fFatorCorrecao * (1 + (fCotacaoFim / 100) );
            Next;
         end;

      end;

      'V': // valor
      begin
         fCotacaoIni    := BuscaCotacao(iIndice, dDataIni, False);
         fCotacaoFim    := BuscaCotacao(iIndice, dDataFim, False);

         fFatorCorrecao := fCotacaoFim / fCotacaoIni;
      end;

   end;

   // verifica se o fator pode ser negativo, se não puder, zera a correção
   if not(bPodeNegativo) then if fFatorCorrecao < 1 then fFatorCorrecao := 1;

   Result := fFatorCorrecao;
end;


procedure TdtmFinanciamento.qryParcCalcFields(DataSet: TDataSet);
begin
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger,
                                                         qryParcFLGLANCINTEGRA.AsInteger);
end;


end.
