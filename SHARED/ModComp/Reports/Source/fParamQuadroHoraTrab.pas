unit fParamQuadroHoraTrab;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs,
  fSelPessoalMT, DB, Wwdatsrc, DBClient, uCMClientDataSet, CmParamReport, IvDictio, IvMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Spin, TEdNum, ComCtrls,  CheckLst, uctrlselpessoal,
  ColorCheckListBox, uCmSqlParams, IvEMulti;

type
  TfrmParamQuadroHoraTrab = class(TfrmSelPessoalMT)
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamQuadroHoraTrab: TfrmParamQuadroHoraTrab;

implementation

uses fAguarde, uCtrlFuncoesRH;

{$R *.dfm}

procedure TfrmParamQuadroHoraTrab.FormCreate(Sender: TObject);
begin
  inherited;
  IrPaginaResult := false;

  cmbSequencia.Items.Clear;
  cmbSequencia.Items.Add('Nome');
  cmbSequencia.Items.Add('Matrícula');
  cmbSequencia.Items.Add('Cargo, Nome');
  cmbSequencia.Items.Add('Cargo, Matrícula');
  cmbSequencia.ItemIndex := 0;
end;

procedure TfrmParamQuadroHoraTrab.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFunc: string;
begin
  frmAguarde.Mostra(fu.CMTranslate('Quadro de Horários de Trabalho'));
  frmAguarde.Pos := 0;

  inherited;
  if (CdsPrincipal.IsEmpty) then
  begin
    MessageDlg(fu.CMTranslate('Não há dados a serem exibidos com os parâmetros indicados.') +CR_LF+
               fu.CMTranslate('Refaça a seleção dos mesmos para a correta impressão do relatório.'),
               mtInformation, [mbOK, mbHelp], 0);
    frmAguarde.Apaga;
    ModalResult := mrNone;
    exit;
  end;

  sListaIdFunc := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFunc = '') then
      sListaIdFunc := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFunc := sListaIdFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFunc;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbSequencia.ItemIndex;
end;

end.
