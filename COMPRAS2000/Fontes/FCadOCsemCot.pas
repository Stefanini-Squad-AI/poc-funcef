
unit FCadOCsemCot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  CMProcuraSubTipo, TREdit, wwdblook, CMDBLookupCombo, Mask, {DBCtrlt} fcLabel, uCMTypes, 
  DBCtrls, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList,
  DBGrids;
Type
   TPrazoEnt = Class(TObject)
   public
      QTDEENTREGA    : Double;
      PRAZOENTREGA   : Double;
      DATAENTREGA    : TDateTime;
      PARCELAENTREGA : Double;
   End;
   TPrazoPag = Class(TObject)
   public
      PERCPAGTO    : Double;
      PRAZOPGTO    : Double;
      DATAPAGTO    : TDateTime;
      PARCELAPGTO  : Double;
   End;

type
  TFrmCadOCsemCot = class(TfrmCadMestreDetalheCS)
    TabPrazoEnt: TTabSheet;
    TabPrazoPag: TTabSheet;
    TabValAgreg: TTabSheet;
    cmpForn: TCMProcuraForCli;
    edDataOC: TCMDateTimePicker;
    Label2: TLabel;
    edNumOC: TDBEdit;
    Label5: TLabel;
    Label22: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    plnPrazoPag: TPanel;
    plnOpBar: TPanel;
    GrdPrazoPag: TwwDBGrid;
    BtnAddPag: TBitBtn;
    btnDelPag: TBitBtn;
    BtnLimpaPag: TBitBtn;
    plnArt: TPanel;
    LbArt: TfcLabel;
    plnPrazoEnt: TPanel;
    plnOpEnt: TPanel;
    btnAddPrazoEnt: TBitBtn;
    BtnDelPrazoEnt: TBitBtn;
    BtnLimpaEnt: TBitBtn;
    GrdPrazoEnt: TwwDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qryArtigo: TwwQuery;
    Label7: TLabel;
    dblcItem: TwwDBLookupCombo;
    Label6: TLabel;
    dblcDesc: TwwDBLookupCombo;
    Label8: TLabel;
    dblcUN: TwwDBLookupCombo;
    edQtdePed: TDBRealEdit;
    Label4: TLabel;
    edPreco: TDBRealEdit;
    Label9: TLabel;
    TabOBS: TTabSheet;
    memObsOC: TDBMemo;
    memObsItem: TDBMemo;
    Label10: TLabel;
    qryArtigoNUMSOLCOMPRA: TFloatField;
    qryArtigoIDITEMSOLI: TFloatField;
    qryArtigoCODARTIGO: TStringField;
    qryArtigoCODMEDIDA: TStringField;
    qryArtigoQTDEPEDIDA: TFloatField;
    qryArtigoCODMEDCUSTO: TStringField;
    qryArtigoDESCRICAO: TStringField;
    qryArtigoIDPRODVARI: TFloatField;
    edQtdeEnt: TRealEdit;
    edPrazoEnt: TRealEdit;
    edDataEnt: TCMDateTimePicker;
    edPercPag: TRealEdit;
    edPrazoPag: TRealEdit;
    edDataPag: TCMDateTimePicker;
    qryArtigoOBSITEMSOLIC: TStringField;
    qryArtigoCODPRODUTO: TStringField;
    plnAgreg: TPanel;
    PlnOPAgreg: TPanel;
    btnAddAgreg: TBitBtn;
    btnDelAgreg: TBitBtn;
    btnLimpaAgreg: TBitBtn;
    wwDBGrid1: TwwDBGrid;
    dblcAgreg: TCMDBLookupCombo;
    Label1: TLabel;
    edBase: TRealEdit;
    Label11: TLabel;
    LbValPerc: TLabel;
    edAliquota: TRealEdit;
    Label12: TLabel;
    edValor: TRealEdit;
    qryAgreg: TwwQuery;
    qryAgregCODTIPOCUSTAGREG: TFloatField;
    qryAgregDESCCUSTAGREG: TStringField;
    qryAgregPERCVALOR: TStringField;
    qryNUMOC: TFloatField;
    qryIDFORCLI: TFloatField;
    qryIDPESSOA: TFloatField;
    qryOCATENDIDA: TStringField;
    qryFLGIMPRESSA: TStringField;
    qryFLGCOMSEMOC: TStringField;
    qryOBSOC: TStringField;
    qryDATAOC: TDateTimeField;
    qryIDPROCESSO: TFloatField;
    qryItemOC: TwwQuery;
    qryItemOCCODARTIGO: TStringField;
    qryItemOCDESCRICAO: TStringField;
    qryItemOCQTDEPEDIDA: TFloatField;
    qryItemOCCODMEDIDA: TStringField;
    qryItemOCVALORUN: TFloatField;
    qryItemOCIDITEMOC: TFloatField;
    qryItemOCNUMOC: TFloatField;
    qryItemOCQTDERECEBIDA: TFloatField;
    qryItemOCFLGITEMATENDIDO: TStringField;
    qryItemOCOBSITEMOC: TStringField;
    qryItemOCIDPRODVARI: TFloatField;
    qryItemOCCODPRODUTO: TStringField;
    qryPrazoEntOC: TwwQuery;
    qryPrazoEntOCQTDEENTREGA: TFloatField;
    qryPrazoEntOCPRAZOENTREGA: TFloatField;
    qryPrazoEntOCDATAENTREGA: TDateTimeField;
    qryPrazoEntOCIDITEMOC: TFloatField;
    qryPrazoEntOCPARCELAENTREGA: TFloatField;
    qryPrazoEntOCPERIODOPRAZO: TStringField;
    dsPrazoEntOC: TwwDataSource;
    updPrazoEntOC: TUpdateSQL;
    qryPrazoPagOC: TwwQuery;
    qryPrazoPagOCPERCPAGTO: TFloatField;
    qryPrazoPagOCPRAZOPGTO: TFloatField;
    qryPrazoPagOCDATAPAGTO: TDateTimeField;
    qryPrazoPagOCIDITEMOC: TFloatField;
    qryPrazoPagOCPARCELAPGTO: TFloatField;
    qryPrazoPagOCPERIODOPRAZO: TStringField;
    dsPrazoPagOC: TwwDataSource;
    updPrazoPagOC: TUpdateSQL;
    qryAgregItemOC: TwwQuery;
    qryAgregItemOCDESCCUSTAGREG: TStringField;
    qryAgregItemOCALIQUOTA: TFloatField;
    qryAgregItemOCBASECALCULO: TFloatField;
    qryAgregItemOCVLRAGREGITEM: TFloatField;
    qryAgregItemOCIDITEMOC: TFloatField;
    qryAgregItemOCIDAGREGITEMOC: TFloatField;
    qryAgregItemOCCODTIPOCUSTAGREG: TFloatField;
    dsAgregItemOC: TwwDataSource;
    updAgregItemOC: TUpdateSQL;
    updItemOC: TUpdateSQL;
    updSCItemOC: TUpdateSQL;
    qrySCItemOC: TwwQuery;
    qrySCItemOCIDITEMOC: TFloatField;
    qrySCItemOCNUMSOLCOMPRA: TFloatField;
    qrySCItemOCIDITEMSOLI: TFloatField;
    dsSCItemOC: TwwDataSource;
    qryFLGCOMSEMCOT: TStringField;
    qryVALOROC: TFloatField;
    qryItemOCIDITEMSOLI: TFloatField;
    qryItemOCCODGRUPOPROD: TStringField;
    qryArtigoCODGRUPOPROD: TStringField;
    qryFLGTIPOFRETE: TFloatField;
    RgFrete: TDBRadioGroup;
    qryArtigoCHAVE: TStringField;
    qryCONTATO: TStringField;
    Label13: TLabel;
    edContato: TDBEdit;
    ToolbarButton971: TToolbarButton97;
    btnCopiaPrazo: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure btnAddPrazoEntClick(Sender: TObject);
    procedure BtnDelPrazoEntClick(Sender: TObject);
    procedure BtnLimpaEntClick(Sender: TObject);
    procedure BtnAddPagClick(Sender: TObject);
    procedure btnDelPagClick(Sender: TObject);
    procedure BtnLimpaPagClick(Sender: TObject);
    procedure edPrazoEntExit(Sender: TObject);
    procedure edPrazoPagExit(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryArtigoAfterScroll(DataSet: TDataSet);
    procedure btnAddAgregClick(Sender: TObject);
    procedure btnDelAgregClick(Sender: TObject);
    procedure btnLimpaAgregClick(Sender: TObject);
    procedure dblcAgregCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edAliquotaExit(Sender: TObject);
    procedure edBaseExit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure cmpFornExit(Sender: TObject);
    procedure btnCopiaPrazoClick(Sender: TObject);
  private
    { Private declarations }
    rQtdeAtend    : Double;
    rPercPag      : Double;
    //
    Procedure Sel( iNumOC : LongInt );
    Procedure SelFilhos( iIdItemOC : LongInt );
    Procedure CalcQtdeAtend;
    Procedure CalcPercPag;
    Function  VerifItens : Boolean;
    Function  LancCap : LongInt;
    Procedure CopiaPrazos;
    Function VerificaPrazos(Var s : String) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadOCsemCot: TFrmCadOCsemCot;
  iIdTipoProcesso : LongInt;

implementation

{$R *.DFM}

Uses  uSistema, uDatabase, uMensErro, uString, uRAD, dBaseDados,
      DCompras, uFuncaoGeral, uDocumento, uModulo, uIntegraBack,
      FAguarde;

Procedure TFrmCadOCsemCot.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
    inherited;
    plnOpEnt.Enabled      := (sbtnInserir.Down) Or (sbtnAlterar.Down);
    plnOpBar.Enabled      := (sbtnInserir.Down) Or (sbtnAlterar.Down);
    PlnOPAgreg.Enabled    := (sbtnInserir.Down) Or (sbtnAlterar.Down);
    btnCopiaPrazo.Enabled := (sbtnInserir.Down) Or (sbtnAlterar.Down);
End;

procedure TFrmCadOCsemCot.FormCreate(Sender: TObject);
begin
  inherited;
  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
     Begin
         Rad := TRad.Create;
         If Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 5)') Then
            Begin
                iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
            End;
     End;
  qry.Close;
  If Not qry.Prepared Then qry.Prepare;
  qryItemOC.Close;
  If Not qryItemOC.Prepared Then qryItemOC.Prepare;
  qryPrazoEntOC.Close;
  If Not qryPrazoEntOC.Prepared Then qryPrazoEntOC.Prepare;
  qryPrazoPagOC.Close;
  If Not qryPrazoPagOC.Prepared Then qryPrazoPagOC.Prepare;
  qryAgregItemOC.Close;
  If Not qryAgregItemOC.Prepared Then qryAgregItemOC.Prepare;
  qrySCItemOC.Close;
  If Not qrySCItemOC.Prepared Then qrySCItemOC.Prepare;
  //
  LbArt.Caption := '';
  Sel(-1);
  qryArtigo.Close;
  If Not qryArtigo.Prepared Then  qryArtigo.Prepare;
  qryArtigo.ParamByName('pIDPESSOA').AsInteger    := Sistema.IdEmpresa;
  qryArtigo.ParamByName('pIDCOMPRADOR').AsInteger := Sistema.IdUsuario;
  qryArtigo.Open;
  qryUnidMed.Close;
  If Not qryUnidMed.Prepared Then qryUnidMed.Prepare;
  //
  Documento := TDocumento.Create;

end;

procedure TFrmCadOCsemCot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
  Documento.Free;
  //
  qryArtigo.Close;
  If QryArtigo.Prepared Then  qryArtigo.UnPrepare;
  qryUnidMed.Close;
  If qryUnidMed.Prepared Then qryUnidMed.UnPrepare;
  qry.Close;
  If qry.Prepared Then qry.UnPrepare;
  qryItemOC.Close;
  If qryItemOC.Prepared Then qryItemOC.UnPrepare;
  qryPrazoEntOC.Close;
  If qryPrazoEntOC.Prepared Then qryPrazoEntOC.UnPrepare;
  qryPrazoPagOC.Close;
  If qryPrazoPagOC.Prepared Then qryPrazoPagOC.UnPrepare;
  qryAgregItemOC.Close;
  If qryAgregItemOC.Prepared Then qryAgregItemOC.UnPrepare;
  qrySCItemOC.Close;
  If qrySCItemOC.Prepared Then qrySCItemOC.UnPrepare;
end;

Procedure TFrmCadOCsemCot.Sel( iNumOC : LongInt );
Begin
  qry.Close;
  qry.ParamByName('pNUMOC').AsInteger := iNumOC;
  qry.Open;
  //
  qryItemOC.Close;
  qryItemOC.ParamByName('pNUMOC').AsInteger := iNumOC;
  qryItemOC.Open;
  //
  qryPrazoEntOC.Close;
  qryPrazoEntOC.ParamByName('pNUMOC').AsInteger := iNumOC;
  qryPrazoEntOC.Open;
  //
  qryPrazoPagOC.Close;
  qryPrazoPagOC.ParamByName('pNUMOC').AsInteger := iNumOC;
  qryPrazoPagOC.Open;
  //
  qryAgregItemOC.Close;
  qryAgregItemOC.ParamByName('pNUMOC').AsInteger := iNumOC;
  qryAgregItemOC.Open;
  //
  qrySCItemOC.Close;
  qrySCItemOC.ParamByName('pNUMOC').AsInteger := iNumOC;
  qrySCItemOC.Open;
  //
  qryItemOC.First;
End;

Procedure TFrmCadOCsemCot.SelFilhos( iIdItemOC : LongInt );
Begin
    rQtdeAtend := 0;
    rPercPag   := 0;
    If iIdItemOC >= 1 Then
       Begin
           qryPrazoEntOC.Filtered  := False;
           qryPrazoEntOC.Filter    := 'IDITEMOC = '+ IntToStr(iIdItemOC);
           qryPrazoEntOC.Filtered  := True;
           //
           qryPrazoPagOC.Filtered  := False;
           qryPrazoPagOC.Filter    := 'IDITEMOC = '+ IntToStr(iIdItemOC);
           qryPrazoPagOC.Filtered  := True;
           //
           qryAgregItemOC.Filtered := False;
           qryAgregItemOC.Filter   := 'IDITEMOC = '+ IntToStr(iIdItemOC);
           qryAgregItemOC.Filtered := True;
           //
           qrySCItemOC.Filtered    := False;
           qrySCItemOC.Filter      := 'IDITEMOC = '+ IntToStr(iIdItemOC);
           qrySCItemOC.Filtered    := True;
           //
       End
    Else
       Begin
           qryPrazoEntOC.Filtered  := False;
           qryPrazoEntOC.Filter    := '';
           //
           qryPrazoPagOC.Filtered  := False;
           qryPrazoPagOC.Filter    := '';
           //
           qryAgregItemOC.Filtered := False;
           qryAgregItemOC.Filter   := '';
           //
           qrySCItemOC.Filtered    := False;
           qrySCItemOC.Filter      := '';
       End;
    If Not qryItemOC.IsEmpty Then
       LbArt.Caption := qryItemOCDESCRICAO.AsString
    Else
       LbArt.Caption := '';
End;


Procedure TFrmCadOCsemCot.CmeCadastroInsert(Sender: TObject);
Begin
    Sel(-1); 
    inherited;
    cmpForn.SetFocus;
    qryDATAOC.AsDateTime      := Date;
    qryFLGTIPOFRETE.AsInteger := 0;
End;

Procedure TFrmCadOCsemCot.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    cmpForn.SetFocus;
End;

Procedure TFrmCadOCsemCot.CmeCadastroFind(Sender: TObject);
Begin
   inherited;
   if MontaSelect.RetornouValor Then
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
End;

Procedure TFrmCadOCsemCot.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Var
   sArt : String;
Begin
   Accept := True;
   If cmpForn.Valida <> vcOK Then
     Begin
         cmpForn.SetFocus;
         Accept := False;
     End
   Else
   If Trim(edDataOC.Text) = '' Then
     Begin
         MsgDlg('Data da O.C.','Erro',mtError,[mbOk],0);
         edDataOC.SetFocus;
         Accept := False;
     End
   Else
   If Not VerifItens Then
      Begin
          Accept := False;
      End;
   If Not VerificaPrazos(sArt) Then
      Begin
          MsgDlg('O item '+sArt+' não possui os prazos preenchidos .','Erro',mtError,[mbOk],0);
          Accept := False;
      End;
End;

procedure TFrmCadOCsemCot.dsDetDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  If dsDet.DataSet.State = dsBrowse Then
    Begin
        SelFilhos( qryItemOCIDITEMOC.AsInteger );
    End;
end;

Procedure TFrmCadOCsemCot.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
   dblcItem.Enabled := True;
   dblcDesc.Enabled := True;
   dblcItem.SetFocus;
   qryItemOCIDITEMOC.AsInteger       := LeUltRegistro(nil,'ITEMOC');
   qryItemOCFLGITEMATENDIDO.AsString := 'F';

End;

Procedure TFrmCadOCsemCot.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   dblcItem.Text    := qryItemOCCODARTIGO.AsString;
   dblcDesc.Text    := qryItemOCDESCRICAO.AsString;
   dblcItem.Enabled := False;
   dblcDesc.Enabled := False;
   //
   edQtdePed.SetFocus;
End;

Procedure TFrmCadOCsemCot.CmeDetalheDelete(Sender: TObject);
Begin
  If MsgDlg('Confirma a exclusão do Item da O.C.','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
     Begin
         qryPrazoEntOC.First;
         While Not qryPrazoEntOC.EOF  Do qryPrazoEntOC.Delete;
         qryPrazoPagOC.First;
         While Not qryPrazoPagOC.EOF  Do qryPrazoPagOC.Delete;
         qryPrazoEntOC.First;
         While Not qryAgregItemOC.EOF Do qryAgregItemOC.Delete;
         qrySCItemOC.First;
         While Not qrySCItemOC.EOF    Do qrySCItemOC.Delete;
         inherited;
     End;
end;

Procedure TFrmCadOCsemCot.CmeDetalheConfirma(Sender: TObject);
Begin
    If Trim(dblcItem.text) = '' Then
        Begin
            MsgDlg('Item não foi preenchido','Erro',mtError,[mbOK],0);
            dblcItem.SetFocus;
        End
     Else
     If (edQtdePed.Value <= 0) Then
        Begin
            MsgDlg('Quantidade pedida não foi preenchida','Erro',mtError,[mbOK],0);
            edQtdePed.SetFocus;
        End
     Else
     If edPreco.value <= 0  Then
        Begin
            MsgDlg('Preço não foi preenchido','Erro',mtError,[mbOK],0);
            edPrazoEnt.SetFocus;
        End
     Else
       Begin
          qryItemOCDESCRICAO.AsString       := dblcDesc.Text;
          qryItemOCCODGRUPOPROD.AsString    := qryArtigoCODGRUPOPROD.AsString;
          dblcDesc.Clear;
          dblcItem.Clear;
          //
          If qryItemOC.State = dsInsert Then
             Begin
                qryItemOCFLGITEMATENDIDO.AsString := 'F';
                //
                qrySCItemOC.Append;
                qrySCItemOCIDITEMOC.AsInteger     := qryItemOCIDITEMOC.AsInteger;
                qrySCItemOCNUMSOLCOMPRA.AsInteger := qryArtigoNUMSOLCOMPRA.AsInteger;
                qrySCItemOCIDITEMSOLI.AsInteger   := qryArtigoIDITEMSOLI.AsInteger;
                qrySCItemOC.Post;
             End;
       {   Else
            Begin
               // Posiciona a query no devido lugar do item selecionado
               // Pois estava dando erro quando alterava na hora de grava a tabela SCITEMOC
               //
               Try
                  qryArtigo.Filtered := False;
                  qryArtigo.Filter   := ' CHAVE =' + QuotedStr(Trim(dblcItem.LookupValue));
                  qryArtigo.Filtered := True;
                  //
                  qrySCItemOC.Edit;
                  qrySCItemOCIDITEMOC.AsInteger     := qryItemOCIDITEMOC.AsInteger;
                  qrySCItemOCNUMSOLCOMPRA.AsInteger := qryArtigoNUMSOLCOMPRA.AsInteger;
                  qrySCItemOCIDITEMSOLI.AsInteger   := qryArtigoIDITEMSOLI.AsInteger;
                  qrySCItemOC.Post;
               Finally
                  qryArtigo.Filter   := '';
                  qryArtigo.Filtered := False;
               End;
            End;     }
          Inherited;
       End;
End;

procedure TFrmCadOCsemCot.btnAddPrazoEntClick(Sender: TObject);
begin
  inherited;
  CalcQtdeAtend;
  If dsDet.DataSet.IsEmpty Then
     Begin
        MsgDlg('Não existe item cadastrado.','Erro',mtError,[mbOk],0);
     End
  Else
  If edPrazoEnt.Value < 0 Then
     Begin
        MsgDlg('Prazo de Entrega inválido.','Erro',mtError,[mbOk],0);
        edPrazoEnt.SetFocus;
     End
  Else
  If Trim(edDataEnt.Text) = '' then
     Begin
        MsgDlg('Data de Entrega inválida.','Erro',mtError,[mbOk],0);
        edPrazoEnt.SetFocus;
     End
  Else
  If Format('%12.2f',[qryItemOCQTDEPEDIDA.AsFloat]) > Format('%12.2f',[rQtdeAtend]) Then
     Begin
        qryPrazoEntOC.Append;
        qryPrazoEntOCIDITEMOC.AsInteger     := qryItemOCIDITEMOC.AsInteger;
        qryPrazoEntOCPRAZOENTREGA.AsFloat   := edPrazoEnt.Value;
        qryPrazoEntOCQTDEENTREGA.AsFloat    := edQtdeEnt.Value;
        qryPrazoEntOCPERIODOPRAZO.AsString  := 'D';
        qryPrazoEntOCDATAENTREGA.AsDateTime := edDataEnt.Date;
        qryPrazoEntOC.Post;
        BtnLimpaEnt.Click;
     End
   Else
     Begin
        MsgDlg('Quantidade fornecida já está completa','Informação',mtInformation,[mbOk],0);
        BtnLimpaEnt.Click;
     End;
end;

procedure TFrmCadOCsemCot.BtnDelPrazoEntClick(Sender: TObject);
begin
  inherited;
  If Not qryPrazoEntOC.IsEmpty Then
     Begin
        edPrazoEnt.Value := qryPrazoEntOCPRAZOENTREGA.AsFloat;
        edQtdeEnt.Value  := qryPrazoEntOCQTDEENTREGA.AsFloat;
        edDataEnt.Date   := qryPrazoEntOCDATAENTREGA.AsDateTime;
        qryPrazoEntOC.Delete;
     End;
end;

procedure TFrmCadOCsemCot.BtnLimpaEntClick(Sender: TObject);
begin
  inherited;
  CalcQtdeAtend;
  edQtdeEnt.Clear;
  edPrazoEnt.Value := 0;;
  edDataEnt.Clear;
  edQtdeEnt.Value := qryItemOCQTDEPEDIDA.AsFloat - rQtdeAtend;
  edQtdeEnt.SetFocus;
end;

procedure TFrmCadOCsemCot.BtnAddPagClick(Sender: TObject);
Var
  rCem : Double;
begin
  inherited;
  rCem := 100;
  CalcPercPag;
  If dsDet.DataSet.IsEmpty Then
     Begin
        MsgDlg('Não existe item cadastrado.','Erro',mtError,[mbOk],0);
     End
  Else  
  If edPrazoPag.Value < 0 Then
     Begin
        MsgDlg('Prazo de Entrega inválida.','Erro',mtError,[mbOk],0);
        edPrazoPag.SetFocus;
     End
  Else
  If Trim(edDataPag.Text) = '' then
     Begin
        MsgDlg('Data de Pagamento inválida.','Erro',mtError,[mbOk],0);
        edPrazoPag.SetFocus;
     End
  Else
  If Format('%12.2f',[rCem]) > Format('%12.2f',[rPercPag]) Then
     Begin
        qryPrazoPagOC.Append;
        qryPrazoPagOCIDITEMOC.AsInteger    := qryItemOCIDITEMOC.AsInteger;
        qryPrazoPagOCPRAZOPGTO.AsFloat     := edPrazoPag.Value;
        qryPrazoPagOCPERIODOPRAZO.AsString := 'D';
        qryPrazoPagOCPERCPAGTO.AsFloat     := edPercPag.Value;
        qryPrazoPagOCDATAPAGTO.AsDateTime  := edDataPag.Date;
        qryPrazoPagOC.Post;
        BtnLimpaPag.Click;
     End
   Else
     Begin
        MsgDlg('Percentual igual a 100%','Informação',mtInformation,[mbOk],0);
        BtnLimpaPag.Click;        
     End;
end;

procedure TFrmCadOCsemCot.btnDelPagClick(Sender: TObject);
begin
  inherited;
  If Not qryPrazoPagOC.IsEmpty Then
     Begin
        edPercPag.Value  := qryPrazoPagOCPERCPAGTO.AsFloat;
        edPrazoPag.Value := qryPrazoPagOCPRAZOPGTO.AsFloat;
        edDataPag.Date   := qryPrazoPagOCDATAPAGTO.AsDateTime;
        qryPrazoPagOC.Delete;
     End;
end;

procedure TFrmCadOCsemCot.BtnLimpaPagClick(Sender: TObject);
begin
  inherited;
  CalcPercPag;
  edPercPag.Clear;
  edPrazoPag.Value := 0;
  edDataPag.Clear;
  edPercPag.Value := 100 - rPercPag;
  edPercPag.SetFocus;
end;

procedure TFrmCadOCsemCot.edPrazoEntExit(Sender: TObject);
begin
  inherited;
  edDataEnt.Date := edPrazoEnt.Value + Date;
end;

procedure TFrmCadOCsemCot.edPrazoPagExit(Sender: TObject);
begin
  inherited;
  edDataPag.Date := edPrazoPag.Value + Date;
end;

procedure TFrmCadOCsemCot.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcItem.Text) <> '') Then
     Begin
         qryItemOCCODARTIGO.AsString := qryArtigoCODARTIGO.AsString;
         dblcDesc.LookupValue        := dblcItem.LookupValue;
         qryItemOCQTDEPEDIDA.AsFloat := qryArtigoQTDEPEDIDA.AsFloat;
         edQtdePed.Value             := qryArtigoQTDEPEDIDA.AsFloat;
         qryItemOCCODMEDIDA.AsString := qryArtigoCODMEDIDA.AsString;
         qryItemOCOBSITEMOC.AsString := qryArtigoOBSITEMSOLIC.AsString;
         If (qryArtigoIDPRODVARI.IsNull) Or (qryArtigoIDPRODVARI.AsInteger <= 0) Then
             qryItemOCIDPRODVARI.Clear
         Else
             qryItemOCIDPRODVARI.AsInteger := qryArtigoIDPRODVARI.AsInteger;

         qryItemOCIDITEMSOLI.AsInteger     := qryArtigoIDITEMSOLI.AsInteger;
     End;
end;

procedure TFrmCadOCsemCot.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin

  inherited;
  If (modified) And (Trim(dblcDesc.Text) <> '') Then
     Begin
         qryItemOCCODARTIGO.AsString := qryArtigoCODARTIGO.AsString;
         dblcItem.LookupValue        := dblcDesc.LookupValue;
         qryItemOCQTDEPEDIDA.AsFloat := qryArtigoQTDEPEDIDA.AsFloat;
         edQtdePed.Value             := qryArtigoQTDEPEDIDA.AsFloat;
         qryItemOCCODMEDIDA.AsString := qryArtigoCODMEDIDA.AsString;
         qryItemOCOBSITEMOC.AsString := qryArtigoOBSITEMSOLIC.AsString;
         If (qryArtigoIDPRODVARI.IsNull) Or (qryArtigoIDPRODVARI.AsInteger <= 0) Then
            qryItemOCIDPRODVARI.Clear
         Else
            qryItemOCIDPRODVARI.AsInteger := qryArtigoIDPRODVARI.AsInteger;

         qryItemOCIDITEMSOLI.AsInteger     := qryArtigoIDITEMSOLI.AsInteger;
    End;
end;

Procedure TFrmCadOCsemCot.CmeCadastroConfirma(Sender: TObject);
Var
  x : Integer;
Begin
    If qry.State in [dsInsert,dsEdit] Then
       Begin
         qryIDPESSOA.AsInteger := Sistema.IdEmpresa;
         If qry.State = dsInsert Then
            Begin
                qryNUMOC.AsInteger      := LeUltRegistro(nil,'OC');
                qryOCATENDIDA.AsString  := 'F';
                qryFLGIMPRESSA.AsString := 'F';
                qryFLGCOMSEMOC.AsString := 'C';
                qryFLGCOMSEMCOT.AsString:= 'S';
            End;
         qryItemOC.First;
         While Not qryItemOC.EOF Do
            Begin
                qryItemOC.Edit;
                qryItemOCNUMOC.AsFloat := qryNUMOC.AsFloat;
                qryItemOC.Post;
                qryItemOC.Next;
            End;
         qryItemOC.DisableControls;
         qryItemOC.First;
         While Not qryItemOC.EOF Do
            Begin
               SelFilhos( qryItemOCIDITEMOC.AsInteger );
               x := 0;
               qryPrazoEntOC.First;
               While Not qryPrazoEntOC.EOF Do
                  Begin
                     Inc( x );
                     qryPrazoEntOC.Edit;
                     qryPrazoEntOCPARCELAENTREGA.AsInteger := x;
                     qryPrazoEntOC.Post;
                     qryPrazoEntOC.Next;
                  End;
               x := 0;
               qryPrazoPagOC.First;
               While Not qryPrazoPagOC.EOF Do
                  Begin
                     Inc( x );
                     qryPrazoPagOC.Edit;
                     qryPrazoPagOCPARCELAPGTO.AsInteger  := x;
                     qryPrazoPagOC.Post;
                     qryPrazoPagOC.Next;
                  End;
               qryItemOC.Next;
            End;
         qryItemOC.EnableControls;
        // Remove o Filter das query's do item para gravar tudo
         SelFilhos( -1 );
         Try
            StartTransacao;
            If sbtnInserir.Down And ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) Then
               Begin
                  Rad.TipoProcesso    := iIdTipoProcesso;
                  Rad.IdPessoa        := Sistema.IdEmpresa;
                  Rad.Valor           := qryVALOROC.AsFloat;
                  Rad.OBS             := 'O.C. Número : '+IntToStr(qryNUMOC.AsInteger);
                  //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
                  //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
                  //Rad.CodGrupoProd    := sGrupoProd;
                  qry.Edit;
                  qryIDPROCESSO.AsInteger := Rad.IniciarProcesso;
                  qry.Post;
                  //
                  if qryIDPROCESSO.AsInteger < 0 Then
                     Begin
                        MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
                        Abort;
                     End;
               End;
            qry.ApplyUpdates;
            qryItemOC.ApplyUpdates;
            qryPrazoEntOC.ApplyUpdates;
            qryPrazoPagOC.ApplyUpdates;
            qryAgregItemOC.ApplyUpdates;
            qrySCItemOC.ApplyUpdates;
            //Atualiza A Quantidade Pendente da Tabela ItemSoli
            qryItemOC.First;
            While Not qryItemOC.EOF Do
               Begin
                   If Not ExecutarQuery(DtmBaseDados.qry,' UPDATE ITEMSOLI SET QTDEPENDENTE = QTDEPENDENTE - '+FuncaoGeral.OraNumero(qryItemOCQTDEPEDIDA.AsFloat)+' '+
                                                         ' WHERE ( IDITEMSOLI ='+IntToStr(qryItemOCIDITEMSOLI.AsInteger)+' ) ')
                   Then
                     Abort;
                   qryItemOC.Next;
               End;
            If sbtnInserir.Down Then
               LancCap
            Else
               Begin
                  DtmCompras.DeletaPrevCap(qryNUMOC.AsInteger);
                  LancCap;
               End;
           //Grava o Ultimo Contato
            If Not Modulo.GravaUltContato(cmpForn.ForCliReg.Id, Sistema.IdEmpresa, edContato.Text) Then
               Abort;

            CommitTransacao;
            If sbtnInserir.Down Then
               MsgDlg('Foi gerada a O.C. Nº '+IntToStr(qryNUMOC.AsInteger) ,'Informação',mtInformation,[mbOk],0);
         Except
             RollBackTransacao;
             MsgDlg('Erro ao tentar gerar O.C.','Erro',mtError,[mbOk],0);
         End;
      End;
End;

procedure TFrmCadOCsemCot.qryArtigoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryUnidMed.Close;
  qryUnidMed.ParamByName('CODPRODUTO').AsString := Espaco(Trim(qryArtigoCODPRODUTO.AsString),6);
  qryUnidMed.Open;
end;

Procedure TFrmCadOCsemCot.CalcQtdeAtend;
Begin
   rQtdeAtend := 0;
   qryPrazoEntOC.EnableControls;
   qryPrazoEntOC.First;
   While Not qryPrazoEntOC.EOF Do
      Begin
         rQtdeAtend := rQtdeAtend + qryPrazoEntOCQTDEENTREGA.AsFloat;
         qryPrazoEntOC.Next;
      End;
End;

Procedure TFrmCadOCsemCot.CalcPercPag;
Begin
   rPercPag := 0;
   qryPrazoPagOC.DisableControls;
   qryPrazoPagOC.First;
   While Not qryPrazoPagOC.EOF Do
      Begin
          rPercPag := rPercPag + qryPrazoPagOCPERCPAGTO.AsFloat;
          qryPrazoPagOC.Next;
      End;
   qryPrazoPagOC.EnableControls;
End;

procedure TFrmCadOCsemCot.btnAddAgregClick(Sender: TObject);
begin
  inherited;
  If dsDet.DataSet.IsEmpty Then
     Begin
        MsgDlg('Não existe item cadastrado.','Erro',mtError,[mbOk],0);
     End
  Else
  If Trim(dblcAgreg.Text) = '' Then
     Begin
        MsgDlg('Custo Agregado não prenchido.','Erro',mtError,[mbOk],0);
        dblcAgreg.SetFocus;
     End
  Else   
  If edBase.Value < 0 Then
     Begin
        MsgDlg('Base de Cálculo inválida.','Erro',mtError,[mbOk],0);
        edBase.SetFocus;
     End
  Else
  If edValor.Value < 0 Then
     Begin
        MsgDlg('Valor inválida.','Erro',mtError,[mbOk],0);
        edValor.SetFocus;
     End
  Else
     Begin
        qryAgregItemOC.Append;
        qryAgregItemOCIDAGREGITEMOC.AsInteger    := LeUltRegistro(nil,'AGREGITEMOC');
        qryAgregItemOCIDITEMOC.AsInteger         := qryItemOCIDITEMOC.AsInteger;
        qryAgregItemOCCODTIPOCUSTAGREG.AsInteger := qryAgregCODTIPOCUSTAGREG.AsInteger;
        qryAgregItemOCDESCCUSTAGREG.AsString     := dblcAgreg.Text;
        If edAliquota.Value > 0 Then
           qryAgregItemOCALIQUOTA.AsFloat        := edAliquota.Value;

        qryAgregItemOCBASECALCULO.AsFloat        := edBase.Value;
        qryAgregItemOCVLRAGREGITEM.AsFloat       := edValor.Value;
        qryAgregItemOC.Post;
        btnLimpaAgreg.Click;
     End;
end;

procedure TFrmCadOCsemCot.btnDelAgregClick(Sender: TObject);
begin
  inherited;
  If Not qryAgregItemOC.IsEmpty Then
     Begin
        dblcAgreg.LookupValue := IntToStr( qryAgregItemOCCODTIPOCUSTAGREG.AsInteger );
        edAliquota.Value      := qryAgregItemOCALIQUOTA.AsFloat;
        edBase.Value          := qryAgregItemOCBASECALCULO.AsFloat;
        edValor.Value         := qryAgregItemOCVLRAGREGITEM.AsFloat;
        qryAgregItemOC.Delete;
     End;
end;

procedure TFrmCadOCsemCot.btnLimpaAgregClick(Sender: TObject);
begin
  inherited;
  dblcAgreg.Clear;
  edAliquota.Value := 0;;
  edBase.Value     := qryItemOCQTDEPEDIDA.AsFloat * qryItemOCVALORUN.AsFloat;
  edValor.Value    := 0;;
  dblcAgreg.SetFocus;
end;

procedure TFrmCadOCsemCot.dblcAgregCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (modified) And (Trim(dblcAgreg.Text) <> '') Then
     Begin
         If qryAgregPERCVALOR.AsString = 'V' Then
            edAliquota.Enabled := False
         Else
            edAliquota.Enabled := True;
         edBase.Enabled  := edAliquota.Enabled;
     End;
end;

procedure TFrmCadOCsemCot.edAliquotaExit(Sender: TObject);
begin
  inherited;
  edValor.Value := (edAliquota.Value * edBase.Value) /100;
end;
Function TFrmCadOCsemCot.VerifItens : Boolean;
Var
   bOk : Boolean;
Begin
   bOk := True;
   qryItemOC.DisableControls;
   qryItemOC.First;
   While (Not qryItemOC.EOF) and ( bOk ) Do
      Begin
         SelFilhos( qryItemOCIDITEMOC.AsInteger );
         If qryPrazoEntOC.IsEmpty Then
            Begin
                MsgDlg('O Item '+qryItemOCDESCRICAO.AsString +' não possui Prazo de Entrega','Erro',mtError,[mbOk],0);
                bOk := False;
            End
         Else
         If qryPrazoPagOC.IsEmpty Then
            Begin
                MsgDlg('O Item '+qryItemOCDESCRICAO.AsString +' não possui Prazo de Pagamento','Erro',mtError,[mbOk],0);
                bOk := False;
            End;
         qryItemOC.Next;
      End;
   qryItemOC.EnableControls;
   Result := bOk;
End;

procedure TFrmCadOCsemCot.edBaseExit(Sender: TObject);
begin
  inherited;
  edValor.Value := (edAliquota.Value * edBase.Value) /100;
end;

Function  TFrmCadOCsemCot.LancCap : LongInt;
Var
    iCodDoc    : LongInt;
    iNumLancto : LongInt;
    rTotValor  : Double;
    rDif       : Double;
    iPlanilha  : LongInt;
    iIdItemOC  : LongInt;
Begin
    Result    := -1;
    iPlanilha := -1;
    qryPrazoPagOC.First;
    iIdItemOC := qryPrazoPagOCIDITEMOC.AsInteger;
    While Not qryPrazoPagOC.EOF Do
       Begin
          If iIdItemOC = qryPrazoPagOCIDITEMOC.AsInteger Then
             Begin
                iCodDoc := Documento.GetCodigo(nil);
                If iCodDoc <= 0 Then
                   Begin
                      Result := -1;
                      Abort;
                   End
                Else
                   Result := iCodDoc;
                Documento.Obs := qryOBSOC.asString;
                Documento.Inserir(nil,iCodDoc, IntToStr(Sistema.IdModulo),'','','',
                                  -1,Modulo.UnidNegoc,Sistema.IdEmpresa,qryIDFORCLI.asInteger,
                                  Modulo.iCodTipDoc,-1,'P',qryNUMOC.asFloat,qryPrazoPagOCPARCELAPGTO.AsString,
                                  DateToStr(qryDATAOC.asDateTime),DateToStr(qryPrazoPagOCDATAPAGTO.asDateTime),
                                  DateToStr(qryPrazoPagOCDATAPAGTO.asDateTime),'',-1,'12',Sistema.IdUsuario,-1,
                                  -1,'','',False,-1,-1,-1);
                iNumLancto := Documento.GerarNumLancto(nil,iCodDoc);
                if iNumLancto <= 0 then
                   Begin
                      Result := -1;
                      Abort;
                   End;
                Documento.CriarLanctoDoc(DtmCompras.qryAux,iCodDoc,iNumLancto,-1,iPlanilha,DateToStr(qryDATAOC.asDateTime),
                                        qryVALOROC.AsFloat*(qryPrazoPagOCPERCPAGTO.AsFloat/100),0,-1,'C','12','Previsão de O.C.',
                                        Sistema.IdUsuario,False,-1,'');

                rTotValor := 0;
                qryItemOC.First;
                While Not qryItemOC.Eof Do
                   Begin
                      rTotValor := rTotValor + (qryItemOCQTDEPEDIDA.asFloat*qryItemOCVALORUN.AsFloat)*(qryPrazoPagOCPERCPAGTO.AsFloat/100);
                      //
                      Documento.Rateio.Inserir(iCodDoc, Modulo.LeCodTipRecDes(qryItemOCCODGRUPOPROD.AsString),'P',
                                               '9999999999', Sistema.IdEmpresa,(qryItemOCQTDEPEDIDA.asFloat*qryItemOCVALORUN.AsFloat)*(qryPrazoPagOCPERCPAGTO.AsFloat/100),0,
                                               Sistema.IdUsuario,IntegraBack.uNidNegoc,0,'',
                                               IntegraBack.PatroGlobal,-1,IntegraBack.PlanoPrevGlobal);
                      qryItemOC.Next;
                   End;
                  rDif := rTotValor - (qryVALOROC.AsFloat*(qryPrazoPagOCPERCPAGTO.AsFloat/100));
                If Abs(rDif) <> 0 Then
                   Begin
                      Documento.Rateio.Inserir(iCodDoc, Modulo.LeCodTipRecDes(qryItemOCCODGRUPOPROD.AsString),'P',
                                               '9999999999', Sistema.IdEmpresa,rDif,0,
                                               Sistema.IdUsuario,IntegraBack.uNidNegoc,0,'',
                                               IntegraBack.PatroGlobal,-1,IntegraBack.PlanoPrevGlobal);
                   End;
             End;
          qryPrazoPagOC.Next;
       End;
End;


procedure TFrmCadOCsemCot.cmpFornExit(Sender: TObject);
begin
  inherited;
  If qryCONTATO.IsNull Then
     qryCONTATO.asString := Modulo.LeUltContato(cmpForn.ForCliReg.Id,Sistema.IdEmpresa);
end;

procedure TFrmCadOCsemCot.CopiaPrazos;
Var
   PrazoEnt : TList;
   PrazoPag : TList;
   objEnt   : TPrazoEnt;
   objPag   : TPrazoPag;
   x        : Integer;
begin
//---------------------------------------------------------------------------------------------
// Incializa os vetores dinamicos para a quantidade de registos
// existente no prazos do preimeiro artigo
//---------------------------------------------------------------------------------------------
  PrazoEnt := TList.Create;
  PrazoPag := TList.Create;
  qryItemOC.First;
  // Prazo de Entrega
   qryPrazoEntOC.First;
   While Not qryPrazoEntOC.Eof Do
       Begin
          ObjEnt := TPrazoEnt.Create;
          ObjEnt.PRAZOENTREGA := qryPrazoEntOCPRAZOENTREGA.AsFloat;
          ObjEnt.QTDEENTREGA  := qryPrazoEntOCQTDEENTREGA.AsFloat/qryItemOCQTDEPEDIDA.AsFloat;
          ObjEnt.DATAENTREGA  := qryPrazoEntOCDATAENTREGA.AsDateTime;
          qryPrazoEntOC.Next;
          PrazoEnt.Add(ObjEnt);
       End;
  // Prazo de Pagamento
   qryPrazoPagOC.First;
   While Not qryPrazoPagOC.Eof Do
       Begin
          ObjPag := TPrazoPag.Create;
          ObjPag.PRAZOPGTO := qryPrazoPagOCPRAZOPGTO.AsFloat;
          ObjPag.PERCPAGTO := qryPrazoPagOCPERCPAGTO.AsFloat;
          ObjPag.DATAPAGTO := qryPrazoPagOCDATAPAGTO.AsDateTime;
          qryPrazoPagOC.Next;
          PrazoPag.Add(ObjPag);
       End;
   Try
     qryItemOC.DisableControls;
     //
     FrmAguarde.Min := 0;
     FrmAguarde.Max := qryItemOC.RecordCount;
     FrmAguarde.Pos := 0;
     //
     qryItemOC.Next;
     FrmAguarde.Mostra('Copiando Prazos Aguarde...');
     While Not qryItemOC.Eof Do
        Begin
           SelFilhos( qryItemOCIDITEMOC.AsInteger );
           If qryPrazoEntOC.IsEmpty Then
           For x := 0 To Pred(PrazoEnt.Count) Do
               Begin
                  ObjEnt := TPrazoEnt(PrazoEnt.Items[x]);
                  qryPrazoEntOC.Append;
                  qryPrazoEntOCIDITEMOC.AsInteger     := qryItemOCIDITEMOC.AsInteger;
                  qryPrazoEntOCPARCELAENTREGA.AsFloat := x + 1;
                  qryPrazoEntOCPRAZOENTREGA.AsFloat   := ObjEnt.PRAZOENTREGA;
                  qryPrazoEntOCQTDEENTREGA.AsFloat    := qryItemOCQTDEPEDIDA.AsFloat * ObjEnt.QTDEENTREGA;
                  qryPrazoEntOCPERIODOPRAZO.AsString  := 'D';
                  qryPrazoEntOCDATAENTREGA.AsDateTime := ObjEnt.DATAENTREGA;
                  qryPrazoEntOC.Post;
               End;
           If qryPrazoPagOC.IsEmpty Then
           For x := 0 To Pred(PrazoPag.Count) Do
               Begin
                  ObjPag := TPrazoPag(PrazoPag.Items[x]);
                  qryPrazoPagOC.Append;
                  qryPrazoPagOCIDITEMOC.AsInteger    := qryItemOCIDITEMOC.AsInteger;
                  qryPrazoPagOCPARCELAPGTO.AsFloat   := x + 1;
                  qryPrazoPagOCPRAZOPGTO.AsFloat     := ObjPag.PRAZOPGTO;
                  qryPrazoPagOCPERIODOPRAZO.AsString := 'D';
                  qryPrazoPagOCPERCPAGTO.AsFloat     := ObjPag.PERCPAGTO;
                  qryPrazoPagOCDATAPAGTO.AsDateTime  := ObjPag.DATAPAGTO;
                  qryPrazoPagOC.Post;
               End;
            qryItemOC.Next;
            FrmAguarde.Pos := FrmAguarde.Pos + 1;
            Application.ProcessMessages;
        End;
   Finally
      // Libera os objetos da memoria
      While PrazoEnt.Count > 0 Do
         Begin
            TPrazoEnt(PrazoEnt.Items[0]).Free;
            PrazoEnt.Delete(0);
         End;
       While PrazoPag.Count > 0 Do
         Begin
            TPrazoPag(PrazoPag.Items[0]).Free;
            PrazoPag.Delete(0);
         End;
      PrazoEnt.Free;
      PrazoPag.Free;
      qryItemOC.EnableControls;
      FrmAguarde.Apaga;
      qryItemOC.First;
   End;
end;

procedure TFrmCadOCsemCot.btnCopiaPrazoClick(Sender: TObject);
begin
  inherited;
  If Not qryItemOC.IsEmpty Then
     CopiaPrazos;
  btnCopiaPrazo.Down := False;
end;

Function TFrmCadOCsemCot.VerificaPrazos(Var s : String): Boolean;
begin
   Result := True;
   Try
     qryItemOC.DisableControls;
     qryItemOC.First;
     While (Not qryItemOC.Eof) And (Not Result) Do
        Begin
           SelFilhos( qryItemOCIDITEMOC.AsInteger );
           If (qryPrazoEntOC.IsEmpty) Or (qryPrazoPagOC.IsEmpty) Then
              Begin
                 Result := False;
                 s      := qryItemOCDESCRICAO.AsString; 
              End;
           qryItemOC.Next;
        End;
   Finally
      qryItemOC.EnableControls;
      qryItemOC.First;
   End;

end;

end.

