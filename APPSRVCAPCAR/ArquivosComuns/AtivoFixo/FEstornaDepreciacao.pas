unit fEstornaDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  uAutorizacao,uSistema, Gauges, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEstornaDepreciacao = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    eDataEst: TCMDateTimePicker;
    Data: TLabel;
    edDataFechamento: TCMDateTimePicker;
    qryHistorico: TwwQuery;
    qryUpdGrupo: TwwQuery;
    updGrupo: TUpdateSQL;
    qryParamCAF: TwwQuery;
    qryAux: TwwQuery;
    qryParamCAFMOEDAFISCAL: TFloatField;
    qryParamCAFMOEDAGERENCIAL: TFloatField;
    qryParamCAFMOEDAOFICIAL: TFloatField;
    qryParamCAFMASCCODGRUPO: TStringField;
    qryParamCAFSISTEMAS: TStringField;
    qryParamCAFINTEGRACONTAB: TStringField;
    qryParamCAFPLANOVIGENTE: TFloatField;
    qryParamCAFFLGREMOVEPLANCTB: TStringField;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryAlteraBem: TwwQuery;
    qryUpdGrupoIDGRUPO: TFloatField;
    qryUpdGrupoMOECODIGO: TFloatField;
    qryUpdGrupoNOME: TStringField;
    qryUpdGrupoTIPO: TStringField;
    qryUpdGrupoSTATUS: TStringField;
    qryUpdGrupoVALALUGUEL: TFloatField;
    qryUpdGrupoDEPRECIACAO: TFloatField;
    qryUpdGrupoCLASSE: TStringField;
    qryUpdGrupoDATAULTDEP: TDateTimeField;
    qryUpdGrupoDATARECALCDEP: TDateTimeField;
    qryUpdGrupoULTIDBEM: TFloatField;
    qryUpdGrupoFLGIMOVEL: TFloatField;
    qryHistReaval: TwwQuery;
    qryAlteraReaval: TwwQuery;
    qryHistAcresc: TwwQuery;
    qryAlteraAcresc: TwwQuery;
    qryExclusaoHistorico: TwwQuery;
    qryBuscaHistoricoExclusao: TwwQuery;
    qryBuscaHistoricoExclusaoIDHISTCARTINV: TFloatField;
    qryVerUltDep: TwwQuery;
    qryHistoricoIDMOVIMENTACAO: TFloatField;
    qryHistoricoIDPESSOA: TFloatField;
    qryHistoricoIDBEM: TFloatField;
    qryHistoricoDATAMOVIMENTACAO: TDateTimeField;
    qryHistoricoVALOFI: TFloatField;
    qryHistoricoDATAULTDEP: TDateTimeField;
    qryHistoricoPLNCODIGO: TFloatField;
    qryHistoricoDEPLANC: TFloatField;
    qryHistoricoCMBEM: TFloatField;
    qryHistReavalIDMOVIMENTACAO: TFloatField;
    qryHistReavalIDPESSOA: TFloatField;
    qryHistReavalIDBEM: TFloatField;
    qryHistReavalDATAMOVIMENTACAO: TDateTimeField;
    qryHistReavalPLNCODIGO: TFloatField;
    qryHistReavalVALOFI: TFloatField;
    qryHistReavalDATAULTDEP: TDateTimeField;
    qryHistReavalIDGRUPO: TFloatField;
    qryHistReavalFLGIMOVEL: TFloatField;
    qryHistReavalIDREAVALIACAO: TFloatField;
    qryHistReavalDEPLANC: TFloatField;
    qryHistReavalCMBEM: TFloatField;
    qryHistAcrescIDMOVIMENTACAO: TFloatField;
    qryHistAcrescIDPESSOA: TFloatField;
    qryHistAcrescIDBEM: TFloatField;
    qryHistAcrescDATAMOVIMENTACAO: TDateTimeField;
    qryHistAcrescPLNCODIGO: TFloatField;
    qryHistAcrescVALOFI: TFloatField;
    qryHistAcrescDATAULTDEP: TDateTimeField;
    qryHistAcrescIDGRUPO: TFloatField;
    qryHistAcrescFLGIMOVEL: TFloatField;
    qryHistAcrescIDACRESCIMO: TFloatField;
    qryHistAcrescDEPLANC: TFloatField;
    qryHistAcrescCMBEM: TFloatField;
    qryHistoricoFLGIMOVEL: TFloatField;
    qryHistoricoIDGRUPO: TFloatField;
    qryHistReavalFLGULTREAVAL: TFloatField;
    qryRemHistMov: TwwQuery;
    qryLegRemValMov: TwwQuery;
    qryLegRemDepBem: TwwQuery;
    qryLegRemDepReav: TwwQuery;
    qryLegRemDepAcresc: TwwQuery;
    qryHistoricoNCAF: TFloatField;
    qryVerUltFec: TwwQuery;
    qryVerUltDepDATAULT: TDateTimeField;
    qryVerUltFecDATAULT: TDateTimeField;
    qryHistoricoIDLOCALIZACAO: TFloatField;
    qryHistoricoIDRESPONSAVEL: TFloatField;
    qryHistReavalIDLOCALIZACAO: TFloatField;
    qryHistReavalIDRESPONSAVEL: TFloatField;
    qryHistAcrescIDLOCALIZACAO: TFloatField;
    qryHistAcrescIDRESPONSAVEL: TFloatField;
    qryVerUltMov: TwwQuery;
    qryVerUltMovDATAMOVIMENTACAO: TDateTimeField;
    chkDeprecImob: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataFechamentoExit(Sender: TObject);
    procedure edDataFechamentoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataDblClick(Sender: TObject);
    //------------------------------------------------------------------------------------
  private
    { Private declarations }
  public
    { Public declarations }
    MensagemErro   : String;  // Mensagem de Erro
    bErro          : boolean; // verifica se há erro
    bErroDeprec    : boolean; // verifica se há erro na depreciação
    bIntegraContab : boolean; // verifica se há integração com a contabilidade
    bRemovePlanCtb : boolean; // verifica se o estorno é com remoção ou inversão
    bFlgNCAF       : boolean; // verifica se a depreciação é do CAF NOVO
    resultperiodo,exercicio,periodo,empresa,iPlanoVigente : integer;
    planilha    : longint;
    Pln         : longint;
    CodConjunto : integer;
    CodBem      : integer;
    iGrupoDepIni, iGrupoDepFim : integer;
    sMascara    : String;
    bTestaConta : Boolean;
    fCotGerencial,fCotFiscal : Extended;
    sMensagem   : string;
    dDataUltDepAnt : tDateTime;
    iGrupoDeprec : Integer;
    //------------------------------------------------------------------------------------
    aBem         : Array of Integer;
    aGrupo       : Array of Integer;
    aLocalizacao : Array of Integer;
    aResponsavel : Array of Integer;
    iaBem : Integer;
    //------------------------------------------------------------------------------------
    aHistMov : Array of Integer;
    iaHistMov : Integer;
    //------------------------------------------------------------------------------------
    aPlnCodigo                 : Array of Extended;
    iaPlnCodigo                : Integer;
    bNovoPlnCodigo             : Boolean;
    //------------------------------------------------------------------------------------
    fLog   : TextFile;
    sLinha : String;
    //------------------------------------------------------------------------------------
    procedure PreencheDataFechamento;
    function  AcharBem(iBem : Integer) : Boolean;
    function  Calcula_Ultima_Depreciacao(dDataMov : tDateTime;
                                         Var dDataUltDep,
                                         dDataUltFec : tDateTime) : Boolean;
    function  Testa_Periodo_Contabil(sData: string) : boolean;
    procedure Estorna_Depreciacao_Bem(Var bErro : Boolean);
    procedure Estorna_Depreciacao_Reav(var bErro : Boolean);
    procedure Estorna_Depreciacao_Acresc(var bErro : Boolean);
    function ConvNum(fNum : Extended) : Extended;
    //procedure Estorna_Investimento(var bErro : Boolean);
  end;

var
  frmEstornaDepreciacao: TfrmEstornaDepreciacao;

implementation

uses dBaseDados, uLancContab, uDatabase, uMensErro, uIntegraBack,
     uDiasUteis, uAtivoFixo, dAtivoFixo;

{$R *.DFM}

//========================================================================================
procedure TfrmEstornaDepreciacao.DataDblClick(Sender: TObject);
begin
   inherited;
   if Sistema.NomeUsuario = 'SERGIO.CM' then
      chkDeprecImob.Visible := True;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.FormCreate(Sender: TObject);
begin
   inherited;
   qryHistorico.Prepare;
   qryHistReaval.Prepare;
   qryHistAcresc.Prepare;
   qryUpdGrupo.Prepare;
   qryAlteraBem.Prepare;
   qryAlteraReaval.Prepare;
   qryAlteraAcresc.Prepare;
   qryVerUltDep.Prepare;
   qryVerUltFec.Prepare;
   qryRemHistMov.Prepare;
   qryLegRemValMov.Prepare;
   qryLegRemDepBem.Prepare;
   qryLegRemDepReav.Prepare;
   qryLegRemDepAcresc.Prepare;
   //-------------------------------------------------------------------------------------
   dtmAtivoFixo.qryParamCAF.Close;
   dtmAtivoFixo.qryParamCAF.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   dtmAtivoFixo.qryParamCAF.Open;
   iPlanoVigente  := dtmAtivoFixo.qryParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
   //-------------------------------------------------------------------------------------
   bIntegraContab := AtivoFixo.IntegraContab(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT PACESTORNA FROM PARAMCONTAB ' +
                      ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')';
   qryAux.Open;
   bRemovePlanCtb := (qryAux.FieldByName('PACESTORNA').AsString = 'N') AND
                     (dtmAtivoFixo.qryParamCaf.FieldByName('FLGREMOVEPLANCTB').AsString = 'S');
   //-------------------------------------------------------------------------------------
   PreencheDataFechamento;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.PreencheDataFechamento;
begin
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if Sistema.IdModulo = 7 then
   begin
      if copy(dtmAtivoFixo.qryParamCaf.FieldByName('SISTEMAS').AsString, 4, 1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         if chkDeprecImob.Checked then
            iGrupoDeprec := 1
         else
            iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   qryVerUltFec.Close;
   qryVerUltFec.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not qryVerUltFec.IsEmpty then
      edDataFechamento.Date := qryVerUltFec.FieldByName('DATAULT').AsDateTime
   else
      edDataFechamento.Text := '';
end;
//========================================================================================
function TfrmEstornaDepreciacao.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.bbtnConfirmarClick(Sender: TObject);
var
   iResult, iAux,
   iMin, iMax               : Integer;
   dDataUltDep, dDataUltFec : tDateTime;
   ArqLog : String;
begin
   inherited;
   //-------------------------------------------------------------------------------------
   MensagemErro := '';
   if Sistema.IdModulo = 7 then
   begin
      if copy(dtmAtivoFixo.qryParamCaf.FieldByName('SISTEMAS').AsString, 4, 1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         if chkDeprecImob.Checked then
            iGrupoDeprec := 1
         else
            iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   if eDataEst.Text = '' then
   begin
      MsgDlg('Data do Estorno do Fechamento não pode estar vazia! ','Erro',mtError,[mbOk],0);
      eDataEst.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if edDataFechamento.Text = '' then
   begin
      MsgDlg('Data do Fechamento não pode estar vazia! ','Erro',mtError,[mbOk],0);
      edDataFechamento.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if bIntegraContab then
      if not Testa_Periodo_Contabil(eDataEst.text) then
      begin
         bErro := True;
         exit;
      end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor         := crSQLWait;
   bbtnConfirmar.Enabled := False;
   pnlStatus.Visible     := True;
   lblStatus.Caption     := 'Verificando Ultimo Fechamento ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   bFlgNCAF    := True;
   bErro       := False;
   dDataUltDep := edDataFechamento.Date;
   dDataUltFec := edDataFechamento.Date;
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------

      ArqLog := Sistema.TempDir + 'CAFLOG.TXT';
      AssignFile(fLog, ArqLog);
      Rewrite(fLog);
      sLinha := 'Registrando as Planilhas Contábeis que serão desconectadas';
      Writeln(fLog,sLinha);
      //----------------------------------------------------------------------------------
      if Calcula_Ultima_Depreciacao(edDataFechamento.Date,dDataUltDep,dDataUltFec) then
      begin
         iaBem       := 1;
         iaHistMov   := 1;
         iaPlnCodigo := 0;
         if not bErro then Estorna_Depreciacao_Bem(bErro);
         if not bErro then Estorna_Depreciacao_Reav(bErro);
         if not bErro then Estorna_Depreciacao_Acresc(bErro);
         //if not bErro then Estorna_Investimento(bErro);
      end else
         bErro := True;
      //----------------------------------------------------------------------------------
      if not bErro then
      begin
         //-------------------------------------------------------------------------------
         // Remove os registros do histórico
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Estornando '+inttostr(iaHistMov - 1)+' lançamentos do Histórico ...';
         prgBar.MaxValue := 100;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iMin := -1;
         iMax := -1;
         iAux := 0;
         while iAux < (iaHistMov - 1) do
         begin
            if iAux = 0 then
            begin
               iMin := aHistMov[iAux];
               iMax := aHistMov[iAux];
            end else
            begin
               if aHistMov[iAux] < iMin then
                  iMin := aHistMov[iAux];
               if aHistMov[iAux] > iMax then
                  iMax := aHistMov[iAux];
            end;
            //----------------------------------------------------------------------------
            // Remove os lançamentos da modelagem antiga
            //----------------------------------------------------------------------------
            if not bFlgNCAF then
            begin
               qryLegRemValMov.ParamByName('PIDMOV').AsInteger := aHistMov[iAux];
               qryLegRemValMov.ExecSQL;
               qryLegRemDepBem.ParamByName('PIDMOV').AsInteger := aHistMov[iAux];
               qryLegRemDepBem.ExecSQL;
               qryLegRemDepReav.ParamByName('PIDMOV').AsInteger := aHistMov[iAux];
               qryLegRemDepReav.ExecSQL;
               qryLegRemDepAcresc.ParamByName('PIDMOV').AsInteger := aHistMov[iAux];
               qryLegRemDepAcresc.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            iAux := iAux + 1;
         end;
         //-------------------------------------------------------------------------------
         case iGrupoDeprec of
            0 : begin
                   iGrupoDepIni := 0;
                   iGrupoDepFim := 0;
                end;
            1 : begin
                   iGrupoDepIni := 1;
                   iGrupoDepFim := 1;
                end;
            2 : begin
                   iGrupoDepIni := 0;
                   iGrupoDepFim := 1;
                end;
            else
                begin
                   iGrupoDepIni := 1;
                   iGrupoDepFim := 0;
                end;
         end;
         qryRemHistMov.ParamByName('PDATAMOV').AsDateTime := edDataFechamento.Date;
         qryRemHistMov.ParamByName('PIDMOVMIN').AsInteger := iMin;
         qryRemHistMov.ParamByName('PIDMOVMAX').AsInteger := iMax;
         qryRemHistMov.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
         qryRemHistMov.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
         qryRemHistMov.ExecSQL;
         prgBar.Progress := 100;
         Application.ProcessMessages;
         if qryRemHistMov.RowsAffected <> (iaHistMov - 1) then
         begin
            Raise Exception.Create('Erro na remoção dos lançamentos no histórico!');
         end;
         //-------------------------------------------------------------------------------
         CommitTransacao;
         StartTransacao;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Atualizando Saldos ...';
         prgBar.MaxValue := iaBem - 1;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iAux := 0;
         while (iAux < (iaBem - 1)) do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                    Sistema.IdEmpresa,
                                                    aBem[iAux],
                                                    strtodate(edDataFechamento.Text),
                                                    0,0,0,0, 0,0,0,0, 0,0,0,0,
                                                    aGrupo[iAux],
                                                    aLocalizacao[iAux],
                                                    aResponsavel[iAux], 2) then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            iAux := iAux + 1;
         end;
         //-------------------------------------------------------------------------------
         // Estorna Lancamentos da Contabilidade
         //-------------------------------------------------------------------------------
         if bIntegraContab then
         begin
            if (iaPlnCodigo - 1) > 0 then
            begin
               if (iaPlnCodigo - 1) = 1 then
                  lblStatus.Caption := 'Estornando '+inttostr(iaPlnCodigo - 1)+' planilha da contabilidade ...'
               else
                  lblStatus.Caption := 'Estornando '+inttostr(iaPlnCodigo - 1)+' planilhas da contabilidade ...';
               prgBar.MaxValue := (iaPlnCodigo - 1);
               prgBar.Progress := 0;
               Application.ProcessMessages;
            end;
            //----------------------------------------------------------------------------
            if not bRemovePlanCtb then
            begin
               sLinha := 'Registrando as Planilhas Contábeis que estão sendo estornadas';
               Writeln(fLog,sLinha);
               //-------------------------------------------------------------------------
               for iAux := 0 to (iaPlnCodigo - 1) do
               begin
                  prgBar.Progress := prgBar.Progress + 1;
                  if aPlnCodigo[iAux] <> 0 then
                  begin
                     sLinha := inttostr(iAux) + ' := ' + floattostr(aPlnCodigo[iAux]);
                     Writeln(fLog, sLinha);
                     //-------------------------------------------------------------------
                     iResult := EstornaLanc(True, trunc(aPlnCodigo[iAux]), 'BASEDADOS', eDataEst.Text,
                                            Exercicio, Periodo, Sistema.IdEmpresa, sMascara);
                     if iResult = -1 then
                     begin
                        Raise Exception.Create('Estorno da Contabilidade não Executado !');
                     end;
                  end;
               end;
            end else
            //----------------------------------------------------------------------------
            begin
               sLinha := 'Registrando as Planilhas Contábeis que estão sendo removidas';
               Writeln(fLog,sLinha);
               //-------------------------------------------------------------------------
               for iAux := 0 to (iaPlnCodigo - 1) do
               begin
                  prgBar.Progress := prgBar.Progress + 1;
                  if aPlnCodigo[iAux] <> 0 then
                  begin
                     sLinha := inttostr(iAux) + ' := ' + floattostr(aPlnCodigo[iAux]);
                     Writeln(fLog, sLinha);
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, trunc(aPlnCodigo[iAux]), 'BASEDADOS', inttostr(Sistema.IdModulo),
                                           iPlanoVigente, Sistema.IdEmpresa, Sistema.IdUsuario,
                                           True, 0, sMascara);
                     if iResult = -1 then
                     begin
                        Raise Exception.Create('Remoção da Planilha da Contabilidade não Executada !');
                     end;
                  end;
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         CloseFile(fLog);
         //-------------------------------------------------------------------------------
         if not Sistema.GravaLogOperacoes('Estorno do Fechamento de Periodo - ' + edDataFechamento.Text) then
            raise Exception.Create('Erro ao gravar Log de Operação');
         //-------------------------------------------------------------------------------
         CommitTransacao;
         MsgDlg('Operação realizada!','Informação',mtInformation,[mbOk],0);
      end else
      begin
         raise Exception.Create(MensagemErro);
      end;
   except
      on E : Exception do
      begin
         CloseFile(fLog);
         RollBackTransacao;
         MsgDlg('Operação não realizada!' + #13 + #13 +
                'Erro : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor         := crDefault;
   pnlStatus.Visible     := False;
   bbtnConfirmar.Enabled := True;
   PreencheDataFechamento;
end;
//========================================================================================
procedure TFrmEstornaDepreciacao.Estorna_Depreciacao_Bem(Var bErro : Boolean);
var
   iGrupoDepIni, iGrupoDepFim,
   iAux, iTotHist              : Integer;
   bflgPrimBem                 : Boolean;

begin
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 0;
          end;
   end;
   //-------------------------------------------------------------------------------------
   qryHistorico.Close;
   qryHistorico.ParambyName('PIDPESSOA').AsFloat       := Sistema.IdEmpresa;
   qryHistorico.ParambyName('PDATAMOV').AsDateTime     := edDataFechamento.Date;
   qryHistorico.ParambyName('PIDTIPOMOV').AsInteger    := 14;  // Depreciação de Bens
   qryHistorico.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryHistorico.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryHistorico.Open;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Bens não Imóveis';
      1 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Bens Imóveis';
   else
      lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Bens';
   end;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      qryUpdGrupo.Close;
      qryUpdGrupo.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      qryUpdGrupo.Open;
      //----------------------------------------------------------------------------------
      iTotHist := qryHistorico.RecordCount;
      prgBar.MaxValue := qryHistorico.RecordCount + 2;
      prgBar.Progress := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      qryHistorico.First;
      bFlgNCAF := (qryHistoricoNCAF.AsInteger = 1);
      //----------------------------------------------------------------------------------
      bFlgPrimBem := True;
      while not qryHistorico.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Armazena os IDBEM para posterior reconstrução de Saldo Contábil
         //-------------------------------------------------------------------------------
         if not AcharBem(qryHistoricoIDBEM.AsInteger) then
         begin
            SetLength(aBem,iaBem);
            SetLength(aGrupo,iaBem);
            SetLength(aLocalizacao,iaBem);
            SetLength(aResponsavel,iaBem);
            aBem[iaBem - 1] := qryHistorico.FieldByName('IDBEM').AsInteger;
            aGrupo[iaBem - 1] := qryHistorico.FieldByName('IDGRUPO').AsInteger;
            aLocalizacao[iaBem - 1] := qryHistorico.FieldByName('IDLOCALIZACAO').AsInteger;
            aResponsavel[iaBem - 1] := qryHistorico.FieldByName('IDRESPONSAVEL').AsInteger;
            iaBem := iaBem + 1;
         end;
         //-------------------------------------------------------------------------------
         // Armazena os PLNCODIGO para posterior estorno da planilha contábil
         //-------------------------------------------------------------------------------
         bNovoPlnCodigo := True;
         iAux := 0;
         while iAux <= (iaPlnCodigo - 1) do
         begin
            if aPlnCodigo[iAux] = qryHistoricoPLNCODIGO.AsFloat then
               bNovoPlnCodigo := False;
            iAux := iAux + 1;
         end;
         if bNovoPlnCodigo then
         begin
            iaPlnCodigo := iaPlnCodigo + 1;
            SetLength(aPlnCodigo,iaPlnCodigo);
            aPlnCodigo[iaPlnCodigo - 1] := qryHistoricoPLNCODIGO.AsFloat;
            //----------------------------------------------------------------------------
            sLinha := inttostr(iaPlnCodigo - 1) + ' := ' + qryHistorico.Fieldbyname('PLNCODIGO').AsString;
            Writeln(fLog, sLinha);
         end;
         //-------------------------------------------------------------------------------
         // Armazena os IDMOVIMENTACAO para posterior deleção
         //-------------------------------------------------------------------------------
         SetLength(aHistMov,iaHistMov);
         aHistMov[iaHistMov - 1] := qryHistoricoIDMOVIMENTACAO.AsInteger;
         iaHistMov := iaHistMov + 1;
         //-------------------------------------------------------------------------------
         qryAlteraBem.ParamByName('IDPESSOA').AsInteger := qryHistoricoIDPESSOA.AsInteger;
         qryAlteraBem.ParamByName('IDBEM').AsInteger    := qryHistoricoIDBEM.AsInteger;
         qryAlteraBem.ParamByName('DEPLANC').AsCurrency := qryHistoricoDEPLANC.asFloat - qryHistoricoVALOFI.AsFloat;
         if qryHistoricoDATAULTDEP.IsNull then
         begin
            Raise Exception.Create('Erro na atualização da data da última depreciação do Bem ' +
                                      qryHistoricoIDBEM.AsString);
         end;
         qryAlteraBem.ParamByName('DATAULTDEP').AsDateTime := qryHistoricoDATAULTDEP.AsDateTime;
         qryAlteraBem.ParamByname('FLGDEPREC').AsInteger   := 0;
         qryAlteraBem.ExecSQL;
         //-------------------------------------------------------------------------------
         if qryAlteraBem.RowsAffected < 0 then
         begin
            Raise Exception.Create('Erro na atualização do Bem ' + qryHistoricoIDBEM.AsString);
         end;
         //-------------------------------------------------------------------------------
         if (qryHistoricoIDGRUPO.AsInteger <> qryUpdGrupoIDGRUPO.AsInteger) or bflgPrimBem then
         begin
            bflgPrimBem := False;
            if qryUpdGrupo.Locate('IDGRUPO',qryHistoricoIDGRUPO.AsInteger,[]) then
            begin
               qryUpdGrupo.Edit;
               qryUpdGrupoDATAULTDEP.AsDateTime := qryHistoricoDATAULTDEP.AsDateTime;
               qryUpdGrupo.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         qryHistorico.Next;
      end;
      qryUpdGrupo.ApplyUpdates;
      qryHistorico.Close;
      //----------------------------------------------------------------------------------
      // RETIRA O LINK DA PLANILHA CONTÁBIL
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                         ' SET PLNCODIGO = NULL '+
                         ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO  ' +
                         '                          FROM HISTORICOMOVIMENTACAO HM, ' +
                         '                               BEM B, ' +
                         '                               GRUPO G ' +
                         '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataFechamento.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                         '                            AND (HM.IDTIPOMOVIMENTACAO = 14) ' +
                         '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')) ' +
                         '                            AND (HM.TIPDEPPRORATA = 2) ' +
                         '                            AND (HM.IDBEM  = B.IDBEM) ' +
                         '                            AND (B.IDGRUPO = G.IDGRUPO)) ';
      qryAux.ExecSQL;
      if qryAux.RowsAffected <> iTotHist then
         raise Exception.Create('Houve registros no histórico que não foram desconectados da planilha contábil'+#13+#13+
                                'Custos Desconectados : '+inttostr(qryAux.RowsAffected)+' Total : '+inttostr(qryHistorico.RecordCount));
      //----------------------------------------------------------------------------------
      prgBar.Progress := prgBar.Progress + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      prgBar.Progress := prgBar.Progress + 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      bErro := False;
    except
      on E : Exception do
      begin
         bErro := True;
         MensagemErro := E.Message;
      end;
   end;
   qryUpdGrupo.Close;
end;
//========================================================================================
procedure TFrmEstornaDepreciacao.Estorna_Depreciacao_Reav(var bErro : Boolean);
var
   iGrupoDepIni, iGrupoDepFim, iTotHist,
   iAux : Integer;

begin
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 0;
          end;
   end;
   //-------------------------------------------------------------------------------------
   qryHistReaval.Close;
   qryHistReaval.ParambyName('PIDPESSOA').AsFloat       := Sistema.IdEmpresa;
   qryHistReaval.ParambyName('PDATAMOV').AsDateTime     := edDataFechamento.Date;
   qryHistReaval.ParambyName('PIDTIPOMOV').AsInteger    := 18;  // Depreciação da Reavaliacao
   qryHistReaval.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryHistReaval.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryHistReaval.Open;
   //-------------------------------------------------------------------------------------
   if not qryHistReaval.IsEmpty then
   begin
      try
         case iGrupoDeprec of
            0 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistReaval.RecordCount) +' Reavaliações não Imóveis';
            1 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistReaval.RecordCount) +' Reavaliações Imóveis';
         else
            lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistReaval.RecordCount) +' Reavaliações';
         end;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iTotHist := qryHistReaval.RecordCount;
         prgBar.MaxValue := qryHistReaval.RecordCount + 2;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryHistReaval.First;
         while not qryHistReaval.EOF Do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if not AcharBem(qryHistReavalIDBEM.AsInteger) then
            begin
               SetLength(aBem,iaBem);
               SetLength(aGrupo,iaBem);
               SetLength(aLocalizacao,iaBem);
               SetLength(aResponsavel,iaBem);
               aBem[iaBem - 1] := qryHistReavalIDBEM.AsInteger;
               aGrupo[iaBem - 1] := qryHistReavalIDGRUPO.AsInteger;
               aLocalizacao[iaBem - 1] := qryHistReavalIDLOCALIZACAO.AsInteger;
               aResponsavel[iaBem - 1] := qryHistReavalIDRESPONSAVEL.AsInteger;
               iaBem := iaBem + 1;
            end;
            //----------------------------------------------------------------------------
            // Armazena os PLNCODIGO para posterior estorno da planilha contábil
            //----------------------------------------------------------------------------
            bNovoPlnCodigo := True;
            iAux := 0;
            while iAux <= (iaPlnCodigo - 1) do
            begin
               if aPlnCodigo[iAux] = qryHistReavalPLNCODIGO.AsFloat then
                  bNovoPlnCodigo := False;
               iAux := iAux + 1;
            end;
            if bNovoPlnCodigo then
            begin
               iaPlnCodigo := iaPlnCodigo + 1;
               SetLength(aPlnCodigo,iaPlnCodigo);
               aPlnCodigo[iaPlnCodigo - 1] := qryHistReavalPLNCODIGO.AsFloat;
               //-------------------------------------------------------------------------
               sLinha := inttostr(iaPlnCodigo - 1) + ' := ' + qryHistReaval.FieldByName('PLNCODIGO').AsString;
               Writeln(fLog, sLinha);
            end;
            //----------------------------------------------------------------------------
            // Armazena os IDMOVIMENTACAO para posterior deleção
            //----------------------------------------------------------------------------
            SetLength(aHistMov,iaHistMov);
            aHistMov[iaHistMov - 1] := qryHistReavalIDMOVIMENTACAO.AsInteger;
            iaHistMov := iaHistMov + 1;
            //----------------------------------------------------------------------------
            qryAlteraReaval.ParamByName('IDREAVALIACAO').AsInteger := qryHistReavalIDREAVALIACAO.AsInteger;
            qryAlteraReaval.ParamByName('IDPESSOA').AsInteger      := qryHistReavalIDPESSOA.AsInteger;
            qryAlteraReaval.ParamByName('IDBEM').AsInteger         := qryHistReavalIDBEM.AsInteger;
            qryAlteraReaval.ParamByName('DEPLANC').AsCurrency      := qryHistReavalDEPLANC.asFloat - qryHistReavalVALOFI.AsFloat;
            if qryHistReavalDATAULTDEP.IsNull then
            begin
               Raise Exception.Create('Erro na atualização da data da última depreciação da Reavaliação do Bem ' +
                                         qryHistReavalIDBEM.AsString);
            end;
            qryAlteraReaval.ParamByName('DATAULTDEP').AsDateTime   := qryHistReavalDATAULTDEP.AsDateTime;
            qryAlteraReaval.ParamByname('FLGDEPREC').AsInteger     := 0;
            qryAlteraReaval.ExecSQL;
            //----------------------------------------------------------------------------
            if qryAlteraReaval.RowsAffected < 0 then
            begin
               Raise Exception.Create('Erro na atualização da Reavaliação do Bem ' + qryHistReavalIDBEM.AsString);
            end;
            //----------------------------------------------------------------------------
            qryHistReaval.Next;
         end;
         //-------------------------------------------------------------------------------
         qryHistReaval.Close;
         //-------------------------------------------------------------------------------
         // RETIRA O LINK DA PLANILHA CONTÁBIL
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                            ' SET PLNCODIGO = NULL '+
                            ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO  ' +
                            '                          FROM HISTORICOMOVIMENTACAO HM, ' +
                            '                               BEM B, ' +
                            '                               GRUPO G ' +
                            '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataFechamento.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '                            AND (HM.IDTIPOMOVIMENTACAO = 18) ' +
                            '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')) ' +
                            '                            AND (HM.TIPDEPPRORATA = 2) ' +
                            '                            AND (HM.IDBEM  = B.IDBEM) ' +
                            '                            AND (B.IDGRUPO = G.IDGRUPO)) ';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <> iTotHist then
            raise Exception.Create('Houve registros no histórico que não foram desconectados da planilha contábil'+#13+#13+
                                   'Reavaliações Desconectadas : '+inttostr(qryAux.RowsAffected)+' Total : '+inttostr(iTotHist));
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         bErro := False;
      except
         on E : Exception do
         begin
            bErro := True;
            MensagemErro := E.Message;
         end;
      end;
   end else
   begin
      qryHistReaval.Close;
   end;
end;
//========================================================================================
Function TFrmEstornaDepreciacao.AcharBem(iBem : Integer) : Boolean;
var iAux : Integer;
begin
   if (iaBem - 1) <> 0 then
   begin
      Result := False;
      iAux := 0;
      while iAux < (iaBem - 1) do
      begin
         if aBem[iAux] = iBem then
         begin
            Result := True;
            Exit;
         end;
         iAux := iAux + 1;
      end;
   end else
      result := False;
end;
//========================================================================================
procedure TFrmEstornaDepreciacao.Estorna_Depreciacao_Acresc(var bErro : Boolean);
var
   iGrupoDepIni, iGrupoDepFim, iTotHist,
   iAux : Integer;

begin
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 0;
          end;
   end;
   //-------------------------------------------------------------------------------------
   qryHistAcresc.Close;
   qryHistAcresc.ParambyName('PIDPESSOA').AsFloat       := Sistema.IdEmpresa;
   qryHistAcresc.ParambyName('PDATAMOV').AsDateTime     := edDataFechamento.Date;
   qryHistAcresc.ParambyName('PIDTIPOMOV').AsInteger    := 35; // Depreciação de Acréscimo
   qryHistAcresc.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryHistAcresc.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryHistAcresc.Open;
   if not (qryHistAcresc.IsEmpty) then
   begin
      try
         //-------------------------------------------------------------------------------
         case iGrupoDeprec of
            0 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistAcresc.RecordCount) +' Acréscimos não Imóveis';
            1 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistAcresc.RecordCount) +' Acréscimos Imóveis';
         else
            lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistAcresc.RecordCount) +' Acréscimos de Valor';
         end;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iTotHist := qryHistAcresc.RecordCount;
         prgBar.MaxValue := qryHistAcresc.RecordCount + 2;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryHistAcresc.First;
         while not qryHistAcresc.EOF Do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if not AcharBem(qryHistAcrescIDBEM.AsInteger) then
            begin
               SetLength(aBem,iaBem);
               SetLength(aGrupo,iaBem);
               SetLength(aLocalizacao,iaBem);
               SetLength(aResponsavel,iaBem);
               aBem[iaBem - 1] := qryHistAcrescIDBEM.AsInteger;
               aGrupo[iaBem - 1] := qryHistAcrescIDGRUPO.AsInteger;
               aLocalizacao[iaBem - 1] := qryHistAcrescIDLOCALIZACAO.AsInteger;
               aResponsavel[iaBem - 1] := qryHistAcrescIDRESPONSAVEL.AsInteger;
               iaBem := iaBem + 1;
            end;
            //----------------------------------------------------------------------------
            // Armazena os PLNCODIGO para posterior estorno da planilha contábil
            //----------------------------------------------------------------------------
            bNovoPlnCodigo := True;
            iAux := 0;
            while iAux <= (iaPlnCodigo - 1) do
            begin
               if aPlnCodigo[iAux] = qryHistAcrescPLNCODIGO.AsFloat then
                  bNovoPlnCodigo := False;
               iAux := iAux + 1;
            end;
            if bNovoPlnCodigo then
            begin
               iaPlnCodigo := iaPlnCodigo + 1;
               SetLength(aPlnCodigo,iaPlnCodigo);
               aPlnCodigo[iaPlnCodigo - 1] := qryHistAcrescPLNCODIGO.AsFloat;
               //-------------------------------------------------------------------------
               sLinha := inttostr(iaPlnCodigo - 1) + ' := ' + qryHistAcresc.FieldByName('PLNCODIGO').AsString;
               Writeln(fLog, sLinha);
            end;
            //----------------------------------------------------------------------------
            // Armazena os IDMOVIMENTACAO para posterior deleção
            //----------------------------------------------------------------------------
            SetLength(aHistMov,iaHistMov);
            aHistMov[iaHistMov - 1] := qryHistAcrescIDMOVIMENTACAO.AsInteger;
            iaHistMov := iaHistMov + 1;
            //----------------------------------------------------------------------------
            qryAlteraAcresc.ParamByName('IDACRESCIMO').AsInteger := qryHistAcrescIDACRESCIMO.AsInteger;
            qryAlteraAcresc.ParamByName('IDPESSOA').AsInteger    := qryHistAcrescIDPESSOA.AsInteger;
            qryAlteraAcresc.ParamByName('IDBEM').AsInteger       := qryHistAcrescIDBEM.AsInteger;
            qryAlteraAcresc.ParamByName('DEPLANC').AsCurrency    := qryHistAcrescDEPLANC.asFloat - qryHistAcrescVALOFI.AsFloat;
            if qryHistAcrescDATAULTDEP.IsNull then
            begin
               Raise Exception.Create('Erro na atualização da data da última depreciação do Acréscimo do Bem ' +
                                         qryHistAcrescIDBEM.AsString);
            end;
            qryAlteraAcresc.ParamByName('DATAULTDEP').AsDateTime := qryHistAcrescDATAULTDEP.AsDateTime;
            qryAlteraAcresc.ParamByname('FLGDEPREC').AsInteger   := 0;
            qryAlteraAcresc.ExecSQL;
            //----------------------------------------------------------------------------
            if qryAlteraAcresc.RowsAffected < 0 then
            begin
               Raise Exception.Create('Erro na atualização do Acréscimo de Valor do Bem ' +
                                          qryHistAcrescIDBEM.AsString);
            end;
            //----------------------------------------------------------------------------
            qryHistAcresc.Next;
         end;
         qryHistAcresc.Close;
         //-------------------------------------------------------------------------------
         // RETIRA O LINK DA PLANILHA CONTÁBIL
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                            ' SET PLNCODIGO = NULL '+
                            ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO  ' +
                            '                          FROM HISTORICOMOVIMENTACAO HM, ' +
                            '                               BEM B, ' +
                            '                               GRUPO G ' +
                            '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataFechamento.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '                            AND (HM.IDTIPOMOVIMENTACAO = 35) ' +
                            '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')) ' +
                            '                            AND (HM.TIPDEPPRORATA = 2) ' +
                            '                            AND (HM.IDBEM  = B.IDBEM) ' +
                            '                            AND (B.IDGRUPO = G.IDGRUPO) )';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <> iTotHist then
            raise Exception.Create('Houve registros no histórico que não foram desconectados da planilha contábil'+#13+#13+
                                   'Acréscimos Desconectados : '+inttostr(qryAux.RowsAffected)+' Total : '+inttostr(iTotHist));
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         bErro := False;
      except
         on E : Exception do
         begin
            bErro := True;
            MensagemErro := E.Message;
         end;
      end;
   end else
   begin
      qryHistAcresc.Close;
   end;
end;
//========================================================================================
// Verifica a Ultima Depreciacao Realizada
//----------------------------------------------------------------------------------------
Function TFrmEstornaDepreciacao.Calcula_Ultima_Depreciacao(dDataMov : tDateTime;
                                                           Var dDataUltDep,
                                                               dDataUltFec : tDateTime) : Boolean;
Var
   iGrupoDepIni, iGrupoDepFim : Integer;
begin
   if not qryVerUltDep.Prepared then qryVerUltDep.Prepare;
   if not qryVerUltFec.Prepared then qryVerUltFec.Prepare;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   qryVerUltMov.Close;
   qryVerUltMov.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltMov.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltMov.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltMov.ParamByName('PDATAMOV').AsDateTime     := dDataMov;
   qryVerUltMov.Open;
   //-------------------------------------------------------------------------------------
   if not qryVerUltMov.IsEmpty then
   begin
      MsgDlg('Existe movimentação após o fechamento de '+datetostr(dDataMov)+' !',
             'Erro', mtError, [mbOk], 0);
      Result := False;
      qryVerUltMov.Close;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   qryVerUltDep.Close;
   qryVerUltDep.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltDep.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltDep.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltDep.Open;
   qryVerUltFec.Close;
   qryVerUltFec.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   dDataUltDep := qryVerUltDep.FieldByName('DATAULT').AsDateTime;
   dDataUltFec := qryVerUltFec.FieldByName('DATAULT').AsDateTime;
   Result := True;
   if dDataUltFec = 0 then
   begin
      MsgDlg('Não existe fechamento de periodo para estornar !',
             'Erro', mtError, [mbOk], 0);
      Result := False;
   end else
   if dDataMov = dDataUltFec then
   begin
      if dDataUltDep > dDataUltFec then
      begin
         MsgDlg('Existe movimentação c/ depreciação pró-rata lançada (' + DatetoStr(dDataUltDep) + ') após o fechamento de periodo! (' + datetostr(dDataUltFec) + ')',
                'Erro', mtError, [mbOk], 0);
         Result := False;
      end;
   end else
   begin
      MsgDlg('Data diferente do último fechamento de periodo realizado ! (' + DatetoStr(dDataUltFec) + ')',
             'Erro', mtError, [mbOk], 0);
      Result := False;
   end;
   //-------------------------------------------------------------------------------------
   qryVerUltDep.Close;
   qryVerUltFec.Close;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryVerUltDep.Close;
   qryVerUltFec.Close;
   qryHistorico.Close;
   qryHistReaval.Close;
   qryHistAcresc.Close;
   qryUpdGrupo.Close;
   //-------------------------------------------------------------------------------------
   qryVerUltDep.UnPrepare;
   qryVerUltFec.UnPrepare;
   qryHistorico.UnPrepare;
   qryHistReaval.UnPrepare;
   qryHistAcresc.UnPrepare;
   qryUpdGrupo.UnPrepare;
   qryAlteraBem.UnPrepare;
   qryAlteraReaval.UnPrepare;
   qryAlteraAcresc.UnPrepare;
   qryRemHistMov.UnPrepare;
   qryLegRemValMov.UnPrepare;
   qryLegRemDepBem.UnPrepare;
   qryLegRemDepReav.UnPrepare;
   qryLegRemDepAcresc.UnPrepare;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.edDataFechamentoExit(Sender: TObject);
begin
   inherited;
   eDataEst.Date := edDataFechamento.Date;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.edDataFechamentoChange(Sender: TObject);
begin
   inherited;
   eDataEst.Date := edDataFechamento.Date;
end;
//========================================================================================
Function TFrmEstornaDepreciacao.Testa_Periodo_Contabil(sData: string) : boolean;
var
   iEmpresa : Integer;

begin
   iEmpresa := Sistema.IdEmpresa;
   //-------------------------------------------------------------------------------------
   // busca exercício e número do período referente a data informada
   //-------------------------------------------------------------------------------------
   ResultPeriodo := TestaPeriodo(True,'BaseDados',sData,'2',Exercicio,Periodo,iEmpresa,sMensagem);
   //-------------------------------------------------------------------------------------
   // Testa retornos de erro da função
   //-------------------------------------------------------------------------------------
   if ResultPeriodo = 1 then
   begin
      MsgDlg('Período Contábil inexistente ! Impossível gerar lançamento contábil da '+
             'movimentação do Bem. Altere a data da movimentação. ','Erro',
             mtError,[mbOk],0);
      Planilha := 0;
      Pln      := 0;
      result   := false;
      exit;
   end else
   begin
      if ResultPeriodo = 2 then
      begin
         MsgDlg('Período encontrado, mas não é único ! Impossível gerar lançamento '+
                'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                mtError,[mbOk],0);
         Planilha := 0;
         Pln      := 0;
         result   := false;
         exit;
      end else
         if ResultPeriodo = 3 then
         begin
            MsgDlg('Período já bloqueado pela Contabilidade ! Impossível gerar lançamento '+
                   'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                   mtError,[mbOk],0);
            Planilha := 0;
            Pln      := 0;
            result   := False;
            exit;
         end else
            if ResultPeriodo = 4 then
            begin
               MsgDlg('Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                      'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                      mtError,[mbOk],0);
               planilha := 0;
               Pln      := 0;
               result   := False;
               exit;
            end;
   end;
   //-------------------------------------------------------------------------------------
   result := True;
end;
//========================================================================================
//procedure TFrmEstornaDepreciacao.Estorna_Investimento(var bErro : Boolean);
//begin
//   bErro := False;
//   if ( (Sistema.IdModulo = 64) and (Modulo.bIntegraGestao) ) then
//   begin
//      try
//         // verifica quais registros precisam ser excluídos e marca as flags de acordo
//         with qryBuscaHistoricoExclusao do begin
//            Close;
//            if not(Prepared) then Prepare;
//            ParamByName('DATA').asDateTime := edDataFechamento.Date;
//            Open;
//            //----------------------------------------------------------------------------
//            if not(isEmpty) then begin
//               First;
//               while not(EOF) do begin
//                  OperComum.MarcaFlgHistCartInv('HST',qryBuscaHistoricoExclusaoIDHISTCARTINV.asInteger);
//                  Next;
//               end;
//            end;
//         end;
//         // exclui os registros da HistCartInv
//         with qryExclusaoHistorico do begin
//            Close;
//            if not(Prepared) then Prepare;
//            ParamByName('DATA').asDateTime := edDataFechamento.Date;
//            ExecSQL;
//         end;
//      except
//         bErro := True;
//         Raise;
//      end;
//   end;
//end;

end.
