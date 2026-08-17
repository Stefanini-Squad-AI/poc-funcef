{--------------------------------------------------------------------------------------------------
Pendência   : SOL 193131 KINTANA 1886224
Responsável : Higor Nayde
Data        : 31/05/2013
Descrição   :  Incluir campo denominado "Quantidade de dias" e exibi-lo na grid da funcionalidade
---------------------------------------------------------------------------------------------------
Pendência   : SIG 122182
Responsável : Ewerton Beltramini
Data        : 14/02/2022
Descrição   :  Incluir campo denominado "Quantidade de Anos" e exibi-lo na grid da funcionalidade
---------------------------------------------------------------------------------------------------
}
unit fCadAdvertenciaSuspensao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbedit,
  uCtrlAdvertenciaSuspensao, uCtrlPadroes, uCtrlPessoaFuncionario,
  wwdbdatetimepicker, CMDateTimePicker, DBTables, Wwquery;






type
  TfrmCadAdvertenciaSuspensao = class(TFrmCadastroMestreDetMT)
    lbl1: TLabel;
    dbedMat: TwwDBEdit;
    lbl2: TLabel;
    dbedNome: TwwDBEdit;
    cdsAdvertencia: TCMClientDataSet;
    dsAdvertencia: TwwDataSource;
    lbl3: TLabel;
    cbbTipo: TComboBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dteDataAto: TCMDateTimePicker;
    dteDataAdvertencia: TCMDateTimePicker;
    mmoMotivo: TMemo;
    edtQuantDias: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtQuantAnos: TwwDBEdit;
    GroupBox1: TGroupBox;
    cmdDtFim: TCMDateTimePicker;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cbbTipoExit(Sender: TObject);
    procedure edtQuantDiasExit(Sender: TObject);
    procedure edtQuantAnosExit(Sender: TObject);

  private
    { Private declarations }
    objPessoaFuncionario : TCtrlPessoaFuncionario;
    objAdvertencia       : TCtrlAdvertenciaSuspensao;
    pIDAdvertencia       : Integer;
    pstrIDAdv            : String;
    pIsExcluir           : Boolean;
    pIsAlterar           : Boolean;
    procedure Sel(IdPessoa: double);
    procedure CarregaCamposAlteracao;
    procedure LimparCampos;
    function ValidarCampos : Boolean;
    procedure ApagarRegistro(pintIDADV : integer);
  public
    { Public declarations }
    function IncDate(ADate: TDateTime; Days, Months, Years: Integer): TDateTime;    
  end;

var
  frmCadAdvertenciaSuspensao: TfrmCadAdvertenciaSuspensao;

implementation

uses uMensErro, uCtrlFuncoesRH, uCtrlUsoGeralRH, UDataBase, dBaseDados;
{$R *.DFM}

function TfrmCadAdvertenciaSuspensao.IncDate(ADate: TDateTime; Days, Months, Years: Integer): TDateTime;
var
  D, M, Y: Word;
  Day, Month, Year: Longint;
begin
  DecodeDate(ADate, Y, M, D);
  Year := Y; Month := M; Day := D;
  Inc(Year, Years);
  Inc(Year, Months div 12);
  Inc(Month, Months mod 12);
  if Month < 1 then begin
    Inc(Month, 12);
    Dec(Year);
  end
  else if Month > 12 then begin
    Dec(Month, 12);
    Inc(Year);
  end;
  if Day > MonthDays[IsLeapYear(Year)][Month] then Day := MonthDays[IsLeapYear(Year)][Month];
  Result := EncodeDate(Year, Month, Day) + Days + Frac(ADate);
end;

procedure TfrmCadAdvertenciaSuspensao.CmeCadastroFind(Sender: TObject);
begin

  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadAdvertenciaSuspensao.Sel(IdPessoa: double);
begin
  Cds.Data            := objPessoaFuncionario.ListPesFisFuncionario(IdPessoa);
  cdsAdvertencia.Data := objAdvertencia.ListAdvertenciaSuspensao(IdPessoa);
end;

procedure TfrmCadAdvertenciaSuspensao.FormCreate(Sender: TObject);
begin
  inherited;
  objPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  objAdvertencia               := TCtrlAdvertenciaSuspensao.Create;
  objPessoaFuncionario.InitializeAs(Padroes);
  objAdvertencia.InitializeAs(Padroes);
  pIDAdvertencia := 0;
  pIsExcluir   := False;
  pIsAlterar   := False;
end;

procedure TfrmCadAdvertenciaSuspensao.sbtnAltDetClick(Sender: TObject);
begin
  pIsAlterar   := True;
  pIsExcluir   := False;
  CarregaCamposAlteracao;
  inherited;
end;

procedure TfrmCadAdvertenciaSuspensao.CarregaCamposAlteracao;
begin
  if not (cdsAdvertencia.IsEmpty) then
  begin
    pIDAdvertencia := cdsAdvertencia.FieldByName('IDADVERTSUSP').AsInteger;
    if (cdsAdvertencia.FieldByName('TIPO').AsString = 'A') or (cdsAdvertencia.FieldByName('TIPO').AsString = 'Advertência') then
       cbbTipo.ItemIndex := 0
    else if (cdsAdvertencia.FieldByName('TIPO').AsString = 'S') or (cdsAdvertencia.FieldByName('TIPO').AsString = 'Suspensão') then          //Ewerton Beltramini 14/02/2022 - SIG 122182
       cbbTipo.ItemIndex := 1                                                                                                                //Ewerton Beltramini 14/02/2022 - SIG 122182
    else if (cdsAdvertencia.FieldByName('TIPO').AsString = 'R') or (cdsAdvertencia.FieldByName('TIPO').AsString = 'Apuração de Responsabilidade') then   //Ewerton Beltramini 14/02/2022 - SIG 122182
       cbbTipo.ItemIndex := 2;                                                                                                               //Ewerton Beltramini 14/02/2022 - SIG 122182

    cbbTipo.SetFocus;   //Ewerton Beltramini 14/02/2022 - SIG 122182

    dteDataAto.Text := cdsAdvertencia.FieldByName('DATAATO').AsString;
    dteDataAdvertencia.Text := cdsAdvertencia.FieldByName('DATAADVSUSP').AsString;

    mmoMotivo.Text := cdsAdvertencia.FieldByName('MOTIVO').AsString;

    if   cdsAdvertencia.FieldByName('QUANTDIAS').AsString = '0' then edtQuantDias.Text := '' //Ewerton Beltramini 14/02/2022 - SIG 122182
    else edtQuantDias.Text := cdsAdvertencia.FieldByName('QUANTDIAS').AsString; //higor SOL 193131 KINTANA 1886224

    if   cdsAdvertencia.FieldByName('QUANTANOS').AsString = '0' then edtQuantAnos.Text := '' //Ewerton Beltramini 14/02/2022 - SIG 122182
    else edtQuantAnos.Text := cdsAdvertencia.FieldByName('QUANTANOS').AsString;              //Ewerton Beltramini 14/02/2022 - SIG 122182

  (*
    if  edtQuantDias.Text <> '' then
        cmdDtFim.Text :=  IncDay(cdsAdvertencia.FieldByName('DATAADVSUSP').AsDateTime, StrToInt(edtQuantDias.Text))
    else if edtQuantAnos.Text <> '' then
        cmdDtFim.Text:= IncYear(cdsAdvertencia.FieldByName('DATAADVSUSP').AsDateTime, StrToInt(edtQuantAnos.Text));
*)
 end;

end;

procedure TfrmCadAdvertenciaSuspensao.CmeCadastroConfirma(Sender: TObject);
begin

  if not(dtmBaseDados.dbBaseDados.InTransaction) then
  begin
    StartTransacao;
    cdsAdvertencia.First;

    while not cdsAdvertencia.eof do
    begin
      cdsAdvertencia.edit;
      if (cdsAdvertencia.FieldByName('TIPO').asstring = 'Advertência') then
        cdsAdvertencia.FieldByName('TIPO').value := 'A'
      else if (cdsAdvertencia.FieldByName('TIPO').asstring = 'Suspensão') then     //Ewerton Beltramini 14/02/2022 - SIG 122182
        cdsAdvertencia.FieldByName('TIPO').value := 'S'                            //Ewerton Beltramini 14/02/2022 - SIG 122182
      else if (cdsAdvertencia.FieldByName('TIPO').asstring = 'Apuração de Responsabilidade') then     //Ewerton Beltramini 14/02/2022 - SIG 122182
        cdsAdvertencia.FieldByName('TIPO').value := 'R';                           //Ewerton Beltramini 14/02/2022 - SIG 122182

      cdsAdvertencia.Post;
      objAdvertencia.Salvar(cdsAdvertencia);
      cdsAdvertencia.Next;
    end;
    pIsAlterar := False;
  end;
  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

  inherited;

end;

procedure TfrmCadAdvertenciaSuspensao.sbtnExcluiDetClick(Sender: TObject);
begin
  pIsAlterar := False;
  ApagarRegistro(cdsAdvertencia.FieldByName('IDADVERTSUSP').asinteger);
  inherited;
end;

procedure TfrmCadAdvertenciaSuspensao.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible := False;
  sbtnApagar.Visible  := False;
  pstrIDAdv           := EmptyStr;
end;

procedure TfrmCadAdvertenciaSuspensao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  cdsAdvertencia.data := objAdvertencia.ListAdvertenciaSuspensao(cdsAdvertencia.FieldByName('IDPESSOA').AsInteger);
end;

procedure TfrmCadAdvertenciaSuspensao.sbtnInsDetClick(Sender: TObject);
begin
  LimparCampos;
  pIDAdvertencia := 0;
  pIsExcluir := False;
  pIsAlterar := False;
  inherited;

end;

procedure TfrmCadAdvertenciaSuspensao.bbtnOkDetClick(Sender: TObject);
var Tipo : string;
begin

  if ValidarCampos then
  begin
    if (cbbTipo.ItemIndex = 0) then
       Tipo := 'Advertência'
    else if (cbbTipo.ItemIndex = 1) then
       Tipo := 'Suspensão'
    else if (cbbTipo.ItemIndex = 2) then             //Ewerton Beltramini 14/02/2022 - SIG 122182
       Tipo := 'Apuração de Responsabilidade';                   //Ewerton Beltramini 14/02/2022 - SIG 122182

      if not pIsAlterar then
         cdsAdvertencia.Insert
      else
         cdsAdvertencia.Edit;


      if (edtQuantDias.Text = '') then edtQuantDias.Text := '0';   //Ewerton Beltramini 14/02/2022 - SIG 122182
      if (edtQuantAnos.Text = '') then edtQuantAnos.Text := '0';   //Ewerton Beltramini 14/02/2022 - SIG 122182


      cdsAdvertencia.FieldByName('IDADVERTSUSP').Value := pIDAdvertencia;
      cdsAdvertencia.FieldByName('IDPESSOA').Value := cds.FieldByName('IDPESSOA').asInteger;
      cdsAdvertencia.FieldByName('TIPO').Value := Tipo;
      cdsAdvertencia.FieldByName('DATAATO').Value := dteDataAto.Date;
      cdsAdvertencia.FieldByName('DATAADVSUSP').Value := dteDataAdvertencia.Date;
      cdsAdvertencia.FieldByName('QUANTDIAS').Value := edtQuantDias.Text;//higor SOL 193131 KINTANA 1886224
      cdsAdvertencia.FieldByName('QUANTANOS').Value := edtQuantAnos.Text; //Ewerton Beltramini 14/02/2022 - SIG 122182
      cdsAdvertencia.FieldByName('MOTIVO').Value := mmoMotivo.Text;
      cdsAdvertencia.Post;

      dbgrdDet.RefreshDisplay;
      LimparCampos;
     inherited;
     bbtnVoltarDet.Click;
  end;

end;

procedure TfrmCadAdvertenciaSuspensao.LimparCampos;
begin
  cbbTipo.ItemIndex         := -1;
  dteDataAto.Text           := EmptyStr;
  dteDataAdvertencia.Text   := EmptyStr;
  edtQuantDias.Text   := EmptyStr;//higor SOL 193131 KINTANA 1886224
  edtQuantAnos.Text   := EmptyStr;//Ewerton Beltramini 14/02/2022 - SIG 122182
  mmoMotivo.Lines.Clear;
end;

function TfrmCadAdvertenciaSuspensao.ValidarCampos: Boolean;
var isValido : Boolean;
begin

  isValido := true;

  if (edtQuantDias.Text = '0') then edtQuantDias.Text := '';   //Ewerton Beltramini 14/02/2022 - SIG 122182
  if (edtQuantAnos.Text = '0') then edtQuantAnos.Text := '';   //Ewerton Beltramini 14/02/2022 - SIG 122182 

  if (cbbTipo.ItemIndex < 0) then
  begin
    isValido := False;
    MsgDlg('Preencha o Tipo.','Folha de Pagamento',mtConfirmation,[mbOk],0);
  end
  else if (dteDataAto.Text = EmptyStr) then
  begin
    isValido := False;
    MsgDlg('Preencha a Data do Ato.','Folha de Pagamento ',mtConfirmation,[mbOk],0);
  end
  else if (dteDataAdvertencia.Text = EmptyStr) then
  begin
    isValido := False;
    MsgDlg('Preencha a Data da Advertência ou Suspensão.','Folha de Pagamento ',mtConfirmation,[mbOk],0);
  end
  else if (edtQuantDias.Text = EmptyStr)  and (edtQuantAnos.Text = EmptyStr)  or
          (edtQuantDias.Text <> EmptyStr) and (edtQuantAnos.Text <> EmptyStr) then//higor SOL 193131 KINTANA 1886224   //Ewerton Beltramini 14/02/2022 - SIG 122182
  begin
    isValido := False;
    MsgDlg('Preencha apenas a quantidade de Dias e ou a de Anos.','Folha de Pagamento ',mtConfirmation,[mbOk],0);     //Ewerton Beltramini 14/02/2022 - SIG 122182
  end                                                //higor SOL 193131 KINTANA 1886224
  else if (Trim(mmoMotivo.Text) = EmptyStr) then
  begin
    isValido := False;
    MsgDlg('Preencha o Motivo.','Folha de Pagamento ',mtConfirmation,[mbOk],0);

  end;

  Result := isValido;

end;

procedure TfrmCadAdvertenciaSuspensao.bbtnCancelarDetClick(
  Sender: TObject);
begin
  pIsExcluir := False;
  pIsAlterar := False;
  inherited;

end;

procedure TfrmCadAdvertenciaSuspensao.ApagarRegistro(
  pintIDADV: Integer);
begin

  if (pintIDADV > 0) then
  begin
     if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;
     pstrIDAdv    := IntToStr(pintIDADV);
     objAdvertencia.ApagarAdvertencia(pstrIDAdv);
     pstrIDAdv    := EmptyStr;
  end;
end;

procedure TfrmCadAdvertenciaSuspensao.bbtnCancelarClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
  inherited;
end;

procedure TfrmCadAdvertenciaSuspensao.cbbTipoExit(Sender: TObject);
begin
  inherited;
    //Ewerton Beltramini 14/02/2022 - SIG 122182 - Inicio
    if (cbbTipo.ItemIndex = 2) then
    begin
        edtQuantDias.Enabled := True;
        edtQuantDias.Color := clWindow;
        edtQuantAnos.Enabled := True;
        edtQuantAnos.Color := clWindow;
    end
    else
    begin
        edtQuantDias.Enabled := True;
        edtQuantDias.Color := clWindow;
        edtQuantAnos.Enabled := False;
        edtQuantAnos.Color := clBtnFace;
    end;

    edtQuantAnos.Text := '';
    edtQuantDias.Text := '';

    //Ewerton Beltramini 14/02/2022 - SIG 122182 - fim
end;

procedure TfrmCadAdvertenciaSuspensao.edtQuantDiasExit(Sender: TObject);
begin
  inherited;
       if (edtQuantDias.Text <> '') and (dteDataAdvertencia.Text <> EmptyStr) then
          cmdDtFim.Date := IncDate(dteDataAdvertencia.Date, StrToInt(edtQuantDias.Text),0,0);
end;

procedure TfrmCadAdvertenciaSuspensao.edtQuantAnosExit(Sender: TObject);
begin
  inherited;
       if (edtQuantAnos.Text <> '') and (dteDataAdvertencia.Text <> EmptyStr) then
          cmdDtFim.Date := IncDate(dteDataAdvertencia.Date, 0,0,StrToInt(edtQuantAnos.Text));

end;

end.


