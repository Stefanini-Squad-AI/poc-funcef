//******************************************************************************
// Alterações:
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : ExecutaRegra e ExecutaOutraRegraNova
//  Pendencia : SOL 144511 Kintana 952230
//  Descrição : Implementação de funcionalidade que permita retornar o
//  passo de uma regra na tela de Execução de regras na opção Passo a Passo.
//------------------------------------------------------------------------------
// 10/11/00 - Alexandre Ramos
//   Novo LayOut
//   Opção para parar em um determinado passo
//******************************************************************************
unit Fpassoapasso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, MAHlpBtn,
  TB97Tlbr, TB97, AxCtrls, OleCtrls, vcf1;

type
  TOperacao = (opVoltar, OpProsseguir, OpNada);
  TFrmPassoAPasso = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ednumero: TEdit;
    eddesc: TEdit;
    edtipo: TEdit;
    Edoper1: TEdit;
    edoper2: TEdit;
    edvalor: TEdit;
    Label8: TLabel;
    edresult: TEdit;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    Label9: TLabel;
    edregra: TEdit;
    EdCodigo: TEdit;
    redformula: TRichEdit;
    redvar: TRichEdit;
    redcampos: TRichEdit;
    lblmsg: TLabel;
    BitBtn1: TBitBtn;
    ChkErro: TCheckBox;
    Bevel1: TBevel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    StGrdVariaveis: TStringGrid;
    GroupBox3: TGroupBox;
    RichEdit1: TRichEdit;
    StGrdCampos: TStringGrid;
    BtErroRegra: TSpeedButton;
    Image1: TImage;
    EdProxPasso: TEdit;
    Label2: TLabel;
    PnlUltimo: TPanel;
    Bevel2: TBevel;
    BtPassos: TBitBtn;
    BtSQL: TBitBtn;
    btnVoltar: TBitBtn;
    procedure bbtnSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure StGrdVariaveisDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StGrdCamposDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BtPassosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtSQLClick(Sender: TObject);
    //procedure btnVoltarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Function  DescricaoTipoPasso(IdTipoPasso:Integer):String;
  public
    { Public declarations }
    MudaCor,PaintNextCell :Boolean;
    SQLRegra:String;

  end;

var

  FrmPassoAPasso: TFrmPassoAPasso;
  Operacao      : TOperacao;

implementation
uses uregra, uSistema, FMostraPassos;
{$R *.DFM}

procedure TFrmPassoAPasso.bbtnSairClick(Sender: TObject);
begin
//    close;
end;

Function  TFrmPassoAPasso.DescricaoTipoPasso(IdTipoPasso:Integer):String;
Begin
  Case IdTipoPasso Of
    01: Result := 'Atribuir valor/fórmula à variável';
    02: Result := 'Atribuir valor/fórmula à campo';
    03: Result := 'Comparar variavel com valor/fórmula';
    04: Result := 'Comparar campo com valor/fórmula';
    05: Result := 'Comparar variável com variável';
    06: Result := 'Comparar variável com campo';
    07: Result := 'Comparar campo com variável';
    08: Result := 'Comparar campo com campo';
    09: Result := 'Parar';
    10: Result := 'Input de Valor em uma Variável';
    11: Result := 'Atribuir variável/campo à variável/campo';
    12: Result := 'Sair da regra';
    13: Result := 'Exibe mensagem';
    14: Result := 'Atribuir resultado de regra à variável';
    15: Result := 'Ir para um determinado passo';
  End;
end;

procedure TFrmPassoAPasso.SpeedButton1Click(Sender: TObject);
begin
    showmessage('1-  Atribuir valor/fórmula à variável' +#13+#10+
                '2-  Atribuir valor/fórmula à campo' +#13+#10+
                '3-  Comparar variavel com valor/fórmula' +#13+#10+
                '4-  Comparar campo com valor/fórmula' +#13+#10+
                '5-  Comparar variável com variável' +#13+#10+
                '6-  Comparar variável com campo' +#13+#10+
                '7-  Comparar campo com variável' +#13+#10+
                '8-  Comparar campo com campo' +#13+#10+
                '9-  Parar a Regra atual' +#13+#10+
                '10- Input de Valor em uma Variável' +#13+#10+
                '11- Atribuir variável/campo à variável/campo' +#13+#10+
                '12- Finalizar execução da(s) Regra(s)' +#13+#10+
                '13- Exibe mensagem' +#13+#10+
                '14- Atribuir resultado de regra à variável' +#13+#10+
                '15- Ir para um determinado passo');
end;

procedure TFrmPassoAPasso.bbtnConfirmarClick(Sender: TObject);
begin
  Operacao := opProsseguir;  //Fanuel Junior SOL144511 Kintana952230
  close;
end;

procedure TFrmPassoAPasso.bbtnCancelarClick(Sender: TObject);
begin
  SairDaRegra := True;

end;

procedure TFrmPassoAPasso.StGrdVariaveisDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
Var
  T:Integer;
begin
//  If PaintNextCell = True Then Begin
//    StGrdVariaveis.Canvas.TextRect(Rect,Rect.left+2,Rect.Top+2,StGrdVariaveis.Cells[Col,Row]);
//    PaintNextCell:=False;
//  End;

// Pinta as Células com as variaveis que estão sendo usadas na Fórmulas
  T:=Pos(UpperCase(StGrdVariaveis.Cells[Col,Row]),UpperCase(RedFormula.Text));
  If (T<>0) And (Col = 0) Then Begin
    StGrdVariaveis.Canvas.Font.Color:= ClBlue;
    StGrdVariaveis.Canvas.Font.Style:=[FsBold];
    StGrdVariaveis.Canvas.TextRect(Rect,Rect.left+2,Rect.Top+2,StGrdVariaveis.Cells[Col,Row]);
  End;
end;

procedure TFrmPassoAPasso.StGrdCamposDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
Var
  T:Integer;
begin
// Pinta as Células com os Campos que estão sendo usados na Fórmulas
  T:=Pos(UpperCase(StGrdCampos.Cells[Col,Row]),UpperCase(RedFormula.Text));
  If (T<>0) And (Col = 0) Then Begin
    StGrdCampos.Canvas.Font.Color:= ClBlue;
    StGrdCampos.Canvas.Font.Style:=[FsBold];
    StGrdCampos.Canvas.TextRect(Rect,Rect.left+2,Rect.Top+2,StGrdCampos.Cells[Col,Row]);
  End;
end;

procedure TFrmPassoAPasso.FormShow(Sender: TObject);
Var
  I:Integer;
begin
  
  EdTipo.Hint := DescricaoTipoPasso(StrToInt(EdTipo.Text));
  For I := 0 To Sistema.VersaoDPL.Count-1 Do Begin
    If Sistema.NomeDPL[I] = 'Componente Regra' Then
      Caption := Caption + ' - V.' + Sistema.VersaoDPL[I];
  End;
// Cria Formulario de Passo a Passo
  If MostraPassos = True Then Begin
    FrmMostraPassos.IdStrRegra       := EdCodigo.Text;
    FrmMostraPassos.CodStrPassoAtual := EdNumero.Text;
    MostraPassos := True;
    FrmMostraPassos.Show;
  End;
end;
//******************************************************************************
// Mostra o Formulario com os Passos da Regra
procedure TFrmPassoAPasso.BtPassosClick(Sender: TObject);
begin
// Cria Formulario de Exibissao dos Passos
  Application.CreateForm(tFrmMostraPassos,FrmMostraPassos);
// Preenche os Dados da Regra Atual
  FrmMostraPassos.TipoInformacao   := 'P'; // Passos
  FrmMostraPassos.IdStrRegra       := EdCodigo.Text;
  FrmMostraPassos.CodStrPassoAtual := EdNumero.Text;
  MostraPassos := True;
//  BtPassos.Enabled := False;
  FrmMostraPassos.Show;
end;

procedure TFrmPassoAPasso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Libera Formulario de Exibissao dos Passos
  If MostraPassos = True Then Begin
    FrmMostraPassos.Free;
    MostraPassos := False;
    BtPassos.Enabled := True;
  End;

end;

procedure TFrmPassoAPasso.BtSQLClick(Sender: TObject);
begin
// Cria Formulario de Exibissao dos Passos
  Application.CreateForm(tFrmMostraPassos,FrmMostraPassos);
// Preenche os Dados da Regra Atual
  FrmMostraPassos.TipoInformacao   := 'Q'; // Qry de Entrada
  FrmMostraPassos.SQL              := SQLRegra;
  FrmMostraPassos.IdStrRegra       := EdCodigo.Text;
  FrmMostraPassos.CodStrPassoAtual := EdNumero.Text;
  MostraPassos := True;
  FrmMostraPassos.Show;
end;

//Fanuel Junior SOL144511 Kintana952230
{procedure TFrmPassoAPasso.btnVoltarClick(Sender: TObject);
begin
   Operacao := opVoltar;
   Close;
end; }

//Fanuel Junior SOL144511 Kintana952230
procedure TFrmPassoAPasso.BitBtn2Click(Sender: TObject);
begin
 Operacao := opVoltar;
 Close;
end;

end.
