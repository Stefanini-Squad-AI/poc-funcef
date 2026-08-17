Unit rEmissBloq;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls, ppRegion,
  ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra;

Type
  TRptEmissBloq = Class(TFrmCmReport)
    ppListBloq: TppReport;
    ppHeaderBand6: TppHeaderBand;
    TituloRel: TppLabel;
    ppLabel26: TppLabel;
    ppListBloqMemo1: TppMemo;
    ppListBloqRegion1: TppRegion;
    ppListBloqLabel1: TppLabel;
    ppLine16: TppLine;
    ppListBloqLabel2: TppLabel;
    ppListBloqLabel3: TppLabel;
    ppListBloqLabel8: TppLabel;
    ppListBloqLabel4: TppLabel;
    ppListBloqLabel5: TppLabel;
    ppListBloqLabel6: TppLabel;
    ppListBloqLabel7: TppLabel;
    ppListBloqLabel9: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppListBloqDBText1: TppDBText;
    ppListBloqDBText2: TppDBText;
    ppListBloqDBText3: TppDBText;
    ppListBloqDBText4: TppDBText;
    ppListBloqDBText5: TppDBText;
    ppListBloqDBText6: TppDBText;
    ppListBloqDBText7: TppDBText;
    ppListBloqDBText8: TppDBText;
    ppListBloqDBText9: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine17: TppLine;
    ppLabel27: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    BDEListBloq: TppBDEPipeline;
    dsListBloq: TwwDataSource;
    SqlListBloq: TCMSqlParams;
    cdListBLoq: TCMClientDataSet;
    cdListBLoqCODDOCUMENTO: TFloatField;
    cdListBLoqNODOCUMENTO: TFloatField;
    cdListBLoqCOMPLDOCUMENTO: TStringField;
    cdListBLoqDATAEMISSAO: TDateTimeField;
    cdListBLoqDATAPROGRAMADA: TDateTimeField;
    cdListBLoqNOSSONUMERO: TStringField;
    cdListBLoqVALOR: TFloatField;
    cdListBLoqRAZAOSOCIAL: TStringField;
    cdListBLoqDESCRDOCTO: TStringField;
    cdListBLoqDESCRPFORMA: TStringField;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptEmissBloq: TRptEmissBloq;

Implementation

{$R *.DFM}

Procedure TRptEmissBloq.CrmRptCMBeforePrint(Sender: TObject);
Var
  texto: String;
  rdgemetidositemindex: Integer;
  CPForCliText, CPForCliCaption, CMDBtpdoctoText, Label1caption, CMDBtpdoctoLookupValue,
    CdsDocDescricao, dtemissaoText, Label2caption, dtemissaofinalText, Label6caption,
    dtnossonumText, Label3caption, CMDBportformaText, Label5Caption, CMDBportformaLookupValue,
    CdsPortFormaDESCRICAO, sOrder: String;
  CPForCliForCliRegId: integer;
Begin
  Inherited;

  rdgemetidositemindex := StrToInt(CmpRptCM.ParamValues[0].AsString);
  CPForCliText := CmpRptCM.ParamValues[1].AsString;
  CPForCliCaption := CmpRptCM.ParamValues[2].AsString;
  CMDBtpdoctoText := CmpRptCM.ParamValues[3].AsString;
  Label1caption := CmpRptCM.ParamValues[4].AsString;
  CMDBtpdoctoLookupValue := CmpRptCM.ParamValues[5].AsString;
  CdsDocDescricao := CmpRptCM.ParamValues[6].AsString;
  dtemissaoText := CmpRptCM.ParamValues[7].AsString;
  Label2caption := CmpRptCM.ParamValues[8].AsString;
  dtemissaofinalText := CmpRptCM.ParamValues[9].AsString;
  Label6caption := CmpRptCM.ParamValues[10].AsString;
  dtnossonumText := CmpRptCM.ParamValues[11].AsString;
  Label3caption := CmpRptCM.ParamValues[12].AsString;
  CMDBportformaText := CmpRptCM.ParamValues[13].AsString;
  Label5Caption := CmpRptCM.ParamValues[14].AsString;
  CMDBportformaLookupValue := CmpRptCM.ParamValues[15].AsString;
  CdsPortFormaDESCRICAO := CmpRptCM.ParamValues[16].AsString;
  sOrder := CmpRptCM.ParamValues[17].AsString;
  CPForCliForCliRegId := StrToInt(CmpRptCM.ParamValues[18].AsString);

  TituloRel.Caption := 'Listagem de Bloquetos Emetidos';
  If rdgemetidositemindex = 1 Then
    TituloRel.Caption := 'Listagem de Bloquetos a Emitir';

  With SqlListBloq Do
  Begin
    SQL.Clear;
    SQL.Text := 'select a.CODDOCUMENTO  , a.NODOCUMENTO  , a.COMPLDOCUMENTO ,' +
      'a.DATAEMISSAO ,a.DATAPROGRAMADA ,a.NOSSONUMERO,' +
      ' c.valor , f.razaosocial , e.descricao as descrdocto ,g.descricao as descrpforma ' +
      ' from documento a ,lanctodocum c , tipodocrecpag e ,pessoa f, portadorforma g where (a.recpag=''R'')';
    If rdgemetidositemindex = 0 Then
      SQL.Add(' and (a.emisbloq=''S'')')
    Else
      SQL.Add(' and ((a.emisbloq=''N'') or (a.emisbloq is null) ) ');
    Sql.Add('and (a.idpessoa=' + FloatToStr(CrmRptCM.IdEmpresa) + ')');
    texto := '';
    ppListBloqMemo1.lines.clear;
    If trim(CPForCliText) <> '' Then
    Begin
      texto := CPForCliCaption + ': ' + inttostr(CPForCliForCliRegId) + ' - ' + CPForCliText;
      Sql.Add('and (a.idforcli=' + inttostr(CPForCliForCliRegId) + ')');
    End;
    If trim(CMDBtpdoctoText) <> '' Then
    Begin
      texto := texto + '          ' + Label1caption + ': ' + CMDBtpdoctoLookupValue + ' - ' + CdsDocDescricao;
      SQL.Add('and (a.codtipdoc=' + CMDBtpdoctoLookupValue + ')');
    End;
    If trim(texto) <> '' Then
      ppListBloqMemo1.lines.add(texto);
    texto := '';
    If trim(dtemissaoText) <> '' Then
    Begin
      texto := Label2caption + ': ' + dtemissaoText;
      sql.add('and (a.dataemissao>=to_date(' + #39 + dtemissaoText + #39 + ',''dd/mm/yyyy'')' + ')');
    End;
    If trim(dtemissaofinalText) <> '' Then
    Begin
      texto := texto + '          ' + Label6caption + ': ' + dtemissaofinalText;
      sql.add('and (a.dataemissao<=to_date(' + #39 + dtemissaofinalText + #39 + ',''dd/mm/yyyy'')' + ')');
    End;

    If trim(texto) <> '' Then
      ppListBloqMemo1.lines.add(texto);
    texto := '';
    If trim(dtnossonumText) <> '' Then
    Begin
      texto := Label3caption + ': ' + dtnossonumText;
      sql.add('and (a.nossonumero=' + #39 + trim(dtnossonumText) + #39 + ')');
    End;
    If trim(CMDBportformaText) <> '' Then
    Begin
      texto := texto + '          ' + Label5Caption + ': ' + CMDBportformaLookupValue + ' - ' + CdsPortFormaDESCRICAO;
      sql.add('and (a.codportforma=' + CMDBportformaLookupValue + ')');
    End;
    If trim(texto) <> '' Then
      ppListBloqMemo1.lines.add(texto);

    sql.text := sql.text +
      ' and  a.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
      ' and b.idusuario=' +
      inttostr(CrmRptCM.IdUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
      ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
      inttostr(CrmRptCM.idusuario) + '))   ' +
      ' and   (a.idforcli=f.idpessoa) and   (a.coddocumento =c.coddocumento )' +
      ' and   (a.operacao=c.operacao) and   (a.codtipdoc = e.codtipdoc)' +
      ' and   (a.codportforma=g.codportforma(+))' +
      ' and   (g.codbloqche is not null)' +
      ' and   (c.estorno is null)';
    SQL.Add(sOrder);
    open;
  End;
End;

End.

