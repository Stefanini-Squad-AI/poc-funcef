unit fLerCodProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  ColorListBox;

type
  TfrmLerCodProvento = class(TfrmOkCancelar)
    edCodProvDesc: TEdit;
    lblEmpresa: TLabel;
    lblProvento: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edDescrProvDesc: TEdit;
    chkbxVisivel: TCheckBox;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkbxVisivelClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    FRubSel: TColorListBox;
    FIdProvento: double;
    bOk, FAssociar, FVisivel: boolean;
    FCodProvDesc, FDescrProvDesc, FTipoRubrica, FDescricao: string;

    procedure CodJaExiste;
  public
    constructor Create(AOwner: TComponent; RubSel: TColorListBox); reintroduce;
    function ExibirForm(ExibirBtAbortar, Associar, Visivel: boolean; NomeEmpresa, DescProvDesc,
      CodProvDesc, TipoRubrica, Descricao: string; IdProvento: double): TModalResult;

    property IdProvento: double read FIdProvento write FIdProvento;
    property CodProvDesc: string read FCodProvDesc write FCodProvDesc;
    property Descricao: string read FDescricao write FDescricao;
    property DescrProvDesc: string read FDescrProvDesc write FDescrProvDesc;
    property TipoRubrica: string read FTipoRubrica write FTipoRubrica;
    property Visivel: boolean read FVisivel write FVisivel;
  end;

var
  frmLerCodProvento: TfrmLerCodProvento;

implementation

uses uMensErro, uCtrlFuncoesRH;

{$R *.DFM}

constructor TfrmLerCodProvento.Create(AOwner: TComponent; RubSel: TColorListBox);
begin
  inherited Create(AOwner);
  FRubSel := RubSel;
end;

procedure TfrmLerCodProvento.FormShow(Sender: TObject);
begin
  inherited;
  edCodProvDesc.SetFocus;
end;

procedure TfrmLerCodProvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited; - > NAO EXECUTAR O CAFREE
end;

procedure TfrmLerCodProvento.chkbxVisivelClick(Sender: TObject);
begin
  if (chkbxVisivel.Checked) then
    chkbxVisivel.Font.Color := clNavy
  else
    chkbxVisivel.Font.Color := clTeal;
end;

procedure TfrmLerCodProvento.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(edCodProvDesc.Text) = '') then
  begin
    MsgDlg('Preencha o Código da Rubrica.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
    edCodProvDesc.SetFocus;
    exit;
  end;

  if (Trim(edDescrProvDesc.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição da Rubrica.', 'Aviso', mtWarning, [mbOK,mbHelp], 0);
    edDescrProvDesc.SetFocus;
    exit;
  end;

  CodJaExiste;
  if (bOk) then
  begin
    FVisivel := chkbxVisivel.Checked;
    FCodProvDesc := edCodProvDesc.Text;
    FDescrProvDesc := edDescrProvDesc.Text;
    ModalResult := mrOk;
  end;
end;

procedure TfrmLerCodProvento.bbtnCancelarClick(Sender: TObject);
begin
  bOk := true;
  ModalResult := mrCancel;
end;

procedure TfrmLerCodProvento.bbtnSairClick(Sender: TObject);
begin
  bOk := true;
  ModalResult := mrAbort;
end;

function TfrmLerCodProvento.ExibirForm(ExibirBtAbortar, Associar, Visivel: boolean;
  NomeEmpresa, DescProvDesc, CodProvDesc, TipoRubrica, Descricao: string;
  IdProvento: double): TModalResult;
begin
  FTipoRubrica := TipoRubrica;
  FDescricao := Descricao;
  FIdProvento := IdProvento;
  FVisivel := Visivel;

  chkbxVisivel.Checked := Visivel;
  lblEmpresa.Caption := NomeEmpresa;
  lblProvento.Caption := 'Rubrica '+ Descricao +' - ('+ FloatToStr(IdProvento) +')';
  edCodProvDesc.Text := CodProvDesc;
  edDescrProvDesc.Text := DescProvDesc;
  bbtnSair.Visible := ExibirBtAbortar;
  FAssociar := Associar;

  chkbxVisivelClick(nil);

  repeat
    Result := ShowModal;
  until (bOk);
end;

procedure TfrmLerCodProvento.CodJaExiste;
var
  iPos: integer;
begin
  if Assigned(FRubSel) then
    iPos := FRubSel.IndexOfField(edCodProvDesc.Text, 1)
  else
    iPos := -1;

  if (FAssociar) and (iPos > -1) or
     (not(FAssociar) and (iPos > -1) and (FRubSel.ItemIndex <> iPos)) then
  begin
    bOk := false;
    MsgDlg('O Código digitado já está sendo usado nesta Empresa para a'+CR_LF+
           'Rubrica: '+FRubSel.GetFieldItem(FRubSel.IndexOfField(edCodProvDesc.Text, 1),0),
           'Aviso', mtWarning, [mbOK,mbHelp], 0);
  end
  else
    bOk := true;
end;

end.
