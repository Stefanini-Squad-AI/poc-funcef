unit fImpFCRT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Gauges, fcLabel, ComCtrls, Bde,
  BfDialogs, BrowseFolder, uProcuraDir, Wwtable;

type
  TfrmImpFCRT = class(TfrmOkCancelar)
    fcLabel1: TfcLabel;
    bbtnSelArqBens: TSpeedButton;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    lblPlaca: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryConjunto: TwwQuery;
    qryConjuntoIDCONJUNTO: TFloatField;
    qryConjuntoIDPESSOA: TFloatField;
    qryConjuntoIDRESPONSAVEL: TFloatField;
    qryConjuntoIDLOCALIZACAO: TFloatField;
    qryConjuntoDISPONIVEL: TFloatField;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoALUGADO: TFloatField;
    qryGrupo: TwwQuery;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoCLASSE: TStringField;
    qryGrupoTAXADEP: TFloatField;
    qryClasse: TwwQuery;
    qryClasseIDCLASSEBEM: TFloatField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseANASINT: TStringField;
    qryClasseDESCRICAO: TStringField;
    qryClasseIDGRUPO: TFloatField;
    qrySituacao: TwwQuery;
    qrySituacaoIDSITUACAO: TFloatField;
    qrySituacaoDESCSITUACAO: TStringField;
    qryParamCaf: TwwQuery;
    qryParamCafNUMDIASANO: TFloatField;
    qryParamCafIDPESSOA: TFloatField;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryFornec: TwwQuery;
    qryLocal: TwwQuery;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespFLGATIVOFIXO: TFloatField;
    qryInsConjunto: TwwQuery;
    qryInsRateio: TwwQuery;
    qryPlaca: TwwQuery;
    qryInsBem: TwwQuery;
    qryInsDeprecBem: TwwQuery;
    qryBem: TwwQuery;
    qryBemVALORG: TFloatField;
    qryBemCMBEM: TFloatField;
    qryBemDEPLANC: TFloatField;
    qryBemCMDEP: TFloatField;
    qryBemTAXADEP: TFloatField;
    qryBemIDBEM: TFloatField;
    qryBemIDPESSOA: TFloatField;
    qryBemDTAINCLUSAO: TDateTimeField;
    qryBemVALHISTORICO: TFloatField;
    qryBemFLGDEPREC: TFloatField;
    qryBemDATAULTDEP: TDateTimeField;
    qryBemPLACA: TFloatField;
    qryBemIDOPCIONAL: TStringField;
    qryBemDATAINICIODEP: TDateTimeField;
    qryBemBAIXATOTAL: TStringField;
    qryBemVALFIS: TFloatField;
    updBem: TUpdateSQL;
    qryInsDeprecReaval: TwwQuery;
    qryInsReavaliacao: TwwQuery;
    qryConjNovo: TwwQuery;
    qryConjNovoIDCONJUNTO: TFloatField;
    qrySubConta: TwwQuery;
    qrySubContaIDPESSOA: TFloatField;
    qrySubContaCODSUBCONTA: TFloatField;
    qryCotacao: TwwQuery;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoCOTDATA: TDateTimeField;
    qryCotacaoCOTVALOR: TFloatField;
    qryCotacaoCOTMESREF: TStringField;
    qryCotacaoTIPO: TStringField;
    opDlgTxt: TOpenDialog;
    qryBemPROPBAIXA: TFloatField;
    tblSaldos: TwwTable;
    pSelDir: TProcuraDirDlg;
    bbtnSelPasta: TBitBtn;
    edSelDir: TEdit;
    Label7: TLabel;
    eNomeArqBens: TEdit;
    qryEstornaValMov: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qryEstornaDepBem: TwwQuery;
    qryFornecIDPESSOA: TFloatField;
    tblSaldosENTIDADE: TStringField;
    tblSaldosPLACA: TStringField;
    tblSaldosDATASALDO: TDateField;
    tblSaldosVALORG: TFloatField;
    tblSaldosCMBEMMES: TFloatField;
    tblSaldosDEPMES: TFloatField;
    tblSaldosDEPACUM: TFloatField;
    tblSaldosCMDEPMES: TFloatField;
    tblSaldosVALFIS: TFloatField;
    tblSaldosDEPFIS: TFloatField;
    tblSaldosDEPFISMES: TFloatField;
    tblSaldosVIDAUTIL: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelArqBensClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure edSelDirChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sIdOpcional                  : String;
    sMensagem                    : String;
    //------------------------------------------------------------------------------------
    // Versão Texto
    //------------------------------------------------------------------------------------
    cSeparador                   : Char;
    ArqTextoBens, ArqTextoSaldos : TextFile;
    sLinha                       : String;
    //------------------------------------------------------------------------------------
    Procedure GeraConjunto(Var sIdConjunto, sDescConjunto : String;
                           dDataEnt : tDateTime);
    Procedure GeraRateioCustos(sIdConjunto : string; dDataEnt : tDateTime);
    Procedure GerarHistorico;
    function ExecutaBaixa(iIdBem,iIdPessoa,iIdModulo : Integer;
                          dDataMov : tDateTime;
                          fValOrg,fCmBem,fDepLanc,fCmDep : Extended) : boolean;
    procedure RegistraMovimentacaoInicial(iIdBem,iIdPessoa,iIdModulo : Integer;
                                          dDataMov : tDateTime;
                                          fValOrg, fCmBem, fDepLanc, fCmDep,
                                          fValFis, fDepFis : Extended);
    procedure RegistraMovimentacaoMensal(iIdBem,iIdPessoa,iIdModulo : Integer;
                                         dDataMov : tDateTime;
                                         fCmBem, fDepLanc, fDepFis : Extended);
  end;

  eExcessaoCAF = Class(Exception);

var
  frmImpFCRT: TfrmImpFCRT;

implementation

{$R *.DFM}

uses dBaseDados, uDataBase, uMensErro, uAtivoFixo, uSistema, dAtivoFixo, ComObj;

procedure TfrmImpFCRT.FormCreate(Sender: TObject);
begin
   inherited;
   qryInsBem.Prepare;
   qryInsConjunto.Prepare;
   qryInsRateio.Prepare;
   qryInsDeprecBem.Prepare;
   dtmAtivoFixo.qryRegistraMovimentacao.Prepare;
   dtmAtivoFixo.qryRegistraValorMovimentacao.Prepare;
   dtmAtivoFixo.qryRegistraBaixaBem.Prepare;
   //-------------------------------------------------------------------------------------
   qryBem.Prepare;
   qryGrupo.Prepare;
   qryClasse.Prepare;
   qryConjunto.Prepare;
   qrySituacao.Prepare;
   qryFornec.Prepare;
   qryLocal.Prepare;
   qryResp.Prepare;
   qryConjNovo.Prepare;
   qryPlaca.Prepare;
end;
//========================================================================================
procedure TfrmImpFCRT.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pSelDir.ShowPath := False;
   pSelDir.Caption := 'Pasta de Trabalho para Importação';
   pSelDir.Execute;
   edSelDir.Text := pSelDir.Directory;
end;
//========================================================================================
procedure TfrmImpFCRT.RegistraMovimentacaoInicial(iIdBem,iIdPessoa,iIdModulo : Integer;
                                                    dDataMov : tDateTime;
                                                    fValOrg, fCmBem, fDepLanc, fCmDep,
                                                    fValFis, fDepFis : Extended);
var
   iSeqHist : Integer;

begin
   iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, Sistema.IdModulo,
                                              01, dDataMov, -1,
                                              fValOrg, fValFis, fValFis,
                                              -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
   if iSeqHist = -1 then
      Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   //=====================================================================================
   if fDepLanc <> 0 then
   begin
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, Sistema.IdModulo,
                                                 17, dDataMov, -1,
                                                 fDepLanc, fDepFis, fDepFis,
                                                 dDataMov,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   end;
   //=====================================================================================
   if fCmBem <> 0 then
   begin
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, Sistema.IdModulo,
                                                 15, dDataMov, -1,
                                                 fCmBem, 0, 0,
                                                 dDataMov,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   end;
   //=====================================================================================
   if fCmDep <> 0 then
   begin
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, Sistema.IdModulo,
                                                 21, dDataMov, -1,
                                                 fCmDep, 0, 0,
                                                 dDataMov,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   end;
end;
//========================================================================================
procedure TfrmImpFCRT.RegistraMovimentacaoMensal(iIdBem,iIdPessoa,iIdModulo : Integer;
                                                 dDataMov : tDateTime;
                                                 fCmBem, fDepLanc, fDepFis : Extended);

var
   iSeqHist : Integer;

begin
   if fDepLanc <> 0 then
   begin
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, Sistema.IdModulo,
                                                 14, dDataMov, -1,
                                                 fDepLanc, fDepFis, fDepFis,
                                                 dDataMov,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   end;
   //-------------------------------------------------------------------------------------
   if fCmBem <> 0 then
   begin
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, Sistema.IdModulo,
                                                 15, dDataMov, -1,
                                                 fCmBem, 0, 0,
                                                 dDataMov,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
   end;
end;
//========================================================================================
function TfrmImpFCRT.ExecutaBaixa(iIdBem,iIdPessoa,iIdModulo : Integer;
                                  dDataMov : tDateTime;
                                  fValOrg,fCmBem,fDepLanc,fCmDep : Extended) : boolean;
var
   iSeqHist, iMotivoBaixa : Integer;

begin
   try
      dtmAtivoFixo.qryMotivoBaixa.Open;
      dtmAtivoFixo.qryMotivoBaixa.First;
      iMotivoBaixa := dtmAtivoFixo.qryMotivoBaixaIDMOTIVOBAIXA.AsInteger;
      dtmAtivoFixo.qryMotivoBaixa.Close;
      //----------------------------------------------------------------------------------
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, iIdModulo,
                                                 06, dDataMov, -1,
                                                 fValOrg, 0, 0,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 06');
      //----------------------------------------------------------------------------------
      if not AtivoFixo.RegistraBaixaBem(iSeqHist,iMotivoBaixa,100,
                                        'Baixa na Migração',0,True) then
         Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 06');
      //----------------------------------------------------------------------------------
      if (fCmBem <> 0) then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, iIdModulo,
                                                    25, dDataMov, -1,
                                                    fCmBem, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 25');
      end;
      //----------------------------------------------------------------------------------
      if (fDepLanc <> 0) then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, iIdModulo,
                                                    24, dDataMov, -1,
                                                    fDepLanc, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 24');
      end;
      //----------------------------------------------------------------------------------
      if (fCmDep <> 0) then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iIdPessoa, iIdModulo,
                                                    26, dDataMov, -1,
                                                    fCmDep, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',2,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 26');
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      Result := False;
   end;
end;
//========================================================================================
Procedure TfrmImpFCRT.GeraConjunto(Var sIdConjunto, sDescConjunto : String;
                                   dDataEnt : tDateTime);
begin
   if sIdConjunto = '' then
   begin
      sIdConjunto := inttostr(LeUltRegistro(nil,'CONJUNTO'));
   end;
   qryInsConjunto.ParamByName('IDCONJUNTO').AsString     := sIdConjunto;
   qryInsConjunto.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
   qryInsConjunto.ParamByName('IDLOCALIZACAO').AsInteger := qryLocalIDLOCALIZACAO.AsInteger;
   qryInsConjunto.ParamByName('IDRESPONSAVEL').AsInteger := qryLocalIDRESPONSAVEL.AsInteger;
   qryInsConjunto.ParamByName('DISPONIVEL').AsInteger    := 1;
   qryInsConjunto.ParamByName('DESCCONJUNTO').AsString   := sDescConjunto;
   qryInsConjunto.ParamByName('ALUGADO').AsInteger       := 0;
   qryInsConjunto.ExecSQL;
   //-------------------------------------------------------------------------------------
   GeraRateioCustos(sIdConjunto,dDataEnt);
end;
//========================================================================================
Procedure TfrmImpFCRT.GeraRateioCustos(sIdConjunto : string; dDataEnt : tDateTime);
begin
   qryInsRateio.ParamByName('IDCONJUNTO').AsString     := sIdConjunto;
   qryInsRateio.ParamByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
   qryInsRateio.ParamByName('CODCENTROCUSTO').AsString := qryLocalCODCENTROCUSTO.AsString;
   qryInsRateio.ParamByName('PARTICIPACAO').AsFloat    := 100;
   qryInsRateio.ParamByName('DTAINICIO').AsDateTime    := dDataEnt;
   qryInsRateio.ExecSQL;
end;
//========================================================================================
procedure TfrmImpFCRT.bbtnSelArqBensClick(Sender: TObject);
begin
   inherited;
   OpDlgTxt.Execute;
   eNomeArqBens.Text := OpDlgTxt.FileName;
end;
//========================================================================================
procedure TfrmImpFCRT.bbtnConfirmarClick(Sender: TObject);
var
   ExcelApp, xBens                                           : Variant;
   sIdConjunto, sIdResponsavel, sIdLocalizacao,sIdSituacao,
   sIdClasse, sIdGrupo, sIdFornServ,
   sDesBem, sValFis, sTaxaDep, sPlaca, sValHistorico,
   sIdNota, sComplNota, sDataInclusao                        : String;
   iIdEmpresa, iIdBem, ixBens                                : Integer;
   fDate                                                     : FMTDate;

begin
   sMensagem := '';
   //-------------------------------------------------------------------------------------
   // Selecione uma Pasta de Trabalho onde estão as tabelas base e onde serão gerados
   // os arquivos de resultado e log
   //-------------------------------------------------------------------------------------
   if edSelDir.Text = '' then
   begin
      msgdlg('Selecione uma Pasta de Trabalho onde estão as tabelas base e onde serão ' +
             'gerados os arquivos de resultado e log.', 'Erro', mtError, [mbOk], 0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Cria um alias temporário no local onde estão as tabelas base
   //-------------------------------------------------------------------------------------
   with Session do
   begin
      ConfigMode := cmSession;
      try
         AddStandardAlias('CAF', edSelDir.Text, 'DBASE');
      finally
         ConfigMode := cmAll;
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
   // Specifies date separator character
   fDate.szDateSeparator := '/';
   // Date format. 0 = MDY, 1 = DMY, 2 = YMD
   fDate.iDateMode := 1;
   // If TRUE, write year as four digits
   fDate.bFourDigitYear := True;
   // On input add 1900 to year if True
   fDate.bYearBiased := True;
   // Month displayed with a leading zero if True
   fDate.bMonthLeadingZero := True;
   //. Day displayed with leading zero if True
   fDate.bDayLeadingZero := True;
   Check(DbiSetDateFormat(fDate));
   //-------------------------------------------------------------------------------------
   //cSeparador := DecimalSeparator;
   //DecimalSeparator := '.';
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Preparando a Planilha de Importação...';
   prgBar.Progress   := 0;
   lblPlaca.Caption  := '';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   ExcelApp := CreateOleObject('Excel.Application');
   ExcelApp.Workbooks.Open(eNomeArqBens.Text);
   xBens    := ExcelApp.Workbooks[1].WorkSheets['Bens'];
   //-------------------------------------------------------------------------------------
   prgbar.MaxValue := xBens.UsedRange.Rows.Count - 1;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   StartTransacao;
   try
      ixBens := 2;
      while ixBens <= xBens.UsedRange.Rows.Count do
      begin
         lblStatus.Caption := 'Cadastro Placa FCRT ' + trim(xBens.Cells[ixBens,1]);
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iIdEmpresa      := Sistema.IdEmpresa;
         sPlaca          := trim(xBens.Cells[ixBens,1]);
         if sPlaca = '' then
         begin
            ixBens := ixBens + 1;
            Continue;
         end;
         sDesBem         := trim(xBens.Cells[ixBens,2]);
         sIdGrupo        := trim(xBens.Cells[ixBens,3]);
         sIdClasse       := trim(xBens.Cells[ixBens,4]);
         sIdSituacao     := trim(xBens.Cells[ixBens,5]);
         sIdLocalizacao  := trim(xBens.Cells[ixBens,6]);
         sIdResponsavel  := trim(xBens.Cells[ixBens,7]);
         sIdFornServ     := trim(xBens.Cells[ixBens,8]);
         sDataInclusao   := trim(xBens.Cells[ixBens,11]);
         sValHistorico   := trim(xBens.Cells[ixBens,12]);
         sIdNota         := trim(xBens.Cells[ixBens,13]);
         sTaxaDep        := trim(xBens.Cells[ixBens,14]);
         sValFis         := trim(xBens.Cells[ixBens,15]);
         //*******************************************************************************
         // CM
         //*******************************************************************************
         //SIDGRUPO        := '33';
         //SIDCLASSE       := '2';
         //SIDSITUACAO     := '2';
         //SIDLOCALIZACAO  := '32';
         //SIDRESPONSAVEL  := '337';
         sIdFornServ := '';
         //*******************************************************************************
         // FCRT-CM
         //*******************************************************************************
         //SIDGRUPO        := '83';
         //SIDCLASSE       := '2';
         //SIDSITUACAO     := '2';
         //SIDLOCALIZACAO  := '55';
         //SIDRESPONSAVEL  := '10051';
         //-------------------------------------------------------------------------------
         // LOCALIZAÇÃO
         //-------------------------------------------------------------------------------
         sMensagem := 'Localização';
         qryLocal.Close;
         qryLocal.ParamByName('PIDPESSOA').AsInteger := iIdEmpresa;
         qryLocal.ParamByName('PIDLOCAL').AsString   := sIdLocalizacao;
         qryLocal.Open;
         if qryLocal.IsEmpty then
         begin
            MsgDlg('O Bem com a Placa No. ' + sPlaca + ' está com o código '+
                   'de Localizacao inválido ou inexistente','Erro', mtError, [mbOk], 0);
            Raise eExcessaoCAF.Create('Importação de Bens : Localização');
         end;
         //-------------------------------------------------------------------------------
         // CLASSE
         //-------------------------------------------------------------------------------
         sMensagem := 'Classe de Bens';
         qryClasse.Close;
         qryClasse.ParamByName('PIDCLASSE').AsString := sIdClasse;
         qryClasse.Open;
         if qryClasse.IsEmpty then
         begin
            MsgDlg('O Bem com a Placa No. ' + sPlaca + ' está com o código '+
                   'da Classe inválido ou inexistente','Erro', mtError, [mbOk], 0);
            Raise eExcessaoCAF.Create('Importação : Classe');
         end;
         //-------------------------------------------------------------------------------
         // GRUPO
         //-------------------------------------------------------------------------------
         sMensagem := 'Grupo Contábil';
         qryGrupo.Close;
         qryGrupo.ParamByName('PIDGRUPO').AsString := sIdGrupo;
         qryGrupo.Open;
         if qryGrupo.IsEmpty then
         begin
            MsgDlg('O Bem com a Placa No. ' + sPlaca + ' está com o código '+
                   'do Grupo inválido ou inexistente','Erro', mtError, [mbOk], 0);
            Raise eExcessaoCAF.Create('Importação : Grupo');
         end;
         //-------------------------------------------------------------------------------
         // PROCESSA O NOVO NÚMERO DE PLACA
         //-------------------------------------------------------------------------------
         sMensagem := 'IdOpcional, Placa e DesBem';
         sIdOpcional := sPlaca;
         sPlaca := qryGrupoCLASSE.AsString + copy(sPlaca,3,length(sPlaca));
         sPlaca := copy(sPlaca,1,pos('.',sPlaca)-1) + copy(sPlaca,pos('.',sPlaca)+1,length(sPlaca)-pos('.',sPlaca));
         sDesBem := sDesBem + ' - ' + sIdOpcional;
         //-------------------------------------------------------------------------------
         // SITUACAO
         //-------------------------------------------------------------------------------
         sMensagem := 'Situação';
         qrySituacao.Close;
         qrySituacao.ParamByName('PIDSITUACAO').AsString := sIdSituacao;
         qrySituacao.Open;
         if qrySituacao.IsEmpty then
         begin
            MsgDlg('O Bem com a Placa No. ' + sPlaca + ' está com o código '+
                   'da Situação Física inválido ou inexistente',
                   'Erro', mtError, [mbOk], 0);
            Raise eExcessaoCAF.Create('Importação : Situação');
         end;
         //-------------------------------------------------------------------------------
         // FORNSERV
         //-------------------------------------------------------------------------------
         sMensagem := 'Fornecedor';
         if (sIdFornServ <> '') then
         begin
            if qryFornec.Active then qryFornec.Close;
            qryFornec.ParamByName('PIDFORNSERV').AsString := sIdFornServ;
            qryFornec.Open;
            sMensagem := 'Fornecedor ' + sIdFornServ;
            if qryFornec.IsEmpty then
            begin
               MsgDlg('O Bem com a Placa No. ' + sPlaca + ' não possue o fornecedor ' +
                      'informado','Erro', mtError, [mbOk], 0);
               Raise eExcessaoCAF.Create('Importação de Bens : Fornecedores');
            end;
         end;
         //-------------------------------------------------------------------------------
         // CONJUNTO
         //-------------------------------------------------------------------------------
         sMensagem := 'Conjunto';
         qryConjunto.Close;
         qryConjunto.ParamByName('PIDLOCAL').AsString  := sIdLocalizacao;
         qryConjunto.ParamByName('PDESCCONJ').AsString := sDesBem;
         qryConjunto.Open;
         if qryConjunto.IsEmpty then
         begin
            sIdConjunto := '';
            GeraConjunto(sIdConjunto,sDesBem,strtodate(sDataInclusao));
         end else
         begin
            sIdConjunto := qryConjuntoIDCONJUNTO.AsString;
         end;
         //-------------------------------------------------------------------------------
         // Gravação
         //-------------------------------------------------------------------------------
         sMensagem := 'Gravando BEM';
         iIdBem := LeUltRegistro(nil,'BEM');
         qryInsBem.ParamByName('PIDBEM').AsInteger       := iIdBem;
         qryInsBem.ParamByName('PIDPESSOA').AsInteger    := iIdEmpresa;
         qryInsBem.ParamByName('PIDCONJUNTO').AsInteger  := strtoint(sIdConjunto);
         qryInsBem.ParamByName('PIDGRUPO').AsInteger     := strtoint(sIdGrupo);
         qryInsBem.ParamByName('PIDMODULO').AsInteger    := Sistema.IdModulo;
         qryInsBem.ParamByName('PIDCLASSEBEM').AsInteger := strtoint(sIdClasse);
         qryInsBem.ParamByName('PIDSITUACAO').AsInteger  := strtoint(sIdSituacao);
         if sIdFornServ = '' then
         begin
            qryInsBem.ParamByName('PIDFORNSERV').Clear;
         end else
         begin
            qryInsBem.ParamByName('PIDFORNSERV').AsInteger  := strtoint(sIdFornServ);
         end;
         qryInsBem.ParamByName('PREGISTRO').AsString        := 'I';
         qryInsBem.ParamByName('PCONTROLE').AsString        := 'T';
         qryInsBem.ParamByName('PPLACA').AsFloat            := strtofloat(sPlaca);
         qryInsBem.ParamByName('PDESBEM').AsString          := sDesBem;
         qryInsBem.ParamByName('PDATAINICIODEP').AsDateTime := strtodate(sDataInclusao);
         qryInsBem.ParamByName('PDATAULTDEP').AsDateTime    := strtodate(sDataInclusao);
         qryInsBem.ParamByName('PDTAINCLUSAO').AsDateTime   := strtodate(sDataInclusao);
         qryInsBem.ParamByName('PTAXADEP').AsFloat          := strtofloat(sTaxaDep);
         qryInsBem.ParamByName('PVALHISTORICO').AsCurrency  := strtofloat(sValHistorico);
         qryInsBem.ParamByName('PVALORG').AsCurrency        := strtofloat(sValHistorico);
         qryInsBem.ParamByName('PCMBEM').AsCurrency         := 0;
         qryInsBem.ParamByName('PVALFIS').AsCurrency        := strtofloat(sValFis);
         qryInsBem.ParamByName('PVALGER').AsCurrency        := strtofloat(sValFis);
         qryInsBem.ParamByName('PVALDEPINI').AsCurrency     := 0;
         qryInsBem.ParamByName('PDEPLANC').AsCurrency       := 0;
         qryInsBem.ParamByName('PDEPFIS').AsCurrency        := 0;
         qryInsBem.ParamByName('PDEPGER').AsCurrency        := 0;
         qryInsBem.ParamByName('PCMDEP').AsCurrency         := 0;
         qryInsBem.ParamByName('PBAIXATOTAL').AsString      := 'N';
         qryInsBem.ParamByName('PPROPBAIXA').AsFloat        := 0;
         qryInsBem.ParamByName('PFLGDEPREC').AsInteger      := 0;
         qryInsBem.ParamByName('PIDNOTA').AsString          := sIdNota;
         qryInsBem.ParamByName('PCOMPLNOTA').AsString       := sComplNota;
         qryInsBem.ParamByName('PDTANOTA').AsDateTime       := strtodate(sDataInclusao);
         qryInsBem.ParamByName('PNUMSERIE').Clear ;
         qryInsBem.ParamByName('PIDOPCIONAL').AsString      := sIdOpcional;
         qryInsBem.ParamByName('PPROCESSOAQUIS').AsString   := 'CARGA FCRT';
         qryInsBem.ExecSQL;
         //-------------------------------------------------------------------------------
         ixBens := ixBens + 1;
      end;
      //----------------------------------------------------------------------------------
      // Gerar os Históricos, a partir do arquivo de saldos fornecido
      //----------------------------------------------------------------------------------
      ExcelApp.Workbooks.Close;
      ExcelApp := Unassigned;
      CommitTransacao;
      //----------------------------------------------------------------------------------
      StartTransacao;
      GerarHistorico;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Gravando dados no Banco ...';
      prgBar.MaxValue := 1;
      prgBar.Progress := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Gravação Concluída.';
      prgBar.Progress := 1;
      Application.ProcessMessages;
      Msgdlg('Migração Terminada!','Informação',mtInformation,[mbOk],0);
   except
      ExcelApp.Workbooks.Close;
      ExcelApp := Unassigned;
      RollBackTransacao;
      Msgdlg('ATENÇÃO ! VERIFIQUE O BEM Placa No. ' + sIdOpcional + #13 + sMensagem + #13 +
             'Importação Abortada.','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   tblSaldos.Close;
   pnlStatus.Visible := False;
   Application.ProcessMessages;
   //DecimalSeparator := cSeparador;
   //-------------------------------------------------------------------------------------
   // Remove alias temporário
   //-------------------------------------------------------------------------------------
   with Session do
   begin
      ConfigMode := cmSession;
      try
         DeleteAlias('CAF');
      finally
         ConfigMode := cmAll;
      end;
   end;
end;
//========================================================================================
procedure TfrmImpFCRT.GerarHistorico;
var
   sDataMov,sValOrg,sCmBemMes,
   sDepLancMes,sDepLancAcum,
   sValFis,sDepFisMes,sDepFisAcum         : String;
   bMovIni                                : Boolean;

begin
   sMensagem := 'Iniciando Tabela BEM...';
   lblStatus.Caption := sMensagem;
   prgbar.MaxValue   := 100;
   prgBar.Progress   := 0;
   lblPlaca.Caption  := '';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryBem.Open;
   prgBar.Progress   := 100;
   //-------------------------------------------------------------------------------------
   sMensagem := 'Iniciando Tabela de SALDOS FCRT...';
   lblStatus.Caption := sMensagem;
   prgbar.MaxValue   := 100;
   prgBar.Progress   := 0;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   tblSaldos.Close;
   tblSaldos.Open;
   prgBar.Progress   := 100;
   //-------------------------------------------------------------------------------------
   sMensagem         := 'Gerando Movimentação dos Bens...';
   lblStatus.Caption := sMensagem;
   prgbar.MaxValue   := qryBem.RecordCount;
   prgBar.Progress   := 0;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   while not qryBem.Eof do
   begin
      lblStatus.Caption := 'Movimentação Placa FCRT ' + qryBemIDOPCIONAL.AsString;
      prgBar.Progress := prgBar.Progress + 1;
      Application.ProcessMessages;
      sIdOpcional := qryBemIDOPCIONAL.AsString;
      //----------------------------------------------------------------------------------
      if tblSaldosPLACA.AsString <> qryBemIDOPCIONAL.AsString then
         if not tblSaldos.FindKey([qryBemIDOPCIONAL.AsString]) then
         begin
            qryBem.Next;
            Continue;
         end;
      //----------------------------------------------------------------------------------
      // Processa o histórico de um bem
      //----------------------------------------------------------------------------------
      bMovIni := True;
      while (not tblSaldos.EOF) and (tblSaldosPLACA.AsString = qryBemIDOPCIONAL.AsString) do
      begin
         sDataMov     := tblSaldosDATASALDO.AsString;
         sValOrg      := tblSaldosVALORG.AsString;
         sCmBemMes    := tblSaldosCMBEMMES.AsString;
         sDepLancMes  := tblSaldosDEPMES.AsString;
         sDepLancAcum := tblSaldosDEPACUM.AsString;
         sValFis      := tblSaldosVALFIS.AsString;
         sDepFisAcum  := tblSaldosDEPFIS.AsString;
         sDepFisMes   := tblSaldosDEPFISMES.AsString;
         //-------------------------------------------------------------------------------
         if sValOrg      = '' then sValOrg      := '0';
         if sCmBemMes    = '' then sCmBemMes    := '0';
         if sDepLancMes  = '' then sDepLancMes  := '0';
         if sDepLancAcum = '' then sDepLancAcum := '0';
         if sValFis      = '' then sValFis      := '0';
         if sDepFisAcum  = '' then sDepFisAcum  := '0';
         if sDepFisMes   = '' then sDepFisMes   := '0';
         //-------------------------------------------------------------------------------
         if bMovIni then // Movimentação Inicial
         begin
            RegistraMovimentacaoInicial(qryBemIDBEM.AsInteger,
                                        qryBemIDPESSOA.AsInteger,
                                        Sistema.IDModulo,
                                        strtodate(sDataMov),
                                        strtofloat(sValOrg),0,strtofloat(sDepLancAcum),0,
                                        strtofloat(sValFis),strtofloat(sDepFisAcum));
            //----------------------------------------------------------------------------
            bMovIni := False;
         end else
         begin
            //----------------------------------------------------------------------------
            // Processa DEPRECIAÇÃO
            //----------------------------------------------------------------------------
            if strtofloat(sDepLancMes) <> 0 then
            begin
               RegistraMovimentacaoMensal(qryBemIDBEM.AsInteger,
                                          qryBemIDPESSOA.AsInteger,
                                          Sistema.IDModulo,
                                          strtodate(sDataMov),
                                          strtofloat(sCmBemMes),
                                          strtofloat(sDepLancMes),
                                          strtofloat(sDepFisMes));
               //-------------------------------------------------------------------------
               // Lança no cadastro de bens
               //-------------------------------------------------------------------------
               qryBem.Edit;
               qryBemDEPLANC.AsCurrency := qryBemDEPLANC.AsCurrency + strtofloat(sDepLancMes);
               qryBem.Post;
               qryBem.ApplyUpdates;
            end;
            //----------------------------------------------------------------------------
            // Processa BAIXA
            //----------------------------------------------------------------------------
            if strtofloat(sValOrg) = 0 then
            begin
               if not ExecutaBaixa(qryBemIDBEM.AsInteger,
                                   qryBemIDPESSOA.AsInteger,
                                   Sistema.IdModulo,strtodate(sDataMov),
                                   qryBemVALORG.AsFloat,
                                   qryBemCMBEM.AsFloat,
                                   qryBemDEPLANC.AsFloat,
                                   qryBemCMDEP.AsFloat) then
                  Raise eExcessaoCAF.Create('Importação : ExecutaBaixa');
            end;
            //----------------------------------------------------------------------------
            // Atualiza CADASTRO BEM
            //----------------------------------------------------------------------------
            qryBem.Edit;
            qryBemVALORG.AsCurrency  := strtofloat(sValOrg);
            qryBemDEPLANC.AsCurrency := strtofloat(sDepLancAcum);
            if strtofloat(sDepLancMes) <> 0 then
            begin
               qryBemDATAULTDEP.AsDateTime := strtodate(sDataMov);
               qryBemFLGDEPREC.AsInteger   := 0;
            end;
            if strtofloat(sValOrg) = strtofloat(sDepLancAcum) then
            begin
               if strtofloat(sValOrg) <> 0 then
               begin
                  qryBemFLGDEPREC.AsInteger := 1
               end else
               begin
                  qryBemBAIXATOTAL.AsString := 'S';
                  qryBemPROPBAIXA.AsFloat := 100;
               end;
            end;
            qryBem.Post;
            qryBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         tblSaldos.Next;
      end;
      qryBem.Next;
   end;
   tblSaldos.Close;
   qryBem.Close;
end;
//========================================================================================
procedure TfrmImpFCRT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   StartTransacao;
   try
      with dtmAtivoFixo do
      begin
         lblStatus.Caption := 'Removendo Lançamentos de Baixa ...';
         lblPlaca.Caption  := '';
         prgBar.MaxValue   := 1;
         prgBar.Progress   := 0;
         pnlStatus.Visible := True;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO '+
                            ' FROM   HISTORICOMOVIMENTACAO HM,' +
                            '        BEM B' +
                            ' WHERE (B.PROCESSOAQUIS = ' + #39 + 'CARGA FCRT' + #39 + ')' +
                            '   AND (HM.IDBEM = B.IDBEM)';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            qryEstornaBaixaBem.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaBaixaBem.ExecSQL;
            Application.ProcessMessages;
            qryAux.Next;
         end;
         qryAux.Close;
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Removendo Lançamentos de Historico ...';
         prgBar.MaxValue   := 1;
         prgBar.Progress   := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO '+
                            '                          FROM   HISTORICOMOVIMENTACAO HM,' +
                            '                                 BEM B' +
                            '                          WHERE (B.PROCESSOAQUIS = ' + #39 + 'CARGA FCRT' + #39 + ')' +
                            '                            AND (HM.IDBEM = B.IDBEM))';
         qryAux.ExecSQL;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Removendo Rateios de Custos ...';
         prgBar.MaxValue   := 1;
         prgBar.Progress   := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM RATEIODEPRECIACAO ' +
                            ' WHERE IDCONJUNTO IN (SELECT IDCONJUNTO '+
                            '                      FROM   BEM' +
                            '                      WHERE (PROCESSOAQUIS = ' + #39 + 'CARGA FCRT' + #39 + '))';
         qryAux.ExecSQL;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Removendo Conjuntos ...';
         prgBar.MaxValue   := 1;
         prgBar.Progress   := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' UPDATE CONJUNTO ' +
                            ' SET ALUGADO = 1 ' +
                            ' WHERE IDCONJUNTO IN (SELECT IDCONJUNTO '+
                            '                      FROM   BEM' +
                            '                      WHERE (PROCESSOAQUIS = ' + #39 + 'CARGA FCRT' + #39 + '))';
         qryAux.ExecSQL;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Removendo Saldos Contábeis dos Bens ...';
         prgBar.MaxValue   := 1;
         prgBar.Progress   := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM SALDOCONTABBEM ' +
                            ' WHERE (IDBEM IN (SELECT IDBEM '+
                            '                  FROM   BEM' +
                            '                  WHERE (PROCESSOAQUIS = ' + #39 + 'CARGA FCRT' + #39 + ')))';
         qryAux.ExecSQL;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Removendo Bens ...';
         prgBar.MaxValue   := 1;
         prgBar.Progress   := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM BEM ' +
                            ' WHERE (PROCESSOAQUIS = ' + #39 + 'CARGA FCRT' + #39 + ')';
         qryAux.ExecSQL;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryAux.SQL.Text := ' DELETE FROM CONJUNTO ' +
                            ' WHERE ALUGADO = 1';
         qryAux.ExecSQL;
         Application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Gravando ...';
      prgBar.MaxValue   := 1;
      prgBar.Progress   := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      msgdlg('Estorno Concluído!','Informação',mtInformation,[mbOk],0);
   except
      RollBackTransacao;
      msgdlg('Estorno Cancelado.','Erro',mtError,[mbOk],0);
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmImpFCRT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryInsBem.UnPrepare;
   qryInsConjunto.UnPrepare;
   qryInsRateio.UnPrepare;
   qryInsDeprecBem.UnPrepare;
   qryInsBem.UnPrepare;
   qryInsConjunto.UnPrepare;
   qryInsRateio.UnPrepare;
   qryInsDeprecBem.UnPrepare;
   dtmAtivoFixo.qryRegistraMovimentacao.UnPrepare;
   dtmAtivoFixo.qryRegistraValorMovimentacao.UnPrepare;
   dtmAtivoFixo.qryRegistraBaixaBem.UnPrepare;
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryGrupo.Close;
   qryClasse.Close;
   qryConjunto.Close;
   qrySituacao.Close;
   qryFornec.Close;
   qryLocal.Close;
   qryResp.Close;
   qryConjNovo.Close;
   qryPlaca.Close;
   qryBem.UnPrepare;
   qryGrupo.UnPrepare;
   qryClasse.UnPrepare;
   qryConjunto.UnPrepare;
   qrySituacao.UnPrepare;
   qryFornec.UnPrepare;
   qryLocal.UnPrepare;
   qryResp.UnPrepare;
   qryConjNovo.UnPrepare;
   qryPlaca.UnPrepare;
end;
//========================================================================================
procedure TfrmImpFCRT.edSelDirChange(Sender: TObject);
begin
   inherited;
   opDlgTxt.InitialDir := edSelDir.Text;
end;

end.
