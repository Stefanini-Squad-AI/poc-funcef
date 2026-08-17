unit fEstornaDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  uAutorizacao,uSistema, Gauges, wwdbdatetimepicker, CMDateTimePicker,
  FOkCancelarImob;

type
  TfrmEstornaDepreciacao = class(TFrmOkCancelarImob)
    Panel1: TPanel;
    Label1: TLabel;
    eDataEst: TCMDateTimePicker;
    Data: TLabel;
    eDataMov: TCMDateTimePicker;
    qryHistorico: TwwQuery;
    qryUpdGrupo: TwwQuery;
    updGrupo: TUpdateSQL;
    qryDelHist: TwwQuery;
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
    qryVerUltDepDATAULT: TDateTimeField;
    qryHistoricoIDMOVIMENTACAO: TFloatField;
    qryHistoricoIDPESSOA: TFloatField;
    qryHistoricoIDBEM: TFloatField;
    qryHistoricoDATAMOVIMENTACAO: TDateTimeField;
    qryHistoricoVALOFI: TFloatField;
    qryHistoricoDATAULTDEP: TDateTimeField;
    qryHistoricoPLNCODIGO: TFloatField;
    qryHistoricoIDESTORNO: TFloatField;
    qryHistoricoDEPLANC: TFloatField;
    qryHistoricoCMBEM: TFloatField;
    qryHistReavalIDMOVIMENTACAO: TFloatField;
    qryHistReavalIDPESSOA: TFloatField;
    qryHistReavalIDBEM: TFloatField;
    qryHistReavalDATAMOVIMENTACAO: TDateTimeField;
    qryHistReavalPLNCODIGO: TFloatField;
    qryHistReavalIDESTORNO: TFloatField;
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
    qryHistAcrescIDESTORNO: TFloatField;
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
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataMovExit(Sender: TObject);
    procedure eDataMovChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //------------------------------------------------------------------------------------
  private
    { Private declarations }
  public
    { Public declarations }
    bErro          : boolean; // verifica se há erro
    bErroDeprec    : boolean; // verifica se há erro na depreciação
    bIntegraContab : boolean; // verifica se há integração com a contabilidade
    bRemovePlanCtb : boolean; // verifica se o estorno é com remoção ou inversão
    resultperiodo,exercicio,periodo,empresa,iPlanoVigente : integer;
    planilha    : longint;
    Pln         : longint;
    CodConjunto : integer;
    CodBem      : integer;
    sMascara    : String;
    bTestaConta : Boolean;
    fCotGerencial,fCotFiscal : Extended;
    sMensagem   : string;
    dDataUltDepAnt : tDateTime;
    iGrupoDeprec : Integer;
    iAux : Integer;
    aBem : Array of Integer;
    iaBem : Integer;
    //------------------------------------------------------------------------------------
    function  AcharBem(iBem : Integer) : Boolean;
    function  Calcula_Ultima_Depreciacao(dDataMov : tDateTime;
                                         Var dDataUlt : tDateTime) : Boolean;
    function  Testa_Periodo_Contabil(sData: string) : boolean;
    procedure Estorna_Depreciacao_Bem(Var bErro : Boolean);
    procedure Estorna_Depreciacao_Reav(var bErro : Boolean);
    procedure Estorna_Depreciacao_Acresc(var bErro : Boolean);
    procedure Estorna_Investimento(var bErro : Boolean);
  end;

  eExcessaoCAF = Class(Exception);

var
  frmEstornaDepreciacao: TfrmEstornaDepreciacao;

implementation

uses dBaseDados, uLancContab, uDatabase, uMensErro, uIntegraBack, uModulo,
     uDiasUteis, uAtivoFixo, uOperComum;

{$R *.DFM}

//========================================================================================
procedure TfrmEstornaDepreciacao.FormCreate(Sender: TObject);
begin
   inherited;
   qryHistorico.Prepare;
   qryHistReaval.Prepare;
   qryHistAcresc.Prepare;
   qryUpdGrupo.Prepare;
   qryDelHist.Prepare;
   qryAlteraBem.Prepare;
   qryAlteraReaval.Prepare;
   qryAlteraAcresc.Prepare;
   qryVerUltDep.Prepare;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.FormActivate(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryParamCaf.Open;
   bIntegraContab := (IntegraBack.Contabilidade = 'S') AND
                     (qryParamCaf.FieldByName('INTEGRACONTAB').AsString = 'S');
   iPlanoVigente  := (qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger);
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT PACESTORNA FROM PARAMCONTAB ' +
                      ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')';
   qryAux.Open;
   bRemovePlanCtb := (qryAux.FieldByName('PACESTORNA').AsString = 'N') AND
                     (qryParamCaf.FieldByName('FLGREMOVEPLANCTB').AsString = 'S');
   //-------------------------------------------------------------------------------------
   if (Sistema.IdModulo = 7) then
   begin
      if copy(qryParamCafSISTEMAS.AsString,4,1) <> '1' then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.bbtnConfirmarClick(Sender: TObject);
Var
   dDataUltDep  : tDateTime;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   if (eDataEst.Text = '') then
   begin
      MsgDlg('Data do Estorno não pode estar vazia! ','Erro',mtError,[mbOk],0);
      eDataEst.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (eDataMov.Text = '') then
   begin
      MsgDlg('Data da Depreciação não pode estar vazia! ','Erro',mtError,[mbOk],0);
      eDataMov.SetFocus;
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
   lblStatus.Caption     := 'Verificando Ultima Depreciação ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   bErro       := False;
   dDataUltDep := eDataMov.Date;
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
      dtmBaseDados.dbBaseDados.StartTransaction;
   //-------------------------------------------------------------------------------------
   try
      if Calcula_Ultima_Depreciacao(eDataMov.Date,dDataUltDep) then
      begin
         iaBem := 1;
         if not bErro then Estorna_Depreciacao_Bem(bErro);
         if not bErro then Estorna_Depreciacao_Reav(bErro);
         if not bErro then Estorna_Depreciacao_Acresc(bErro);
         if not bErro then Estorna_Investimento(bErro);
      end else
      begin
         MsgDlg('Data Anterior a Ultima Depreciação Realizada ! ' + DatetoStr(dDataUltDep),
                'Erro', mtError, [mbOk], 0);
         bErro := True;
      end;
      //----------------------------------------------------------------------------------
      if not bErro then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         //-------------------------------------------------------------------------------
         // Atualiza a tabela SALDOCONTABBEM
         //-------------------------------------------------------------------------------
         if not(dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.StartTransaction;
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Atualizando Saldos ...';
         prgBar.MaxValue := iaBem - 1;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iAux := 0;
         while (iAux <= (iaBem - 1)) do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            if not AtivoFixo.AtualizaSaldoContabBem(Sistema.IdModulo,
                                                    Sistema.IdEmpresa,
                                                    aBem[iAux],
                                                    StrtoDate(eDataMov.Text),
                                                    0,0,0,0,0,0,0,0,0,0,0,0,
                                                    2) then
               Raise eExcessaoCAF.Create('EstornaDepreciação : AtualizaSaldoContabBem');
            iAux := iAux + 1;
         end;
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         MsgDlg('Operação realizada!','Informação',mtInformation,[mbOk],0);
      end else
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Operação não realizada!','Erro',mtError,[mbOk],0);
      end;
   except
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Operação não realizada!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor         := crDefault;
   pnlStatus.Visible     := False;
   bbtnConfirmar.Enabled := True;
end;
//========================================================================================
procedure TFrmEstornaDepreciacao.Estorna_Depreciacao_Bem(Var bErro : Boolean);
var
   iResult, iPlnCodigo,
   iGrupoDepIni, iGrupoDepFim : Integer;
   bflgPrimBem : Boolean;

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
   qryHistorico.ParambyName('PDATAMOV').AsDateTime     := eDataMov.Date;
   qryHistorico.ParambyName('PIDTIPOMOV').AsInteger    := 14;  // Depreciação de Bens
   qryHistorico.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryHistorico.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryHistorico.Open;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Bens não Imóveis';
      1 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Bens Imóveis';
   else
      lblStatus.Caption := 'Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Bens';
   end;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   try
      qryUpdGrupo.Close;
      qryUpdGrupo.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      qryUpdGrupo.Open;
      //----------------------------------------------------------------------------------
      iAux := Round(qryHistorico.RecordCount * 0.1);
      prgBar.MaxValue := qryHistorico.RecordCount + iAux;
      prgBar.Progress := 0;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      qryHistorico.First;
      bflgPrimBem := True;
      iPlnCodigo := qryHistoricoPLNCODIGO.AsInteger;
      while not qryHistorico.EOF do
      begin
         if not AcharBem(qryHistoricoIDBEM.AsInteger) then
         begin
            SetLength(aBem,iaBem);
            aBem[iaBem - 1] := qryHistoricoIDBEM.AsInteger;
            iaBem := iaBem + 1;
         end;
         //-------------------------------------------------------------------------------
         qryAlteraBem.ParamByName('IDPESSOA').AsInteger    := qryHistoricoIDPESSOA.AsInteger;
         qryAlteraBem.ParamByName('IDBEM').AsInteger       := qryHistoricoIDBEM.AsInteger;
         qryAlteraBem.ParamByName('DEPLANC').AsCurrency    := qryHistoricoDEPLANC.asFloat - qryHistoricoVALOFI.AsFloat;
         qryAlteraBem.ParamByName('DATAULTDEP').AsDateTime := qryHistoricoDATAULTDEP.AsDateTime;
         qryAlteraBem.ParamByname('FLGDEPREC').AsInteger   := 0;
         qryAlteraBem.ExecSQL;
         //-------------------------------------------------------------------------------
         if qryAlteraBem.RowsAffected = 0 then
         begin
            MsgDlg('Erro na atualização do Bem ' + qryHistoricoIDBEM.AsString,
            'Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('EstornaDepreciação : qryAlteraBem');
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
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
      end;
      qryUpdGrupo.ApplyUpdates;
      qryHistorico.Close;
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      prgBar.Progress := prgBar.Progress + (iAux Div 5);
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
      begin
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
                            '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + eDataMov.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '                            AND (HM.IDTIPOMOVIMENTACAO = 14) ' +
                            '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')) ' +
                            '                            AND (HM.IDBEM  = B.IDBEM) ' +
                            '                            AND (B.IDGRUPO = G.IDGRUPO)) ';
         qryAux.ExecSQL;
         if (qryAux.RowsAffected <= 0) then
         begin
            msgdlg('Erro na remoção do link com a contabilidade','Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('EstornaDepreciacao : qryRemoveLinkContabil');
         end;
         //-------------------------------------------------------------------------------
         if not bRemovePlanCtb then
         begin
            iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', eDataEst.Text,
                                   Exercicio, Periodo, Sistema.IdEmpresa, sMascara);
            if iResult = -1 then
            begin
               MsgDlg('Estorno da Contabilidade não Executado !',
                      'Erro', mtError, [mbOk], 0);
            end;
         end else
         begin
            iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                  iPlanoVigente, Sistema.IdEmpresa, Sistema.IdUsuario,
                                  True, 0, sMascara);
            if iResult = -1 then
            begin
               MsgDlg('Remoção da Planilha da Contabilidade não Executada !',
                      'Erro', mtError, [mbOk], 0);
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      while (iGrupoDepIni <= iGrupoDepFim) do
      begin
         //-------------------------------------------------------------------------------
         // Remove os valores de movimentacao
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Remove os Lancamentos de Historicos da Depreciacao
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Remove os Historicos de Movimentacao
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         qryDelHist.ParamByName('PDATAMOV').AsDateTime  := eDataMov.Date;
         qryDelHist.ParamByName('PIDTIPOMOV').AsInteger := 14;
         qryDelHist.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
         qryDelHist.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
         qryDelHist.ExecSQL;
         if (qryDelHist.RowsAffected <= 0) then
         begin
            msgdlg('Erro na remoção dos lançamentos no histórico','Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('EstornaDepreciacao : qryRemoveHistorico');
         end;
         //-------------------------------------------------------------------------------
         iGrupoDepIni := iGrupoDepIni + 1;
      end;
      //----------------------------------------------------------------------------------
      prgBar.Progress := prgBar.Progress + (iAux Div 5);
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      bErro := False;
    except
      bErro := True;
   end;
   qryUpdGrupo.Close;
end;
//========================================================================================
procedure TFrmEstornaDepreciacao.Estorna_Depreciacao_Reav(var bErro : Boolean);
var
  iResult, iPlnCodigo,
  iGrupoDepIni, iGrupoDepFim : Integer;

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
   qryHistReaval.ParambyName('PDATAMOV').AsDateTime     := eDataMov.Date;
   qryHistReaval.ParambyName('PIDTIPOMOV').AsInteger    := 18;  // Depreciação da Reavaliacao
   qryHistReaval.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryHistReaval.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryHistReaval.Open;
   //-------------------------------------------------------------------------------------
   if not (qryHistReaval.IsEmpty) then
   begin
      try
         case iGrupoDeprec of
            0 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistReaval.RecordCount) +' Reavaliações não Imóveis';
            1 : lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistReaval.RecordCount) +' Reavaliações Imóveis';
         else
            lblStatus.Caption := 'Estornando Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Reavaliações';
         end;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iAux := Round(qryHistReaval.RecordCount * 0.1);
         prgBar.MaxValue := qryHistReaval.RecordCount + iAux;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryHistReaval.First;
         iPlnCodigo := qryHistReavalPLNCODIGO.AsInteger;
         while not qryHistReaval.EOF Do
         begin
            if not AcharBem(qryHistReavalIDBEM.AsInteger) then
            begin
               SetLength(aBem,iaBem);
               aBem[iaBem - 1] := qryHistReavalIDBEM.AsInteger;
               iaBem := iaBem + 1;
            end;
            //----------------------------------------------------------------------------
            qryAlteraReaval.ParamByName('IDREAVALIACAO').AsInteger := qryHistReavalIDREAVALIACAO.AsInteger;
            qryAlteraReaval.ParamByName('IDPESSOA').AsInteger      := qryHistReavalIDPESSOA.AsInteger;
            qryAlteraReaval.ParamByName('IDBEM').AsInteger         := qryHistReavalIDBEM.AsInteger;
            qryAlteraReaval.ParamByName('DEPLANC').AsCurrency      := qryHistReavalDEPLANC.asFloat - qryHistReavalVALOFI.AsFloat;
            if qryHistReavalDATAULTDEP.IsNull then
            begin
               MsgDlg('Erro na atualização da data da última depreciação da Reavaliação do Bem ' +
                      qryHistReavalIDBEM.AsString, 'Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('EstornaDeprecReaval : qryAlteraReaval');
            end;
            qryAlteraReaval.ParamByName('DATAULTDEP').AsDateTime   := qryHistReavalDATAULTDEP.AsDateTime;
            qryAlteraReaval.ParamByname('FLGDEPREC').AsInteger     := 0;
            qryAlteraReaval.ExecSQL;
            //----------------------------------------------------------------------------
            if qryAlteraReaval.RowsAffected = 0 then
            begin
               MsgDlg('Erro na atualização da Reavaliação do Bem ' + qryHistReavalIDBEM.AsString,
                      'Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('EstornaDeprecReaval : qryAlteraReaval');
            end;
            //----------------------------------------------------------------------------
            qryHistReaval.Next;
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
         end;
         //-------------------------------------------------------------------------------
         qryHistReaval.Close;
         //-------------------------------------------------------------------------------
         // Estorna Lancamento da Contabilidade
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET PLNCODIGO = NULL '+
                               ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO  ' +
                               '                          FROM HISTORICOMOVIMENTACAO HM, ' +
                               '                               BEM B, ' +
                               '                               GRUPO G ' +
                               '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + eDataMov.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                               '                            AND (HM.IDTIPOMOVIMENTACAO = 18) ' +
                               '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')) ' +
                               '                            AND (HM.IDBEM  = B.IDBEM) ' +
                               '                            AND (B.IDGRUPO = G.IDGRUPO)) ';
            qryAux.ExecSQL;
            if (qryAux.RowsAffected <= 0) then
            begin
               msgdlg('Erro na remoção do link com a contabilidade','Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('EstornaDeprecReaval : qryRemoveLinkContabil');
            end;
            if not bRemovePlanCtb then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', eDataEst.Text,
                                      Exercicio, Periodo, Sistema.IdEmpresa, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('(Reavaliações) Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end else
            begin
               iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                     iPlanoVigente, Sistema.IdEmpresa, Sistema.IdUsuario,
                                     True, 0, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('(Reavaliações) Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         while (iGrupoDepIni <= iGrupoDepFim) do
         begin
            //----------------------------------------------------------------------------
            // Remove os Valores da Movimentacao
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + (iAux Div 5);
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Remove os Lancamentos de Historicos da Depreciacao de Reavaliacao
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + (iAux Div 5);
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Remove os Historicos de Movimentacao
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + (iAux Div 5);
            Application.ProcessMessages;
            qryDelHist.ParamByName('PDATAMOV').AsDateTime  := eDataMov.Date;
            qryDelHist.ParamByName('PIDTIPOMOV').AsInteger := 18;
            qryDelHist.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
            qryDelHist.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
            qryDelHist.ExecSql;
            //----------------------------------------------------------------------------
            iGrupoDepIni := iGrupoDepIni + 1;
         end;
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         bErro := False;
      except
         bErro := True;
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
      iAux := 0;
      while (iAux <= (iaBem - 1)) and (aBem[iAux] <> iBem) do
         iAux := iAux + 1;
      result := not (iAux > (iaBem - 1));
   end else
      result := False;
end;
//========================================================================================
procedure TFrmEstornaDepreciacao.Estorna_Depreciacao_Acresc(var bErro : Boolean);
var
   iResult, iPlnCodigo,
   iGrupoDepIni, iGrupoDepFim : Integer;

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
   qryHistAcresc.ParambyName('PDATAMOV').AsDateTime     := eDataMov.Date;
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
            lblStatus.Caption := 'Depreciação - '+ inttostr(qryHistorico.RecordCount) +' Acréscimos de Valor';
         end;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iAux := Round(qryHistAcresc.RecordCount * 0.1);
         prgBar.MaxValue := qryHistAcresc.RecordCount + iAux;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryHistAcresc.First;
         iPlnCodigo := qryHistAcresc.FieldByName('PLNCODIGO').AsInteger;
         while not qryHistAcresc.EOF Do
         begin
            if not AcharBem(qryHistAcrescIDBEM.AsInteger) then
            begin
               SetLength(aBem,iaBem);
               aBem[iaBem - 1] := qryHistAcrescIDBEM.AsInteger;
               iaBem := iaBem + 1;
            end;
            //----------------------------------------------------------------------------
            qryAlteraAcresc.ParamByName('IDACRESCIMO').AsInteger := qryHistAcrescIDACRESCIMO.AsInteger;
            qryAlteraAcresc.ParamByName('IDPESSOA').AsInteger    := qryHistAcrescIDPESSOA.AsInteger;
            qryAlteraAcresc.ParamByName('IDBEM').AsInteger       := qryHistAcrescIDBEM.AsInteger;
            qryAlteraAcresc.ParamByName('DEPLANC').AsCurrency    := qryHistAcrescDEPLANC.asFloat - qryHistAcrescVALOFI.AsFloat;
            qryAlteraAcresc.ParamByName('DATAULTDEP').AsDateTime := qryHistAcrescDATAULTDEP.AsDateTime;
            qryAlteraAcresc.ParamByname('FLGDEPREC').AsInteger   := 0;
            qryAlteraAcresc.ExecSQL;
            //----------------------------------------------------------------------------
            if qryAlteraAcresc.RowsAffected = 0 then
            begin
               MsgDlg('Erro na atualização do Acréscimo de Valor do Bem ' + qryHistAcrescIDBEM.AsString,
                      'Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('EstornaDeprecAcresc : qryAlteraAcresc');
            end;
            //----------------------------------------------------------------------------
            qryHistAcresc.Next;
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
         end;
         qryHistAcresc.Close;
         //-------------------------------------------------------------------------------
         // Estorna Lancamento da Contabilidade
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         if bIntegraContab then
         begin
            //----------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET PLNCODIGO = NULL '+
                               ' WHERE IDMOVIMENTACAO IN (SELECT HM.IDMOVIMENTACAO  ' +
                               '                          FROM HISTORICOMOVIMENTACAO HM, ' +
                               '                               BEM B, ' +
                               '                               GRUPO G ' +
                               '                          WHERE (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + eDataMov.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                               '                            AND (HM.IDTIPOMOVIMENTACAO = 35) ' +
                               '                            AND ((G.FLGIMOVEL = ' + inttostr(iGrupoDepIni) + ') OR (G.FLGIMOVEL = ' + inttostr(iGrupoDepFim) + ')) ' +
                               '                            AND (HM.IDBEM  = B.IDBEM) ' +
                               '                            AND (B.IDGRUPO = G.IDGRUPO) )';
            qryAux.ExecSQL;
            if (qryAux.RowsAffected <= 0) then
            begin
               msgdlg('Erro na remoção do link com a contabilidade','Erro',mtError,[mbOk],0);
               Raise eExcessaoCAF.Create('EstornaDeprecAcresc : qryRemoveLinkContabil');
            end;
            //----------------------------------------------------------------------------
            if not bRemovePlanCtb then
            begin
               iResult := EstornaLanc(True, iPlnCodigo, 'BASEDADOS', eDataEst.Text,
                                      Exercicio, Periodo, Sistema.IdEmpresa, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('(Acréscimos) Estorno da Contabilidade não Executado !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end else
            begin
               iResult := ExcluiLanc(True, iPlnCodigo, 'BASEDADOS', inttostr(Sistema.IdModulo),
                                     iPlanoVigente, Sistema.IdEmpresa, Sistema.IdUsuario,
                                     True, 0, sMascara);
               if iResult = -1 then
               begin
                  MsgDlg('(Acréscimos) Remoção da Planilha da Contabilidade não Executada !',
                         'Erro', mtError, [mbOk], 0);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         while (iGrupoDepIni <= iGrupoDepFim) do
         begin
            //----------------------------------------------------------------------------
            // Remove os Valores da Movimentacao
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + (iAux Div 5);
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Remove os Lancamentos de Historicos da Depreciacao de Acrescimo
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + (iAux Div 5);
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Remove os Historicos de Movimentacao
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + (iAux Div 5);
            Application.ProcessMessages;
            qryDelHist.ParamByName('PDATAMOV').AsDateTime  := eDataMov.Date;
            qryDelHist.ParamByName('PIDTIPOMOV').AsInteger := 35;
            qryDelHist.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
            qryDelHist.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
            qryDelHist.ExecSql;
            //----------------------------------------------------------------------------
            iGrupoDepIni := iGrupoDepIni + 1;
         end;
         prgBar.Progress := prgBar.Progress + (iAux Div 5);
         Application.ProcessMessages;
         bErro := False;
      except
         bErro := True;
      end;
   end else
   begin
      qryHistAcresc.Close;
   end;
end;
//========================================================================================
// Verifica a Ultima Depreciacao Realizada
//----------------------------------------------------------------------------------------
Function TFrmEstornaDepreciacao.Calcula_Ultima_Depreciacao(dDataMov : tDateTime; Var dDataUlt : tDateTime) : Boolean;
Var
   iGrupoDepIni, iGrupoDepFim : Integer;
begin
   if not qryVerUltDep.Prepared then qryVerUltDep.Prepare;
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
   qryVerUltDep.Close;
   qryVerUltDep.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
   qryVerUltDep.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   qryVerUltDep.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   qryVerUltDep.Open;
   //-------------------------------------------------------------------------------------
   Result   := (dDataMov = qryVerUltDepDATAULT.AsDateTime);
   dDataUlt := qryVerUltDepDATAULT.AsDateTime;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryVerUltDep.Close;
   qryHistorico.Close;
   qryHistReaval.Close;
   qryHistAcresc.Close;
   qryUpdGrupo.Close;
   //-------------------------------------------------------------------------------------
   qryVerUltDep.UnPrepare;
   qryHistorico.UnPrepare;
   qryHistReaval.UnPrepare;
   qryHistAcresc.UnPrepare;
   qryUpdGrupo.UnPrepare;
   qryDelHist.UnPrepare;
   qryAlteraBem.UnPrepare;
   qryAlteraReaval.UnPrepare;
   qryAlteraAcresc.UnPrepare;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.eDataMovExit(Sender: TObject);
begin
   inherited;
   eDataEst.Date := eDataMov.Date;
end;
//========================================================================================
procedure TfrmEstornaDepreciacao.eDataMovChange(Sender: TObject);
begin
   inherited;
   eDataEst.Date := eDataMov.Date;
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
   ResultPeriodo := TestaPeriodo(True,'BaseDados',sData,'2',Exercicio,Periodo,iEmpresa,
                                                                               sMensagem);
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
procedure TFrmEstornaDepreciacao.Estorna_Investimento(var bErro : Boolean);
begin
   bErro := False;
   if ( (Sistema.IdModulo = 64) and (Modulo.bIntegraGestao) ) then
   begin
      try
         // verifica quais registros precisam ser excluídos e marca as flags de acordo ---
         with qryBuscaHistoricoExclusao do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('DATA').asDateTime := eDataMov.Date;
            Open;
            //----------------------------------------------------------------------------
            if not(isEmpty) then begin
               First;
               while not(EOF) do begin
                  OperComum.MarcaFlgHistCartInv('HST',qryBuscaHistoricoExclusaoIDHISTCARTINV.asInteger);
                  Next;
               end;
            end;
         end;
         // exclui os registros da HistCartInv
         with qryExclusaoHistorico do begin
            Close;
            if not(Prepared) then Prepare;
            ParamByName('DATA').asDateTime := eDataMov.Date;
            ExecSQL;
         end;
      except
         bErro := True;
         Raise;
      end;
   end;
end;



end.
