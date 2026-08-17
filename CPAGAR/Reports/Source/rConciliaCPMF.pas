{ --------------------------------------------------------------------------------------------------
Autor     : André Tavares
Data      : 31/11/2007
Pendência : 26667
Descrição : Alterei a query de SqlRateio e , SqlRelPorDoc ( troquei as unions por union all)
 --------------------------------------------------------------------------------------------------}

unit rConciliaCPMF;
{//======================================================================

  Criado em 05/07/2005 por Rodolpho da Silva, p: 19331

//======================================================================}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, uCmSqlParams,
  Wwdatsrc, DBClient, uCMClientDataSet, ppCtrls, ppVar, ppBands, ppReport,
  ppStrtch, ppSubRpt, ppPrnabl, ppClass, ppCache, uCmTypes, ppComm, ppRelatv,
  ppProd, uCtrlPadroes, uMensErro, uCtrlConciliaCPMF, uSistema, ppDB,
  ppDBPipe, TXRB;


type
  TRptConciliaCPMF = class(TFrmCmReport)
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
    SqlCPFMNaoCalc: TCMSqlParams;
    CdsCPFMNaoCalc: TCMClientDataSet;
    dsDadosEmpresa: TwwDataSource;
    CdsDadosEmpresa: TCMClientDataSet;
    SqlDadosEmpresa: TCMSqlParams;
    SqlRelPorDoc: TCMSqlParams;
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
    dsRelPorDoc: TwwDataSource;
    dsRateio: TwwDataSource;
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
    SqlRateio: TCMSqlParams;
    SqlVerificaCPMF: TCMSqlParams;
    CdsVerificaCPMF: TCMClientDataSet;
    ppPipLinRelPorDoc: TppDBPipeline;
    ppPipLinDadosEmpresa: TppDBPipeline;
    ppPipLinDadosRel: TppDBPipeline;
    ppPipLinRateio: TppDBPipeline;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmpRptCMAfterExecute(ActionExecute: TActionExecute);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure rptRelLotesCPMFEndPage(Sender: TObject);
    procedure rptRelLotesCPMFStartPage(Sender: TObject);
    procedure ppShpCorZebraSub2Print(Sender: TObject);
    procedure ppSubRepDocPrint(Sender: TObject);
    procedure ppSubRepRatPrint(Sender: TObject);
    procedure ppShpCorZebraPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppShpCorLinhaPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlConciliaCPMF : TCtrlConciliaCPMF;
    // Variável que instancia o percentual da CPMF
    sPercentual      : string;

   function VerificaCPMF(sDataProgramada: string): Boolean;
   function TrocaPontoOuVirgula(bTrocaPorPonto: Boolean; sValor: string): string;
   function  IsCpmfConsistente: Boolean;


  public
    { Public declarations }
  end;





var
  RptConciliaCPMF: TRptConciliaCPMF;

implementation

{$R *.DFM}

function TRptConciliaCPMF.TrocaPontoOuVirgula(bTrocaPorPonto: Boolean;
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




function TRptConciliaCPMF.VerificaCPMF(sDataProgramada: string): Boolean;
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




procedure TRptConciliaCPMF.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
  CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := sSQl;
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(date);   
end;




procedure TRptConciliaCPMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlConciliaCPMF);
   inherited;
end;




procedure TRptConciliaCPMF.CmpRptCMAfterExecute(
  ActionExecute: TActionExecute);

var
   rValPrev: double;
begin
  inherited;
  IF ActionExecute in [AeCancelar,AeAbort] then exit;
  CtrlConciliaCPMF := TCtrlConciliaCPMF.Create;
  CtrlConciliaCPMF.InitializeAs(padroes);
  CtrlConciliaCPMF.IdPessoa := Sistema.IdEmpresa;

  SqlDadosEmpresa.Open;
  inherited;

  rValPrev := 0;

  if VerificaCPMF(CmpRptCM.ParamValues[1].AsString) then

  CdsLotes.Data := CtrlConciliaCPMF.SelLotes(CmpRptCM.ParamValues[0].AsInteger,
                                             CmpRptCM.ParamValues[2].AsInteger,
                                             CmpRptCM.ParamValues[4].AsInteger,
                                             CmpRptCM.ParamValues[3].AsInteger,
                                             TrocaPontoOuVirgula(True,sPercentual),
                                             CmpRptCM.ParamValues[1].AsDateTime,rValPrev,StrToFloat(sPercentual),True);



  //  Passando valores aos parâmetros
  CdsCPFMNaoCalc.Close;
  SqlCPFMNaoCalc.Prepare;
  SqlCPFMNaoCalc.ParamByName('IDBANCO').Clear;
  SqlCPFMNaoCalc.ParamByName('CODPORTADOR').Clear;
  SqlCPFMNaoCalc.ParamByName('NUMLOTE').Clear;
  SqlCPFMNaoCalc.ParamByName('DATA').AsDate        := CmpRptCM.ParamValues[1].AsDateTime;
  SqlCPFMNaoCalc.ParamByName('PERCENTUAL').AsFloat := StrToFloat(sPercentual);

  //  Caso o usuário tenha passado valores aos parâmetros, os mesmos
  //são passados para a qry, abrindo-a em seguida
  if CmpRptCM.ParamValues[0].AsInteger > 0 then
     SqlCPFMNaoCalc.ParamByName('IDBANCO').AsInteger     := CmpRptCM.ParamValues[0].AsInteger;
  if CmpRptCM.ParamValues[3].AsInteger > 0 then
     SqlCPFMNaoCalc.ParamByName('CODPORTADOR').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
  if CmpRptCM.ParamValues[2].AsInteger > 0 then
     SqlCPFMNaoCalc.ParamByName('NUMLOTE').AsFloat       := CmpRptCM.ParamValues[2].AsInteger;
  SqlCPFMNaoCalc.Open;


  //  Abre o cds de Relatório por documento
  //  1º nível do sub-relatório
  CdsRelPorDoc.Close;
  SqlRelPorDoc.Prepare;
  SqlRelPorDoc.ParamByName('DATA').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
  SqlRelPorDoc.Open;


  //  Abre o cds de rateio
  //  2º nível do sub-relatório
  CdsRateio.Close;
  SqlRateio.Prepare;
  SqlRateio.ParamByName('DATA').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
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




procedure TRptConciliaCPMF.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
  case Index of
     //  Data Programada
     1: begin
           if trim(TPainelControles(sender).CtrlDateTimePicker.Text) = '' then
           begin
              MsgDlg('Informe a data programada','Aviso',mtWarning,[mbOk],0);
              TPainelControles(sender).CtrlDateTimePicker.Date := date;
              TPainelControles(sender).CtrlDateTimePicker.SetFocus;    
           end;   
        end;
  end;

end;

procedure TRptConciliaCPMF.rptRelLotesCPMFEndPage(Sender: TObject);
begin
  inherited;
  CdsRelPorDoc.Filter   := '';
  CdsRateio.Filter      := '';
  CdsRateio.Filtered    := false;
  CdsRelPorDoc.Filtered := false;
  CdsRelPorDoc.EnableControls;
end;




procedure TRptConciliaCPMF.rptRelLotesCPMFStartPage(Sender: TObject);
begin
  inherited;
  CdsRelPorDoc.DisableControls;
  CdsRateio.DisableControls;
  CdsRelPorDoc.Filtered := true;
  CdsRateio.Filtered    := true;
end;




procedure TRptConciliaCPMF.ppShpCorZebraSub2Print(Sender: TObject);
begin
  inherited;
  //  Pinta a linha do 2º sub-report
  if CdsRateioDESCCUSTAGREG.AsString = '' then
      ppShpCorZebraSub2.Brush.Color := $008080FF // Rosa bebê
   else
      ppShpCorZebraSub2.Brush.Color := clWhite;
end;




procedure TRptConciliaCPMF.ppSubRepDocPrint(Sender: TObject);
begin
  inherited;
  CdsRelPorDoc.Filter := 'NUMLOTE = ' + QuotedStr(IntToStr(CdsLotes.FieldByName('NUMLOTE').AsInteger));
end;




procedure TRptConciliaCPMF.ppSubRepRatPrint(Sender: TObject);
begin
  inherited;
  CdsRateio.Filter := 'CODDOCUMENTO = ' + QuotedStr(IntToStr(CdsRelPorDocCODDOCUMENTO.AsInteger));
end;




procedure TRptConciliaCPMF.ppShpCorZebraPrint(Sender: TObject);
var
   fDiferenca : Double;
begin
  inherited;
   //  Pinta a linha do 1º sub-report
   //  Extrai a diferença dos valores
   fDiferenca := CdsRelPorDocVLRLOTE.AsFloat - CdsRelPorDocVLRBASE.AsFloat;

   //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
   //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
   if not ((fDiferenca > -1.00) and (fDiferenca < 1.00)) then
      ppShpCorZebra.Brush.Color := $008080FF // Rosa bebê
   else
      ppShpCorZebra.Brush.Color := clWhite;
end;




procedure TRptConciliaCPMF.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  ppLbDescricao.Caption := 'Data programada :  ' + CmpRptCM.ParamValues[1].AsString;
  if CmpRptCM.ParamValues[5].AsString = 'S' then
     rptRelLotesCPMF.ExpandDrillDowns
  else
     rptRelLotesCPMF.CollapseDrillDowns;   
end;



procedure TRptConciliaCPMF.ppShpCorLinhaPrint(Sender: TObject);
begin
  inherited;
  ppShpCorLinha.Brush.Color := clWhite;

  if not CdsLotes.IsEmpty then
   begin
      //  Pinta a linha caso a CPMF não tenha sido calculada
      if CdsLotes.FieldByName('DATARETENCAO').IsNull then
         ppShpCorLinha.Brush.Color := $00B5FDFD // Amarelo bebê

      else
      begin
         if not(IsCpmfConsistente) then
            //  Pinta a linha caso CPMF tenha divergência
            ppShpCorLinha.Brush.Color := $008080FF; //  Rosa bebê
      end;
   end;
end;




function TRptConciliaCPMF.IsCpmfConsistente: Boolean;
var
   fDiferenca: Extended;
begin
   //  Extrai a diferença dos valores
   fDiferenca :=  CdsLotes.FieldByName('VALORLOTE').AsFloat - CdsLotes.FieldByName('VALORBASE').AsFloat;

   //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
   //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
   Result := (fDiferenca > -1.00) and (fDiferenca < 1.00);
end;

end.
