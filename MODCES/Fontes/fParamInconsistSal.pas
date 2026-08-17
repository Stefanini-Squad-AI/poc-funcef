{*******************************************************
RESPONSÁVEL.: Douglas Siqueira
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Descrição...: Alteração do limite de faixas de 9 para 20.
*******************************************************}


unit fParamInconsistSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FSelPessoal,
  Db, DBTables, Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TB97, wwdblook, ExtCtrls,
  Spin, TEdNum, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, TREdit;

type
  TfrmParamInconsistSal = class(TfrmSelPessoal)
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    qryInconsistSalAux: TwwQuery;
    gbxFatoresHay: TGroupBox;
    redHayMin: TRealEdit;
    redHayMax: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
  private
    IndPolitica: integer;
    procedure GravaDadosQuery;
  end;

var
  frmParamInconsistSal: TfrmParamInconsistSal;

implementation

uses uSistema, uMensErro, dBaseDados, uDataBase, uFuncoesUteisRH, fAguarde, dRelatoriosCes;

{$R *.DFM}

procedure TfrmParamInconsistSal.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  If Fazquery(DtmBaseDados.qry,'SELECT INDPOLITICA FROM PARAMRH') then
    IndPolitica := DtmBaseDados.qry.FieldByName('INDPOLITICA').asInteger;

  gbxFatoresHay.Visible := (IndPolitica = 1);

  if IndPolitica = 1 then
  begin
     redHayMin.Value := 0.7;
     redHayMax.Value := 1.5;
  end;

  cmbTipoPapel.Items.Assign (dtmRelatoriosCes.rpInconsistSal.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;
end;

procedure TfrmParamInconsistSal.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  sListaFunc: string;
begin
  if redHayMin.Value > redHayMax.Value then
  begin
    MsgDlg('O Fator Mínimo não deve ser maior do que o Fator Máximo! Verifique.',
            'Aviso',mtInformation,[mbOk,mbHelp],0);
    exit;
  end;

  inherited;

  c:=0;
  while not(tblPessoal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := tblPessoal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ tblPessoal.FieldByName('IDPESSOA').asString;

    tblPessoal.Next;
  end;

  qryInconsistSalAux.Close;
  with (qryInconsistSalAux.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  F.MATRICULA, PF.NOME AS EMPREGADO,');
    Add('  C.TITULO AS CARGO, F.IDCARGO,');
    Add('  F.SALARIOATUAL, PRH.FLGNIVELINDIV, F.TIPOPAGAMENTO');

    if IndPolitica = 0 then  // Faixas Salariais do cargo
      begin
      Add('  ,FS.STEP1, FS.STEP2, FS.STEP3, FS.STEP4, FS.STEP5, FS.STEP6, FS.STEP7, FS.STEP8, FS.STEP9');

      //Douglas.Siqueira SOL 171426 Kintana 1537613
      Add('  ,FS.STEP10, FS.STEP11, FS.STEP12, FS.STEP13, FS.STEP14, FS.STEP15');
      Add('  ,FS.STEP16, FS.STEP17, FS.STEP18, FS.STEP19, FS.STEP20');
      //Douglas.Siqueira SOL 171426 Kintana 1537613

      end;
    Add('FROM');
    Add('  PESSOA PF, FUNCIONARIO F, CARGO C, PARAMRH PRH');

    if IndPolitica = 0 then  // Faixas Salariais do cargo
      Add('  , FAIXASAL FS');

    Add('WHERE');

    if IndPolitica = 0 then  // Faixas Salariais do cargo
      Add('  (DECODE(PRH.FLGNIVELINDIV,1,F.IDFAIXACARGO,C.IDFAIXASALARIAL) IS NOT NULL) AND');

    // Funcionários selecionado(s)
    if (sListaFunc <> '') then
    begin
      if (Pos(',',sListaFunc) > 0) then
        Add('  (PF.IDPESSOA      IN (' +sListaFunc+ ')) AND')
      else
        Add('  (PF.IDPESSOA       = ' +sListaFunc+ ') AND');
    end;

    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDCARGO         = C.IDCARGO) ');

    if IndPolitica = 0 then  // Faixas Salariais do cargo
      Add(' AND (DECODE(PRH.FLGNIVELINDIV,1,F.IDFAIXACARGO,C.IDFAIXASALARIAL) = FS.IDFAIXASALARIAL)');

    Add('ORDER BY NOME');
    SaveToFile ('c:\qry.txt');
  end;

  // Monta Query Principal
  with (dtmRelatoriosCes) do
  begin
    frmAguarde.Mostra('Listagem de Inconsistências Salariais');
    frmAguarde.Pos := 0;

    // Aponto o UpdateSQL para a query Principal
    qryInconsistSal.UpdateObject := updSQL;

    if not(qryInconsistSal.IsEmpty) then
      qryInconsistSal.CancelUpdates;
    qryInconsistSal.Close;
    qryInconsistSal.Open;

    // Processa dados para a geração da query
    qryInconsistSalAux.Open;
    GravaDadosQuery;
    qryInconsistSal.First;

    // Especifico Configurações do Relatório
    rpInconsistSal.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end;
end;

procedure TfrmParamInconsistSal.GravaDadosQuery;
var
  dValor, dValMin, dValMax: double;
begin
  with (dtmRelatoriosCes.qryInconsistSal) do
  begin
    if not(qryInconsistSalAux.IsEmpty) then
    begin
      frmAguarde.Min := 0;
      frmAguarde.Max := qryInconsistSalAux.RecordCount;

      repeat
        if IndPolitica = 0 then  // Faixas Salariais do cargo
        begin
          dValMin := qryInconsistSalAux.FieldByName('STEP1').asFloat;
          dValMax := qryInconsistSalAux.FieldByName('STEP1').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP2').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP2').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP3').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP3').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP4').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP4').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP5').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP5').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP6').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP6').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP7').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP7').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP8').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP8').asFloat;

          if (qryInconsistSalAux.FieldByName('STEP9').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP9').asFloat;

          //Douglas.Siqueira SOL 171426 Kintana 1537613
          if (qryInconsistSalAux.FieldByName('STEP10').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP10').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP11').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP11').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP12').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP12').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP13').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP13').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP14').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP14').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP15').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP15').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP16').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP16').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP17').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP17').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP18').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP18').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP19').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP19').asFloat;
          if (qryInconsistSalAux.FieldByName('STEP20').asFloat > dValMax) then
            dValMax := qryInconsistSalAux.FieldByName('STEP20').asFloat;
          //Douglas.Siqueira SOL 171426 Kintana 1537613 - fim

        end
        else
        begin // Tabela Hay
          dValMin := ValorHay(qryInconsistSalAux.FieldByName('IdCargo').AsInteger);
          dValMax := dValMin * redHayMax.Value;
          dValMIN := dValMin * redHayMin.Value;
        end;

        dValor := qryInconsistSalAux.FieldByName('SALARIOATUAL').asFloat;

        if (qryInconsistSalAux.FieldByName('TIPOPAGAMENTO').asString = 'D') then
          dValor := dValor * 30
        else
        if (qryInconsistSalAux.FieldByName('TIPOPAGAMENTO').Value = 'H') then
          dValor := dValor * qryInconsistSalAux.FieldByName('JORNADAMENSAL').asInteger;

        if ((dValor >= dValMin) and (dValor <= dValMax)) or (dValMax <= 0) then
        begin
          frmAguarde.Pos := frmAguarde.Pos+1;
          qryInconsistSalAux.Next;
          continue;
        end;

        Insert;
        FieldByName('EMPREGADO').asString    := qryInconsistSalAux.FieldByName('EMPREGADO').asString;
        FieldByName('MATRICULA').asString    := qryInconsistSalAux.FieldByName('MATRICULA').asString;
        FieldByName('CARGO').asString        := qryInconsistSalAux.FieldByName('CARGO').asString;
        FieldByName('EMPRESA').asString      := Sistema.NomeEmpresa;
        FieldByName('SALARIOATUAL').asString := qryInconsistSalAux.FieldByName('SALARIOATUAL').asString;

        case (qryInconsistSalAux.FieldByName('TIPOPAGAMENTO').asString[1]) of
          'H' : FieldByName('TIPOPAGAMENTO').asString := 'Horista';
          'D' : FieldByName('TIPOPAGAMENTO').asString := 'Diarista';
          'M' : FieldByName('TIPOPAGAMENTO').asString := 'Mensalista';
          'T' : FieldByName('TIPOPAGAMENTO').asString := 'Tarefa';
        end;
        FieldByName('TIPOPAGAMENTO').asString := '(' +FieldByName('TIPOPAGAMENTO').asString+ ')';

        if (dValor < dValMin) then
        begin
          FieldByName('ABAIXO_MINIMO').asInteger := 1;
          FieldByName('ACIMA_MINIMO').asInteger  := 0;
          FieldByName('VALOR_REF').asFloat       := dValMin;
          dValMax := (dValMin - dValor) * 100 / dValMin;
          FieldByName('OBSERV').asString         := Trim(FloatToStrF(dValMax,ffNumber,10,2)) +
            '% Abaixo do Min.';
        end
        else
        begin
          FieldByName('ABAIXO_MINIMO').asInteger := 0;
          FieldByName('ACIMA_MINIMO').asInteger  := 1;
          FieldByName('VALOR_REF').asFloat       := dValMax;
          dValMin := (dValor - dValMax) * 100 / dValMax;
          FieldByName('OBSERV').asString         := Trim(FloatToStrF(dValMin,ffNumber,10,2)) +
            '% Acima do Max.';
        end;
        Post;

        frmAguarde.Pos := frmAguarde.Pos+1;

        qryInconsistSalAux.Next;
      until (qryInconsistSalAux.EOF);
    end;

    if (qryInconsistSalAux.IsEmpty) or (IsEmpty) then
    begin
      ModalResult := mrNone;
      bbtnOutraVez.Enabled := true;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

procedure TfrmParamInconsistSal.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  bbtnOutraVez.Enabled := false;
end;

end.
