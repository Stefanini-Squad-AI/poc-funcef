{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : VerificaPreenchimentoCampos
 N. SIG..........   : 38475.59781
 Data da Alteração: : 07/12/2017
 Alteração Form:    : fCadTurnoDia
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Alteração da forma de confirmação do intervalo de jornada
                      de trabalho.
--------------------------------------------------------------------------------
 Nº SOL           : 259921/18014 - ER159
 Nº PPM           : 1217940
 Data da Alteração: 10/03/2016
 Alteração Form   : Alterações de leiaute e campos de tabela para atender ao
                    eSocial.
 Responsável      : Michelle Suellyn Mota
 Descrição        : Alterações de leiaute e campos de tabela para atender ao
                    eSocial.
--------------------------------------------------------------------------------
 Nº SOL...........: 229874/16592
 Nº PPM...........: 544753
 Data da Alteração: 21/11/2014
 Responsável......: Felipe Azevedo dos Santos
 Descrição........: Adequando funcionalidade ao eSocial.
--------------------------------------------------------------------------------}

unit fCadTurnoDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, CmEventosCadastro,
  ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlTurnoDia, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TfrmCadTurnoDia = class(TFrmCadastroMT)
    grbTurnosDia: TGroupBox;
    mkedFinalExped: TMaskEdit;
    mkedFinalAlmoco: TMaskEdit;
    mkedInicioAlmoco: TMaskEdit;
    mkedInicioExped: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    grbInfoJornada: TGroupBox;
    lblTpIntervaloJor: TLabel;
    dbcmbTpInterJor: TwwDBComboBox;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    lblDurIntervalo: TLabel;
    dbedDurIntervalo: TwwDBEdit;
    lblTpJornada: TLabel;
    lblVarEntrada: TLabel;
    dbedVarEntrada: TwwDBEdit;
    dbedVarSaida: TwwDBEdit;
    lblVarSaida: TLabel;
    CdsAux: TCMClientDataSet;
    dbcbTipoJornada: TwwDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dbcmbTpInterJorChange(Sender: TObject);
    procedure mkedInicioAlmocoChange(Sender: TObject);
    procedure mkedFinalAlmocoChange(Sender: TObject);
    procedure dbcbTipoJornadaChange(Sender: TObject);
    procedure dbcbTipoJornadaKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject); // Felipe A. Santos - SOL 229874/16592 PPM 544753  - início
  private
    CtrlTurnoDia: TCtrlTurnoDia;
    bDescJornadaObrigatorio, bDurIntervaloObrigatorio: boolean; // Felipe A. Santos - SOL 229874/16592 PPM 544753
    sVerificaIniAlmoco, sVerificaFinalAlmoco : string; // Felipe A. Santos - SOL 229874/16592 PPM 544753

    procedure Sel(IdTurnoDiario: integer);
    procedure AtribuiValores(InicioExped, InicioAlmoco, FinalAlmoco, FinalExped: string);
    function  GravarRegistro: boolean;

    // Felipe A. Santos - SOL 229874/16592 PPM 544753  - início
    function VerificaPreenchimentoCampos : boolean;
    procedure CalculaDuracaoIntervalo;
    function VerificaPreenchimentoAlmoco(MskEdit: TMaskEdit) : boolean;
    function TiraEspacosEmBranco(var pValor : string) : string;
    function VerificaCalcAlmoco(pValor : string) : boolean;
    // Felipe A. Santos - SOL 229874/16592 PPM 544753 - fim

    function VerificaCodigoExistente : Boolean; //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  end;

var
  frmCadTurnoDia: TfrmCadTurnoDia;

implementation

uses uCMTypes, uMensErro, uCtrlPadroes;

const
     Help = 210028;

{$R *.DFM}

procedure TfrmCadTurnoDia.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTurnoDia := TCtrlTurnoDia.Create;
  CtrlTurnoDia.InitializeAs(Padroes);
  CtrlTurnoDia.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadTurnoDia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTurnoDia);
  inherited;
end;

procedure TfrmCadTurnoDia.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
    AtribuiValores(Cds.FieldByName('InicioExpediente').asString,
      Cds.FieldByName('InicioAlmoco').asString,
      Cds.FieldByName('FinalAlmoco').asString,
      Cds.FieldByName('FinalExpediente').asString);
  end;
end;

procedure TfrmCadTurnoDia.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  AtribuiValores('00:00', '00:00', '00:00', '00:00');
end;

procedure TfrmCadTurnoDia.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  AtribuiValores(Cds.FieldByName('InicioExpediente').asString,
    Cds.FieldByName('InicioAlmoco').asString, Cds.FieldByName('FinalAlmoco').asString,
    Cds.FieldByName('FinalExpediente').asString);
end;

procedure TfrmCadTurnoDia.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  AtribuiValores('', '', '', '');
end;

procedure TfrmCadTurnoDia.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao = opInserir) then
    AtribuiValores(Cds.FieldByName('INICIOEXPEDIENTE').asString,
      Cds.FieldByName('INICIOALMOCO').asString, Cds.FieldByName('FINALALMOCO').asString,
      Cds.FieldByName('FINALEXPEDIENTE').asString);
end;

procedure TfrmCadTurnoDia.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadTurnoDia.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTurnoDia.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTurnoDia.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadTurnoDia.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadTurnoDia.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  // Felipe A. Santos - comentado - SOL 229874/16592 PPM 544753
 {if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end}
  // Felipe A. Santos - comentado - SOL229874/16592 PPM 544753

  if not(VerificaPreenchimentoCampos) then   // Felipe A. Santos - SOL 229874/16592 PPM 544753
  begin
    Exit;
  end
  else
  begin
    Cds.FieldByName('INICIOEXPEDIENTE').asString := mkedInicioExped.Text;
    Cds.FieldByName('INICIOALMOCO').asString := mkedInicioAlmoco.Text;
    Cds.FieldByName('FINALALMOCO').asString := mkedFinalAlmoco.Text;
    Cds.FieldByName('FINALEXPEDIENTE').asString := mkedFinalExped.Text;

    // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    {Case dbcbTipoJornada.ItemIndex of
       0: Cds.FieldByName('TIPOJORNADA').asString := '00';
       1: Cds.FieldByName('TIPOJORNADA').asString := '01';
       2: Cds.FieldByName('TIPOJORNADA').asString := '02';
       3: Cds.FieldByName('TIPOJORNADA').asString := '03';
       4: Cds.FieldByName('TIPOJORNADA').asString := '09';
    end;}
    // Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);

    // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    if bInserindo then
      begin
        dbcbTipoJornada.Text := '';
        dbedCodigo.Text := '';
        //edtDescTipoJornada.Text := ''; //Everson Cunha - SIG38475
        mkedInicioExped.Text := '';
        mkedInicioAlmoco.Text := '';
        mkedFinalAlmoco.Text := '';
        mkedFinalExped.Text := '';
        dbcmbTpInterJor.Text := '';
        dbedDurIntervalo.Text := '';
        dbedVarEntrada.Text := '';
        dbedVarSaida.Text := '';
      end;
    // Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadTurnoDia.Sel(IdTurnoDiario: integer);
begin
  Cds.Data := CtrlTurnoDia.ListTurnoDiario(IdTurnoDiario);
end;

function TfrmCadTurnoDia.GravarRegistro: boolean;
begin
  Result := CtrlTurnoDia.Gravar;
  if not(Result) then
    raise exception.Create(CtrlTurnoDia.MessageInfo);
end;

procedure TfrmCadTurnoDia.AtribuiValores(InicioExped, InicioAlmoco, FinalAlmoco,
  FinalExped: string);
begin
  mkedInicioExped.Text := InicioExped;
  mkedInicioAlmoco.Text := InicioAlmoco;
  mkedFinalAlmoco.Text := FinalAlmoco;
  mkedFinalExped.Text := FinalExped;
end;

// Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
function TfrmCadTurnoDia.VerificaCodigoExistente : Boolean;
begin
  CdsAux.Data := CtrlTurnoDia.ListCodExists(dbedCodigo.Text);
  if (CdsAux.IsEmpty) then
    begin
      Result := True;
    end
  else
    begin
      Result := False;
    end;
end;
// Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

function TfrmCadTurnoDia.VerificaPreenchimentoCampos: boolean;
begin
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início
  Result := True;

  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedCodigo.SetFocus;
    Exit;
  end;

  // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  if (not (VerificaCodigoExistente)) and (Cds.State = dsInsert) then
  begin
    MsgDlg('Esse código já foi cadastrado. Utilize outro.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedCodigo.SetFocus;
    Exit;
  end;
  // Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

  if (Cds.FieldByName('VARIACAOHORAENTRADA').AsInteger = 0) then
  begin
    MsgDlg('Preencha o campo Variação em minutos na Entrada.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedVarEntrada.SetFocus;
    Exit;
  end;

  if (Cds.FieldByName('VARIACAOHORASAIDA').AsInteger = 0)  then
  begin
    MsgDlg('Preencha o campo Variação em minutos na Saída.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedVarSaida.SetFocus;
    Exit;
  end;

  if (StrToInt(Trim(dbedVarEntrada.Text)) > 59) or (StrToInt(Trim(dbedVarEntrada.Text)) < 1) then //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  begin
    MsgDlg('A variação em minutos na Entrada/Saída deve variar entre 1 e 60 minutos.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedVarEntrada.SetFocus;
    Exit;
  end;

  if (StrToInt(Trim(dbedVarSaida.Text)) > 59) or (StrToInt(Trim(dbedVarSaida.Text)) < 1) then //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  begin
    MsgDlg('A variação em minutos na Entrada/Saída deve variar entre 1 e 60 minutos', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedVarSaida.SetFocus;
    Exit;
  end;

  if (Trim(dbcbTipoJornada.Text) = '') then
  begin
    MsgDlg('Preencha o campo Tipo de Jornada.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbcbTipoJornada.SetFocus;
    Exit;
  end;

  //Everson Cunha - SIG38475 - Ini
  {if ((bDescJornadaObrigatorio) and (Trim(edtDescTipoJornada.Text) = '')) then
  begin
    MsgDlg('Preencha o campo Descrição do Tipo de Jornada.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    Result := False;
    edtDescTipoJornada.SetFocus;
    Exit;
  end;}
  //Everson Cunha - SIG38475 - Fim

  if (Trim(dbcmbTpInterJor.Text) = '') then
  begin
    MsgDlg('Preencha o campo Tipo de Intervalo da Jornada.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbcmbTpInterJor.SetFocus;
    Exit;
  end;

  if (bDurIntervaloObrigatorio) and (not(VerificaPreenchimentoAlmoco(mkedInicioAlmoco))) then
  begin
    MsgDlg('Preencha o campo Início do Almoço', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    mkedInicioAlmoco.SetFocus;
    Exit;
  end;

  if (bDurIntervaloObrigatorio) and (not(VerificaPreenchimentoAlmoco(mkedFinalAlmoco))) then
  begin
    MsgDlg('Preencha o campo Final do Almoço', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result :=  False;
    mkedFinalAlmoco.SetFocus;
    Exit;
  end;

  //Cássio Rovaroto - SIG nº 38475.59781 - Início
  //else if ((bDurIntervaloObrigatorio) and ((Cds.FieldByName('DURACAOINTERVALO').AsInteger > 120) or
  //        (Cds.FieldByName('DURACAOINTERVALO').AsInteger < 60))) then //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  //begin
  //  MsgDlg('A duração do intervalo deve variar entre 60 e 120 minutos.', 'Aviso', mtWarning, [mbOk, mbHelp], Help); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  //  dbedDurIntervalo.SetFocus;
  //end
  if (bDurIntervaloObrigatorio) and (Cds.FieldByName('DURACAOINTERVALO').AsInteger > 120) then
  begin
  	if MsgDlg('Duração do intervalo é maior que 120 minutos. Confirma?', 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Result := False;
    	dbedDurIntervalo.SetFocus;
      Exit;
    end
  end;

  if (bDurIntervaloObrigatorio) and (Cds.FieldByName('DURACAOINTERVALO').AsInteger < 60) then
  begin
  	if MsgDlg('Duração do intervalo é menor que 60 minutos. Confirma?', 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Result := False;
    	dbedDurIntervalo.SetFocus;
      Exit;
    end
  end;
  //Cássio Rovaroto - SIG nº 38475.59781 -Fim

  // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  if (bDurIntervaloObrigatorio) and (dbedDurIntervalo.Text = '') then
  begin
    MsgDlg('Preencha o campo Duração do Intervalo.', 'Aviso', mtWarning, [mbOk, mbHelp], Help);
    Result := False;
    dbedDurIntervalo.SetFocus;
    Exit;
  end;
  // Fim - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

procedure TfrmCadTurnoDia.dbcmbTpInterJorChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início
  if (dbcmbTpInterJor.text = 'Intervalo em Horário Variável') then  begin //Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    //lblDurIntervalo.Visible := (UpperCase(Trim(dbcmbTpInterJor.Text)) = 'INTERVALO EM HORáRIO VARIáVEL');//Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    dbedDurIntervalo.Enabled := (UpperCase(Trim(dbcmbTpInterJor.Text)) = 'INTERVALO EM HORáRIO VARIáVEL');
    bDurIntervaloObrigatorio := (UpperCase(Trim(dbcmbTpInterJor.Text)) = 'INTERVALO EM HORáRIO VARIáVEL');
  // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  end else if (dbcmbTpInterJor.text = 'Intervalo em Horário Fixo') then begin
    dbedDurIntervalo.Enabled := (UpperCase(Trim(dbcmbTpInterJor.Text)) = 'INTERVALO EM HORáRIO FIXO');
    bDurIntervaloObrigatorio := (UpperCase(Trim(dbcmbTpInterJor.Text)) = 'INTERVALO EM HORáRIO FIXO');
  end else begin
    dbedDurIntervalo.Enabled := False;
    dbedDurIntervalo.text := '0';
    bDurIntervaloObrigatorio := False;
  end;
  // Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if bDurIntervaloObrigatorio then
       CalculaDuracaoIntervalo
    else
       Cds.FieldByName('DURACAOINTERVALO').AsInteger := 0;
  end;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

procedure TfrmCadTurnoDia.CalculaDuracaoIntervalo;
var
   sIniAlmoco, sFinalAlmoco : String;
   iHoraIni, iHoraFinal, iMinutoIni, iMinutoFinal : integer;
   iCalcIni, iCalcFinal, iCalculo : double;
begin
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início
  sIniAlmoco := StringReplace(mkedInicioAlmoco.Text, ':', '', [rfReplaceAll]);
  sIniAlmoco := TiraEspacosEmBranco(sIniAlmoco);
  sFinalAlmoco := StringReplace(mkedFinalAlmoco.Text, ':', '', [rfReplaceAll]);
  sFinalAlmoco := TiraEspacosEmBranco(sFinalAlmoco);

  if (VerificaCalcAlmoco(sIniAlmoco)) and (VerificaCalcAlmoco(sFinalAlmoco)) then // se tiver vazio ou algum espaço em branco não faz o calculo
  begin

    iHoraIni := StrToInt(Copy(sIniAlmoco, 1, 2));
    iMinutoIni := StrToInt(Copy(sIniAlmoco, 3, 2));

    iHoraFinal := StrToInt(Copy(sFinalAlmoco, 1, 2));
    iMinutoFinal := StrToInt(Copy(sFinalAlmoco, 3, 2));

    // transforma o formato HH:MM em minutos
    iCalcIni := ((iHoraIni * 60) + iMinutoIni);
    iCalcFinal := ((iHoraFinal * 60) + iMinutoFinal);

    // calcula os minutos do almoço
    iCalculo := iCalcFinal - iCalcIni;

    if iCalculo < 0 then
       iCalculo := 0;
         
    // calcula o intervalo de almoço do funcionário
    Cds.FieldByName('DURACAOINTERVALO').AsFloat := iCalculo;
  end
  else
    Cds.FieldByName('DURACAOINTERVALO').AsFloat := 0;

  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;


procedure TfrmCadTurnoDia.mkedInicioAlmocoChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if bDurIntervaloObrigatorio then
       CalculaDuracaoIntervalo
    else
       Cds.FieldByName('DURACAOINTERVALO').AsInteger := 0;
  end;

  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

procedure TfrmCadTurnoDia.mkedFinalAlmocoChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if bDurIntervaloObrigatorio then
       CalculaDuracaoIntervalo
    else
       Cds.FieldByName('DURACAOINTERVALO').AsInteger := 0;
  end;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

function TfrmCadTurnoDia.VerificaPreenchimentoAlmoco(
  MskEdit: TMaskEdit): boolean;
var
   sVerificacao : string;
   i : integer;
begin
  // função utilizada para verificar obrigatoriedade do campo Inicio do almoço.
  Result := False;

  sVerificacao := StringReplace(MskEdit.Text, ':', '', [rfReplaceAll]);

  if sVerificacao = '0000' then
     Exit;

  for i := 1 to Length(sVerificacao) do
  begin
    if (sVerificacao[i] in [' ']) then
    begin
       Result := False;
       Break;
    end
    else
    begin
       Result := True;
    end;
  end;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

// essa função foi criada, pois o trim não remove espaço em branco no meio da string
function TfrmCadTurnoDia.TiraEspacosEmBranco(var pValor: string): string;
var
   i, iTam : integer;
begin
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início
  pValor := Trim(pValor);
  iTam := Length(pValor);

  for i := 1 to iTam do
  begin
      if not(pValor[i] in ['0'..'9']) then
       Delete(pValor, i, 1);
  end;

  Result := pValor;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

function TfrmCadTurnoDia.VerificaCalcAlmoco(pValor: string): boolean;
begin
  // Felipe A. Santos - SOL 229874/16592 PPM 544753 - início
   Result := False;

   if (Length(pValor) = 4) and (pValor <> '') then
      Result := True;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753 - fim
end;

procedure TfrmCadTurnoDia.dbcbTipoJornadaChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- início
  //lblDescJornada.Enabled := (UpperCase(Trim(dbcbTipoJornada.Text)) = 'OUTROS'); //Michelle Mota - SOL: 259921.18014 - PPM: 1217940

  //Everson Cunha - SIG38475 - Ini
  //edtDescTipoJornada.Enabled := (UpperCase(Trim(dbcbTipoJornada.Text)) = 'OUTROS');
  //bDescJornadaObrigatorio := (UpperCase(Trim(dbcbTipoJornada.Text)) = 'OUTROS');
  //Everson Cunha - SIG38475 - Fim

  // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
  //Everson Cunha - SIG38475 - Ini
  {if (edtDescTipoJornada.Enabled) then
    edtDescTipoJornada.Color := clWhite
  else
    edtDescTipoJornada.Color := clSilver;}
  //Everson Cunha - SIG38475 - Fim
  // Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if not(bDescJornadaObrigatorio) then
       Cds.FieldByName('DESCRICAO').AsString := '';
  end;
  // Felipe A. Santos - SOL 229874/16592 PPM 544753- fim
end;

procedure TfrmCadTurnoDia.dbcbTipoJornadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //Key := #0; // Felipe A. Santos - SOL 229874/16592 PPM 544753
end;

// Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
procedure TfrmCadTurnoDia.sbtnProcurarClick(Sender: TObject);
var
  cod : Integer;
begin
  inherited;
  if MontaSelect.RetornouValor then
    begin
      if (Cds.FieldByName('TIPOJORNADA').AsString <> '') then begin
        cod := StrToInt(Cds.FieldByName('TIPOJORNADA').AsString);
        Case Cod  of
          0: dbcbTipoJornada.ItemIndex := 0;
          2: dbcbTipoJornada.ItemIndex := 1;
          3: dbcbTipoJornada.ItemIndex := 2;
          4: dbcbTipoJornada.ItemIndex := 3;
          5: dbcbTipoJornada.ItemIndex := 4;
          6: dbcbTipoJornada.ItemIndex := 5;
          7: dbcbTipoJornada.ItemIndex := 6;
          9: dbcbTipoJornada.ItemIndex := 7;
        end;
      end;
    end;
end;

procedure TfrmCadTurnoDia.sbtnInserirClick(Sender: TObject);
begin
  inherited;

end;
// Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
end.
