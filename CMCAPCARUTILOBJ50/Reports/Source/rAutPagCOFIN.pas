{-------------------------------------------------------------------------------
-------------------------- HISTÓRICO DE ALTERAÇÕES ---------------------------------
N. Chamado....: WO39179
Dt Alterações.: 01/06/2026
Responsável...: Paulo Nobre
Descrição.....: Ajuste para incluir no SqlAutPagDoc, na função CrmRptCMBeforePrint,
                o campo CODDOCUMENTO no ORDER BY.
------------------------------------------------------------------------------------
N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007135)
Dt Alterações.: 12/11/2025
Responsável...: Paulo Nobre
Descrição.....: Ajuste no sql: SqlAutPagDoc na função em: CrmRptCMBeforePrint,
                para incluir recurso para limitar o tamanho do resultado do
                select, devido erro reportado pelo ORACLE no uso da função:
                "listagg".
---------------------------------------------------------------------------------
Pendência: MIGRACAO-ORACLE
Analista : leandro
Data     : 14/10/2025
Solução  : substituir na query substring por substr
--------------------------------------------------------------------------------
 N. Solicitação: WO23322            
 Dt Alteração..: 18/07/2025
 Responsável...: Paulo Nobre
 Descrição.....: No objeto SqlNomeUsuario, foi incluido no SQL a possibilidade
                 de voltar a mostrar o nome da usuário que lançou o documento,
                 pois este foi descaracterizado na tabela USUARIOSISTEMA.
-------------------------------------------------------------------------------
 Atender.....: WO16449
 Data........: 22/11/2024
 Responsável.: Arnaldo V. Scarin
 Descrição...: Ajuste da Coluna "Plano" no SubReport - Alteração no DFM
--------------------------------------------------------------------------------
 Atender.....: WO11554
 Data........: 09/07/2024
 Responsável.: Luis Ferrari
 Descrição...: Novo relatorio Cofin conforme modelo com campos dos
               Alteradores e data Emissão IdReport 4643
--------------------------------------------------------------------------------
}
Unit rAutPagCOFIN;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, ppBands, ppMemo, ppClass, ppCtrls,
  ppVar, ppRegion, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DBTables, uCMClientDataSet, uCmSqlParams, ppTypes,
  uCtrlRelatoriosCAPCAR, uCtrlDocumento, uCtrlParamIntegra, Mask , Math,
  TXRB, ppSubRpt, StdCtrls, ppModule, raCodMod, ppParameter, daDataModule;

Type
  TRptAutPagCofin = Class(TFrmCmReport)
    Dsautpagdoc: TwwDataSource;
    Ppautpagdoc: TppBDEPipeline;
    CdsDemGestAutPag: TClientDataSet;
    SqlAutPagDoc: TCMSqlParams;
    CdsAutPagDoc: TCMClientDataSet;
    SqlDemGestAutPag: TCMSqlParams;
    SqlNomeUsuario: TCMSqlParams;
    CdsNomeUsuario: TCMClientDataSet;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SqlBuscaContaDocForn: TCMSqlParams;
    CdsBuscaContaDoc: TCMClientDataSet;
    SqlBuscaContaDoc: TCMSqlParams;
    CdsAlteraParcOrigem: TCMClientDataSet;
    SqlAlteraParcOrigem: TCMSqlParams;
    CdsAutPagDocAlt: TCMClientDataSet;
    SqlAutPagDocAlt: TCMSqlParams;
    SqlDocumFilhosAP: TCMSqlParams;
    CdsDocumFilhosAP: TCMClientDataSet;
    PpDocumFilhoAP: TppBDEPipeline;
    DsDocumFilhoAP: TwwDataSource;
    SqlDocumFilhoAR: TCMSqlParams;
    CdsDocumFilhosAR: TCMClientDataSet;
    PpDocumFilhoAR: TppBDEPipeline;
    DsDocumFilhoAR: TwwDataSource;
    RptautpagCofin: TppReport;
    ppParameterList2: TppParameterList;
    DsAutPagDetalhe: TwwDataSource;
    PpAutPagDetalhe: TppBDEPipeline;
    CdsAutPagDetalhe: TCMClientDataSet;
    SqlAutPagDetalhe: TCMSqlParams;
    CdsAutPagDetalheCODDOCUMENTO: TFloatField;
    CdsAutPagDetalheNODOCUMENTO: TFloatField;
    CdsAutPagDetalheNUMLANCTO: TFloatField;
    CdsAutPagDetalheNFSSERVICO: TFloatField;
    CdsAutPagDetalheCODALTERADOR: TFloatField;
    CdsAutPagDetalheDATALANCTO: TDateTimeField;
    CdsAutPagDetalheVALOR: TFloatField;
    CdsAutPagDetalheVALORBASERETENCAO: TFloatField;
    CdsAutPagDetalheDESCDETALHE: TMemoField;
    CdsAutPagDetalheDESCSERVICO: TMemoField;
    CdsAutPagDetalheDESCALTERADOR: TStringField;
    DsAtividadeAutPagDoc: TwwDataSource;
    PpAtividadeAutPagDoc: TppBDEPipeline;
    SqlAtividadeAutPagDoc: TCMSqlParams;
    CdsAtividadeAutPagDoc: TCMClientDataSet;
    CdsAtividadeAutPagDocNUMFATURA: TFloatField;
    CdsAtividadeAutPagDocCODDOCUMENTO: TFloatField;
    CdsAtividadeAutPagDocNUMAPGR: TFloatField;
    CdsAtividadeAutPagDocREFERENCIA: TStringField;
    CdsAtividadeAutPagDocNODOCUMENTO: TFloatField;
    CdsAtividadeAutPagDocNOMEMODULO: TStringField;
    CdsAtividadeAutPagDocCOMPLDOCUMENTO: TStringField;
    CdsAtividadeAutPagDocDATAVENCTO: TDateTimeField;
    CdsAtividadeAutPagDocDATAEMISSAO: TDateTimeField;
    CdsAtividadeAutPagDocDATAPROGRAMADA: TDateTimeField;
    CdsAtividadeAutPagDocNUMDOCUMENTO: TStringField;
    CdsAtividadeAutPagDocCODDOSSIE: TStringField;
    CdsAtividadeAutPagDocVALOR: TFloatField;
    CdsAtividadeAutPagDocVALOROUTRAMOEDA: TFloatField;
    CdsAtividadeAutPagDocRAZAOSOCIAL: TStringField;
    CdsAtividadeAutPagDocDESCRICAO: TStringField;
    CdsAtividadeAutPagDocVALORRATEIO: TFloatField;
    CdsAtividadeAutPagDocDESCTDR: TStringField;
    CdsAtividadeAutPagDocNOMEAP: TStringField;
    CdsAtividadeAutPagDocNOMECR: TStringField;
    CdsAtividadeAutPagDocNOMECC: TStringField;
    CdsAtividadeAutPagDocOBS: TMemoField;
    CdsAtividadeAutPagDocFLGDOCBANCARIO: TStringField;
    CdsAtividadeAutPagDocVLACRE: TFloatField;
    CdsAtividadeAutPagDocVLDEC: TFloatField;
    CdsAtividadeAutPagDocVLIMP: TFloatField;
    CdsAtividadeAutPagDocVLLIQ: TFloatField;
    CdsAtividadeAutPagDocTRGUSERINCLUSAO: TStringField;
    CdsAtividadeAutPagDocTRGDTINCLUSAO: TDateTimeField;
    CdsAtividadeAutPagDocNUMIMOVEL: TStringField;
    CdsAtividadeAutPagDocNOMEPATRO: TStringField;
    CdsAtividadeAutPagDocDESCPLANO: TStringField;
    CdsAtividadeAutPagDocDESCPROGRAMA: TStringField;
    CdsAtividadeAutPagDocIDFORCLI: TFloatField;
    CdsAtividadeAutPagDocNOMEPATROORIGEM: TStringField;
    CdsAtividadeAutPagDocDESCPLANOORIGEM: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand3: TppDetailBand;
    SubDocumFilhoAR: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel42: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppLabel43: TppLabel;
    ppLine3: TppLine;
    ppDetailBand7: TppDetailBand;
    ppDBText48: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel19: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBCalc5: TppDBCalc;
    SubDocumFilhoAP: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel84: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDetailBand5: TppDetailBand;
    ppLabel85: TppLabel;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLabel87: TppLabel;
    ppLine46: TppLine;
    raCodeModule2: TraCodeModule;
    ppFooterBand1: TppFooterBand;
    ppLabel54: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText15: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine9: TppLine;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLine13: TppLine;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLine21: TppLine;
    ppLabel46: TppLabel;
    ppDBText29: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppRegionOBS: TppRegion;
    ppLabel52: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppRegionUsua: TppRegion;
    ppLabel57: TppLabel;
    ppDBText34: TppDBText;
    ppRegionBCO: TppRegion;
    ppDBText36: TppDBText;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDBText37: TppDBText;
    ppLabel61: TppLabel;
    ppDBText38: TppDBText;
    ppLabel58: TppLabel;
    ppDBText35: TppDBText;
    ppRegFDO: TppRegion;
    ppLabel62: TppLabel;
    ppDBMemo4: TppDBMemo;
    ppLabel63: TppLabel;
    ppDBMemo5: TppDBMemo;
    SubApNova: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine28: TppLine;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText30: TppDBText;
    ppLine47: TppLine;
    ppLine2: TppLine;
    ppDetailBand6: TppDetailBand;
    raCodeModule3: TraCodeModule;
    SubAlterador: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLine55: TppLine;
    ppLabel95: TppLabel;
    ppLine56: TppLine;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLine57: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLabel88: TppLabel;
    ppLine50: TppLine;
    ppLabel89: TppLabel;
    ppLine51: TppLine;
    ppDetailBand8: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppLine54: TppLine;
    ppLine53: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine52: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    SubAtividade: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    Procedure FormCreate(Sender: TObject);
    Procedure ppDBText92Format(Sender: TObject; DisplayFormat: String; DataType: TppDataType; Value: Variant; Var Text: String);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure ppDBCalc2Print(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    sBanco, sAgencia, sAgenciaFormat, sNomeagencia, sNumeroFormat, sNomeBanco,
      sNumero, sDescTipo, sTipo, sMascaraAgencia, sMascaraConta, oldDoc: String;
    Id: double;
    rVLDEC, rVLACRE, rVLIMP, rVLLIQ: real;
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
    Documento: TCtrlDocumento;
    // função de arredondamento de valores
    function  Arredonda(pNumero : double; pCasas : byte) : double;

    Procedure montaregistro;
    Procedure montaAlterador(CodDocumento: string);
    Procedure montaAtividade(CodDocumento: string);
    Procedure BuscaContaDoc(CodDocumento: Real);
    Procedure GravaBancoAg;
    function Parametriza(iTipo: Integer): String;
  public
    { Public declarations }
  End;

Var
  RptAutPagCofin: TRptAutPagCofin;

Implementation

Uses dBaseDados, uString, uSistema;

{$R *.DFM}

procedure TRptAutPagCofin.montaregistro;
var
  rSaldo: real;
  iNumApGr: Integer;
  Doc: String;
begin
  CdsAutPagDoc.Edit;
  Doc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;

  if OldDoc <> CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString Then
  begin
    OldDoc := CdsAutPagDoc.FieldByName( 'CODDOCUMENTO' ).AsString;
    if CdsAutPagDoc.FieldByName( 'NUMAPGR' ).IsNull Then
    begin
      if not CtrlRelatoriosCAPCAR.SetSEQAPGR(
        StrToInt( OldDoc ), CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsString,
        iNumApGr ) then
        Abort;

      CdsAutPagDoc.FieldByName( 'NUMAPGR' ).AsInteger := iNumApGr;
    end
    else
      doc := CdsAutPagDoc.FieldByName( 'CodDocumento' ).AsString;

    CdsAutPagDocAlt.Close;
    CdsAlteraParcOrigem.Close;
    Documento.Saldo.CalculaSaldo( StrToInt( Doc ) );
    rSaldo := Arredonda( Documento.Saldo.Valor, 2 );

    if not CdsAutPagDoc.FieldByName( 'NUMFATURA' ).IsNull then
    begin
      SqlAlteraParcOrigem.Prepare;
      SqlAlteraParcOrigem.Params[ 0 ].AsFloat := StrToInt( Doc );
      SqlAlteraParcOrigem.Params[ 1 ].AsFloat :=
        CdsAutPagDoc.FieldByName( 'NUMFATURA' ).AsFloat;
      SqlAlteraParcOrigem.Open;
      CdsAutPagDoc.FieldByName( 'valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat +
        CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat -
        CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat ),
        2
        );
      CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valdecr' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valacre' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
        Arredonda( CdsAlteraParcOrigem.FieldByName( 'valimp' ).AsFloat, 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    SqlAutPagDocAlt.Prepare;
    SqlAutPagDocAlt.Params[ 0 ].AsFloat := StrToInt( Doc );
    SqlAutPagDocAlt.Open;

    if CdsAutPagDoc.FieldByName( 'NumFatura' ).IsNull then
    begin
      CdsAutPagDoc.FieldByName( 'Valor' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.fieldbyname( 'Valor' ).AsFloat ), 2 );
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat := rSaldo;
    end;

    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valdecr' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valacre' ).AsFloat ), 2 );
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat :=
      Arredonda( ( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat +
      CdsAutPagDocAlt.FieldByName( 'valimp' ).AsFloat ), 2 );

    if strtofloat( Format( '%17.2f', [
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat ] ) ) = 0 Then
    begin
      CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat :=
        Arredonda( ( CdsAutPagDoc.FieldByName( 'valor' ).AsFloat +
        CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat -
        CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat ),
        2
        );
    end;

    rVLDEC  := Arredonda( CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat, 2 );
    rVLACRE := Arredonda( CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat, 2 );
    rVLIMP  := Arredonda( CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat, 2 );
    rVLLIQ  := Arredonda( CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat, 2);
  end
  else
  begin
    CdsAutPagDoc.FieldByName( 'VLDEC' ).AsFloat  := rVLDEC;
    CdsAutPagDoc.FieldByName( 'VLACRE' ).AsFloat := rVLACRE;
    CdsAutPagDoc.FieldByName( 'VLIMP' ).AsFloat  := rVLIMP;
    CdsAutPagDoc.FieldByName( 'VLLIQ' ).AsFloat  := rVLLIQ;
  end;
  GravaBancoAg;
  CdsAutPagDoc.post;
end;

Procedure TRptAutPagCofin.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  Documento := TCtrlDocumento.Create;
  Documento.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,True);
End;

Procedure TRptAutPagCofin.BuscaContaDoc(CodDocumento: Real);
Begin
  If CdsBuscaContaDoc.Active Then
    CdsBuscaContaDoc.Close;
  SqlBuscaContaDoc.Prepare;
  SqlBuscaContaDoc.Params[0].AsFloat := CodDocumento;
  SqlBuscaContaDoc.Open;
  If Not CdsBuscaContaDoc.IsEmpty Then
  Begin
    Id := CdsBuscaContaDoc.FieldByName('IDCBANCARIA').AsFloat;
    sBanco := CdsBuscaContaDoc.FieldByName('NUMBANCO').AsString;
    sNomeBanco := CdsBuscaContaDoc.FieldByName('NOMEBANCO').AsString;
    sAgencia := CdsBuscaContaDoc.FieldByName('NUMAGENCIA').AsString;
    sNomeagencia := CdsBuscaContaDoc.FieldByName('NOMEAGENCIA').AsString;
    sNumero := CdsBuscaContaDoc.FieldByName('CONTACORRENTE').AsString;
    sDescTipo := CdsBuscaContaDoc.FieldByName('DESCTIPOCONTA').AsString;
    sTipo := CdsBuscaContaDoc.FieldByName('TIPOCONTA').AsString;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraConta := '';
      sNumeroFormat := sNumero;
    End
    Else
    Begin
      sMascaraConta := CdsBuscaContaDoc.FieldByName('MASCARACC').AsString + ';0; ';
      sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
    End;
    If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
    Begin
      sMascaraAgencia := '';
      sAgenciaFormat := sAgencia;
    End
    Else
    Begin
      sMascaraAgencia := CdsBuscaContaDoc.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
      sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
    End;
  End
  Else
  Begin
    If CdsBuscaContaDocForn.Active Then
      CdsBuscaContaDocForn.Close;

    SqlBuscaContaDocForn.Prepare;
    SqlBuscaContaDocForn.Params[0].AsFloat := CodDocumento;
    SqlBuscaContaDocForn.Open;
    If Not CdsBuscaContaDocForn.IsEmpty Then
    Begin
      Id := CdsBuscaContaDocForn.FieldByName('IDCBANCARIA').AsFloat;
      sBanco := CdsBuscaContaDocForn.FieldByName('NUMBANCO').AsString;
      sNomeBanco := CdsBuscaContaDocForn.FieldByName('NOMEBANCO').AsString;
      sAgencia := CdsBuscaContaDocForn.FieldByName('NUMAGENCIA').AsString;
      sNomeagencia := CdsBuscaContaDocForn.FieldByName('NOMEAGENCIA').AsString;
      sNumero := CdsBuscaContaDocForn.FieldByName('CONTACORRENTE').AsString;
      sDescTipo := CdsBuscaContaDocForn.FieldByName('DESCTIPOCONTA').AsString;
      sTipo := CdsBuscaContaDocForn.FieldByName('TIPOCONTA').AsString;

      If CdsBuscaContaDocForn.FieldByName('MASCARACC').IsNull Then
      Begin
        sMascaraConta := '';
        sNumeroFormat := sNumero;
      End
      Else
      Begin
        sMascaraConta := CdsBuscaContaDocForn.FieldByName('MASCARACC').AsString + ';0; ';
        sNumeroFormat := FormatMasktext(sMascaraConta, sNumero);
      End;

      If CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').IsNull Then
      Begin
        sMascaraAgencia := '';
        sAgenciaFormat := sAgencia;
      End
      Else
      Begin
        sMascaraAgencia := CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
        sAgenciaFormat := FormatMasktext(sMascaraAgencia, sAgencia);
      End;
    End
    Else
    Begin
      Id := -1;
      sBanco := '';
      sNomeBanco := '';
      sAgencia := '';
      sNomeagencia := '';
      sNumero := '';
      sDescTipo := '';
      sTipo := '0';
      sMascaraConta := '';
      sMascaraAgencia := '';
      sAgenciaFormat := '';
      sNumeroFormat := '';
    End;
  End;
End;

Procedure TRptAutPagCofin.GravaBancoAg;
Begin
  If Not CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').IsNull Then
  Begin
    if copy(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString, 1,2) <> 'CM' then
       CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString
    else
    begin
      CdsNomeUsuario.Close;
      SqlNomeUsuario.Prepare;
      SqlNomeUsuario.Params[0].AsFloat := StrToFloat(Copy(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString, 3,
        Length(CdsAutPagDoc.FieldByName('TRGUSERINCLUSAO').AsString)));
      SqlNomeUsuario.Open;
      CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := CdsNomeUsuario.Fields[0].AsString;
    end;
  End
  Else
    CdsAutPagDoc.FieldByName('NOMEUSUARIO').AsString := '';

  If (CdsAutPagDoc.AutoCalcFields) And
    (CdsAutPagDoc.FieldByName('FLGDOCBANCARIO').AsString = 'S') Then
  Begin
    BuscaContaDoc(CdsAutPagDoc.FieldByName('CODDOCUMENTO').AsFloat);
    CdsAutPagDoc.FieldByName('NUMBANCO').AsString := sBanco;
    CdsAutPagDoc.FieldByName('NUMAGENCIA').AsString := sAgenciaFormat;
    CdsAutPagDoc.FieldByName('CONTACORRENTE').AsString := sNumeroFormat;
  End;
End;

Procedure TRptAutPagCofin.ppDBText92Format(Sender: TObject;
  DisplayFormat: String; DataType: TppDataType; Value: Variant;
  Var Text: String);
Var
  sTmp: String;
Begin
  Inherited;
  If VarType(Value) = varString Then
  Begin
    sTmp := trim(VarAsType(Value, varString));
    If length(sTmp) = 11 Then
    Begin
      // CPF
      sTmp := copy(sTmp, 1, 3) +
        '.' +
        copy(sTmp, 4, 3) +
        '.' +
        copy(sTmp, 7, 3) +
        '-' +
        copy(sTmp, 10, 2);
    End
    Else If length(sTmp) = 14 Then
    Begin
      // CGC = CNPJ
      sTmp := copy(sTmp, 1, 2) +
        '.' +
        copy(sTmp, 3, 3) +
        '.' +
        copy(sTmp, 6, 3) +
        '/' +
        copy(sTmp, 9, 4) +
        '-' +
        copy(sTmp, 13, 2);
    End;
    Text := sTmp;
  End;
End;

function TRptAutPagCofin.Arredonda(pNumero : double;pCasas : byte) : double;
 var p: double;
     s: string;
begin
  p := pNumero * Power( 10, pCasas);
  s := floattostr(p);
  if pos(DecimalSeparator, s) <> 0 then
    p := round( p );
  p := p / Power( 10, pCasas );
  result:=p;
end;

procedure TRptAutPagCofin.ppDBCalc1Print(Sender: TObject);
begin
  inherited;
   ppLabel87.Caption := ppDBCalc4.Text;
end;

procedure TRptAutPagCofin.ppDBCalc2Print(Sender: TObject);
begin
  inherited;
  ppLabel43.Caption := ppDBCalc5.Text;
end;

function TRptAutPagCofin.Parametriza(iTipo: Integer): String;
var
  sSQL: String;
  sTabela: array[1..4] of string;
begin
  sSQL := EmptyStr;
  //Apelidando as 04 tabelas utilizadas, quando vazio não utilizada
  case iTipo of
    1 : begin
         sTabela[1]:= 'D';
         sTabela[2]:= 'L';
         sTabela[3]:= 'TPD';
         sTabela[4]:= 'RD';
       end;
    2: begin
         sTabela[1]:= 'DOC';
         sTabela[2]:= 'LAN';
         sTabela[3]:= EmptyStr;
         sTabela[4]:= EmptyStr;
       end;
    3: begin
         sTabela[1]:= 'D';
         sTabela[2]:= 'L';
         sTabela[3]:= EmptyStr;
         sTabela[4]:= 'RD';
       end;
    else begin
         sTabela[1]:= 'DOC';
         sTabela[2]:= EmptyStr;
         sTabela[3]:= EmptyStr;
         sTabela[4]:= 'R';
       end;
  end;
  If ( Not CmpRptCM.ParamValues[1].IsNull ) or
     ( Not CmpRptCM.ParamValues[11].IsNull) or
     ( Not CmpRptCM.ParamValues[12].IsNull) or
     ( Not CmpRptCM.ParamValues[13].IsNull) or
     ( Not CmpRptCM.ParamValues[14].IsNull) or
     ( Not CmpRptCM.ParamValues[19].IsNull) or
     ( Not CmpRptCM.ParamValues[20].IsNull) or
     ( Not CmpRptCM.ParamValues[21].IsNull) or
     ((Not CmpRptCM.ParamValues[2].IsNull ) and (Not CmpRptCM.ParamValues[4].IsNull )) or
     ((Not CmpRptCM.ParamValues[5].IsNull ) and (Not CmpRptCM.ParamValues[6].IsNull )) or
     ((Not CmpRptCM.ParamValues[7].IsNull ) and (Not CmpRptCM.ParamValues[8].IsNull )) or
     ((Not CmpRptCM.ParamValues[9].IsNull ) and (Not CmpRptCM.ParamValues[10].IsNull)) or
     ((Not CmpRptCM.ParamValues[15].IsNull) and (Not CmpRptCM.ParamValues[16].IsNull)) or
     ((Not CmpRptCM.ParamValues[17].IsNull) and (Not CmpRptCM.ParamValues[18].IsNull)) then
   Begin
     if (CmpRptCM.ParamValues[3].AsString <> EmptyStr) and
        (sTabela[1] <> EmptyStr) then
       begin
          Case StrToInt(CmpRptCM.ParamValues[3].AsString) Of
            1:  sSQL := sSQL + ' ('+sTabela[1]+'.NUMAPGR IS  NULL) AND ';    //não autorizados
            2:  sSQL := sSQL + ' ('+sTabela[1]+'.NUMAPGR IS NOT NULL) AND '; //autorizado
          End;
       end;

      If (Not CmpRptCM.ParamValues[1].IsNull) and (sTabela[4] <> EmptyStr) Then
         sSQL := sSQL + ' RTRIM('+sTabela[4]+'.CODCENTRORESPON) = ' + QuotedStr(CmpRptCM.ParamValues[1].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[2].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.TRGDTINCLUSAO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[2].AsString) +' AND ';
      If (Not CmpRptCM.ParamValues[4].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.TRGDTINCLUSAO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[4].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[20].IsNull) and (sTabela[1] <> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAEMISSAO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[20].AsString) +' AND ';
      If (Not CmpRptCM.ParamValues[21].IsNull) and (sTabela[1] <> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAEMISSAO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[21].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[5].IsNull) and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[2]+'.DATALANCTO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[5].AsString) + ' AND ';
      If (Not CmpRptCM.ParamValues[6].IsNull) and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[2]+'.DATALANCTO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[6].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[7].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAVENCTO,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[7].AsString) +' AND ';
      If (Not CmpRptCM.ParamValues[8].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAVENCTO,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[8].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[9].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAPROGRAMADA,''DD/MM/RRRR'') >= ' + QuotedStr(CmpRptCM.ParamValues[9].AsString)  + ' AND ';
      If (Not CmpRptCM.ParamValues[10].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' TO_DATE('+sTabela[1]+'.DATAPROGRAMADA,''DD/MM/RRRR'') <= ' + QuotedStr(CmpRptCM.ParamValues[10].AsString) + ' AND ';

      If (Not CmpRptCM.ParamValues[15].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.NODOCUMENTO >= ' + CmpRptCM.ParamValues[15].AsString + ' AND ';
      If (Not CmpRptCM.ParamValues[16].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.NODOCUMENTO <= ' + CmpRptCM.ParamValues[16].AsString + ' AND ';

      If (Not CmpRptCM.ParamValues[17].IsNull) and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[2]+'.VALOR >= ' + CmpRptCM.ParamValues[17].AsString +' AND ';
      If (Not CmpRptCM.ParamValues[18].IsNull)  and (sTabela[2]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[2]+'.VALOR <= ' + CmpRptCM.ParamValues[18].AsString + ' AND ';
      If (Not CmpRptCM.ParamValues[19].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.IDFORCLI = ' + Trim(CmpRptCM.ParamValues[19].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[11].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.CODPORTFORMA  = ' + Trim(CmpRptCM.ParamValues[11].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[12].IsNull) and (sTabela[3]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[3]+'.CODTIPDOC  = ' + Trim(CmpRptCM.ParamValues[12].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[13].IsNull)  and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.IDMODULO  = ' + Trim(CmpRptCM.ParamValues[13].AsString) +' AND ';

      If (Not CmpRptCM.ParamValues[14].IsNull) and (sTabela[1]<> EmptyStr) Then
         sSQL := sSQL + ' '+sTabela[1]+'.IDUSUARIOINCLUSAO  = ' + Trim(CmpRptCM.ParamValues[14].AsString) +' AND ';
   end;
   result := sSQL;
end;

procedure TRptAutPagCofin.CrmRptCMBeforePrint(Sender: TObject);
Var
  x: integer;
  sParametriza: String;
begin
//  inherited;

  With SqlAutPagDoc Do
  Begin
    SQL.Clear;
    SQL.Add('SELECT NUMFATURA, CODDOCUMENTO, NUMAPGR, REFERENCIA, NODOCUMENTO, NOMEMODULO,  ');
    SQL.Add('  COMPLDOCUMENTO, DATAVENCTO, DATAEMISSAO, DATAPROGRAMADA, NUMDOCUMENTO,       ');
    SQL.Add('  CODDOSSIE,                                                                   ');
    SQL.Add('  round(VALOR,2) as valor, round(VALOROUTRAMOEDA,2) as VALOROUTRAMOEDA, RAZAOSOCIAL, DESCRICAO, round(VALORRATEIO,2) as VALORRATEIO, ');
    SQL.Add('  DESCTDR, NOMEAP, NOMECR, NOMECC, OBS, FLGDOCBANCARIO, round(VLACRE,2) as VLACRE,                ');
    SQL.Add('  round(VLDEC,2) AS VLDEC, round(VLIMP,2) as VLIMP, round(VLLIQ,2) as VLLIQ, TRGUSERINCLUSAO,                                        ');
    SQL.Add('  TO_DATE(TO_CHAR(TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') AS TRGDTINCLUSAO,  ');
    SQL.Add('  (0) AS TOTVALORBRUTO, (0) AS TOTVALORDEDUCOES, (0) AS TOTVALORACRESCIMO,     ');
    SQL.Add('  (0) AS TOTVALORIMPOSTO, (0) AS TOTVALORAPAGAR, (0) AS SUMVALORBRUTO,         ');
    SQL.Add('  (0) AS SUMVALORDEDUCOES, (0) AS SUMVALORACRESCIMO, (0) AS SUMVALORIMPOSTO,   ');
    SQL.Add('  (0) AS SUMVALORAPAGAR, NUMIMOVEL, NOMEPATRO, DESCPLANO, DESCPROGRAMA,        ');
    SQL.Add('  IDFORCLI, (0) AS VALOLANCTOLIQ, (0) AS SUMVALOLANCTOLIQ,                     ');
    SQL.Add('  ''                    '' AS NOMEUSUARIO,                                     ');
    SQL.Add('  ''                    '' AS NUMBANCO,                                        ');
    SQL.Add('  ''                    '' AS NUMAGENCIA,                                      ');
    SQL.Add('  ''                    '' AS CONTACORRENTE,                                   ');
    SQL.Add('  NOMEPATROORIGEM, DESCPLANOORIGEM,                                            ');

    if ParamIntegra.RecPag = 'P' then
    begin
      SQL.Add('  SUBSTR(( select listagg(fdd.cod_fdo || '' '' || bxd.mes_ano_servico, '' | '')     '); // MIGRACAO-ORACLE leandro
      SQL.Add('           within group (order by bxd.numero_baixa) "FDO"                    ');
      SQL.Add('      from user_integracao_orcamentaria.fdo_digital fdd                      ');
      SQL.Add('      join user_integracao_orcamentaria.baixa_fdo bxd                        ');
      SQL.Add('        on bxd.id_fdo = fdd.id_fdo                                           ');
      SQL.Add('     where bxd.numero_baixa = coddocumento                                   ');
      SQL.Add('           and ROWNUM <= 10000                                               ');       // Paulo Nobre - MIGRACAO-ORACLE-2025 - TAS000000007135
      SQL.Add('  ),1,500) AS FDO                                                                   ');
    end
    else
      SQL.Add('  ''             '' AS FDO                                                   ');

    if ParamIntegra.RecPag = 'P' then
    begin
      SQL.Add('  ,                                                                          ');
      SQL.Add('  SUBSTR(( SELECT listagg(ID_SOLICITACAO_PAG, '', '') WITHIN GROUP (ORDER BY co_numero_ap) '); //MIGRACAO-ORACLE leandro
      SQL.Add('    FROM CORE_PORTAL_FINANCEIRO.SOLICITACAO_PAGAMENTO                        ');
      SQL.Add('    where CO_NUMERO_AP = NUMAPGR                                             ');
      SQL.Add('  ),1,500) AS IDPORTAL                                                              ');
    end
    else
      SQL.Add('  ''             '' AS IDPORTAL                                              ');

    SQL.Add('FROM                                                                           ');
    SQL.Add('  (SELECT D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR, D.REFERENCIA,                ');
    SQL.Add('          D.NODOCUMENTO, M.NOMEMODULO, D.COMPLDOCUMENTO, D.DATAVENCTO, D.DATAEMISSAO,        ');
    SQL.Add('          D.DATAPROGRAMADA, P.NUMDOCUMENTO,                                    ');
    SQL.Add('          D.CODDOSSIE,                                                         ');
    SQL.Add('          decode(d.recpag, ''P'', decode(l.debcre,''C'',round(L.VALOR,2) ,round(l.valor,2)*-1),   ');
    SQL.Add('             decode(l.debcre, ''D'', round(L.VALOR,2), round(l.valor,2) * -1)) as valor, ');
    SQL.Add('          decode(d.recpag,''P'',decode(l.debcre,''C'',round(L.VALOROUTRAMOEDA,2),       ');
    SQL.Add('             round(L.VALOROUTRAMOEDA,2)*-1),                                            ');
    SQL.Add('             decode(l.debcre,''D'',round(L.VALOROUTRAMOEDA,2),round(L.VALOROUTRAMOEDA,2)*-1 )    ');
    SQL.Add('                ) valoroutramoeda,                                          ');
    SQL.Add('          P.RAZAOSOCIAL, F.DESCRICAO, round(SUM(round(RD.VALOR,2)),2) AS VALORRATEIO,            ');
    SQL.Add('          TDR.DESCRICAO AS DESCTDR, AP.NOME AS NOMEAP, CR.NOME AS NOMECR,      ');
    SQL.Add('          (CC.NOME) AS NOMECC,              ');
    SQL.Add('          D.OBS, F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE,         ');
    SQL.Add('         (0) AS VLDEC, (0) AS VLIMP, (0) AS VLLIQ, D.TRGUSERINCLUSAO,          ');
    SQL.Add('         D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME AS NOMEPATRO,               ');
    SQL.Add('         PLANO.NOME AS DESCPLANO, PROGRAMA.DESCPROGRAMA, D.IDFORCLI,           ');
    SQL.Add('          PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM       ');
    SQL.Add('   FROM PESSOA P, PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,    ');
    SQL.Add('        FORMARECPAG F, TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP,       ');
    SQL.Add('        CENTRESPON CR, PLANPREVCONTABIL PLANO, PROGRAMA , TIPODOCRECPAG TPD    ');
    SQL.Add('        , PLANPREVCONTABIL PLANOO, PESSOA PATROO, MODULO M                     ');
    SQL.Add('   WHERE                                                                       ');
    SQL.Add('-- #ADF1                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');
    SQL.Add(' d.CODTIPDOC = tpd.CODTIPDOC and ');
    SQL.Add('  ((tpd.FLGIMPRIMEAP IS NULL) OR (tpd.FLGIMPRIMEAP = ''S'')) and ' );

  sParametriza:= Parametriza(1);

  if (sParametriza <> EmptyStr) then
      SQL.Add(sParametriza)
  Else if (CmpRptCM.ParamValues[0].AsString <> EmptyStr) then
    SQL.Add('   d.coddocumento = ' + CmpRptCM.ParamValues[0].AsString + '  and ');
    SQL.Add('        D.CODTIPDOC IN                                                         ');
    SQL.Add('    (SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           NOT EXISTS(SELECT *                                                 ');
    SQL.Add('                      FROM USUARIOXTPDOCTO B                                   ');
    SQL.Add('                      WHERE RECPAG= :RECPAG AND                                ');
    SQL.Add('                            B.IDUSUARIO = :IDUSUARIO                           ');
    SQL.Add('                      )                                                        ');
    SQL.Add('     UNION                                                                     ');
    SQL.Add('     SELECT CODTIPDOC                                                          ');
    SQL.Add('     FROM TIPODOCRECPAG A                                                      ');
    SQL.Add('     WHERE A.RECPAG = :RECPAG AND                                              ');
    SQL.Add('           EXISTS (SELECT *                                                    ');
    SQL.Add('                   FROM USUARIOXTPDOCTO B                                      ');
    SQL.Add('                   WHERE RECPAG = :RECPAG AND                                  ');
    SQL.Add('                         A.CODTIPDOC = B.CODTIPDOC AND                         ');
    SQL.Add('                         B.IDUSUARIO = :IDUSUARIO                              ');
    SQL.Add('                  )                                                            ');
    SQL.Add('     ) AND                                                                     ');
    SQL.Add('      (d.numfatura is null) and                                                ');
    SQL.Add('      (L.ESTORNO IS NULL) AND                                                  ');
    SQL.Add('      (D.RECPAG = :RECPAG) AND                                                 ');
    SQL.Add('      (D.IDPESSOA =  :IDPESSOA) AND                                            ');
    SQL.Add('      (D.IDMODULO = M.IDMODULO) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                    ');
    SQL.Add('      (D.OPERACAO = L.OPERACAO) AND                                            ');
    SQL.Add('      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                                   ');
    SQL.Add('      (P.IDPESSOA = D.IDFORCLI) AND                                            ');
    SQL.Add('      (D.CODFORMA = F.CODFORMA(+)) AND                                         ');
    SQL.Add('      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                           ');
    SQL.Add('      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                                     ');
    SQL.Add('      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                              ');
    SQL.Add('      (TDR.RECPAG(+) = RD.RECPAG) AND                                          ');
    SQL.Add('      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                      ');
    SQL.Add('      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                                     ');
    SQL.Add('      (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                         ');
    SQL.Add('      (CR.IDPESSOA(+) = RD.IDPESSOA) AND                                       ');
    SQL.Add('      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                              ');
    SQL.Add('      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                             ');
    SQL.Add('      (PATRO.IDPESSOA(+) = RD.IDPATRO)                                         ');
    SQL.Add('      AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                           ');
    SQL.Add('      AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                              ');
    SQL.Add('      AND NOT EXISTS (SELECT 1                                                 ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                 ');
    SQL.Add('    GROUP BY L.VALOR, D.NUMFATURA, D.CODDOCUMENTO, D.NUMAPGR,                  ');
    SQL.Add('             D.REFERENCIA, D.NODOCUMENTO, M.NOMEMODULO, D.COMPLDOCUMENTO,      ');
    SQL.Add('             D.DATAVENCTO, D.DATAEMISSAO, D.DATAPROGRAMADA,                    ');
    SQL.Add('             P.NUMDOCUMENTO, d.recpag, l.debcre, L.VALOROUTRAMOEDA,            ');
    SQL.Add('             D.CODDOSSIE,                                                      ');
    SQL.Add('             P.RAZAOSOCIAL, F.DESCRICAO, TDR.DESCRICAO, AP.NOME,               ');
    SQL.Add('             CR.NOME, CC.NOME, D.OBS, F.FLGDADOSBANCARIOS, D.TRGUSERINCLUSAO,  ');
    SQL.Add('             D.TRGDTINCLUSAO, RD.NUMIMOVEL, PATRO.NOME, PLANO.NOME,            ');
    SQL.Add('             PROGRAMA.DESCPROGRAMA, D.IDFORCLI                                 ');
    SQL.Add('             , PATROO.NOME, PLANOO.NOME                                          ');
    SQL.Add('    UNION                                                                      ');
    SQL.Add('    SELECT Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,           ');
    SQL.Add('           Q1.NODOCUMENTO, Q1.NOMEMODULO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO,    ');
    SQL.Add('           Q1.DATAEMISSAO, Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.CODDOSSIE, round(Q1.VALOR,2) AS VALOR, ');
    SQL.Add('           Q1.VALOROUTRAMOEDA, Q1.RAZAOSOCIAL, Q1.DESCRICAO,                   ');
    SQL.Add('           round(SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)),2) AS VALORRATEIO,              ');
    SQL.Add('           Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR, Q2.NOMECC, Q1.OBS,                ');
    SQL.Add('           Q1.FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC, (0) AS VLIMP,       ');
    SQL.Add('           (0) AS VLLIQ, Q1.TRGUSERINCLUSAO, Q1.TRGDTINCLUSAO,                 ');
    SQL.Add('           Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO, Q2.DESCPROGRAMA,          ');
    SQL.Add('           Q1.IDFORCLI                                                         ');
    SQL.Add('           , Q2.NOMEPATROORIGEM, Q2.DESCPLANOORIGEM                            ');
    SQL.Add('    FROM                                                                       ');
    SQL.Add('        (SELECT DOC.NUMFATURA, DOC.CODDOCUMENTO, DOC.NUMAPGR, DOC.REFERENCIA,  ');
    SQL.Add('            DOC.NODOCUMENTO, M.NOMEMODULO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO, ');
    SQL.Add('            DOC.DATAEMISSAO, DOC.DATAPROGRAMADA, P.NUMDOCUMENTO,               ');
    SQL.Add('            DOC.CODDOSSIE,                                                     ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',                   ');
    SQL.Add('              round(Lan.VALOR,2),round(lan.valor,2)*-1),                                         ');
    SQL.Add('              decode(lan.debcre,''D'',round(Lan.VALOR,2),round(lan.valor,2)*-1)) as valor,       ');
    SQL.Add('            decode(doc.recpag,''P'',decode(lan.debcre,''C'',Lan.VALOROUTRAMOEDA,');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1),decode(lan.debcre,''D'',               ');
    SQL.Add('                Lan.VALOROUTRAMOEDA,                                           ');
    SQL.Add('                Lan.VALOROUTRAMOEDA*-1)) as valoroutramoeda,                   ');
    SQL.Add('            P.RAZAOSOCIAL, F.DESCRICAO, DOC.OBS,                               ');
    SQL.Add('            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO, (0) AS VLACRE, (0) AS VLDEC,');
    SQL.Add('            (0) AS VLIMP, (0) AS VLLIQ, DOC.TRGUSERINCLUSAO,                   ');
    SQL.Add('            DOC.TRGDTINCLUSAO, DOC.IDFORCLI                                    ');
    SQL.Add('         FROM PESSOA P, DOCUMENTO DOC, LANCTODOCUM LAN, FORMARECPAG F, MODULO M');
    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF2                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');

  sParametriza:= Parametriza(2);

  if (sParametriza <> EmptyStr) then
      SQL.Add(sParametriza)

  Else if (CmpRptCM.ParamValues[0].AsString <> EmptyStr) then
    SQL.Add('   doc.coddocumento = ' + CmpRptCM.ParamValues[0].AsString + ' and ');
    SQL.Add('            DOC.CODTIPDOC IN                                                   ');
    SQL.Add('            (SELECT CODTIPDOC                                                  ');
    SQL.Add('              FROM TIPODOCRECPAG A                                             ');
    SQL.Add('              WHERE A.RECPAG = :RECPAG AND                                     ');
    SQL.Add('                NOT EXISTS(SELECT *                                            ');
    SQL.Add('                           FROM USUARIOXTPDOCTO B                              ');
    SQL.Add('                           WHERE RECPAG = :RECPAG AND                          ');
    SQL.Add('                                 B.IDUSUARIO = :IDUSUARIO)                     ');
    SQL.Add('UNION                                                                          ');
    SQL.Add('             SELECT CODTIPDOC                                                  ');
    SQL.Add('             FROM TIPODOCRECPAG A                                              ');
    SQL.Add('             WHERE A.RECPAG = :RECPAG AND                                      ');
    SQL.Add('                   EXISTS(SELECT *                                             ');
    SQL.Add('                          FROM USUARIOXTPDOCTO B                               ');
    SQL.Add('                          WHERE RECPAG = :RECPAG AND                           ');
    SQL.Add('                                A.CODTIPDOC = B.CODTIPDOC AND                  ');
    SQL.Add('                                B.IDUSUARIO = :IDUSUARIO)                      ');
    SQL.Add('            ) AND                                                              ');
    SQL.Add('            (LAN.ESTORNO IS NULL) AND                                          ');
    SQL.Add('            (DOC.RECPAG = :RECPAG) AND                                         ');
    SQL.Add('            (DOC.IDPESSOA = :IDPESSOA) AND                                     ');
    SQL.Add('            (P.IDPESSOA = DOC.IDFORCLI)AND                                     ');
    SQL.Add('            (DOC.IDMODULO = M.IDMODULO) AND                                    ');
    SQL.Add('            (DOC.CODFORMA = F.CODFORMA(+)) AND                                 ');
    SQL.Add('            (RTRIM(LAN.OPERACAO) IN (''3'',''13'')) AND                        ');
    SQL.Add('            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)                              ');
    SQL.Add('              AND NOT EXISTS (SELECT 1                                         ');
    SQL.Add('                        FROM DOCUMXDOCUM DXD                                   ');
    SQL.Add('                       WHERE DOC.CODDOCUMENTO = DXD.IDDOCUMENTO)               ');
    SQL.Add('        ) Q1,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA,(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''C'',      ');
    SQL.Add('                  round(Rd.VALOR,2), round(Rd.VALOR,2) * -1),                                    ');
    SQL.Add('                DECODE(L.DEBCRE, ''D'', round(Rd.VALOR,2), round(Rd.VALOR,2) * -1))) as valor,   ');
    SQL.Add('            TDR.DESCRICAO AS DESCTDR,                                          ');
    SQL.Add('            AP.NOME AS NOMEAP,                                                 ');
    SQL.Add('            CR.NOME AS NOMECR,                                                 ');
    SQL.Add('            (CC.NOME) AS NOMECC,            ');
    SQL.Add('            RD.NUMIMOVEL,PATRO.NOME AS NOMEPATRO,                              ');
    SQL.Add('            PLANO.NOME AS DESCPLANO,                                           ');
    SQL.Add('            PROGRAMA.DESCPROGRAMA                                              ');
    SQL.Add('            , PATROO.NOME AS NOMEPATROORIGEM, PLANOO.NOME AS DESCPLANOORIGEM   ');
    SQL.Add('          FROM PESSOA PATRO, DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM RD,       ');
    SQL.Add('            TIPORECEBDESEMB TDR, CENTCUST CC, UNIDNEGOCIO AP, CENTRESPON CR,   ');
    SQL.Add('            PLANPREVCONTABIL PLANO, PROGRAMA                                   ');
    SQL.Add('            , PLANPREVCONTABIL PLANOO, PESSOA PATROO                           ');
    SQL.Add('          WHERE                                                                ');
    SQL.Add('-- #ADF3                                                                       ');
    SQL.Add('-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSULTA             ');

    sParametriza:= Parametriza(3);

    if (sParametriza <> EmptyStr) then
      SQL.Add(sParametriza);

    SQL.Add('            (D.RECPAG = :RECPAG) AND                                           ');
    SQL.Add('            d.coddocumento=l.coddocumento and                                  ');
    SQL.Add('            l.operacao=d.operacao and                                          ');
    SQL.Add('            (D.IDPESSOA =  :IDPESSOA) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL) AND                                      ');
    SQL.Add('            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND                     ');
    SQL.Add('            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND                               ');
    SQL.Add('            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND                             ');
    SQL.Add('            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND                        ');
    SQL.Add('            (TDR.RECPAG(+) = RD.RECPAG) AND                                    ');
    SQL.Add('            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND                                ');
    SQL.Add('            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND                               ');
    SQL.Add('            (AP.IDPESSOA(+) = RD.IDPESSOA) AND                                 ');
    SQL.Add('            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND                   ');
    SQL.Add('            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND                        ');
    SQL.Add('            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND                       ');
    SQL.Add('            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND                               ');
    SQL.Add('            (CR.IDPESSOA(+) = RD.IDPESSOA)                                     ');
    SQL.Add('            AND (PLANOO.IDPLANOPREV(+) = RD.IDPLANOORIGEM)                     ');
    sql.Add('            AND (PATROO.IDPESSOA(+) = RD.IDPATROORIGEM)                        ');
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    SQL.Add('        ) Q2,                                                                  ');
    SQL.Add('        (SELECT D.NUMFATURA, sum(decode(d.recpag, ''P'', decode(l.debcre,      ');
    SQL.Add('                  ''C'', round(L.VALOR,2), round(l.valor,2)*-1), decode(l.debcre, ''D'', round(L.VALOR,2),');
    SQL.Add('                  round(l.valor,2)*-1))) as valor                                       ');
    SQL.Add('          FROM DOCUMENTO D, LANCTODOCUM L                                      ');
    SQL.Add('          WHERE (L.ESTORNO IS NULL) AND                                        ');
    SQL.Add('            (D.RECPAG= :RECPAG) AND                                            ');
    SQL.Add('            (D.IDPESSOA = :IDPESSOA) AND                                       ');
    SQL.Add('            (RTRIM(L.OPERACAO) IN (''1'',''11'')) AND                          ');
    SQL.Add('            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                              ');
    SQL.Add('            (D.OPERACAO = L.OPERACAO) AND                                      ');
    SQL.Add('            (D.NUMFATURA IS NOT NULL)                                          ');
    SQL.Add('            AND NOT EXISTS (SELECT 1                                           ');
    SQL.Add('                      FROM DOCUMXDOCUM DXD                                     ');
    SQL.Add('                     WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                   ');
    SQL.Add('          GROUP BY D.NUMFATURA                                                 ');
    SQL.Add('        ) Q3                                                                   ');
    SQL.Add('      WHERE                                                                    ');
    SQL.Add('        (Q1.NUMFATURA = Q2.NUMFATURA) AND                                      ');
    SQL.Add('        (Q3.NUMFATURA = Q2.NUMFATURA)                                          ');
    SQL.Add('      GROUP BY                                                                 ');
    SQL.Add('        Q1.NUMFATURA, Q1.CODDOCUMENTO, Q1.NUMAPGR, Q1.REFERENCIA,              ');
    SQL.Add('        Q1.NODOCUMENTO, Q1.NOMEMODULO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAEMISSAO, ');
    SQL.Add('        Q1.DATAPROGRAMADA, Q1.NUMDOCUMENTO, Q1.VALOR, Q1.VALOROUTRAMOEDA,      ');
    SQL.Add('        Q1.CODDOSSIE,                                                          ');
    SQL.Add('        Q1.RAZAOSOCIAL, Q1.DESCRICAO, Q2.DESCTDR, Q2.NOMEAP, Q2.NOMECR,        ');
    SQL.Add('        Q2.NOMECC, Q1.OBS, Q1.FLGDOCBANCARIO, Q1.TRGUSERINCLUSAO,              ');
    SQL.Add('        Q1.TRGDTINCLUSAO, Q2.NUMIMOVEL, Q2.NOMEPATRO, Q2.DESCPLANO,            ');
    SQL.Add('        Q2.DESCPROGRAMA,Q1.IDFORCLI                                            ');
    SQL.Add('        , Q2.DESCPLANOORIGEM, Q2.NOMEPATROORIGEM)                                ');
    // Paulo Nobre - WO39179 - Inicio
//    sql.Add(' ORDER BY RAZAOSOCIAL, NUMAPGR                                              ');
    sql.Add(' ORDER BY RAZAOSOCIAL, CODDOCUMENTO, NUMAPGR                                   ');
    // Paulo Nobre - WO39179 - Fim
    Prepare;
    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
    SQL.SaveToFile('C:\Planus\Temp\teste1.txt');//remover  WO11554 Ferrari
    Open;

    With SqlDocumFilhosAP Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO, DF.NODOCUMENTO as CAPDOCUMENTO,                       ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF    WHERE                                                   ');

      if not (Trim(CmpRptCM.ParamValues[0].AsString) = EmptyStr) then
        SQL.Add(' (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ')    AND      ')
      else
        sParametriza:= Parametriza(4);

      if (sParametriza <> EmptyStr) then
        SQL.Add(sParametriza);

      SQL.Add('      (T.CODTIPRECDES = R.CODTIPRECDES)  AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)   ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');
      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''P''                                                   ');
      SQL.SaveToFile('C:\Planus\Temp\teste2.txt');//remover  WO11554 Ferrari
      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;

    //Query para trazer os documentos filhos referentes a Contas a Receber
    With SqlDocumFilhoAR Do
    begin
      SQL.Clear;
      SQL.Add('SELECT R.CODDOCUMENTO,DF.NODOCUMENTO as CARDOCUMENTO,                        ');
      SQL.Add('       R.CODTIPRECDES,                                                       ');
      SQL.Add('       R.RECPAG,                                                             ');
      SQL.Add('       R.IDPESSOA,                                                           ');
      SQL.Add('       R.IDRESERVAORCAMEN,                                                   ');
      SQL.Add('       R.CODCENTRORESPON,                                                    ');
      SQL.Add('       C.CODEXTERNO AS CODEXTERNOCR,                                         ');
      SQL.Add('       R.UNIDNEGOC,                                                          ');
      SQL.Add('       R.MOECODIGO,                                                          ');
      SQL.Add('       R.VALOR,                                                              ');
      SQL.Add('       R.VALOROUTRAMOEDA,                                                    ');
      SQL.Add('       t.PLACONTACREDITO,                                                    ');
      SQL.Add('       R.IDUSUARIOINCLUSAO,                                                  ');
      SQL.Add('       U.NOME,                                                               ');
      SQL.Add('       C.NOME,                                                               ');
      SQL.Add('       R.CODCENTROCUSTO,                                                     ');
      SQL.Add('       CC.CODEXTERNO as CODEXTERNOCC,                                        ');
      SQL.Add('       R.IDRATEIODOCUM,                                                      ');
      SQL.Add('       T.DESCRICAO,                                                          ');
      SQL.Add('       I.MOESIGLA,                                                           ');
      SQL.Add('       CC.NOME AS NOMECENTROCUSTO,                                           ');
      SQL.Add('       R.PLANO,                                                              ');
      SQL.Add('       R.IDPATRO,                                                            ');
      SQL.Add('       R.IDPROGRAMA,                                                         ');
      SQL.Add('       PROGRAMA.FLGTIPOPROGRAMA,                                             ');
      SQL.Add('       R.NUMIMOVEL,                                                          ');
      SQL.Add('       PATRO.NOME AS NOMEPATRO,                                              ');
      SQL.Add('       PLANO.NOME AS DESCPLANO,                                              ');
      SQL.Add('       PROGRAMA.DESCPROGRAMA,                                                ');
      SQL.Add('       T.HITCODHIST,                                                         ');
      SQL.Add('       R.IDPLANOPREV,                                                        ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA,                                            ');
      SQL.Add('       T.FLGOBRIGARESERVA,                                                   ');
      SQL.Add('       RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,                           ');
      SQL.Add('       R.VALOR AS VALORRESERVAOLD,                                           ');
      SQL.Add('       R.VLRRESORCAMEN,                                                      ');
      SQL.Add('       -1 AS IDSEGREGACRITER,                                                ');
      SQL.Add('       0 AS CODSUBCONTA,                                                     ');
      SQL.Add('       0 AS CODSUBCONTAPASS,                                                 ');
      SQL.Add('       IDPLANOVIRTUAL,                                                       ');
      SQL.Add('       IDSEGREGACONTR,                                                       ');
      SQL.Add('       T.FLGOBRQTDECOTAS,                                                    ');
      SQL.Add('       R.IDPATROORIGEM,                                                      ');
      SQL.Add('       R.IDPLANOORIGEM,                                                      ');
      SQL.Add('       PATROORIGEM.NOME AS NOMEPATROORIGEM,                                  ');
      SQL.Add('       PLANOORIGEM.NOME AS DESCPLANOORIGEM                                   ');
      SQL.Add('  FROM RATEIODOCUM R,                                                        ');
      SQL.Add('       UNIDNEGOCIO U,                                                        ');
      SQL.Add('       CENTRESPON C,                                                         ');
      SQL.Add('       TIPORECEBDESEMB T,                                                    ');
      SQL.Add('       MOEDA I,                                                              ');
      SQL.Add('       CENTCUST CC,                                                          ');
      SQL.Add('       PESSOA PATRO,                                                         ');
      SQL.Add('       PLANPREVCONTABIL PLANO,                                               ');
      SQL.Add('       PROGRAMA,                                                             ');
      SQL.Add('       RESERVAORCAMEN,                                                       ');
      SQL.Add('       PESSOA PATROORIGEM,                                                   ');
      SQL.Add('       PLANPREVCONTABIL PLANOORIGEM,                                         ');
      SQL.Add('       DOCUMENTO DOC,                                                        ');
      SQL.Add('       DOCUMXDOCUM DXD, DOCUMENTO DF  where                                  ');

      if not (Trim(CmpRptCM.ParamValues[0].AsString) = EmptyStr) then
        SQL.Add(' (DOC.CODDOCUMENTO = ' + CmpRptCM.ParamValues[0].AsString + ') AND ')
      else
         sParametriza:= Parametriza(5);

      if (sParametriza <> EmptyStr) then
        SQL.Add(sParametriza);

      SQL.Add('     (T.CODTIPRECDES = R.CODTIPRECDES) AND (DF.CODDOCUMENTO = R.CODDOCUMENTO)  ');
      SQL.Add('      AND (T.RECPAG = R.RECPAG)                                              ');
      SQL.Add('      AND (T.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (U.UNIDNEGOC = R.UNIDNEGOC)                                        ');
      SQL.Add('      AND (U.IDPESSOA = R.IDPESSOA)                                          ');
      SQL.Add('      AND (I.MOECODIGO(+) = R.MOECODIGO)                                     ');
      SQL.Add('      AND (C.CODCENTRORESPON(+) = R.CODCENTRORESPON)                         ');
      SQL.Add('      AND (CC.IDEMPRESA(+) = R.IDPESSOA)                                     ');
      SQL.Add('      AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                          ');
      SQL.Add('      AND (C.IDPESSOA(+) = R.IDPESSOA)                                       ');
      SQL.Add('      AND (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV)                             ');
      SQL.Add('      AND (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA)                            ');
      SQL.Add('      AND (PATRO.IDPESSOA(+) = R.IDPATRO)                                    ');
      SQL.Add('      AND (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)          ');
      SQL.Add('      AND (PLANOORIGEM.IDPLANOPREV(+) = R.IDPLANOORIGEM)                     ');
      SQL.Add('      AND (PATROORIGEM.IDPESSOA(+) = R.IDPATROORIGEM)                        ');

      SQL.Add('      AND DXD.IDDOCUMENTOPAI = DOC.CODDOCUMENTO                              ');
      SQL.Add('      AND DXD.IDDOCUMENTO = R.CODDOCUMENTO                                   ');
      SQL.Add('      AND R.RECPAG = ''R''                                                   ');
      SQL.SaveToFile('C:\Planus\Temp\teste3.txt');//remover    WO11554 Ferrari
      if not CdsAutPagDoc.IsEmpty  then
      begin
        Prepare;
        Open;
      end;
    end;
  End;

  montaAlterador('-1');  //WO11554 Ferrari montar o cds vazio
  montaAtividade('-1');   //WO11554 Ferrari montar o cds vazio

  OldDoc := '';

  SqlDemGestAutPag.Open;
  While Not CdsAutPagDoc.Eof Do
  Begin
    MontaRegistro;

    CdsDemGestAutPag.Append;
    For X := 0 To CdsAutPagDoc.FieldCount - 1 Do
    Begin
      If CdsDemGestAutPag.FindField(CdsAutPagDoc.Fields[x].FieldName) <> Nil Then
        Case CdsAutPagDoc.FieldByName(CdsAutPagDoc.Fields[x].FieldName).DataType Of
          ftBoolean:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsBoolean := CdsAutPagDoc.Fields[x].AsBoolean;
          ftSmallint, ftInteger, ftWord, ftBytes:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsInteger := CdsAutPagDoc.Fields[x].AsInteger;
          ftFloat, ftCurrency:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsFloat := CdsAutPagDoc.Fields[x].AsFloat;
          ftString:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsString := Trim(CdsAutPagDoc.Fields[x].AsString);
          ftDate, ftTime, ftDateTime:
            CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).AsDateTime := CdsAutPagDoc.Fields[x].AsDateTime;
        Else
          CdsDemGestAutPag.FieldByName(CdsAutPagDoc.Fields[x].FieldName).Value := CdsAutPagDoc.Fields[x].Value + #13 + #13 + #13;
        End;
    End;
    CdsDemGestAutPag.Post;
    CdsAutPagDoc.Next;
  End;

  ppLabel54.Caption := Sistema.NomeModulo;

end;

procedure TRptAutPagCofin.ppDetailBand3BeforePrint(Sender: TObject);
begin
  montaAlterador(CdsDemGestAutPag.FieldByName( 'CODDOCUMENTO' ).AsString);    //WO11554 Ferrari
  montaAtividade(CdsDemGestAutPag.FieldByName( 'CODDOCUMENTO' ).AsString);    //WO11554 Ferrari
end;
// Inicio WO11554 Ferrari
procedure TRptAutPagCofin.montaAlterador(CodDocumento: string);
begin

    With SqlAutPagDetalhe Do
    begin
      SQL.Clear;
      SQL.Add('SELECT L.CODDOCUMENTO,                                                       ');
      SQL.Add('       DOC.NODOCUMENTO,                                                      ');
      SQL.Add('       L.NUMLANCTO,                                                          ');
      SQL.Add('       DOC.NFSSERVICO,                                                       ');
      SQL.Add('       L.CODALTERADOR,                                                       ');
      SQL.Add('       L.DATALANCTO,                                                         ');
      SQL.Add('       case when L.OPERACAO = 4 then L.VALOR end as VALOR,                   ');
      SQL.Add('       L.VALORBASERETENCAO,                                                  ');
      SQL.Add('       LS.DESCRICAO AS DESCDETALHE,                                          ');
      SQL.Add('       nvl(TA.DESCRICAO,LS.DESCRICAO) AS DESCSERVICO,                        ');
      SQL.Add('       TS.DESCRICAO AS DESCALTERADOR                                         ');
      SQL.Add('FROM LANCTODOCUM L                                                           ');
      SQL.Add('       INNER JOIN documento DOC on DOC.CODDOCUMENTO = L.CODDOCUMENTO         ');
      SQL.Add('       INNER JOIN TIPODOCRECPAG TP on tp.CODTIPDOC = DOC.CODTIPDOC           ');
      SQL.Add('       LEFT JOIN TIPOALTERADOR TA on TA.CODALTERADOR = L.CODALTERADOR        ');
      SQL.Add('       LEFT JOIN LISTA_SERVICOS LS on LS.IDSERVICO = DOC.NFSSERVICO          ');
      SQL.Add('       LEFT JOIN TIPOSERVICO TS ON TS.IDTIPOSERVICO = L.IDTIPOSERVICO        ');
      SQL.Add('       WHERE L.OPERACAO IN (4,2)                                               ');
      SQL.Add('AND L.CODDOCUMENTO = :CODDOCUMENTO                                           ');
      SQL.Add('ORDER BY L.CODDOCUMENTO                                                      ');
      Prepare;
      Parambyname('CODDOCUMENTO').AsString := CodDocumento;
      Open;
    end;


end;

procedure TRptAutPagCofin.montaAtividade(CodDocumento: string);
begin
    With SqlAtividadeAutPagDoc Do
    begin
      SQL.Clear;
      SQL.Add(' SELECT D.NUMFATURA,                                                                    ');
      SQL.Add('        D.CODDOCUMENTO,                                                                 ');
      SQL.Add('        D.NUMAPGR,                                                                      ');
      SQL.Add('        D.REFERENCIA,                                                                   ');
      SQL.Add('        D.NODOCUMENTO,                                                                  ');
      SQL.Add('        M.NOMEMODULO,                                                                   ');
      SQL.Add('        D.COMPLDOCUMENTO,                                                               ');
      SQL.Add('        D.DATAVENCTO,                                                                   ');
      SQL.Add('        D.DATAEMISSAO,                                                                  ');
      SQL.Add('        D.DATAPROGRAMADA,                                                               ');
      SQL.Add('        P.NUMDOCUMENTO,                                                                 ');
      SQL.Add('        D.CODDOSSIE,                                                                    ');
      SQL.Add('        decode(d.recpag, ''P'', decode(l.debcre, ''C'', round(L.VALOR, 2),                  ');
      SQL.Add('        round(l.valor,                                                                  ');
      SQL.Add('        2) *-1),                                                                        ');
      SQL.Add('        decode(l.debcre, ''D'', round(L.VALOR, 2),                                        ');
      SQL.Add('        round(l.valor,                                                                  ');
      SQL.Add('        2) * -1) ) as valor,                                                            ');
      SQL.Add('        decode(d.recpag, ''P'', decode(l.debcre, ''C'', round(L.VALOROUTRAMOEDA, 2),        ');
      SQL.Add('        round(L.VALOROUTRAMOEDA,                                                        ');
      SQL.Add('        2) *-1),                                                                        ');
      SQL.Add('        decode(l.debcre, ''D'', round(L.VALOROUTRAMOEDA, 2),                              ');
      SQL.Add('        round(L.VALOROUTRAMOEDA,                                                        ');
      SQL.Add('        2) *-1) ) valoroutramoeda,                                                      ');
      SQL.Add('        P.RAZAOSOCIAL,                                                                  ');
      SQL.Add('        F.DESCRICAO,                                                                    ');
      SQL.Add('        round(SUM(round(RD.VALOR,                                                       ');
      SQL.Add('        2) ),                                                                           ');
      SQL.Add('        2) AS VALORRATEIO,                                                              ');
      SQL.Add('        TDR.DESCRICAO AS DESCTDR,                                                       ');
      SQL.Add('        AP.NOME AS NOMEAP,                                                              ');
      SQL.Add('        CR.NOME AS NOMECR,                                                              ');
      SQL.Add('        (CC.NOME) AS NOMECC,                                                            ');
      SQL.Add('        D.OBS,                                                                          ');
      SQL.Add('        F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,                                          ');
      SQL.Add('        (0) AS VLACRE,                                                                  ');
      SQL.Add('        (0) AS VLDEC,                                                                   ');
      SQL.Add('        (0) AS VLIMP,                                                                   ');
      SQL.Add('        (0) AS VLLIQ,                                                                   ');
      SQL.Add('        D.TRGUSERINCLUSAO,                                                              ');
      SQL.Add('        D.TRGDTINCLUSAO,                                                                ');
      SQL.Add('        RD.NUMIMOVEL,                                                                   ');
      SQL.Add('        PATRO.NOME AS NOMEPATRO,                                                        ');
      SQL.Add('        PLANO.NOME AS DESCPLANO,                                                        ');
      SQL.Add('        PROGRAMA.DESCPROGRAMA,                                                          ');
      SQL.Add('        D.IDFORCLI,                                                                     ');
      SQL.Add('        PATROO.NOME AS NOMEPATROORIGEM,                                                 ');
      SQL.Add('        PLANOO.NOME AS DESCPLANOORIGEM                                                  ');
      SQL.Add('   FROM PESSOA P,                                                                       ');
      SQL.Add('        PESSOA PATRO,                                                                   ');
      SQL.Add('        DOCUMENTO D,                                                                    ');
      SQL.Add('        LANCTODOCUM L,                                                                  ');
      SQL.Add('        RATEIODOCUM RD,                                                                 ');
      SQL.Add('        FORMARECPAG F,                                                                  ');
      SQL.Add('        TIPORECEBDESEMB TDR,                                                            ');
      SQL.Add('        CENTCUST CC,                                                                    ');
      SQL.Add('        UNIDNEGOCIO AP,                                                                 ');
      SQL.Add('        CENTRESPON CR,                                                                  ');
      SQL.Add('        PLANPREVCONTABIL PLANO,                                                         ');
      SQL.Add('        PROGRAMA,                                                                       ');
      SQL.Add('        TIPODOCRECPAG TPD,                                                              ');
      SQL.Add('        PLANPREVCONTABIL PLANOO,                                                        ');
      SQL.Add('        PESSOA PATROO,                                                                  ');
      SQL.Add('        MODULO M                                                                        ');
      SQL.Add('  WHERE d.CODTIPDOC = tpd.CODTIPDOC                                                     ');
      SQL.Add('    and ( (tpd.FLGIMPRIMEAP IS NULL ) OR (tpd.FLGIMPRIMEAP = ''S'') )                     ');
      SQL.Add('    and d.coddocumento = :CODDOCUMENTO                                                       ');
      SQL.Add('    and D.CODTIPDOC IN( SELECT CODTIPDOC                                                ');
      SQL.Add('                          FROM TIPODOCRECPAG A                                          ');
      SQL.Add('                         WHERE A.RECPAG = :RECPAG                                       ');
      SQL.Add('                           AND NOT EXISTS ( SELECT *                                    ');
      SQL.Add('                                              FROM USUARIOXTPDOCTO B                    ');
      SQL.Add('                                             WHERE RECPAG= :RECPAG                      ');
      SQL.Add('                                               AND B.IDUSUARIO = :IDUSUARIO )           ');
      SQL.Add('                         UNION                                                          ');
      SQL.Add('                        SELECT CODTIPDOC                                                ');
      SQL.Add('                          FROM TIPODOCRECPAG A                                          ');
      SQL.Add('                         WHERE A.RECPAG = :RECPAG                                       ');
      SQL.Add('                           AND EXISTS ( SELECT *                                        ');
      SQL.Add('                                          FROM USUARIOXTPDOCTO B                        ');
      SQL.Add('                                         WHERE RECPAG = :RECPAG                         ');
      SQL.Add('                                           AND A.CODTIPDOC = B.CODTIPDOC                ');
      SQL.Add('                                           AND B.IDUSUARIO = :IDUSUARIO ) )             ');
      SQL.Add('    AND (d.numfatura is null )                                                          ');
      SQL.Add('    and (L.ESTORNO IS NULL )                                                            ');
      SQL.Add('    AND (D.RECPAG = :RECPAG )                                                           ');
      SQL.Add('    AND (D.IDPESSOA = :IDPESSOA )                                                       ');
      SQL.Add('    AND (D.IDMODULO = M.IDMODULO)                                                       ');
      SQL.Add('    AND (D.CODDOCUMENTO = L.CODDOCUMENTO)                                               ');
      SQL.Add('    AND (D.OPERACAO = L.OPERACAO)                                                       ');
      SQL.Add('    AND (D.CODDOCUMENTO = RD.CODDOCUMENTO)                                              ');
      SQL.Add('    AND (P.IDPESSOA = D.IDFORCLI)                                                       ');
      SQL.Add('    AND (D.CODFORMA = F.CODFORMA (+ ) )                                                 ');
      SQL.Add('    AND (CC.CODCENTROCUSTO (+ ) = RD.CODCENTROCUSTO)                                    ');
      SQL.Add('    AND (CC.IDEMPRESA (+ ) = RD.IDEMPRESA)                                              ');
      SQL.Add('    AND (TDR.CODTIPRECDES (+ ) = RD.CODTIPRECDES)                                       ');
      SQL.Add('    AND (TDR.RECPAG (+ ) = RD.RECPAG)                                                   ');
      SQL.Add('    AND (TDR.IDPESSOA (+ ) = RD.IDPESSOA)                                               ');
      SQL.Add('    AND (AP.UNIDNEGOC (+ ) = RD.UNIDNEGOC)                                              ');
      SQL.Add('    AND (AP.IDPESSOA (+ ) = RD.IDPESSOA)                                                ');
      SQL.Add('    AND (CR.CODCENTRORESPON (+ ) = RD.CODCENTRORESPON)                                  ');
      SQL.Add('    AND (CR.IDPESSOA (+ ) = RD.IDPESSOA)                                                ');
      SQL.Add('    AND (PLANO.IDPLANOPREV (+ ) = RD.IDPLANOPREV)                                       ');
      SQL.Add('    AND (PROGRAMA.IDPROGRAMA (+ ) = RD.IDPROGRAMA)                                      ');
      SQL.Add('    AND (PATRO.IDPESSOA (+ ) = RD.IDPATRO)                                              ');
      SQL.Add('    AND (PLANOO.IDPLANOPREV (+ ) = RD.IDPLANOORIGEM)                                    ');
      SQL.Add('    AND (PATROO.IDPESSOA (+ ) = RD.IDPATROORIGEM)                                       ');
      SQL.Add('    AND NOT EXISTS ( SELECT 1                                                           ');
      SQL.Add('                       FROM DOCUMXDOCUM DXD                                             ');
      SQL.Add('                      WHERE D.CODDOCUMENTO = DXD.IDDOCUMENTO)                           ');
      SQL.Add('  GROUP BY L.VALOR,                                                                     ');
      SQL.Add('        D.NUMFATURA,                                                                    ');
      SQL.Add('        D.CODDOCUMENTO,                                                                 ');
      SQL.Add('        D.NUMAPGR,                                                                      ');
      SQL.Add('        D.REFERENCIA,                                                                   ');
      SQL.Add('        D.NODOCUMENTO,                                                                  ');
      SQL.Add('        M.NOMEMODULO,                                                                   ');
      SQL.Add('        D.COMPLDOCUMENTO,                                                               ');
      SQL.Add('        D.DATAVENCTO,                                                                   ');
      SQL.Add('        D.DATAEMISSAO,                                                                  ');
      SQL.Add('        D.DATAPROGRAMADA,                                                               ');
      SQL.Add('        P.NUMDOCUMENTO,                                                                 ');
      SQL.Add('        d.recpag,                                                                       ');
      SQL.Add('        l.debcre,                                                                       ');
      SQL.Add('        L.VALOROUTRAMOEDA,                                                              ');
      SQL.Add('        D.CODDOSSIE,                                                                    ');
      SQL.Add('        P.RAZAOSOCIAL,                                                                  ');
      SQL.Add('        F.DESCRICAO,                                                                    ');
      SQL.Add('        TDR.DESCRICAO,                                                                  ');
      SQL.Add('        AP.NOME,                                                                        ');
      SQL.Add('        CR.NOME,                                                                        ');
      SQL.Add('        CC.NOME,                                                                        ');
      SQL.Add('        D.OBS,                                                                          ');
      SQL.Add('        F.FLGDADOSBANCARIOS,                                                            ');
      SQL.Add('        D.TRGUSERINCLUSAO,                                                              ');
      SQL.Add('        D.TRGDTINCLUSAO,                                                                ');
      SQL.Add('        RD.NUMIMOVEL,                                                                   ');
      SQL.Add('        PATRO.NOME,                                                                     ');
      SQL.Add('        PLANO.NOME,                                                                     ');
      SQL.Add('        PROGRAMA.DESCPROGRAMA,                                                          ');
      SQL.Add('        D.IDFORCLI,                                                                     ');
      SQL.Add('        PATROO.NOME,                                                                    ');
      SQL.Add('        PLANOO.NOME                                                                     ');
      Prepare;
      Parambyname('CODDOCUMENTO').AsString := CodDocumento;
      Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
      Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Parambyname('IDUSUARIO').AsFloat := CrmRptCM.IdUsuario;
      Open;
    end;

end;
// Fim WO11554 Ferrari

End.


