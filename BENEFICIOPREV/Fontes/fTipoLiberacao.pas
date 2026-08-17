unit fTipoLiberacao;

{-----------------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 125597
Data.......: 17/05/2022
Responsável: Luis Ferrari
Descrição..: Deixar o mês reembolso igual ao mês de referencia quando marcado e for inss
-------------------------------------------------------------------------------
Alteração  :
Nº SIG.....: 19963
Data.......: 06/05/2016
Responsável: Edilaine
Descrição..: ao utilizar teclas de atalho (alts) para liberar o beneficio em vez do
             mouse, o valor do beneficio no demonstrativo aparece zerado
-------------------------------------------------------------------------------
Alteração  :
Nº SOL.....: 253577-18143
KTN / PPM  : 1318908
Data       : 04/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associaçao de taxas e liberacao
             do campo valor total para beneficios sem BS e FAB
{-----------------------------------------------------------------------------------------
Alteração  :  (.dfm) grpDeficit
Nº SOL.....: 253577-18064
KTN / PPM  : 1240079
Data       : 14/01/2016
Responsável: Edilaine
Descrição..: valores nao sao atualizados na benefbfciario (BS, FAB, Base Deficit)
-----------------------------------------------------------------------------------------}

{SOL 157203/4761 - KTN 1268806 - JRM6 : Passa a solicar e criticar a Data de
liberação do benefício }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  Db, DBTables, Wwquery,
  uBeneficio, Mask, MskEdDlg, UAdmPrev;       // edilaine - SOL 253577-18064 / PPM 1240079

type
  TTipoValidacao = (tvTudo, tvBSFab, tvBaseDeficit);   // edilaine - SOL 253577-18064 / PPM 1240079
  TfrmTipoLiberacao = class(TfrmOkCancelar)
    grpTipo: TRadioGroup;
    {SOL 157203/4761 - KTN 1268806 - JRM6}
    CMDtInicioLiberacao: TCMDateTimePicker;
    {SOL 157203/4761 - KTN 1268806 - JRM6}
    Label1: TLabel;
    grpDeficit: TGroupBox;
    lblValorBS: TLabel;
    lblValorFAB: TLabel;
    lblDeficit: TLabel;
    qryBenef: TwwQuery;
    reValorFAB: TcmMaskEditDlg;
    reValorBS: TcmMaskEditDlg;
    reValorDeficit: TcmMaskEditDlg;
    qryAux: TwwQuery;
    lblVlrTotal: TLabel;
    reVlrTotal: TcmMaskEditDlg;
    reVlrInss: TcmMaskEditDlg;
    lblInss: TLabel;
    pnlNaoSaldado: TPanel;
    lblValorAtual: TLabel;
    lblValorTotal: TLabel;
    Label8: TLabel;
    reValorAtual: TcmMaskEditDlg;
    reValorTotal: TcmMaskEditDlg;
    reValorSRB: TcmMaskEditDlg;
    dtPagaBenefLimite: TCMDateTimePicker;
    qryDadosRegra: TwwQuery;
    lblanomesreemindiv: TLabel;
    grpGbReemindiv: TGroupBox;
    lbl1: TLabel;
    medtMesAno: TMaskEdit;
    chkmesreemindiv: TCheckBox;
    procedure grpTipoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LerDataInicioLimite(DateIni : String);
    procedure AjustaTela(sNumeroProcesso : string; pbTemFuncef, pbTemInss : boolean);      // edilaine - SOL 253577-18064 / PPM 1240079
    procedure reValorBSKeyPress(Sender: TObject; var Key: Char);
    procedure reValorFABKeyPress(Sender: TObject; var Key: Char);
    procedure reValorDeficitKeyPress(Sender: TObject; var Key: Char);
    procedure reValorBSExit(Sender: TObject);
    procedure reValorFABExit(Sender: TObject);
    procedure reValorDeficitBtnClick(Sender: TObject);
    procedure CMDtInicioLiberacaoExit(Sender: TObject);
    procedure reVlrInssKeyPress(Sender: TObject; var Key: Char);
    procedure reVlrTotalKeyPress(Sender: TObject; var Key: Char);
    procedure reValorSRBKeyPress(Sender: TObject; var Key: Char);
    procedure reValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure reValorAtualKeyPress(Sender: TObject; var Key: Char);
    procedure chkmesreemindivClick(Sender: TObject);
  private
    { Private declarations }
    bFlgApresentaDeficit,
    bFlgApresentaBSFAB    : boolean;                       // edilaine - SOL 253577-18064 / PPM 1240079
    iIdCalculo            : longInt;                       // edilaine - SOL 253577-18064 / PPM 1240079
    dPercent, dValorTotal : double;                        // edilaine - SOL 253577-18064 / PPM 1240079

    bTemFuncef, bTemInss, bDadosOk, bNaoSaldado : boolean;             // edilaine - SOL 253577-18143 / PPM 1318908

    // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
    function  ValidaDadosCalculoDeficit(TipoValida : TTipoValidacao) : boolean;
    function  CalculaValorDeficit : string;
    function  GravaValoresDeficit : boolean;
    procedure BuscaPercentual;
    procedure AbreConsultaDadosRegra;
    // edilaine - SOL 253577-18064 / PPM 1240079 - fim

  public
    { Public declarations }
    {SOL 157203/4761 - KTN 1268806 - JRM6}

    DataInicio,
    DataIniLimite,
    {SOL 157203/4761 - KTN 1268806 - JRM6}
    DataLimite: String;
  end;

var
  frmTipoLiberacao: TfrmTipoLiberacao;

implementation

uses UMensErro, fAguarde;

{$R *.DFM}

procedure TfrmTipoLiberacao.grpTipoClick(Sender: TObject);
begin
  inherited;
  If grpTipo.ItemIndex = 1 then
    MsgDlg('A liberação PARCIAL manterá a situação do benefício como RETIDO.','Aviso',mtInformation,[mbOk],0);

  dtPagaBenefLimite.Enabled := grpTipo.ItemIndex = 1;
end;

procedure TfrmTipoLiberacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult <> mrCancel then
  begin
    if not bDadosOk then
        CanClose := False;
        
    { // edilaine - SOL 253577-18143 / PPM 1318908
    if (CMDtInicioLiberacao.text<>'') and (StrToDate(CMDtInicioLiberacao.text) < StrToDate(DataIniLimite))then
    begin
        MsgDlg('A data de início de liberação deve ser igual ou maior a data de início de pagamento.','Erro',mtError,[mbOk, mbHelp],0);

        CanClose := False;
        CMDtInicioLiberacao.SetFocus;
    end

    //SOL 157203/4761 - KTN 1268806 - JRM6
    Else
    begin

      if (trim(CMDtInicioLiberacao.Text) = '')  and (CMDtInicioLiberacao.Tag = 1) Then
      begin
        CMDtInicioLiberacao.tag := 0;
        CanClose := False;
        CMDtInicioLiberacao.SetFocus;
      end;
    end;
    //SOL 157203/4761 - KTN 1268806 - JRM6


    // edilaine - SOL 253577-18064 / PPM 1240079 - incio
    if (not ValidaDadosCalculoDeficit(tvTudo) ) then
    begin
      CanClose := False;
    end;
    // edilaine - SOL 253577-18064 / PPM 1240079 - fim
    } // edilaine - SOL 253577-18143 / PPM 1318908

  end;
end;

procedure TfrmTipoLiberacao.bbtnConfirmarClick(Sender: TObject);
begin
  bDadosOk := true;        // edilaine - SOL 253577-18143 / PPM 1318908

  {SOL 157203/4761 - KTN 1268806 - JRM6}
  DataInicio := CMDtInicioLiberacao.Text;
  CMDtInicioLiberacao.Tag := 1; // Sinaliza o clique no botão de confirmação
  if DataInicio = '' then
  begin
    MsgDlg('Data de Início de Liberação é de preenchimento obrigatório', 'Atenção', mtInformation, [mbOK], 0);
    CMDtInicioLiberacao.SetFocus;
    bDadosOk := false;          // edilaine - SOL 253577-18143 / PPM 1318908
    Exit;
  end;
  // Inicio SIG 125597 Ferrari
  if chkmesreemindiv.Checked then
    if Length(Trim(medtMesAno.Text)) < 7 then
      begin
        MsgDlg('Ano e Mês é de preenchimento obrigatório e correto (9999/99)', 'Atenção', mtInformation, [mbOK], 0);
        chkmesreemindiv.SetFocus;
        bDadosOk := false;
        Exit;
      end;

  // Fim
  // edilaine - SOL 253577-18064 / PPM 1240079 - incio
  if not bNaoSaldado then begin                             // edilaine - SOL 253577-18143 / PPM 1318908
     if (not ValidaDadosCalculoDeficit(tvTudo) ) then
     begin
        bDadosOk := false;                                  // edilaine - SOL 253577-18143 / PPM 1318908
       Exit;
     end;
  end
  else     // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
  begin
    if reValorSRB.text = '' then
    begin
      MsgDlg('É necessário informar o Valor SRB.', 'Informação', mtInformation, [mbOK], 0);
      reValorSRB.SetFocus;
      bDadosOk := false;
      Exit;
    end;

    if reValorTotal.text = '' then
    begin
      MsgDlg('É necessário informar o Valor Total do Benefício.', 'Informação', mtInformation, [mbOK], 0);
      reValorTotal.SetFocus;
      bDadosOk := false;
      Exit;
    end;

    if reValorAtual.text = '' then
    begin
      MsgDlg('É necessário informar o Valor Total do Benefício.', 'Informação', mtInformation, [mbOK], 0);
      reValorAtual.SetFocus;
      bDadosOk := false;
      Exit;
    end;

  end;     // edilaine - SOL 253577-18143 / PPM 1318908 - fim
  // edilaine - SOL 253577-18064 / PPM 1240079 - fim


  {SOL 157203/4761 - KTN 1268806 - JRM6}
  if grpTipo.ItemIndex = 1 then
    DataLimite := dtPagaBenefLimite.Text
  Else
    DataLimite := '';

  {SOL 157203/4761 - KTN 1268806 - JRM6}


  // edilaine - SOL 253577-18064 / PPM 1240079 - inicio
  if not GravaValoresDeficit() then
  begin
     bDadosOk := false;          // edilaine - SOL 253577-18143 / PPM 1318908
     exit;
  end;
  // edilaine - SOL 253577-18064 / PPM 1240079 - fim

  ModalResult := mrOk;
  {SOL 157203/4761 - KTN 1268806 - JRM6}

  inherited;
end;

procedure TfrmTipoLiberacao.bbtnCancelarClick(Sender: TObject);
begin
  {SOL 157203/4761 - KTN 1268806 - JRM6}
  CMDtInicioLiberacao.Tag := 0; // Sinaliza o click no botão de cancelamento;
  inherited;
  ModalResult := mrCancel;
  Close;
  {SOL 157203/4761 - KTN 1268806 - JRM6}
end;

procedure TfrmTipoLiberacao.FormCreate(Sender: TObject);
begin
  inherited;
  CMDtInicioLiberacao.Date := Date;

end;

procedure TfrmTipoLiberacao.LerDataInicioLimite(DateIni: String);
begin
   DataIniLimite := DateIni;
   CMDtInicioLiberacao.Date := StrToDate(DataIniLimite);
end;


// edilaine - SOL 253577-18064 / PPM 1240079 - inicio
procedure TfrmTipoLiberacao.AjustaTela(sNumeroProcesso: string; pbTemFuncef, pbTemInss : boolean);
begin
  grpTipo.visible := false;

  reValorFAB.text      := '';
  reValorBS.text       := '';
  reValorDeficit.text  := '';
  bFlgApresentaBSFAB   := false;
  bFlgApresentaDeficit := false;


  {busca dados do beneficio que esta parametrizado para Deficit}
  qryBenef.close;
  qryBenef.SQL.clear;
  qryBenef.SQL.Add('SELECT BF.*, BP.FLGAPRESENTABSFAB, BP.FLGAPRESENTADEFICIT, PP.idsitplanoprev, ');
  qryBenef.SQL.Add('       BP.IDREGRACALCBASEDEFICIT, BP.IDREGRACALCULO, BP.IDREGRAPAGAMENTO,     ');
  qryBenef.SQL.Add('       BP.FLGACTVLRSRB, BP.IDREGRASRB, BP.FLGACTVLRTOTBEN, BP.IdRgValorTotal,  ');   // edilaine - SOL 253577-18143 / PPM 1318908
  qryBenef.SQL.Add('       BP.FLGACTVLRATUAL, BP.IdRegraCalculo, B.NUMORDEMEVENTO ');                    // edilaine - SOL 253577-18143 / PPM 1318908
  qryBenef.SQL.Add('  FROM BENEFBFCIARIO BF           ');
  qryBenef.SQL.Add('  JOIN BENEFICIO B ON B.IDBENEFICIO = BF.IDBENEFICIO ');                             // edilaine - SOL 253577-18143 / PPM 1318908
  qryBenef.SQL.Add('  JOIN BENEFPLANPREV BP ON BP.IDPLANOPREV = BF.IDPLANOPREV ');
  qryBenef.SQL.Add('                       AND BP.IDBENEFICIO = BF.IDBENEFICIO ');
  qryBenef.SQL.Add('  LEFT JOIN PARTPREVPLAN PP ON (PP.IDPLANOPREV = BF.IDPLANOORIGEM) ');
  qryBenef.SQL.Add('                           AND (PP.IDPESSOA =  BF.IDTITULAR) ');
  qryBenef.SQL.Add(' WHERE BF.NUMEROPROCESSO IN ('+sNumeroProcesso+')'          );
  //qryBenef.SQL.Add('   AND (BP.FLGAPRESENTABSFAB = 1 OR BP.FLGAPRESENTADEFICIT = 1) ');  // edilaine - SOL 253577-18143 / PPM 1318908
  qryBenef.SQL.Add(' ORDER BY BF.FONTEPAGADORA  ');  // edilaine - SOL 253577-18143 / PPM 1318908
  qryBenef.Open;

  // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
  bNaoSaldado := (qryBenef.FieldByName('IDPLANOPREV').AsInteger = 2) and
                 (qryBenef.FieldByName('IDPLANPREVCONTAB').AsInteger = 2) and
                 (qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1);
  // edilaine - SOL 253577-18143 / PPM 1318908 - fim


  while not qryBenef.Eof do    // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
  begin
    if qryBenef.FieldbyName('FONTEPAGADORA').AsInteger = 1 then
    begin
      bFlgApresentaBSFAB   := qryBenef.FieldbyName('FLGAPRESENTABSFAB').AsInteger = 1;
      bFlgApresentaDeficit := qryBenef.FieldbyName('FLGAPRESENTADEFICIT').AsInteger = 1;

      if not bNaoSaldado then
      begin
        reValorBS.text      := qryBenef.FieldByName('VLRBSTOTAL').AsString;
        reValorFAB.text     := qryBenef.FieldByName('VLRFABTOTAL').AsString;
        reValorDeficit.text := qryBenef.FieldByName('VLRBASEDEFICIT').AsString;
        reVlrTotal.text     := qryBenef.FieldByName('VALORTOTAL').AsString;
      end
      else
      begin
        reValorSRB.text   := qryBenef.FieldByName('VALORSRB').AsString;
        reValorTotal.text := qryBenef.FieldByName('VALORTOTAL').AsString;
        reValorAtual.text := qryBenef.FieldByName('VALORATUAL').AsString;
      end;
    end
    else
      reVlrInss.text     := qryBenef.FieldByName('VALORTOTAL').AsString;

    qryBenef.next;
  end;

  {busca data da retencao para sugerir}
  qryAux.close;
  qryAux.SQL.clear;
  qryAux.SQL.Add('SELECT TO_CHAR(M.DATAMOV, ''MM/YYYY'') AS MESANO ');
  qryAux.SQL.Add('  FROM MOVBENEF M');
  qryAux.SQL.Add(' WHERE M.NUMEROPROCESSO IN ('+sNumeroProcesso+')' );
  qryAux.SQL.Add('   AND M.TIPOMOV = 3 ');
  qryAux.Open;
  if not qryAux.eof then
     CMDtInicioLiberacao.text := '01/'+qryAux.Fields[0].AsString;
  // edilaine - SOL 253577-18143 / PPM 1318908 - fim


  {ajusta tela}
  // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
  {if (not bFlgApresentaBSFAB) and (not bFlgApresentaDeficit) then
  begin
    grpDeficit.visible := false;
    grpTipo.visible    := true;
    dtPagaBenefLimite.visible := true;
    self.width  := 345;
  end
  else } // edilaine - SOL 253577-18143 / PPM 1318908 - fim
  begin
    dtPagaBenefLimite.visible := false;
    grpTipo.visible    := false;
    // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
    {IdPlanPrev = 2 e IdPlanPrevContab = 2 identifica o Não Saldado}
    if bNaoSaldado then
    begin
       pnlNaoSaldado.visible    := true;
       pnlNaoSaldado.BevelInner := bvNone;
       pnlNaoSaldado.BevelOuter := bvNone;
       pnlNaoSaldado.top  := 20;
       pnlNaoSaldado.left := 5;

       lblValorAtual.visible := qryBenef.FieldByName('IDTITULAR').AsString <> qryBenef.FieldByName('IDPESSOA').AsString;
       reValorAtual.visible  := qryBenef.FieldByName('IDTITULAR').AsString <> qryBenef.FieldByName('IDPESSOA').AsString;

    end
    else
    begin
      pnlNaoSaldado.visible := false;
      self.width  := 570;
    end;   // edilaine - SOL 253577-18143 / PPM 1318908 - fim

    lblValorBS.visible  := bFlgApresentaBSFAB;
    lblValorFAB.visible := bFlgApresentaBSFAB;
    lblDeficit.visible  := bFlgApresentaDeficit;

    reValorBS.visible       := bFlgApresentaBSFAB;
    reValorFAB.visible      := bFlgApresentaBSFAB;
    reValorDeficit.visible  := bFlgApresentaDeficit;

    if (not bFlgApresentaBSFAB) and (bFlgApresentaDeficit) then
    begin
      lblVlrTotal.left := lblValorBS.left;
      reVlrTotal.left  := reValorBS.left;
      reVlrTotal.ReadOnly := false;

      lblDeficit.left     := lblValorFAB.left;
      reValorDeficit.left := reValorFAB.left;

      self.width :=  360;
    end
    else if (not bFlgApresentaBSFAB) and (not bFlgApresentaDeficit) and (pbTemFuncef) and (not bNaoSaldado) then    // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
    begin
      lblVlrTotal.left := lblValorBS.left;
      reVlrTotal.left  := reValorBS.left;
      reVlrTotal.ReadOnly := false;

      grpDeficit.Height := 75;
      self.Height       := 200;
      self.width        := 320;
    end;

    if (pbTemInss) and (not bFlgApresentaBSFAB) and (not bFlgApresentaDeficit) and (pbTemFuncef) and (not bNaoSaldado) then
    begin
      lblInss.Top    := lblValorFAB.top;
      lblInss.left   := lblValorFAB.left;
      reVlrInss.Top  := reValorFAB.Top;
      reVlrInss.Left := reValorFAB.left;

      grpDeficit.Height := 75;
    //  self.Height       := 200;
      self.Height       := 220;    // SIG 125597
    //  self.width        := 320;
      self.width        := 550;    // SIG 125597
    end
    else if (pbTemInss) and (not pbTemFuncef) then
    begin
      lblInss.Top    := lblValorBS.top;
      lblInss.left   := lblValorBS.left;
      reVlrInss.Top  := reValorBS.Top;
      reVlrInss.Left := reValorBS.left;

      grpDeficit.Height := 75;
    //  self.Height       := 200;
      self.Height       := 220;    // SIG 125597
    //  self.width        := 320;
      self.width        := 550;    // SIG 125597
    end;

    if ((bFlgApresentaBSFAB) and (not bFlgApresentaDeficit)) or (bNaoSaldado) then
    begin
      if (not pbTemInss) then
      begin
        grpDeficit.Height := 75;
        self.Height       := 200;
      end;
      self.width  := 430;
    end;

    lblVlrTotal.visible := pbTemFuncef;
    reVlrTotal.visible  := pbTemFuncef;
    lblInss.visible     := pbTemInss;
    reVlrInss.visible   := pbTemInss;
  // inicio SIG 125597
    chkmesreemindiv.Visible := pbTemInss;
    lblanomesreemindiv.Visible := pbTemInss;
    grpGbReemindiv.Visible := pbTemInss;
  // Fim
    bTemFuncef := pbTemFuncef;
    bTemInss   := pbTemInss;
    // edilaine - SOL 253577-18143 / PPM 1318908 - fim
  end;

end;

function TfrmTipoLiberacao.ValidaDadosCalculoDeficit(TipoValida : TTipoValidacao) : boolean;
begin
  Result := true;

  if (TipoValida = tvBSFab) or (TipoValida = tvTudo) then
  begin
    if (bFlgApresentaBSFAB) then
    begin
      if (reValorBS.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do BS. ','Informação',mtInformation,[mbOk],0);
        reValorBS.SetFocus;
        Result := false;
      end;

      if (reValorFAB.Text = '') then
      begin
        MsgDlg('É necessário informar o valor do FAB.', 'Informação', mtInformation, [mbOK], 0);
        reValorFAB.SetFocus;
        Result := false;
      end;
    end;
  end;

  if (TipoValida = tvBaseDeficit) or (TipoValida = tvTudo) then
  begin
    if (bFlgApresentaDeficit) and (reValorDeficit.text = '') then
    begin
      MsgDlg('É necessário calcular o valor da base de cálculo do déficit.', 'Informação', mtInformation, [mbOK], 0);
      if reValorDeficit.Enabled then
         reValorDeficit.SetFocus;
      Result := false;
    end;
  end;

  if (TipoValida = tvTudo) and (bTemFuncef) and (reVlrTotal.text = '') then
  begin
    MsgDlg('É necessário preencher o Valor Total.', 'Informação', mtInformation, [mbOK], 0);
    if reVlrTotal.Enabled then
       reVlrTotal.SetFocus;
    Result := false;
  end;

  if (TipoValida = tvTudo) and (bTemInss) and (reVlrInss.text = '') then
  begin
    MsgDlg('É necessário preencher o Valor Total INSS.', 'Informação', mtInformation, [mbOK], 0);
    if reVlrInss.Enabled then
       reVlrInss.SetFocus;
    Result := false;
  end;

end;

procedure TfrmTipoLiberacao.reValorBSKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmTipoLiberacao.reValorFABKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;

procedure TfrmTipoLiberacao.reValorDeficitKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', ',', #8]) then
     key := #0;
end;


procedure TfrmTipoLiberacao.reValorBSExit(Sender: TObject);
begin
  {calcula o valor total}
  dValorTotal := 0;
  if reValorBS.text <> '' then
     dValorTotal := StrToFloat(reValorBS.text);

  if reValorFAB.text <> '' then
     dValorTotal := dValorTotal + StrToFloat(reValorFAB.text);

  reVlrTotal.text := FloatToStr(dValorTotal);

  {limpa valor do Deficit pra calcular pela Regra}
  if (bFlgApresentaDeficit) then
     reValorDeficit.text := CalculaValorDeficit();

end;


procedure TfrmTipoLiberacao.reValorFABExit(Sender: TObject);
begin
  {calcula o valor total}
  dValorTotal := 0;
  if reValorBS.text <> '' then
     dValorTotal := StrToFloat(reValorBS.text);

  if reValorFAB.text <> '' then
     dValorTotal := dValorTotal + StrToFloat(reValorFAB.text);

  reVlrTotal.text := FloatToStr(dValorTotal);


  {limpa valor do Deficit pra calcular pela Regra}
  if (bFlgApresentaDeficit) then
     reValorDeficit.text := CalculaValorDeficit();

end;


procedure TfrmTipoLiberacao.reValorDeficitBtnClick(Sender: TObject);
begin
  inherited;

  if (bFlgApresentaDeficit) and ( ValidaDadosCalculoDeficit(tvBSFab) )then
     reValorDeficit.text := CalculaValorDeficit();

end;


function TfrmTipoLiberacao.CalculaValorDeficit: string;
var
  rVlrBaseDef    : double;
  bErro          : boolean;
  sMsgErro       : string;
  iIdCalculoAnt  : longint;
  sSQLBenefAssoc : string;
  dValorAtual    : double;
begin
  Result := '';

  if qryBenef.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger <= 0 then
     Exit;

  if reValorBS.text = '' then
  begin
    reValorDeficit.text := '';
    exit;
  end;

  // Executar regra de calculo do beneficio
  try

     if dPercent = 0 then      // edilaine - SIG 19963
        BuscaPercentual;

     sSQLBenefAssoc := MontaSQLBenefAssoc(qryBenef.FieldByName('IDTITULAR').AsInteger);

     rVlrBaseDef    := 0;
     iIdCalculoAnt  := iIdCalculo;
     dValorAtual    := StrToFloat(reVlrTotal.text) * (dPercent / 100);

     rVlrBaseDef := ExecutaRegraCalculoDeficit(qryAux,
                                               qryBenef.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger,
                                               qryBenef.FieldByName('IDPLANOPREV').AsInteger,    // iIdPlanoPrev,
                                               qryBenef.FieldByName('IDPESSJUR').AsInteger,      // iIdPessJur,
                                               qryBenef.FieldByName('IDPESSOA').AsInteger,       // iIdPessoa,
                                               qryBenef.FieldByName('IDTITULAR').AsInteger,      // iIdTitular,
                                               qryBenef.FieldByName('IDBENEFICIO').AsInteger,    // IdBeneficio
                                               bErro,
                                               sMsgErro,
                                               iIdCalculo,
                                               qryBenef.FieldByName('VALORBASE1').AsFloat,       // rOpcao1,
                                               qryBenef.FieldByName('VALORBASE3').AsFloat,       // rOpcao3,
                                               sSQLBenefAssoc,
                                               StrToFloat(reValorBS.text),
                                               qryBenef.FieldByName('VALORTOTAL').AsFloat,
                                               dValorAtual,
                                               qryBenef.FieldByName('VLRINFINSS').AsFloat,
                                               FloatToStr(dPercent),
                                               qryBenef.FieldByName('IDSITPLANOPREV').AsInteger,
                                               FormatDateTime('DD/MM/YYYY', CMDtInicioLiberacao.date),
                                               qryBenef.FieldByName('DATAINICIOFUND').AsString,
                                               qryBenef.FieldByName('IDPLANPREVCONTAB').AsInteger
                                              );

  except
  end;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  Result := FloatToStr(rVlrBaseDef);

end;


function TfrmTipoLiberacao.GravaValoresDeficit: boolean;
var
   dValorAtual  : double;
   sVlrBSAtual  : string;
   sVlrFABAtual : string;
   sVlrDeficit  : string;          // edilaine - SOL 253577-18143 / PPM 1318908
   sVlrTotal    : string;          // edilaine - SOL 253577-18143 / PPM 1318908
begin

  result := true;

  if dPercent = 0 then      // edilaine - SIG 19963
    BuscaPercentual;

  //if (bFlgApresentaBSFAB) or (bFlgApresentaDeficit) then     // edilaine - SOL 253577-18143 / PPM 1318908 - inicio
  qryBenef.first;
  while not qryBenef.eof do
  begin
    if ((qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1) and (not bTemFuncef)) or
       ((qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 2) and (not bTemInss)) then
    begin
       next;
       Continue;
    end;

    if qryBenef.FieldByName('FONTEPAGADORA').AsInteger = 1 then
    begin
      sVlrBSAtual  := reValorBS.text;
      sVlrFABAtual := reValorFAB.text;

      if (not bNaoSaldado) then        
      begin
        if (qryBenef.FieldByName('IDPESSOA').AsInteger <> qryBenef.FieldByName('IDTITULAR').AsInteger) then
        begin
          if sVlrBSAtual <> '' then
          begin
            dValorAtual := StrToFloat(reValorBS.text) * (dPercent / 100);
            sVlrBSAtual := FloatToStr( dValorAtual );
          end;

          if sVlrFABAtual <> '' then
          begin
            dValorAtual := StrToFloat(reValorFAB.text) * (dPercent / 100);
            sVlrFABAtual := FloatToStr( dValorAtual );
          end;
        end;

        dValorAtual  := StrToFloat(reVlrTotal.text) * (dPercent / 100);
        sVlrDeficit  := reValorDeficit.text;
        sVlrTotal    := reVlrTotal.text;
      end
      else
      begin
        sVlrBSAtual  := '';
        sVlrFABAtual := '';
        sVlrDeficit  := '';
        if qryBenef.FieldByName('IDTITULAR').AsString = qryBenef.FieldByName('IDPESSOA').AsString then
           reValorAtual.text := reValorTotal.text;
        dValorAtual  := StrToFloat(reValorAtual.text);
        sVlrTotal    := reValorTotal.text;
      end;
    end
    else
    begin
      sVlrBSAtual  := '';
      sVlrFABAtual := '';
      sVlrDeficit  := '';
      sVlrTotal    := reVlrInss.text;

      dValorAtual  := StrToFloat(reVlrInss.text) * (dPercent / 100);
    end;
    // edilaine - SOL 253577-18143 / PPM 1318908 - fim

    qryAux.close;
    qryAux.SQL.clear;
    qryAux.Sql.Add(' UPDATE BENEFBFCIARIO SET ');
                    //'        VALORTOTAL  = ' + '''' + reVlrTotal.text + ''' ' +          // edilaine - SOL 253577-18143 / PPM 1318908
    qryAux.Sql.Add('        VALORTOTAL  = ' + '''' + sVlrTotal + ''' ');
    qryAux.Sql.Add('       ,VALORATUAL  = ' + '''' + FloatToStr(dValorAtual) + ''' ');
    qryAux.Sql.Add('       ,VLRBSTOTAL  = ' + '''' + reValorBS.text + '''  ');
    qryAux.Sql.Add('       ,VLRBSATUAL  = ' + '''' + sVlrBSAtual + '''     ');
    qryAux.Sql.Add('       ,VLRFABTOTAL = ' + '''' + reValorFAB.text + ''' ');
    qryAux.Sql.Add('       ,VLRFABATUAL = ' + '''' + sVlrFABAtual + '''    ');
                    //'       ,VLRBASEDEFICIT  = ' + '''' + reValorDeficit.text + ''' ' +   // edilaine - SOL 253577-18143 / PPM 1318908
    qryAux.Sql.Add('       ,VLRBASEDEFICIT  = ' + '''' + svlrDeficit + ''' ');
    if bNaoSaldado then
       qryAux.Sql.Add('       ,VALORSRB  = ' + '''' + reValorSRB.text + ''' ');
    qryAux.Sql.Add('  WHERE SEQPROPOSTA    = ' + qryBenef.FieldByName('SEQPROPOSTA').AsString  );
    qryAux.Sql.Add('    AND IDPLANOPREV    = ' + qryBenef.FieldByName('IDPLANOPREV').AsString  );   // iIdPlanoPrev,
    qryAux.Sql.Add('    AND IDPESSJUR      = ' + qryBenef.FieldByName('IDPESSJUR').AsString    );   // iIdPessJur,
    qryAux.Sql.Add('    AND IDPESSOA       = ' + qryBenef.FieldByName('IDPESSOA').AsString     );   // iIdPessoa,
    qryAux.Sql.Add('    AND IDTITULAR      = ' + qryBenef.FieldByName('IDTITULAR').AsString    );   // iIdTitular,
    qryAux.Sql.Add('    AND IDBENEFICIO    = ' + qryBenef.FieldByName('IDBENEFICIO').AsString  );   // IdBeneficio
    qryAux.Sql.Add('    AND NUMEROPROCESSO = ' + qryBenef.FieldByName('NUMEROPROCESSO').AsString); // NumeroProcesso

    try
      qryAux.ExecSQL;
    except
      MsgDlg('Ocorreu um erro ao atualizar os valores do benefício.', 'Informação', mtInformation, [mbOK], 0);
      result := false;
    end;

    qryBenef.next;           // edilaine - SOL 253577-18143 / PPM 1318908 
  end;

end;


procedure TfrmTipoLiberacao.BuscaPercentual;
VAR
  sPercentual : string;
begin
  // pega taxa
  dPercent := 0;

  if qryBenef.FieldByName('IDPESSOA').AsInteger <> qryBenef.FieldByName('IDTITULAR').AsInteger then
  begin
    {ESTA REGISTRADA PARA 17664 - QUEM HOMOLOGAR PRIMEIRO LEVA ELA NA LISTA DE PRODUTO}
    if BuscaPercentualGrupoFamiliar(FormatDateTime('YYYY/MM', CMDtInicioLiberacao.date),
                                    qryBenef.FieldByName('NUMEROPROCESSO').AsString,
                                    qryBenef.FieldByName('IDPLANOPREV').AsInteger,
                                    qryBenef.FieldByName('IDBENEFICIO').AsInteger,
                                    qryBenef.FieldByName('IDPESSJUR').AsInteger,
                                    qryBenef.FieldByName('IDTITULAR').AsInteger,
                                    qryBenef.FieldByName('IDPESSOA').AsInteger,
                                    qryBenef.FieldByName('IDPLANOORIGEM').AsInteger,
                                    qryBenef.FieldByName('SEQPROPOSTA').AsInteger,
                                    sPercentual) then
    begin
      if sPercentual <> '' then
         dPercent := StrToFloat(sPercentual);
    end;
  end
  else
    dPercent := 100;

end;


procedure TfrmTipoLiberacao.CMDtInicioLiberacaoExit(Sender: TObject);
begin
  inherited;
  BuscaPercentual;
  AbreConsultaDadosRegra();       // edilaine - SOL 253577-18143 / PPM 1318908
end;
// edilaine - SOL 253577-18064 / PPM 1240079 - fim


// edilaine - SOL 253577-18143 / PPM 1318908 - inicio
procedure TfrmTipoLiberacao.reVlrInssKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmTipoLiberacao.reVlrTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;


procedure TfrmTipoLiberacao.AbreConsultaDadosRegra;
begin
  qryBenef.Locate('FONTEPAGADORA', '1', []);
  if qryBenef.eof then exit;

  qryDadosRegra.Close;
  qryDadosRegra.ParambyName('IDPESSOA').AsString       := qryBenef.FieldByName('IDPESSOA').AsString;
  qryDadosRegra.ParambyName('IDTITULAR').AsString      := qryBenef.FieldByName('IDTITULAR').AsString;
  qryDadosRegra.ParambyName('IDBENEFICIO').AsString    := qryBenef.FieldByName('IDBENEFICIO').AsString;
  qryDadosRegra.ParambyName('SEQPROPOSTA').AsString    := qryBenef.FieldByName('SEQPROPOSTA').AsString;
  qryDadosRegra.ParambyName('IDPLANOPREV').AsString    := qryBenef.FieldByName('IDPLANOPREV').AsString;
  qryDadosRegra.ParambyName('IDPESSJUR').AsString      := qryBenef.FieldByName('IDPESSJUR').AsString;
  qryDadosRegra.ParambyName('NUMEROPROCESSO').AsString := qryBenef.FieldByName('NUMEROPROCESSO').AsString;
  qryDadosRegra.ParambyName('MESREFERENCIA').AsString  := copy(CMDtInicioLiberacao.text,7,4)+copy(CMDtInicioLiberacao.text,3,3);
  qryDadosRegra.open;
end;

procedure TfrmTipoLiberacao.reValorSRBKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmTipoLiberacao.reValorTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;

procedure TfrmTipoLiberacao.reValorAtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Not (Key in (['0'..'9',',',#8])) Then Key := #0;
end;
// edilaine - SOL 253577-18143 / PPM 1318908 - fim


procedure TfrmTipoLiberacao.chkmesreemindivClick(Sender: TObject);
begin
  inherited;
  medtMesAno.Enabled := (chkmesreemindiv.Checked);
end;

end.
