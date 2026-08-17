unit fCriaRubrica;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs,uctrlfuncoesrh,
  FSairAjuda, StdCtrls, ExtCtrls, IvDictio, IvMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
   uCtrlProvDesc, IvEMulti;

type
  TfrmCriaRubrica = class(TfrmSairAjuda)
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label17: TLabel;
    edCodigo: TEdit;
    Label18: TLabel;
    edDescricao: TEdit;
    rgDestino: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FExibeRepousoRemun: boolean;
  public
    CtrlProvDesc: TCtrlProvDesc;

    constructor Create(AOwner: TComponent; ExibeRepousoRemun: boolean); reintroduce;  
  end;

var
  frmCriaRubrica: TfrmCriaRubrica;

implementation

uses uMensErro, uSistema, uCtrlPadroes, fAguarde;

{$R *.dfm}

constructor TfrmCriaRubrica.Create(AOwner: TComponent; ExibeRepousoRemun: boolean);
begin
  inherited Create(AOwner);
  FExibeRepousoRemun := ExibeRepousoRemun;
  with (rgDestino.Items) do
  begin
    Clear;
    Add(fu.CMTranslate('Atrasos'));
    Add(fu.CMTranslate('Extras Diurnas'));
    Add(fu.CMTranslate('Extras Noturnas'));
    Add(fu.CMTranslate('Extraordinárias'));
    Add(fu.CMTranslate('Adicional Noturno'));
    if (FExibeRepousoRemun) then
      Add(fu.CMTranslate('Repouso Remunerado'));
    Add(fu.CMTranslate('Faltas'));
    Add(fu.CMTranslate('Faltas Abonadas'));
  end;
end;

procedure TfrmCriaRubrica.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);
end;

procedure TfrmCriaRubrica.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlProvDesc);
  inherited;
end;

procedure TfrmCriaRubrica.FormShow(Sender: TObject);
begin
  inherited;
  edCodigo.Text := '';
  edDescricao.Text := '';
  edCodigo.SetFocus;
end;

procedure TfrmCriaRubrica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmCriaRubrica.bbtnConfirmarClick(Sender: TObject);
const
  CodCLT_ComRepousoRemun: array[0..7] of string = (
    '50002', '40520', '40530', '40540', '40004', '00003', '00001', '00006');
  CodCLT_SemRepousoRemun: array[0..6] of string = (
    '50002', '40520', '40530', '40540', '40004', '00001', '00006');
var
  bOk: boolean;
begin
  if (edCodigo.Text = '') or (edDescricao.Text = '') or (rgDestino.ItemIndex = -1) then
  begin
    MsgDlg(fu.CMTranslate('Complemente os Dados para Criar a Nova Rubrica'), fu.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  frmAguarde.Mostra(fu.CMTranslate('Criando Rubrica...'));
  if (FExibeRepousoRemun) then
    bOk := CtrlProvDesc.GravarProventoMaisRubrica(Sistema.IdEmpresa, edCodigo.Text,
      edDescricao.Text, CodCLT_ComRepousoRemun[rgDestino.ItemIndex])
  else
    bOk := CtrlProvDesc.GravarProventoMaisRubrica(Sistema.IdEmpresa, edCodigo.Text,
      edDescricao.Text, CodCLT_SemRepousoRemun[rgDestino.ItemIndex]);
  frmAguarde.Apaga;

  if not(bOk) then
    MsgDlg(fu.CMTranslate('Não Foi Possível Criar a Nova Rubrica'), fu.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
end;

end.
