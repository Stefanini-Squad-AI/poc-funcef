unit RGeraDocumento;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------

{ ------------------------------------------------------------------------------------
Alterações  : criação do modelo
Pendência   : SIG33744
Responsável : Edilaine
Data MERGE  : 05/07/2022
Data        : 27/07/2018
Descrição   : impressao de documentos no controle de divida de beneficio
--------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppEndUsr,
  ppModule, raCodMod, ppStrtch, ppMemo, ppCtrls, ppBarCod, ppVar, ppPrnabl,
  ppClass, ppCache, ppBands, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  DBTables, Wwquery;

type
  TRptModeloBoleto = class(TFrmCmReport)
    DsDados: TwwDataSource;
    CdsDados: TCMClientDataSet;
    CdsDadosCEP: TStringField;
    CdsDadosCODESTADO: TStringField;
    CdsDadosCIDADE: TStringField;
    CdsDadosBAIRRO: TStringField;
    CdsDadosCOMPLEMENTO: TStringField;
    CdsDadosNUMERO: TStringField;
    CdsDadosLOGRADOURO: TStringField;
    CdsDadosNUMDOCUMENTO: TStringField;
    CdsDadosNOME: TStringField;
    CdsDadosVALORDESCONTO: TFloatField;
    CdsDadosDATALIMITE: TDateTimeField;
    CdsDadosDATAPROGRAMADA: TDateTimeField;
    CdsDadosCODPORTFORMA: TFloatField;
    CdsDadosDATAVENCTO: TDateTimeField;
    CdsDadosDATAREMESSA: TDateTimeField;
    CdsDadosEMISBLOQ: TStringField;
    CdsDadosSTATUS: TStringField;
    CdsDadosNODOCUMENTO: TFloatField;
    CdsDadosMOESIGLA: TStringField;
    CdsDadosCODDOCUMENTO: TFloatField;
    CdsDadosTIPO: TStringField;
    CdsDadosNOSSONUMERO: TStringField;
    CdsDadosCOMPLDOCUMENTO: TStringField;
    CdsDadosTIPOENDERECO: TStringField;
    CdsDadosNUMAGENCIA: TStringField;
    CdsDadosNUMCONTA: TStringField;
    CdsDadosVALORJUROS: TFloatField;
    CdsDadosCODBARRA: TStringField;
    CdsDadosRSALDO: TFloatField;
    CdsDadosRSALDOOUTRAMOEDA: TFloatField;
    CdsDadosCODBARRADIG: TStringField;
    CdsDadosFLGGRUPO: TStringField;
    CdsDadosAGENCIACODCEDENTE: TStringField;
    CdsDadosDATAEMISSAO: TDateTimeField;
    CdsDadosDATADOCUMENTO: TDateTimeField;
    CdsDadosNUMEMPRESABANCO: TStringField;
    SqlDados: TCMSqlParams;
    PpDados: TppBDEPipeline;
    PpDadosppField1: TppField;
    PpDadosppField2: TppField;
    PpDadosppField3: TppField;
    PpDadosppField4: TppField;
    PpDadosppField5: TppField;
    PpDadosppField6: TppField;
    PpDadosppField7: TppField;
    PpDadosppField8: TppField;
    PpDadosppField9: TppField;
    PpDadosppField10: TppField;
    PpDadosppField11: TppField;
    PpDadosppField12: TppField;
    PpDadosppField13: TppField;
    PpDadosppField14: TppField;
    PpDadosppField15: TppField;
    PpDadosppField16: TppField;
    PpDadosppField17: TppField;
    PpDadosppField18: TppField;
    PpDadosppField19: TppField;
    PpDadosppField20: TppField;
    PpDadosppField21: TppField;
    PpDadosppField22: TppField;
    PpDadosppField23: TppField;
    PpDadosppField24: TppField;
    PpDadosppField25: TppField;
    PpDadosppField26: TppField;
    PpDadosppField27: TppField;
    PpDadosppField28: TppField;
    PpDadosppField29: TppField;
    PpDadosppField30: TppField;
    PpDadosppField31: TppField;
    PpDadosppField32: TppField;
    PpDadosppField33: TppField;
    PpDadosppField34: TppField;
    PpDadosppField35: TppField;
    PpDadosppField36: TppField;
    RptModelo: TppReport;
    ppDetailBand2: TppDetailBand;
    RptBarrasBBLine36: TppLine;
    RptBarrasBBLine41: TppLine;
    RptBarrasBBLine29: TppLine;
    RptBarrasBBLine43: TppLine;
    RptBarrasBBLine42: TppLine;
    RptBarrasBBLabel42: TppLabel;
    RptBarrasBBLine48: TppLine;
    RptBarrasBBLine52: TppLine;
    RptBarrasBBLine50: TppLine;
    RptBarrasBBLine49: TppLine;
    RptBarrasBBLine21: TppLine;
    RptBarrasBBLine23: TppLine;
    RptBarrasBBLine22: TppLine;
    RptBarrasBBLine19: TppLine;
    RptBarrasBBLine5: TppLine;
    RptBarrasBBLine13: TppLine;
    LblNomeBanco2: TppLabel;
    LblNumBanco2: TppLabel;
    RptBarrasBBLine1: TppLine;
    RptBarrasBBLine3: TppLine;
    RptBarrasBBLine2: TppLine;
    RptBarrasBBLine4: TppLine;
    RptBarrasBBLine6: TppLine;
    RptBarrasBBLine7: TppLine;
    RptBarrasBBLine8: TppLine;
    RptBarrasBBLine9: TppLine;
    RptBarrasBBLine10: TppLine;
    RptBarrasBBLine11: TppLine;
    RptBarrasBBLabel3: TppLabel;
    RptBarrasBBLine14: TppLine;
    RptBarrasBBLine15: TppLine;
    RptBarrasBBLine16: TppLine;
    RptBarrasBBLine17: TppLine;
    RptBarrasBBLabel4: TppLabel;
    RptBarrasBBLabel5: TppLabel;
    RptBarrasBBLabel6: TppLabel;
    RptBarrasBBLabel7: TppLabel;
    RptBarrasBBLabel8: TppLabel;
    RptBarrasBBLabel9: TppLabel;
    RptBarrasBBLabel10: TppLabel;
    RptBarrasBBLabel11: TppLabel;
    RptBarrasBBLabel12: TppLabel;
    RptBarrasBBLabel13: TppLabel;
    RptBarrasBBLabel14: TppLabel;
    RptBarrasBBLabel15: TppLabel;
    RptBarrasBBLabel16: TppLabel;
    RptBarrasBBLabel17: TppLabel;
    RptBarrasBBLabel18: TppLabel;
    RptBarrasBBLabel19: TppLabel;
    RptBarrasBBLabel20: TppLabel;
    RptBarrasBBLabel21: TppLabel;
    RptBarrasBBLabel22: TppLabel;
    RptBarrasBBLine18: TppLine;
    RptBarrasBBLabel23: TppLabel;
    RptBarrasBBLine20: TppLine;
    RptBarrasBBLabel24: TppLabel;
    RptBarrasBBLabel25: TppLabel;
    RptBarrasBBLabel26: TppLabel;
    RptBarrasBBLabel27: TppLabel;
    RptBarrasBBLabel28: TppLabel;
    RptBarrasBBLabel29: TppLabel;
    RptBarrasBBLabel30: TppLabel;
    LblAceite2: TppLabel;
    RptBarrasBBLabel32: TppLabel;
    RptBarrasBBLine24: TppLine;
    RptBarrasBBLine25: TppLine;
    RptBarrasBBLine26: TppLine;
    RptBarrasBBLine27: TppLine;
    RptBarrasBBLine28: TppLine;
    LblNomeBanco1: TppLabel;
    LblNumBanco1: TppLabel;
    RptBarrasBBLine30: TppLine;
    RptBarrasBBLine31: TppLine;
    RptBarrasBBLine32: TppLine;
    RptBarrasBBLine33: TppLine;
    RptBarrasBBLine34: TppLine;
    RptBarrasBBLine35: TppLine;
    RptBarrasBBLine37: TppLine;
    RptBarrasBBLine38: TppLine;
    RptBarrasBBLabel36: TppLabel;
    RptBarrasBBLine40: TppLine;
    RptBarrasBBLabel37: TppLabel;
    RptBarrasBBLabel39: TppLabel;
    RptBarrasBBLabel40: TppLabel;
    RptBarrasBBLabel41: TppLabel;
    RptBarrasBBLabel43: TppLabel;
    RptBarrasBBLabel44: TppLabel;
    RptBarrasBBLabel45: TppLabel;
    RptBarrasBBLabel46: TppLabel;
    RptBarrasBBLabel47: TppLabel;
    RptBarrasBBLabel48: TppLabel;
    RptBarrasBBLabel49: TppLabel;
    RptBarrasBBLabel50: TppLabel;
    RptBarrasBBLabel51: TppLabel;
    RptBarrasBBLabel52: TppLabel;
    RptBarrasBBLabel53: TppLabel;
    RptBarrasBBLabel54: TppLabel;
    RptBarrasBBLabel55: TppLabel;
    RptBarrasBBLine44: TppLine;
    RptBarrasBBLabel56: TppLabel;
    RptBarrasBBLine45: TppLine;
    RptBarrasBBLabel57: TppLabel;
    RptBarrasBBLabel58: TppLabel;
    RptBarrasBBLabel59: TppLabel;
    RptBarrasBBLabel60: TppLabel;
    RptBarrasBBLabel61: TppLabel;
    RptBarrasBBLabel62: TppLabel;
    RptBarrasBBLabel63: TppLabel;
    LblAceite1: TppLabel;
    RptBarrasBBLabel65: TppLabel;
    RptBarrasBBLine46: TppLine;
    RptBarrasBBLine47: TppLine;
    RptBarrasBBDBText1: TppDBText;
    RptBarrasBBCalc1: TppCalc;
    RptBarrasBBDBText2: TppDBText;
    RptBarrasBBDBText4: TppDBText;
    RptBarrasBBDBText5: TppDBText;
    RptBarrasBBDBText6: TppDBText;
    RptBarrasBBLabel35: TppLabel;
    RptBarrasBBLabel38: TppLabel;
    RptBarrasBBLabel66: TppLabel;
    LblCarteira1: TppLabel;
    RptBarrasBBDBText3: TppDBText;
    RptBarrasBBDBText7: TppDBText;
    RptBarrasBBLabel69: TppLabel;
    RptBarrasBBLabel70: TppLabel;
    RptBarrasBBLabel71: TppLabel;
    RptBarrasBBDBText17: TppDBText;
    RptBarrasBBDBText18: TppDBText;
    RptBarrasBBLabel72: TppLabel;
    RptBarrasBBDBText19: TppDBText;
    RptBarrasBBDBText20: TppDBText;
    RptBarrasBBDBText21: TppDBText;
    RptBarrasBBDBText22: TppDBText;
    RptBarrasBBDBText23: TppDBText;
    RptBarrasBBDBText24: TppDBText;
    RptBarrasBBDBText25: TppDBText;
    RptBarrasBBDBText26: TppDBText;
    RptBarrasBBDBText27: TppDBText;
    RptBarrasBBLabel73: TppLabel;
    RptBarrasBBDBText28: TppDBText;
    RptBarrasBBDBText29: TppDBText;
    RptBarrasBBDBText30: TppDBText;
    RptBarrasBBDBText31: TppDBText;
    RptBarrasBBDBText32: TppDBText;
    RptBarrasBBDBText33: TppDBText;
    RptBarrasBBDBText34: TppDBText;
    RptBarrasBBLabel74: TppLabel;
    LblEmpresa2: TppLabel;
    RptBarrasBBDBText40: TppDBText;
    RptBarrasBBDBText41: TppDBText;
    RptBarrasBBDBText42: TppDBText;
    LblCarteira2: TppLabel;
    RptBarrasBBDBText43: TppDBText;
    RptBarrasBBDBText44: TppDBText;
    RptBarrasBBCalc2: TppCalc;
    RptBarrasBBDBText45: TppDBText;
    RptBarrasBBDBText46: TppDBText;
    LblEmpresa: TppLabel;
    RptBarrasBBDBText47: TppDBText;
    RptBarrasBBDBText48: TppDBText;
    RptBarrasBBDBText49: TppDBText;
    Barras: TppDBBarCode;
    RptBarrasBBLine51: TppLine;
    ImgLogo1: TppImage;
    ImgLogo2: TppImage;
    MemMensagem2: TppMemo;
    MemMensagem1: TppMemo;
    LblEspecieDoc1: TppLabel;
    LblEspecieDoc2: TppLabel;
    RptModeloDBText1: TppDBText;
    raCodeModule1: TraCodeModule;
    DsgnCM: TppDesigner;
    qryReports: TwwQuery;
    qryPortForma: TwwQuery;
    SqlBloquete: TCMSqlParams;
    CdsBloquete: TCMClientDataSet;
    CdsDadosCedente: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    qryModelo: TwwQuery;
    procedure RptModeloBeforePrint(Sender: TObject);
    procedure MemMensagem2Print(Sender: TObject);
    procedure MemMensagem1Print(Sender: TObject);
  private
    { Private declarations }
    function  SelReport : boolean;

  public
    { Public declarations }
    function  SelecionaModelo(iIdConfigBarra : integer) : boolean;

  end;

var
  RptModeloBoleto: TRptModeloBoleto;

implementation

{$R *.DFM}


{ TRptModeloBoleto }


function TRptModeloBoleto.SelecionaModelo(iIdConfigBarra : integer) : boolean;
begin
  qryModelo.close;
  qryModelo.ParamByName('iIdConfigBarra').AsInteger := iIdConfigBarra;
  qryModelo.open;

  if qryModelo.isEmpty then
     qryModelo.close;

  Result := SelReport();
end;


function TRptModeloBoleto.SelReport : Boolean;
begin
  if qryModelo.active then
  begin
    qryReports.Prepare;
    qryReports.ParamByName('IDREPORTS').AsInteger := qryModelo.FieldByName('IDREPORTS').AsInteger;
    qryReports.ParamByName('ORIGEMCM').AsInteger  := qryModelo.FieldByName('ORIGEMCM').AsInteger;
    qryReports.Open;

    Result := (Not qryReports.IsEmpty) And (Not qryReports.FieldByName('TEMPLATE').IsNull);
  end
  else
    Result := false;
end;


procedure TRptModeloBoleto.RptModeloBeforePrint(Sender: TObject);
begin
  inherited;
   Barras.AutoSize := False;
end;

procedure TRptModeloBoleto.MemMensagem2Print(Sender: TObject);
begin
  Inherited;
  MemMensagem1Print(Sender);
end;

procedure TRptModeloBoleto.MemMensagem1Print(Sender: TObject);
var
  X: Integer;
begin
  Inherited;
  MemMensagem1.Lines.Clear;
  MemMensagem2.Lines.Clear;
  if (CdsDados.FieldByName('FLGGRUPO').AsString = 'N') then
    SqlAux.Sql.Text :=
      'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 '+
      '  FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '+FloatToStr(CdsDados.FieldByName('CODDOCUMENTO').AsFloat)
  else
    SqlAux.Sql.Text :=
      'SELECT MENSAGEM1,MENSAGEM2,MENSAGEM3,MENSAGEM4,MENSAGEM5,MENSAGEM6,MENSAGEM7,MENSAGEM8,MENSAGEM9, MENSAGEM10 '+
      '  FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = ' +FloatToStr(CdsDados.FieldByName('CODDOCUMENTO').AsFloat);
  SqlAux.Open;

  if CdsDados.FieldByName('VALORJUROS').AsFloat <> 0 then
  begin
    MemMensagem1.Lines.Add('Após o vencimento cobrar R$ (' + FormatFloat('##0.00', CdsDados.FieldByName('VALORJUROS').AsFloat *
      CdsDados.FieldByName('RSALDO').AsFloat /
      100) + ') por dia de atraso.');
    MemMensagem2.Lines.Add('Após o vencimento cobrar R$ (' + FormatFloat('##0.00', CdsDados.FieldByName('VALORJUROS').AsFloat *
      CdsDados.FieldByName('RSALDO').AsFloat /
      100) + ') por dia de atraso.');
  end;

  if CdsDados.FieldByName('VALORDESCONTO').AsFloat <> 0 then
  begin
    MemMensagem1.Lines.Add('Até ' + CdsDados.FieldByName('DATALIMITE').AsString + ' conceder desconto R$ (' + FormatFloat('##0.00',
      CdsDados.FieldByName('VALORDESCONTO').AsFloat) + ').');
    MemMensagem2.Lines.Add('Até ' + CdsDados.FieldByName('DATALIMITE').AsString + ' conceder desconto R$ (' + FormatFloat('##0.00',
      CdsDados.FieldByName('VALORDESCONTO').AsFloat) + ').');
  end;

  { Pega as Mensagens cadastradas no menu Documentos x Mensagens }
  if not cdsAux.isEmpty then
  begin
    for x := 0 To 9 do
    begin
      if CdsAux.Fields[x].AsString <> '' then
      begin
        MemMensagem1.Lines.Add(CdsAux.Fields[x].AsString);
        MemMensagem2.Lines.Add(CdsAux.Fields[x].AsString);
      end;
    end;
  end;
end;

end.
