unit FIdentPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBTables, wwQuery, wwdbdatetimepicker,
  CMDateTimePicker, ExtCtrls;

type
  TfrmIdentPessoal = class(TfrmOkCancelar)
    Panel1: TPanel;
    edSobrenome: TEdit;
    edCPF: TEdit;
    EdDataNasc: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edMatric: TEdit;
    qryPessoa: TwwQuery;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image5: TImage;
    cmbEstCivil: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Vezes: integer;
  public
    { Public declarations }
  end;

var
  frmIdentPessoal: TfrmIdentPessoal;

implementation

uses uMensErro, uUsoPessoal;

const
  EstCivil: array [0..6] of char = ('S','C','D','J','E','V','O');

{$R *.DFM}

procedure TfrmIdentPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  cmbEstCivil.ItemIndex := 0;
end;

procedure TfrmIdentPessoal.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;

  if (Trim(edSobrenome.Text) = '') or (Trim(edMatric.Text) = '') or (Trim(edCPF.Text) = '') or
     (Trim(edDataNasc.Text)  = '') then
  begin
    MsgDlg('Por Favor, Preencha Todas as Informações Solicitadas !',
           'Atenção',mtinformation,[mbOk],0);
    exit;
  end;

  edSobrenome.Text := trim(edSobrenome.Text);
  edMatric.Text    := trim(edMatric.Text);
  edCPF.Text       := trim(edCPF.Text);

  qryPessoa.Close;
  qryPessoa.SQL.Clear;
  qryPessoa.SQL.Add(
    'SELECT PESSOA.NOME,PESSOA.IDPESSOA             ' +
    'FROM PESSOA,PESSOAFISICA,FUNCIONARIO, SITFUNC  ' +
    'WHERE FUNCIONARIO.IDPESSOA          = PESSOA.IDPESSOA   ' +
    '  AND PESSOAFISICA.IDPESSOA         = PESSOA.IDPESSOA   ' +
    '  AND FUNCIONARIO.IDSITFUNC         = SITFUNC.IDSITFUNC ' +
    '  AND SITFUNC.TIPOSIT              <> ''D''            ' +
    '  AND rtrim(upper(PESSOA.NOME)) like ''% ' + edSobrenome.Text + '''' +
    '  AND PESSOA.NUMDOCUMENTO           = ''' + edCpf.Text    + '''' +
    '  AND upper(FUNCIONARIO.MATRICULA)  = ''' + edMatric.Text + '''' +
    '  AND PESSOAFISICA.DATANASC         = to_date(''' + edDataNasc.Text + ''',''dd/mm/yyyy'')  ' +
    '  AND PESSOAFISICA.ESTCIVIL         = ''' + EstCivil[cmbEstCivil.ItemIndex] + '''');

  qryPessoa.Open;
  if (qryPessoa.IsEmpty) then
  begin
    Inc(Vezes);

    if (Vezes = 4) then
    begin
      MsgDlg('Atingido o Limite de Tentativas: Acesso Negado. Tecle OK para Sair',
             'Aviso',mtinformation,[mbOk],0);
      ModalResult := mrCancel;
      exit;
    end;

    MsgDlg('Dados Insuficientes ou Incorretos Para Sua Identificação. Corrija',
           'Atenção',mtinformation,[mbOk],0);
    exit;
  end;

  UsoPessoal.ChavePessoa := qryPessoa.FieldByName('IDPESSOA').asInteger;
  ModalResult := mrOk;
end;

end.
