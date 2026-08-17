unit fReconDeprec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdbedit, Db, Wwdatsrc, DBTables, Wwquery, Gauges, JclDebug;

type
  TfrmReconDeprec = class(TfrmOkCancelar)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    qryBem1: TwwQuery;
    pnlprgBar1: TPanel;
    prgBar1: TGauge;
    lblPlaca: TLabel;
    eDtaFim: TCMDateTimePicker;
    Label1: TLabel;
    qryUpdGrupo: TwwQuery;
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
    updGrupo: TUpdateSQL;
    qryPrimDeprec: TwwQuery;
    qryUltDeprec: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eDtaFimExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bFlgPrim     : Boolean;
    sFase        : String;
    MensagemErro : String;
    //------------------------------------------------------------------------------------
    function ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                dDataMov : tDateTime;
                                iTipDepProRata : Integer;
                                Var fDepCmBem, fDepDepLanc, fDepCmDep : Extended) : Boolean;
    function EstornaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                dDataMovIni, dDataMovFim : tDate) : Boolean;
    function CalcProxData(dDataMov : tDate; iMov : Integer) : tDate;
    Procedure ParamFatorPeriodo(var rFator : Extended; sDataUltDep, sDataMov : string);
  end;

var
  frmReconDeprec: TfrmReconDeprec;

implementation

uses uSistema, dBaseDados, uDatabase, uMensErro, uDiasUteis, uAtivoFixo, dAtivoFixo;

{$R *.DFM}

procedure TfrmReconDeprec.bbtnConfirmarClick(Sender: TObject);
Var
   dDataIni, dDataDep                : tDate;
   fDepCmBem, fDepDepLanc, fDepCmDep : Extended;

begin
   inherited;
   prgBar.Progress  := 0;
   prgBar1.Progress := 0;
   lblPlaca.Caption := 'Preparando ...';
   lblStatus.Caption   := 'Mês';
   pnlStatus.Visible := True;
   lblStatus.Visible := True;
   Application.ProcessMessages;
   dDataDep := strtodate(eDtaFim.Text);
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      qryUpdGrupo.Close;
      qryUpdGrupo.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      qryUpdGrupo.Open;
      //----------------------------------------------------------------------------------
      if qryBem1.Active then qryBem1.Close;
      if not qryBem1.Prepared then qryBem1.Prepare;
      qryBem1.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
      qryBem1.Open;
      prgBar1.MaxValue := qryBem1.RecordCount;
      //----------------------------------------------------------------------------------
      while not qryBem1.EOF do
      begin
         sFase := 'Preparando';
         prgBar1.Progress := prgBar1.Progress + 1;
         lblPlaca.Caption := 'Placa ' + qryBem1.FieldByName('PLACA').AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         qryPrimDeprec.Close;
         qryPrimDeprec.ParamByName('IDBEM').AsFloat    := qryBem1.FieldByName('IDBEM').asFloat;
         qryPrimDeprec.ParamByName('IDPESSOA').AsFloat := qryBem1.FieldByName('IDPESSOA').asFloat;
         qryPrimDeprec.Open;
         if qryPrimDeprec.FieldByName('DATAINICIODEP').IsNull then
            dDataIni := strtodate(FormatDateTime('dd/mm/yyyy',qryBem1.FieldByName('DATAINICIODEP').asDateTime))
         else
            dDataIni := strtodate(FormatDateTime('dd/mm/yyyy',qryPrimDeprec.FieldByName('DATAINICIODEP').asDateTime));
         //-------------------------------------------------------------------------------
         qryUltDeprec.Close;
         qryUltDeprec.ParamByName('IDBEM').AsFloat    := qryBem1.FieldByName('IDBEM').asFloat;
         qryUltDeprec.ParamByName('IDPESSOA').AsFloat := qryBem1.FieldByName('IDPESSOA').asFloat;
         qryUltDeprec.Open;
         if qryUltDeprec.FieldByName('DATAULTDEP').IsNull then
            dDataDep := strtodate(eDtaFim.Text)
         else
            dDataDep := strtodate(FormatDateTime('dd/mm/yyyy',qryUltDeprec.FieldByName('DATAULTDEP').asDateTime));
         //-------------------------------------------------------------------------------
         // Estorna os lançamentos de depreciacao no periodo especificado
         //-------------------------------------------------------------------------------
         sFase := 'Estornando';
         prgBar.MaxValue := 1;
         prgBar.Progress := 0;
         lblStatus.Caption := sFase;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if not EstornaDepreciacao(qryBem1.FieldByName('IDMODULO').AsInteger,
                                   qryBem1.FieldByName('IDPESSOA').AsInteger,
                                   qryBem1.FieldByName('IDBEM').AsInteger,
                                   dDataIni, dDataDep) then
            Raise Exception.Create(MensagemErro);
         //-------------------------------------------------------------------------------
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Recalcula os lançamentos de depreciacao no periodo especificado
         //-------------------------------------------------------------------------------
         prgBar.MaxValue := round(abs(eDtaFim.Date - dDataIni) / 30.44) + 1;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         dDataDep := dDataIni;
         bFlgPrim := True;
         while dDataDep <= eDtaFim.Date do
         begin
            sFase := 'Depreciando';
            lblStatus.Caption := sFase + ' Mês ' + copy(datetostr(dDataDep),4,7);
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if not ExecutaDepreciacao(qryBem1.FieldByName('IDMODULO').AsInteger,
                                      qryBem1.FieldByName('IDPESSOA').AsInteger,
                                      qryBem1.FieldByName('IDBEM').AsInteger,
                                      dDataDep, 2, fDepCmBem, fDepDepLanc, fDepCmDep) then
               Raise Exception.Create(MensagemErro);
            //----------------------------------------------------------------------------
            if bFlgPrim then
               bFlgPrim := False;
            //----------------------------------------------------------------------------
            dDataDep := CalcProxData(dDataDep,1);
         end;
         //-------------------------------------------------------------------------------
         // Atualiza a Tabela GRUPO
         //-------------------------------------------------------------------------------
         if qryBem1.FieldByName('IDGRUPO').AsInteger <> qryUpdGrupo.FieldByName('IDGRUPO').AsInteger then
            if qryUpdGrupo.Locate('IDGRUPO',qryBem1.FieldByName('IDGRUPO').AsInteger,[]) then
            begin
               qryUpdGrupo.Edit;
               qryUpdGrupo.FieldByName('DATAULTDEP').AsDateTime := eDtaFim.Date;
               qryUpdGrupo.Post;
               qryUpdGrupo.ApplyUpdates;
               CommitTransacao;
               StartTransacao;
            end;
         //-------------------------------------------------------------------------------
         qryBem1.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Processamento Terminado.','Informação',mtInformation,[mbOk],0);
   except
      On E : Exception Do
      begin
         RollBackTransacao;
         MsgDlg('Processamento Abortado.' + #13 + #13 +
                'C.A.F. Versão ' + Sistema.Versao + #13 + #13 +
                sFase + ' Bem ' + qryBem1.FieldByName('PLACA').AsString + ' Mês ' + copy(datetostr(dDataDep),4,7) + #13 +
                'Placas ' + floattostr(prgBar1.Progress / prgBar1.MaxValue) + ' % ' + #13 +
                'Meses ' + floattostr(prgBar.Progress / prgBar.MaxValue) + ' % ' + #13 + #13 +
                'Excessão : ' + E.Message, 'Erro ', mtError, [mbOk], 0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   pnlStatus.Visible := False;
   Application.ProcessMessages;
end;
//========================================================================================
function TfrmReconDeprec.ExecutaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
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
   // Caso o dia da movimentação seja 01, não calcular o pró-rata
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
   //-------------------------------------------------------------------------------------
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
         qryBem.FieldByName('DATAULTDEP').asDateTime := qryBem.FieldByName('DATAINICIODEP').asDateTime;
      //----------------------------------------------------------------------------------
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
               Raise Exception.Create('Depreciação : RegistraMovimentacao');
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
                  Raise Exception.Create('Depreciação : RegistraMovimentacao');
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
                  Raise Exception.Create('Depreciação : RegistraMovimentacao');
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
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
function TfrmReconDeprec.CalcProxData(dDataMov : tDate; iMov : Integer) : tDate;
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
function TfrmReconDeprec.EstornaDepreciacao(iModulo, iEmpresaProp, iBem : Integer;
                                            dDataMovIni,dDataMovFim : tDate) : Boolean;
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
      qryAux.SQL.Text := ' SELECT SUM(HM.VALOFI) AS SUMVALOFI '+
                         ' FROM HISTORICOMOVIMENTACAO HM '+
                         ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (HM.DATAMOVIMENTACAO >= TO_DATE(' + #39 + datetostr(dDataMovIni) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + datetostr(dDataMovFim) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                         '   AND (HM.IDTIPOMOVIMENTACAO = 14) ';
      qryAux.Open;
      if not qryAux.IsEmpty then
         fDepLancAnt := qryAux.FieldByName('SUMVALOFI').AsFloat
      else
         fDepLancAnt := 0;
      //----------------------------------------------------------------------------------
      dDataUltDep := qryPrimDeprec.FieldByName('DATAINICIODEP').AsDateTime;
      //----------------------------------------------------------------------------------
      qryBem.Edit;
      qryBem.FieldByName('DEPLANC').AsCurrency    := qryBem.FieldByName('DEPLANC').asFloat - fDepLancAnt;
      qryBem.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
      qryBem.FieldByname('FLGDEPREC').AsInteger   := 0;
      qryBem.Post;
      qryBem.ApplyUpdates;
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
         qryAux.SQL.Text := ' SELECT SUM(HM.VALOFI) AS SUMVALOFI '+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (HM.DATAMOVIMENTACAO >= TO_DATE(' + #39 + datetostr(dDataMovIni) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + datetostr(dDataMovFim) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (HM.IDTIPOMOVIMENTACAO = 18) ' +
                            '   AND (HM.IDREAVALACRESC = ' + inttostr(qryReavaliacao.FieldByName('IDREAVALIACAO').AsInteger) + ')';
         qryAux.Open;
         if not qryAux.IsEmpty then
            fDepLancAnt := qryAux.FieldByName('SUMVALOFI').AsFloat
         else
            fDepLancAnt := 0;
         //-------------------------------------------------------------------------------
         dDataUltDep := qryPrimDeprec.FieldByName('DATAINICIODEP').AsDateTime;
         //-------------------------------------------------------------------------------
         qryReavaliacao.Edit;
         qryReavaliacao.FieldByName('DEPLANC').AsCurrency    := qryReavaliacao.FieldByName('DEPLANC').asFloat - fDepLancAnt;
         qryReavaliacao.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
         qryReavaliacao.FieldByname('FLGDEPREC').AsInteger   := 0;
         qryReavaliacao.Post;
         //-------------------------------------------------------------------------------
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
         qryAux.SQL.Text := ' SELECT SUM(HM.VALOFI) AS SUMVALOFI '+
                            ' FROM HISTORICOMOVIMENTACAO HM '+
                            ' WHERE (HM.IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (HM.IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (HM.DATAMOVIMENTACAO >= TO_DATE(' + #39 + datetostr(dDataMovIni) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (HM.DATAMOVIMENTACAO <= TO_DATE(' + #39 + datetostr(dDataMovFim) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (HM.IDTIPOMOVIMENTACAO = 35) ' +
                            '   AND (HM.IDREAVALACRESC = ' + inttostr(qryAcrescimo.FieldByName('IDACRESCIMO').AsInteger) + ')';
         qryAux.Open;
         if not qryAux.IsEmpty then
            fDepLancAnt := qryAux.FieldByName('SUMVALOFI').AsFloat
         else
            fDepLancAnt := 0;
         //-------------------------------------------------------------------------------
         dDataUltDep := qryPrimDeprec.FieldByName('DATAINICIODEP').AsDateTime;
         //-------------------------------------------------------------------------------
         qryAcrescimo.Edit;
         qryAcrescimo.FieldByName('DEPLANC').AsCurrency    := qryAcrescimo.FieldByName('DEPLANC').asFloat - fDepLancAnt;
         qryAcrescimo.FieldByname('DATAULTDEP').AsDateTime := dDataUltDep;
         qryAcrescimo.FieldByname('FLGDEPREC').AsInteger   := 0;
         qryAcrescimo.Post;
         //-------------------------------------------------------------------------------
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
                            '   AND (DATAMOVIMENTACAO >= TO_DATE(' + #39 + datetostr(dDataMovIni) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (DATAMOVIMENTACAO <= TO_DATE(' + #39 + datetostr(dDataMovFim) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
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
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
procedure TfrmReconDeprec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBem1.Close;
   qryBem1.UnPrepare;
   qryUpdGrupo.Close;
   qryUpdGrupo.UnPrepare;
   qryPrimDeprec.Close;
   qryUltDeprec.Close;
   qryPrimDeprec.UnPrepare;
   qryUltDeprec.UnPrepare;
end;
//========================================================================================
procedure TfrmReconDeprec.eDtaFimExit(Sender: TObject);
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
      MsgDlg('Informe até que mês irá fechar!','Erro',mtError,[mbOk],0);
      eDtaFim.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaFim.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaFim.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;
//========================================================================================
Procedure TfrmReconDeprec.ParamFatorPeriodo(var rFator : Extended; sDataUltDep, sDataMov : string);
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

end.
