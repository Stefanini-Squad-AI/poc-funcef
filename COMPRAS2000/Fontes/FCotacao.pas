unit FCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, CMDBLookupCombo, TREdit, DBCGrids, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmCotacao = class(TfrmCadMestreDetalheCS)
    plnArt: TPanel;
    GrdUltComp: TwwDBGrid;
    Splitter1: TSplitter;
    GrdArt: TwwDBGrid;
    TabPrazoPag: TTabSheet;
    TabAgreg: TTabSheet;
    TabPreco: TTabSheet;
    Label5: TLabel;
    edProc: TDBEdit;
    qryIDFORCLI: TFloatField;
    qryIDPROCXART: TFloatField;
    qryCODPROCESSO: TFloatField;
    qryPROPOSTA: TFloatField;
    qryQTDEFORNECIDA: TFloatField;
    qryPRECO: TFloatField;
    qryCODMEDIDA: TStringField;
    qryNUMCOT: TFloatField;
    qryDATACOT: TDateTimeField;
    qrySTATUS: TStringField;
    qryOBS: TStringField;
    qryMOECODIGO: TFloatField;
    qryTXJUROS: TFloatField;
    qryPRECOAVALORPRES: TFloatField;
    qryCODARTIGO: TStringField;
    qryDESCRICAO: TStringField;
    qryRAZAOSOCIAL: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    edNumProp: TDBEdit;
    Panel1: TPanel;
    GrdPrazoPag: TwwDBGrid;
    dblcForn: TCMDBLookupCombo;
    dsPrazoPag: TwwDataSource;
    dsAgreg: TwwDataSource;
    qryDet: TwwQuery;
    qryPrazoPag: TwwQuery;
    qryAgreg: TwwQuery;
    updDet: TUpdateSQL;
    updPrazoPag: TUpdateSQL;
    updAgreg: TUpdateSQL;
    qryPrazoPagIDPROCXART: TFloatField;
    qryPrazoPagIDFORCLI: TFloatField;
    qryPrazoPagCODPROCESSO: TFloatField;
    qryPrazoPagPROPOSTA: TFloatField;
    qryPrazoPagIDPRAZOPGTO: TFloatField;
    qryPrazoPagPRAZOPGTO: TFloatField;
    qryPrazoPagPERIODOPRAZO: TStringField;
    qryPrazoPagDATAPGTO: TDateTimeField;
    qryPrazoPagPERCENT: TFloatField;
    qryForn: TwwQuery;
    qryFornIDFORCLI: TFloatField;
    qryFornPROPOSTA: TFloatField;
    qryFornRAZAOSOCIAL: TStringField;
    qryAgregIDPROCXART: TFloatField;
    qryAgregIDFORCLI: TFloatField;
    qryAgregCODPROCESSO: TFloatField;
    qryAgregPROPOSTA: TFloatField;
    qryAgregCODTIPOCUSTAGREG: TFloatField;
    qryAgregPERCENT: TFloatField;
    qryAgregVALOR: TFloatField;
    qryAgregDESCCUSTAGREG: TStringField;
    qryAgregFLGBASE: TStringField;
    qryDetIDPROCXART: TFloatField;
    qryDetIDFORCLI: TFloatField;
    qryDetCODPROCESSO: TFloatField;
    qryDetPROPOSTA: TFloatField;
    qryDetIDPRAZOENT: TFloatField;
    qryDetQTDEENT: TFloatField;
    qryDetCODMEDIDA: TStringField;
    qryDetPRAZOENT: TFloatField;
    qryDetPERIODOPRAZO: TStringField;
    qryDetDATAENT: TDateTimeField;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qryUltComp: TwwQuery;
    dsUltComp: TwwDataSource;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edQtdePedida: TDBRealEdit;
    Label4: TLabel;
    qryQTDEPEDIDA: TFloatField;
    qryUNIDPED: TStringField;
    edUnid: TDBEdit;
    GrpForn: TGroupBox;
    Label6: TLabel;
    edQtdeForn: TDBRealEdit;
    Label8: TLabel;
    dblcUN: TwwDBLookupCombo;
    edRef: TDBRealEdit;
    Label9: TLabel;
    edDataCot: TCMDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    edPreco: TDBRealEdit;
    dblcMoeda: TCMDBLookupCombo;
    Label12: TLabel;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaMOESIGLA: TStringField;
    Label13: TLabel;
    memOBS: TDBMemo;
    qryUltCompRAZAOSOCIAL: TStringField;
    qryUltCompDATAENTDEVOL: TDateTimeField;
    qryUltCompVALUNEST: TFloatField;
    qryUltCompVLRUNITARIO: TFloatField;
    qryUltCompCODMEDIDA: TStringField;
    qryUltCompQTDERECEBDEVOL: TFloatField;
    Panel3: TPanel;
    Panel4: TPanel;
    qryFornCHAVE: TStringField;
    edDataEnt: TCMDateTimePicker;
    Label14: TLabel;
    edPrazoEnt: TDBRealEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edDataPag: TCMDateTimePicker;
    Label20: TLabel;
    edPrazoPag: TDBRealEdit;
    Label21: TLabel;
    Label22: TLabel;
    edPercentPag: TDBRealEdit;
    qryTipoAgre: TwwQuery;
    qryTipoAgreCODTIPOCUSTAGREG: TFloatField;
    qryTipoAgreDESCCUSTAGREG: TStringField;
    qryTipoAgreFLGBASE: TStringField;
    qryCODPRODUTO: TStringField;
    edUnEnt: TDBEdit;
    qryProc: TwwQuery;
    updProc: TUpdateSQL;
    qryProcCODPROCESSO: TFloatField;
    qryProcSTATUS: TStringField;
    PnlGrd: TPanel;
    grdAgreg: TwwDBGrid;
    Panel2: TPanel;
    qryFornCODESTADO: TStringField;
    qryFornIDPAIS: TFloatField;
    qryAgregPERCVALOR: TStringField;
    qryAgregBASE: TFloatField;
    qryAgregACUMBASE: TFloatField;
    qryAgregCODTRATFISCE: TStringField;
    edQtdeEnt: TDBEdit;
    UpdAtuAgreg: TUpdateSQL;
    qryAtuAgreg: TwwQuery;
    qryAtuAgregIDPROCXART: TFloatField;
    qryAtuAgregIDFORCLI: TFloatField;
    qryAtuAgregCODPROCESSO: TFloatField;
    qryAtuAgregPROPOSTA: TFloatField;
    qryAtuAgregCODTIPOCUSTAGREG: TFloatField;
    qryAtuAgregPERCENT: TFloatField;
    qryAtuAgregVALOR: TFloatField;
    plnEdAgreg: TPanel;
    Label25: TLabel;
    edAliquota: TDBRealEdit;
    Label24: TLabel;
    edBaseCalc: TDBRealEdit;
    Label23: TLabel;
    edValorAgreg: TDBRealEdit;
    qryRepeteEnt: TwwQuery;
    qryRepetePg: TwwQuery;
    qryRepetePgIDPROCXART: TFloatField;
    qryRepetePgIDFORCLI: TFloatField;
    qryRepetePgCODPROCESSO: TFloatField;
    qryRepetePgPROPOSTA: TFloatField;
    qryRepetePgIDPRAZOPGTO: TFloatField;
    qryRepetePgPRAZOPGTO: TFloatField;
    qryRepetePgPERIODOPRAZO: TStringField;
    qryRepetePgDATAPGTO: TDateTimeField;
    qryRepetePgPERCENT: TFloatField;
    qryRepeteEntIDPROCXART: TFloatField;
    qryRepeteEntIDFORCLI: TFloatField;
    qryRepeteEntCODPROCESSO: TFloatField;
    qryRepeteEntPROPOSTA: TFloatField;
    qryRepeteEntIDPRAZOENT: TFloatField;
    qryRepeteEntPERCPRAZO: TFloatField;
    qryRepeteEntPRAZOENT: TFloatField;
    qryRepeteEntPERIODOPRAZO: TStringField;
    qryRepeteEntDATAENT: TDateTimeField;
    qryProcxArt: TwwQuery;
    qryProcxArtIDFORCLI: TFloatField;
    qryProcxArtIDPROCXART: TFloatField;
    qryProcxArtCODPROCESSO: TFloatField;
    qryProcxArtPROPOSTA: TFloatField;
    qryProcxArtQTDEFORNECIDA: TFloatField;
    qryProcxArtPRECO: TFloatField;
    qryProcxArtCODMEDIDA: TStringField;
    qryProcxArtNUMCOT: TFloatField;
    qryProcxArtDATACOT: TDateTimeField;
    qryProcxArtSTATUS: TStringField;
    qryProcxArtOBS: TStringField;
    qryProcxArtMOECODIGO: TFloatField;
    qryProcxArtTXJUROS: TFloatField;
    qryProcxArtPRECOAVALORPRES: TFloatField;
    qryProcxArtCODARTIGO: TStringField;
    qryProcxArtQTDEPEDIDA: TFloatField;
    qryProcxArtUNIDPED: TStringField;
    qryProcxArtDESCRICAO: TStringField;
    qryProcxArtRAZAOSOCIAL: TStringField;
    qryProcxArtCODPRODUTO: TStringField;
    dsProcxArt: TwwDataSource;
    edTxJuros: TDBEdit;
    qrySCI: TwwQuery;
    tbsOBSSoli: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    dbObsSCI: TDBMemo;
    dsSCI: TwwDataSource;
    qryAtuAgregBASECALCULO: TFloatField;
    TabDadosForn: TTabSheet;
    qryDadosForn: TwwQuery;
    dsDadosForn: TwwDataSource;
    qryDadosFornENDERECO: TStringField;
    qryDadosFornCEP: TStringField;
    qryDadosFornCODESTADO: TStringField;
    qryDadosFornEMAILEMP: TStringField;
    qryDadosFornCIDADE: TStringField;
    qryDadosFornNOMEPAIS: TStringField;
    qryDadosFornTELEFONE: TStringField;
    qryDadosFornDDI: TStringField;
    qryDadosFornDDD: TStringField;
    qryDadosFornRAMAL: TStringField;
    qryDadosFornCONTATO: TStringField;
    qryDadosFornCARGO: TStringField;
    qryDadosFornSETOR: TStringField;
    qryDadosFornEMAILCON: TStringField;
    pcDadosForn: TPageControl;
    tbsEndForn: TTabSheet;
    tbsProdForn: TTabSheet;
    Label26: TLabel;
    edEndereco: TDBEdit;
    Label30: TLabel;
    edCEP: TDBEdit;
    Label32: TLabel;
    lblEMailEmp: TLabel;
    wwDBGrid1: TwwDBGrid;
    edCidade: TDBEdit;
    Label33: TLabel;
    edEstado: TDBEdit;
    Label31: TLabel;
    edPais: TDBEdit;
    Label27: TLabel;
    dbgrUltCompForn: TwwDBGrid;
    qryUltCompForn: TwwQuery;
    dsUltCompForn: TwwDataSource;
    qryUltCompFornDESCPROD: TStringField;
    qryUltCompFornDATAENTDEVOL: TDateTimeField;
    qryUltCompFornQTDERECEBDEVOL: TFloatField;
    qryUltCompFornVALUNEST: TFloatField;
    qryUltCompFornVLRUNITARIO: TFloatField;
    qryUltCompFornCODMEDIDA: TStringField;
    qryUltCompFornORDEM: TFloatField;
    qrySCIOBSITEMSOLIC: TMemoField;
    Label28: TLabel;
    qryCODTIPRECDES: TStringField;
    qryCONTATO: TStringField;
    Label29: TLabel;
    edContato: TDBEdit;
    qryProcxArtSALDOQTDE: TFloatField;
    qryProcxArtCODMEDCUSTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcFornCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edPrazoEntExit(Sender: TObject);
    procedure edPrazoPagExit(Sender: TObject);
    procedure grdAgregExit(Sender: TObject);
    procedure edAliquotaExit(Sender: TObject);
    procedure edBaseCalcExit(Sender: TObject);
    procedure edValorAgregExit(Sender: TObject);
    procedure edPrecoExit(Sender: TObject);
    procedure qryProcxArtAfterScroll(DataSet: TDataSet);
    procedure lblEMailEmpClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure GrdArtDblClick(Sender: TObject);
  private
    { Private declarations }
    rQtdeAtend    : Double;
    rPercPag      : Double;
    rPerc         : Double;
    rBase         : Double;
    rValorImp     : Double;

    //
    Procedure Sel( CodProc, idForCli, iProposta, iProcxArt  : LongInt; bSelecionaArt:Boolean );
    Procedure SelFilhos( CodProc,idForCli,idProcxArt,iProposta : LongInt );
    Function  VerifDetalhe : Boolean;
    Procedure CalcQtdeAtend;
    Procedure CalcPercPag;
    Procedure RepetePzEnt;
    Procedure RepetePzPag;
    Procedure CalcImpAuto;
    Procedure AtuBase(rBaseInf:Double);
    Procedure SendMail( Const sEndereco, sAssunto, sTexto : String );
  public
    { Public declarations }
  end;

var
  FrmCotacao: TFrmCotacao;

implementation

{$R *.DFM}

Uses uSistema,uModulo, uMensErro, uDataBase, uString, dBaseDados,
     uImpostoRetido,ShellApi,FViewCotacao;

Procedure TFrmCotacao.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
    inherited;
    rQtdeAtend := 0;
    rPercPag   := 0;
    pnlMestre.Enabled  := True;
    TabPreco.Enabled   := sbtnAlterar.Down;
    plnEdAgreg.Enabled := sbtnAlterar.Down;
End;

procedure TFrmCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  ImpostoRetido    := TImpostoRetido.Create;
  qryForn.Close;
  If Not qryForn.Prepared Then qryForn.Prepare;
  qryUltComp.Close;
  If Not qryUltComp.Prepared Then qryUltComp.Prepare;
  qryUltCompForn.Close;
  If Not qryUltCompForn.Prepared Then qryUltCompForn.Prepare;
  qryUnidMed.Close;
  If Not qryUnidMed.Prepared Then qryUnidMed.Prepare;
  qryProcxArt.Close;
  If Not qryProcxArt.Prepared Then qryProcxArt.Prepare;
  qrySCI.Close;
  If Not qrySCI.Prepared Then qrySCI.Prepare;
  qryDadosForn.Close;
  If Not qryDadosForn.Prepared Then qryDadosForn.Prepare;
  MontaSelect.Filtro.Add('PROCESSO.IDCOMPRADOR ='+IntToStr(Sistema.IdUsuario));
  Sel(-1,-1,-1,-1,True);
end;

Procedure TFrmCotacao.Sel( CodProc, idForCli, iProposta, iProcxArt  : LongInt ; bSelecionaArt:Boolean );
Begin
  if bSelecionaArt Then
     Begin
        qryProcxArt.DisableControls;
        qryProcxArt.Close;
        qryProcxArt.ParamByName('pCODPROCESSO').AsInteger    := CodProc;
        qryProcxArt.ParamByName('pIDFORCLI').AsInteger       := idForCli;
        qryProcxArt.ParamByName('pPROPOSTA').AsInteger       := iProposta;
        qryProcxArt.ParamByName('CODALMOXARIFADO').AsInteger := Modulo.iCodAlmoxa;
        qryProcxArt.Open;
        qryProcxArt.First;
        iProcxArt := qryProcxArtIDPROCXART.AsInteger;
        qryProcxArt.EnableControls;
     End;
  qry.Close;
  If Not qry.Prepared Then qry.Prepare;
  qry.ParamByName('pCODPROCESSO').AsInteger := CodProc;
  qry.ParamByName('pIDFORCLI').AsInteger    := idForCli;
  qry.ParamByName('pPROPOSTA').AsInteger    := iProposta;
  qry.ParamByName('pIDPROCXART').AsInteger  := iProcxArt;
  qry.Open;
  //
  qryProc.Close;
  qryProc.ParamByName('pCODPROCESSO').AsInteger := CodProc;
  qryProc.Open;
  //
  SelFilhos( CodProc ,qryIDFORCLI.AsInteger,qryIDPROCXART.asInteger,qryPROPOSTA.asInteger );
  qryForn.Close;
  qryForn.ParamByName('CODPROCESSO').AsInteger := CodProc;
  qryForn.Open;
  dblcForn.LookupValue := IntToStr(qryIDFORCLI.AsInteger) + IntToStr(qryPROPOSTA.asInteger);
  //
  qryDadosForn.Close;
  qryDadosForn.ParamByName('IDFORCLI').AsFloat := qryIDFORCLI.AsFloat;
  qryDadosForn.Open;
  lblEMailEmp.Caption := trim(qryDadosFornEMAILEMP.AsString);
End;

Procedure TFrmCotacao.SelFilhos( CodProc,idForCli,idProcxArt,iProposta : LongInt );
Begin
  rQtdeAtend := 0;
  rPercPag   := 0;
  qryDet.Close;
  If Not qryDet.Prepared Then qryDet.Prepare;
  qryDet.ParamByName('pCODPROCESSO').AsInteger := CodProc;
  qryDet.ParamByName('pIDFORCLI').AsInteger    := idForCli;
  qryDet.ParamByName('pIDPROCXART').AsInteger  := idProcxArt;
  qryDet.ParamByName('pPROPOSTA').AsInteger    := iProposta;
  qryDet.Open;
  //
  qryPrazoPag.Close;
  If Not qryPrazoPag.Prepared Then qryPrazoPag.Prepare;
  qryPrazoPag.ParamByName('pCODPROCESSO').AsInteger := CodProc;
  qryPrazoPag.ParamByName('pIDFORCLI').AsInteger    := idForCli;
  qryPrazoPag.ParamByName('pIDPROCXART').AsInteger  := idProcxArt;
  qryPrazoPag.ParamByName('pPROPOSTA').AsInteger    := iProposta;
  qryPrazoPag.Open;
  //
  qryAgreg.Close;
  If Not qryAgreg.Prepared Then qryAgreg.Prepare;
  qryAgreg.ParamByName('pCODPROCESSO').AsInteger := CodProc;
  qryAgreg.ParamByName('pIDFORCLI').AsInteger    := idForCli;
  qryAgreg.ParamByName('pIDPROCXART').AsInteger  := idProcxArt;
  qryAgreg.ParamByName('pPROPOSTA').AsInteger    := iProposta;
  qryAgreg.Open;
  //
  qryAtuAgreg.Close;
  If Not qryAtuAgreg.Prepared Then qryAtuAgreg.Prepare;
  qryAtuAgreg.ParamByName('pCODPROCESSO').AsInteger := CodProc;
  qryAtuAgreg.ParamByName('pIDFORCLI').AsInteger    := idForCli;
  qryAtuAgreg.ParamByName('pIDPROCXART').AsInteger  := idProcxArt;
  qryAtuAgreg.ParamByName('pPROPOSTA').AsInteger    := iProposta;
  qryAtuAgreg.Open;
  //
End;
Procedure TFrmCotacao.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    If Not qrySCI.IsEmpty Then
       Begin
          tbcDetalhe.TabIndex := 5;
          tbcDetalheChange(tbcDetalhe);
       End;
    if (qryTXJUROS.AsFloat = 0) or (qryTXJUROS.isNull) Then
       qryTXJUROS.AsFloat    := Modulo.TxJuros;
    if qryDATACOT.isNull Then
       qryDATACOT.AsDateTime := Date;
    edDataCot.Text           := DateToStr(qryDATACOT.AsDateTime);
    If qryQTDEFORNECIDA.AsFloat <= 0 Then
       qryQTDEFORNECIDA.AsFloat := qryQTDEPEDIDA.AsFloat;
End;

Procedure TFrmCotacao.CmeCadastroFind(Sender: TObject);
Begin
   inherited;
   if MontaSelect.RetornouValor Then
      Sel(StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]),StrToInt(MontaSelect.ValoresChave[2]),-1,True);
End;

procedure TFrmCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ImpostoRetido.Free;
  qryForn.Close;
  If qryForn.Prepared Then qryForn.UnPrepare;
  qryProcxArt.Close;
  If qryProcxArt.Prepared Then qryProcxArt.UnPrepare;
  qry.Close;
  If qry.Prepared Then qry.UnPrepare;
  qryDet.Close;
  If qryDet.Prepared Then qryDet.UnPrepare;
  qryPrazoPag.Close;
  If qryPrazoPag.Prepared Then qryPrazoPag.UnPrepare;
  qryAgreg.Close;
  If qryAgreg.Prepared Then qryAgreg.UnPrepare;
  qryAtuAgreg.Close;
  If qryAtuAgreg.Prepared Then qryAtuAgreg.UnPrepare;
  qryUltComp.Close;
  If qryUltComp.Prepared Then qryUltComp.UnPrepare;
  qryUltCompForn.Close;
  If qryUltCompForn.Prepared Then qryUltCompForn.UnPrepare;
  qryUnidMed.Close;
  If qryUnidMed.Prepared Then qryUnidMed.UnPrepare;
  qrySCI.Close;
  If qrySCI.Prepared Then qrySCI.UnPrepare;
  qryDadosForn.Close;
  If qryDadosForn.Prepared Then qryDadosForn.UnPrepare;
end;

procedure TFrmCotacao.dblcFornCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     Begin
        If sbtnAlterar.Down Then
           Begin
              If VerifDetalhe Then
                 Begin
                    bbtnConfirmar.Click;
                    Sel(StrToInt(edProc.Text),qryFornIDFORCLI.AsInteger,qryFornPROPOSTA.AsInteger,-1,True);
                    sbtnAlterar.Click;
                    if qryCONTATO.IsNull Then
                       qryCONTATO.AsString := Modulo.LeUltContato(qryFornIDFORCLI.AsInteger,Sistema.IdEmpresa);
                 End
              Else
                 Begin
                    MsgDlg('Erro de cotação : '+Chr(13)+
                           '  - Quatidade Fornecida de :'+Format('%12.2f',[rQtdeAtend])+Chr(13)+
                           '  - Percentual de                :'+Format('%12.2f',[rPercPag])+'%','Erro',mtError,[mbOk],0);
                    dblcForn.LookupValue := IntToStr(qryProcxArtIDFORCLI.AsInteger) + IntToStr(qryProcxArtPROPOSTA.asInteger);
                 End;
           End
        Else
           Sel(StrToInt(edProc.Text),qryFornIDFORCLI.AsInteger,qryFornPROPOSTA.AsInteger,-1,True);
     End;
end;

Procedure TFrmCotacao.CmeDetalheInsert(Sender: TObject);
Var
   rCem :Double;
Begin
    rCem := 100;
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       1: Begin
            CalcQtdeAtend;
            If Format('%12.2f',[qryQTDEFORNECIDA.AsFloat]) <> Format('%12.2f',[rQtdeAtend]) Then
               Begin
                  inherited;
                  qryDetIDPRAZOENT.AsInteger  := LeUltRegistro(nil,'PRAZOENTRRGA');
                  qryDetCODPROCESSO.AsInteger := qryCODPROCESSO.AsInteger;
                  qryDetIDPROCXART.AsInteger  := qryIDPROCXART.AsInteger;
                  qryDetIDFORCLI.AsInteger    := qryIDFORCLI.AsInteger;
                  qryDetPROPOSTA.AsInteger    := qryPROPOSTA.AsInteger;
                  qryDetDATAENT.AsDateTime    := Date;
                  qryDetPERIODOPRAZO.AsString := 'D';
                  qryDetQTDEENT.AsFloat       := qryQTDEFORNECIDA.AsFloat - rQtdeAtend;
                  qryDetCODMEDIDA.AsString    := qryCODMEDIDA.AsString;
                  edDataEnt.Date              := Date;
                  edQtdeEnt.SetFocus;
               End
            Else
               Begin
                  MsgDlg('Quantidade fornecida já está completa','Informação',mtInformation,[mbOk],0);
                  bbtnVoltarDet.Click;
               End;
          End;
       2: Begin
            CalcPercPag;
            If Format('%12.2f',[rCem]) <> Format('%12.2f',[rPercPag]) Then
               Begin
                 inherited;
                 qryPrazoPagIDPRAZOPGTO.AsInteger := LeUltRegistro(nil,'PRAZOPGTO');
                 qryPrazoPagCODPROCESSO.AsInteger := qryCODPROCESSO.AsInteger;
                 qryPrazoPagIDPROCXART.AsInteger  := qryIDPROCXART.AsInteger;
                 qryPrazoPagIDFORCLI.AsInteger    := qryIDFORCLI.AsInteger;
                 qryPrazoPagPROPOSTA.AsInteger    := qryPROPOSTA.AsInteger;
                 qryPrazoPagDATAPGTO.AsDateTime   := Date;
                 qryPrazoPagPERIODOPRAZO.AsString := 'D';
                 qryPrazoPagPERCENT.AsFloat       := 100 - rPercPag;
                 edDataPag.Date                   := Date;
                 edPercentPag.Value               := 100 - rPercPag;
                 edPercentPag.SetFocus;
               End
             Else
               Begin
                  MsgDlg('Percentual igual a 100%','Informação',mtInformation,[mbOk],0);
                  bbtnVoltarDet.Click;
               End;
          End;
    End;
End;

Procedure TFrmCotacao.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       1: Begin
            edDataEnt.SetFocus;
          End;
       2: Begin
            edDataPag.SetFocus;
          End;
    End;
End;

Procedure TFrmCotacao.CmeDetalheDelete(Sender: TObject);
Begin
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       1: Begin
            If MsgDlg('Confirma a exclusão do Prazo de Entrega','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
               inherited;
          End;
       2: Begin
            If MsgDlg('Confirma a exclusão do Prazo de Pagamento','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
               inherited;
          End;
    End;
End;

Procedure TFrmCotacao.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in [dsInsert,dsEdit]) or (qryPrazoPag.State in [dsInsert,dsEdit]) or (qryAgreg.State in [dsInsert,dsEdit])  Then
   Begin
      Case pgctrlDetalhe.ActivePage.PageIndex Of
         1: Begin
               If Trim(edDataEnt.text) = '' Then
                  Begin
                      MsgDlg('Data de entrega não foi preenchida','Erro',mtError,[mbOK],0);
                      edDataEnt.SetFocus;
                  End
               Else
               If (qryDetQTDEENT.AsFloat <= 0) or (qryDetQTDEENT.IsNull ) Then
                  Begin
                      MsgDlg('Quantidade Fornecida não foi preenchida','Erro',mtError,[mbOK],0);
                      edDataEnt.SetFocus;
                  End
               Else
               If edPrazoEnt.value <= 0  Then
                  Begin
                      MsgDlg('Prazo de entrega não foi preenchida','Erro',mtError,[mbOK],0);
                      edPrazoEnt.SetFocus;
                  End
               Else
                  Inherited;
            End;
         2: Begin
               If Trim(edDataPag.text) = '' Then
                  Begin
                      MsgDlg('Data de pagamento não foi preenchida','Erro',mtError,[mbOK],0);
                      edDataPag.SetFocus;
                  End
               Else
               If edPercentPag.value <= 0  Then
                  Begin
                      MsgDlg('Percentual não foi preenchida','Erro',mtError,[mbOK],0);
                      edPercentPag.SetFocus;
                  End
               Else
               If edPrazoPag.value <= 0  Then
                  Begin
                      MsgDlg('Prazo de pagamento não foi preenchida','Erro',mtError,[mbOK],0);
                      edPrazoPag.SetFocus;
                  End
               Else
                  Inherited;
            End;
      End;
   End
 Else
   inherited;
End;

Procedure TFrmCotacao.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    tbcDetalhe.TabIndex := 0;
    tbcDetalheChange(tbcDetalhe);
    tbcDetalhe.SetFocus;
    Accept := True;
    If Trim(dblcUN.text) = '' Then
       Begin
           MsgDlg('Unidade de fornecimento não foi preenchida','Erro',mtError,[mbOK],0);
           dblcUN.SetFocus;
           Accept := False;
       End
    Else
    If Trim(edDataCot.Text) = '' Then
       Begin
           MsgDlg('Data da cotação não foi preenchida','Erro',mtError,[mbOK],0);
           edDataCot.SetFocus;
           Accept := False;
       End;
End;

Procedure TFrmCotacao.CmeCadastroConfirma(Sender: TObject);
Begin
    if sbtnAlterar.Down Then
        Begin
           if qry.State      = dsEdit then qry.Post;
           if qryAgreg.State = dsEdit then qryAgreg.Post;
           qryPROC.Edit;
           qryPROCSTATUS.AsString := 'C';
           qryPROC.Post;
           qryAgreg.DisableControls;
           qryAgreg.First;
           While Not qryAgreg.EOF Do
               Begin
                  if qryAtuAgreg.Locate('CODTIPOCUSTAGREG',qryAgregCODTIPOCUSTAGREG.AsInteger,[]) Then
                     Begin
                        If qryAgregVALOR.AsFloat <> 0 Then
                           Begin
                             qryAtuAgreg.Edit;
                             qryAtuAgregCODPROCESSO.AsInteger := qryCODPROCESSO.AsInteger;
                             qryAtuAgregIDPROCXART.AsInteger  := qryIDPROCXART.AsInteger;
                             qryAtuAgregIDFORCLI.AsInteger    := qryIDFORCLI.AsInteger;
                             qryAtuAgregPROPOSTA.AsInteger    := qryPROPOSTA.AsInteger;
                             qryAtuAgregPERCENT.AsFloat       := qryAgregPERCENT.AsFloat;
                             qryAtuAgregVALOR.AsFloat         := qryAgregVALOR.AsFloat;
                             qryAtuAgregBASECALCULO.AsFloat   := qryAgregBASE.AsFloat;
                             qryAtuAgreg.Post;
                          End
                        Else
                          qryAtuAgreg.Delete;
                    End
                  Else
                    If qryAgregVALOR.AsFloat <> 0 Then
                       Begin
                         qryAtuAgreg.Append;
                         qryAtuAgregCODPROCESSO.AsInteger      := qryCODPROCESSO.AsInteger;
                         qryAtuAgregIDPROCXART.AsInteger       := qryIDPROCXART.AsInteger;
                         qryAtuAgregIDFORCLI.AsInteger         := qryIDFORCLI.AsInteger;
                         qryAtuAgregPROPOSTA.AsInteger         := qryPROPOSTA.AsInteger;
                         qryAtuAgregCODTIPOCUSTAGREG.AsInteger := qryAgregCODTIPOCUSTAGREG.AsInteger;
                         qryAtuAgregPERCENT.AsFloat            := qryAgregPERCENT.AsFloat;
                         qryAtuAgregVALOR.AsFloat              := qryAgregVALOR.AsFloat;
                         qryAtuAgregBASECALCULO.AsFloat        := qryAgregBASE.AsFloat;
                         qryAtuAgreg.Post;
                      End;
                  qryAgreg.Next;
              End;
           qryAgreg.EnableControls;
           qryAgreg.CancelUpdates;


          Try
            StartTransacao;
            qry.ApplyUpdates;
            qry.CommitUpdates;
            //
            qrydet.ApplyUpdates;
            qrydet.CommitUpdates;
            //
            qryPrazoPag.ApplyUpdates;
            qryPrazoPag.CommitUpdates;
            //
            qryAtuAgreg.ApplyUpdates;

            qryAtuAgreg.CommitUpdates;
            //
            qryProc.ApplyUpdates;
            qryProc.CommitUpdates;
            //
            If Not Modulo.GravaUltContato(qryFornIDFORCLI.AsInteger, Sistema.IdEmpresa, edContato.Text) Then
               Abort;
             CommitTransacao;
          Except
             RollBackTransacao;
             Raise;
          end;
        End;
    inherited;
End;

Procedure TFrmCotacao.CalcQtdeAtend;
Begin
   rQtdeAtend := 0;
   qryDet.DisableControls;
   qryDet.First;
   While Not qryDet.EOF Do
      Begin
          rQtdeAtend := rQtdeAtend + qryDetQTDEENT.AsFloat;
          qryDet.Next;
      End;
   qryDet.EnableControls;
End;

Procedure TFrmCotacao.CalcPercPag;
Begin
   rPercPag := 0;
   qryPrazoPag.DisableControls;
   qryPrazoPag.First;
   While Not qryPrazoPag.EOF Do
      Begin
          rPercPag := rPercPag + qryPrazoPagPERCENT.AsFloat;
          qryPrazoPag.Next;
      End;
   qryPrazoPag.EnableControls;
End;


procedure TFrmCotacao.edPrazoEntExit(Sender: TObject);
begin
  inherited;
  qryDetDATAENT.AsDateTime := Date + edPrazoEnt.Value;
end;

procedure TFrmCotacao.edPrazoPagExit(Sender: TObject);
begin
  inherited;
  qryPrazoPagDATAPGTO.AsDateTime := Date + edPrazoPag.Value;
end;
Function TFrmCotacao.VerifDetalhe : Boolean;
Begin
    Result := True;
    If sbtnAlterar.Down Then
       Begin
          CalcQtdeAtend;
          CalcPercPag;
          If (Not qryPRECO.IsNull) And (qryPRECO.AsFloat <> 0) Then
             Result := ( Format('%12.2f',[rQtdeAtend]) = Format('%12.2f',[qryDetQTDEENT.AsFloat]) )  AND ( rPercPag = 100 )
       End;
End;
procedure TFrmCotacao.grdAgregExit(Sender: TObject);
begin
   inherited;
   If (ActiveControl.Tag <> 99) And (plnEdAgreg.Enabled) Then
      Begin
         If (qryAgregPERCVALOR.AsString <> 'P') or (qryAgregPERCVALOR.isNull) Then
            Begin
               edAliquota.Enabled := False;
               edBaseCalc.Enabled := False;
               edValorAgreg.SetFocus;
            end
         Else
            Begin
               edAliquota.Enabled := True;
               edBaseCalc.Enabled := True;
               edAliquota.SetFocus;
            End;
         If edValorAgreg.Value = 0 then
            Begin
               rBase     := 0;
               rPerc     := 0;
               rValorImp := 0;
               Modulo.CalcImposto( qryCODPRODUTO.AsString,
                                   qryFornCODESTADO.AsString,
                                   qryFornIDPAIS.AsInteger,
                                   qryAgregCODTIPOCUSTAGREG.asInteger,
                                   qryAgregBASE.AsFloat,
                                   rBase,rPerc,rValorImp);
               If rBase = 0 Then
                  rBase := qryQTDEFORNECIDA.asFloat * qryPRECO.AsFloat;
               edAliquota.Value   := rPerc;
               edBaseCalc.Value   := rBase;
               edValorAgreg.Value := rValorImp;
               qryAgreg.Edit;
               qryAgregPERCENT.asFloat  := rPerc;
               qryAgregBASE.asFloat     := rBase;
               qryAgregVALOR.asFloat    := rValorImp;
            End
         Else
            Begin
               rBase := qryAgregBASE.AsFloat;
            end;
      End
   Else
      Begin
         If qryAgreg.State in [dsInsert, dsEdit] Then
            qryAgreg.Post;
         If sbtnAlterar.Down Then
            ActiveControl.SetFocus;
      End;
end;

procedure TFrmCotacao.edAliquotaExit(Sender: TObject);
begin
  inherited;
  AtuBase(rBase);
end;

procedure TFrmCotacao.edBaseCalcExit(Sender: TObject);
begin
  inherited;
  edValorAgreg.Value := (edAliquota.Value * edBaseCalc.Value)/100;
end;

procedure TFrmCotacao.edValorAgregExit(Sender: TObject);
Var
   bmMarca     : TbookMark;
   rAcumBase   : Double;
Begin
  inherited;
  If (qryAgregFLGBASE.AsString = 'S') Then
    Begin
       If (qryAgregCODTRATFISCE.AsString = '6') Then
          qryAgregACUMBASE.asFloat := edValorAgreg.Value * -1
       Else
          qryAgregACUMBASE.asFloat := edValorAgreg.Value;
       //
       qryAgreg.Post;
       bmMarca   := qryAgreg.GetBookmark;
       rAcumBase := 0;
       qryAgreg.DisableControls;

       qryAgreg.First;
       While Not qryAgreg.EOF Do
          Begin
             rAcumBase := rAcumBase + qryAgregACUMBASE.AsFloat;
             qryAgreg.Next;
          End;
       //
       qryAgreg.First;
       While Not qryAgreg.EOF Do
           Begin
              If (qryAgregFLGBASE.AsString <> 'S') Then
                 Begin
                    qryAgreg.Edit;
                    qryAgregBASE.AsFloat  := (qryQTDEFORNECIDA.AsFloat * qryPRECO.AsFloat ) + rAcumBase;
                    qryAgregVALOR.AsFloat := (qryAgregBASE.AsFloat * qryAgregPERCENT.AsFloat) / 100;
                    qryAgreg.Post;
                 End;
              qryAgreg.Next;
           End;
       If qryAgreg.BookmarkValid(bmMarca) Then
          Begin
             qryAgreg.GotoBookmark(bmMarca);
             qryAgreg.FreeBookmark(bmMarca);
          End;   
       qryAgreg.EnableControls;
       grdAgreg.RedrawGrid;
    End;
    If Not qryAgreg.EOF Then
       Begin
          qryAgreg.Next;
          grdAgreg.SetFocus;
       End;

end;


procedure TFrmCotacao.edPrecoExit(Sender: TObject);
begin
  inherited;
  If (sbtnAlterar.Down) and (edPreco.Value <> 0) Then
     Begin
        if qryDet.IsEmpty      Then RepetePzEnt;
        if qryPrazoPag.IsEmpty Then RepetePzPag;
        if qryAtuAgreg.IsEmpty then CalcImpAuto;
     End;
end;

procedure TFrmCotacao.RepetePzEnt;
var idProcAnt, rTotQtde : Double;
begin
   qryRepeteEnt.Close;
   qryRepeteEnt.ParamByName('pCODPROCESSO').AsInteger := qryCODPROCESSO.AsInteger;
   qryRepeteEnt.ParamByName('pIDFORCLI').AsInteger    := qryIDFORCLI.AsInteger;
   qryRepeteEnt.ParamByName('pPROPOSTA').AsInteger    := qryPROPOSTA.asInteger;
   qryRepeteEnt.Open;
   If not qryRepeteEnt.IsEmpty then
      Begin
         rTotQtde :=0;
         idProcAnt:=qryRepeteEntIDPROCXART.AsFloat;
         qryRepeteEnt.First;
         While not qryRepeteEnt.EOF do
            Begin
               If qryRepeteEntIDPROCXART.AsFloat <> idProcAnt then Break;
               qryDet.Append;
               qryDetIDPRAZOENT.AsInteger  := LeUltRegistro(nil,'PRAZOENTRRGA');
               qryDetCODPROCESSO.AsInteger := qryCODPROCESSO.AsInteger;
               qryDetIDPROCXART.AsInteger  := qryIDPROCXART.AsInteger;
               qryDetIDFORCLI.AsInteger    := qryIDFORCLI.AsInteger;
               qryDetPROPOSTA.AsInteger    := qryPROPOSTA.AsInteger;
               qryDetDATAENT.AsDateTime    := qryRepeteEntDATAENT.AsDateTime;
               qryDetQTDEENT.AsFloat       := StrToFloat(Format('%12.2f',[(qryQTDEFORNECIDA.AsFloat * qryRepeteEntPERCPRAZO.AsFloat)]));
               qryDetCODMEDIDA.AsString    := qryCODMEDIDA.AsString;
               qryDetPRAZOENT.AsInteger    := qryRepeteEntPRAZOENT.AsInteger;
               qryDetPERIODOPRAZO.AsString := qryRepeteEntPERIODOPRAZO.AsString;
               qryDet.Post;
               rTotQtde := rTotQtde + qryDetQTDEENT.AsFloat;
               qryRepeteEnt.Next;
            End;
         qryDet.Edit;
         qryDetQTDEENT.AsFloat := qryDetQTDEENT.AsFloat + qryQTDEFORNECIDA.AsFloat - rTotQtde;
         qryDet.Post;
         qryDet.First;
      end;
end;

procedure TFrmCotacao.RepetePzPag;
var idProcAnt : Double;
begin
   qryRepetePg.Close;
   qryRepetePg.ParamByName('pCODPROCESSO').AsInteger := qryCODPROCESSO.AsInteger;
   qryRepetePg.ParamByName('pIDFORCLI').AsInteger    := qryIDFORCLI.AsInteger;
   qryRepetePg.ParamByName('pPROPOSTA').AsInteger    := qryPROPOSTA.asInteger;
   qryRepetePg.Open;
   If not qryRepetePg.IsEmpty then
      Begin
         idProcAnt:=qryRepetePgIDPROCXART.AsFloat;
         qryRepetePg.First;
         While not qryRepetePg.EOF do
            Begin
               If qryRepetePgIDPROCXART.AsFloat <> idProcAnt then Break;
               qryPrazoPag.Append;
               qryPrazoPagIDPRAZOPGTO.AsInteger := LeUltRegistro(nil,'PRAZOPGTO');
               qryPrazoPagCODPROCESSO.AsInteger := qryCODPROCESSO.AsInteger;
               qryPrazoPagIDPROCXART.AsInteger  := qryIDPROCXART.AsInteger;
               qryPrazoPagIDFORCLI.AsInteger    := qryIDFORCLI.AsInteger;
               qryPrazoPagPROPOSTA.AsInteger    := qryPROPOSTA.AsInteger;
               qryPrazoPagDATAPGTO.AsDateTime   := qryRepetePgDATAPGTO.AsDateTime;
               qryPrazoPagPERIODOPRAZO.AsString := qryRepetePgPERIODOPRAZO.AsString;
               qryPrazoPagPERCENT.AsFloat       := qryRepetePgPERCENT.AsFloat;
               qryPrazoPagPRAZOPGTO.AsInteger   := qryRepetePgPRAZOPGTO.AsInteger;
               qryPrazoPag.Post;
               qryRepetePg.Next;
            End;
         qryPrazoPag.First;
      end;
end;

procedure TFrmCotacao.CalcImpAuto;
begin
   qryAgreg.DisableControls;
   If trim(qryCODTIPRECDES.AsString) <> '' Then
      Begin
         //Gravar impostos vinculados ao fornecedor, tipo de desembolso e Classificacao Fiscal
         ImpostoRetido.DataProgramada    := qryPrazoPagDATAPGTO.AsDateTime;
         ImpostoRetido.OperacaoDocumento := '2 ';
         ImpostoRetido.IdForCli          := qryIDFORCLI.AsInteger;
         ImpostoRetido.CodDocumento      := 0;
         ImpostoRetido.NumLancto         := 0;
         ImpostoRetido.ValorLancto       := qryQTDEFORNECIDA.asFloat * qryPRECO.AsFloat;
         ImpostoRetido.ValorLiquido      := qryQTDEFORNECIDA.asFloat * qryPRECO.AsFloat;
         ImpostoRetido.DataLancto        := qryDATACOT.AsDateTime;
         ImpostoRetido.DataEmissao       := qryDATACOT.AsDateTime;
         ImpostoRetido.DebCre            := 'C';
         ImpostoRetido.CodTipRecDes      := qryCODTIPRECDES.AsString;
         ImpostoRetido.MomentoLancamento := mlLancamento;
         ImpostoRetido.CodTipoDoc        := Modulo.iCodTipDoc;
         ImpostoRetido.Incluir;
         //
         If Not ImpostoRetido.QrySimulacao.IsEmpty Then
            Begin
               ImpostoRetido.QrySimulacao.First;
               While not ImpostoRetido.QrySimulacao.EOF do begin
                  if qryAgreg.Locate('CODTIPOCUSTAGREG',ImpostoRetido.QrySimulacao.FieldByName('IDIMPOSTO').AsInteger,[]) Then
                     Begin
                        qryAgreg.Edit;
                        qryAgregPERCENT.AsFloat := ImpostoRetido.QrySimulacao.FieldByName('PERCIMPOSTO').AsFloat;
                        qryAgregVALOR.AsFloat   := ImpostoRetido.QrySimulacao.FieldByName('VALORIMPOSTO').AsFloat;
                        qryAgregBASE.AsFloat    := ImpostoRetido.QrySimulacao.FieldByName('VALORBASE').AsFloat;
                        qryAgreg.Post;
                     End;
                  ImpostoRetido.QrySimulacao.Next;
               end;
           End;
   end;
   //
   //Gravar impostos vinculados ao item e ao estado
   qryAgreg.First;
   While not qryAgreg.EOF do begin
      If qryAgregCODTRATFISCE.AsString < '8' Then
         Begin
            qryAgreg.Edit;
            rBase :=qryQTDEFORNECIDA.asFloat * qryPRECO.AsFloat;
            AtuBase(rBase);
            rBase     := qryAgregBASE.AsFloat;
            rPerc     := 0;
            rValorImp := 0;
            Modulo.CalcImposto( qryCODPRODUTO.AsString,
                                qryFornCODESTADO.AsString,
                                qryFornIDPAIS.AsInteger,
                                qryAgregCODTIPOCUSTAGREG.asInteger,
                                qryAgregBASE.AsFloat,
                                rBase,rPerc,rValorImp);
            If rBase = 0 Then
               rBase := qryQTDEFORNECIDA .asFloat * qryPRECO.AsFloat;
            qryAgregPERCENT.asFloat  := rPerc;
            qryAgregBASE.asFloat     := rBase;
            qryAgregVALOR.asFloat    := rValorImp;
            qryAgreg.Post;
         End;
      qryAgreg.Next;
   end;
   qryAgreg.First;
   qryAgreg.EnableControls;
end;


procedure TFrmCotacao.qryProcxArtAfterScroll(DataSet: TDataSet);
Var bAlterou : Boolean;
begin
  inherited;
  bAlterou := False;
  If sbtnAlterar.Down Then
     Begin
        bAlterou := True;
        bbtnConfirmar.Click;
     end;
  //
  Sel( qryProcxArtCODPROCESSO.AsInteger ,qryProcxArtIDFORCLI.AsInteger,qryProcxArtPROPOSTA.asInteger,qryProcxArtIDPROCXART.asInteger,False );
  //
  qryUnidMed.Close;
  qryUnidMed.ParamByName('CODPRODUTO').AsString := Espaco(Trim(qryCODPRODUTO.AsString),6);
  qryUnidMed.Open;
  //
  qryUltComp.DisableControls;
  qryUltComp.Close;
  qryUltComp.ParamByName('CODARTIGO').AsString := Espaco(Trim(qryCODARTIGO.AsString),14);
  qryUltComp.Open;
  qryUltComp.EnableControls;
  //
  qryUltCompForn.DisableControls;
  qryUltCompForn.Close;
  qryUltCompForn.ParamByName('CODARTIGO').AsString := Espaco(Trim(qryCODARTIGO.AsString),14);
  qryUltCompForn.ParamByName('IDFORCLI').AsFloat   := qryIDFORCLI.AsFloat;
  qryUltCompForn.Open;
  qryUltCompForn.EnableControls;
  //
  qrySCI.Close;
  qrySCI.ParamByName('pCODARTIGO').AsString  := Espaco(Trim(qryCODARTIGO.AsString),14);
  qrySCI.ParamByName('pCODPROCESSO').AsFloat := qryCODPROCESSO.AsFloat;
  qrySCI.ParamByName('pIDPROCXART').AsFloat  := qryIDPROCXART.AsFloat;
  qrySCI.Open;
  //
  if bAlterou Then
     sbtnAlterar.Click;
end;

procedure TFrmCotacao.AtuBase(rBaseInf:Double);
Var
   rAcumBase  : Double;
   bmMarca    : TBookMark;
Begin
  If qryAgregFLGBASE.AsString = 'S' Then
     Begin
        edBaseCalc.Value     := rBaseInf;
        qryAgregBASE.AsFloat := rBaseInf;
     End
  Else
     Begin
        bmMarca   := qryAgreg.GetBookmark;
        rAcumBase := 0;
        qryAgreg.DisableControls;
        qryAgreg.First;
        While Not qryAgreg.EOF Do
           Begin
              rAcumBase := rAcumBase + qryAgregACUMBASE.AsFloat;
              qryAgreg.Next;
           End;
        qryAgreg.GotoBookmark(bmMarca);
        qryAgreg.FreeBookmark(bmMarca);
        qryAgreg.EnableControls;
        edBaseCalc.Value     := rBaseInf + rAcumBase;
        qryAgreg.Edit;
        qryAgregBASE.AsFloat := rBaseInf + rAcumBase;
     End;
end;

Procedure TFrmCotacao.SendMail( Const sEndereco, sAssunto, sTexto : String );
Var
   sMsg  : String;
   sbody : String;
   x     : Integer;
Begin
   sMsg := 'mailto:'+Trim(sEndereco);
   If Trim(sAssunto) <> '' Then
      sMsg := sMsg +'?subject='+Trim(sAssunto);
   If Trim(sTexto) <> '' Then
      Begin
         sBody := sTexto;
         x := Pos(#13,sBody);
         While x <> 0 Do
           Begin
              Delete(sBody,x,1);
              Insert('%0d%0a',sBody,x);
              x := Pos(#13,sBody);
           End;
          sMsg := sMsg + '&body='+sBody;
      End;
   ShellExecute(application.Handle,nil,PChar(sMsg),nil,nil,0);
End;

procedure TFrmCotacao.lblEMailEmpClick(Sender: TObject);

begin
  inherited;
  SendMail(lblEMailEmp.Caption,'Compras de Mercadorias','');
end;

procedure TFrmCotacao.GrdArtDblClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmViewCotacao,FrmViewCotacao);
  //
  FrmViewCotacao.DescProduto := qryDESCRICAO.AsString;
  FrmViewCotacao.CodProcesso := qryCODPROCESSO.AsInteger;
  FrmViewCotacao.IdProcxArt  := qryIDPROCXART.AsInteger;
  FrmViewCotacao.ShowModal;
end;

end.


