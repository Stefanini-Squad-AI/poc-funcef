{
------------------------------------------------------------------------------------------------------------
Nº                : WO14022
Data da Alteração : 13/11/2024
Responsável       : Edilaine
Descrição         : No ambiente VM o relatorio sai apenas com uma pagina
Rotina de calculo : (dfm rptRelValorAtualizado)
------------------------------------------------------------------------------------------------------------
Nº                : WO16747
Data da Alteração : 04/12/2024
Responsável       : Luis Ferrari
Descrição         : Troca do Logotipo Funcef.
------------------------------------------------------------------------------------------------------------
Nº SOL            : 218798.16629
Nº PPM            : 560594
Data da Alteração : 01/12/2014
Alteração Form    : Criar opção para geração por contratos
Responsável       : William Santana
Descrição         : alteração DFM ( e no relatório que é gravado na base )
------------------------------------------------------------------------------------------------------------
Pendência   : SOL 225485 KINTANA 2059144
Responsável : William Moreira da Silva
Data        : 04/02/2014
Descrição   : Erro no campo FLGPERDAEFETIVA ao gerar o relatório, retirada a versão do SOL 213592(.DFM)
--------------------------------------------------------------------------------}
unit dRelValorAtualizado;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, jpeg, ppStrtch, ppRegion,
  StdCtrls, ppParameter;

type
   TdtmRelValorAtualizado = class(TdtmReports)
      pplValorAtualizado: TppBDEPipeline;
      dtsValorAtualizado: TwwDataSource;
      rptRelValorAtualizado: TppReport;
      qryValorAtualizado: TwwQuery;
      updValorAtualizado: TUpdateSQL;
      qryValorAtualizadoITEDESCRICAO: TStringField;
      qryValorAtualizadoEVENTO: TStringField;
      qryValorAtualizadoANOMES: TStringField;
      qryValorAtualizadoIDCONTRATOEMPTMO: TFloatField;
      qryValorAtualizadoHMETIPOMOV: TFloatField;
      qryValorAtualizadoIDITEMEMPTMO: TFloatField;
      qryValorAtualizadoHMEANOCOMPETENCIA: TFloatField;
      qryValorAtualizadoHMEMESCOMPETENCIA: TFloatField;
      qryValorAtualizadoHMEDATAPREVISTA: TDateTimeField;
      qryValorAtualizadoHMEVLRPREVISTO: TFloatField;
      qryValorAtualizadoHMEPARCELAALT: TFloatField;
      qryValorAtualizadoHMENUMPARCELAS: TFloatField;
      qryValorAtualizadoHMESEQCOBRANCA: TFloatField;
      qryValorAtualizadoHMESALDODEV: TFloatField;
      qryValorAtualizadoHMETXJUROS: TFloatField;
      qryValorAtualizadoVLR_ENCARGOS: TFloatField;
      qryValorAtualizadoVLR_ATUALIZADO: TFloatField;
    qryValorAtualizadoVLR_CORRECAO: TFloatField;
    qryValorAtualizadoVLR_MULTA: TFloatField;
    qryValorAtualizadoVLR_JUROSMORA: TFloatField;
    qryValorAtualizadoVLR_JUROSREMUNERA: TFloatField;
    qryValorAtualizadoPARCELAS: TStringField;
    qryValorAtualizadoHMEPARCELA: TFloatField;
    rptOld: TppReport;
    ppTitleBand2: TppTitleBand;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppImage3: TppImage;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppShape6: TppShape;
    ppLabel27: TppLabel;
    ppLine12: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine13: TppLine;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel104: TppLabel;
    ppLine14: TppLine;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel113: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLine15: TppLine;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppImage4: TppImage;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    ppLabel166: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel169: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLine16: TppLine;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel177: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape12: TppShape;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;                                 
    ppFooterBand2: TppFooterBand;
    ppLine17: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppLine32: TppLine;
    ppDBCalc14: TppDBCalc;
    ppLine33: TppLine;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLine34: TppLine;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLabel202: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel205: TppLabel;
    ppLabel206: TppLabel;
    ppLine37: TppLine;
    ppLabel207: TppLabel;
    ppLabel208: TppLabel;
    ppLine38: TppLine;
    qryValorAtualizadoTSEDESCRICAO: TStringField;
    qryValorAtualizadoTAXA: TStringField;
    qryValorAtualizadoPRAZO: TStringField;
    qryValorAtualizadoDATACREDITO: TStringField;
    qryValorAtualizadoINDICE: TStringField;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel187: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppLabel191: TppLabel;
    ppLabel192: TppLabel;
    qryValorAtualizadoVLRFGQC: TFloatField;
    qryValorAtualizadoTOTALDEVIDO: TFloatField;
    qryValorAtualizadoVLRATUALIZADO: TFloatField;
    qryValorAtualizadoVLRDEVVENCIDO: TFloatField;
    qryValorAtualizadoVLRDEVVENCER: TFloatField;
    qryValorAtualizadoQTDEPRESTACOES: TFloatField;
    qryValorAtualizadoQTDEFGQC: TFloatField;
    qryValorAtualizadoVLR_IOFCOMP: TFloatField;
    ppLabel35: TppLabel;
    pplfExemploppField1: TppField;
    pplfExemploppField2: TppField;
    prmtrlst1: TppParameterList;
    phdrbnd1: TppHeaderBand;
    pmg1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    rpp1: TppShape;
    ppLabel95: TppLabel;
    ppLabel6: TppLabel;
    ppLabel18: TppLabel;
    ppLine21: TppLine;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    rptRelValorAtualizado_lblPlano: TppLabel;
    rptRelValorAtualizado_lblPatrocinadora: TppLabel;
    rptRelValorAtualizado_lblMatricula: TppLabel;
    rptRelValorAtualizado_lblCPF: TppLabel;
    rptRelValorAtualizado_lblMutuario: TppLabel;
    pdtlbnd1: TppDetailBand;
    ppShape3: TppShape;
    pdbtxtRelValorAtualizado_Itens: TppDBText;
    pdbtxt1: TppDBText;
    pdbtxt2: TppDBText;
    pdbtxt3: TppDBText;
    pdbtxt4: TppDBText;
    pdbtxt5: TppDBText;
    pdbtxt6: TppDBText;
    pdbtxt7: TppDBText;
    pdbtxt8: TppDBText;
    pdbtxt9: TppDBText;
    pdbtxt10: TppDBText;
    pftrbnd1: TppFooterBand;
    psystmvrbl1: TppSystemVariable;
    psystmvrbl2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel69: TppLabel;
    ppLabel71: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLabel77: TppLabel;
    ppLine3: TppLine;
    ppLabel41: TppLabel;
    pdbtxt11: TppDBText;
    pgrp1: TppGroup;
    pgrphdrbnd1: TppGroupHeaderBand;
    rpp3: TppShape;
    rpp4: TppShape;
    ppLabel101: TppLabel;
    ppLine27: TppLine;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    pdbtxt12: TppDBText;
    pdbtxt13: TppDBText;
    pdbtxt14: TppDBText;
    pdbtxt15: TppDBText;
    pdbtxt16: TppDBText;
    pdbtxt17: TppDBText;
    ppLabel114: TppLabel;
    ppLine28: TppLine;
    ppLabel116: TppLabel;
    ppLabel115: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    rptRelValorAtualizado_lblDataVencto2: TppLabel;
    ppLabel131: TppLabel;
    ppLabel12: TppLabel;
    pgrpftrbnd1: TppGroupFooterBand;
    ppLabel22: TppLabel;
    ppLine11: TppLine;
    pdbclc1: TppDBCalc;
    ppLine10: TppLine;
    pdbclc2: TppDBCalc;
    ppLine9: TppLine;
    pdbclc3: TppDBCalc;
    ppLine8: TppLine;
    pdbclc4: TppDBCalc;
    ppLine7: TppLine;
    pdbclc5: TppDBCalc;
    ppLine2: TppLine;
    pdbclc6: TppDBCalc;
    ppLine5: TppLine;
    pdbclc7: TppDBCalc;
    ppLine6: TppLine;
    ppLine23: TppLine;
    ppLabel78: TppLabel;
    ppLine24: TppLine;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine1: TppLine;
    ppLabel85: TppLabel;
    ppLabel84: TppLabel;
    ppLabel83: TppLabel;
    ppLabel79: TppLabel;
    ppLabel82: TppLabel;
    pdbtxt18: TppDBText;
    pdbtxt19: TppDBText;
    pdbtxt20: TppDBText;
    pdbtxt21: TppDBText;
    pdbtxt22: TppDBText;
    pdbtxt23: TppDBText;
    pdbtxt24: TppDBText;
    ppLabel42: TppLabel;
    ppLabel34: TppLabel;
    rptRelValorAtualizado_lblSitPart: TppLabel;
    pplfValorAtualizadoppField1: TppField;
    pplfValorAtualizadoppField2: TppField;
    pplfValorAtualizadoppField3: TppField;
    pplfValorAtualizadoppField4: TppField;
    pplfValorAtualizadoppField5: TppField;
    pplfValorAtualizadoppField6: TppField;
    pplfValorAtualizadoppField7: TppField;
    pplfValorAtualizadoppField8: TppField;
    pplfValorAtualizadoppField9: TppField;
    pplfValorAtualizadoppField10: TppField;
    pplfValorAtualizadoppField11: TppField;
    pplfValorAtualizadoppField12: TppField;
    pplfValorAtualizadoppField13: TppField;
    pplfValorAtualizadoppField14: TppField;
    pplfValorAtualizadoppField15: TppField;
    pplfValorAtualizadoppField16: TppField;
    pplfValorAtualizadoppField17: TppField;
    pplfValorAtualizadoppField18: TppField;
    pplfValorAtualizadoppField19: TppField;
    pplfValorAtualizadoppField20: TppField;
    pplfValorAtualizadoppField21: TppField;
    pplfValorAtualizadoppField22: TppField;
    pplfValorAtualizadoppField23: TppField;
    pplfValorAtualizadoppField24: TppField;
    pplfValorAtualizadoppField25: TppField;
    pplfValorAtualizadoppField26: TppField;
    pplfValorAtualizadoppField27: TppField;
    pplfValorAtualizadoppField28: TppField;
    pplfValorAtualizadoppField29: TppField;
    pplfValorAtualizadoppField30: TppField;
    pplfValorAtualizadoppField31: TppField;
    pplfValorAtualizadoppField32: TppField;
    pplfValorAtualizadoppField33: TppField;
    pplfValorAtualizadoppField34: TppField;
    pplfValorAtualizadoppField35: TppField;
    pplfValorAtualizadoppField36: TppField;
    ppLine4: TppLine;
    ppLabel36: TppLabel;
    pdbtxtVLR_IOFCOMP: TppDBText;
    pdbclcVLR_IOFCOMP: TppDBCalc;
   

      procedure ppShape3Print(Sender: TObject);


   private  // Private declarations

      //    Cores:
      //    ColorA = $FFFFFF     branco, clWhite
      //    ColorC = $00C0FFFF   amarelo - pastel
      //    ColorD = $00C6F9CC   verde - pastel
      //    ColorE = $00F3E6CD   azul - pastel
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

      //             $00E8E8E8   cinza bem claro

   public   // Public declarations

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelValorAtualizado: TdtmRelValorAtualizado;



implementation
{$R *.DFM}
uses
   CRelValorAtualizado;



function TdtmRelValorAtualizado.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelvaloratualizado') then
   begin
      frm := TcfgRelValorAtualizado.Create(Application);
   end
   else
   begin
      frm := nil;
   end;

   if frm = nil then
   begin
      Result := False;
      Exit;
   end;

   with frm do
   begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;




procedure TdtmRelValorAtualizado.ppShape3Print(Sender: TObject);
begin
   inherited;

   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



end.
