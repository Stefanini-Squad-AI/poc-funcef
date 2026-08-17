unit fMovEncerraObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  ComCtrls;

type
  TfrmMovEncerraObra = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    qryCafObra: TwwQuery;
    dsCafObra: TwwDataSource;
    Label17: TLabel;
    edAtivProjeto: TwwDBEdit;
    edDescSubConta: TwwDBEdit;
    Label18: TLabel;
    edDescGrupo: TwwDBEdit;
    Label8: TLabel;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    qryCafObraIDCAFOBRA: TFloatField;
    qryCafObraIDPESSOA: TFloatField;
    qryCafObraIDGRUPO: TFloatField;
    qryCafObraCODSUBCONTA: TFloatField;
    qryCafObraUNIDNEGOC: TFloatField;
    qryCafObraDESCCAFOBRA: TStringField;
    qryCafObraDTAINICIOOBRA: TDateTimeField;
    qryCafObraDTAENCERRAOBRA: TDateTimeField;
    qryCafObraFLGOBRA: TFloatField;
    qryCafObraDESCGRUPO: TStringField;
    qryCafObraDESCATIVPROJ: TStringField;
    qryCafObraNOMESUBCONTA: TStringField;
    qryCafObraIDMODULO: TFloatField;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    bbtnProcurar: TBitBtn;
    qrySomaLancObra: TwwQuery;
    dsSomaLancObra: TwwDataSource;
    qrySomaLancObraSOMAVALOFI: TFloatField;
    qrySelConjunto: TwwQuery;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    qrySelConjuntoDISPONIVEL: TFloatField;
    qrySelConjuntoALUGADO: TFloatField;
    dsSelConjunto: TwwDataSource;
    MSConjunto: TMontaSelect;
    qryRateio: TwwQuery;
    qryRateioCODCENTROCUSTO: TStringField;
    qryRateioDESCCCUSTO: TStringField;
    qryRateioPARTICIPACAO: TFloatField;
    dsRateio: TwwDataSource;
    MSAtivProjeto: TMontaSelect;
    MSSubConta: TMontaSelect;
    MSClasse: TMontaSelect;
    MSGrupos: TMontaSelect;
    qryBuscaGrupo: TwwQuery;
    qryBuscaGrupoIDGRUPO: TFloatField;
    qryPlaca: TwwQuery;
    qryPlacaPLACA: TFloatField;
    qryPlacaDESBEM: TStringField;
    qryParamCaf: TwwQuery;
    qryParamCafALUGUELINTERNO: TFloatField;
    qryParamCafSEQBEMEMP: TFloatField;
    qryParamCafEDITACODBEM: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamCafINTEGRACAP: TStringField;
    qryParamCafINTEGRACAR: TStringField;
    qryParamCafFLGCLSDESBEM: TFloatField;
    dsClasse: TwwDataSource;
    qrySelSituacao: TwwQuery;
    qrySelSituacaoDESCSITUACAO: TStringField;
    qrySelSituacaoIDSITUACAO: TFloatField;
    dsSituacao: TwwDataSource;
    qrySelGrupo: TwwQuery;
    qrySelGrupoNOME: TStringField;
    qrySelGrupoIDGRUPO: TFloatField;
    qrySelGrupoDEPRECIACAO: TFloatField;
    qrySelGrupoULTIDBEM: TFloatField;
    qrySelGrupoCLASSE: TStringField;
    dsGrupo: TwwDataSource;
    qrySelSubConta: TwwQuery;
    qrySelSubContaNOMESUBCONTA: TStringField;
    qrySelSubContaIDPESSOA: TFloatField;
    qrySelSubContaCODSUBCONTA: TFloatField;
    dsSubConta: TwwDataSource;
    qrySelAtivProj: TwwQuery;
    qrySelAtivProjNOME: TStringField;
    qrySelAtivProjUNECODIGO: TStringField;
    qrySelAtivProjUNIDNEGOC: TFloatField;
    qrySelAtivProjIDPESSOA: TFloatField;
    dsAtivProj: TwwDataSource;
    pgctlBem: TPageControl;
    TabConjunto: TTabSheet;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeDescConjunto: TDBMemo;
    dbgRateio: TwwDBGrid;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResponsavel: TwwDBEdit;
    Dock974: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInserir: TSpeedButton;
    sbtnPesquisar: TSpeedButton;
    TabIdent: TTabSheet;
    Label7: TLabel;
    Label9: TLabel;
    Label29: TLabel;
    edDescBem: TMemo;
    bbtnSelClasse: TBitBtn;
    edDescClasse: TwwDBEdit;
    TabContab: TTabSheet;
    Label12: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    bbtnSelGrupo: TBitBtn;
    edTaxaDep: TRealEdit;
    edDataInicioDep: TCMDateTimePicker;
    bbtnSelAtivProjeto: TBitBtn;
    bbtnSelSubConta: TBitBtn;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    Label10: TLabel;
    edPlaca: TMaskEdit;
    Label11: TLabel;
    edDataInclusao: TCMDateTimePicker;
    Label44: TLabel;
    bbtnGeraPlaca: TBitBtn;
    dbeValOfi: TwwDBEdit;
    bbtnEstornar: TBitBtn;
    qrySelBem: TwwQuery;
    qrySelClasse: TwwQuery;
    qrySelClasseIDCLASSEBEM: TFloatField;
    qrySelClasseCODHIERARQ: TStringField;
    qrySelClasseDESCRICAO: TStringField;
    qrySelClasseANASINT: TStringField;
    qrySelClasseMASCARAIDOPCIONAL: TStringField;
    cmbSituacao: TwwDBLookupCombo;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemUNIDNEGOC: TFloatField;
    qrySelBemCODSUBCONTA: TFloatField;
    qrySelBemIDTERCEIRO: TFloatField;
    qrySelBemIDCLASSEBEM: TFloatField;
    qrySelBemIDMODULO: TFloatField;
    qrySelBemIDITENSRECDEV: TFloatField;
    qrySelBemIDIMAGEM: TFloatField;
    qrySelBemIDFORNSERV: TFloatField;
    qrySelBemIDSITUACAO: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemIDGRUPO: TFloatField;
    qrySelBemREGISTRO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDTAINCLUSAO: TDateTimeField;
    qrySelBemDTANOTA: TDateTimeField;
    qrySelBemDATAINICIODEP: TDateTimeField;
    qrySelBemTAXADEP: TFloatField;
    qrySelBemPROPBAIXA: TFloatField;
    qrySelBemCONTROLE: TStringField;
    qrySelBemVALORG: TFloatField;
    qrySelBemVALFIS: TFloatField;
    qrySelBemDEPFIS: TFloatField;
    qrySelBemVALGER: TFloatField;
    qrySelBemDEPGER: TFloatField;
    qrySelBemVALDEPINI: TFloatField;
    qrySelBemNUMSERIE: TStringField;
    qrySelBemBAIXATOTAL: TStringField;
    qrySelBemIDNOTA: TStringField;
    qrySelBemCOMPLNOTA: TStringField;
    qrySelBemDEPLANC: TFloatField;
    qrySelBemCMDEP: TFloatField;
    qrySelBemCMBEM: TFloatField;
    qrySelBemDATAULTDEP: TDateTimeField;
    qrySelBemDATARECALCDEP: TDateTimeField;
    qrySelBemPLACA: TFloatField;
    qrySelBemVALHISTORICO: TFloatField;
    qrySelBemFLGDEPREC: TFloatField;
    qrySelBemPRIORIDADE: TFloatField;
    qrySelBemDATAINSTALACAO: TDateTimeField;
    qrySelBemDATATERMINOGAR: TDateTimeField;
    qrySelBemIDOPCIONAL: TStringField;
    qrySelBemFLGSAIDATEMP: TFloatField;
    qrySelBemPROCESSOAQUIS: TStringField;
    qrySelBemEMPENHOAQUIS: TStringField;
    qrySelBemPUBAUTOR: TStringField;
    qrySelBemPUBEDITORA: TStringField;
    qrySelBemPUBANO: TFloatField;
    qrySelBemFLGBEMINTCONTAB: TFloatField;
    qrySelBemDTACONTAB: TDateTimeField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemNOME: TStringField;
    qrySelBemFLGIMOVEL: TFloatField;
    qrySelBemDESCSITUACAO: TStringField;
    qrySelBemNOMECLASSE: TStringField;
    lblEncerrado: TfcLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnPesquisarClick(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure edDataInclusaoExit(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure qrySelGrupoAfterOpen(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnEstornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bIntegraContab : Boolean;
    procedure AbreObra(iCafObra : Integer);
    function  VerificaEntrada : Boolean;
    function  PlacaUnica(sPlaca : string) : boolean;
  end;

var
  frmMovEncerraObra: TfrmMovEncerraObra;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo,
     fCadConjunto, uComunsImobiliario;

{$R *.DFM}

procedure TfrmMovEncerraObra.FormCreate(Sender: TObject);
var
   sMascaraEmpresa, sMascaraGrupo,
   sCodPlaca                       : String;
   iAux                            : Integer;
   bEdPlaca                        : Boolean;
                                   
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   //-------------------------------------------------------------------------------------
   qryCafObra.Prepare;
   qrySomaLancObra.Prepare;
   qrySelConjunto.Prepare;
   qryRateio.Prepare;
   qrySelClasse.Prepare;
   qrySelSituacao.Prepare;
   qryPlaca.Prepare;
   qrySelGrupo.Prepare;
   qrySelSubConta.Prepare;
   qrySelAtivProj.Prepare;
   qryParamCaf.Prepare;
   //-------------------------------------------------------------------------------------
   qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryParamCaf.Open;
   qrySelSituacao.Open;
   //-------------------------------------------------------------------------------------
   sMascaraEmpresa := '';
   for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
   begin
      sMascaraEmpresa := sMascaraEmpresa + '9';
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   while pos('.',sMascaraGrupo) <> 0 do
   begin
      sMascaraGrupo := AtivoFixo.TiraCaracter(sMascaraGrupo,'.');
   end;
   //-------------------------------------------------------------------------------------
   // Seta Forma de geração de código da Placa do Bem
   //-------------------------------------------------------------------------------------
   bEdPlaca := (qryParamCafEDITACODBEM.AsFloat = 1);
   //-------------------------------------------------------------------------------------
   if (qryParamCAFSEQBEMEMP.AsFloat = 0) then {sequencial por empresa}
   begin
      sCodPlaca := 'E';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 1) then {sequencial por grupo}
   begin
      sCodPlaca := 'G';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 2) then {sequencial por classe}
   begin
      sCodPlaca := 'C';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 3) then {sequencial}
   begin
      sCodPlaca := 'S';
   end;
   //-------------------------------------------------------------------------------------
   edPlaca.EditMask := '999999999;0; ';
   if bEdPlaca then
   begin
      if (sCodPlaca = 'G') or (sCodPlaca = 'C') then
         edPlaca.EditMask := sMascaraGrupo + '.9999999;0; '
      else
      if (sCodPlaca = 'E') then
         edPlaca.EditMask := sMascaraEmpresa + '.999999999;0; ';
   end;
   //-------------------------------------------------------------------------------------
   bIntegraContab := qryParamCafINTEGRACONTAB.AsString = 'S';
   //-------------------------------------------------------------------------------------
   AbreObra(-1);
   pgctlBem.ActivePage := TabConjunto;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerraObra.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmMovEncerraObra.AbreObra(iCafObra : Integer);
begin
   bbtnConfirmar.Enabled := False;
   bbtnEstornar.Enabled  := False;
   bbtnCancelar.Enabled  := False;
   qryCafObra.Close;
   qryCafObra.ParamByName('PIDCAFOBRA').AsInteger  := iCafObra;
   qryCafObra.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qryCafObra.Open;
   qrySomaLancObra.Close;
   qrySomaLancObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
   qrySomaLancObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qrySomaLancObra.Open;
   //-------------------------------------------------------------------------------------
   if (qryCafObraFLGOBRA.AsInteger = 1) then
      lblEncerrado.Caption := 'Encerrado em ' + qryCafObraDTAENCERRAOBRA.AsString
   else
   if (qryCafObraFLGOBRA.AsInteger = 0) and (not qryCafObra.IsEmpty) then
      lblEncerrado.Caption := 'Em Aberto'
   else
      lblEncerrado.Caption := '';
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   qrySelBem.ParamByName('IDCAFOBRA').AsInteger := qryCafObraIDCAFOBRA.AsInteger;
   qrySelBem.ParamByName('IDPESSOA').AsInteger  := qryCafObraIDPESSOA.AsInteger;
   qrySelBem.Open;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBemIDCONJUNTO.AsInteger;
   qrySelConjunto.Open;
   qryRateio.Close;
   qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelBemIDPESSOA.AsInteger;
   qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelBemIDCONJUNTO.AsInteger;
   qryRateio.Open;
   //-------------------------------------------------------------------------------------
   qrySelClasse.Close;
   qrySelClasse.ParamByName('PIDCLASSEBEM').AsInteger := qrySelBemIDCLASSEBEM.AsInteger;
   qrySelClasse.Open;
   //-------------------------------------------------------------------------------------
   cmbSituacao.LookupValue := qrySelBemIDSITUACAO.AsString;
   cmbSituacao.Text        := qrySelBemDESCSITUACAO.AsString;
   //-------------------------------------------------------------------------------------
   edDescBem.Text      := qrySelBemDESBEM.AsString;
   edPlaca.Text        := qrySelBemPLACA.AsString;
   edDataInclusao.Date := qrySelBemDTAINCLUSAO.AsDateTime;
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
   qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qrySelBemIDGRUPO.AsInteger;
   qrySelGrupo.Open;
   //-------------------------------------------------------------------------------------
   edTaxaDep.Value := qrySelBemTAXADEP.AsFloat;
   edDataInicioDep.Date := qrySelBemDATAINICIODEP.AsDateTime;
   //-------------------------------------------------------------------------------------
   qrySelSubConta.Close;
   qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
   qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qrySelBemCODSUBCONTA.AsInteger;
   qrySelSubConta.Open;
   //-------------------------------------------------------------------------------------
   qrySelAtivProj.Close;
   qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := qrySelBemIDPESSOA.AsInteger;
   qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := qrySelBemUNIDNEGOC.AsInteger;
   qrySelAtivProj.Open;
   //-------------------------------------------------------------------------------------
   TabConjunto.Enabled := False;
   TabIdent.Enabled    := False;
   TabContab.Enabled   := False;
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
   begin
      AbreObra(StrToInt(MontaSelect.ValoresChave[0]));
      if qryCafObraFLGOBRA.AsInteger = 0 then
      begin
         bbtnConfirmar.Enabled := True;
         bbtnEstornar.Enabled  := False;
         bbtnCancelar.Enabled  := True;
         TabConjunto.Enabled   := True;
         TabIdent.Enabled      := True;
         TabContab.Enabled     := True;
      end else
      begin
         bbtnConfirmar.Enabled := False;
         bbtnEstornar.Enabled  := True;
         bbtnCancelar.Enabled  := True;
      end;
   end else
   begin
      AbreObra(-1);
      bbtnProcurar.SetFocus;
   end;
   pgctlBem.ActivePage := TabConjunto;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerraObra.sbtnInserirClick(Sender: TObject);
var
   iIdConjunto : Integer;

begin
   Application.CreateForm(TfrmCadConjunto,frmCadConjunto);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   iIdConjunto := frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').asInteger;
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iIdConjunto;
   qrySelConjunto.Open;
   qryRateio.Close;
   qryRateio.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
   qryRateio.Open;
   sbtnInserir.Down := False;
end;
//========================================================================================
procedure TfrmMovEncerraObra.sbtnPesquisarClick(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   qryRateio.Close;
   if MSConjunto.RetornouValor then
   begin
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryRateio.Open;
   end;
   Screen.Cursor := crDefault;
   sbtnPesquisar.Down := False;
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
   begin
      qrySelClasse.Close;
      qrySelClasse.ParamByName('PIDCLASSEBEM').AsInteger := StrToInt(MSClasse.ValoresChave[0]);
      qrySelClasse.Open;
   end;
   //-------------------------------------------------------------------------------------
   // Seleciona o Grupo Contábil
   //-------------------------------------------------------------------------------------
   qryBuscaGrupo.Close;
   qryBuscaGrupo.ParamByName('PIDLOCAL').AsInteger  := qrySelConjuntoIDLOCALIZACAO.AsInteger;
   qryBuscaGrupo.ParamByName('PIDCLASSE').AsInteger := qrySelClasseIDCLASSEBEM.AsInteger;
   qryBuscaGrupo.Open;
   if (not qryBuscaGrupo.IsEmpty) then
   begin
      qrySelGrupo.Close;
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qryBuscaGrupoIDGRUPO.AsInteger;
      qrySelGrupo.Open;
   end else
   begin
      qrySelGrupo.Close;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerraObra.edDataInclusaoExit(Sender: TObject);
begin
   inherited;
   if (edDataInicioDep.Text = '') then
   begin
      edDataInicioDep.Date := edDataInclusao.Date;
   end;
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSGrupos.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupos.RetornouValor then
   begin
      qrySelGrupo.Close;
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSSubConta.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSSubConta.RetornouValor then
   begin
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := StrToInt(MSSubConta.ValoresChave[0]);
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSAtivProjeto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSAtivProjeto.RetornouValor then
   begin
      qrySelAtivProj.Close;
      qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := StrToInt(MSAtivProjeto.ValoresChave[0]);
      qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qrySelAtivProj.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
function TfrmMovEncerraObra.PlacaUnica(sPlaca : string) : boolean;
var
   sPlacaAux : String;

begin
   Screen.Cursor := crSQLWait;
   sPlacaAux := sPlaca;
   //-------------------------------------------------------------------------------------
   while (pos('.',sPlacaAux) <> 0) do
   begin
      sPlacaAux := AtivoFixo.TiraCaracter(sPlacaAux,'.');
   end;
   //-------------------------------------------------------------------------------------
   if not qryPlaca.Prepared then
      qryPlaca.Prepare;
   //-------------------------------------------------------------------------------------
   qryPlaca.Close;
   qryPlaca.ParambyName('PPLACA').AsString := sPlacaAux;
   qryPlaca.Open;
   Result := qryPlaca.IsEmpty ;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovEncerraObra.qrySelGrupoAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if (not qrySelGrupo.IsEmpty) and (edTaxaDep.Value = 0) then
   begin
      edTaxaDep.Value := qrySelGrupoDEPRECIACAO.AsFloat;
   end;
end;
//========================================================================================
function TfrmMovEncerraObra.VerificaEntrada : Boolean;
begin
	 Result := False;
   try
      // Conjunto
      if (qrySelConjuntoIDCONJUNTO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar o Conjunto do Bem!', Dock973);
      // Classe
      if (qrySelClasseIDCLASSEBEM.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Classe do Bem!', bbtnSelClasse);
      // Situacao
      if (qrySelSituacaoIDSITUACAO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Situação do Bem!', cmbSituacao);
      // Descrição do Bem
      if (edDescBem.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a Descrição do Bem!', edDescBem);
      // Numero de Tombamento Patrimonial
      if (edPlaca.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar o Número de Tombamento Patrimonial do Bem!', edPlaca);
      if (not PlacaUnica(edPlaca.Text)) then
         Raise EValidacao.CreateVal('O Número de Tombamento Patrimonial do Bem deve ser exclusivo!', edPlaca);
      // Data de Inclusao
      if (edDataInclusao.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a Data de Entrada do Bem no patrimonio', edDataInclusao);
      // Valor Historico de Aquisição
      if (qrySomaLancObraSOMAVALOFI.AsFloat = 0) then
         Raise EValidacao.CreateVal('É necessário informar o custo total da obra', dbeValOfi);
      // Grupo
      if (qrySelGrupoIDGRUPO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Grupo do Bem!', bbtnSelGrupo);
      // Data de Inicio da Depreciação
      if (edDataInicioDep.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a data de inicio da depreciação do bem!', edDataInicioDep);
   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then
            MsgDlg(ev.message, 'Atenção', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         exit;
      end;
   end;
   Result := True;
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnConfirmarClick(Sender: TObject);
var
   iIdBem, iPlanilha : Integer;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if not VerificaEntrada then
      exit;
   //-------------------------------------------------------------------------------------
   iPlanilha := 0;
   iIdBem := AtivoFixo.ExecutaEncerraObra(Sistema.IdModulo,Sistema.IdEmpresa,
                                          qryCafObraIDCAFOBRA.AsInteger,
                                          qrySelConjuntoIDCONJUNTO.AsInteger,
                                          qrySelGrupoIDGRUPO.AsInteger,
                                          qrySelSubContaCODSUBCONTA.AsInteger,
                                          qrySelAtivProjUNIDNEGOC.AsInteger,
                                          qrySelClasseIDCLASSEBEM.AsInteger,
                                          strtofloat(edPlaca.Text),
                                          qrySelSituacaoIDSITUACAO.AsInteger,
                                          edDescBem.Text,edDataInclusao.Date,
                                          qrySomaLancObraSOMAVALOFI.AsCurrency,
                                          edDataInicioDep.Date,edTaxaDep.Value,
                                          iPlanilha,True);
   //-------------------------------------------------------------------------------------
   if iIdBem > 0 then
   begin
      MsgDlg('Encerramento Realizado!','Atenção',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Encerramento não Realizado!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   AbreObra(-1);
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnEstornarClick(Sender: TObject);
var
   iResult : Integer;
   
begin
   inherited;
   bbtnEstornar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   iResult := AtivoFixo.EstornaEncerraObra(Sistema.IdModulo, Sistema.IdEmpresa,
                                           qryCafObraIDCAFOBRA.AsInteger,
                                           qrySelBemIDBEM.AsInteger,
                                           qryCafObraDTAENCERRAOBRA.AsDateTime,
                                           qryCafObraDTAENCERRAOBRA.AsDateTime,True);
   //-------------------------------------------------------------------------------------
   if iResult > 0 then
   begin
      MsgDlg('Encerramento Estornado!','Atenção',mtInformation,[mbOk],0);
   end else
   begin
      MsgDlg('Encerramento não Estornado!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   AbreObra(-1);
end;
//========================================================================================
procedure TfrmMovEncerraObra.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   AbreObra(-1);
end;
//========================================================================================
procedure TfrmMovEncerraObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelConjunto.Close;
   qryRateio.Close;
   qrySelClasse.Close;
   qrySelSituacao.Close;
   qryPlaca.Close;
   qrySelGrupo.Close;
   qrySelSubConta.Close;
   qrySelAtivProj.Close;
   qryParamCaf.Close;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.UnPrepare;
   qryRateio.UnPrepare;
   qrySelClasse.UnPrepare;
   qrySelSituacao.UnPrepare;
   qryPlaca.UnPrepare;
   qrySelGrupo.UnPrepare;
   qrySelSubConta.UnPrepare;
   qrySelAtivProj.UnPrepare;
   qryParamCaf.UnPrepare;
   //-------------------------------------------------------------------------------------
   qryCafObra.Close;
   qrySomaLancObra.Close;
   qryCafObra.UnPrepare;
   qrySomaLancObra.UnPrepare;
end;

end.

