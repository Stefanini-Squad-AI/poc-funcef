unit fReferLancReaval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwquery, TREdit, wwdblook,
  Gauges, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmReferLancReaval = class(TfrmOkCancelar)
    qryImoMestre: TwwQuery;
    qryImoveis: TwwQuery;
    qryImovelMestre : TwwQuery;
    Label5: TLabel;
    edDataReaval: TCMDateTimePicker;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    Label6: TLabel;
    cmbImovelMestre: TwwDBLookupCombo;
    Label7: TLabel;
    cmbGrupo: TwwDBLookupCombo;
    Label1: TLabel;
    edValLaudo: TRealEdit;
    edVidaUtil: TRealEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label48: TLabel;
    edObsReav: TMemo;
    qryImoReavaliacao: TwwQuery;
    updImoReavaliacao: TUpdateSQL;
    qryImoMestreVALCUSTO: TFloatField;
    qryImoMestreVALDEPREC: TFloatField;
    qryImoMestreVALCTB: TFloatField;
    qryImoveisPLACA: TFloatField;
    qryImoveisIDBEM: TFloatField;
    qryImoveisIDPESSOA: TFloatField;
    qryImoveisIDGRUPO: TFloatField;
    qryImoveisVALORG: TFloatField;
    qryImoveisCMBEM: TFloatField;
    qryImoveisDEPLANC: TFloatField;
    qryImoveisTAXADEP: TFloatField;
    qryImoveisVALCUSTO: TFloatField;
    qryImoveisVALDEPREC: TFloatField;
    qryImoveisVALCTB: TFloatField;
    qryMovBem: TwwQuery;
    qryMovBemVALOFI: TFloatField;
    qryMovBemTAXADEP: TFloatField;
    qryMovBemIDREAVALIACAO: TFloatField;
    updEditReaval: TUpdateSQL;
    qryEditReaval: TwwQuery;
    updImoBem: TUpdateSQL;
    qryUltMov: TwwQuery;
    qryUltMovDATAULTMOV: TDateTimeField;
    qryImoBem: TwwQuery;
    qryImoBemIDBEM: TFloatField;
    qryImoBemIDPESSOA: TFloatField;
    qryImoBemIDCONJUNTO: TFloatField;
    qryImoBemIDTERCEIRO: TFloatField;
    qryImoBemIDGRUPO: TFloatField;
    qryImoBemCODSUBCONTA: TFloatField;
    qryImoBemIDCLASSEBEM: TFloatField;
    qryImoBemIDMODULO: TFloatField;
    qryImoBemIDITENSRECDEV: TFloatField;
    qryImoBemIDFORNSERV: TFloatField;
    qryImoBemIDSITUACAO: TFloatField;
    qryImoBemIDIMAGEM: TFloatField;
    qryImoBemREGISTRO: TStringField;
    qryImoBemCONTROLE: TStringField;
    qryImoBemPLACA: TFloatField;
    qryImoBemDESBEM: TStringField;
    qryImoBemIDNOTA: TStringField;
    qryImoBemCOMPLNOTA: TStringField;
    qryImoBemDTANOTA: TDateTimeField;
    qryImoBemNUMSERIE: TStringField;
    qryImoBemDTAINCLUSAO: TDateTimeField;
    qryImoBemVALHISTORICO: TFloatField;
    qryImoBemVALORG: TFloatField;
    qryImoBemCMBEM: TFloatField;
    qryImoBemVALFIS: TFloatField;
    qryImoBemVALGER: TFloatField;
    qryImoBemDATAINICIODEP: TDateTimeField;
    qryImoBemVALDEPINI: TFloatField;
    qryImoBemTAXADEP: TFloatField;
    qryImoBemDEPLANC: TFloatField;
    qryImoBemCMDEP: TFloatField;
    qryImoBemDEPFIS: TFloatField;
    qryImoBemDEPGER: TFloatField;
    qryImoBemDATAULTDEP: TDateTimeField;
    qryImoBemDATARECALCDEP: TDateTimeField;
    qryImoBemFLGDEPREC: TFloatField;
    qryImoBemPROPBAIXA: TFloatField;
    qryImoBemBAIXATOTAL: TStringField;
    qryImoBemIDOPCIONAL: TStringField;
    qryImoBemUNIDNEGOC: TFloatField;
    qryImoBemPROCESSOAQUIS: TStringField;
    qryImoBemEMPENHOAQUIS: TStringField;
    qryImoBemPUBAUTOR: TStringField;
    qryImoBemPUBEDITORA: TStringField;
    qryImoBemPUBANO: TFloatField;
    Label4: TLabel;
    edValDep: TRealEdit;
    Label8: TLabel;
    dblkcmbImovel: TwwDBLookupCombo;
    qryImovel: TwwQuery;
    qryImovelIDIMOVEL: TFloatField;
    qryImovelIMENOME: TStringField;
    qryImovelMestreIDIMOVEL: TFloatField;
    qryImovelMestreIMENOME: TStringField;
    qryImoReavaliacaoIDREAVALIACAO: TFloatField;
    qryImoReavaliacaoIDBEM: TFloatField;
    qryImoReavaliacaoIDPESSOA: TFloatField;
    qryImoReavaliacaoIDMOVIMENTACAO: TFloatField;
    qryImoReavaliacaoDATAREAVALIACAO: TDateTimeField;
    qryImoReavaliacaoVALORG: TFloatField;
    qryImoReavaliacaoCMBEM: TFloatField;
    qryImoReavaliacaoVALFIS: TFloatField;
    qryImoReavaliacaoVALGER: TFloatField;
    qryImoReavaliacaoDEPLANC: TFloatField;
    qryImoReavaliacaoCMDEP: TFloatField;
    qryImoReavaliacaoDEPFIS: TFloatField;
    qryImoReavaliacaoDEPGER: TFloatField;
    qryImoReavaliacaoDATAULTDEP: TDateTimeField;
    qryImoReavaliacaoFLGDEPREC: TFloatField;
    qryImoReavaliacaoTAXADEP: TFloatField;
    qryImoReavaliacaoFLGULTREAVAL: TFloatField;
    qryEditReavalIDREAVALIACAO: TFloatField;
    qryEditReavalIDBEM: TFloatField;
    qryEditReavalIDPESSOA: TFloatField;
    qryEditReavalIDMOVIMENTACAO: TFloatField;
    qryEditReavalDATAREAVALIACAO: TDateTimeField;
    qryEditReavalVALORG: TFloatField;
    qryEditReavalCMBEM: TFloatField;
    qryEditReavalVALFIS: TFloatField;
    qryEditReavalVALGER: TFloatField;
    qryEditReavalDEPLANC: TFloatField;
    qryEditReavalCMDEP: TFloatField;
    qryEditReavalDEPFIS: TFloatField;
    qryEditReavalDEPGER: TFloatField;
    qryEditReavalDATAULTDEP: TDateTimeField;
    qryEditReavalFLGDEPREC: TFloatField;
    qryEditReavalTAXADEP: TFloatField;
    qryEditReavalFLGULTREAVAL: TFloatField;
    qryUltReav: TwwQuery;
    qryUltReavIDMOVIMENTACAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cmbImovelMestreExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function ExecutaBaixaReaval(iModulo, iEmpresaProp, iBem, iMotivoBaixa : Integer;
                                dDataBaixa : tDate; fPropBaixa : Extended;
                                sObsBaixa : String) : Boolean;
    function RegistraMovimentacao(iBem, iEmpresaProp, iTipoMovimentacao, iPlanilha,
                                  iEstorno, iModulo: longint; dDataMovimentacao: TDate;
                                  bMostraMsg: boolean) : Integer;
    function RegistraValorMovimentacao(iSeqHist : Integer;
                                       fValOfi,fValFis,fValGer : Extended;
                                       bMostraMsg : Boolean) : Boolean;
    function RegistraBaixaBem(iSeqHist, iMotivoBaixa : Integer;
                              fPropBaixar : Double; sObsBaixa : string;
                              iIdReaval : Integer) : Boolean;
    function ExecutaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                dDataLaudo : tDate;
                                fValLaudo : Double; iVidaUtil : Integer;
                                sObs : String;
                                Var fDifReaval,fDifReavalImob : Double;
                                fValCtb : Extended; bMostraMsg : boolean) : Integer;
    Function RegistraReaval(iSeqHist:integer; fTaxaDep,fValLaudo,fValOrgAnt:Double;
                            sObs : string; bMostraMsg : Boolean) : Boolean;
    Function RegistraReavaliacao(iBem,iPessoa,iMov : Integer;
                                 fValOrg,fValFis,fValGer,fCmBem,
                                 fDepLanc,fDepFis,fDepGer,fCmDep,
                                 fTaxaDep : Double;
                                 dData : tDateTime;
                                 iFlgUltReaval : Integer;
                                 bMostraMsg : Boolean) : Integer;
    Function EstornaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                dDataMov,dDataEst : tDate;
                                bMostraMsg : boolean) : Integer;
  public
    { Public declarations }
  end;

  eExcessaoCAF = Class(Exception);

var
  frmReferLancReaval: TfrmReferLancReaval;

implementation

uses
   uSistema, dBaseDados, uDatabase, uMensErro, dAtivoFixo, uAtivoFixo;

{$R *.DFM}

procedure TfrmReferLancReaval.FormCreate(Sender: TObject);
begin
   inherited;
   qryUltReav.Prepare;
   qryImoMestre.Prepare;
   qryImovel.Prepare;
   qryImoveis.Prepare;
   qryImoReavaliacao.Prepare;
   qryGrupoIni.Prepare;
   qryGrupoIni.Open;
   qryImovelMestre.Prepare;
   qryImovelMestre.Open;
   qryImovel.Open;
end;
//========================================================================================
procedure TfrmReferLancReaval.bbtnConfirmarClick(Sender: TObject);
var
   fDifReaval, fDifReavalImob,
   fProporcao,fValLaudo       : Double;
   iResult, iVidaUtil         : Integer;
   bTransacao, bVerificaMov   : Boolean;
   dDataMov                   : tDateTime;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   pnlStatus.Visible := True;
   //-------------------------------------------------------------------------------------
   dDataMov  := edDataReaval.Date + 1;
   iVidaUtil := strtoint(edVidaUtil.Text) * 12;  // Converte Anos para Meses
   //-------------------------------------------------------------------------------------
   // Prepara as queries principais
   //-------------------------------------------------------------------------------------
   qryImoMestre.Close;
   qryImoveis.Close;
   if (dblkcmbImovel.Text <> '') then
   begin
      qryImoMestre.SQL.Strings[81] := ' AND (I.IDIMOVEL = '+IntToStr(qryImovelIDIMOVEL.AsInteger)+')';
      qryImoveis.SQL.Strings[82]   := ' AND (I.IDIMOVEL = '+IntToStr(qryImovelIDIMOVEL.AsInteger)+')';
   end else
   begin
      qryImoMestre.SQL.Strings[81] := ' ';
      qryImoveis.SQL.Strings[82]   := ' ';
   end;
   if (cmbGrupo.Text <> '') then
   begin
      qryImoMestre.SQL.Strings[82] := ' AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ')';
      qryImoveis.SQL.Strings[83]   := ' AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ')';
   end else
   begin
      qryImoMestre.SQL.Strings[82] := ' ';
      qryImoveis.SQL.Strings[83]   := ' ';
   end;
   //-------------------------------------------------------------------------------------
   // Calcula o custo e a depreciacao total do Imovel Mestre
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Preparando Imóvel Mestre ...';
   Application.ProcessMessages;
   qryImoMestre.ParamByName('PIDIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImoMestre.ParamByName('PDATAMOV').AsDateTime    := edDataReaval.Date;
   qryImoMestre.Open;
   //-------------------------------------------------------------------------------------
   // Calcula o custo e a depreciação dos imóveis que compoem o imóvel mestre acima
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Preparando Imoveis do Imóvel Mestre...';
   Application.ProcessMessages;
   qryImoveis.ParamByName('PIDIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImoveis.ParamByName('PDATAMOV').AsDateTime    := edDataReaval.Date;
   qryImoveis.Open;
   if qryImoveis.IsEmpty then
   begin
      MsgDlg('Não existem bens para este Imovel Mestre no grupo selecionado',
             'Erro',mtError,[mbOk],0);
      qryImoMestre.Close;
      qryImoveis.Close;
      bbtnConfirmar.Enabled := True;
      pnlStatus.Visible     := False;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryImoveis.RecordCount;
   try
      bVerificaMov := True;
      while not qryImoveis.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Processando Placa ' + qryImoveisPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // verifica se ja houve movimentação no bem após a reavaliação
         //-------------------------------------------------------------------------------
         if bVerificaMov then
         begin
            qryUltReav.Close;
            qryUltReav.ParamByName('PIDPESSOA').AsInteger := qryImoveisIDPESSOA.AsInteger;
            qryUltReav.ParamByName('PIDBEM').AsInteger    := qryImoveisIDBEM.AsInteger;
            qryUltReav.ParamByName('PDATAMOV').AsDateTime := dDataMov;
            qryUltReav.Open;
            if not qryUltReav.IsEmpty then
            begin
               MsgDlg('Este Imóvel/Grupo já foi reavaliado na data. Consulte!',
                      'Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('Bem já Reavaliado');
            end;
            bVerificaMov := False;
         end;
         //-------------------------------------------------------------------------------
         // Baixar a Reavaliacao Anterior
         //-------------------------------------------------------------------------------
         if not ExecutaBaixaReaval(Sistema.IdModulo,Sistema.IdEmpresa,
                                   qryImoveisIDBEM.AsInteger,0,edDataReaval.Date,100,
                                   edObsReav.Text) then
            Raise eExcessaoCAF.Create('Executa baixa da reavaliação anterior');
         //-------------------------------------------------------------------------------
         // Calcula a proporção do Valor do Laudo de Reavaliação
         //-------------------------------------------------------------------------------
         fProporcao := qryImoveisVALCTB.AsCurrency / qryImoMestreVALCTB.AsCurrency;
         fValLaudo  := (edValLaudo.Value - edValDep.Value);
         fValLaudo  := strtofloat(FormatFloat('###########0.000',((fValLaudo * fProporcao * 1000) / 1000)));
         //-------------------------------------------------------------------------------
         // Executa a Nova Reavaliação
         //-------------------------------------------------------------------------------
         fDifReaval     := 0;
         fDifReavalImob := 0;
         iResult := ExecutaReavaliacao(Sistema.IdModulo, Sistema.IdEmpresa,
                                       qryImoveisIDBEM.asInteger,
                                       dDataMov, fValLaudo,
                                       iVidaUtil, edObsReav.Text,
                                       fDifReaval, fDifReavalImob,
                                       qryImoveisVALCTB.AsCurrency,True);
         if iResult <= 0 then
            Raise eExcessaoCAF.Create('Executa nova reavaliação');
         //-------------------------------------------------------------------------------
         qryImoveis.Next;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0);
   end;
   qryImoMestre.Close;
   qryImoveis.Close;
   bbtnConfirmar.Enabled := True;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmReferLancReaval.bbtnCancelarClick(Sender: TObject);
Var
   bTransacao : Boolean;
   fValOrg, fCmBem, fDepLanc, fCmDep : Double;
   dDataMov : tDateTime;

begin
   inherited;
   bbtnCancelar.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   pnlStatus.Visible := True;
   dDataMov := edDataReaval.Date + 1;
   //-------------------------------------------------------------------------------------
   // Prepara as queries principais
   //-------------------------------------------------------------------------------------
   qryImoveis.Close;
   if (dblkcmbImovel.Text <> '') then
   begin
      qryImoveis.SQL.Strings[82]   := ' AND (I.IDIMOVEL = ' + qryImovelIDIMOVEL.AsString + ')';
   end else
   begin
      qryImoveis.SQL.Strings[82]   := ' ';
   end;
   if (cmbGrupo.Text <> '') then
   begin
      qryImoveis.SQL.Strings[83]   := ' AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ')';
   end else
   begin
      qryImoveis.SQL.Strings[83]   := ' ';
   end;
   //-------------------------------------------------------------------------------------
   // Calcula o custo e a depreciação dos imóveis que compoem o imóvel mestre selecionado
   //-------------------------------------------------------------------------------------
   lblStatus.Caption := 'Iniciando Imoveis ...';
   Application.ProcessMessages;
   qryImoveis.ParamByName('PIDIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImoveis.ParamByName('PDATAMOV').AsDateTime    := edDataReaval.Date;
   qryImoveis.Open;
   if qryImoveis.IsEmpty then
   begin
      MsgDlg('Não existem bens para este Imovel Mestre no grupo selecionado',
             'Erro',mtError,[mbOk],0);
      qryImoveis.Close;
      bbtnConfirmar.Enabled := True;
      pnlStatus.Visible     := False;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryImoveis.RecordCount;
   try
      while not qryImoveis.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Processando Placa ' + qryImoveisPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Estorna a Reavaliacao realizada
         //-------------------------------------------------------------------------------
         if EstornaReavaliacao(Sistema.IdModulo,qryImoveisIDPESSOA.AsInteger,
                               qryImoveisIDBEM.AsInteger,
                               dDataMov,
                               dDataMov,True) < 0 then
            Raise eExcessaoCAF.Create('Estorna reavaliação não executada');
         //-------------------------------------------------------------------------------
         // Recupera a Reavaliacao Original estornada - Custo
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoveisIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoveisIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 20;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataReaval.Date;
         qryMovBem.Open;
         if qryMovBem.IsEmpty then
         begin
            qryImoveis.Next;
            Continue;
         end;
         fValOrg := qryMovBemVALOFI.AsCurrency;
         //-------------------------------------------------------------------------------
         // Posiciona a Reavaliacao original
         //-------------------------------------------------------------------------------
         qryEditReaval.Close;
         qryEditReaval.ParamByName('PIDREAVAL').AsInteger := qryMovBemIDREAVALIACAO.AsInteger;
         qryEditReaval.ParamByName('PIDPESSOA').AsInteger := qryImoveisIDPESSOA.AsInteger;
         qryEditReaval.ParamByName('PIDBEM').AsInteger    := qryImoveisIDBEM.AsInteger;
         qryEditReaval.ParamByName('PDATAREAVAL').AsDateTime := strtodate('30/09/1999');
         qryEditReaval.Open;
         if qryEditReaval.IsEmpty then
         begin
            qryImoveis.Next;
            Continue;
         end;
         //-------------------------------------------------------------------------------
         // Recupera a Reavaliacao Original estornada - CMBEM
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoveisIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoveisIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 28;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataReaval.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
            fCmBem := qryMovBemVALOFI.AsCurrency
         else
            fCmBem := 0;
         //-------------------------------------------------------------------------------
         // Recupera a Reavaliacao Original estornada - DEPLANC
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoveisIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoveisIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 27;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataReaval.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
            fDepLanc := qryMovBemVALOFI.AsCurrency
         else
            fDepLanc := 0;
         //-------------------------------------------------------------------------------
         // Recupera a Reavaliacao Original estornada - CMDEP
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoveisIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoveisIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 29;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataReaval.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
            fCmDep := qryMovBemVALOFI.AsCurrency
         else
            fCmDep := 0;
         //-------------------------------------------------------------------------------
         // Recupera a Reavaliacao Original estornada - CMDEP
         //-------------------------------------------------------------------------------
         qryEditReaval.Edit;
         qryEditReavalVALORG.asFloat  := qryEditReavalVALORG.asFloat  + fValOrg;
         qryEditReavalDEPLANC.asFloat := qryEditReavalDEPLANC.asFloat + fDepLanc;
         qryEditReavalCMBEM.asFloat   := qryEditReavalCMBEM.asFloat   + fCmBem;
         qryEditReavalCMDEP.asFloat   := qryEditReavalCMDEP.asFloat   + fCmDep;
         qryEditReaval.Post;
         qryEditReaval.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryImoveis.Next;
      end;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Removendo os Lancamentos';
      Application.ProcessMessages;
      with dtmAtivoFixo do
      begin
         sqlScript.Script.Text := ' DELETE FROM BAIXABEM VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (20,27,28,29)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataReaval.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ';
         if (dblkcmbImovel.Text <> '') then
         begin
            sqlScript.Script.Text := sqlScript.Script.Text + ' AND (I.IDIMOVEL = '+IntToStr(qryImovelIDIMOVEL.AsInteger)+')';
         end;
         if (cmbGrupo.Text <> '') then
         begin
            sqlScript.Script.Text := sqlScript.Script.Text + ' AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ';
         end;
         sqlScript.Script.Text := sqlScript.Script.Text +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)           ' +
                                  '                    AND (B.IDBEM      = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA   = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' +
                                  ' DELETE FROM VALORMOVIMENTACAO VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (20,27,28,29)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataReaval.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ' ;
         if (dblkcmbImovel.Text <> '') then
         begin
            sqlScript.Script.Text := sqlScript.Script.Text + ' AND (I.IDIMOVEL = '+IntToStr(qryImovelIDIMOVEL.AsInteger) + ')';
         end;
         if (cmbGrupo.Text <> '') then
         begin
            sqlScript.Script.Text := sqlScript.Script.Text + ' AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ';
         end;
         sqlScript.Script.Text := sqlScript.Script.Text +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)'+
                                  '                    AND (B.IDBEM      = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA   = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' +
                                  ' DELETE FROM HISTORICOMOVIMENTACAO HMOV' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (20,27,28,29)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataReaval.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ';
         if (dblkcmbImovel.Text <> '') then
         begin
            sqlScript.Script.Text := sqlScript.Script.Text + ' AND (I.IDIMOVEL = '+IntToStr(qryImovelIDIMOVEL.AsInteger) + ')';
         end;
         if (cmbGrupo.Text <> '') then
         begin
            sqlScript.Script.Text := sqlScript.Script.Text + ' AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ';
         end;
         sqlScript.Script.Text := sqlScript.Script.Text +
                                  '                    AND (HMOV.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM) ' +
                                  '                    AND (B.IDBEM      = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA   = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' ;
         sqlScript.Execute;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0);
   end;
   qryImoveis.Close;
   qryEditReaval.Close;
   bbtnCancelar.Enabled := True;
   pnlStatus.Visible := False;
end;
//========================================================================================
// Função que executa a Baixa da Reavaliação Anterior
//----------------------------------------------------------------------------------------
function TfrmReferLancReaval.ExecutaBaixaReaval(iModulo, iEmpresaProp, iBem,
                                                iMotivoBaixa : Integer;
                                                dDataBaixa   : tDate;
                                                fPropBaixa   : Extended;
                                                sObsBaixa    : String) : Boolean;
Var
   bTransacao                  : Boolean;
   fBaixaB,fBaixaBF,fBaixaBG,
   fBaixaD,fBaixaDF,fBaixaDG,
   fBaixaCM,fBaixaCMD          : Double;
   iSeqHist                    : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Valida os Parâmetros obrigatórios para baixa da reavaliacao
   //-------------------------------------------------------------------------------------
   if (iMotivoBaixa <= 0) then
   begin
      dtmAtivoFixo.qryMotivoBaixa.Open;
      dtmAtivoFixo.qryMotivoBaixa.First;
      iMotivoBaixa := dtmAtivoFixo.qryMotivoBaixaIDMOTIVOBAIXA.AsInteger;
      dtmAtivoFixo.qryMotivoBaixa.Close;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // BAIXA AS REAVALIACOES
      //----------------------------------------------------------------------------------
      qryImoReavaliacao.Close;
      qryImoReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryImoReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryImoReavaliacao.Open;
      while not qryImoReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 20
         //-------------------------------------------------------------------------------
         fBaixaB  := qryImoReavaliacaoVALORG.asFloat * (fPropBaixa / 100);
         fBaixaBF := qryImoReavaliacaoVALFIS.asFloat * (fPropBaixa / 100);
         fBaixaBG := qryImoReavaliacaoVALGER.asFloat * (fPropBaixa / 100);
         iSeqHist := RegistraMovimentacao(iBem,iEmpresaProp,20,-1,-1,iModulo,dDataBaixa,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 20');
         //-------------------------------------------------------------------------------
         if not RegistraValorMovimentacao(iSeqHist, fBaixaB, fBaixaBF, fBaixaBG,
                                          True) then
            Raise eExcessaoCAF.Create('Baixa : RegistraValorMovimentacao - 20');
         //-------------------------------------------------------------------------------
         if not RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixa,sObsBaixa,
                                 qryImoReavaliacaoIDREAVALIACAO.AsInteger) then
            Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 20');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM := qryImoReavaliacaoCMBEM.asFloat * (fPropBaixa / 100);
         if fBaixaCM <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem,iEmpresaProp,28,-1,-1,iModulo,dDataBaixa,
                                             True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 28');
            //----------------------------------------------------------------------------
            if not RegistraValorMovimentacao(iSeqHist, fBaixaCM, 0, 0, True) then
               Raise eExcessaoCAF.Create('Baixa : RegistraValorMovimentacao - 28');
            //----------------------------------------------------------------------------
            if not RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixa,sObsBaixa,
                                    qryImoReavaliacaoIDREAVALIACAO.AsInteger) then
               Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 28');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  := qryImoReavaliacaoDEPLANC.asFloat * (fPropBaixa / 100);
         fBaixaDF := qryImoReavaliacaoDEPFIS.asFloat  * (fPropBaixa / 100);
         fBaixaDG := qryImoReavaliacaoDEPGER.asFloat  * (fPropBaixa / 100);
         if fBaixaD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem,iEmpresaProp,27,-1,-1,iModulo,dDataBaixa,
                                             True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 27');
            //----------------------------------------------------------------------------
            if not RegistraValorMovimentacao(iSeqHist, fBaixaD, fBaixaDF, fBaixaDG,
                                             True) then
               Raise eExcessaoCAF.Create('Baixa : RegistraValorMovimentacao - 27');
            //----------------------------------------------------------------------------
            if not RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixa,sObsBaixa,
                                    qryImoReavaliacaoIDREAVALIACAO.AsInteger) then
               Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 27');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD := qryImoReavaliacaoCMDEP.asFloat * (fPropBaixa / 100);
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(iBem,iEmpresaProp,29,-1,-1,iModulo,dDataBaixa,
                                             True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 29');
            //----------------------------------------------------------------------------
            if not RegistraValorMovimentacao(iSeqHist, fBaixaCMD, 0, 0, True) then
               Raise eExcessaoCAF.Create('Baixa : RegistraValorMovimentacao - 29');
            //----------------------------------------------------------------------------
            if not RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixa,sObsBaixa,
                                    qryImoReavaliacaoIDREAVALIACAO.AsInteger) then
               Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 29');
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Reavaliacoes
         //-------------------------------------------------------------------------------
         qryImoReavaliacao.Edit;
         qryImoReavaliacaoVALORG.asFloat  := qryImoReavaliacaoVALORG.asFloat  - fBaixaB;
         qryImoReavaliacaoVALFIS.asFloat  := qryImoReavaliacaoVALFIS.asFloat  - fBaixaBF;
         qryImoReavaliacaoVALGER.asFloat  := qryImoReavaliacaoVALGER.asFloat  - fBaixaBG;
         qryImoReavaliacaoDEPLANC.asFloat := qryImoReavaliacaoDEPLANC.asFloat - fBaixaD;
         qryImoReavaliacaoDEPFIS.asFloat  := qryImoReavaliacaoDEPFIS.asFloat  - fBaixaDF;
         qryImoReavaliacaoDEPGER.asFloat  := qryImoReavaliacaoDEPGER.asFloat  - fBaixaDG;
         qryImoReavaliacaoCMBEM.asFloat   := qryImoReavaliacaoCMBEM.asFloat   - fBaixaCM;
         qryImoReavaliacaoCMDEP.asFloat   := qryImoReavaliacaoCMDEP.asFloat   - fBaixaCMD;
         qryImoReavaliacao.Post;
         qryImoReavaliacao.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryImoReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := True;
   except
      if bTransacao then
         RollBackTransacao;
      Result := False;
   end;
end;
//========================================================================================
function TfrmReferLancReaval.RegistraMovimentacao(iBem, iEmpresaProp, iTipoMovimentacao, iPlanilha,
                                                  iEstorno, iModulo: longint; dDataMovimentacao: TDate;
                                                  bMostraMsg: boolean) : Integer;
var
   iMovimentacao           : LongInt;
   qryRegistraMovimentacao : TwwQuery;
   bTransacao              : Boolean;

begin
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   iMovimentacao           := LeUltRegistro(nil, 'HISTORICOMOVIMENTACAO');
   qryRegistraMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraMovimentacao);
   //-------------------------------------------------------------------------------------
   try
      with qryRegistraMovimentacao do
      begin
         Close;
         ParamByName('MOVIMENTACAO').asInteger     := iMovimentacao;
         ParamByName('BEM').asInteger              := iBem;
         ParamByName('EMPRESAPROP').asInteger      := iEmpresaProp;
         ParamByName('TIPOMOVIMENTACAO').asInteger := iTipoMovimentacao;
         ParamByName('MODULO').asInteger           := iModulo;
         //-------------------------------------------------------------------------------
         if iEstorno = -1 then
            ParamByName('ESTORNO').Clear
         else
            ParamByName('ESTORNO').asInteger        := iEstorno;
         //-------------------------------------------------------------------------------
         if iPlanilha = -1 then
            ParamByName('PLANILHA').Clear
         else
            ParamByName('PLANILHA').asInteger       := iPlanilha;
         //-------------------------------------------------------------------------------
         ParamByName('DATAMOVIMENTACAO').asDateTime := dDataMovimentacao;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if bTransacao then
            CommitTransacao;
         result := iMovimentacao;
      end;
   //-------------------------------------------------------------------------------------
   except
      if bTransacao then
         RollBackTransacao;
      if bMostraMsg then
         Raise;
      result := -1;
   end;
end;
//========================================================================================
Function TfrmReferLancReaval.RegistraValorMovimentacao(iSeqHist : Integer;
                                                     fValOfi,fValFis,fValGer : Extended;
                                                     bMostraMsg : Boolean) : Boolean;
var
   qryValorMovimentacao : TwwQuery;
   bTransacao           : Boolean;

begin
   if fValOfi <> 0 then
   begin
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
         bTransacao := False;
      //----------------------------------------------------------------------------------
      qryValorMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraValorMovimentacao);
      //----------------------------------------------------------------------------------
      try
         with qryValorMovimentacao do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
            if abs(fValOfi) >= 0.0001 then
            begin
               ParamByName('PVALOFI').AsCurrency := strtofloat(FormatFloat('###########0.0000',((fValOfi * 10000) / 10000)));
               ParamByName('PVALGER').AsCurrency := strtofloat(FormatFloat('###########0.0000',((fValGer * 10000) / 10000)));
               ParamByName('PVALFIS').AsCurrency := strtofloat(FormatFloat('###########0.0000',((fValFis * 10000) / 10000)));
            end else
            begin
               ParamByName('PVALOFI').AsFloat := fValOfi;
               ParamByName('PVALGER').AsFloat := fValGer;
               ParamByName('PVALFIS').AsFloat := fValFis;
            end;
            ExecSQL;
            //----------------------------------------------------------------------------
            if bTransacao then
               CommitTransacao;
            Result := True;
         end;
      //----------------------------------------------------------------------------------
      except
         if bTransacao then
            RollBackTransacao;
         if bMostraMsg then
            Raise;
         Result := False;
      end;
   end else
   begin
      result := True;
   end;
end;
//========================================================================================
Function TfrmReferLancReaval.RegistraBaixaBem(iSeqHist, iMotivoBaixa : Integer;
                                              fPropBaixar : Double; sObsBaixa : string;
                                              iIdReaval : Integer) : Boolean;

var
   qryBaixaBem : TwwQuery;

begin
   qryBaixaBem := TwwQuery(dtmAtivoFixo.qryRegistraBaixaBem);
   //-------------------------------------------------------------------------------------
   try
      with qryBaixaBem do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PIDMOTIVOBAIXA').AsInteger  := iMotivoBaixa;
         ParamByName('PPROPBAIXAR').AsFloat       := fPropBaixar;
         ParamByName('POBS').AsString             := sObsBaixa;
         ParamByName('PIDREAVAL').AsInteger       := iIdReaval;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
   end;
end;
//========================================================================================
function TfrmReferLancReaval.ExecutaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                                dDataLaudo : tDate;
                                                fValLaudo : Double; iVidaUtil : Integer;
                                                sObs : String;
                                                Var fDifReaval,fDifReavalImob : Double;
                                                fValCtb : Extended; bMostraMsg : boolean) : Integer;

const
   iTipoMovimentacao = 8;           // Codigo de Reavaliacao de Bem

var
   iSeqHist, iIdReavaliacao                                  : Integer;
   fValFis, fValGer, fTaxaDep                                : Extended;
   fNovaTaxaDep, fTaxaDepCalc                                : Double;
   bTransacao                                                : Boolean;
   aIdHistMov                                                : array [1..1] of Integer;

begin
   if not qryUltMov.Prepared then qryUltMov.Prepare;
   if not qryImoBem.Prepared then qryImoBem.Prepare;
   with dtmAtivoFixo do
   begin
      if not qryRegistraMovimentacao.Prepared then
         qryRegistraMovimentacao.Prepare;

      if not qryRegistraValorMovimentacao.Prepared then
         qryRegistraValorMovimentacao.Prepare;

      if not qryRegistraReavaliacao.Prepared then
         qryRegistraReavaliacao.Prepare;

      if not qryRegistraReaval.Prepared then
         qryRegistraReaval.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a Reavaliação
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataLaudo) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a Reavaliação. Consulte Movimentação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Valida os Parâmetros obrigatórios para reavaliação de bens
   //-------------------------------------------------------------------------------------
   if (iVidaUtil < 0) then
   begin
      if bMostraMsg then
         MsgDlg('Tempo de Vida Útil Zerado igual a Taxa de Depreciação Zerada!','Informação',mtInformation,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   if (fValLaudo <= 0) then
   begin
      if bMostraMsg then
         MsgDlg('Informe o novo valor do bem!','Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sObs = '') then
   begin
      if bMostraMsg then
         MsgDlg('Declare as informações relativas ao laudo de reavaliação!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM no bem que será reavaliado
      //----------------------------------------------------------------------------------
      qryImoBem.Close;
      qryImoBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryImoBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryImoBem.Open;
      if qryImoBem.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      fTaxaDep := qryImoBem.FieldByName('TAXADEP').asFloat;
      //----------------------------------------------------------------------------------
      // Calcula a Nova Taxa de Depreciacao
      //----------------------------------------------------------------------------------
      fNovaTaxaDep := 0;
      if (iVidaUtil > 0) then
      begin
         fNovaTaxaDep := (100 / (iVidaUtil / 12));    // iVidaUtil está em número de meses
      end;
      //----------------------------------------------------------------------------------
      // Calcula o Saldo para Reavaliacao
      //----------------------------------------------------------------------------------
      fDifReaval := fValLaudo - fValCtb;
      //----------------------------------------------------------------------------------
      // Calcula o Saldo para Reavaliacao do Sistema de Adm Imobiliaria
      //----------------------------------------------------------------------------------
      fDifReavalImob := fDifReaval;
      //----------------------------------------------------------------------------------
      // Le os Parametros do CAF
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //-------------------------------------------------------------------------------
         fValFis := fDifReaval / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                               dDataLaudo, bMostraMsg);
         fValGer := fDifReaval / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                               dDataLaudo, bMostraMsg);
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico de Movimentações (HISTORICOMOVIMENTACAO)
      //----------------------------------------------------------------------------------
      iSeqHist := RegistraMovimentacao(iBem,iEmpresaProp,iTipoMovimentacao,-1,-1,
                                       iModulo,dDataLaudo,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Reavaliação : RegistraMovimentacao');
      aIdHistMov[1] := iSeqHist;
      //----------------------------------------------------------------------------------
      if not RegistraValorMovimentacao(iSeqHist,fDifReaval,fValFis,fValGer,
                                       bMostraMsg) then
         Raise eExcessaoCAF.Create('Reavaliação : RegistraValorMovimentacao');
      //----------------------------------------------------------------------------------
      // Recalcula a Taxa de Depreciacao no Lançamento da Tabela BEM
      //----------------------------------------------------------------------------------
      if not RegistraReaval(iSeqHist, fTaxaDep, fValLaudo,
                            qryImoBem.FieldByName('VALORG').asFloat, sObs, bMostraMsg) then
         Raise eExcessaoCAF.Create('Reavaliação : RegistraReaval');
      //----------------------------------------------------------------------------------
      if (fNovaTaxaDep <> 0) then
      begin
         fTaxaDepCalc := (((qryImoBem.FieldByName('VALORG').asFloat  +
                            qryImoBem.FieldByName('CMBEM').asFloat)  -
                           (qryImoBem.FieldByName('DEPLANC').asFloat +
                            qryImoBem.FieldByName('CMDEP').asFloat)) /
                           (iVidaUtil / 12) /
                           (qryImoBem.FieldByName('VALORG').asFloat +
                            qryImoBem.FieldByName('CMBEM').asFloat)) * 100;
      end else
      begin
         fTaxaDepCalc := 0;
      end;
      qryImoBem.Edit;
      qryImoBem.FieldByName('TAXADEP').AsFloat := fTaxaDepCalc;
      qryImoBem.Post;
      qryImoBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Registra a Reavaliacao
      //----------------------------------------------------------------------------------
      iIdReavaliacao := RegistraReavaliacao(iBem,iEmpresaProp,aIdHistMov[1],
                        fDifReaval,fValFis,fValGer,0,0,0,0,0,fNovaTaxaDep,
                        dDataLaudo,1,bMostraMsg);
      if iIdReavaliacao <= 0 then
         Raise eExcessaoCAF.Create('Reavaliação : RegistraReavaliacao');
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iIdReavaliacao;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
Function TfrmReferLancReaval.RegistraReaval(iSeqHist:integer; fTaxaDep,fValLaudo,fValOrgAnt:Double;
                                            sObs : string; bMostraMsg : Boolean) : Boolean;
var
   qryReaval  : TwwQuery;

begin
   qryReaval := TwwQuery(dtmAtivoFixo.qryRegistraReaval);
   //-------------------------------------------------------------------------------------
   try
      with qryReaval do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PTAXADEPORG').AsFloat       := fTaxaDep;
         ParamByName('PVALORGLAUDO').AsFloat      := fValLaudo;
         ParamByName('PVALORGANT').AsFloat        := fValOrgAnt;
         ParamByName('POBS').AsString             := sObs;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      Result := False;
      if bMostraMsg then
         Raise;
   end;
end;
//========================================================================================
Function TfrmReferLancReaval.RegistraReavaliacao(iBem,iPessoa,iMov : Integer;
                                                 fValOrg,fValFis,fValGer,fCmBem,
                                                 fDepLanc,fDepFis,fDepGer,fCmDep,
                                                 fTaxaDep : Double;
                                                 dData : tDateTime;
                                                 iFlgUltReaval : Integer;
                                                 bMostraMsg : Boolean) : Integer;
var
   iSeq              : Integer;
   qryReavaliacaoImo : TwwQuery;

begin
   qryReavaliacaoImo := TwwQuery(dtmAtivoFixo.qryRegistraReavaliacao);
   //-------------------------------------------------------------------------------------
   try
      with qryReavaliacaoImo do
      begin
         iSeq := LeUltRegistro(nil,'REAVALIACAO');
         ParamByName('PIDREAVALIACAO').AsInteger    := iSeq;
         ParamByName('PIDMOVIMENTACAO').AsFloat     := iMov;
         ParamByName('PIDBEM').AsInteger            := iBem;
         ParamByName('PIDPESSOA').AsInteger         := iPessoa;
         ParamByName('PDATAREAVALIACAO').AsDateTime := dData;
         ParamByName('PVALORG').AsCurrency          := fValOrg;
         ParamByName('PVALFIS').AsCurrency          := fValFis;
         ParamByName('PVALGER').AsCurrency          := fValGer;
         ParamByName('PDATAULTDEP').AsDateTime      := (dData - 1);
         ParamByName('PCMBEM').AsCurrency           := fCmBem;
         ParamByName('PCMDEP').AsCurrency           := fCmDep;
         ParamByName('PTAXADEP').AsFloat            := fTaxaDep;
         ParamByName('PDEPLANC').AsCurrency         := fDepLanc;
         ParamByName('PDEPFIS').AsCurrency          := fDepFis;
         ParamByName('PDEPGER').AsCurrency          := fDepGer;
         ParamByName('PFLGULTREAVAL').AsInteger     := iflgUltReaval;
         ExecSQL;
      end;
      Result := iSeq;
   //-------------------------------------------------------------------------------------
   except
      Result := -1;
      if bMostraMsg then
         Raise;
   end;
end;

procedure TfrmReferLancReaval.cmbImovelMestreExit(Sender: TObject);
begin
   inherited;
   qryImovel.Close;
   qryImovel.ParamByName('PIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImovel.Open;
   dblkcmbImovel.Text := '';
end;

procedure TfrmReferLancReaval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryImovelMestre.Close;
   qryImovel.Close;
   qryGrupoIni.Close;
   qryImoMestre.Close;
   qryImoveis.Close;
   qryImoReavaliacao.Close;
   qryImoBem.Close;
   qryUltMov.Close;
   qryMovBem.Close;
   qryEditReaval.Close;
   qryUltReav.Close;
   qryUltReav.UnPrepare;
   qryImovelMestre.UnPrepare;
   qryImovel.UnPrepare;
   qryGrupoIni.UnPrepare;
   qryImoMestre.UnPrepare;
   qryImoveis.UnPrepare;
   qryImoReavaliacao.UnPrepare;
   qryImoBem.UnPrepare;
   qryUltMov.UnPrepare;
   qryMovBem.UnPrepare;
   qryEditReaval.UnPrepare;
end;
//========================================================================================
function TfrmReferLancReaval.EstornaReavaliacao(iModulo, iEmpresaProp, iBem : Integer;
                                                dDataMov,dDataEst : tDate;
                                                bMostraMsg : boolean) : Integer;

const
   iTipoMovimentacao = 8;           // Codigo de Reavaliacao de Bem

var
   iIdMovimentacao, iResult                   : Integer;
   fTaxaDepAnt                                : Double;
   qryAux,qryBem                              : TwwQuery;
   bTransacao                                 : Boolean;

begin
   if not qryUltMov.Prepared then
      qryUltMov.Prepare;
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem := TwwQuery(dtmAtivoFixo.qryBem);
   qryAux := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após a reavaliação
   //-------------------------------------------------------------------------------------
   qryUltMov.Close;
   qryUltMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryUltMov.ParamByName('PIDBEM').AsInteger    := iBem;
   qryUltMov.Open;
   if (qryUltMov.IsEmpty) or (qryUltMov.FieldByName('DATAULTMOV').AsDateTime > dDataMov) then
   begin
      if bMostraMsg then
         MsgDlg('Existe movimentação após a reavaliação. Consulte!',
                'Erro',mtError,[mbOk],0);
      result := -1;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   iResult := 0;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   try
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      if qryBem.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         result := -1;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Retorna a Taxa de Depreciacao Anterior do Bem e o ID da Movimentacao
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO,HM.PLNCODIGO,R.TAXADEPANT '+
                         ' FROM HISTORICOMOVIMENTACAO HM, '+
                         '      REAVAL R '+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO = 08) ' +
                         '   AND (HM.IDMOVIMENTACAO = R.IDMOVIMENTACAO) ' +
                         ' ORDER BY HM.IDMOVIMENTACAO ';
      qryAux.Open;
      if qryAux.IsEmpty then
      begin
         if bMostraMsg then
            MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
                   'Erro',mtError,[mbOk],0);
         Raise eExcessaoCAF.Create('Reavaliação : EstornaReavaliacaoBem');
      end;
      fTaxaDepAnt      := qryAux.FieldByName('TAXADEPANT').AsFloat;
      iIdMovimentacao  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('TAXADEP').AsFloat := fTaxaDepAnt;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryEstornaReavaliacao.Prepared  then qryEstornaReavaliacao.Prepare;
        // if not qryEstornaValMov.Prepared       then qryEstornaValMov.Prepare;
        // if not qryEstornaReaval.Prepared       then qryEstornaReaval.Prepare;
        // if not qryEstornaMov.Prepared          then qryEstornaMov.Prepare;
         //-------------------------------------------------------------------------------
         // Remove a Reavaliacao
         //-------------------------------------------------------------------------------
         qryEstornaReavaliacao.ParamByName('PIDPESSOA').AsInteger       := iEmpresaProp;
         qryEstornaReavaliacao.ParamByName('PIDBEM').AsInteger          := iBem;
         qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := iIdMovimentacao;
         qryEstornaReavaliacao.ExecSQL;
         //-------------------------------------------------------------------------------
         // Remove o Registro da Movimentacao
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO = 08)';
         qryAux.Open;
         while not qryAux.Eof do
         begin
           // qryEstornaValMov.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
           // qryEstornaValMov.ExecSQL;
           // qryEstornaReaval.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
           // qryEstornaReaval.ExecSQL;
            qryAux.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAux.First;
         while not qryAux.Eof do
         begin
            qryEstornaMov.ParamByName('PIDBEM').AsInteger    := iBem;
            qryEstornaMov.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryEstornaMov.ParamByName('PIDMOVIM').AsInteger  := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaMov.ExecSQL;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAux.Close;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := iResult;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;

end.
