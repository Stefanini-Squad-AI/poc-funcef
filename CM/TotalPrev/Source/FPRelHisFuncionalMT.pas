unit FPRelHisFuncionalMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  fParamReports_Padrao, CmParamReport, UDiasUteis,
  uCtrlTempoServico, uSistema, DbaseDados;

type
  TfrmPRelHisFuncionalMT = class(TfrmParamReports_Padrao)
    msElegivel: TMontaSelect;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edMatricula: TEdit;
    Label2: TLabel;
    btnProcurar: TBitBtn;
    edNome: TEdit;
    CdsAux: TCMClientDataSet;
    Label3: TLabel;
    dtReferencia: TCMDateTimePicker;
    dtSimula: TCMDateTimePicker;
    Label4: TLabel;
    procedure btnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CtrlTempoServicoLocal : TCtrlTempoServico;
    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
  end;

var
  frmPRelHisFuncionalMT: TfrmPRelHisFuncionalMT;
  IdPessoa : Integer;
  sTempoTotal, sTempoSemConversao : String;
implementation

Uses UMensErro, dRelTempoServicoMT;

{$R *.DFM}

procedure TfrmPRelHisFuncionalMT.btnProcurarClick(Sender: TObject);
begin
  inherited;
  IdPessoa         := 0;
  edMatricula.Text := '';
  edNome.Text  := StringOfChar(' ',80);
  msElegivel.Executar;
  if (msElegivel.RetornouValor) then
  Begin
    IdPessoa              := StrtoIntDef(msElegivel.ValoresChave[0], -1);
    edMatricula.Text      := msElegivel.ValoresChave[1];
    edNome.Text           := msElegivel.ValoresChave[2];
  end;
  bbTnConfirmar.Enabled   := trim(edMatricula.Text) <> '';
end;

procedure TfrmPRelHisFuncionalMT.bbtnConfirmarClick(Sender: TObject);
var DataRef, DataManut : TDateTime;
begin
  inherited;
  try
    if (edMatricula.Text = '') Then
    Begin
      MsgDlg('Escolha uma Matrícula','Erro',mtError,[mbOk,mbHelp],0);
      edMatricula.SetFocus;
      ModalResult := mrNone;
      exit;
    end;
     CdsAux.Close;
     CdsAux.Data := CtrlTempoServicoLocal.BuscaMatricula(edMatricula.Text);

    if cdsAux.IsEmpty Then
    Begin
       MsgDlg('Matrícula não encontrada','Erro',mtError,[mbOk,mbHelp],0);
       edMatricula.SetFocus;
       ModalResult := mrNone;
       exit;
    end;

    IdPessoa     := CdsAux.FieldByName('IDPESSOA').AsInteger;
    edNome.Text  := CdsAux.FieldByName('NOME').AsString;

    if (not CtrlTempoServicoLocal.TemTempoAberto(idpessoa)) and (dtSimula.Date > Date) then
    begin
      showMessage('Não é permitido a simulação com data futura se todos os tempos de serviço estiverem fechados.');
      exit;
    end;


     try
       // passar os parametros do relatorio*****
      cmp_padrao.ParamByName('IDPESSOA').Value        := CdsAux.FieldByName('IDPESSOA').AsInteger;

      if trim(dtSimula.Text) <> '' then
        cmp_padrao.ParamByName('SDATAREF').AsString     := formatDateTime('dd/mm/yyyy', strToDate(dtSimula.Text))
      else
        cmp_padrao.ParamByName('SDATAREF').AsString   := '';

      cmp_padrao.ParamByName('SNOME').AsString        := CdsAux.FieldByName('NOME').AsString;

// início andre tavares  - 08/03/2004
      if trim(dtSimula.Text) <> '' then
        cmp_padrao.ParamByName('SDATATEMPO').AsString   := formatDateTime('dd/mm/yyyy', strToDate(dtSimula.Text))
      else
        cmp_padrao.ParamByName('SDATATEMPO').AsString   := '';
// FIM andre tavares  - 08/03/2004

    //***
    if trim(cmp_padrao.ParamByName('SDATAREF').asString) <> '' then
      dataRef := strToDate(cmp_padrao.ParamByName('SDATAREF').asString)
    else
      dataRef := 0;

    if trim(cmp_padrao.ParamByName('SDATATEMPO').asString) <> '' then
      dataManut := strToDate(cmp_padrao.ParamByName('SDATATEMPO').asString)
    else
      dataManut := 0;


// inicio André Tavares - 08/03/04
    except showMessage('Parâmetros do Relatório Inválidos!');
    end;
// fim André Tavares - 08/03/04
  Finally
  end
end;

procedure TfrmPRelHisFuncionalMT.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  // Voltar tempo de servico para hoje
  CtrlTempoServicoLocal.Free;
  inherited;
end;

procedure TfrmPRelHisFuncionalMT.FormCreate(Sender: TObject);
begin
  inherited;
  edMatricula.Text := '';
  IdPessoa         := 0;
  edNome.Text      := StringOfChar(' ',80);

  CtrlTempoServicoLocal := TCtrlTempoServico.Create;
  CtrlTempoServicoLocal.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);

end;

procedure TfrmPRelHisFuncionalMT.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TfrmPRelHisFuncionalMT.FormShow(Sender: TObject);
begin
  inherited;
  dtReferencia.Text := formatDateTime('dd/mm/yyyy', date);
  dtSimula.Text     := formatDateTime('dd/mm/yyyy', date);
  bbtnConfirmar.Enabled := false;
end;

end.
