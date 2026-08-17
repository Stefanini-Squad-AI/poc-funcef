unit fParamAnalSintProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  StdCtrls, Buttons, CheckLst, Spin, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  TEdNum, ExtCtrls, ComCtrls;

type
  TfrmParamAnalSintProc = class(TfrmSelProcesso)
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
  private
    Ano, Mes, Dia: word;
    iTotProc, iTotEnt, iTotSai, iTotAco, iTotDec, iTotOut: integer;
    dTotCus, dTotAtu, dValAtu, dValMax, dValReal,
    TTEntMax, TTEntPrv, TTSaiMax, TTSaiPrv, TTValAco, TTValDec, TTValOut, TTValRea: double;
    TotQtdPrc, TotQtdEnt, TotQtdSai, TotQtdAco, TotQtdDec, TotQtdOut: array[1..12] of integer;
    TotValMax, TotEntMax, TotSaiMax,
    TotValPrv, TotEntPrv, TotSaiPrv,
    TotValRea, TotValAco, TotValDec, TotValOut: array[1..12] of double;

    procedure ZerarValores;
    procedure GerarValores;
    procedure GerarDadosRelat;     
  end;

var
  frmParamAnalSintProc: TfrmParamAnalSintProc;

implementation

uses uSistema, uMensErro, dCds, fAguarde, uFuncoesUteisRH, uValorAtual, dRelatoriosModCon;

const
  arrSit: array[0..1] of string[9] = ('Aberto','Encer.');

{$R *.DFM}

procedure TfrmParamAnalSintProc.FormCreate(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, Ano, Mes, Dia);
  cmbMes.ItemIndex := Mes - 1;
  spedAno.Value    := Ano;

  edDataAju1.Date := (Date - Round(365.25*10));
  edDataNot1.Date := (Date - Round(365.25*10));
  edDataEnc1.Date := (Date - Round(365.25*10));
end;

procedure TfrmParamAnalSintProc.cmbMesChange(Sender: TObject);
begin
  edTituloRelat.Text := 'Análise Sintética de Processos - ' +
    Trim(cmbMes.Items[cmbMes.ItemIndex]) + '/' + spedAno.Text;
end;

procedure TfrmParamAnalSintProc.bbtnConfirmarClick(Sender: TObject);
var
  Ind: byte;
begin
  inherited;
  with (dtmRelatoriosModCon) do
  begin
    with (dmCds.qry) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT *');
      SQL.Add('FROM OBJPROCTRAB');
      SQL.Add('WHERE (NUMPROCTRAB = :NUMPROCTRAB)');
      SQL.Add('ORDER BY NUMPROCTRAB, CODTIPOOBJETO');
      ParamByName('NUMPROCTRAB').DataType := ftString;
    end;

    frmAguarde.Mostra ('Relatório de Processos');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query principal
    qryAnalSintProc.UpdateObject := updSQL;

    if not(qryAnalSintProc.IsEmpty) then
      qryAnalSintProc.CancelUpdates;
    qryAnalSintProc.Close;
    qryAnalSintProc.Open;

    // Processa dados para a geração da query
    qryProcesso.First;
    ZerarValores;
    GerarDadosRelat;
    qryAnalSintProc.First;

    rpAnalSintProcLbl1.Caption := edTituloRelat.Text;
    Ind := cmbMes.ItemIndex+1;
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl4.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl5.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl6.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl7.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl8.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl9.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl10.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl11.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl12.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl13.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl14.Caption := Copy(cmbMes.Items[Ind],1,3);
    Inc(Ind);
    if (Ind > 11) then
      Ind := 0;

    rpAnalSintProcLbl15.Caption := Copy(cmbMes.Items[Ind],1,3);
  end;
end;

procedure TfrmParamAnalSintProc.ZerarValores;
begin
  iTotProc:=0; dTotCus:=0; dTotAtu:=0; TTEntMax:=0; TTEntPrv:=0; TTSaiMax:=0; TTSaiPrv:=0;
  TTValAco:=0; TTValDec:=0; TTValOut:=0; TTValRea:=0; iTotEnt:=0; iTotSai:=0; iTotAco:=0;
  iTotDec:=0; iTotOut:=0;

  FillChar(TotQtdPrc,12,0); FillChar(TotValMax,12,0); FillChar(TotValPrv,12,0);
  FillChar(TotValRea,12,0); FillChar(TotQtdEnt,12,0); FillChar(TotQtdSai,12,0);
  FillChar(TotQtdAco,12,0); FillChar(TotQtdDec,12,0); FillChar(TotQtdOut,12,0);
  FillChar(TotEntMax,12,0); FillChar(TotSaiMax,12,0); FillChar(TotEntPrv,12,0);
  FillChar(TotSaiPrv,12,0); FillChar(TotValAco,12,0); FillChar(TotValDec,12,0);
  FillChar(TotValOut,12,0);
{  for c:=1 to 12 do
  begin
    TotQtdPrc[c]:=0; TotValMax[c]:=0; TotValPrv[c]:=0; TotValRea[c]:=0; TotQtdEnt[c]:=0;
    TotQtdSai[c]:=0; TotQtdAco[c]:=0; TotQtdDec[c]:=0; TotQtdOut[c]:=0; TotEntMax[c]:=0;
    TotSaiMax[c]:=0; TotEntPrv[c]:=0; TotSaiPrv[c]:=0; TotValAco[c]:=0; TotValDec[c]:=0;
    TotValOut[c]:=0;
  end;}
end;

procedure TfrmParamAnalSintProc.GerarValores;
var
  Ind, iMesAtual, iAnoAtual: integer;
  sMesStr, sPrxMes, sAnoStr, sPrxAno: string;
  dValorReclamado, dValorReal: double;
begin
  with (dtmRelatoriosModCon) do
  begin
    dValMax:=0; dValAtu:=0; dValReal:=0;
    dmCds.qry.First;
    while not(dmCds.qry.EOF) do
    begin
      dValorReclamado := ValorAtual(dmCds.qry.FieldByName('ValorRecl').asFloat,
        IFF(qryProcesso.FieldByName('DataDesligamento').asString = '',
            qryProcesso.FieldByName('DataNotif').asString,
            qryProcesso.FieldByName('DataDesligamento').asString),
        qryProcesso.FieldByName('MoedaProcTrab').asString,
        qryProcesso.FieldByName('IdRegra').asString,
        qryProcesso.FieldByName('NumProcTrab').asString,
        qryProcesso.FieldByName('IndTaxaConv').asInteger);

      dValorReal := ValorAtual(dmCds.qry.FieldByName('ValorSentenca').asFloat,
        qryProcesso.FieldByName('DataEfetEnc').asString,
        qryProcesso.FieldByName('MoedaProcTrab').asString,
        qryProcesso.FieldByName('IdRegra').asString,
        qryProcesso.FieldByName('NumProcTrab').asString,
        qryProcesso.FieldByName('IndTaxaConv').asInteger);
                                            
      dValAtu := dValAtu + dValorReclamado -
        ((100 - dmCds.qry.FieldByName('PercProb').asFloat) * dValorReclamado / 100);

      dValMax  := dValMax  + dValorReclamado;
      dValReal := dValReal + dValorReal;
      dmCds.qry.Next;
    end;

    for Ind:=1 to 12 do
    begin
      iMesAtual := Ind + cmbMes.ItemIndex + 1;
      iAnoAtual := spedAno.Value - 1;

      if (iMesAtual > 12) then
      begin
        iMesAtual := iMesAtual - 12;
        iAnoAtual := iAnoAtual + 1;
      end;
      sMesStr := '0' + IntToStr(iMesAtual);
      sMesStr := Copy(sMesStr,length(sMesStr)-1,2);
      sPrxMes := '0' + IntToStr(iMesAtual+1);
      sPrxMes := Copy(sPrxMes,length(sPrxMes)-1,2);
      if (sPrxMes = '13') then
        sPrxMes := '01';

      sAnoStr := IntToStr(iAnoAtual);
      sPrxAno := IntToStr(iAnoAtual);
      if (iMesAtual = 12) then
        sPrxAno := IntToStr(iAnoAtual + 1);

      if ((qryProcesso.FieldByName('DataNotif').IsNull) or
          (qryProcesso.FieldByName('DataNotif').asDateTime <
           StrToDate('01/' + sPrxMes + '/' + sPrxAno))) and
         ((qryProcesso.FieldByName('DataEfetEnc').IsNull) or
          (qryProcesso.FieldByName('DataEfetEnc').asDateTime >=
           StrToDate('01/' + sPrxMes + '/' + sPrxAno))) then
      begin
        Inc(iTotProc);
        dTotCus := dTotCus + dValMax;
        dTotAtu := dTotAtu + dValAtu;
        TotQtdPrc[Ind] := TotQtdPrc[Ind] + 1;
        TotValMax[Ind] := TotValMax[Ind] + dValMax;
        TotValPrv[Ind] := TotValPrv[Ind] + dValAtu;
      end;

      if not(qryProcesso.FieldByName('DataNotif').IsNull) and
         (qryProcesso.FieldByName('DataNotif').asDateTime >=
          StrToDate('01/' + sMesStr + '/' + sAnoStr))  and
         (qryProcesso.FieldByName('DataNotif').asDateTime <
          StrToDate('01/' + sPrxMes + '/' + sPrxAno))  then
      begin
        Inc(iTotEnt);
        TTEntMax := TTEntMax + dValMax;
        TTEntPrv := TTEntPrv + dValAtu;
        TotQtdEnt[Ind] := TotQtdEnt[Ind] + 1;
        TotEntMax[Ind] := TotEntMax[Ind] + dValMax;
        TotEntPrv[Ind] := TotEntPrv[Ind] + dValAtu;
      end;

      if not(qryProcesso.FieldByName('DataEfetEnc').IsNull) and
         (qryProcesso.FieldByName('DataEfetEnc').asDateTime >=
          StrToDate('01/' + sMesStr + '/' + sAnoStr)) and
         (qryProcesso.FieldByName('DataEfetEnc').asDateTime <
          StrToDate('01/' + sPrxMes + '/' + sPrxAno)) then
      begin
        Inc(iTotSai);
        TTSaiMax  := TTSaiMax + dValMax;
        TTSaiPrv  := TTSaiPrv + dValAtu;
        TTValRea  := TTValRea + dValReal;
        Inc(TotQtdSai[Ind]);
        TotSaiMax[Ind] := TotSaiMax[Ind] + dValMax;
        TotSaiPrv[Ind] := TotSaiPrv[Ind] + dValAtu;
        TotValRea[Ind] := TotValRea[Ind] + dValReal;

        if (qryProcesso.FieldByName('TipoEncer').asString = 'S') then
        begin // Sentença
          Inc(iTotDec);
          TTValDec := TTValDec + dValReal;
          Inc(TotQtdDec[Ind]);
          TotValDec[Ind] := TotValDec[Ind] + dValReal;
        end
        else
        if (qryProcesso.FieldByName('TipoEncer').asString = 'C') then
        begin // Acordo
          Inc(iTotAco);
          TTValAco := TTValAco + dValReal;
          Inc(TotQtdAco[Ind]);
          TotValAco[Ind] := TotValAco[Ind] + dValReal;
        end
        else
        begin // Outro
          Inc(iTotOut);
          TTValOut := TTValOut + dValReal;
          Inc(TotQtdOut[Ind]);
          TotValOut[Ind] := TotValOut[Ind] + dValReal;
        end;
      end;
    end;
  end;
end;

procedure TfrmParamAnalSintProc.GerarDadosRelat;
var
  c: byte;
begin
  with (dtmRelatoriosModCon.qryAnalSintProc) do
  begin
    if not(qryProcesso.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := qryProcesso.RecordCount;

      qryProcesso.First;
      // Gero todos os valores
      repeat
        dmCds.qry.Close;
        dmCds.qry.ParamByName('NumProcTrab').asString :=
          qryProcesso.FieldByName('NumProcTrab').asString;
        dmCds.qry.Open;

        GerarValores;
        qryProcesso.Next;
      until (qryProcesso.EOF);
      // Gravo cada valor na Query virtual
      Insert;
      FieldByName('Empresa').asString := Sistema.NomeEmpresa;
      for c:=1 to 12 do
      begin
        FieldByName('TotProc_'+PoeZero(c)).asInteger := TotQtdPrc[c];
        FieldByName('TotMax_'+PoeZero(c)).asFloat    := TotValMax[c] / 1000;
        FieldByName('TotEst_'+PoeZero(c)).asFloat    := TotValPrv[c] / 1000;

        FieldByName('TotEnt_'+PoeZero(c)).asInteger := TotQtdEnt[c];
        FieldByName('EntMax_'+PoeZero(c)).asFloat   := TotEntMax[c] / 1000;
        FieldByName('EntEst_'+PoeZero(c)).asFloat   := TotEntPrv[c] / 1000;

        FieldByName('TotSai_'+PoeZero(c)).asInteger := TotQtdSai[c];
        FieldByName('SaiMax_'+PoeZero(c)).asFloat   := TotSaiMax[c] / 1000;
        FieldByName('SaiEst_'+PoeZero(c)).asFloat   := TotSaiPrv[c] / 1000;

        FieldByName('TotAco_'+PoeZero(c)).asInteger := TotQtdAco[c];
        FieldByName('ReaAco_'+PoeZero(c)).asFloat   := TotValAco[c] / 1000;

        FieldByName('TotDec_'+PoeZero(c)).asInteger := TotQtdDec[c];
        FieldByName('ReaDec_'+PoeZero(c)).asFloat   := TotValDec[c] / 1000;

        FieldByName('TotOut_'+PoeZero(c)).asInteger := TotQtdOut[c];
        FieldByName('ReaOut_'+PoeZero(c)).asFloat   := TotValOut[c] / 1000;

        FieldByName('TotRea_'+PoeZero(c)).asFloat   := TotValRea[c] / 1000;

        if (TotSaiMax[c] <> 0) then
          FieldByName('PerMax_'+PoeZero(c)).asFloat := TotValRea[c] * 100 / TotSaiMax[c];
        if (TotSaiPrv[c] <> 0) then
          FieldByName('PerEst_'+PoeZero(c)).asFloat := TotValRea[c] * 100 / TotSaiPrv[c];

        FieldByName('ReaDec_'+PoeZero(c)).asFloat := TotValDec[c] / 1000;
      end;
      FieldByName('TotEntT').asInteger := iTotEnt;
      FieldByName('EntMaxT').asFloat   := TTEntMax / 1000;
      FieldByName('EntEstT').asFloat   := TTEntPrv / 1000;

      FieldByName('TotSaiT').asInteger := iTotSai;
      FieldByName('SaiMaxT').asFloat   := TTSaiMax / 1000;
      FieldByName('SaiEstT').asFloat   := TTSaiPrv / 1000;

      FieldByName('TotAcoT').asInteger := iTotAco;
      FieldByName('ReaAcoT').asFloat   := TTValAco / 1000;

      FieldByName('TotDecT').asInteger := iTotDec;
      FieldByName('ReaDecT').asFloat   := TTValDec / 1000;

      FieldByName('TotOutT').asInteger := iTotOut;
      FieldByName('ReaOutT').asFloat   := TTValOut / 1000;

      FieldByName('TotReaT').asFloat   := TTValRea / 1000;
      if (TTSaiMax <> 0) then
        FieldByName('PerMaxT').asFloat := TTValRea * 100 / TTSaiMax;
      if (TTSaiPrv <> 0) then
        FieldByName('PerEstT').asFloat := TTValRea * 100 / TTSaiPrv;

      Post;
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

end.
