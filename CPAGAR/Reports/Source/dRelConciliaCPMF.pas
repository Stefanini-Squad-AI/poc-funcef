unit dRelConciliaCPMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, CmParamReport, DBClient, uCMClientDataSet,
  uCmSqlParams, uSistema, ppStrtch, ppSubRpt, uCMTypes, uCtrlPadroes,
  uMensErro, uCtrlConciliaCPMF;

type
  TDtmRelConciliaCPMF = class(TdtmReports)
    CmParamReport: TCmParamReport;
    rptRelLotesCPMF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppDbLogo: TppDBImage;
    ppLbEmpresa: TppLabel;
    ppLbTitulo: TppLabel;
    ppLbDescricao: TppLabel;
    ppShape3: TppShape;
    ppLabel15: TppLabel;
    ppLabel14: TppLabel;
    ppLine4: TppLine;
    ppShape2: TppShape;
    ppDetailBand1: TppDetailBand;
    ppShpCorLinha: TppShape;
    ppSubRepDoc: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel11: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShpCorZebra: TppShape;
    ppSubRepRat: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppShape4: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel16: TppLabel;
    ppLabel21: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShpCorZebraSub2: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine6: TppLine;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText5: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText8: TppDBText;
    ppLinhaDDSub1: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLine5: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBVlrLote: TppDBText;
    ppDBBaseCalc: TppDBText;
    ppDBVlrPrev: TppDBText;
    ppDBVlrCalc: TppDBText;
    ppLinhaDrilDraw: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLbNomeSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    CdsLotes: TCMClientDataSet;
    DsLotes: TwwDataSource;
    SqlDadosEmpresa: TCMSqlParams;
    CdsDadosEmpresa: TCMClientDataSet;
    dsDadosEmpresa: TwwDataSource;
    dsRelPorDoc: TwwDataSource;
    CdsRelPorDoc: TCMClientDataSet;
    CdsRelPorDocNUMLOTE: TFloatField;
    CdsRelPorDocCODDOCUMENTO: TFloatField;
    CdsRelPorDocNUMAPGR: TFloatField;
    CdsRelPorDocNOME: TStringField;
    CdsRelPorDocDATAEMISSAO: TDateTimeField;
    CdsRelPorDocVLRBASE: TFloatField;
    CdsRelPorDocCPMFCALC: TFloatField;
    CdsRelPorDocVLRLOTE: TFloatField;
    CdsRelPorDocCPMFPREV: TFloatField;
    SqlRelPorDoc: TCMSqlParams;
    SqlRateio: TCMSqlParams;
    CdsRateio: TCMClientDataSet;
    CdsRateioNUMLOTE: TFloatField;
    CdsRateioCODDOCUMENTO: TFloatField;
    CdsRateioCODTIPRECDES: TStringField;
    CdsRateioDESCRICAO: TStringField;
    CdsRateioCODEXTERNO: TStringField;
    CdsRateioNOME: TStringField;
    CdsRateioFLGTIPOPROGRAMA: TStringField;
    CdsRateioDESCCUSTAGREG: TStringField;
    CdsRateioVLRBASE: TFloatField;
    CdsRateioVLRCPMF: TFloatField;
    dsRateio: TwwDataSource;
    CdsVerificaCPMF: TCMClientDataSet;
    SqlVerificaCPMF: TCMSqlParams;
    CdsCPFMNaoCalc: TCMClientDataSet;
    SqlCPFMNaoCalc: TCMSqlParams;
    procedure CmParamReportBeforeExecute(var CanExecute: Boolean);
    procedure CmParamReportAfterExecute(ActionExecute: TActionExecute);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    CtrlConciliaCPMF : TCtrlConciliaCPMF;
    // Variável que instancia o percentual da CPMF
    // Método: VerificaCPMF
    sPercentual      : string;
    
    function VerificaCPMF(sDataProgramada: string): Boolean;
    function TrocaPontoOuVirgula(bTrocaPorPonto: Boolean; sValor: string): string;
    
  public
    { Public declarations }
  end;




var
  DtmRelConciliaCPMF: TDtmRelConciliaCPMF;

implementation

{$R *.DFM}

procedure TDtmRelConciliaCPMF.CmParamReportBeforeExecute(
  var CanExecute: Boolean);

var
   sSQl : string;

begin
  inherited;

  sSQl := 'SELECT '                    +
          '   CODPORTADOR, DESCRICAO ' +
          ' FROM '                     +
          '   PORTADORCONTA '          +
          ' WHERE '                    +
          '   FLGSTATUS = ''A'' AND '  +
          '   IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) +
          ' ORDER BY '                 +
          '   DESCRICAO ';
  CmParamReport.ParamValues[3].LookupSettings.SQL.Text := sSQl;
end;




procedure TDtmRelConciliaCPMF.CmParamReportAfterExecute(
  ActionExecute: TActionExecute);
var
   rValPrev: double;

begin
  inherited;
  rValPrev := 0;
  if VerificaCPMF(CmParamReport.ParamValues[1].AsString) then

  CdsLotes.Data := CtrlConciliaCPMF.SelLotes(CmParamReport.ParamValues[0].AsInteger,
                                             CmParamReport.ParamValues[2].AsInteger,
                                             CmParamReport.ParamValues[4].RadioGroupSettings.ItemIndex,
                                             CmParamReport.ParamValues[3].AsInteger,
                                             TrocaPontoOuVirgula(True,sPercentual),
                                             CmParamReport.ParamValues[1].AsDateTime,rValPrev,1,True);


  //  Passando valores aos parâmetros
  CdsCPFMNaoCalc.Close;
  SqlCPFMNaoCalc.Prepare;
  SqlCPFMNaoCalc.ParamByName('IDBANCO').Clear;
  SqlCPFMNaoCalc.ParamByName('CODPORTADOR').Clear;
  SqlCPFMNaoCalc.ParamByName('NUMLOTE').Clear;
  SqlCPFMNaoCalc.ParamByName('DATA').AsDate        := CmParamReport.ParamValues[1].AsDateTime;
  SqlCPFMNaoCalc.ParamByName('PERCENTUAL').AsFloat := StrToFloat(sPercentual);

  //  Caso o usuário tenha passado valores aos parâmetros, os mesmos
  //são passados para a qry, abrindo-a em seguida
  if CmParamReport.ParamValues[0].AsInteger > 0 then
     SqlCPFMNaoCalc.ParamByName('IDBANCO').AsInteger     := CmParamReport.ParamValues[0].AsInteger;
  if CmParamReport.ParamValues[3].AsInteger > 0 then
     SqlCPFMNaoCalc.ParamByName('CODPORTADOR').AsInteger := CmParamReport.ParamValues[3].AsInteger;
  if CmParamReport.ParamValues[2].AsInteger > 0 then
     SqlCPFMNaoCalc.ParamByName('NUMLOTE').AsFloat       := CmParamReport.ParamValues[2].AsInteger;
  SqlCPFMNaoCalc.Open;


  //  Abre o cds de Relatório por documento
  //  1º nível do sub-relatório
  CdsRelPorDoc.Close;
  SqlRelPorDoc.Prepare;
  SqlRelPorDoc.ParamByName('DATA').AsDateTime := CmParamReport.ParamValues[1].AsDateTime;
  SqlRelPorDoc.Open;


  //  Abre o cds de rateio
  //  2º nível do sub-relatório
  CdsRateio.Close;
  SqlRateio.Prepare;
  SqlRateio.ParamByName('DATA').AsDateTime := CmParamReport.ParamValues[1].AsDateTime;
  SqlRateio.Open;


  //  Varre o CdsCPFMNaoCalc e insere no CdsLotes os reegistros encontrados
  while not CdsCPFMNaoCalc.Eof do
  begin
     CdsLotes.Append;
     CdsLotes.FieldByName('RECALCULA').AsString   := '1';
     CdsLotes.FieldByName('NUMLOTE').AsString     := CdsCPFMNaoCalc.FieldByName('NUMLOTE').AsString;
     CdsLotes.FieldByName('FAVORECIDO').AsString  := CdsCPFMNaoCalc.FieldByName('FAVORECIDO').AsString;
     CdsLotes.FieldByName('DATAEMISSAO').AsString := CdsCPFMNaoCalc.FieldByName('DATAEMISSAO').AsString;
     CdsLotes.FieldByName('VALORLOTE').AsString   := CdsCPFMNaoCalc.FieldByName('VALORLOTE').AsString;
     CdsLotes.FieldByName('VALPREVISTO').AsString := CdsCPFMNaoCalc.FieldByName('VALPREVISTO').AsString;
     CdsLotes.FieldByName('ORIGEM').AsString      := CdsCPFMNaoCalc.FieldByName('ORIGEM').AsString;

     //  Grava o registro e move o cursor para o próximo
     CdsLotes.Post;
     CdsCPFMNaoCalc.Next;
  end;


end;



procedure TDtmRelConciliaCPMF.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlConciliaCPMF := TCtrlConciliaCPMF.Create;
  CtrlConciliaCPMF.InitializeAs(padroes);
  SqlDadosEmpresa.Open;
end;




procedure TDtmRelConciliaCPMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlConciliaCPMF);
end;



function TDtmRelConciliaCPMF.VerificaCPMF(sDataProgramada: string): Boolean;
var
   bDivergencia: boolean;
   lListaDiverg: TStrings;

begin
   Result := False;
   try
      if Trim(sDataProgramada) = '' then
         Exit
      else
      begin
         //  Definindo valores às variáveis
         lListaDiverg := TStringList.Create;
         bDivergencia := False;
         Result       := False;
         sPercentual  := '';

         //  Passando os parâmetros à qry e abrindo-a em seguida
         CdsVerificaCPMF.Close;
         SqlVerificaCPMF.Prepare;
         SqlVerificaCPMF.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
         SqlVerificaCPMF.ParamByName('DATA').AsString := sDataProgramada;
         SqlVerificaCPMF.Open;


         //  Pega o primeiro percentual do cds e passa-o para a variável
         //e em seguida, adiciona valores à lista de divergências
         sPercentual := CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString;
         lListaDiverg.Add('');


         //  Varre o cds para fazer a verificação da CPMF
         while not CdsVerificaCPMF.Eof do
         begin
            //  Verifica se o percentual anterior é diferente do percentual encontrado
            //  Caso seja, é ativado o flg "bDivergecia" e inserido na lista, a CPMF divergente
            if CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString <> sPercentual then
               bDivergencia := True
            else
               //  Se não for diferente, passa o percentual encontrado para a variável
               sPercentual := CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString;


             lListaDiverg.Add(CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString + ' - ' + CdsVerificaCPMF.FieldByName('DESCCUSTAGREG').AsString);
            //  Move o cursor ao próximo registro
            CdsVerificaCPMF.Next;
         end;


         //  Caso tenha sido encontrado divergências, envia a mensagem ao usuário
         //e mantém o Result = False
         if bDivergencia then
            MsgDlg('Houve divergências nas CPMF''s abaixo. Não será possível prosseguir ' + #13 +
                    'até que o erro seja corrigido.'                                      + #13 +
                   lListaDiverg.Text, Sistema.NomeAplicativo, mtWarning, [mbOk],0)
         else
         //  Caso não haja divergências...
            Result := true;
      end;

   finally
      FreeAndNil(lListaDiverg);
   end;
end;



function TDtmRelConciliaCPMF.TrocaPontoOuVirgula(bTrocaPorPonto: Boolean;
  sValor: string): string;
var
i, iItemsString: integer;
sValorFinal: string;

begin
//   Esta função troca todos as vírgulas encontradas na string
//passada por ponto, para poderem ser usadas nas qry's.
   Result       := '';
   iItemsString := Length(sValor);

   for i := 1 to iItemsString do
   begin
     //  Se for trocar vírgula por ponto...
     if bTrocaPorPonto then
     begin
        if sValor[i] = ',' then
           sValorFinal := sValorFinal + '.'
        else
           sValorFinal := sValorFinal + sValor[i];
     end
     else
     //  Se for trocar ponto por vírgula...
     begin
        if sValor[i] = '.' then
           sValorFinal := sValorFinal + ','
        else
           sValorFinal := sValorFinal + sValor[i];
     end;
   end;

   Result := sValorFinal;
end;


end.
