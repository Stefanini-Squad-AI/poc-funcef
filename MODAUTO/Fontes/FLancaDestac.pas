unit FLancaDestac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit,
  Db, DBTables, Wwquery, TREdit, wwdblook, Spin, Wwtable, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmLancaDestac = class(TfrmOkCancelar)
    dblcDiaria: TwwDBLookupCombo;
    dblcTransporte: TwwDBLookupCombo;
    dblcAdiantamento: TwwDBLookupCombo;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    redTransporte: TRealEdit;
    redAdiantamento: TRealEdit;
    qryRub1: TwwQuery;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    qryRub2: TwwQuery;
    qryRub3: TwwQuery;
    tblRubInd: TwwTable;
    qryParam: TwwQuery;
    edNome: TEdit;
    gbxIntervRef: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtedIni: TCMDateTimePicker;
    dtedFin: TCMDateTimePicker;
    qryTrecho: TwwQuery;
    qryCalen: TwwQuery;
    qryAux: TwwQuery;
    qryAux2: TwwQuery;
    rgMaisLancamentos: TRadioGroup;
    redDiaria: TRealEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    function ProxSeqRubricaIndiv(sIdPessoa, sIdRubrica: String): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancaDestac: TfrmLancaDestac;

implementation

uses FCadDestacamento, uSistema, uMensErro, dBaseDados, uDataBase,
  uFuncoesUteisRH;

{$R *.DFM}

procedure TfrmLancaDestac.FormShow(Sender: TObject);
var
  wDia, wMes, wAno : word;
  CodRubCLT1, CodRubCLT2, CodRubCLT3: String;
begin
  inherited;
  qryParam.Open;

  CodRubCLT1 := '70010';
  CodRubCLT2 := '70011';
  CodRubCLT3 := '70012';

  if (frmCadDestacamento.dbrgObjetivo.ItemIndex = 1) then
  begin
    CodRubCLT1 := '70013';
    CodRubCLT2 := '70014';
    CodRubCLT3 := '70015';
  end;

  dtedIni.Date := Date - 30;
  dtedFin.Date := Date;

  edNome.Visible          := (not bLancaColetivo);
  redDiaria.Visible       := (not bLancaColetivo);
  redTransporte.Visible   := (not bLancaColetivo);
  redAdiantamento.Visible := (not bLancaColetivo);
  gbxIntervRef.Visible    := (bLancaColetivo);
  if (not bLancaColetivo) then
  begin
    edNome.Text           := frmCadDestacamento.CMProcuraFunc.Text;
    redDiaria.Value       := ValorDiaria;
    redTransporte.Value   := ValorTransporte;
    redAdiantamento.Value := frmCadDestacamento.EdValorTotal.Value;
  end;

  if not qryRub1.Active then qryRub1.Open;
  if not qryRub2.Active then qryRub2.Open;
  if not qryRub3.Active then qryRub3.Open;

  dblcDiaria.Text := '';
  if  qryRub1.Locate('CodRubCLT',CodRubCLT1,[])  then
      dblcDiaria.Text := qryRub1.FieldByName('Descricao').AsString;
  dblcTransporte.Text := '';
  if  qryRub2.Locate('CodRubCLT',CodRubCLT2,[])  then
      dblcTransporte.Text := qryRub2.FieldByName('Descricao').AsString;
  dblcAdiantamento.Text := '';
  if  qryRub3.Locate('CodRubCLT',CodRubCLT3,[])  then
      dblcAdiantamento.Text := qryRub3.FieldByName('Descricao').AsString;

  DecodeDate(qryParam.FieldbyName('NormalIni').Value, wAno, wMes, wDia);
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value := wAno;

end;

procedure TfrmLancaDestac.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef : String;
  IntUm, iTotInsere, iTotAltera, iProxSeq   : Integer;
  sSql    : String;
  QtDiar1, QtDiar2, QtDiar3, QtDiarAntes, QtDiarApos, FlgAntes, FlgApos: Integer;
  dDestacamentoDiarias, dDestacamentoTransporte, dDestacamentoValorTotal: double;
begin
  inherited;
  IntUm := 1;
  iTotInsere := 0;  iTotAltera := 0;
  sMesRef := Trim(spnedAno.Text) + '/';
  if cmbMes.ItemIndex <= 8
  then sMesRef := sMesRef + '0'+IntToStr(cmbMes.ItemIndex+1)
  else sMesRef := sMesRef + IntToStr(cmbMes.ItemIndex+1);

  if not tblRubInd.Active then tblRubInd.Open;

  if (not bLancaColetivo) then // Lançamento Individual
  begin
    if  (redDiaria.Value > 0) and (dblcDiaria.Text <> '')  then
    begin
      iProxSeq := ProxSeqRubricaIndiv(
                   frmCadDestacamento.Cds.FieldByName('IDPESSOA').AsString,
                   qryRub1.FieldByName('IDPROVENTO').AsString);
      if qryAux.FieldbyName('ANOMESINICIO').AsString <> sMesRef
      then begin
           tblRubInd.Insert;
           tblRubInd.FieldbyName('IDPESSOA').Value := frmCadDestacamento.Cds.FieldByName('IDPESSOA').Value;
           tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
           tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub1.FieldByName('IDPROVENTO').Value;
           tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
           tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
           tblRubInd.FieldbyName('VALORRUBRICA').Value := redDiaria.Value;
           tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
           tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
           tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
           tblRubInd.FieldbyName('PARCELAS').Value := 1;
           tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := iProxSeq;
           tblRubInd.Post;
           inc(iTotInsere);
      end
      else begin
           tblRubInd.FindKey([frmCadDestacamento.Cds.FieldByName('IDPESSOA').Value,
                              Sistema.IdEmpresa,
                              qryRub1.FieldByName('IDPROVENTO').Value,iProxSeq-1]);
           tblRubInd.Edit;
           tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
           tblRubInd.FieldbyName('VALORRUBRICA').Value :=
              tblRubInd.FieldbyName('VALORRUBRICA').Value + redDiaria.Value;
           tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
           if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
           then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                           tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
           tblRubInd.Post;
           inc(iTotAltera);
      end;
    end;

    if  (redTransporte.Value > 0) and (dblcTransporte.Text <> '')  then
    begin
      iProxSeq := ProxSeqRubricaIndiv(
                   frmCadDestacamento.Cds.FieldByName('IDPESSOA').AsString,
                   qryRub2.FieldByName('IDPROVENTO').AsString);
      if qryAux.FieldbyName('ANOMESINICIO').AsString <> sMesRef
      then begin
           tblRubInd.Insert;
           tblRubInd.FieldbyName('IDPESSOA').Value := frmCadDestacamento.Cds.FieldByName('IDPESSOA').Value;
           tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
           tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub2.FieldByName('IDPROVENTO').Value;
           tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub2.FieldByName('IDREGRA').Value;
           tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
           tblRubInd.FieldbyName('VALORRUBRICA').Value := redTransporte.Value;
           tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
           tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
           tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
           tblRubInd.FieldbyName('PARCELAS').Value := 1;
           tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := iProxSeq;
           tblRubInd.Post;
           inc(iTotInsere);
      end
      else begin
           tblRubInd.FindKey([frmCadDestacamento.Cds.FieldByName('IDPESSOA').Value,
                              Sistema.IdEmpresa,
                              qryRub2.FieldByName('IDPROVENTO').Value,iProxSeq-1]);
           tblRubInd.Edit;
           tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub2.FieldByName('IDREGRA').Value;
           tblRubInd.FieldbyName('VALORRUBRICA').Value :=
             tblRubInd.FieldbyName('VALORRUBRICA').Value + redTransporte.Value;
           tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
           if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
           then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                           tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
           tblRubInd.Post;
           inc(iTotAltera);
      end;
    end;

    if  (redAdiantamento.Value > 0) and (dblcAdiantamento.Text <> '')  then
    begin
      iProxSeq := ProxSeqRubricaIndiv(
                   frmCadDestacamento.Cds.FieldByName('IDPESSOA').AsString,
                   qryRub3.FieldByName('IDPROVENTO').AsString);
      if qryAux.FieldbyName('ANOMESINICIO').AsString <> sMesRef
      then begin
           tblRubInd.Insert;
           tblRubInd.FieldbyName('IDPESSOA').Value := frmCadDestacamento.Cds.FieldByName('IDPESSOA').Value;
           tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
           tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub3.FieldByName('IDPROVENTO').Value;
           tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub3.FieldByName('IDREGRA').Value;
           tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
           tblRubInd.FieldbyName('VALORRUBRICA').Value := redAdiantamento.Value;
           tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
           tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
           tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
           tblRubInd.FieldbyName('PARCELAS').Value := 1;
           tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := iProxSeq;
           tblRubInd.Post;
           inc(iTotInsere);
      end
      else begin
           tblRubInd.FindKey([frmCadDestacamento.Cds.FieldByName('IDPESSOA').Value,
                              Sistema.IdEmpresa,
                              qryRub3.FieldByName('IDPROVENTO').Value,iProxSeq-1]);
           tblRubInd.Edit;
           tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub3.FieldByName('IDREGRA').Value;
           tblRubInd.FieldbyName('VALORRUBRICA').Value :=
              tblRubInd.FieldbyName('VALORRUBRICA').Value + redAdiantamento.Value;
           tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
           if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
           then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                           tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
           tblRubInd.Post;
           inc(iTotAltera);
      end;
    end;

    // Marca que o lançamento foi feito
    if (rgMaisLancamentos.ItemIndex = 1) then
    begin
      with (qryAux2) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE DESTACAMENTO SET FLGLANCAFOLHA = 1 WHERE IDDESTACAMENTO = ' +
                frmCadDestacamento.Cds.FieldByName('IDDESTACAMENTO').asString);
        ExecSql;
        Close;
      end;

      if (frmCadDestacamento.Cds.State in [dsInsert, dsEdit]) then
        frmCadDestacamento.Cds.FieldByName('FLGLANCAFOLHA').asInteger := 1
      else
      begin
        frmCadDestacamento.Cds.Edit;
        frmCadDestacamento.Cds.FieldByName('FLGLANCAFOLHA').asInteger := 1;
        frmCadDestacamento.Cds.Post;
      end;
    end;

  end
  else // Lançamento Coletivo
  begin

    // Monta Query Auxiliar
    dtmBaseDados.qry.Close;
    with (dtmBaseDados.qry.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  DST.DATAINI, DST.DATAFIM, DST.IDPESSOA, DST.IDDESTACAMENTO, ');
      Add('  ('+QuotedStr(dtedIni.Text +' / '+ dtedFin.Text)+') AS REFERENCIA ');
      Add('FROM');
      Add('  DESTACAMENTO DST, RADINSTPROCESSO RAD');
      Add('WHERE');
      Add('  (NVL(DST.FLGLANCAFOLHA,0)  = 0) AND ');
      Add('  (DST.DATAINI BETWEEN TO_DATE('+QuotedStr(dtedIni.Text)+',''DD/MM/YYYY'') AND '+
        'TO_DATE('+QuotedStr(dtedFin.Text)+',''DD/MM/YYYY''))');
      Add(' AND (DST.IDPROCESSO = RAD.IDPROCESSO(+))');
      Add(' AND (RAD.IDPROCESSO IS NULL OR RAD.FLGOK = ''S'')');
      Add('ORDER BY IDPESSOA');

    end;
    dtmBaseDados.qry.Open;
    if dtmBaseDados.qry.IsEmpty then
    begin
      MsgDlg('Não Há Destacamentos a serem Lançados no Período Indicado !',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
    end;

    while not dtmBaseDados.qry.Eof do
    begin
      dDestacamentoDiarias      := 0;   dDestacamentoTransporte    := 0;
      dDestacamentoValorTotal   := 0;
      QtDiar1            := 0;   QtDiar2         := 0;   QtDiar3     := 0;
      QtDiarAntes        := 0;   QtDiarApos      := 0;

      qryCalen.Close;
      qryCalen.ParamByName('IDDESTACAMENTO').asString := dtmBaseDados.qry.FieldByName('IDDESTACAMENTO').asString;
      qryCalen.Open;

      if (not qryCalen.IsEmpty) then
      begin
         qryCalen.First;
         while not qryCalen.Eof do
         begin
            if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime < dtmBaseDados.qry.FieldByName('DATAINI').asDateTime then
               inc(QtDiarAntes)
            else
            if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime > dtmBaseDados.qry.FieldByName('DATAFIM').asDateTime then
               inc(QtDiarApos)
            else
            begin
              if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime = dtmBaseDados.qry.FieldByName('DATAINI').asDateTime then
                 flgAntes := qryCalen.FieldByName('FLGDIARIA').asInteger;

              if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime = dtmBaseDados.qry.FieldByName('DATAFIM').asDateTime then
                 flgApos := qryCalen.FieldByName('FLGDIARIA').asInteger;

              if qryCalen.FieldByName('FLGDIARIA').asInteger = 0 then
                inc(QtDiar2)
              else
                inc(QtDiar3);
            end;
            qryCalen.Next;
         end;

         qryCalen.First;
         if flgAntes = 0 then
            QtDiar1 := QtDiar1 + QtDiarAntes
         else
            QtDiar2 := QtDiar2 + QtDiarAntes;

         if flgApos = 0 then
            QtDiar1 := QtDiar1 + QtDiarApos
         else
            QtDiar2 := QtDiar2 + QtDiarApos;
      end;

      sSql:= 'SELECT ' +
              IntToStr(QTDIAR1) + ' * 0.25 * NVL(DV.VLRDST,0) + '+
              IntToStr(QTDIAR2) + ' * 0.50 * NVL(DV.VLRDST,0) + '+
              IntToStr(QTDIAR3) + ' * NVL(DV.VLRDST,0)'+
              ' AS VALORDIARIA '+
              'FROM  '+
              '(SELECT IDDSTTARIFA, VLRDST FROM FUNCIONARIO F, CARGO C, DSTVALORES V '+
              '  WHERE V.DATADSTVALORES = (SELECT MAX(V.DATADSTVALORES) '+
              '                                FROM FUNCIONARIO F, CARGO C, DSTVALORES V '+
              '                                WHERE F.IDPESSOA = ' +
                                                dtmBaseDados.qry.FieldByName('IDPESSOA').asString +
                                                ' AND '+
              '                                 DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO AND '+
              '                                 C.CODNIVEL      = V.IDDSTTARIFA AND '+
              '                                 V.DATADSTVALORES <= TO_DATE(' +
               QuotedStr(dtmBaseDados.qry.FieldByName('DATAINI').asString) + ',''DD/MM/YYYY''))' +
              '  AND F.IDPESSOA = ' +     dtmBaseDados.qry.FieldByName('IDPESSOA').asString +
              '  AND DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO AND '+
              '  C.CODNIVEL      = V.IDDSTTARIFA ) DV ';

      If Fazquery(qryAux,sSql) Then
         dDestacamentoDiarias := qryAux.FieldByName('VALORDIARIA').asFloat;


      qryTrecho.Close;
      qryTrecho.ParamByName('IDDESTACAMENTO').asString := dtmBaseDados.qry.FieldByName('IDDESTACAMENTO').asString;
      qryTrecho.Open;

      qryTrecho.First;
      while not qryTrecho.Eof do
      begin
        dDestacamentoTransporte := dDestacamentoTransporte +
                           qryTrecho.FieldByName('FLGTRANSPORTE').asInteger *
                           qryTrecho.FieldByName('VLRTRANSPORTE').asFloat   +
                           qryTrecho.FieldByName('VLREMBARQUE').asFloat   +
                           qryTrecho.FieldByName('VLRDESEMBARQUE').asFloat;
        qryTrecho.Next;
      end;
      qryTrecho.First;

      dDestacamentoValorTotal := dDestacamentoDiarias + dDestacamentoTransporte;

      if  (dDestacamentoDiarias > 0) and (dblcDiaria.Text <> '')  then
      begin
        iProxSeq := ProxSeqRubricaIndiv(
                     dtmBaseDados.qry.FieldByName('IDPESSOA').AsString,
                     qryRub1.FieldByName('IDPROVENTO').AsString);
        if qryAux.FieldbyName('ANOMESINICIO').AsString <> sMesRef
        then begin
             tblRubInd.Insert;
             tblRubInd.FieldbyName('IDPESSOA').Value := dtmBaseDados.qry.FieldByName('IDPESSOA').Value;
             tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
             tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub1.FieldByName('IDPROVENTO').Value;
             tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
             tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
             tblRubInd.FieldbyName('VALORRUBRICA').Value := dDestacamentoDiarias;
             tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
             tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
             tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
             tblRubInd.FieldbyName('PARCELAS').Value := 1;
             tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := iProxSeq;
             tblRubInd.Post;
             inc(iTotInsere);
        end
        else begin
             tblRubInd.FindKey([dtmBaseDados.qry.FieldByName('IDPESSOA').Value,
                                Sistema.IdEmpresa,
                                qryRub1.FieldByName('IDPROVENTO').Value,iProxSeq-1]);
             tblRubInd.Edit;
             tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub1.FieldByName('IDREGRA').Value;
             tblRubInd.FieldbyName('VALORRUBRICA').Value :=
                tblRubInd.FieldbyName('VALORRUBRICA').Value + dDestacamentoDiarias;
             tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
             if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
             then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                             tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
             tblRubInd.Post;
             inc(iTotAltera);
        end;
      end;

      if  (dDestacamentoTransporte > 0) and (dblcTransporte.Text <> '')  then
      begin
        iProxSeq := ProxSeqRubricaIndiv(
                     dtmBaseDados.qry.FieldByName('IDPESSOA').AsString,
                     qryRub2.FieldByName('IDPROVENTO').AsString);
        if qryAux.FieldbyName('ANOMESINICIO').AsString <> sMesRef
        then begin
             tblRubInd.Insert;
             tblRubInd.FieldbyName('IDPESSOA').Value := dtmBaseDados.qry.FieldByName('IDPESSOA').Value;
             tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
             tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub2.FieldByName('IDPROVENTO').Value;
             tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub2.FieldByName('IDREGRA').Value;
             tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
             tblRubInd.FieldbyName('VALORRUBRICA').Value := dDestacamentoTransporte;
             tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
             tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
             tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
             tblRubInd.FieldbyName('PARCELAS').Value := 1;
             tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := iProxSeq;
             tblRubInd.Post;
             inc(iTotInsere);
        end
        else begin
             tblRubInd.FindKey([dtmBaseDados.qry.FieldByName('IDPESSOA').Value,
                                Sistema.IdEmpresa,
                                qryRub2.FieldByName('IDPROVENTO').Value,iProxSeq-1]);
             tblRubInd.Edit;
             tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub2.FieldByName('IDREGRA').Value;
             tblRubInd.FieldbyName('VALORRUBRICA').Value :=
                tblRubInd.FieldbyName('VALORRUBRICA').Value + dDestacamentoTransporte;
             tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
             if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
             then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                             tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
             tblRubInd.Post;
             inc(iTotAltera);
        end;
      end;

      if  (dDestacamentoValorTotal > 0) and (dblcAdiantamento.Text <> '')  then
      begin
        iProxSeq := ProxSeqRubricaIndiv(
                     dtmBaseDados.qry.FieldByName('IDPESSOA').AsString,
                     qryRub3.FieldByName('IDPROVENTO').AsString);
        if qryAux.FieldbyName('ANOMESINICIO').AsString <> sMesRef
        then begin
             tblRubInd.Insert;
             tblRubInd.FieldbyName('IDPESSOA').Value := dtmBaseDados.qry.FieldByName('IDPESSOA').Value;
             tblRubInd.FieldbyName('IDEMPRESA').Value := Sistema.IdEmpresa;
             tblRubInd.FieldbyName('IDRUBRICA').Value := qryRub3.FieldByName('IDPROVENTO').Value;
             tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub3.FieldByName('IDREGRA').Value;
             tblRubInd.FieldbyName('NUMOCORRENCIAS').Value := 0;
             tblRubInd.FieldbyName('VALORRUBRICA').Value := dDestacamentoValorTotal;
             tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
             tblRubInd.FieldbyName('FLGPERMANENTE').Value := 0;
             tblRubInd.FieldbyName('FLGTPRUBMANUT').Value := '2';
             tblRubInd.FieldbyName('PARCELAS').Value := 1;
             tblRubInd.FieldbyName('SEQRUBRICAINDIV').Value := iProxSeq;
             tblRubInd.Post;
             inc(iTotInsere);
        end
        else begin
             tblRubInd.FindKey([dtmBaseDados.qry.FieldByName('IDPESSOA').Value,
                                Sistema.IdEmpresa,
                                qryRub3.FieldByName('IDPROVENTO').Value,iProxSeq-1]);
             tblRubInd.Edit;
             tblRubInd.FieldbyName('IDREGRACALCULO').Value := qryRub3.FieldByName('IDREGRA').Value;
             tblRubInd.FieldbyName('VALORRUBRICA').Value :=
                tblRubInd.FieldbyName('VALORRUBRICA').Value + dDestacamentoValorTotal;
             tblRubInd.FieldbyName('ANOMESINICIO').Value := sMesRef;
             if  (tblRubInd.FieldbyName('FLGPERMANENTE').AsInteger = 0)
             then  tblRubInd.FieldbyName('PARCELAS').AsInteger :=
                             tblRubInd.FieldbyName('NUMOCORRENCIAS').AsInteger + 1;
             tblRubInd.Post;
             inc(iTotAltera);
        end;
      end;

      // Marca que o lançamento foi feito
      if (rgMaisLancamentos.ItemIndex = 1) then
      begin
        if dtmBaseDados.qry.FieldByName('IDDESTACAMENTO').asString =
           frmCadDestacamento.Cds.FieldByName('IDDESTACAMENTO').asString
        then
        begin
          if frmCadDestacamento.Cds.State in [dsInsert, dsEdit] then
             frmCadDestacamento.Cds.FieldByName('FLGLANCAFOLHA').asInteger := 1
          else
          begin
            frmCadDestacamento.Cds.Edit;
            frmCadDestacamento.Cds.FieldByName('FLGLANCAFOLHA').asInteger := 1;
            frmCadDestacamento.Cds.Post;
          end;
        end;

        with (qryAux2) do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE DESTACAMENTO SET FLGLANCAFOLHA = 1 WHERE IDDESTACAMENTO = ' +
                  dtmBaseDados.qry.FieldByName('IDDESTACAMENTO').asString);
          ExecSql;
          Close;
        end;
      end;

      dtmBaseDados.qry.Next;
    end;
    dtmBaseDados.qry.Close;

  end;
  MsgDlg('Lançamentos Inseridos: ' + IntToStr(iTotInsere) + CR_LF +
         'Lançamentos Alterados: ' + IntToStr(iTotAltera) ,
         'Informação',mtInformation,[mbOk,mbHelp],0);

end;

function TfrmLancaDestac.ProxSeqRubricaIndiv(sIdPessoa, sIdRubrica: String): Integer;
begin
  qryAux.Close;
  with qryAux.Sql do
  begin
      Clear;
      Add('SELECT ANOMESINICIO, SEQRUBRICAINDIV FROM RUBRICAINDIV ');
      Add('WHERE IDPESSOA  = ' + sIdPessoa);
      Add('AND   IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
      Add('AND   IDRUBRICA = ' + sIdRubrica);
      Add('ORDER BY SEQRUBRICAINDIV DESC');
  end;
  qryAux.Open;
  Result := qryAux.FieldbyName('SEQRUBRICAINDIV').AsInteger + 1;
end;

end.

