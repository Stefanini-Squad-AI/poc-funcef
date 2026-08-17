unit dRelCadCaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe;

type
  TdtmRelCadCaf = class(TdtmReports)
    qryBem: TwwQuery;
    dsBem: TwwDataSource;
    ppBem: TppBDEPipeline;
    rpBem: TppReport;
    ppHeaderBand1: TppHeaderBand;
    rpBemCabec: TppLabel;
    ppLabel2: TppLabel;
    rpBemLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    rpBemLabel1: TppLabel;
    rpBemLabel2: TppLabel;
    rpBemDBText2: TppDBText;
    rpBemLabel3: TppLabel;
    rpBemDBText3: TppDBText;
    rpBemLabel4: TppLabel;
    rpBemDBText4: TppDBText;
    rpBemLabel5: TppLabel;
    rpBemDBText5: TppDBText;
    rpBemLabel6: TppLabel;
    rpBemDBText6: TppDBText;
    rpBemLabel7: TppLabel;
    rpBemLabel8: TppLabel;
    rpBemDBText7: TppDBText;
    rpBemLabel9: TppLabel;
    rpBemDBText8: TppDBText;
    rpBemLabel10: TppLabel;
    rpBemDBText9: TppDBText;
    rpBemDBText10: TppDBText;
    rpBemDBText11: TppDBText;
    rpBemLabel11: TppLabel;
    rpBemLabel12: TppLabel;
    rpBemDBText12: TppDBText;
    rpBemLabel13: TppLabel;
    rpBemDBText13: TppDBText;
    rpBemLabel14: TppLabel;
    rpBemLabel15: TppLabel;
    rpBemLabel16: TppLabel;
    rpBemLabel17: TppLabel;
    rpBemLabel18: TppLabel;
    rpBemDBText14: TppDBText;
    rpBemDBText15: TppDBText;
    rpBemDBText16: TppDBText;
    rpBemDBText17: TppDBText;
    rpBemDBText18: TppDBText;
    rpBemLabel19: TppLabel;
    rpBemDBText19: TppDBText;
    rpBemLabel20: TppLabel;
    rpBemLabel21: TppLabel;
    rpBemDBText20: TppDBText;
    rpBemLabel22: TppLabel;
    rpBemLabel23: TppLabel;
    rpBemLine2: TppLine;
    rpBemLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    qryCadGrupo: TwwQuery;
    qryCadGrupoCLASSE: TStringField;
    qryCadGrupoNOME: TStringField;
    qryCadGrupoTIPO: TStringField;
    qryCadGrupoDEPRECIACAO: TFloatField;
    qryCadGrupoFLGIMOVEL: TFloatField;
    qryCadGrupoIDGRUPO: TFloatField;
    dsCadGrupo: TwwDataSource;
    ppCadGrupo: TppBDEPipeline;
    rpCadGrupo: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel89: TppLabel;
    rpCadGrupoLabel1: TppLabel;
    rpCadGrupoLabel2: TppLabel;
    rpCadGrupoLabel3: TppLabel;
    rpCadGrupoLine1: TppLine;
    ppDetailBand13: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    ppLine21: TppLine;
    ppLabel90: TppLabel;
    rpCadClasse: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel32: TppLabel;
    ppLine30: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLine31: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine32: TppLine;
    ppLabel37: TppLabel;
    ppCadClasse: TppBDEPipeline;
    dsCadClasse: TwwDataSource;
    qryCadClasse: TwwQuery;
    qryCadClasseCLASSE: TStringField;
    qryCadClasseNOME: TStringField;
    qryCadClasseTIPO: TStringField;
    qryCadLocal: TwwQuery;
    dsCadLocal: TwwDataSource;
    ppCadLocal: TppBDEPipeline;
    rpCadLocal: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel91: TppLabel;
    ppLine24: TppLine;
    ppLabel92: TppLabel;
    rpCadLocalLabel1: TppLabel;
    rpCadLocalLabel2: TppLabel;
    rpCadLocalLabel3: TppLabel;
    rpCadLocalLabel5: TppLabel;
    ppLine25: TppLine;
    rpCadLocalLabel6: TppLabel;
    ppDetailBand14: TppDetailBand;
    rpCadLocalDBText1: TppDBText;
    rpCadLocalDBText2: TppDBText;
    rpCadLocalDBText3: TppDBText;
    rpCadLocalDBText4: TppDBText;
    rpCadLocalDBText5: TppDBText;
    rpCadLocalDBText6: TppDBText;
    rpCadLocalLine1: TppLine;
    ppFooterBand14: TppFooterBand;
    ppLine26: TppLine;
    ppLabel96: TppLabel;
    rpCadTipArea: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel97: TppLabel;
    ppLine27: TppLine;
    ppLabel98: TppLabel;
    ppLabel100: TppLabel;
    ppLine28: TppLine;
    ppDetailBand15: TppDetailBand;
    ppDBText58: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine29: TppLine;
    ppLabel102: TppLabel;
    ppCadTipArea: TppBDEPipeline;
    dsCadTipArea: TwwDataSource;
    qryCadTipArea: TwwQuery;
    qryCadTipAreaDESCTIPOAREA: TStringField;
    qryCadTipMov: TwwQuery;
    qryCadTipMovIDTIPOMOVIMENTACAO: TFloatField;
    qryCadTipMovDESCTIPOMOVIMENTACAO: TStringField;
    dsCadTipMov: TwwDataSource;
    ppCadTipMov: TppBDEPipeline;
    rpCadTipMov: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel20: TppLabel;
    ppLine7: TppLine;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLine8: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine9: TppLine;
    ppLabel25: TppLabel;
    qryCadConj: TwwQuery;
    qryCadConjIDCONJUNTO: TFloatField;
    qryCadConjDESCCONJUNTO: TStringField;
    qryCadConjNOMELOCAL: TStringField;
    qryCadConjNOMERESP: TStringField;
    qryCadConjCODCENTROCUSTO: TStringField;
    qryCadConjDESCCENTROCUSTO: TStringField;
    qryCadConjPARTICIPACAO: TFloatField;
    dsCadConj: TwwDataSource;
    ppCadConj: TppBDEPipeline;
    rpCadConj: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    rpCadConjLine2: TppLine;
    ppDetailBand5: TppDetailBand;
    rpCadConjDBText3: TppDBText;
    rpCadConjDBText4: TppDBText;
    rpCadConjDBText5: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine12: TppLine;
    ppLabel31: TppLabel;
    rpCadConjGroup1: TppGroup;
    rpCadConjGroupHeaderBand1: TppGroupHeaderBand;
    rpCadConjLabel1: TppLabel;
    rpCadConjLabel2: TppLabel;
    rpCadConjLabel3: TppLabel;
    ppDBText17: TppDBText;
    rpCadConjDBText1: TppDBText;
    rpCadConjDBText2: TppDBText;
    rpCadConjLine1: TppLine;
    rpCadConjLabel4: TppLabel;
    rpCadConjLabel6: TppLabel;
    rpCadConjDBText6: TppDBText;
    rpCadConjGroupFooterBand1: TppGroupFooterBand;
    ppLine11: TppLine;
    qryConjxBens: TwwQuery;
    qryConjxBensIDCONJUNTO: TFloatField;
    qryConjxBensDESCCONJUNTO: TStringField;
    qryConjxBensNOMELOCAL: TStringField;
    qryConjxBensNOMERESP: TStringField;
    qryConjxBensPLACA: TFloatField;
    qryConjxBensDESBEM: TStringField;
    dsConjxBens: TwwDataSource;
    ppConjxBens: TppBDEPipeline;
    rpConjxBens: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine10: TppLine;
    ppDetailBand18: TppDetailBand;
    ppDBText2: TppDBText;
    rpConjxBensDBText1: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine37: TppLine;
    ppLabel30: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText18: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLine38: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    rpConjxBensDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine39: TppLine;
    qryCentCust: TwwQuery;
    dscentcust: TwwDataSource;
    ppCentCust: TppBDEPipeline;
    rpcentcust: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel18: TppLabel;
    qryParamCAFxContab: TwwQuery;
    qryParamCAFxContabIDGRUPO: TFloatField;
    qryParamCAFxContabDESCGRUPO: TStringField;
    qryParamCAFxContabCLASSE: TStringField;
    qryParamCAFxContabIDTIPOMOVIMENTACAO: TFloatField;
    qryParamCAFxContabDESCTIPOMOVIMENTACAO: TStringField;
    qryParamCAFxContabPLANO: TFloatField;
    qryParamCAFxContabPLACONTA: TStringField;
    qryParamCAFxContabPLANOME: TStringField;
    qryParamCAFxContabDEBCRED: TStringField;
    dsParamCAFxContab: TwwDataSource;
    ppParamCAFxContab: TppBDEPipeline;
    rpParamCAFxContab: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel85: TppLabel;
    ppLabel87: TppLabel;
    rpCtaMovGrpPlanoConta: TppLabel;
    ppDetailBand12: TppDetailBand;
    rpCtaMovGrpDBText4: TppDBText;
    rpCtaMovGrpDBText5: TppDBText;
    rpCtaMovGrpDBText6: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine23: TppLine;
    ppLabel88: TppLabel;
    rpCtaMovGrpGroup2: TppGroup;
    rpCtaMovGrpGroupHeaderBand2: TppGroupHeaderBand;
    rpCtaMovGrpLabel1: TppLabel;
    rpCtaMovGrpDBText2: TppDBText;
    rpCtaMovGrpDBText1: TppDBText;
    rpCtaMovGrpLine2: TppLine;
    rpCtaMovGrpLine1: TppLine;
    rpCtaMovGrpGroupFooterBand2: TppGroupFooterBand;
    rpCtaMovGrpGroup1: TppGroup;
    rpCtaMovGrpGroupHeaderBand1: TppGroupHeaderBand;
    rpCtaMovGrpLabel2: TppLabel;
    rpCtaMovGrpDBText3: TppDBText;
    rpCtaMovGrpLabel3: TppLabel;
    rpCtaMovGrpLabel5: TppLabel;
    rpCtaMovGrpLabel4: TppLabel;
    rpCtaMovGrpGroupFooterBand1: TppGroupFooterBand;
    qryCadLocalDESCLOCAL: TStringField;
    qryCadLocalCODCENTROCUSTO: TStringField;
    qryCadLocalENDERECO: TStringField;
    qryCadLocalDESCCCUSTO: TStringField;
    qryCadLocalNOMERESP: TStringField;
    qryCadLocalDESCTIPOAREA: TStringField;
    qryCadGrupoCODCENTROCUSTO: TStringField;
    qryCadGrupoDESCCC: TStringField;
    rpCadGrupoDBText2: TppDBText;
    rpCadGrupoDBText3: TppDBText;
    rpCadGrupoLine3: TppLine;
    rpCadGrupoLabel4: TppLabel;
    rpCadGrupoDBText1: TppDBText;
    rpCadGrupoLine2: TppLine;
    rpCadGrupoLine4: TppLine;
    qryCadClasseCODGRUPO: TStringField;
    qryCadClasseDESCGRUPO: TStringField;
    rpCadClasseLabel1: TppLabel;
    rpCadClasseLine1: TppLine;
    rpCadClasseDBText1: TppDBText;
    rpCadClasseLine2: TppLine;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    rpCadClasseCODGRUPO: TppVariable;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppCalc35: TppSystemVariable;
    ppCalc36: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    rpCadClasseCODCLASSE: TppVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    rpCadGrupoCODCENTROCUSTO: TppVariable;
    rpCadGrupoCODGRUPO: TppVariable;
    rpBemCalc1: TppVariable;
    qryBemPLACA: TFloatField;
    qryBemDESBEM: TStringField;
    qryBemDATAULTDEP: TDateTimeField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemIDNOTA: TStringField;
    qryBemCOMPLNOTA: TStringField;
    qryBemNUMSERIE: TStringField;
    qryBemREGISTRO: TStringField;
    qryBemCONTROLE: TStringField;
    qryBemTAXADEP: TFloatField;
    qryBemDESCCCUSTO: TStringField;
    qryBemDESCLOCAL: TStringField;
    qryBemNOMERESP: TStringField;
    qryBemDESCGRUPO: TStringField;
    qryBemDESCCONJUNTO: TStringField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemVALHISTORICO: TFloatField;
    qryBemNOMEFORN: TStringField;
    qryBemIDOPCIONAL: TStringField;
    qryBemDESCCLASSE: TStringField;
    qryBemDESCSITUACAO: TStringField;
    qryBemVALORG0: TFloatField;
    qryBemCMBEM0: TFloatField;
    qryBemDEPLANC0: TFloatField;
    qryBemCMDEP0: TFloatField;
    qryBemVALCTB0: TFloatField;
    rpBemDataBaixa: TppVariable;
    qryBemDATABAIXA: TDateTimeField;
    ppLabel4: TppLabel;
    rpCtaMovGrpDBText7: TppDBText;
    qryParamCAFxContabCODCENTROCUSTO: TStringField;
    qryParamCAFxContabNOMECCUSTO: TStringField;
    procedure rpBemCalc1Print(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    procedure rpBemLabel23Print(Sender: TObject);
    procedure qryBemBeforeOpen(DataSet: TDataSet);
    procedure qryCadGrupoBeforeOpen(DataSet: TDataSet);
    procedure rpCadGrupoCODGRUPOPrint(Sender: TObject);
    procedure rpCadClasseCODCLASSEPrint(Sender: TObject);
    procedure qryCadClasseBeforeOpen(DataSet: TDataSet);
    procedure rpCadGrupoCODCENTROCUSTOPrint(Sender: TObject);
    procedure ppDetailBand13BeforePrint(Sender: TObject);
    procedure rpCadClasseCODGRUPOPrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure rpBemDataBaixaPrint(Sender: TObject);
  private
    { Private declarations }
    //procedure LblEmpresaPrint(Sender: TObject);
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; Override;
  end;

var
  dtmRelCadCaf: TdtmRelCadCaf;

implementation

{$R *.DFM}

uses  uMensErro, dBaseDados,  uSistema, fParamBem, fParamCtaMovGrp,
      fParamCadConj, fParamConjxBens, dAtivoFixo, uAtivoFixo;

function TdtmRelCadCaf.MostraParam(Form: string) : boolean;
var
   frm       : TForm;
   bTemParam : Boolean;

begin
   bTemParam := True;
   //-------------------------------------------------------------------------------------
   if (UPPERCASE(Form) = 'FRMPARAMBEM') then
      frm := TfrmParamBEM.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCTAMOVGRP') then
      frm := TfrmParamCtaMovGrp.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADCONJ') then
      frm := TfrmParamCadConj.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCONJXBENS') then
      frm := TfrmParamConjxBens.Create(Application)
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADGRUPO') then
   begin
      qryCadGrupo.Open;
      frm := nil;
      bTemParam := False;
   end
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADCLASSE') then
   begin
      qryCadClasse.Open;
      frm := nil;
      bTemParam := False;
   end
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADLOCAL') then
   begin
      qryCadLocal.Open;
      frm := nil;
      bTemParam := False;
   end
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADTIPAREA') then
   begin
      qryCadTipArea.Open;
      frm := nil;
      bTemParam := False;
   end
   else
   if (UPPERCASE(Form) = 'FRMPARAMCADTIPMOV') then
   begin
      qryCadTipMov.Open;
      frm := nil;
      bTemParam := False;
   end
   //-------------------------------------------------------------------------------------
   else
      frm := nil;
   //-------------------------------------------------------------------------------------
   if frm = nil then
   begin
      Result := not bTemParam;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   with frm do
   begin
      Result := (ShowModal = mrOk);
      free;
   end;
end;

procedure TdtmRelCadCaf.LblSistemaPrint(Sender: TObject);
begin
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
 (Sender as TppLabel).Caption := Sistema.NomeAplicativo + ' - ' + Sistema.Versao;
end;

//procedure TdtmRelCadCaf.LblEmpresaPrint(Sender: TObject);
//begin
//  inherited;
//  //Impressão do Nome da Empresa No Cabeçalho do Relatório
//end;

procedure TdtmRelCadCaf.rpBemCalc1Print(Sender: TObject);
begin
   inherited;
   rpBemCalc1.Text := qryBemPLACA.AsString;
end;

procedure TdtmRelCadCaf.rpBemLabel23Print(Sender: TObject);
begin
   inherited;
   if qryBemCONTROLE.AsString = 'T' then
   begin
      rpBemLabel23.Caption := 'Total';
   end else
   begin
      rpBemLabel23.Caption := 'Físico';
   end;
end;

procedure TdtmRelCadCaf.qryBemBeforeOpen(DataSet: TDataSet);
var
   sMascara : String;
   iAux     : Integer;
begin
   inherited;
   with dtmAtivoFixo.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      if (FieldByName('SEQBEMEMP').AsFloat = 0) then {sequencial por empresa}
      begin
         sMascara := '';
         for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
         begin
            sMascara := sMascara + '9';
         end;
         sMascara := sMascara + '.999999999;0; '
      end else
      if (FieldByName('SEQBEMEMP').AsFloat = 1) or (FieldByName('SEQBEMEMP').AsFloat = 2) then
      begin
         sMascara := FieldByName('MASCCODGRUPO').AsString;
         while (pos('.',sMascara) <> 0) do
         begin
            sMascara := AtivoFixo.TiraCaracter(sMascara,'.');
         end;
         sMascara := sMascara + '.9999999;0; '
      end else
      if (FieldByName('SEQBEMEMP').AsFloat = 3) then {sequencial}
      begin
         sMascara := '999999999;0; ';
      end else
      begin
         sMascara := '';
      end;
      //----------------------------------------------------------------------------------
      Close;
   end;
   qryBemPLACA.DisplayFormat := sMascara;
end;

procedure TdtmRelCadCaf.qryCadGrupoBeforeOpen(DataSet: TDataSet);
var
   sMascara : String;
begin
   inherited;
   with dtmAtivoFixo.qryParamCAF do
   begin
      ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      Open;
      sMascara := FieldByName('MASCCODGRUPO').AsString + ';0; ';
      Close;
   end;
   rpCadGrupoCODGRUPO.DisplayFormat := sMascara;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamGlobal do
   begin
      ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      Open;
      sMascara := FieldByName('MASCARACC').AsString + ';0; ';
      Close;
   end;
   rpCadGrupoCODCENTROCUSTO.DisplayFormat := sMascara;
end;

procedure TdtmRelCadCaf.rpCadGrupoCODGRUPOPrint(Sender: TObject);
begin
   inherited;
   rpCadGrupoCODGRUPO.Text := qryCadGrupoCLASSE.AsString;
   if (qryCadGrupoTIPO.AsString = 'S') then
   begin
      rpCadGrupoCODGRUPO.Font.Style := [fsBold];
      rpCadGrupoDBText2.Font.Style  := [fsBold];
      rpCadGrupoDBText3.Font.Style  := [fsBold];
   end else
   begin
      rpCadGrupoCODGRUPO.Font.Style := [];
      rpCadGrupoDBText2.Font.Style  := [];
      rpCadGrupoDBText3.Font.Style  := [];
   end;
end;

procedure TdtmRelCadCaf.rpCadGrupoCODCENTROCUSTOPrint(Sender: TObject);
begin
   inherited;
   rpCadGrupoCODCENTROCUSTO.Text := qryCadGrupoCODCENTROCUSTO.AsString;
end;

procedure TdtmRelCadCaf.ppDetailBand13BeforePrint(Sender: TObject);
begin
   inherited;
   ppDetailBand13.Visible  := not (qryCadGrupoDESCCC.IsNull);
   rpCadGrupoLine4.Visible := not (qryCadGrupoDESCCC.IsNull);
end;

procedure TdtmRelCadCaf.qryCadClasseBeforeOpen(DataSet: TDataSet);
var
   sMascara, sMascaraGrupo : String;
begin
   inherited;
   with dtmAtivoFixo.qryParamCAF do
   begin
      ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      Open;
      sMascara      := FieldByName('MASCARACLASSE').AsString + ';0; ';
      sMascaraGrupo := FieldByName('MASCCODGRUPO').AsString + ';0; ';
      Close;
   end;
   rpCadClasseCODCLASSE.DisplayFormat := sMascara;
   rpCadClasseCODGRUPO.DisplayFormat  := sMascaraGrupo;
end;

procedure TdtmRelCadCaf.rpCadClasseCODCLASSEPrint(Sender: TObject);
begin
   inherited;
   rpCadClasseCODCLASSE.Text := qryCadClasseCLASSE.AsString;
   if (qryCadClasseTIPO.AsString = 'S') then
   begin
      rpCadClasseCODCLASSE.Font.Style  := [fsBold];
      ppDBText20.Font.Style := [fsBold];
      ppDBText21.Font.Style := [fsBold];
   end else
   begin
      rpCadClasseCODCLASSE.Font.Style  := [];
      ppDBText20.Font.Style := [];
      ppDBText21.Font.Style := [];
   end;
end;

procedure TdtmRelCadCaf.rpCadClasseCODGRUPOPrint(Sender: TObject);
begin
   inherited;
   rpCadClasseCODGRUPO.Text := qryCadClasseCODGRUPO.AsString;
end;

procedure TdtmRelCadCaf.ppDetailBand6BeforePrint(Sender: TObject);
begin
   inherited;
   ppDetailBand6.Visible    := not (qryCadClasseDESCGRUPO.IsNull);
   rpCadClasseLine2.Visible := not (qryCadClasseDESCGRUPO.IsNull);
end;

procedure TdtmRelCadCaf.rpBemDataBaixaPrint(Sender: TObject);
begin
   inherited;
   if qryBemDATABAIXA.IsNull then
      rpBemDataBaixa.Text := ''
   else
      rpBemDataBaixa.Text := 'Baixado em ' + qryBemDATABAIXA.AsString;
end;

end.
