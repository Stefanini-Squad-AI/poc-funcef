{ --------------------------------------------------------------------------------------------------
Rotina......:  CountTotaisContratos, PegaValoresSituacao
Nº SOL......: 211604
Nº Kintana..: 2034560
Data........: 28/09/2016
Responsável.: William Moreira da Silva
Descrição...: Inclusão do quadro de situação do contrato que permite filtrar os contratos por situação,
              inclusão do campo Situação no quadro de Campos a Exibir.
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
Rotina......: contarContratos, CrmRptCMBeforePrint, CmpRptCm e lblCont2.
Nº SOL......: 163752
Nº KINTANA..: 1439098
Data........: 30/09/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foi criada a rotina contarContratos para calcular a quantidade de
              contratos e foi alterada a rotina CrmRptCMBeforePrint para que
              quando for selecionado Contratos Encerrados e Data do TIpo
              Vencimento seja buscados pela data de encerramento e não a data
              de previsão de encerramento.
Alteração dfm: Foi alterado os Items do Tipo de Contrato do componente CmpRptCm
               para vingente e foi criado o Label lblCont2 para exibir a
               quantidade de contratos.
--------------------------------------------------------------------------------
Pendência   : 24860
Responsável : Daniel Simões
Data        : 03/04/2007
Descrição   : Implementação Sub-Relatório em que é exibido os Reajustes
              Contratuais.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit RContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppCtrls, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Wwdatsrc, ppModule, raCodMod, TXRB, ppParameter, ppStrtch,
  ppSubRpt;

type
  TRptContratos = class(TFrmCmReport)
    dsContratos: TwwDataSource;
    pplContratos: TppBDEPipeline;
    rpContratos: TppReport;
    spContratos: TCMSqlParams;
    cdsContratos: TCMClientDataSet;
    ppParameterList1: TppParameterList;
    dsReajuste: TwwDataSource;
    pplReajuste: TppBDEPipeline;
    spReajuste: TCMSqlParams;
    cdsReajuste: TCMClientDataSet;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    pplblNomeEmpresa: TppLabel;
    rpContratosLine1: TppLine;
    rpContratosLine4: TppLine;
    ppDetailBand3: TppDetailBand;
    rpContratosDBText17: TppDBText;
    rpContratosDBText18: TppDBText;
    ppFooterBand3: TppFooterBand;
    pplblNomeSistema: TppLabel;
    rpContratosLine3: TppLine;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    pplblTotalContratos: TppLabel;
    lblCont: TppVariable;
    rpContratosGroup1: TppGroup;
    rpContratosGroupHeaderBand1: TppGroupHeaderBand;
    rpContratosShape1: TppShape;
    rpContratosDBText1: TppDBText;
    rpContratosLabel1: TppLabel;
    rpContratosLabel2: TppLabel;
    rpContratosDBText2: TppDBText;
    rpContratosLabel3: TppLabel;
    rpContratosDBText3: TppDBText;
    rpContratosLabel4: TppLabel;
    rpContratosDBText4: TppDBText;
    rpContratosLabel5: TppLabel;
    rpContratosDBText5: TppDBText;
    rpContratosLabel6: TppLabel;
    rpContratosDBText6: TppDBText;
    rpContratosLabel7: TppLabel;
    rpContratosDBText7: TppDBText;
    rpContratosLabel8: TppLabel;
    rpContratosDBText8: TppDBText;
    rpContratosDBText9: TppDBText;
    rpContratosGroupFooterBand1: TppGroupFooterBand;
    rpContratosLine2: TppLine;
    ppLine6: TppLine;
    rpContratosGroup2: TppGroup;
    rpContratosGroupHeaderBand2: TppGroupHeaderBand;
    rpContratosLabel9: TppLabel;
    rpContratosDBText10: TppDBText;
    rpContratosLabel10: TppLabel;
    rpContratosLabel11: TppLabel;
    rpContratosLabel12: TppLabel;
    rpContratosLabel13: TppLabel;
    rpContratosLabel14: TppLabel;
    rpContratosGroupFooterBand2: TppGroupFooterBand;
    rpContratosGroup3: TppGroup;
    rpContratosGroupHeaderBand3: TppGroupHeaderBand;
    rpContratosDBText11: TppDBText;
    rpContratosDBText12: TppDBText;
    rpContratosDBText13: TppDBText;
    rpContratosDBText14: TppDBText;
    rpContratosDBText15: TppDBText;
    rpContratosLabel15: TppLabel;
    rpContratosDBText16: TppDBText;
    rpContratosLabel16: TppLabel;
    rpContratosLabel17: TppLabel;
    rpContratosGroupFooterBand3: TppGroupFooterBand;
    ppsrReajuste: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBtextDescricaoAditamento: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    raCodeModule1: TraCodeModule;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    lblCont2: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsrReajustePrint(Sender: TObject);
  private
    function contarContratos: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptContratos: TRptContratos;

implementation

{$R *.DFM}

//Vinicius Maciel - SOL 163752 KTN 1439098
function TRptContratos.contarContratos: Integer;
var
    contador : integer;
    idContrato : integer;
begin
   contador := 0;
   cdsContratos.First;
   idContrato:= 0;

   while not cdsContratos.Eof Do
   begin
       if (idcontrato <> cdsContratos.FieldByName('IDCONTRATO').asInteger) then
       begin
       contador := contador + 1;
       idContrato := cdsContratos.FieldByName('IDCONTRATO').asInteger;
       end;
   cdsContratos.Next;
   end;
   result := contador;
end;
//Vinicius Maciel - SOL 163752 KTN 1439098 - Fim
procedure TRptContratos.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   with spContratos.SQL do
   begin
      Clear;
      Add('SELECT ');
      Add('   C.IDCONTRATO, ');
      Add('   C.NOMECONTRATO, ');
      Add('   C.IDFORCLI, ');
      Add('   P.NOME NOMEFORCLI, ');
      Add('   C.IDRESPONSAVEL, ');
      Add('   RS.NOME NOMERESP, ');
      Add('   C.DATAINICIO, ');
      Add('   C.DATAASSINATURA, ');
      Add('   C.DATABASECONTRATO, ');
      Add('   C.DATAPREVENCERRA, ');
      Add('   C.DATAEFETENCERRA, ');
      // Pendência 22753 - Marcos Topini
        Add('   C.OBSERVACAO AS OBS_CONTRATO,');
        Add('   C.RENOVACAO,');
        Add('   T.DESCRICAO AS DESC_TIPODESEMB,');
      // Fim Pendência 22753
      Add('   OI.IDITEM, ');
      Add('   I.NOME_ITEM, ');
      Add('   OI.IDOBJETO, ');
      Add('   O.NOMEOBJETO, ');
      Add('   OI.DATABASEITEM, ');
      Add('   OI.MOECODIGO, ');
      Add('   M.MOEDESC, ');
      Add('   OI.QTDEITEM, ');
      Add('   OI.VALORUNITARIOOBJETO, ');
      Add('   OI.VALORTOTALOBJETO, ');
      Add('   OI.DATAINICIOCOBR, ');
      Add('   OI.OBSERVACAO, ');
      Add('   C.VALORBASECONTRATO, ');
      Add('   DECODE (C.TIPOCONTRATO,''P'',''A Pagar'',''R'',''A Receber'') TIPOC, ');
      Add('   DECODE (OI.FREQUENCIA,''M'',''mensal'',''U'','+
              '''unica'',''D'',''diaria'',''A'',''anual'') FREQ, ');
      Add('   DECODE (i.tipocobranca, ''PQ'',''Sim'',''PV'',''Sim'',''EQ'',''Sim'','+
                                     '''EV'',''Sim'',''AQ'',''Sim'',''AV'',''Sim'',''Nao'') TPCOB, ');
      Add('   R.PERCRATEIOCONTR, ');
      Add('   CC.NOME AS NOMECC, ');
      Add('   ADT.DATAASSADITAMENTO AS DATAADITAMENTO ');
      Add('FROM ');
      Add('   CONTRATOCONTR C, ');
      Add('   OBJETOSXITEMCONTR OI, ');

      //Pendencia 22753 - Marcos Topini
      Add('   OBJETOXITEM OXI,  ');
      Add('   TIPORECEBDESEMB T,  ');
      //Fim Pendência

      Add('   OBJETOCONTRATUAL O, ');
      Add('   ITEMCONTRATUAL I, ');
      Add('   RATEIOCENTROCUSTO R, ');
      Add('   CENTCUST CC, ');
      Add('   PESSOA P, ');
      Add('   PESSOA RS, ');
      Add('   MOEDA M, ');
      Add('   CONTRATOUSUARIO CXU, ');
      Add('   (SELECT AD1.DATAASSADITAMENTO, ');
      Add('           AD1.IDCONTRATO ');
      Add('    FROM ADITAMENTO AD1 ');
      Add('    WHERE (AD1.IDADITAMENTO=(SELECT MAX(AD2.IDADITAMENTO) ');
      Add('                             FROM ADITAMENTO AD2 ');
      Add('                             WHERE (AD2.IDCONTRATO= AD1.IDCONTRATO)))) ADT ');
      Add('WHERE ');
      Add('    (C.IDFORCLI=P.IDPESSOA(+)) AND ');
      Add('    (C.IDRESPONSAVEL=RS.IDPESSOA(+)) AND ');
      Add('    (C.IDCONTRATO=OI.IDCONTRATO(+)) AND ');
      Add('    (C.IDCONTRATO = ADT.IDCONTRATO(+)) AND ');
      Add('    (C.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ');
      Add('    (OI.IDITEM=I.IDITEM) AND ');
      Add('    (OI.IDOBJETO=O.IDOBJETO) AND ');
      Add('    (OI.MOECODIGO=M.MOECODIGO(+)) AND ');
      Add('    (OI.IDCONTRATO=R.IDCONTRATO(+)) AND ');
      Add('    (OI.IDOBJETO=R.IDOBJETO(+)) AND ');
      Add('    (OI.IDITEM=R.IDITEM(+)) AND ');
      Add('    (R.IDEMPRESA=CC.IDEMPRESA) AND ');
      Add('    (R.CODCENTROCUSTO=CC.CODCENTROCUSTO) AND ');
      Add('    (CXU.IDCONTRATO = C.IDCONTRATO) AND ');
      Add('    (CXU.IDUSUARIO = '+FloatToStr(CrmRptCM.IdUsuario)+') AND ');

      // Pendencia 22753 - Marcos Topini
      Add('    (OXI.IDPESSOA      = T.IDPESSOA )   AND  ');
      Add('    (OXI.RECPAG       = T.RECPAG)       AND  ');
      Add('    (OXI.CODTIPRECDES = T.CODTIPRECDES) AND  ');
      Add('    (OI.IDITEM        = OXI.IDITEM)     AND  ');
      Add('    (OI.IDOBJETO      = OXI.IDOBJETO)');
      // Fim Pendencia 22753

      case CmpRptCM.ParamValues[0].AsInteger  of
         1: Add('    AND (RTRIM(C.FLGFIMCONTRATO) = ''N'') ');
         2: Add('    AND (RTRIM(C.FLGFIMCONTRATO) = ''S'') ');
         3: Add('    AND (RTRIM(C.FLGFIMCONTRATO) = ''E'') ');
      end;

      case CmpRptCM.ParamValues[1].AsInteger  of
         1: Add('    AND (C.DATAPREVENCERRA IS NOT NULL) ');
         2: Add('    AND (C.DATAPREVENCERRA IS NULL) ');
      end;

      case CmpRptCM.ParamValues[2].AsInteger of
         0: begin
               if not(CmpRptCM.ParamValues[3].IsNull) then
                  Add('  AND (C.DATAASSINATURA >= TO_DATE('''+
                  FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[3].AsDateTime)+''',''dd/mm/yyyy'')) ');

               if not(CmpRptCM.ParamValues[4].IsNull) and
                     ((CmpRptCM.ParamValues[3].AsDateTime<=CmpRptCM.ParamValues[4].AsDateTime) or
                      (CmpRptCM.ParamValues[3].IsNull)) then
                  Add('  AND (C.DATAASSINATURA <= TO_DATE('''+
                  FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime)+''',''dd/mm/yyyy'')) ');
            end;
         1: begin
                if not(CmpRptCM.ParamValues[3].IsNull) then
                    if CmpRptCM.ParamValues[0].AsInteger <> 3 then //Vinicius Maciel - SOL 163752 KTN 1439098
                    Add('  AND (C.DATAPREVENCERRA >= TO_DATE('''+ FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[3].AsDateTime)+''',''dd/mm/yyyy'')) '){;}
                    //Vinicius Maciel - SOL 163752 KTN 1439098
                    else
                    Add('  AND (C.DATAEFETENCERRA >= TO_DATE('''+ FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[3].AsDateTime)+''',''dd/mm/yyyy'')) ');
                    //Vinicius Maciel - SOL 163752 KTN 1439098  - Fim

                    if not(CmpRptCM.ParamValues[4].IsNull) and ((CmpRptCM.ParamValues[3].AsDateTime<=CmpRptCM.ParamValues[4].AsDateTime) or (CmpRptCM.ParamValues[3].IsNull)) then
                    if (CmpRptCM.ParamValues[0].AsInteger <> 3) then
                    Add('  AND (C.DATAPREVENCERRA <= TO_DATE('''+ FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime)+''',''dd/mm/yyyy'')) '){;}
                    //Vinicius Maciel - SOL 163752 KTN 1439098
                    else
                    Add('  AND (C.DATAEFETENCERRA <= TO_DATE('''+ FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime)+''',''dd/mm/yyyy'')) ');
                    //Vinicius Maciel - SOL 163752 KTN 1439098  - Fim
            end;
      end;
      //William Moreira da Silva - SOL 211604 - C.IDCONTRATO no order by
      Add('ORDER BY C.NOMECONTRATO, C.IDCONTRATO, O.NOMEOBJETO, I.NOME_ITEM, NOMECC ');
   end;

   spContratos.Open;
   lblCont2.Caption := IntToStr(contarContratos); //Vinicius Maciel - SOL 163752 KTN 1439098
   // Daniel - 24860
   spReajuste.Open;
end;

procedure TRptContratos.ppsrReajustePrint(Sender: TObject);
begin
  inherited;

// Daniel - 24860 - Início -----------------------------------------------------
  cdsReajuste.Filtered := False;
  cdsReajuste.Filter   := 'IDCONTRATO = '+QuotedStr(IntToStr(cdsContratos.FieldByName('IDCONTRATO').AsInteger));
  cdsReajuste.Filter   := 'IDOBJETO   = '+QuotedStr(IntToStr(cdsContratos.FieldByName('IDOBJETO').AsInteger));
  cdsReajuste.Filter   := 'IDITEM     = '+QuotedStr(IntToStr(cdsContratos.FieldByName('IDITEM').AsInteger));
  cdsReajuste.Filtered := True;
// Daniel - 24860 - Fim --------------------------------------------------------

end;

end.
