unit fReconDeprecBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdbedit, Db, Wwdatsrc, DBTables, Wwquery, Gauges;

type
  TfrmReconDeprecBem = class(TfrmOkCancelar)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qrySelBem: TwwQuery;
    dsSelBem: TwwDataSource;
    Label4: TLabel;
    edDescBem: TwwDBEdit;
    bbtnSelBem: TBitBtn;
    Label1: TLabel;
    eDataInicioDep: TCMDateTimePicker;
    Panel2: TPanel;
    Label2: TLabel;
    eDtaIni: TCMDateTimePicker;
    eDtaFim: TCMDateTimePicker;
    Panel3: TPanel;
    qryDeprecBem: TwwQuery;
    qryDeprecReav: TwwQuery;
    qryDeprecAcresc: TwwQuery;
    qryGrupo: TwwQuery;
    qryGrupoDATAULTDEP: TDateTimeField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDTAINCLUSAO: TDateTimeField;
    qrySelBemDATAINICIODEP: TDateTimeField;
    qrySelBemIDGRUPO: TFloatField;
    qrySelBemIDLOCALIZACAO: TFloatField;
    qrySelBemIDRESPONSAVEL: TFloatField;
    qrySelBemBAIXATOTAL: TStringField;
    qrySelBemPROPBAIXA: TFloatField;
    qrySelBemIDMODULO: TFloatField;
    GroupBox1: TGroupBox;
    edPlaca: TwwDBEdit;
    edDataBaixa: TCMDateTimePicker;
    qryBaixa: TwwQuery;
    qryBaixaIDMOVIMENTACAO: TFloatField;
    qryBaixaDATAMOVIMENTACAO: TDateTimeField;
    Panel1: TPanel;
    ckbEstornaBaixa: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eDtaIniExit(Sender: TObject);
    procedure eDtaFimExit(Sender: TObject);
    procedure eDtaIniChange(Sender: TObject);
    procedure eDtaFimEnter(Sender: TObject);
    procedure eDataInicioDepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bFlgPrim : Boolean;
    //------------------------------------------------------------------------------------
    function ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                dDataMov : tDateTime;
                                iTipDepProRata : Integer;
                                Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;

    function EstornaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                dDataMov, dDataEst : tDate) : Boolean;

    function ExecutaBaixa(iModulo, iEmpresaProp, iBem, iMotivoBaixa : Integer;
                          dDataBaixa : tDate; iTipoPropBaixa : Integer;
                          fPropBaixa, fValVenda : Extended;
                          sObsBaixa : String) : Boolean;

    function EstornaBaixa(iModulo, iEmpresaProp, iBem : Integer;
                          dDataMov,dDataEst : tDate) : Boolean;

    function CalcProxData(dDataMov : tDate; iMov : Integer) : tDate;

    Procedure ParamFatorPeriodo(var rFator : Extended; sDataUltDep, sDataMov : string);
  end;

  eExcessaoCAF = Class(Exception);

var
  frmReconDeprecBem: TfrmReconDeprecBem;

implementation

uses uSistema, dBaseDados, uDatabase, uMensErro, uDiasUteis, uAtivoFixo, dAtivoFixo;

{$R *.DFM}

procedure TfrmReconDeprecBem.FormCreate(Sender: TObject);
begin
   inherited;
   qrySelBem.Prepare;
   qryBaixa.Prepare;
end;

procedure TfrmReconDeprecBem.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsFloat := StrToFloat(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      eDataInicioDep.Date := qrySelBemDATAINICIODEP.asDateTime;
      eDtaIni.Date        := qrySelBemDATAINICIODEP.asDateTime;
      //----------------------------------------------------------------------------------
      qryGrupo.Close;
      qryGrupo.ParamByName('PIDGRUPO').AsInteger := qrySelBemIDGRUPO.AsInteger;
      qryGrupo.Open;
      eDtaFim.Date := qryGrupoDATAULTDEP.AsDateTime;
      //----------------------------------------------------------------------------------
      ckbEstornaBaixa.Checked := (qrySelBem.FieldByName('BAIXATOTAL').AsString = 'S');
      qryBaixa.Close;
      qryBaixa.ParamByName('IDBEM').AsInteger := qrySelBemIDBEM.AsInteger;
      qryBaixa.ParamByName('IDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
      qryBaixa.Open;
   end else
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      qrySelBem.ParamByName('PIDBEM').AsInteger := -1;
      qrySelBem.Open;
      eDataInicioDep.Text := '';
      eDtaIni.Text := '';
      eDtaFim.Text := '';
      ckbEstornaBaixa.Checked := False;
      qryBaixa.Close;
      qryBaixa.ParamByName('IDBEM').AsInteger := -1;
      qryBaixa.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryBaixa.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmReconDeprecBem.bbtnConfirmarClick(Sender: TObject);
Var
   dDataDep                          : tDate;
   fDepCmBem, fDepDepLanc, fDepCmDep : Extended;
   bFlgBaixa                         : Boolean;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   if (edDataBaixa.Text <> '') and (not qryBaixa.IsEmpty) then
      ckbEstornaBaixa.Checked := True;
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue   := round((eDtaFim.Date - eDtaIni.Date) / 30.44) + 1;
      prgBar.Progress   := 0;
      lblStatus.Caption := 'Preparando ...';
      pnlStatus.Visible := True;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Estorna Baixa executada em data errada
      //----------------------------------------------------------------------------------
      if ckbEstornaBaixa.Checked then
      begin
         //-------------------------------------------------------------------------------
         if (not qryBaixa.IsEmpty) and (qrySelBemBAIXATOTAL.AsString = 'S') then
         begin
            if not EstornaBaixa(qrySelBem.FieldByName('IDMODULO').AsInteger,
                                qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                qrySelBem.FieldByName('IDBEM').AsInteger,
                                qryBaixa.FieldByName('DATAMOVIMENTACAO').AsDateTime,
                                qryBaixa.FieldByName('DATAMOVIMENTACAO').AsDateTime) then
               Raise eExcessaoCAF.Create('Não foi possível estornar a baixa do Bem ' +
                                         trim(qrySelBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(qrySelBem.FieldByName('PLACA').AsFloat) +
                                         ' (EstornaBaixa)');
         end;
      end;
      //----------------------------------------------------------------------------------
      // Estorna os lançamentos de depreciacao no periodo especificado
      //----------------------------------------------------------------------------------
      prgBar.Progress := 0;
      dDataDep := eDtaFim.Date;
      while dDataDep >= eDtaIni.Date do
      begin
         lblStatus.Caption := 'Estornando Mês ' + copy(datetostr(dDataDep),4,7);
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if not EstornaDepreciacao(qrySelBem.FieldByName('IDMODULO').AsInteger,
                                   qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                   qrySelBem.FieldByName('IDBEM').AsInteger,
                                   dDataDep, dDataDep) then
            Raise eExcessaoCAF.Create('Não foi possível estornar a depreciação do mês ' + copy(datetostr(dDataDep),4,7) + #13 +
                                      trim(qrySelBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      qrySelBem.FieldByName('PLACA').AsString + ' (EstornaDepreciacao)');
         //-------------------------------------------------------------------------------
         dDataDep := CalcProxData(dDataDep, -1);
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Ajustando Saldos';
      prgBar.Progress := 0;
      Application.ProcessMessages;
      if not AtivoFixo.AtualizaSaldoContabBem(qrySelBem.FieldByName('IDMODULO').AsInteger,
                                              qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                              qrySelBem.FieldByName('IDBEM').AsInteger,
                                              qrySelBem.FieldByName('DTAINCLUSAO').AsDateTime,
                                              0,0,0,0,0,0,0,0,0,0,0,0,
                                              qrySelBem.FieldByName('IDGRUPO').AsInteger,
                                              qrySelBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                              qrySelBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
         Raise eExcessaoCAF.Create('Não foi possível atualizar o saldo contábil do bem ' +
                                   trim(qrySelBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   qrySelBem.FieldByName('PLACA').AsString +
                                   ' (AtualizaSaldoContabBem)');
      //----------------------------------------------------------------------------------
      // Altera a data final do periodo se for solicitada a baixa do bem dentro do periodo
      // de depreciação do grupo ao qual pertence o bem
      //----------------------------------------------------------------------------------
      if edDataBaixa.Text <> '' then                     // Executa a Baixa do Bem na Data
         if edDataBaixa.Date > eDtaFim.Date then
         begin
            Raise eExcessaoCAF.Create('Não é possível baixar um bem após a data do último fechamento.' + #13 +
                                      'Reconstrua a sua depreciação e em seguida use Movimentações/Baixa de Bens');
         end else
         begin
            eDtaFim.Date := edDataBaixa.Date;
         end;
      //----------------------------------------------------------------------------------
      // Recalcula os lançamentos de depreciacao no periodo especificado
      //----------------------------------------------------------------------------------
      prgBar.MaxValue   := round((eDtaFim.Date - eDtaIni.Date) / 30.44) + 1;
      prgBar.Progress := 0;
      bFlgPrim  := True;
      bFlgBaixa := False;
      dDataDep  := eDtaIni.Date;
      while dDataDep <= eDtaFim.Date do
      begin
         lblStatus.Caption := 'Processando Mês ' + copy(datetostr(dDataDep),4,7);
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if not ExecutaDepreciacao(qrySelBem.FieldByName('IDMODULO').AsInteger,
                                   qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                   qrySelBem.FieldByName('IDBEM').AsInteger,
                                   dDataDep, 2, fDepCmBem, fDepDepLanc, fDepCmDep) then
         begin
            Raise eExcessaoCAF.Create('Não foi possível executar a depreciação do mês ' + copy(datetostr(dDataDep),4,7) + #13 +
                                      trim(qrySelBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      qrySelBem.FieldByName('PLACA').AsString + ' (ExecutaDepreciacao)');
         end;
         //-------------------------------------------------------------------------------
         if bFlgPrim then
            bFlgPrim := False;
         //-------------------------------------------------------------------------------
         // Executa a Baixa
         //-------------------------------------------------------------------------------
         if bFlgBaixa then
         begin
            if not ExecutaBaixa(qrySelBemIDMODULO.AsInteger,
                                qrySelBemIDPESSOA.AsInteger,
                                qrySelBemIDBEM.AsInteger,
                                6, edDataBaixa.Date, 0, 100, 0, 'Implantação') then
            begin
               Raise eExcessaoCAF.Create('Não foi possível executar a baixa do bem' + #13 +
                                         trim(qrySelBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         qrySelBem.FieldByName('PLACA').AsString + ' (ExecutaBaixa)');
            end;
         end;
         //-------------------------------------------------------------------------------
         dDataDep := CalcProxData(dDataDep, 1);
         if edDataBaixa.Text <> '' then
         begin
            if (not bFlgBaixa) and (dDataDep > edDataBaixa.Date) then
            begin
               bFlgBaixa := True;
               dDataDep := edDataBaixa.Date - 1;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Ajustando Saldos';
      prgBar.Progress := 0;
      Application.ProcessMessages;
      if not AtivoFixo.AtualizaSaldoContabBem(qrySelBem.FieldByName('IDMODULO').AsInteger,
                                              qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                              qrySelBem.FieldByName('IDBEM').AsInteger,
                                              qrySelBem.FieldByName('DTAINCLUSAO').AsDateTime,
                                              0,0,0,0,0,0,0,0,0,0,0,0,
                                              qrySelBem.FieldByName('IDGRUPO').AsInteger,
                                              qrySelBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                              qrySelBem.FieldByName('IDRESPONSAVEL').AsInteger, 2) then
      begin
         Raise eExcessaoCAF.Create('Não foi possível atualizar o saldo contábil do bem ' +
                                   trim(qrySelBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   qrySelBem.FieldByName('PLACA').AsString +
                                   ' (AtualizaSaldoContabBem)');
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Processamento Abortado.' + #13 + #13 +
                'Excessão : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger := -1;
   qrySelBem.Open;
   eDataInicioDep.Text := '';
   eDtaIni.Text := '';
   eDtaFim.Text := '';
   edDataBaixa.Text := '';
   ckbEstornaBaixa.Checked := False;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   Application.ProcessMessages;
end;
//========================================================================================
function TfrmReconDeprecBem.ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                               dDataMov : tDateTime;
                                               iTipDepProRata : Integer;
                                               Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;
Var
   iSeqHist, iTipoMovimentacao          : Integer;
   rTaxa, rFator, DepTotalO             : Extended;
   dDataUltDep                          : tDateTime;
   qryBem, qryReavaliacao, qryAcrescimo : TwwQuery;
   dDataUltDepAnt                       : tDateTime;
   iDia, iMes, iAno                     : Word;

begin
   //-------------------------------------------------------------------------------------
   // Caso o dia da movimentação seja 01, não calcular o pró-rata (CBS em 06/12/2001)
   //-------------------------------------------------------------------------------------
   if iTipDepProRata = 0 then
   begin
      DecodeDate((dDataMov + 1),iAno,iMes,iDia);
   end else
   begin
      DecodeDate(dDataMov,iAno,iMes,iDia);
   end;
   if iDia = 1 then
   begin
      Result := True;
      Exit;
   end;
   //----------------------------------------------------------------------------------
   try
      qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
      qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
      qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      fDepDepLanc := 0;
      //----------------------------------------------------------------------------------
      // Atualiza Parametros
      //----------------------------------------------------------------------------------
      if bFlgPrim then
      begin
         if eDataInicioDep.Date <> eDtaIni.Date then
         begin
            qryBem.FieldByName('DATAINICIODEP').asDateTime := eDataInicioDep.Date;
            qryBem.FieldByName('DATAULTDEP').asDateTime    := eDataInicioDep.Date;
         end else
         begin
            qryBem.FieldByName('DATAINICIODEP').asDateTime := CalcProxData(eDataInicioDep.Date,-1);
            qryBem.FieldByName('DATAULTDEP').asDateTime    := CalcProxData(eDataInicioDep.Date,-1);
         end;
      end;
      dDataUltDep    := qryBem.FieldByName('DATAULTDEP').AsDateTime;
      dDataUltDepAnt := qryBem.FieldByName('DATAULTDEP').asDateTime;
      //----------------------------------------------------------------------------------
      ParamFatorPeriodo(rFator,datetostr(dDataUltDep),datetostr(dDataMov));
      //----------------------------------------------------------------------------------
      // Se calcula a depreciação -> Calcular a Depreciação do Mes
      //----------------------------------------------------------------------------------
      if ((qryBem.FieldByName('FLGDEPREC').AsInteger = 0) or
          (qryBem.FieldByName('FLGDEPREC').IsNull)) and
          (rFator <> 0) and (qryBem.FieldByName('TAXADEP').AsFloat <> 0) then
      begin
         //-------------------------------------------------------------------------------
         rTaxa     := ((qryBem.FieldByName('TAXADEP').AsFloat / 100) * rFator);
         DepTotalO := (rTaxa * (qryBem.FieldByName('VALORG').AsFloat +
                                qryBem.FieldByName('CMBEM').AsFloat));
         if abs(DepTotalO) >= 0.01 then
            DepTotalO := strtofloat(FormatFloat('#0.00',((DepTotalO * 100) / 100)));
         //-------------------------------------------------------------------------------
         if (qryBem.FieldByName('DEPLANC').AsFloat + DepTotalO +
            (qryBem.FieldByName('CMDEP').AsFloat)) >=
            (qryBem.FieldByName('VALORG').AsFloat +
            (qryBem.FieldByName('CMBEM').AsFloat)) then
         begin
            DepTotalO := (qryBem.FieldByName('VALORG').AsFloat +
                          qryBem.FieldByName('CMBEM').AsFloat) -
                         (qryBem.FieldByName('DEPLANC').AsFloat +
                          qryBem.FieldByName('CMDEP').AsFloat);
            qryBem.FieldByName('FLGDEPREC').AsInteger := 1;
         end else
         begin
            qryBem.FieldByName('FLGDEPREC').AsInteger := 0;
         end;
         //-------------------------------------------------------------------------------
         qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsFloat +
                                                     DepTotalO;
         //-------------------------------------------------------------------------------
         fDepDepLanc := DepTotalO;
         //-------------------------------------------------------------------------------
         if (DepTotalO <> 0) then
         begin
            //----------------------------------------------------------------------------
            // Registra o Historico de Movimentacao
            //----------------------------------------------------------------------------
            iTipoMovimentacao := 14;
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                                       dDataMov,-1,DepTotalO,0,0,dDataUltDepAnt,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
            //----------------------------------------------------------------------------
            qryBem.FieldByName('DATARECALCDEP').AsDateTime := dDataUltDep;
            qryBem.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
            qryBem.Post;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Depreciacao das Reavaliações
      //----------------------------------------------------------------------------------
      qryReavaliacao.First;
      while not qryReavaliacao.EOF do
      begin
         qryReavaliacao.Edit;
         //-------------------------------------------------------------------------------
         // Atualiza Parametros
         //-------------------------------------------------------------------------------
         if bFlgPrim then
         begin
            qryReavaliacao.FieldByName('DATAULTDEP').asDateTime := qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime;
         end;
         dDataUltDep    := qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime;
         dDataUltDepAnt := qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime;
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,datetostr(dDataUltDep),datetostr(dDataMov));
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         if ((qryReavaliacao.FieldByName('FLGDEPREC').AsInteger = 0) or
             (qryReavaliacao.FieldByName('FLGDEPREC').IsNull)) and
             (rFator > 0) and (qryReavaliacao.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            rTaxa     := ((qryReavaliacao.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            DepTotalO := (rTaxa * (qryReavaliacao.FieldByName('VALORG').AsFloat +
                                   qryReavaliacao.FieldByName('CMBEM').AsFloat));
            if abs(DepTotalO) >= 0.01 then
               DepTotalO := strtofloat(FormatFloat('#0.00',((DepTotalO * 100) / 100)));
            //----------------------------------------------------------------------------
            if abs(qryReavaliacao.FieldByName('DEPLANC').AsFloat + DepTotalO + qryReavaliacao.FieldByName('CMDEP').AsFloat) >=
               abs(qryReavaliacao.FieldByName('VALORG').AsFloat + qryReavaliacao.FieldByName('CMBEM').AsFloat) then
            begin
               DepTotalO := ( qryReavaliacao.FieldByName('VALORG').AsFloat    +
                              qryReavaliacao.FieldByName('CMBEM').AsFloat   ) -
                            ( qryReavaliacao.FieldByName('DEPLANC').AsFloat   +
                              qryReavaliacao.FieldByName('CMDEP').AsFloat   );
               qryReavaliacao.FieldByName('FLGDEPREC').AsInteger := 1;
            end else
            begin
               qryReavaliacao.FieldByName('FLGDEPREC').AsInteger := 0;
            end;
            qryReavaliacao.FieldByName('DEPLANC').AsCurrency :=
                                qryReavaliacao.FieldByName('DEPLANC').AsFloat + DepTotalO;
            //----------------------------------------------------------------------------
            fDepDepLanc := fDepDepLanc + DepTotalO;
            //----------------------------------------------------------------------------
            if DepTotalO <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra o Historico de Movimentacao
               //-------------------------------------------------------------------------
               iTipoMovimentacao := 18;
               iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                                          dDataMov,
                                                          qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                          DepTotalO,0,0,dDataUltDepAnt,
                                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,True);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
               //-------------------------------------------------------------------------
               qryReavaliacao.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               qryReavaliacao.Post;
            end;
            //----------------------------------------------------------------------------
         end;
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Depreciacao dos Acréscimos
      //----------------------------------------------------------------------------------
      qryAcrescimo.First;
      while not qryAcrescimo.EOF do
      begin
         qryAcrescimo.Edit;
         //-------------------------------------------------------------------------------
         // Atualiza Parametros
         //-------------------------------------------------------------------------------
         if bFlgPrim then
         begin
            qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime := qryAcrescimo.FieldByName('DATAACRESCIMO').AsDateTime;
         end;
         dDataUltDep    := qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime;
         dDataUltDepAnt := qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime;
         //-------------------------------------------------------------------------------
         ParamFatorPeriodo(rFator,datetostr(dDataUltDep),datetostr(dDataMov));
         //-------------------------------------------------------------------------------
         // Se calcula a depreciação -> Calcular a Depreciação do Mes
         //-------------------------------------------------------------------------------
         if ((qryAcrescimo.FieldByName('FLGDEPREC').AsInteger = 0) or
             (qryAcrescimo.FieldByName('FLGDEPREC').IsNull)) and
             (rFator > 0) and (qryAcrescimo.FieldByName('TAXADEP').AsFloat > 0) then
         begin
            //----------------------------------------------------------------------------
            rTaxa     := ((qryAcrescimo.FieldByName('TAXADEP').AsFloat / 100) * rFator);
            DepTotalO := (rTaxa * (qryAcrescimo.FieldByName('VALORG').AsFloat +
                                   qryAcrescimo.FieldByName('CMBEM').AsFloat));
            if abs(DepTotalO) >= 0.01 then
               DepTotalO := strtofloat(FormatFloat('#0.00',((DepTotalO * 100) / 100)));
            //----------------------------------------------------------------------------
            if (qryAcrescimo.FieldByName('DEPLANC').AsFloat + DepTotalO +
               (qryAcrescimo.FieldByName('CMDEP').AsFloat)) >=
               (qryAcrescimo.FieldByName('VALORG').AsFloat +
               (qryAcrescimo.FieldByName('CMBEM').AsFloat)) then
            begin
               DepTotalO := ( qryAcrescimo.FieldByName('VALORG').AsFloat    +
                              qryAcrescimo.FieldByName('CMBEM').AsFloat   ) -
                            ( qryAcrescimo.FieldByName('DEPLANC').AsFloat   +
                              qryAcrescimo.FieldByName('CMDEP').AsFloat   );
               qryAcrescimo.FieldByName('FLGDEPREC').AsInteger := 1;
            end else
            begin
               qryAcrescimo.FieldByName('FLGDEPREC').AsInteger := 0;
            end;
            qryAcrescimo.FieldByName('DEPLANC').AsCurrency :=
                                qryAcrescimo.FieldByName('DEPLANC').AsFloat + DepTotalO;
            //----------------------------------------------------------------------------
            fDepDepLanc := fDepDepLanc + DepTotalO;
            //----------------------------------------------------------------------------
            if DepTotalO <> 0 then
            begin
               //-------------------------------------------------------------------------
               // Registra o Historico de Movimentacao
               //-------------------------------------------------------------------------
               iTipoMovimentacao := 35;
               iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                                          dDataMov,
                                                          qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                                          DepTotalO,0,0,dDataUltDepAnt,
                                                          -1,-1,-1,-1,-1,-1,-1,-1,-1,'',iTipDepProRata,True);
               if iSeqHist = -1 then
                  Raise eExcessaoCAF.Create('Depreciação : RegistraMovimentacao');
               //-------------------------------------------------------------------------
               qryAcrescimo.FieldByName('DATAULTDEP').AsDateTime := dDataMov;
               qryAcrescimo.Post;
            end;
            //----------------------------------------------------------------------------
         end;
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      qryBem.ApplyUpdates;
      if not qryReavaliacao.IsEmpty then
         qryReavaliacao.ApplyUpdates;
      if not qryAcrescimo.IsEmpty then
         qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
Procedure TfrmReconDeprecBem.ParamFatorPeriodo(var rFator : Extended; sDataUltDep, sDataMov : string);
var
   iMesIni,iAnoIni,iDiaIni,
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno,iNDias      : Word;
   dDataInit                  : tDate;
   iMesInit,iAnoInit,iDiaInit : Word;

begin
   DecodeDate(strtodate(sDataUltDep), iAnoIni, iMesIni, iDiaIni);
   DecodeDate(strtodate(sDataMov) , iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   // Calculo Mensal
   //-------------------------------------------------------------------------------------
   iNDias := round((strtodate(sDataMov) - strtodate(sDataUltDep)) + 1);
   if strtodate(sDataMov) = strtodate(sDataUltDep) then
   begin
      rFator := 0;
   end else
   begin
      if (iMesIni = iMesFim) or (iNdias < 28) then
      begin
         DecodeDate(DiasUteis.UltDiaMes(iAnoFim,iMesFim),iAno,iMes,iDia);
         rFator := (1 / 12) * (iNDias / iDia);
      end else
      //----------------------------------------------------------------------------------
      begin
         dDataInit := (strtodate(sDataMov) - 32);
         DecodeDate(dDataInit,iAnoInit,iMesInit,iDiaInit);
         DecodeDate(DiasUteis.UltDiaMes(iAnoInit,iMesInit),iAnoInit,iMesInit,iDiaInit);
         dDataInit := EncodeDate(iAnoInit,iMesInit,iDiaInit);
         //-------------------------------------------------------------------------------
         if dDataInit = strtodate(sDataUltDep) then
            rFator := (1 / 12)
         else
            rFator := (1 / 12) * (iNDias / 30.44);
      end;
   end;
end;
//========================================================================================
function TfrmReconDeprecBem.ExecutaBaixa(iModulo, iEmpresaProp, iBem,
                                         iMotivoBaixa : Integer;
                                         dDataBaixa   : tDate;
                                         iTipoPropBaixa : Integer;
                                         fPropBaixa, fValVenda : Extended;
                                         sObsBaixa    : String) : Boolean;

var
   iSeqHist                                             : Integer;
   qryBem, qryReavaliacao, qryAcrescimo                 : TwwQuery;
   fBaixaB , fBaixaBF, fBaixaBG,
   fBaixaD , fBaixaDF, fBaixaDG,
   fBaixaCM, fBaixaCMD                                  : Extended;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared                  then qryBem.Prepare;
      if not qryReavaliacao.Prepared          then qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared            then qryAcrescimo.Prepare;
      if not qrySldContabil.Prepared          then qrySldContabil.Prepare;
      if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
      if not qryRegistraBaixaBem.Prepared     then qryRegistraBaixaBem.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela de Bens no Bem a ser baixado
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 06
      //----------------------------------------------------------------------------------
      fBaixaB  := AtivoFixo.ConvNum(qryBem.FieldByName('VALORG').asFloat) * (fPropBaixa / 100);
      fBaixaBF := AtivoFixo.ConvNum(qryBem.FieldByName('VALFIS').asFloat) * (fPropBaixa / 100);
      fBaixaBG := AtivoFixo.ConvNum(qryBem.FieldByName('VALGER').asFloat) * (fPropBaixa / 100);
      //----------------------------------------------------------------------------------
      iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 06, dDataBaixa,
                                                 -1, fBaixaB, fBaixaBF, fBaixaBG,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
      if iSeqHist = -1 then
         Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 06');
      //----------------------------------------------------------------------------------
      if not AtivoFixo.RegistraBaixaBem(iSeqHist,iMotivoBaixa,fPropBaixa,sObsBaixa,0,
                                        True) then
         Raise eExcessaoCAF.Create('Baixa : RegistraBaixaBem - 06');
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 25
      //----------------------------------------------------------------------------------
      fBaixaCM := AtivoFixo.ConvNum(qryBem.FieldByName('CMBEM').asFloat) * (fPropBaixa / 100);
      if fBaixaCM <> 0 then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 25, dDataBaixa,
                                                    -1,
                                                    fBaixaCM, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 25');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 24
      //----------------------------------------------------------------------------------
      fBaixaD  := AtivoFixo.ConvNum(qryBem.FieldByName('DEPLANC').asFloat) * (fPropBaixa / 100);
      fBaixaDF := AtivoFixo.ConvNum(qryBem.FieldByName('DEPFIS').asFloat)  * (fPropBaixa / 100);
      fBaixaDG := AtivoFixo.ConvNum(qryBem.FieldByName('DEPGER').asFloat)  * (fPropBaixa / 100);
      if fBaixaD <> 0 then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 24, dDataBaixa,
                                                    -1, fBaixaD, fBaixaDF, fBaixaDG,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 24');
      end;
      //----------------------------------------------------------------------------------
      // Registra a Movimentacao no Historico - 26
      //----------------------------------------------------------------------------------
      fBaixaCMD :=AtivoFixo.ConvNum(qryBem.FieldByName('CMDEP').asFloat) * (fPropBaixa / 100);
      if (fBaixaCMD <> 0) then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 26, dDataBaixa,
                                                    -1,
                                                    fBaixaCMD, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 26');
      end;
      //----------------------------------------------------------------------------------
      // Registra as alteracoes na Tabela de Bens
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('VALORG').asFloat      :=AtivoFixo.ConvNum(qryBem.FieldByName('VALORG').asFloat  - fBaixaB);
      qryBem.FieldByName('VALFIS').asFloat      :=AtivoFixo.ConvNum(qryBem.FieldByName('VALFIS').asFloat  - fBaixaBF);
      qryBem.FieldByName('VALGER').asFloat      :=AtivoFixo.ConvNum(qryBem.FieldByName('VALGER').asFloat  - fBaixaBG);
      qryBem.FieldByName('DEPLANC').asFloat     :=AtivoFixo.ConvNum(qryBem.FieldByName('DEPLANC').asFloat - fBaixaD);
      qryBem.FieldByName('DEPFIS').asFloat      :=AtivoFixo.ConvNum(qryBem.FieldByName('DEPFIS').asFloat  - fBaixaDF);
      qryBem.FieldByName('DEPGER').asFloat      :=AtivoFixo.ConvNum(qryBem.FieldByName('DEPGER').asFloat  - fBaixaDG);
      qryBem.FieldByName('CMBEM').asFloat       :=AtivoFixo.ConvNum(qryBem.FieldByName('CMBEM').asFloat   - fBaixaCM);
      qryBem.FieldByName('CMDEP').asFloat       :=AtivoFixo.ConvNum(qryBem.FieldByName('CMDEP').asFloat   - fBaixaCMD);
      qryBem.FieldByName('BAIXATOTAL').AsString := 'S';
      qryBem.FieldByName('PROPBAIXA').AsFloat   := fPropBaixa;
      //----------------------------------------------------------------------------------
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // BAIXA AS REAVALIACOES
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 20
         //-------------------------------------------------------------------------------
         fBaixaB  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat * (fPropBaixa / 100));
         fBaixaBF :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('VALFIS').asFloat * (fPropBaixa / 100));
         fBaixaBG :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('VALGER').asFloat * (fPropBaixa / 100));
         //-------------------------------------------------------------------------------
         iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 20, dDataBaixa,
                                                    qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                    fBaixaB, fBaixaBF, fBaixaBG,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 20');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 28
         //-------------------------------------------------------------------------------
         fBaixaCM :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('CMBEM').asFloat * (fPropBaixa / 100));
         if fBaixaCM <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 28, dDataBaixa,
                                                       qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                       fBaixaCM, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 28');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 27
         //-------------------------------------------------------------------------------
         fBaixaD  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('DEPLANC').asFloat * (fPropBaixa / 100));
         fBaixaDF :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('DEPFIS').asFloat  * (fPropBaixa / 100));
         fBaixaDG :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('DEPGER').asFloat  * (fPropBaixa / 100));
         if fBaixaD <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 27, dDataBaixa,
                                                       qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                       fBaixaD, fBaixaDF, fBaixaDG,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 27');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 29
         //-------------------------------------------------------------------------------
         fBaixaCMD :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('CMDEP').asFloat * (fPropBaixa / 100));
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 29, dDataBaixa,
                                                       qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger,
                                                       fBaixaCMD, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 29');
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Bens
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('VALORG').asFloat  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('VALORG').asFloat  - fBaixaB);
         qryReavaliacao.FieldByName('VALFIS').asFloat  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('VALFIS').asFloat  - fBaixaBF);
         qryReavaliacao.FieldByName('VALGER').asFloat  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('VALGER').asFloat  - fBaixaBG);
         qryReavaliacao.FieldByName('DEPLANC').asFloat :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('DEPLANC').asFloat - fBaixaD);
         qryReavaliacao.FieldByName('DEPFIS').asFloat  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('DEPFIS').asFloat  - fBaixaDF);
         qryReavaliacao.FieldByName('DEPGER').asFloat  :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('DEPGER').asFloat  - fBaixaDG);
         qryReavaliacao.FieldByName('CMBEM').asFloat   :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('CMBEM').asFloat   - fBaixaCM);
         qryReavaliacao.FieldByName('CMDEP').asFloat   :=AtivoFixo.ConvNum(qryReavaliacao.FieldByName('CMDEP').asFloat   - fBaixaCMD);
         qryReavaliacao.Post;
         qryReavaliacao.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // BAIXA OS ACRÉSCIMOS DE VALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 37
         //-------------------------------------------------------------------------------
         fBaixaB  :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat * (fPropBaixa / 100));
         fBaixaBF :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('VALFIS').asFloat * (fPropBaixa / 100));
         fBaixaBG :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('VALGER').asFloat * (fPropBaixa / 100));
         //-------------------------------------------------------------------------------
         iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 37, dDataBaixa,
                                                    qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                                    fBaixaB, fBaixaBF, fBaixaBG,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 37');
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 38
         //-------------------------------------------------------------------------------
         fBaixaCM :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('CMBEM').asFloat * (fPropBaixa / 100));
         if fBaixaCM <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 38, dDataBaixa,
                                                       qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                                       fBaixaCM, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 38');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 39
         //-------------------------------------------------------------------------------
         fBaixaD  :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('DEPLANC').asFloat * (fPropBaixa / 100));
         fBaixaDF :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('DEPFIS').asFloat  * (fPropBaixa / 100));
         fBaixaDG :=AtivoFixo.ConvNum(qryAcrescimo.FieldByName('DEPGER').asFloat  * (fPropBaixa / 100));
         if fBaixaD <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 39, dDataBaixa,
                                                       qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                                       fBaixaD, fBaixaDF, fBaixaDG,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 39');
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentacao no Historico - 40
         //-------------------------------------------------------------------------------
         fBaixaCMD := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('CMDEP').asFloat * (fPropBaixa / 100));
         if fBaixaCMD <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iBem, iEmpresaProp, iModulo, 40, dDataBaixa,
                                                       qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger,
                                                       fBaixaCMD, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise eExcessaoCAF.Create('Baixa : RegistraMovimentacao - 40');
         end;
         //-------------------------------------------------------------------------------
         // Registra as alteracoes na Tabela de Acrescimos de Valor
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('VALORG').asFloat  := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('VALORG').asFloat  - fBaixaB);
         qryAcrescimo.FieldByName('VALFIS').asFloat  := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('VALFIS').asFloat  - fBaixaBF);
         qryAcrescimo.FieldByName('VALGER').asFloat  := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('VALGER').asFloat  - fBaixaBG);
         qryAcrescimo.FieldByName('DEPLANC').asFloat := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('DEPLANC').asFloat - fBaixaD);
         qryAcrescimo.FieldByName('DEPFIS').asFloat  := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('DEPFIS').asFloat  - fBaixaDF);
         qryAcrescimo.FieldByName('DEPGER').asFloat  := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('DEPGER').asFloat  - fBaixaDG);
         qryAcrescimo.FieldByName('CMBEM').asFloat   := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('CMBEM').asFloat   - fBaixaCM);
         qryAcrescimo.FieldByName('CMDEP').asFloat   := AtivoFixo.ConvNum(qryAcrescimo.FieldByName('CMDEP').asFloat   - fBaixaCMD);
         qryAcrescimo.Post;
         qryAcrescimo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
function TfrmReconDeprecBem.EstornaBaixa(iModulo, iEmpresaProp, iBem : Integer;
                                         dDataMov,dDataEst : tDate) : Boolean;
var
   qryAux,qryBem,qryReavaliacao,qryAcrescimo : TwwQuery;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared         then qryBem.Prepare;
      if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared   then qryAcrescimo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
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
         Raise eExcessaoCAF.Create('Os parâmetros relativos ao bem estão incorretos! (Baixa)');
      end;
      //----------------------------------------------------------------------------------
      // Estorna a Depreciacao até o Dia da Movimentacao - 1
      //----------------------------------------------------------------------------------
      if not EstornaDepreciacao(qrySelBem.FieldByName('IDMODULO').AsInteger,
                                qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                qrySelBem.FieldByName('IDBEM').AsInteger,
                                (dDataMov - 1), dDataEst) then
      begin
         Raise eExcessaoCAF.Create('Não foi possível estornar a depreciação pró-rata da baixa do Bem ' +
                                   trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                   qryBem.FieldByName('PLACA').AsString);
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a Tabela BEM após estorno da depreciação pró-rata
      //----------------------------------------------------------------------------------
      qryBem.Close;
      qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
      qryBem.Open;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na Tabela BEM
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO,HM.PLNCODIGO,HM.IDTIPOMOVIMENTACAO,'+
                         '        HM.VALOFI,HM.VALFIS,HM.VALGER,BB.PROPBAIXAR '+
                         ' FROM HISTORICOMOVIMENTACAO HM, '+
                         '      BAIXABEM BB '+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO IN (06,25,24,26)) ' +
                         '   AND (HM.IDMOVIMENTACAO = BB.IDMOVIMENTACAO(+))' ;
      qryAux.Open;
      while not qryAux.EOF do
      begin
         qryBem.Edit;
         case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
            06 : begin
                    qryBem.FieldByName('VALORG').AsCurrency := qryBem.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    qryBem.FieldByName('VALFIS').AsCurrency := qryBem.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                    qryBem.FieldByName('VALGER').AsCurrency := qryBem.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    qryBem.FieldByName('PROPBAIXA').AsFloat := qryBem.FieldByName('PROPBAIXA').AsFloat - qryAux.FieldByName('PROPBAIXAR').AsFloat;
                    qryBem.FieldByName('BAIXATOTAL').AsString := 'N';
                 end;
            25 : begin
                    qryBem.FieldByName('CMBEM').AsCurrency := qryBem.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                 end;
            24 : begin
                    qryBem.FieldByName('DEPLANC').AsCurrency := qryBem.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    qryBem.FieldByName('DEPFIS').AsCurrency  := qryBem.FieldByName('DEPFIS').AsFloat  + qryAux.FieldByName('VALFIS').AsFloat;
                    qryBem.FieldByName('DEPGER').AsCurrency  := qryBem.FieldByName('DEPGER').AsFloat  + qryAux.FieldByName('VALGER').AsFloat;
                 end;
            26 : begin
                    qryBem.FieldByName('CMDEP').AsCurrency := qryBem.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                 end;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Next;
      end;
      qryBem.Post;
      qryBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela REAVALIACAO
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         qryReavaliacao.Edit;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,PLNCODIGO,IDTIPOMOVIMENTACAO, '+
                            '        VALOFI, VALFIS, VALGER '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDREAVALACRESC = ' + qryReavaliacao.FieldByName('IDREAVALIACAO').AsString + ')' +
                            '   AND (IDTIPOMOVIMENTACAO IN (20,28,27,29)) ';
         qryAux.Open;
         while not qryAux.EOF do
         begin
            case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               20 : begin
                       qryReavaliacao.FieldByName('VALORG').AsCurrency := qryReavaliacao.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryReavaliacao.FieldByName('VALFIS').AsCurrency := qryReavaliacao.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryReavaliacao.FieldByName('VALGER').AsCurrency := qryReavaliacao.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               28 : begin
                       qryReavaliacao.FieldByName('CMBEM').AsCurrency  := qryReavaliacao.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
               27 : begin
                       qryReavaliacao.FieldByName('DEPLANC').AsCurrency := qryReavaliacao.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryReavaliacao.FieldByName('DEPFIS').AsCurrency  := qryReavaliacao.FieldByName('DEPFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryReavaliacao.FieldByName('DEPGER').AsCurrency  := qryReavaliacao.FieldByName('DEPGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               29 : begin
                       qryReavaliacao.FieldByName('CMDEP').AsCurrency := qryReavaliacao.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryReavaliacao.Post;
         qryReavaliacao.Next
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna os Valores Baixados na tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         qryAcrescimo.Edit;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO, PLNCODIGO, IDTIPOMOVIMENTACAO, '+
                            '        VALOFI, VALFIS, VALGER '+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ') ' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ') ' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + ')) ' +
                            '   AND (IDREAVALACRESC = ' + qryAcrescimo.FieldByName('IDACRESCIMO').AsString + ') ' +
                            '   AND (IDTIPOMOVIMENTACAO IN (37,38,39,40)) ';
         qryAux.Open;
         while not qryAux.EOF do
         begin
            case qryAux.FieldByName('IDTIPOMOVIMENTACAO').AsInteger of
               37 : begin
                       qryAcrescimo.FieldByName('VALORG').AsCurrency := qryAcrescimo.FieldByName('VALORG').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryAcrescimo.FieldByName('VALFIS').AsCurrency := qryAcrescimo.FieldByName('VALFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryAcrescimo.FieldByName('VALGER').AsCurrency := qryAcrescimo.FieldByName('VALGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               38 : begin
                       qryAcrescimo.FieldByName('CMBEM').AsCurrency := qryAcrescimo.FieldByName('CMBEM').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
               39 : begin
                       qryAcrescimo.FieldByName('DEPLANC').AsCurrency := qryAcrescimo.FieldByName('DEPLANC').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                       qryAcrescimo.FieldByName('DEPFIS').AsCurrency := qryAcrescimo.FieldByName('DEPFIS').AsFloat + qryAux.FieldByName('VALFIS').AsFloat;
                       qryAcrescimo.FieldByName('DEPGER').AsCurrency := qryAcrescimo.FieldByName('DEPGER').AsFloat + qryAux.FieldByName('VALGER').AsFloat;
                    end;
               40 : begin
                       qryAcrescimo.FieldByName('CMDEP').AsCurrency := qryAcrescimo.FieldByName('CMDEP').AsFloat + qryAux.FieldByName('VALOFI').AsFloat;
                    end;
            end;
            //----------------------------------------------------------------------------
            qryAux.Next;
         end;
         qryAcrescimo.Post;
         qryAcrescimo.Next
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove o Registro da Movimentacao
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DECODE(FLGNCAF,NULL,0,FLGNCAF) AS NCAF '+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.Open;
         if qryAux.RecordCount <= 0 then
         begin
            Raise eExcessaoCAF.Create('Não existe baixa de bem para estornar ' +
                                      trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(qryBem.FieldByName('PLACA').AsFloat));
         end;
         //-------------------------------------------------------------------------------
         while not qryAux.Eof do
         begin
            if qryAux.FieldByName('NCAF').AsInteger = 0 then
            begin
               qryLegRemValMov.ParamByName('PIDMOV').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
               qryLegRemValMov.ExecSQL;
            end;
            //----------------------------------------------------------------------------
            qryEstornaBaixaBem.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaBaixaBem.ExecSQL;
            if qryEstornaBaixaBem.RowsAffected < 0 then
            begin
               Raise eExcessaoCAF.Create('Não foi possível estornar a baixa do Bem ' +
                                         trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                         floattostr(qryBem.FieldByName('PLACA').AsFloat) + ' (RemoveBaixaBem)');
            end;
            qryAux.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE '+
                            ' FROM HISTORICOMOVIMENTACAO '+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (06,25,24,26,20,28,27,29,37,38,39,40))';
         qryAux.ExecSQL;
         if qryAux.RowsAffected < 0 then
         begin
            Raise eExcessaoCAF.Create('Não foi possível estornar a baixa do Bem ' +
                                      trim(qryBem.FieldByName('DESBEM').AsString) + ' - ' +
                                      floattostr(qryBem.FieldByName('PLACA').AsFloat) +
                                      ' (RemoveHistoricoMovimentacao)');
         end;
      end;
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
function TfrmReconDeprecBem.CalcProxData(dDataMov : tDate; iMov : Integer) : tDate;
Var
   dAux                     : tDate;
   iMesFim,iAnoFim,iDiaFim,
   iDia,iMes,iAno           : Word;

begin
   if iMov > 0 then
      dAux := dDataMov + 28
   else
      dAux := dDataMov - 33;
   //-------------------------------------------------------------------------------------
   DecodeDate(dAux, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   Result := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
function TfrmReconDeprecBem.EstornaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                               dDataMov,dDataEst : tDate) : Boolean;
var
   fDepLancAnt                    : Extended;
   qryAux, qryBem, qryReavaliacao,
   qryAcrescimo                   : TwwQuery;
   dDataUltDep                    : tDate;

begin
   with dtmAtivoFixo do
   begin
      if not qryBem.Prepared         then qryBem.Prepare;
      if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
      if not qryAcrescimo.Prepared   then qryAcrescimo.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryBem         := TwwQuery(dtmAtivoFixo.qryBem);
   qryReavaliacao := TwwQuery(dtmAtivoFixo.qryReavaliacao);
   qryAcrescimo   := TwwQuery(dtmAtivoFixo.qryAcrescimo);
   qryAux         := TwwQuery(dtmAtivoFixo.qryAux);
   //-------------------------------------------------------------------------------------
   // Posiciona a Tabela BEM
   //-------------------------------------------------------------------------------------
   qryBem.Close;
   qryBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
   qryBem.ParamByName('PIDBEM').AsInteger    := iBem;
   qryBem.Open;
   if qryBem.IsEmpty then
   begin
      MsgDlg('Os parâmetros relativos ao bem estão incorretos!',
             'Erro',mtError,[mbOk],0);
      result := False;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Retorna o Valor da Depreciacao do Bem e o ID da Movimentacao
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO,HM.PLNCODIGO,HM.VALOFI,HM.DATAULTDEP '+
                         ' FROM HISTORICOMOVIMENTACAO HM '+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO = 14) ';
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
         fDepLancAnt := qryAux.FieldByName('VALOFI').AsFloat;
         dDataUltDep := qryAux.FieldByName('DATAULTDEP').AsDateTime;
         //-------------------------------------------------------------------------------
         qryBem.Edit;
         qryBem.FieldByName('DEPLANC').AsCurrency    := qryBem.FieldByName('DEPLANC').asFloat - fDepLancAnt;
         qryBem.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
         qryBem.FieldByname('FLGDEPREC').AsInteger   := 0;
         qryBem.Post;
         qryBem.ApplyUpdates;
      end;
      //----------------------------------------------------------------------------------
      // Retorna o valor depreciado dos Saldos de Reavaliação
      //----------------------------------------------------------------------------------
      qryReavaliacao.Close;
      qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryReavaliacao.ParamByName('PIDBEM').AsInteger    := iBem;
      qryReavaliacao.Open;
      while not qryReavaliacao.EOF do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO,HM.PLNCODIGO,HM.VALOFI,HM.DATAULTDEP'+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (HM.IDTIPOMOVIMENTACAO = 18) ' +
                            '   AND (HM.IDREAVALACRESC = ' + inttostr(qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) + ')';
         qryAux.Open;
         if not qryAux.IsEmpty then
         begin
            fDepLancAnt := qryAux.FieldByName('VALOFI').AsFloat;
            dDataUltDep := qryAux.FieldByName('DATAULTDEP').AsDateTime;
            //----------------------------------------------------------------------------
            qryReavaliacao.Edit;
            qryReavaliacao.FieldByName('DEPLANC').AsCurrency    := qryReavaliacao.FieldByName('DEPLANC').asFloat - fDepLancAnt;
            qryReavaliacao.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
            qryReavaliacao.FieldByname('FLGDEPREC').AsInteger   := 0;
            qryReavaliacao.Post;
         end;
         qryReavaliacao.Next;
      end;
      qryReavaliacao.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Retorna o Valor Depreciado nos Lançamentos da Tabela ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      qryAcrescimo.Close;
      qryAcrescimo.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      qryAcrescimo.ParamByName('PIDBEM').AsInteger    := iBem;
      qryAcrescimo.Open;
      while not qryAcrescimo.EOF do
      begin
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT HM.IDMOVIMENTACAO, HM.PLNCODIGO, HM.VALOFI, HM.DATAULTDEP'+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (HM.IDTIPOMOVIMENTACAO = 35) ' +
                            '   AND (HM.IDREAVALACRESC = ' + inttostr(qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger) + ')';
         qryAux.Open;
         if not qryAux.IsEmpty then
         begin
            fDepLancAnt := qryAux.FieldByName('VALOFI').AsFloat;
            dDataUltDep := qryAux.FieldByName('DATAULTDEP').AsDateTime;
            //----------------------------------------------------------------------------
            qryAcrescimo.Edit;
            qryAcrescimo.FieldByName('DEPLANC').AsCurrency    := qryAcrescimo.FieldByName('DEPLANC').asFloat - fDepLancAnt;
            qryAcrescimo.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
            qryAcrescimo.FieldByname('FLGDEPREC').AsInteger   := 0;
            qryAcrescimo.Post;
         end;
         qryAcrescimo.Next;
      end;
      qryAcrescimo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Remove o Historico
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if not qryEstornaMov.Prepared then qryEstornaMov.Prepare;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(dDataMov) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN (14,18,35))';
         qryAux.Open;
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
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
procedure TfrmReconDeprecBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryBaixa.Close;
   qrySelBem.UnPrepare;
   qryBaixa.UnPrepare;
end;
//========================================================================================
procedure TfrmReconDeprecBem.eDtaIniExit(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;
begin
   inherited;
   if bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaIni.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      eDtaIni.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaIni.Date < qrySelBemDATAINICIODEP.AsDateTime then
      eDtaIni.Date := qrySelBemDATAINICIODEP.AsDateTime;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaIni.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaIni.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
procedure TfrmReconDeprecBem.eDtaFimExit(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      eDtaFim.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Date > qryGrupoDATAULTDEP.AsDateTime then
      eDtaFim.Date := qryGrupoDATAULTDEP.AsDateTime;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaFim.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaFim.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
procedure TfrmReconDeprecBem.eDtaIniChange(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if eDtaIni.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaIni.Text = '' then
      exit;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaIni.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaIni.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
procedure TfrmReconDeprecBem.eDtaFimEnter(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if eDtaFim.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
      exit;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaFim.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaIni.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
procedure TfrmReconDeprecBem.eDataInicioDepExit(Sender: TObject);
begin
   inherited;
   eDtaIni.Date := eDataInicioDep.Date;
end;

end.
