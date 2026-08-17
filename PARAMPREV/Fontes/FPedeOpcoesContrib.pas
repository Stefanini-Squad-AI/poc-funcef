// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : FormShow
// Autor(a)    : Gleyber
// Pendência   : 17448
// Data        : 13/12/2004
// Descricao   : Inicialização das variáveis de regra que estavam trazendo lixo
//               e gravando números de regras inexistentes.
//------------------------------------------------------------------------------
unit FPedeOpcoesContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Spin, StdCtrls, wwdblook, MAHlpBtn, Buttons, TB97, ExtCtrls,
  Db, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmPedeOpcoesContrib = class(TfrmOkCancelar)
    grpRegraValida: TGroupBox;
    lblOp1: TLabel;
    lblOp2: TLabel;
    lblOp3: TLabel;
    grpOpContrib: TGroupBox;
    pnlTitulo: TPanel;
    lblContribuicao: TLabel;
    lblPlano: TLabel;
    qryRegra: TwwQuery;
    edPlano: TEdit;
    edContribuicao: TEdit;
    dblkpcmbRegraValidaOp1: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp2: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp3: TwwDBLookupCombo;
    pnlNOpcoes: TPanel;
    lblnumopcoes: TLabel;
    Label1: TLabel;
    spedNumOpcoes: TSpinEdit;
    spedTempoOpcao: TSpinEdit;
    pnlMesAno: TPanel;
    Label2: TLabel;
    cmbMesRefOpcao: TComboBox;
    spedAnoRefOpcao: TSpinEdit;
    Label3: TLabel;
    grpRegraCalculo: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblkpcmbRegraCalcOp1: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp2: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp3: TwwDBLookupCombo;
    pnlDescricaoOpcao: TPanel;
    Label7: TLabel;
    edNomeValorBase1: TEdit;
    Label8: TLabel;
    edNomeValorBase2: TEdit;
    Label9: TLabel;
    edNomeValorBase3: TEdit;
    ckFlgObrigaOp1: TCheckBox;
    ckFlgObrigaOp2: TCheckBox;
    ckFlgObrigaOp3: TCheckBox;
    ckAlteraOp1: TCheckBox;
    ckAlteraOp2: TCheckBox;
    ckAlteraOp3: TCheckBox;
    plnAssocContribOpcao: TPanel;
    Label11: TLabel;
    Panel1: TPanel;
    lblOpcao: TLabel;
    lblContrib: TLabel;
    Panel2: TPanel;
    Label12: TLabel;
    sbOpcao: TSpeedButton;
    Label13: TLabel;
    dblkpcmbContribuicao: TwwDBLookupCombo;
    rgOpcoes: TRadioGroup;
    edOpcaoSelecionada: TEdit;
    btnCancelAssoc: TBitBtn;
    btnOkAssoc: TBitBtn;
    btnSairAssoc: TBitBtn;
    Panel3: TPanel;
    qryAux: TwwQuery;
    qryContribuicao: TwwQuery;
    sbCop1: TSpeedButton;
    sbCop2: TSpeedButton;
    sbCop3: TSpeedButton;
    Label10: TLabel;
    Label14: TLabel;
    procedure spedNumOpcoesChange(Sender: TObject);
    procedure dblkpcmbRegraValidaOp1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp3CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbRegraCalcOp1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp3CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp1Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp2Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp3Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp1Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp2Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp3Exit(Sender: TObject);
    procedure sbCop1Click(Sender: TObject);
    procedure sbCop2Click(Sender: TObject);
    procedure sbCop3Click(Sender: TObject);
    procedure sbOpcaoClick(Sender: TObject);
    procedure btnOkAssocClick(Sender: TObject);
    procedure btnCancelAssocClick(Sender: TObject);
    procedure HabilitaAssociacao(iNumOpcao:Byte);
    procedure btnSairAssocClick(Sender: TObject);
    procedure plnAssocContribOpcaoExit(Sender: TObject);
    procedure rgOpcoesClick(Sender: TObject);
  private
    { Private declarations }
    sNomeOpcao,
    sNumOpcaoCop,
    sIdContribCop,
    sNumOpcao : string;

  public
    { Public declarations }
    lcRegraOp1, lcRegraOp2, lcRegraOp3 : integer;
    lcsRegraOp1, lcsRegraOp2, lcsRegraOp3 : string;
    iRegraCalcOp1,  iRegraCalcOp2, iRegraCalcOp3  : integer;
    stRegraCalcOp1, stRegraCalcOp2, stRegraCalcOp3: string;
    iFlgObrigaOp1,  iFlgObrigaOp2, iFlgObrigaOp3,
    iFlgAlteraOp1,  iFlgAlteraOp2, iFlgAlteraOp3  : integer;
    sTipoPlano,     sIdContribuicao, sIdPlanoPrev : string;
  end;

var
  frmPedeOpcoesContrib: TfrmPedeOpcoesContrib;

implementation

uses
  UMensErro, UDataBase, UAdmPrev;

{$R *.DFM}

procedure TfrmPedeOpcoesContrib.FormShow(Sender: TObject);
begin
  inherited;
  
  lcRegraOp1    := -1;
  lcRegraOp2    := -1;
  lcRegraOp3    := -1;

  iRegraCalcOp1 := -1;
  iRegraCalcOp2 := -1;
  iRegraCalcOp3 := -1;
  


  qryRegra.Close; qryRegra.Open;

  dblkpcmbRegraValidaOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraValidaOp2.Enabled := (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraValidaOp3.Enabled := (spedNumOpcoes.Value >= 3);

  dblkpcmbRegraCalcOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraCalcOp2.Enabled := (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraCalcOp3.Enabled := (spedNumOpcoes.Value >= 3);

  sbCop1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  sbCop2.Enabled := (spedNumOpcoes.Value >= 2);
  sbCop3.Enabled := (spedNumOpcoes.Value >= 3);

  edNomeValorBase1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  edNomeValorBase2.Enabled := (spedNumOpcoes.Value >= 2);
  edNomeValorBase3.Enabled := (spedNumOpcoes.Value >= 3);

  ckFlgObrigaOp1.Enabled   :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckFlgObrigaOp2.Enabled   := (spedNumOpcoes.Value >= 2);
  ckFlgObrigaOp3.Enabled   := (spedNumOpcoes.Value >= 3);

  ckAlteraOp1.Enabled      :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckAlteraOp2.Enabled      := (spedNumOpcoes.Value >= 2);
  ckAlteraOp3.Enabled      := (spedNumOpcoes.Value >= 3);

  ckFlgObrigaOp1.Checked   := (iFlgObrigaOp1 = 1);
  ckFlgObrigaOp2.Checked   := (iFlgObrigaOp2 = 1);
  ckFlgObrigaOp3.Checked   := (iFlgObrigaOp3 = 1);

  ckAlteraOp1.Checked      := (iFlgAlteraOp1 = 1);
  ckAlteraOp2.Checked      := (iFlgAlteraOp2 = 1);
  ckAlteraOp3.Checked      := (iFlgAlteraOp3 = 1);

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp1,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp1.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp1.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp2,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp2.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp2.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp3,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp3.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp3.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp1,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp1.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp1.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp2,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp2.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp2.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp3,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp3.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp3.Text := '';
end;

procedure TfrmPedeOpcoesContrib.spedNumOpcoesChange(Sender: TObject);
begin
  inherited;
  if Trim(spedNumOpcoes.Text) = '' then Exit;
  dblkpcmbRegraValidaOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraValidaOp2.Enabled :=  (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraValidaOp3.Enabled :=  (spedNumOpcoes.Value >= 3);

  dblkpcmbRegraCalcOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraCalcOp2.Enabled :=  (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraCalcOp3.Enabled :=  (spedNumOpcoes.Value >= 3);

  sbCop1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  sbCop2.Enabled :=  (spedNumOpcoes.Value >= 2);
  sbCop3.Enabled :=  (spedNumOpcoes.Value >= 3);

  edNomeValorBase1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  edNomeValorBase2.Enabled :=  (spedNumOpcoes.Value >= 2);
  edNomeValorBase3.Enabled :=  (spedNumOpcoes.Value >= 3);

  ckFlgObrigaOp1.Enabled   :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckFlgObrigaOp2.Enabled   := (spedNumOpcoes.Value >= 2);
  ckFlgObrigaOp3.Enabled   := (spedNumOpcoes.Value >= 3);

  ckAlteraOp1.Enabled      :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckAlteraOp2.Enabled      := (spedNumOpcoes.Value >= 2);
  ckAlteraOp3.Enabled      := (spedNumOpcoes.Value >= 3);

  if not edNomeValorBase1.Enabled then
     edNomeValorBase1.Text := '';

  if not edNomeValorBase2.Enabled then
     edNomeValorBase2.Text := '';

  if not edNomeValorBase3.Enabled then
     edNomeValorBase3.Text := '';
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraValidaOp1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp1.text <> '' then
     lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp1 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraValidaOp2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp2.text <> '' then
     lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp2 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraValidaOp3CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp3.Text <> '' then
     lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp3 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraCalcOp1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp1.Text <> '' then
     iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp1 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraCalcOp2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp2.Text <> '' then
     iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp2 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraCalcOp3CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp3.Text <> '' then
     iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp3 := -1;
end;

procedure TfrmPedeOpcoesContrib.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  lcRegraOp1  := -1;
  lcRegraOp2  := -1;
  lcRegraOp3  := -1;

  iRegraCalcOp1 := -1;
  iRegraCalcOp2 := -1;
  iRegraCalcOp3 := -1;
  Close;
end;

procedure TfrmPedeOpcoesContrib.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(spedNumOpcoes.Text) = ''
  then begin
     MsgDlg('Número de Opções em branco. Verifique.','Erro',mtError,[mbOK,mbHelp],0);
     Abort;
  end;

  if Trim(spedTempoOpcao.Text) = ''
  then begin
     MsgDlg('Tempo Mínimo para Opções em branco. Verifique.','Erro',mtError,[mbOK,mbHelp],0);
     Abort;
  end;

  inherited;
  if spedNumOpcoes.Value = 0 then
     begin
          edNomeValorBase1.Text := '';
          edNomeValorBase2.Text := '';
          edNomeValorBase3.Text := '';
     end
  else
  if spedNumOpcoes.Value = 1 then
     begin
          edNomeValorBase2.Text := '';
          edNomeValorBase3.Text := '';
     end
  else
  if spedNumOpcoes.Value = 2 then
     edNomeValorBase3.Text := '';

  iFlgObrigaOp1 := 0;
  iFlgObrigaOp2 := 0;
  iFlgObrigaOp3 := 0;

  iFlgAlteraOp1 := 0;
  iFlgAlteraOp2 := 0;
  iFlgAlteraOp3 := 0;

  if ckFlgObrigaOp1.Checked then
     iFlgObrigaOp1 := 1;

  if ckFlgObrigaOp2.Checked then
     iFlgObrigaOp2 := 1;

  if ckFlgObrigaOp3.Checked then
     iFlgObrigaOp3 := 1;

  if ckAlteraOp1.Checked then
     iFlgAlteraOp1 := 1;

  if ckAlteraOp2.Checked then
     iFlgAlteraOp2 := 1;

  if ckAlteraOp3.Checked then
     iFlgAlteraOp3 := 1;
  Close;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraValidaOp1Exit(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp1.text <> '' then
     lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp1 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraValidaOp2Exit(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp2.text <> '' then
     lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp2 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraValidaOp3Exit(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp3.Text <> '' then
     lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp3 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraCalcOp1Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp1.Text <> '' then
     iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp1 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraCalcOp2Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp2.Text <> '' then
     iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp2 := -1;
end;

procedure TfrmPedeOpcoesContrib.dblkpcmbRegraCalcOp3Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp3.Text <> '' then
     iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp3 := -1;
end;


procedure TfrmPedeOpcoesContrib.sbCop1Click(Sender: TObject);
begin
  inherited;
  HabilitaAssociacao(1);
end;

procedure TfrmPedeOpcoesContrib.sbCop2Click(Sender: TObject);
begin
  inherited;
  HabilitaAssociacao(2);

end;

procedure TfrmPedeOpcoesContrib.sbCop3Click(Sender: TObject);
begin
  inherited;
  HabilitaAssociacao(3);

end;

procedure TfrmPedeOpcoesContrib.HabilitaAssociacao(iNumOpcao:Byte);
begin
   TB97oKCancelar.Enabled   := False;
   tb97Fundo.Enabled        := False;
   plnAssocContribOpcao.Top := 19;
   plnAssocContribOpcao.Left:= 80;
   plnAssocContribOpcao.Visible := True;

   if spedNumOpcoes.Value <= 0 then Exit;

   case iNumOpcao of
   1 : begin
         if edNomeValorBase1.Text <> '' then
            sNomeOpcao := edNomeValorBase1.Text
         else
            sNomeOpcao := 'Opção 1 ';
       end;
   2 : begin
         if edNomeValorBase2.Text <> '' then
            sNomeOpcao := edNomeValorBase2.Text
         else
            sNomeOpcao := 'Opção 2 ';
       end;
   3 : begin
         if edNomeValorBase3.Text <> '' then
            sNomeOpcao := edNomeValorBase3.Text
         else
            sNomeOpcao := 'Opção 3 ';
       end;
   end;
  lblContrib.Caption := edContribuicao.Text;
  lblOpcao.Caption   := sNomeOpcao;
  sNumOpcao          := IntToStr(iNumOpcao);

  // Abre query de associcao
  qryContribuicao.Close;
  qryContribuicao.ParamByName('IDPLANOPREV').AsString := sIdPlanoPrev;
  qryContribuicao.Open;

  // Busca opçcao seleciona para copia
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO, NUMOPCAO, IDCONTRIBCOP, NUMOPCAOCOP '+
                 ' FROM   OPCAOCONTRIB    WHERE IDCONTRIBUICAO = '+sIdContribuicao +
                 '                        AND   NUMOPCAO       = '+sNumOpcao );
  qryAux.Open;
  sNumOpcaoCop  := qryAux.FieldByName('NUMOPCAOCOP').AsString;
  sIdContribCop := qryAux.FieldByName('IDCONTRIBCOP').AsString;

  if not qryAux.IsEmpty then
  begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3 '+
                    ' FROM   CONTPREV WHERE IDPLANOPREV    = '+sIdPlanoPrev  +
                    '                 AND   IDCONTRIBUICAO = '+sIdContribCop );
     qryAux.Open;
     if sNumOpcaoCop = '1' then
        edOpcaoSelecionada.Text := qryAux.FieldByName('NOMEVALORBASE1').AsString;
     if sNumOpcaoCop = '2' then
        edOpcaoSelecionada.Text := qryAux.FieldByName('NOMEVALORBASE2').AsString;
     if sNumOpcaoCop = '3' then
        edOpcaoSelecionada.Text := qryAux.FieldByName('NOMEVALORBASE3').AsString;

     qryContribuicao.Locate('IdContribuicao' , sIdContribCop, [loCaseInsensitive,loPartialKey]);
     dblkpcmbContribuicao.Text := qryContribuicao.FieldByName('NOME').AsString;
  end;

  rgOpcoes.Items.Clear;
  rgOpcoes.Items.Add('não preenchida');
  rgOpcoes.Items.Add('não preenchida');
  rgOpcoes.Items.Add('não preenchida');
end;

procedure TfrmPedeOpcoesContrib.sbOpcaoClick(Sender: TObject);
begin
  inherited;
  if dblkpcmbContribuicao.Text = '' then Exit;
  with qryAux do
  begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3 '+
                    ' FROM   CONTPREV WHERE IDPLANOPREV    = '+sIdPlanoPrev +
                    '                 AND   IDCONTRIBUICAO = '+qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString );
     qryAux.Open;

     rgOpcoes.Items.Clear;
     if qryAux.FieldByName('NOMEVALORBASE1').AsString <> ''
     then rgOpcoes.Items.Add(qryAux.FieldByName('NOMEVALORBASE1').AsString)
     else rgOpcoes.Items.Add('não preenchida');

     if qryAux.FieldByName('NOMEVALORBASE2').AsString <> ''
     then rgOpcoes.Items.Add(qryAux.FieldByName('NOMEVALORBASE2').AsString)
     else rgOpcoes.Items.Add('não preenchida');

     if qryAux.FieldByName('NOMEVALORBASE3').AsString <> ''
     then rgOpcoes.Items.Add(qryAux.FieldByName('NOMEVALORBASE3').AsString)
     else rgOpcoes.Items.Add('não preenchida');
     edOpcaoSelecionada.Text := '';
  end;
end;

procedure TfrmPedeOpcoesContrib.btnOkAssocClick(Sender: TObject);
begin
  inherited;
  if dblkpcmbContribuicao.Text = '' then
  begin
     MsgDlg('Contribuição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbContribuicao.SetFocus;
     Exit;
  end;

  if rgOpcoes.ItemIndex = -1 then
  begin
     MsgDlg('Opção não preenchida','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO, NUMOPCAO, IDCONTRIBCOP, NUMOPCAOCOP   '+
                 ' FROM   OPCAOCONTRIB  WHERE IDCONTRIBUICAO = '+sIdContribuicao +
                 '                      AND   NUMOPCAO       = '+sNumOpcao );
  qryAux.Open;
  if qryAux.IsEmpty then
     begin
        qryAux.Sql.Clear;
        qryAux.Sql.Add(' INSERT INTO OPCAOCONTRIB '+
                       ' (IDCONTRIBUICAO, NUMOPCAO, IDCONTRIBCOP, NUMOPCAOCOP ) '+
                       ' VALUES ( '+sIdContribuicao   +', '+
                                    sNumOpcao         +', '+
                                    qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString +', '+
                                    sNumOpcaoCop +' ) ');
     end
  else
     begin
        qryAux.Sql.Clear;
        qryAux.Sql.Add(' UPDATE OPCAOCONTRIB  '+
                       ' SET IDCONTRIBCOP     = '+qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString +
                       '   , NUMOPCAOCOP      = '+sNumOpcaoCop +
                       ' WHERE IDCONTRIBUICAO = '+sIdContribuicao +
                       ' AND   NUMOPCAO       = '+sNumOpcao );
     end;

  try
     qryAux.ExecSql;
  except
  end;
  qryAux.Close;
  plnAssocContribOpcao.Visible := False;
end;

procedure TfrmPedeOpcoesContrib.btnCancelAssocClick(Sender: TObject);
begin
  dblkpcmbContribuicao.Text := '';
  edOpcaoSelecionada.Text   := '';
  rgOpcoes.ItemIndex        := -1;
end;

procedure TfrmPedeOpcoesContrib.btnSairAssocClick(Sender: TObject);
begin
  inherited;
  plnAssocContribOpcao.Visible := False;
end;

procedure TfrmPedeOpcoesContrib.plnAssocContribOpcaoExit(Sender: TObject);
begin
  inherited;
   TB97oKCancelar.Enabled   := True;
   tb97Fundo.Enabled        := True;
end;

procedure TfrmPedeOpcoesContrib.rgOpcoesClick(Sender: TObject);
begin
  inherited;
  sNumOpcaoCop := IntToStr(rgOpcoes.ItemIndex+1);
end;

end.
