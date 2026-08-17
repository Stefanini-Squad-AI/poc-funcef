unit FCorrFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  TEdNum, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  Wwdatsrc, wwdblook, Wwquery, Wwtable, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCorrFaixa = class(TfrmOkCancelar)
    tblFaixa: TwwTable;
    tblFaixaIDFAIXASALARIAL: TFloatField;
    tblFaixaSTEP1: TFloatField;
    tblFaixaSTEP2: TFloatField;
    tblFaixaSTEP3: TFloatField;
    tblFaixaSTEP4: TFloatField;
    tblFaixaSTEP5: TFloatField;
    tblFaixaSTEP6: TFloatField;
    tblFaixaSTEP7: TFloatField;
    tblFaixaSTEP8: TFloatField;
    tblFaixaSTEP9: TFloatField;
    tblFaixaDATAEFETIV: TDateTimeField;
    gbxCondicoes: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    ednPerc: TEditNum;
    ednParcela: TEditNum;
    edData: TCMDateTimePicker;
    rgTipoArre: TRadioGroup;
    tblFuncio: TwwTable;
    tblSitFunc: TwwTable;
    dsF: TwwDataSource;
    tblHstces: TwwTable;
    qryMotac: TwwQuery;
    lblTipoEv: TLabel;
    dblcTipoEv: TwwDBLookupCombo;
    qryParamRH: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure edDataChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorrFaixa: TfrmCorrFaixa;

implementation

uses uMensErro, dBaseDados, UIntegraPrevRH, uSistema, fAguarde;

{$R *.DFM}

procedure TfrmCorrFaixa.FormCreate(Sender: TObject);
begin
  inherited;
  edData.Date     := Date;
  ednPerc.Text    := '0';
  ednParcela.Text := '0';

  qryParamRH.Open;
  dblcTipoEv.Visible := (qryParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1);
  lblTipoEv.Visible  := (qryParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1);
  if (qryParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) then
    qryMotac.Open;
end;

procedure TfrmCorrFaixa.edDataChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (edData.Text <> '');
end;
  
procedure TfrmCorrFaixa.bbtnConfirmarClick(Sender: TObject);
var
  rFator, rAjuste, rUltSalar: real;
  bFazIntegraPrevRH: boolean;
begin
  inherited;
  rAjuste := 0.49;
  rFator  := 100;

  case (rgTipoArre.ItemIndex) of
    1 : rFator := 10;
    2 : rFator := 1;
    3 : rFator := 0.10;
    4 : rFator := 0.01;
  end;

  if (rgTipoArre.ItemIndex = 0) then
    rAjuste := 0;

  if (MsgDlg('Confirma a Correção das Faixas ?', LerMensagem(4),
     mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    exit;

  tblFaixa.Open;
  tblFaixa.First;
  while not(tblFaixa.EOF) do
  begin
    tblFaixa.Edit;
    tblFaixaDATAEFETIV.Value := edData.Date;

    if (tblFaixaSTEP1.Value > 0) then
      tblFaixaSTEP1.Value := round((tblFaixaSTEP1.Value + tblFaixaSTEP1.Value *
        StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
        rAjuste) / rFator;

     if (tblFaixaSTEP2.Value > 0) then
       tblFaixaSTEP2.Value := round((tblFaixaSTEP2.Value + tblFaixaSTEP2.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP3.Value > 0) then
       tblFaixaSTEP3.Value := round((tblFaixaSTEP3.Value + tblFaixaSTEP3.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP4.Value > 0) then
       tblFaixaSTEP4.Value := round((tblFaixaSTEP4.Value + tblFaixaSTEP4.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP5.Value > 0) then
       tblFaixaSTEP5.Value := round((tblFaixaSTEP5.Value + tblFaixaSTEP5.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP6.Value > 0) then
       tblFaixaSTEP6.Value := round((tblFaixaSTEP6.Value + tblFaixaSTEP6.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP7.Value > 0) then
       tblFaixaSTEP7.Value := round((tblFaixaSTEP7.Value + tblFaixaSTEP7.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP8.Value > 0) then
       tblFaixaSTEP8.Value := round((tblFaixaSTEP8.Value + tblFaixaSTEP8.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     if (tblFaixaSTEP9.Value > 0) then
       tblFaixaSTEP9.Value := round((tblFaixaSTEP9.Value + tblFaixaSTEP9.Value *
         StrToFloat(ednPerc.Text) / 100 + StrToFloat(ednParcela.Text)) * rFator +
         rAjuste) / rFator;

     //tblFaixa.Post;      // Tirando o Post, sumiu o problema !!??
     tblFaixa.Next;
  end;

  if not(qryParamRH.Active) then
    qryParamRH.Open;

  if (qryParamRH.FieldByName('FLGNIVELINDIV').asInteger = 0) or
     ((StrToFloat(ednPerc.Text)    = 0) and
      (StrToFloat(ednParcela.Text) = 0) and
      (rgTipoArre.ItemIndex = 0)) then
  begin
    tblFaixa.Close;
    MsgDlg('Correção das Faixas Efetivada !',LerMensagem(3), mtInformation,[mbOk, mbHelp], 0);
  end
  else if (MsgDlg('Correção das Faixas Efetivada. Atualiza os Salários dos Empregados ?',
                  LerMensagem(4), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin

    if not(tblFuncio.Active) then
      tblFuncio.Open;

    if not(tblSitFunc.Active) then
      tblSitFunc.Open;

    if not(tblHstces.Active) then
      tblHstces.Open;

    tblFuncio.First;
    while not(tblFuncio.EOF) do
    begin
      if (tblSitFunc.FieldByName('TIPOSIT').Value <> 'D')      and
         (tblFuncio.FieldByName('IDFAIXACARGO').Value <> Null) and
         (tblFuncio.FieldByName('NIVELINDIV1').Value <> Null)  and
         (tblFaixa.FindKey([tblFuncio.FieldByName('IDFAIXACARGO').Value])) then
      begin
        rUltSalar := tblFuncio.FieldByName('SALARIOATUAL').Value;
        tblFuncio.Edit;
        tblFuncio.FieldByName('SALARIOATUAL').Value :=
        tblFaixa.FieldByName('STEP' + tblFuncio.FieldByName('NIVELINDIV1').AsString).Value;
        tblFuncio.FieldByName('DATASALARIO').Value := edData.Date;
        tblFuncio.Post;

        //Cria Histórico
        with (tblHstces) do
        begin
          Insert;
          FieldByName('IDPESSOA').Value       := tblFuncio.FieldByName('IDPESSOA').Value;
          FieldByName('DATAALTERFUNC').Value  := edData.Date;
          FieldByName('IDESTAB').Value        := tblFuncio.FieldByName('IDESTAB').Value;
          FieldByName('IDEMPRESA').Value      := tblFuncio.FieldByName('IDEMPRESA').Value;
          FieldByName('CODCENTROCUSTO').Value := tblFuncio.FieldByName('CODCENTROCUSTO').Value;
          FieldByName('IDCARGO').Value        := tblFuncio.FieldByName('IDCARGO').Value;
          FieldByName('SALARIO').Value        := tblFuncio.FieldByName('SALARIOATUAL').Value;
          FieldByName('IDMOTIVO').Value       := qryMotac.FieldByName('IDMOTIVO').Value;
          FieldByName('PERC_REAJ').Value      :=
            (tblFuncio.FieldByName('SALARIOATUAL').Value - rUltSalar)*100/rUltSalar;
          FieldByName('TIPOPAGAMENTO').Value  := tblFuncio.FieldByName('TIPOPAGAMENTO').Value;
          Post;
        end;
      end;
      tblFuncio.Next;
    end;
    tblFaixa.Close;
    tblFuncio.Close;
    tblSitFunc.Close;
    tblHstces.Close;
    MsgDlg('Alteração dos Salários Efetivada',LerMensagem(3),mtInformation,[mbOk, mbHelp], 0);
  end;

  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
      Add('SELECT TIPOEMPRESA ');
      Add('FROM EMPRESAPROP ');
      Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  end;
  dtmBaseDados.qry.Open;
  bFazIntegraPrevRH := (dtmBaseDados.qry.FieldByName('TIPOEMPRESA').asString = 'P');
  dtmBaseDados.qry.Close;
  if (bFazIntegraPrevRH) then
  begin
    frmAguarde.Mostra('Atualizando o Histórico das Faixas');
    frmAguarde.Pos := 0;
    dtmBaseDados.dbBaseDados.StartTransaction;
    if (AtualizaFaixasSalariais(Sistema.IdEmpresa)) then
      dtmBaseDados.dbBaseDados.Commit
    else
      dtmBaseDados.dbBaseDados.RollBack;
    frmAguarde.Apaga;
  end;

end;

end.
