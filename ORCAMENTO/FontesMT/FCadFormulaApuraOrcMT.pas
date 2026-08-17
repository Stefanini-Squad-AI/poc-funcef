{======================================================================
Analista Responsável: Marcus Oliveira
Data: 29/09/2006
Pendênncia: 21708
Descrição:  Alterado o campo dbrePercentual para 4 casas decimais
=======================================================================}
{ 13/09/2005 - andre tavares - acerto - Inicialização do array vMeses.}
unit FCadFormulaApuraOrcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, StdCtrls, ExtCtrls, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, uCmSqlParams, wwriched,
  DBCtrls, Mask, wwdbdatetimepicker, CMDateTimePicker, wwdbedit, Wwdotdot,
  Wwdbcomb, Wwdbspin, TREdit, wwdblook, CMDBLookupCombo,
  uCtrlMoeda, uCtrlCadFormulaApuraOrc, uCmTypes, DBGrids, fTelaAut;

type
  TFrmCadFormulaApuraOrcMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    CdsFormasApuraOrc: TCMClientDataSet;
    CMSqlParam: TCMSqlParams;
    dbrdgBaseCalculo: TDBRadioGroup;
    dbrdgBaseArredondamento: TDBRadioGroup;
    dbEdtNome: TDBEdit;
    CdsMoeda: TCMClientDataSet;
    dsMoeda: TwwDataSource;
    Panel1: TPanel;
    wwDbGridDetFormula: TwwDBGrid;
    dtpDataCadastro: TCMDateTimePicker;
    GrpPeriodos: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dbspePeriodoIni: TwwDBSpinEdit;
    dbspePeriodoFim: TwwDBSpinEdit;
    dbcboFormaApuracao: TwwDBComboBox;
    GrpPercentual: TGroupBox;
    Label7: TLabel;
    dbrePercentual: TDBRealEdit;
    dbckbAcumPercentual: TDBCheckBox;
    grpMoeda: TGroupBox;
    dbckbAcumMoeda: TDBCheckBox;
    dbLkcboMoeda: TCMDBLookupCombo;
    Label6: TLabel;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    RdbPercentual: TRadioButton;
    RdbMoeda: TRadioButton;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure RdbPercentualClick(Sender: TObject);
    procedure RdbMoedaClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CdsFormasApuraOrcBeforePost(DataSet: TDataSet);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure dbLkcboMoedaChange(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    vMeses                 : Array [1..12] of boolean;

    function  VerificaPreenchimento: boolean;
    function  VerificaMeses(MesIni, MesFim : integer; Criticar: boolean = True): boolean;
    procedure MoedaOUPercentual;
    procedure ListarDados(IdFormula: Double);
    procedure InicializaArray;
  public
    { Public declarations }
  end;

var
  FrmCadFormulaApuraOrcMT: TFrmCadFormulaApuraOrcMT;

  CtrlMoeda              : TCtrlMoeda;
  CtrlCadFormulaApuraOrc : TCtrlCadFormulaApuraOrc;

implementation

uses
  dBaseDados, uSistema, uVerificaPreenchimento, uMensErro, FExecApuraOrcMT;

{$R *.DFM}

procedure TFrmCadFormulaApuraOrcMT.FormCreate(Sender: TObject);
var
  i : integer;

begin
  inherited;

  // ***********************************************//
  // Instancia os recursos necessários, como CTRL's //
  // ***********************************************//
  CtrlCadFormulaApuraOrc := TCtrlCadFormulaApuraOrc.Create;
  CtrlMoeda              := TCtrlMoeda.Create;

  CtrlMoeda.Initialize(DtmBaseDados.dbBaseDados,
                       True,
                       Sistema.ConnectionType,
                       Sistema.ConnectionSide,
                       Sistema.AppRemoteServer,
                       True,
                       nil,
                       nil,
                       False);

  CtrlCadFormulaApuraOrc.InitializeAs(CtrlMoeda);

  CtrlCadFormulaApuraOrc.CdsFormOrcado     := Cds;
  CtrlCadFormulaApuraOrc.CdsFormasApuraOrc := CdsFormasApuraOrc;

  CdsMoeda.Data := CtrlMoeda.ListaMoeda();

  ListarDados(-1);

  for i := 1 to 12 do
    vMeses[i] := False;

  // **********************************************//
end;

procedure TFrmCadFormulaApuraOrcMT.FormDestroy(Sender: TObject);
begin
  // *****************************************//
  // Libera recursos alocados, como os CTRL's //
  // *****************************************//
  FreeAndNil(CtrlCadFormulaApuraOrc);
  FreeAndNil(CtrlMoeda);
  // *****************************************//
  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeCadastroInsert(Sender: TObject);
begin
  ListarDados(-1);

  inherited;

  RdbPercentual.Checked := True;

  // ****************************************//
  // Atribuição de valores padrões - Mestre  //
  // ****************************************//
  Cds.fieldByName('BASEARREDONDAMENTO').AsInteger := 1;
  Cds.fieldByName('BASECALCULO').AsString         := 'O';
  // ******************************************
end;

procedure TFrmCadFormulaApuraOrcMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  // ****************************************//
  // Atribuição de valores padrões - Detalhes//
  // ****************************************//
  CdsFormasApuraOrc.fieldByName('DATA').AsDateTime      := Date;
  CdsFormasApuraOrc.fieldByName('PERIODOINI').AsInteger := 1;
  CdsFormasApuraOrc.fieldByName('PERIODOFIM').AsInteger := 1;

  MoedaOUPercentual;
  // ******************************************
end;

function TFrmCadFormulaApuraOrcMT.VerificaPreenchimento: boolean;
begin
  // ****************************************************************//
  // Verificação do preenchimento da tela                            //
  // ****************************************************************//
  Result := False;

  try
    //************ REGISTRO MESTRE *********************************************
    // Verifica se o campo NOME foi preenchido
    if Trim(dbEdtNome.Text) = '' then
      raise EValidacao.CreateVal('O campo NOME deve ser preechido!', dbEdtNome);


    //************ REGISTROS DETALHES ******************************************
    if CmeDetalhe.Operacao in [opInserir, opAlterar] then
      begin
        // Verifica se a DATA foi preenchida
        if Trim(dtpDataCadastro.Text) = '' then
          raise EValidacao.CreateVal('A Data de Cadastro deve ser preenchida!', dtpDataCadastro);

        // Verifica se a FORMA DE APURAÇÃO foi preenchida
        if Trim(dbcboFormaApuracao.Text) = '' then
          raise EValidacao.CreateVal('A Forma de Apuração deve ser preenchida!', dbcboFormaApuracao);

        // Verifica se o PERÍODO INICIAL foi preenchido
        if Trim(dbspePeriodoIni.Text) = '' then
          raise EValidacao.CreateVal('O Período Inicial deve ser preenchido!', dbspePeriodoIni);

        // Verifica se o PERÍODO FINAL foi preenchido
        if Trim(dbspePeriodoFim.Text) = '' then
          raise EValidacao.CreateVal('O Período Final deve ser preenchido!', dbspePeriodoFim);

        // Verifica se o PERÍODO FINAL está menor que o PERÍODO INICIAL
        if (dbspePeriodoIni.Value > dbspePeriodoFim.Value) then
          raise EValidacao.CreateVal('O Período Inicial está maior que o Período Final!', dbspePeriodoIni);

        // Verifica se a MOEDA foi corretamente preenchida
        if RdbMoeda.Checked then
          if (dbLkcboMoeda.Text = '') then
            raise EValidacao.CreateVal('É necessário definir uma Moeda!', dbrePercentual);
      end;
  except
     on ev : EValidacao do
     begin
        if ev.Show then
          MsgDlg(ev.message, 'Orçamento', mtWarning, [mbOk], 0);

        Repaint;

        if ev.Control.CanFocus then
          ev.Control.SetFocus;

        EXIT;
     end;
  end;

  Result := True;
end;


procedure TFrmCadFormulaApuraOrcMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  // ****************************************************************//
  // Faz a verificação do preenchimento de tela do Registro MESTRE   //
  // ****************************************************************//
  Accept := VerificaPreenchimento;

  if not Accept then
    EXIT
  else
    inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // ****************************************************************//
  // Exibe o resultado da pesquisa de uma Fórmula cadastrada         //
  // ****************************************************************//
  if MontaSelect.RetornouValor then
    begin
      ListarDados(StrToFloat(MontaSelect.ValoresChave[0]));
      CdsFormasApuraOrc.First;
      while not CdsFormasApuraOrc.Eof do
        begin
          VerificaMeses(CdsFormasApuraOrc.fieldByName('PERIODOINI').AsInteger, CdsFormasApuraOrc.fieldByName('PERIODOFIM').AsInteger, False);
          CdsFormasApuraOrc.Next;
        end;
    end;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  Accept := CtrlCadFormulaApuraOrc.ExcluirCadFormulaApuraOrc;
  if not accept then
  begin
    MsgDlg(CtrlCadFormulaApuraOrc.MessageInfo, 'Orçamento', mtError, [mbOk], 0);
    exit;
  end;
  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  Accept := CtrlCadFormulaApuraOrc.GravarCadFormulaApuraOrc;
  if not accept then
  begin
    MsgDlg(CtrlCadFormulaApuraOrc.MessageInfo, 'Orçamento', mtError, [mbOk], 0);
    exit;
  end;
  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.MoedaOUPercentual;
begin
  if CdsFormasApuraOrc.State in [DsEdit, DsInsert] then
    begin
      // Habilita MOEDA
      GrpMoeda.Enabled := RdbMoeda.Checked;
      CdsFormasApuraOrc.fieldByName('FLGACUMPERC').Clear;
      CdsFormasApuraOrc.fieldByName('FLGACUMULAMOEDA').AsString := 'F';
      CdsFormasApuraOrc.fieldByName('PERCENTUAL').Clear;

      // Habilita PERCENTUAL
      GrpPercentual.Enabled := RdbPercentual.Checked;
      CdsFormasApuraOrc.fieldByName('FLGACUMULAMOEDA').Clear;
      CdsFormasApuraOrc.fieldByName('FLGACUMPERC').AsString := 'F';
      CdsFormasApuraOrc.fieldByName('MOECODIGO').Clear;
    end;
end;

procedure TFrmCadFormulaApuraOrcMT.RdbPercentualClick(Sender: TObject);
begin
  inherited;
  MoedaOUPercentual;
end;

procedure TFrmCadFormulaApuraOrcMT.RdbMoedaClick(Sender: TObject);
begin
  inherited;
  MoedaOUPercentual;
end;

procedure TFrmCadFormulaApuraOrcMT.ListarDados(IdFormula: Double);
begin
  Cds.Data               := CtrlCadFormulaApuraOrc.ListaFormulaApuraOrc(IdFormula);
  CdsFormasApuraOrc.Data := CtrlCadFormulaApuraOrc.ListaFormasApuracao(IdFormula);
end;

procedure TFrmCadFormulaApuraOrcMT.CmeDetalheApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  Accept := VerificaPreenchimento;

  if not Accept then
    EXIT
  else
    inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.bbtnConfirmarClick(Sender: TObject);
begin
  if CdsFormasApuraOrc.State in [DsEdit, DsInsert] then
    begin
      MsgDlg('Confirme ou cancele a inclusão da Fórmula de Apuração', 'Orçamento', mtWarning, [mbOk], 0);
      EXIT;
    end;

  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.CdsFormasApuraOrcBeforePost(DataSet: TDataSet);
begin
  inherited;
  CdsFormasApuraOrc.fieldByName('FORMAAPURACAO').AsString := dbcboFormaApuracao.Text;

  if RdbPercentual.Checked then
    begin
      CdsFormasApuraOrc.fieldByName('MOESIGLA').Clear
    end
  else
    begin
      CdsFormasApuraOrc.fieldByName('MOESIGLA').AsString := dbLkcboMoeda.Text;
      CdsFormasApuraOrc.fieldByName('PERCENTUAL').Clear;
    end;
end;



function TFrmCadFormulaApuraOrcMT.VerificaMeses(MesIni, MesFim: integer; Criticar: boolean): boolean;
var
  i : integer;
begin
  Result := False;

  for i := MesIni to MesFim do
  begin
    if vMeses[i] then
    begin
      if Criticar then
      begin
        MsgDlg('Foi encontrado conflito de Período Inicial e Final' +#13+
               'em Forma de Apuração já cadastrada para esta Fórmula!',
               'Orçamento', mtError, [mbOk], 0);
        EXIT;
      end;
    end
    else
    begin
      vMeses[i] := True;
    end;
  end;

  Result := True;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeDetalheConfirma(Sender: TObject);
begin
  if CdsFormasApuraOrc.State in [DsEdit, DsInsert] then
    if not VerificaMeses(CdsFormasApuraOrc.fieldByName('PERIODOINI').AsInteger, CdsFormasApuraOrc.fieldByName('PERIODOFIM').AsInteger) then
      EXIT;

  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeDetalheEdit(Sender: TObject);
var
  i : integer;
begin
  inherited;

  for i := CdsFormasApuraOrc.fieldByName('PERIODOINI').AsInteger to CdsFormasApuraOrc.fieldByName('PERIODOFIM').AsInteger do
    vMeses[i] := False;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeDetalheCancel(Sender: TObject);
var
  i : integer;
begin
  inherited;

  if not CdsFormasApuraOrc.isEmpty then
    for i := CdsFormasApuraOrc.fieldByName('PERIODOINI').AsInteger to CdsFormasApuraOrc.fieldByName('PERIODOFIM').AsInteger do
      vMeses[i] := True;
end;

procedure TFrmCadFormulaApuraOrcMT.dbLkcboMoedaChange(Sender: TObject);
begin
  inherited;
  dbckbAcumMoeda.Enabled := cdsMoeda.fieldByName('FLGPERCVALOR').asString <> 'V';
end;

procedure TFrmCadFormulaApuraOrcMT.CmeDetalheBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  // se o período inicial for 1 (janeiro) e a forma de apuração for 5 (baseada no mes anterior)
  if (dbspePeriodoIni.Value = 1) and (dbcboFormaApuracao.Value = '5') then
  begin
    MsgDlg('Não é permitido o mês de janeiro para a forma de apuração '+ quotedStr(dbcboFormaApuracao.text), 'Orçamento', mtError, [mbOk], 0);
    Accept := false;
    dbspePeriodoIni.Setfocus;
    abort;
  end;
end;

procedure TFrmCadFormulaApuraOrcMT.InicializaArray;
var i : integer;
begin
  for i := 1 to 12 do
    vMeses[i] := false;
end;

procedure TFrmCadFormulaApuraOrcMT.sbtnInserirClick(Sender: TObject);
begin
  InicializaArray;
  inherited;

end;

procedure TFrmCadFormulaApuraOrcMT.sbtnProcurarClick(Sender: TObject);
begin
  InicializaArray;
  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.sbtnApagarClick(Sender: TObject);
begin
  InicializaArray;
  inherited;
end;

procedure TFrmCadFormulaApuraOrcMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
  InicializaArray; 
end;

end.
