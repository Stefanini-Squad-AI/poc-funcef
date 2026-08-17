unit fExecutaFormaCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, uSistema, TB97,
  ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Menus, TREdit, uRegra;

type
  TfrmExecutaFormaCalc = class(TfrmSairAjuda)
    Panel2: TPanel;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TEdit;
    btnConsultar: TBitBtn;
    btnExecutar: TBitBtn;
    btnDebugar: TBitBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    MontaSelect1: TMontaSelect;
    Qry: TwwQuery;
    Bevel1: TBevel;
    edtTipo: TPanel;
    edtNome: TPanel;
    QryAux: TwwQuery;
    Label4: TLabel;
    edtResultRegra: TEdit;
    BtErroRegra: TSpeedButton;
    BtOkRegra: TSpeedButton;
    edMatric: TEdit;
    Label1: TLabel;
    redValorInfo: TRealEdit;
    redValorBase: TRealEdit;
    redParcelas: TRealEdit;
    redOcorrencias: TRealEdit;
    rgRescisao: TRadioGroup;
    rgTemLanc: TRadioGroup;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    QryRegra: TwwQuery;
    QryRegraIDREGRA: TFloatField;
    QryRegraNOMEREGRA: TStringField;
    QryRegraIDTIPOREGRA: TFloatField;
    QryRegraSQLREGRA: TMemoField;
    QryRegraDESCREGRA: TStringField;
    bbtnLimpar: TBitBtn;
    edNome: TEdit;
    Label11: TLabel;
    Bevel2: TBevel;
    MontaSelectFunc: TMontaSelect;
    sbtnProcurar: TSpeedButton;
    qryIn: TwwQuery;
    Regra: TRegra;
    cbxRegra: TCheckBox;
    cbxForma: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    redTotProv: TRealEdit;
    Label15: TLabel;
    redTotDesc: TRealEdit;
    Label16: TLabel;
    Label17: TLabel;
    redMesesRetro: TRealEdit;
    redPercRetro: TRealEdit;
    procedure btnConsultarClick(Sender: TObject);
    function AbreQry : Boolean;
    procedure btnExecutarClick(Sender: TObject);
    procedure btnDebugarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GravarSQLdaRegraClick(Sender: TObject);
    procedure memSqlKeyPress(Sender: TObject; var Key: Char);
    procedure Apagar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure edMatricChange(Sender: TObject);
    procedure ChamaFormaCalculo;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure PreencheRegraForma;
  private
    IdTipoRegra: string;
  end;

var
  frmExecutaFormaCalc: TfrmExecutaFormaCalc;
  Ex: exception;
  RegPessoa, edtNumeroText: string;
  redValorInfoValue, redValorBaseValue, redTotalProventos, redTotalDescontos,
  redPercRetroValue: double;
  iTemLancItemIndex,iParcelasValue,iOcorrenciasValue, iMesesRetroValue: integer;

implementation

uses uMensErro, uBiblioteca, uDataBase, uCalcRub, Clipbrd;

{$R *.DFM}

procedure TfrmExecutaFormaCalc.btnConsultarClick(Sender: TObject);
begin
  inherited;     
  MontaSelect1.Executar;
  edtNumero.Text  := '';
  edtNome.Caption := '';
  edtTipo.Caption := '';

  if MontaSelect1.RetornouValor then begin
    edtNumero.Text  := MontaSelect1.ValoresChave[0];
    edtNome.Caption := ' '+MontaSelect1.ValoresChave[1];
    edtTipo.Caption := ' '+MontaSelect1.ValoresChave[2];
    IdTipoRegra     := MontaSelect1.ValoresChave[4];
    PreencheRegraForma;
  end;
end;

function TfrmExecutaFormaCalc.AbreQry: boolean;
begin
  Result := True;
  with Qry do begin
    Close;
    Sql.Clear;
    Sql.Add('Select F.IdPessoa, P.Nome from Pessoa P, Funcionario F ' +
            'where F.Matricula = ' + QuotedStr(edMatric.Text) +
            'and F.IdPessoa = P.IdPessoa');
    Open;
    RegPessoa   := FieldByName('IdPessoa').AsString;
    edNome.Text := FieldByName('Nome').AsString;
    if IsEmpty then
    begin
        Result := false;
        MsgDlg('Não Existe Empregado com a Matrícula Informada','Erro',mtError,[mbOk],0);
        Exit;
    end;
  end;
end;

procedure TfrmExecutaFormaCalc.btnExecutarClick(Sender: TObject);
begin
  bPassoaPasso := False;
  ChamaFormaCalculo;
end;

procedure TfrmExecutaFormaCalc.btnDebugarClick(Sender: TObject);
begin
  inherited;
  bPassoaPasso := True;
  ChamaFormaCalculo;
end;

procedure TfrmExecutaFormaCalc.FormShow(Sender: TObject);
begin
  inherited;
  Qryregra.Open;
  edtNumero.SetFocus;
end;

procedure TfrmExecutaFormaCalc.edtNumeroExit(Sender: TObject);
begin
  inherited;
// Caso Campo Vazio sai Fora
  If Trim(edtNumero.Text) = '' Then Exit;

// Limpa Campos da Tela
  edtNome.Caption:= '';
  edtTipo.Caption:= '';

// Procura e Preenche a tela com os dados da Regra caso exista.
//  If QryRegra.Locate('IDREGRA',StrToInt(edtNumero.Text),[]) Then Begin

  If FazQuery( QryRegra,'SELECT R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA ' +
                        'FROM   REGRA R, TIPOREGRA T                           '+
                        'WHERE  R.IDTIPOREGRA = T.IDTIPOREGRA    AND           '+
                        'IDREGRA = '+QuotedStr(edtNumero.Text) )
  Then Begin
    edtNome.Caption:= ' '+Qryregra.FieldByName('NOMEREGRA').AsString;
    edtTipo.Caption:= ' '+Qryregra.FieldByName('DESCREGRA').AsString;
    IdTipoRegra    := Qryregra.FieldByName('IDTIPOREGRA').AsString;
    PreencheRegraForma;
  End Else Begin
    ShowMessage('Regra não Encontrada!');
    EdtNumero.SetFocus;
    QryRegra.Close;
    QryRegra.Open;
  End;

// Esconde os Botoes de Controle de Erro
  BtOkRegra.Visible   := False;
  BtErroRegra.Visible := False;
end;



procedure TfrmExecutaFormaCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qryregra.Close;
  FinalizaFormula1;
end;

//******************************************************************************
// Grava o SQL da Regra no Tipo de Regra
procedure TfrmExecutaFormaCalc.GravarSQLdaRegraClick(Sender: TObject);
begin
  inherited;

end;

//******************************************************************************
// Transforma Teclas Digitadas em maiusculo
procedure TfrmExecutaFormaCalc.memSqlKeyPress(Sender: TObject; var Key: Char);
Var
  Tecla:String;
begin
  inherited;
// Transforma Teclas para Maiusculo
  Tecla:=' ';
  Tecla[1]:=Key;
  Tecla   :=AnsiUpperCase(Tecla);
  Key     :=Tecla[1];
end;

procedure TfrmExecutaFormaCalc.Apagar1Click(Sender: TObject);
begin
  inherited;
  //memSql.Clear;
end;

procedure TfrmExecutaFormaCalc.FormCreate(Sender: TObject);
begin
  inherited;
  InicializaFormula1;
  // Atribuo componentes Regra do Form para o Cálculo
  compRegra  := Regra;
  qryInRegra := qryIn;
end;

procedure TfrmExecutaFormaCalc.bbtnLimparClick(Sender: TObject);
begin
  inherited;
  edMatric.Text        := '';
  edNome.Text          := '';
  edtResultRegra.Text  := '';
  redValorInfo.Value   := 0;
  redValorBase.Value   := 0;
  rgTemLanc.ItemIndex  := 1;
  rgRescisao.ItemIndex := 1;
  redParcelas.Value    := 0;
  redOcorrencias.Value := 0;
end;

procedure TfrmExecutaFormaCalc.ChamaFormaCalculo;
begin
// Caso Campo Vazio sai Fora
  If Trim(edtNumero.Text) = '' Then
  begin
     MsgDlg('Informe a Forma de Cálculo para o Teste.',
             'Aviso',mtInformation,[mbOk],0);
     Exit;
  end;

  If Trim(edMatric.Text) = '' Then
  begin
     MsgDlg('Informe a Matrícula de um Empregado para o Teste.',
             'Aviso',mtInformation,[mbOk],0);
     Exit;
  end;
  
// Acerta Botoes
  BtOkRegra.Visible   := False;
  BtErroRegra.Visible := False;
  sUltPessoa          := '';

  // Caso SQL Vazio Sai Fora
  if AbreQry then
  begin
     edtNumeroText     := edtNumero.Text;
     redValorInfoValue := redValorInfo.Value;
     redValorBaseValue := redValorBase.Value;
     redTotalProventos := redTotProv.Value;
     redTotalDescontos := redTotDesc.Value;
     iTemLancItemIndex := 1-rgTemLanc.ItemIndex;
     iParcelasValue    := round(redParcelas.Value);
     iOcorrenciasValue := round(redOcorrencias.Value);
     redPercRetroValue := redPercRetro.Value;
     iMesesRetroValue  := round(redMesesRetro.Value);

     if (redPercRetroValue = 0) and (iMesesRetroValue = 0) then
       CalcBenef(
         0,
         rgRescisao.ItemIndex = 0,
         edtNumeroText, RegPessoa,
         redValorInfoValue, redValorBaseValue,
         iTemLancItemIndex, iParcelasValue, iOcorrenciasValue,
         redTotalProventos, redTotalDescontos)
     else
       uCalRetro(
         0, edtNumeroText, RegPessoa, redValorInfoValue, redValorBaseValue,
         redPercRetroValue, iMesesRetroValue, redTotalProventos, redTotalDescontos);

     edtResultRegra.Text := FloatToStr(redValorInfoValue);

  end;
end;

procedure TfrmExecutaFormaCalc.edMatricChange(Sender: TObject);
begin
  inherited;
  edNome.Text := '';
end;

procedure TfrmExecutaFormaCalc.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectFunc.Executar;
  sbtnProcurar.Down := false;

  if (MontaSelectFunc.ValoresChave.Count > 0) and (MontaSelectFunc.ValoresChave[0] <> '') then
  begin
     edMatric.Text := MontaSelectFunc.ValoresChave[1];
     edNome.Text   := MontaSelectFunc.ValoresChave[0];
     RegPessoa     := MontaSelectFunc.ValoresChave[6];
  end
  else
  begin
     edMatric.Text := '';
     edNome.Text   := '';
  end;

end;

procedure TfrmExecutaFormaCalc.PreencheRegraForma;
begin
  cbxForma.Checked := False;
  cbxRegra.Checked := False;
  with QryAux do
  begin
      if edtNumero.Text <> '' then
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT IDREGRA FROM ALGREGRA WHERE IDREGRA = ' + edtNumero.Text);
        Open;
        if not IsEmpty then
           cbxRegra.Checked := True
        else
           cbxForma.Checked := True;
      end;
  end;

end;

end.


