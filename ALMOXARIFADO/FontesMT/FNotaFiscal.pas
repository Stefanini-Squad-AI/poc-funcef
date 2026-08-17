unit FNotaFiscal;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, wwdblook,
  CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,
  TREdit, DBTables, Wwquery, Provider,uCtrlNotaFiscal, uCmTypes;

type
  TFrmNotaFiscal = class(TFrmCadastroMestreDetMT)
    tbsImpostosNota: TTabSheet;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    lblValor: TLabel;
    dbenNumDoc: TDBRealEdit;
    dbeCompl: TwwDBEdit;    gbDatas: TGroupBox;
    lblData: TLabel;
    lblEmissao: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbeDataEmi: TCMDateTimePicker;
    dbeValorCorrente: TDBRealEdit;
    dblcFornCli: TCMProcuraForCli;
    pgclDadosItem: TPageControl;
    tbsDadosGerais: TTabSheet;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    lbvalorUN: TLabel;
    lbValorTot: TLabel;
    dblkpcmbArtigo: TwwDBLookupCombo;
    dblkpcmbDesc: TwwDBLookupCombo;
    gbClasFisc: TGroupBox;
    dblkpcmbClasFisc: TwwDBLookupCombo;
    dblcUnidMedida: TwwDBLookupCombo;
    dbedQtdeEnt: TDBRealEdit;
    dbedValUN: TDBRealEdit;
    reValorTotal: TRealEdit;
    GrpDestMerc: TGroupBox;
    lblDestEdit: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    dblkpcmbAlmoxa: TwwDBLookupCombo;
    dbrgECA: TDBRadioGroup;
    tbsAgregItem: TTabSheet;
    PnlGrd: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbgrAgregItem: TwwDBGrid;
    Panel1: TPanel;
    dbedAliqItem: TDBRealEdit;
    dbedBaseItem: TDBRealEdit;
    dbedValorAgrItem: TDBRealEdit;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbgrAgregNota: TwwDBGrid;
    Panel3: TPanel;
    dbedAliqNota: TDBRealEdit;
    dbedBaseNota: TDBRealEdit;
    dbedValorAgrNota: TDBRealEdit;
    qryNota: TwwQuery;
    qryItemNota: TwwQuery;
    qryItemNotaNUMOC: TFloatField;
    qryItemNotaCODARTIGO: TStringField;
    qryItemNotaDESCPROD: TStringField;
    qryItemNotaQTDERECEBDEVOL: TFloatField;
    qryItemNotaCODMEDIDA: TStringField;
    qryItemNotaVLRUNITARIO: TFloatField;
    qryItemNotaVALORTOTAL: TFloatField;
    qryItemNotaVLRESTOQUE: TFloatField;
    qryItemNotaCODCENTROCUSTO: TStringField;
    qryItemNotaCODFISCAL: TStringField;
    qryItemNotaDATAVALIDADE: TDateTimeField;
    qryItemNotaCODALMOXARIFADO: TFloatField;
    qryItemNotaCODCENTRORESPON: TStringField;
    qryItemNotaUNIDNEGOC: TFloatField;
    qryItemNotaCODTIPRECDES: TStringField;
    qryItemNotaCODCOR: TStringField;
    qryItemNotaCODTAMANHO: TStringField;
    qryItemNotaIDITENSRECDEV: TFloatField;
    qryItemNotaIDMOV: TFloatField;
    qryItemNotaIDEMPRESA: TFloatField;
    qryItemNotaIDPESSOA: TFloatField;
    qryItemNotaIDNFRECEBDEVOL: TFloatField;
    qryItemNotaFLGDESTINO: TStringField;
    qryItemNotaRECPAG: TStringField;
    qryItemNotaIDPRODVARI: TFloatField;
    qryItemNotaCODFISCALPADRAO: TStringField;
    qryItemNotaCONSUMOREVENDA: TStringField;
    qryItemNotaIDRESERVAORCAMEN: TFloatField;
    qryItemNotaIDITEMOC: TFloatField;
    qryItemNotaQTDETOTAL: TFloatField;
    qryItemNotaCODMEDORI: TStringField;
    qryItemNotaFLGPARCTOT: TStringField;
    dspNota: TDataSetProvider;
    dspItemNota: TDataSetProvider;
    qryNotaIDNFRECEBDEVOL: TFloatField;
    qryNotaNUMNF: TFloatField;
    qryNotaCOMPLNF: TStringField;
    qryNotaIDPESSOA: TFloatField;
    qryNotaCODDOCUMENTO: TFloatField;
    qryNotaFLGTIPONOTA: TStringField;
    qryNotaDATAEMISNF: TDateTimeField;
    qryNotaIDFORCLI: TFloatField;
    qryNotaDATAENTDEVOL: TDateTimeField;
    qryNotaVLRNOTAFISCAL: TFloatField;
    qryNotaPLNCODIGO: TFloatField;
    qryNotaIDNFREFERENCIA: TFloatField;
    cdsItemNota: TCMClientDataSet;
    qryArtigo: TwwQuery;
    qryArtigoCODARTIGO: TStringField;
    qryArtigoDESCPROD: TStringField;
    qryArtigoCODFISCALPADRAO: TStringField;
    qryArtigoCONSUMOREVENDA: TStringField;
    qryArtigoLOTEVALIDADE: TStringField;
    qryArtigoFLGVARIAVEL: TStringField;
    qryArtigoCODTIPRECDES: TStringField;
    qryArtigoRECPAG: TStringField;
    qryArtigoIDPESSOA: TFloatField;
    qryArtigoITEMESTOCAVEL: TStringField;
    dspArtigo: TDataSetProvider;
    cdsArtigo: TCMClientDataSet;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qryUnidMedFATOR: TFloatField;
    dspUnidMed: TDataSetProvider;
    cdsUnidMed: TCMClientDataSet;
    dsAgregNota: TwwDataSource;
    qryAgregNota: TwwQuery;
    qryAgregNotaDESCCUSTAGREG: TStringField;
    qryAgregNotaALIQUOTA: TFloatField;
    qryAgregNotaBASECALCULO: TFloatField;
    qryAgregNotaVLRAGREGADO: TFloatField;
    qryAgregNotaCODTIPOCUSTAGREG: TFloatField;
    qryAgregNotaCODTRATFISCE: TStringField;
    qryAgregNotaPERCVALOR: TStringField;
    qryAgregNotaIDNFRECEBDEVOL: TFloatField;
    qryAgregNotaIDNFCOMPLEMENTAR: TFloatField;
    qryAgregNotaIDAGRNFRECDEV: TFloatField;
    qryAgregNotaVLRRECUPERADO: TFloatField;
    dsAgregItem: TwwDataSource;
    qryAgregItem: TwwQuery;
    qryAgregItemDESCCUSTAGREG: TStringField;
    qryAgregItemALIQUOTA: TFloatField;
    qryAgregItemBASECALCULO: TFloatField;
    qryAgregItemVLRAGREGADO: TFloatField;
    qryAgregItemCODTIPOCUSTAGREG: TFloatField;
    qryAgregItemCODTRATFISCE: TStringField;
    qryAgregItemPERCVALOR: TStringField;
    qryAgregItemIDAGRITENSRECDEV: TFloatField;
    qryAgregItemIDITENSRECDEV: TFloatField;
    qryAgregItemVLRRECUPERADO: TFloatField;
    qryAgregItemACUMBASE: TFloatField;
    qryAgregItemFLGBASE: TStringField;
    cdsAgregNota: TCMClientDataSet;
    cdsAgregItem: TCMClientDataSet;
    dspAgregNota: TDataSetProvider;
    dspAgregItem: TDataSetProvider;
    CdsCentroCusto: TCMClientDataSet;
    qryCentroCusto: TwwQuery;
    qryCentroCustoNOME: TStringField;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    dspCentroCusto: TDataSetProvider;
    qryAlmox: TwwQuery;
    dspAlmox: TDataSetProvider;
    qryAlmoxCODALMOXARIFADO: TFloatField;
    qryAlmoxDESCALMOX: TStringField;
    qryAlmoxCODCENTROCUSTO: TStringField;
    qryAlmoxCODCUSTEIO: TFloatField;
    cdsAlmox: TCMClientDataSet;
    qryClasFisc: TwwQuery;
    qryClasFiscCODFISCAL: TStringField;
    qryClasFiscDESCCLASSIFISCAL: TStringField;
    dspClasFisc: TDataSetProvider;
    cdsClasFisc: TCMClientDataSet;
    qryAgregItemDef: TwwQuery;
    dspAgregItemDef: TDataSetProvider;
    cdsAgregItemDef: TCMClientDataSet;
    rgTipoNota: TDBRadioGroup;
    procedure dblkpcmbArtigoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidMedidaEnter(Sender: TObject);
    procedure dbedValUNExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reValorTotalExit(Sender: TObject);
    procedure dblcFornCliExit(Sender: TObject);
    procedure dbgrAgregItemExit(Sender: TObject);
    procedure dbedAliqItemExit(Sender: TObject);
    procedure dbedBaseItemExit(Sender: TObject);
    procedure dbgrAgregNotaExit(Sender: TObject);
    procedure dbedAliqNotaExit(Sender: TObject);
    procedure dbedBaseNotaExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure dbedValorAgrNotaExit(Sender: TObject);
    procedure dblkpcmbClasFiscExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dbedValorAgrItemExit(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    NotaFiscal : TCtrlNotaFiscal;
    sCodFisc   : String;
    sUF        : String;
    iPais      : Integer;
    rBase      : Double;
    rPerc      : Double;
    rValorImp  : Double;
    //
    Procedure SetArtigo( sCodFisc : String );
    Procedure SetClasFiscal;
    Procedure SelNota(idNota : Double);
    Procedure SelItemNota(idNota : Double);
  public
    { Public declarations }
  end;

var
  FrmNotaFiscal: TFrmNotaFiscal;

implementation

{$R *.DFM}

{ TFrmNotaFiscal }
Uses uModulo,uSistema,dBaseDados,uMensErro ;

procedure TFrmNotaFiscal.SetArtigo( sCodFisc :String );
Var
   iAux      : LongInt;
   sDescProd : String;
begin
  inherited;
  iAux := -1;
  if Modulo.sIntegraLivro = 'S' then
     Begin
        cdsItemNota.Fields.FieldByName('CODFISCAL').AsString     := sCodFisc + cdsArtigo.Fields.FieldByName('CODFISCALPADRAO').AsString;
     end;
  cdsItemNota.Fields.FieldByName('CODTIPRECDES').AsString  := cdsArtigo.Fields.FieldByName('CODTIPRECDES').AsString;
  cdsItemNota.Fields.FieldByName('RECPAG').AsString        := cdsArtigo.Fields.FieldByName('RECPAG').AsString;
  cdsItemNota.Fields.FieldByName('IDPESSOA').AsInteger     := cdsArtigo.Fields.FieldByName('IDPESSOA').AsInteger;
  if cdsArtigo.Fields.FieldByName('FLGVARIAVEL').asString = 'S' Then
     iAux := Modulo.ProdVari( sDescProd );
  If iAux > 0 Then
     Begin
         cdsItemNota.Fields.FieldByName('IDPRODVARI').AsInteger := iAux;
         cdsItemNota.Fields.FieldByName('DESCPROD').AsString    := Copy(sDescProd,1,60);
     End
  Else
     cdsItemNota.Fields.FieldByName('IDPRODVARI').Clear;
end;

procedure TFrmNotaFiscal.dblkpcmbArtigoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Modified And (Trim(dblkpcmbArtigo.Text) <> '') Then
     Begin
        dblkpcmbDesc.LookupValue := dblkpcmbArtigo.LookupValue;
        SetArtigo('');
     End;
end;

procedure TFrmNotaFiscal.dblkpcmbDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Modified And (Trim(dblkpcmbDesc.Text) <> '') Then
     Begin
        dblkpcmbArtigo.LookupValue := dblkpcmbDesc.LookupValue;
        SetArtigo('');
     End;
end;

procedure TFrmNotaFiscal.dblcUnidMedidaEnter(Sender: TObject);
begin
  inherited;
  cdsUnidMed.Close;
  cdsUnidMed.ParamByName('pCODPROD').AsString := Copy(dblkpcmbArtigo.LookUpValue,1,6);
  cdsUnidMed.Open;
end;

procedure TFrmNotaFiscal.dbedValUNExit(Sender: TObject);
begin
  inherited;
  If Modulo.sFlgInfoValorUN = 'S' Then
    Begin
        reValorTotal.Value := dbedQtdeEnt.Value * dbedValUN.Value;
        SetClasFiscal;
        dbrgECA.SetFocus;
    End;
end;

procedure TFrmNotaFiscal.SetClasFiscal;
begin
   cdsAgregItem.First;
   While Not cdsAgregItem.EOF Do
     Begin
        if cdsAgregItem.FieldByName('VLRAGREGADO').asFloat = 0 then
            Begin
                NotaFiscal.CalcImposto( Copy(dblkpcmbArtigo.LookUpValue,1,6),
                                        sUF,
                                        iPais,
                                        cdsAgregItem.FieldByName('CODTIPOCUSTAGREG').asInteger,
                                        reValorTotal.Value,
                                        rBase,rPerc,rValorImp);
                If (rBase > 0) And (rPerc > 0) And (rValorImp > 0) Then
                   Begin
                       cdsAgregItem.Edit;
                       cdsAgregItem.FieldByName('ALIQUOTA').asFloat    := rPerc;
                       cdsAgregItem.FieldByName('BASECALCULO').asFloat := rBase;
                       cdsAgregItem.FieldByName('VLRAGREGADO').asFloat := rValorImp;
                       cdsAgregItem.Post;
                   End;
            End;
        cdsAgregItem.Next;
     End;
   cdsAgregItem.First;
end;

procedure TFrmNotaFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  NotaFiscal := TCtrlNotaFiscal.Create;
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  NotaFiscal.cdsNota          := Cds;
  NotaFiscal.cdsItemNota      := cdsItemNota;
  NotaFiscal.cdsAgregItemNota := cdsAgregItemDef;
  NotaFiscal.cdsAgregNota     := cdsAgregNota;
  //DataBase para conexão
  NotaFiscal.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // preparação da Tela e seus Componentes Locais
  MontaSelect.Filtro.Add('NFRECEBDEVOL.IDPESSOA = '+IntToStr(Sistema.idempresa));
  // Tira para compatibilidade
  MontaSelect.Filtro.Add('(NFRECEBDEVOL.FLGTIPONOTA = ''E'') OR (NFRECEBDEVOL.FLGTIPONOTA = ''S'') ');
  //
  If Modulo.sFlgInfoValorUN = 'S' Then
     Begin
        // atualiza edit e label do valor unitario
         dbedValUN.Top         := dblcUnidMedida.Top;
         dbedValUN.Left        := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
         dbedValUN.Enabled     := True;
         dbedValUN.TabOrder    := 4;

         lbvalorUN.Top         := dblcUnidMedida.Top - 15;
         lbvalorUN.Left        := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
        // atualiza edit e label do valor Total
         reValorTotal.Top      := gbClasFisc.Top + 15;
         reValorTotal.Left     := gbClasFisc.Left + gbClasFisc.Width + 10;
         reValorTotal.Enabled  := False;
         reValorTotal.TabOrder := 8;

         lbvalorTot.Top        := gbClasFisc.Top;
         lbvalorTot.Left       := gbClasFisc.Left + gbClasFisc.Width +10;
     End
  Else
     Begin
         dbedValUN.Top         := gbClasFisc.Top + 15;
         dbedValUN.Left        := gbClasFisc.Left + gbClasFisc.Width + 10;
         dbedValUN.Enabled     := False;
         dbedValUN.TabOrder    := 8;

         lbvalorUN.Top         := gbClasFisc.Top;
         lbvalorUN.Left        := gbClasFisc.Left + gbClasFisc.Width + 10;
        // atualiza edit e label do valor Total
         reValorTotal.Top      := dblcUnidMedida.Top;
         reValorTotal.Left     := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
         reValorTotal.Enabled  := True;
         reValorTotal.TabOrder := 4;

         lbvalorTot.Top        := dblcUnidMedida.Top - 15;
         lbvalorTot.Left       := dblcUnidMedida.Left + dblcUnidMedida.Width + 5;
     End;
  // Abrindo os ClientDataSet´s PRINCIPAIS
  SelNota(-1);
  // Abrindo os ClientDataSet´s AUXILIARES
  cdsClasFisc.Open;
  //
  cdsArtigo.Close;
  cdsArtigo.Open;
  //
  cdsAlmox.Close;
  cdsAlmox.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  cdsAlmox.Open;
  //
  cdsCentroCusto.Close;
  cdsCentroCusto.ParambyName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
  cdsCentroCusto.Open;

end;

procedure TFrmNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  NotaFiscal.Free;
end;

procedure TFrmNotaFiscal.reValorTotalExit(Sender: TObject);
begin
  inherited;
  If Modulo.sFlgInfoValorUN = 'N' Then
    Begin
        dbedValUN.Value := reValorTotal.Value / dbedQtdeEnt.Value ;
        SetClasFiscal;
        dbrgECA.SetFocus;
    End;
end;

procedure TFrmNotaFiscal.dblcFornCliExit(Sender: TObject);
begin
  inherited;
   if (Cds.State in ([dsInsert,dsEdit])) And (ActiveControl.Tag <> 999) Then
     Begin
         sCodFisc := NotaFiscal.CalcClasFiscal(dblcFornCli.ForCliReg.Id,sUF,iPais );
     End;
end;

procedure TFrmNotaFiscal.dbgrAgregItemExit(Sender: TObject);
begin
  inherited;
if pgclDadosItem.ActivePage.TabIndex = 1 then
  Begin
     if cdsAgregItem.FieldByName('PERCVALOR').AsString = 'V' then
     Begin
        dbedAliqItem.Enabled := False;
        dbedBaseItem.Enabled := False;
        dbedValorAgrItem.SetFocus;
     end
     else
     Begin
        dbedAliqItem.Enabled := True;
        dbedBaseItem.Enabled := True;
        dbedAliqItem.SetFocus;
     end;
     if dbedValorAgrItem.Value = 0 then
     Begin
        rBase :=0;
        rPerc :=0;
        rValorImp:=0;
        NotaFiscal.CalcImposto( Copy(dblkpcmbArtigo.LookUpValue,1,6),
                                sUF,
                                iPais,
                                cdsAgregItem.FieldByName('CodTipoCustAgreg').asInteger,
                                reValorTotal.Value,
                                rBase,rPerc,rValorImp);
        if rBase = 0 then
           rBase :=reValorTotal.Value;
        //
        dbedAliqItem.Value    :=rPerc;
        dbedBaseItem.Value    :=rBase;
        dbedValorAgrItem.Value:=rValorImp;
        cdsAgregItem.Edit;
        cdsAgregItem.FieldByName('ALIQUOTA').asFloat    := rPerc;
        cdsAgregItem.FieldByName('BASECALCULO').asFloat := rBase;
        cdsAgregItem.FieldByName('VLRAGREGADO').asFloat := rValorImp;
     end
     else
        rBase:=dbedBaseItem.Value;

  end;
end;

procedure TFrmNotaFiscal.dbedAliqItemExit(Sender: TObject);
Var
   rAcumBase  : Double;
   bmMarca    : TBookMark;
begin
  inherited;
  If cdsAgregItem.FieldByName('FLGBASE').AsString = 'S' then
     begin
        dbedBaseItem.Value                              := rBase;
        cdsAgregItem.FieldByName('BASECALCULO').AsFloat := rBase;
     end
  else
     begin
        bmMarca   := cdsAgregItem.GetBookmark;
        rAcumBase := 0;
        cdsAgregItem.First;
        While Not cdsAgregItem.EOF Do
           Begin
              rAcumBase := rAcumBase + cdsAgregItem.FieldByName('ACUMBASE').AsFloat;
              cdsAgregItem.Next;
           End;
        cdsAgregItem.GotoBookmark(bmMarca);
        cdsAgregItem.FreeBookmark(bmMarca);
        dbedBaseItem.Value := rBase + rAcumBase;
        cdsAgregItem.edit;
        cdsAgregItem.FieldByName('BASECALCULO').AsFloat := rBase + rAcumBase;
     end;
  cdsAgregItem.FieldByName('IDITENSRECDEV').AsFloat := cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat;
end;

procedure TFrmNotaFiscal.dbedBaseItemExit(Sender: TObject);
begin
  inherited;
  cdsAgregItem.FieldByName('IDITENSRECDEV').AsFloat := cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat;
  dbedValorAgrItem.Value :=  (dbedAliqItem.Value * dbedBaseItem.Value)/100;
end;

procedure TFrmNotaFiscal.dbgrAgregNotaExit(Sender: TObject);
begin
  inherited;
  If tbcDetalhe.TabIndex = 1 then
     Begin
        if cdsAgregNota.FieldByName('PERCVALOR').AsString = 'V' then
        Begin
           dbedAliqNota.Enabled:=False;
           dbedBaseNota.Enabled:=False;
           dbedValorAgrNota.SetFocus;
        end
        else
        Begin
           dbedAliqNota.Enabled:=True;
           dbedBaseNota.Enabled:=True;
           dbedAliqNota.SetFocus;
        end;
     end;
end;

procedure TFrmNotaFiscal.dbedAliqNotaExit(Sender: TObject);
begin
  inherited;
  dbedBaseNota.Value := dbeValorCorrente.Value;
end;

procedure TFrmNotaFiscal.dbedBaseNotaExit(Sender: TObject);
begin
  inherited;
  dbedValorAgrNota.Value := (dbedAliqNota.Value * dbedBaseNota.Value)/100;
end;

procedure TFrmNotaFiscal.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.Fields.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  dblcFornCli.SetFocus;
  //
  cds.FieldByName('DATAEMISNF').AsDateTime   := Date;
  cds.FieldByName('DATAENTDEVOL').AsDateTime := Date;
  //
  cds.FieldByName('IDNFRECEBDEVOL').AsFloat := GetTickCount;
  cds.FieldByName('FLGTIPONOTA').AsString   := 'E';
  SelItemNota(-1);
end;

procedure TFrmNotaFiscal.SelItemNota(idNota: Double);
begin
  cdsItemNota.Close;
  cdsItemNota.ParamByName('pNUMIDNF').asFloat := idNota;
  cdsItemNota.Open;
  //
  cdsAgregItem.Close;
  cdsAgregItem.ParamByName('IAGREGITEM').asFloat := idNota;
  cdsAgregItem.Open;
  //
  cdsAgregItemDef.Close;
  cdsAgregItemDef.ParamByName('IAGREGITEM').asFloat := idNota;
  cdsAgregItemDef.Open;
  //
  cdsAgregNota.Close;
  cdsAgregNota.ParamByName('IAGREGNOTA').asFloat := idNota;
  cdsAgregNota.Open;
end;

procedure TFrmNotaFiscal.SelNota(idNota: Double);
begin
  cds.Close;
  cds.ParamByName('pIDNF').asFloat := idNota;
  cds.Open;
  // Seleciona os Detalhes
  SelItemNota(idNota);
end;

procedure TFrmNotaFiscal.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        SelNota(StrToInt(MontaSelect.ValoresChave[0]));
     End;
end;

procedure TFrmNotaFiscal.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcFornCli.SetFocus;
end;

procedure TFrmNotaFiscal.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsItemNota.FieldByName('IDNFRECEBDEVOL').AsFloat    := cds.FieldByName('IDNFRECEBDEVOL').AsFloat;
  cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat     := NotaFiscal.GetNextID;
  cdsItemNota.FieldByName('FLGDESTINO').AsString       := 'E';
  cdsItemNota.FieldByName('CODALMOXARIFADO').AsInteger := Modulo.iCodAlmoxa;
  if Modulo.sIntegraLivro = 'S' then
     cdsItemNota.FieldByName('CODFISCAL').AsString  := sCodFisc
  else
     cdsItemNota.FieldByName('CODFISCAL').Clear;
  // Limpa o grid dos Impostos
  cdsAgregItem.Close;
  cdsAgregItem.ParamByName('IAGREGITEM').AsFloat := 0;
  cdsAgregItem.Open;
  //
  dbrgECA.ItemIndex             := 0;
  pgclDadosItem.ActivePageIndex := 0;
  dblkpcmbDesc.SetFocus;
  lblDestEdit.Caption      := 'Almoxarifado Destino';
  dblkpcmbAlmoxa.BringToFront;
  //
  cdsAgregItem.First;
  While Not cdsAgregItem.EOF Do
     Begin
        cdsAgregItem.Edit;
        cdsAgregItem.FieldByName('ACUMBASE').asFloat := 0;
        cdsAgregItem.Post;
        cdsAgregItem.Next;
     End;
  cdsAgregItem.First;
end;

procedure TFrmNotaFiscal.CmeDetalheConfirma(Sender: TObject);
begin
   if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (cdsItemNota.State in dsEditModes ) then
   Begin
      If Trim(dblkpcmbArtigo.Text) = '' Then
      Begin
         MsgDlg('Artigo não preenchido','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dblkpcmbArtigo.SetFocus;
         Exit;
      End;
      If(cdsArtigo.FieldByName('ITEMESTOCAVEL').AsString = 'S' ) And (dbrgECA.ItemIndex = 2) Then
      Begin
         MsgDlg('Artigo é estocável não pode ser destinado para custo','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dbrgECA.SetFocus;
         Exit;
      End;
      If Trim(dblcUnidMedida.Text) = '' Then
      Begin
         MsgDlg('Unidade não preenchida','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dblcUnidMedida.SetFocus;
         Exit;
      End;
      If (Trim(dblkpcmbAlmoxa.Text) = '') And (dbrgECA.ItemIndex =0) Then
      Begin
         MsgDlg('Almoxarifado Destino não preenchido','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dblkpcmbAlmoxa.SetFocus;
         Exit;
      End;
      If (dbrgECA.ItemIndex =0) Then
      Begin
         cdsItemNota.FieldByName('CODCENTROCUSTO').AsString := cdsAlmox.FieldByName('CODCENTROCUSTO').AsString;
      end;
     If (Trim(dblcCCusto.Text) = '') And (dbrgECA.ItemIndex =2) Then
      Begin
         MsgDlg('Centro de Custo Destino não preenchido','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dblcCCusto.SetFocus;
         Exit;
      End;
      If dbedQtdeEnt.Value = 0 Then
      Begin
         MsgDlg('Quantidade não preenchida','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dbedQtdeEnt.SetFocus;
         Exit;
      End;
      If ( Trim(dblkpcmbClasFisc.Text) = '' ) Or ( Length(Trim(dblkpcmbClasFisc.Text)) < 3 ) Then
      Begin
         MsgDlg('Classificação Fiscal não preenchida','Erro',mtError,[mbOk],0);
         pgclDadosItem.ActivePage:=tbsDadosGerais;
         dblkpcmbClasFisc.SetFocus;
         Exit;
      End;

      cdsItemNota.FieldByName('VALORTOTAL').asFloat  := cdsItemNota.FieldByName('VLRUNITARIO').asFloat * cdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat;
      cdsItemNota.FieldByName('VLRESTOQUE').asFloat  := cdsItemNota.FieldByName('VLRUNITARIO').asFloat * cdsItemNota.FieldByName('QTDERECEBDEVOL').asFloat;
      cdsItemNota.FieldByName('DESCPROD').AsString := dblkpcmbDesc.Text;
   End;
//---------------------------------------------------------------------------------------------------------------------------
// Grava os Impostos dos Itens
//---------------------------------------------------------------------------------------------------------------------------
  // Limpa os impostos já existentes para não haver duplicidade
  cdsAgregItemDef.First;
  While not cdsAgregItemDef.EOF do
  Begin
     if cdsAgregItemDef.FieldByName('IDITENSRECDEV').AsInteger = cdsItemNota.FieldByName('IDITENSRECDEV').AsInteger then
        cdsAgregItemDef.Delete
     else
        cdsAgregItemDef.Next;
  End;
  //
  cdsAgregItem.First;
  While not cdsAgregItem.EOF do
  Begin
     cdsAgregItemDef.Insert;
     cdsAgregItemDef.FieldByName('IDITENSRECDEV').AsInteger    := cdsItemNota.FieldByName('IDITENSRECDEV').AsInteger;
     cdsAgregItemDef.FieldByName('CODTIPOCUSTAGREG').AsInteger := cdsAgregItem.FieldByName('CODTIPOCUSTAGREG').AsInteger;
     cdsAgregItemDef.FieldByName('ALIQUOTA').AsFloat           := cdsAgregItem.FieldByName('ALIQUOTA').AsFloat;
     cdsAgregItemDef.FieldByName('BASECALCULO').AsFloat        := cdsAgregItem.FieldByName('BASECALCULO').AsFloat;
     cdsAgregItemDef.FieldByName('VLRAGREGADO').AsFloat        := cdsAgregItem.FieldByName('VLRAGREGADO').AsFloat;
     cdsAgregItemDef.FieldByName('CODTRATFISCE').AsString      := cdsAgregItem.FieldByName('CODTRATFISCE').AsString;
     cdsAgregItemDef.Post;
     cdsAgregItem.Next;
  end;
  inherited;
end;

procedure TFrmNotaFiscal.dbedValorAgrNotaExit(Sender: TObject);
begin
  inherited;
  cdsAgregNota.FieldByName('IDNFRECEBDEVOL').AsFloat := cds.FieldByName('IDNFRECEBDEVOL').AsFloat;
end;

procedure TFrmNotaFiscal.dblkpcmbClasFiscExit(Sender: TObject);
begin
  inherited;
  pgclDadosItem.ActivePageIndex := 1;
  dbgrAgregItem.SetFocus;
end;

procedure TFrmNotaFiscal.tbcDetalheChange(Sender: TObject);
begin
  inherited;
    if (tbcDetalhe.TabIndex = 1) and (pgctrlDetalhe.ActivePage = tbsImpostosNota) then
       dbgrAgregNota.SetFocus;
end;

procedure TFrmNotaFiscal.dbedValorAgrItemExit(Sender: TObject);
begin
  inherited;
  If dbedValorAgrItem.Value > 0 then
  Begin
     // Indica que o imposto vai ser gravado
     cdsAgregItem.FieldByName('IDITENSRECDEV').AsFloat := cdsItemNota.FieldByName('IDITENSRECDEV').AsFloat;
     // Verifica se o imposto incide sobre A BASE DE CALCULO
     If (qryAgregItem.FieldByName('FLGBASE').AsString = 'S') Then
        Begin
          If (cdsAgregItem.FieldByName('CODTRATFISCE').AsString = '6') Then
             cdsAgregItem.FieldByName('ACUMBASE').asFloat := dbedValorAgrItem.Value * -1
          Else
             cdsAgregItem.FieldByName('ACUMBASE').asFloat := dbedValorAgrItem.Value;
        End;
  End;
  If pgclDadosItem.ActivePage = tbsAgregItem then
     Begin
        If not cdsAgregItem.EOF then
           Begin
              cdsAgregItem.Next;
              if not cdsAgregItem.EOF then
                 dbgrAgregItem.SetFocus
              Else
                 bbtnOkDet.SetFocus;
           End
        Else
           bbtnOkDet.SetFocus;
     End;
end;

procedure TFrmNotaFiscal.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
   //
   cdsAgregItem.Close;
   cdsAgregItem.ParamByName('IAGREGITEM').AsFloat := 0;
   cdsAgregItem.Open;
   //
   cdsAgregItemDef.First;
   While not cdsAgregItemDef.EOF do
   Begin
      if cdsAgregItemDef.FieldByName('IDITENSRECDEV').AsInteger = cdsItemNota.FieldByName('IDITENSRECDEV').AsInteger then
      Begin
         cdsAgregItem.First;
         While not cdsAgregItem.EOF do
         Begin
            if cdsAgregItemDef.FieldByName('CODTIPOCUSTAGREG').AsInteger = cdsAgregItem.FieldByName('CODTIPOCUSTAGREG').AsInteger then
            Begin
               cdsAgregItem.Edit;
               cdsAgregItem.FieldByName('ALIQUOTA').AsFloat    := cdsAgregItemDef.FieldByName('ALIQUOTA').AsFloat;
               cdsAgregItem.FieldByName('BASECALCULO').AsFloat := cdsAgregItemDef.FieldByName('BASECALCULO').AsFloat;
               cdsAgregItem.FieldByName('VLRAGREGADO').AsFloat := cdsAgregItemDef.FieldByName('VLRAGREGADO').AsFloat;
               cdsAgregItem.Post;
            End;
            cdsAgregItem.Next;
         End;
      End;
      cdsAgregItemDef.Next;
   end;
end;

procedure TFrmNotaFiscal.CmeCadastroDelete(Sender: TObject);
begin
  If Not NotaFiscal.Excluir Then
     Begin
       showMessage(NotaFiscal.MessageInfo);
       Abort;
     End;
  inherited;
end;

procedure TFrmNotaFiscal.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := NotaFiscal.Excluir;
end;

procedure TFrmNotaFiscal.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := NotaFiscal.Gravar;
end;

procedure TFrmNotaFiscal.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := NotaFiscal.Gravar;
end;

procedure TFrmNotaFiscal.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( NotaFiscal.MessageInfo,'Erro',mtError,[mbOK],0);
end;

end.
