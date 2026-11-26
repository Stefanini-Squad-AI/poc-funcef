{==============================================================================}
{ Alterações:                                                                  }
{------------------------------------------------------------------------------}
//  Autor     : Daniel Begnami
//  Pendencia : SOL 124589 KINTANA 633500
//  Descrição : A Variável não esta sendo carregada no Grid para Regras Mult-Tier
//------------------------------------------------------------------------------
{ 10/11/00 - Alexandre Ramos                                                   }
{   Novo LayOut                                                                }
{   Opção para parar em um determinado passo                                   }
{==============================================================================}
unit FPassoaPassoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, MAHlpBtn,
  TB97Tlbr, TB97, uCtrlRegra, Db, DBClient;

type
  TFrmPassoAPassoMT = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdNumPasso: TEdit;
    EdDescPasso: TEdit;
    EdTipoPasso: TEdit;
    EdOper1: TEdit;
    EdOper2: TEdit;
    EdValor: TEdit;
    Label8: TLabel;
    EdResultado: TEdit;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    Label9: TLabel;
    EdNomeRegra: TEdit;
    EdNumRegra: TEdit;
    EdFormula: TRichEdit;
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
    CdsLocal: TClientDataSet;
    DsLocal: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure StGrdVariaveisDrawCell(Sender: TObject; Col, Row: Integer;
                                     Rect: TRect; State: TGridDrawState);
    procedure StGrdCamposDrawCell(Sender: TObject; Col, Row: Integer;
                                  Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BtPassosClick(Sender: TObject);
    procedure BtSQLClick(Sender: TObject);
  private
    { Private declarations }
    Function DescricaoTipoPasso(IdTipoPasso:Integer):String;
    Function OrdernaTabela(Lista:TStringList;
                           sNomeCampo,sValorCampo:String):TStringList;
    Procedure PreencheTela;
  public
    { Public declarations }
    RegraLocal : TCtrlRegra;
    MudaCor,PaintNextCell :Boolean;
    SQLRegra : String;
    Resultado : TModalResult; 
  end;

  Function OrdenaLista          (Lista:TStringList):TStringList;

var
  FrmPassoAPassoMT: TFrmPassoAPassoMT;

implementation
uses uSistema, FMostraPassosMT;
{$R *.DFM}

Function  TFrmPassoAPassoMT.DescricaoTipoPasso(IdTipoPasso:Integer):String;
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
    16: Result := 'Gravar na Memória de Calculo';
  End;

end;

procedure TFrmPassoAPassoMT.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage('1 -  Atribuir valor/fórmula à variável'         +#13+#10+
              '2 -  Atribuir valor/fórmula à campo'            +#13+#10+
              '3 -  Comparar variavel com valor/fórmula'       +#13+#10+
              '4 -  Comparar campo com valor/fórmula'          +#13+#10+
              '5 -  Comparar variável com variável'            +#13+#10+
              '6 -  Comparar variável com campo'               +#13+#10+
              '7 -  Comparar campo com variável'               +#13+#10+
              '8 -  Comparar campo com campo'                  +#13+#10+
              '9 -  Parar'                                     +#13+#10+
              '10 - Input de Valor em uma Variável'            +#13+#10+
              '11 - Atribuir variável/campo à variável/campo'  +#13+#10+
              '12 - Sair da regra'                             +#13+#10+
              '13 - Exibe mensagem'                            +#13+#10+
              '14 - Atribuir resultado de regra à variável'    +#13+#10+
              '15 - Ir para um determinado passo'              +#13+#10+
              '16 - Gravar na memória de Cálculo');
end;

procedure TFrmPassoAPassoMT.bbtnConfirmarClick(Sender: TObject);
begin
  Resultado := mrOk;
  Close;
end;

procedure TFrmPassoAPassoMT.bbtnCancelarClick(Sender: TObject);
begin
  { Não mostra mais a Tela de Depuração }
  RegraLocal.PassoaPasso := False;
  Resultado := mrCancel;
end;

procedure TFrmPassoAPassoMT.StGrdVariaveisDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
Var
  T:Integer;
  Caracteres : String;
begin
  Caracteres := '{[(,';
  { Pinta as Células com as variaveis que estão sendo usadas na Fórmulas } 
  T:=Pos(UpperCase(StGrdVariaveis.Cells[Col,Row]),UpperCase(EdFormula.Text));
  If (T<>0) And (Col = 0) Then Begin
    If Pos(EdFormula.Text[T-1], Caracteres) <> 0 Then Begin
      StGrdVariaveis.Canvas.Font.Color:= ClBlue;
      StGrdVariaveis.Canvas.Font.Style:=[FsBold];
      StGrdVariaveis.Canvas.TextRect(Rect,Rect.left+2,Rect.Top+2,StGrdVariaveis.Cells[Col,Row]);
    End;
  End;
end;

procedure TFrmPassoAPassoMT.StGrdCamposDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
Var
  T:Integer;
  Caracteres : String;
begin
  Caracteres := '{[(,';
  { Pinta as Células com os Campos que estão sendo usados na Fórmulas }
  T:=Pos(UpperCase(StGrdCampos.Cells[Col,Row]),UpperCase(EdFormula.Text));
  If (T<>0) And (Col = 0) Then Begin
    If Pos(EdFormula.Text[T-1], Caracteres) <> 0 Then Begin
      StGrdCampos.Canvas.Font.Color:= ClBlue;
      StGrdCampos.Canvas.Font.Style:=[FsBold];
      StGrdCampos.Canvas.TextRect(Rect,Rect.left+2,Rect.Top+2,StGrdCampos.Cells[Col,Row]);
    End;
  End;
end;

procedure TFrmPassoAPassoMT.FormShow(Sender: TObject);
Var
  I:Integer;
begin
  { Preenche a Tela com os dados da Regra }
  PreencheTela;
end;

procedure TFrmPassoAPassoMT.BtPassosClick(Sender: TObject);
begin
  { Cria Formulario de Exibissao dos Passos }
  Application.CreateForm(tFrmMostraPassosMT,FrmMostraPassosMT);
  { Preenche os Dados da Regra Atual }
  FrmMostraPassosMT.TipoInformacao   := 'P'; { Passos }
  FrmMostraPassosMT.IdStrRegra       := EdNumRegra.Text;
  FrmMostraPassosMT.CodStrPassoAtual := EdNumPasso.Text;
  FrmMostraPassosMT.CdsLocal.Data := RegraLocal.BuscaPassos(StrToInt(EdNumRegra.Text));

  FrmMostraPassosMT.Show;

end;

procedure TFrmPassoAPassoMT.BtSQLClick(Sender: TObject);
begin
  { Cria Formulario de Exibissao dos Passos }
  Application.CreateForm(tFrmMostraPassosMT,FrmMostraPassosMT);
  { Preenche os Dados da Regra Atual }
  FrmMostraPassosMT.TipoInformacao   := 'Q'; { Dados da Regra } 
  FrmMostraPassosMT.SQL              := SQLRegra;
  FrmMostraPassosMT.IdStrRegra       := EdNumRegra.Text;
  FrmMostraPassosMT.CodStrPassoAtual := EdNumPasso.Text;

  FrmMostraPassosMT.CdsLocal.Data := RegraLocal.ClientDataSetIn.Data;

  FrmMostraPassosMT.Show;
end;


{==============================================================================}
{ Exibe o Fomulario com o os dados do Passo da Regra sendo executado           }
Procedure TFrmPassoAPassoMT.PreencheTela;
Var
  I, J, Tam : Integer;
  Caracteres : String;
  Lista : TStringList;
begin
  CdsLocal.Data :=RegraLocal.RecuperaDadosRegra( StrToInt(RegraLocal.RuleNumber) );

  If CdsLocal.IsEmpty = True Then Begin
    Exit;
  End;

  Lista := TStringList.Create;

  { Preenche Componentes do Formulario }
  EdNumRegra.Text  := CdsLocal.FieldByName('IDREGRA').AsString;
  EdNomeRegra.Text := CdsLocal.FieldByName('NOMEREGRA').AsString;
  EdNumPasso.Text  := CdsLocal.FieldByName('IDPASSOATUAL').AsString;
  EdDescPasso.Text := CdsLocal.FieldByName('DESCRICAOPASSOATUAL').AsString;
  EdTipoPasso.Text := CdsLocal.FieldByName('TIPOPASSOATUAL').AsString;
  EdTipoPasso.Hint := DescricaoTipoPasso(CdsLocal.FieldByName('TIPOPASSOATUAL').AsInteger);

  EdOper1.Text     :=  CdsLocal.FieldByName('IDCAMPO').AsString;
  EdValor.Text     :=  CdsLocal.FieldByName('VALOR').AsString;
  EdFormula.Text   :=  CdsLocal.FieldByName('EXPRESSAOFORMULA').AsString;

  If (CdsLocal.FieldByName('TIPOPASSOATUAL').AsString = '16') Then Begin
    EdOper2.Text     :=  CdsLocal.FieldByName('RESULTADO').AsString;
    EdResultado.Text :=  'Gravação OK';
  End Else Begin
    EdOper2.Text     :=  CdsLocal.FieldByName('IDCAMPO2').AsString;
    EdResultado.Text :=  CdsLocal.FieldByName('RESULTADO').AsString;
  End;

  {----------------------------------------------------------------------------}
  { Preenche Grid com as Variaveis utilizadas e seus Valores                   }

  { Zera Grids e Campos }
  StGrdVariaveis.RowCount := 2;
  StGrdCampos.RowCount    := 2;
  LblMsg.Caption          :='';

  { Preenche Cabeçalhos }
  StGrdVariaveis.Cells[0,0]:= 'VARIAVEIS';
  StGrdVariaveis.Cells[1,0]:= 'VALORES';
  Caracteres := '{[(,';

  { Orderna lista de variaveis }
  OrdernaTabela(Lista, 'NOMEVARIAVEIS','CONTEUDOVARIAVEIS');

  { Loop nas 500 variaveis possiveis de estar em memoria }
  { Caso Exista valor na Variavel }
  For I:=1 To (Lista.Count) Do Begin                              // SOL:124589 - Daniel Begnami
    If CdsLocal.FieldByName('NOMEVARIAVEIS['+IntToStr(I)+']').AsString = '' Then Continue;
    { Preenche grid com os dados das variaveis }

    StGrdVariaveis.Cells[0,I]:= Lista.Names[I-1];                 // SOL:124589 - Daniel Begnami
    StGrdVariaveis.Cells[1,I]:= Lista.Values[Lista.Names[I-1]];   // SOL:124589 - Daniel Begnami

    { Adiciona nova Linha }
    StGrdVariaveis.RowCount := (StGrdVariaveis.RowCount+1);

    { Altera as Cores do Texto da Formulas }
    J:=Pos(UpperCase(RegraLocal.aTabvariaveis[I,1]),UpperCase(EdFormula.text));
    If (J <> 0)  Then Begin
      Tam:=Length(RegraLocal.aTabVariaveis[I,1]);
      EdFormula.SelStart := J-1;
      EdFormula.SelLength:= Tam;
      EdFormula.SelAttributes.Color:=ClBlue;
      EdFormula.SelStart := 0;
      EdFormula.SelLength:= 0;
      LblMsg.Caption     := 'Os parâmetros em azul utilizarão os valores das tabelas abaixo.';
    End;

  End; { For I:= }

  {----------------------------------------------------------------------------}
  { Preenche Grid com os Campos utilizados e seus Valores                      }

  { Preenche Cabeçalhos }
  StGrdCampos.Cells[0,0]:= 'CAMPOS';
  StGrdCampos.Cells[1,0]:= 'VALORES';

  For I:=0 to RegraLocal.ClientDataSetIn.FieldCount-1 do begin
    { Preenche grid com os dados dos Campos }
    StGrdCampos.Cells[0,I+1]:= RegraLocal.ClientDataSetIn.Fields[I].FieldName;
    StGrdCampos.Cells[1,I+1]:= RegraLocal.ClientDataSetIn.FieldByName(RegraLocal.ClientDataSetIn.Fields[I].FieldName).AsString;
    { Adiciona nova Linha }
    StGrdCampos.RowCount := (StGrdCampos.RowCount+1);

    { Altera as Cores do Texto da Formulas }
    J:=Pos(UpperCase(RegraLocal.ClientDataSetIn.Fields[I].FieldName), UpperCase(EdFormula.Text));
    If J <> 0 Then Begin
      If Pos(EdFormula.Text[J-1], Caracteres) <> 0 Then Begin
        Tam := Length(RegraLocal.ClientDataSetIn.Fields[I].FieldName);
        EdFormula.SelStart := J-1;
        EdFormula.SelLength:= Tam;
        EdFormula.SelAttributes.Color:= ClBlue;
        EdFormula.SelStart := 0;
        EdFormula.SelLength:= 0;
        LblMsg.Caption     := 'Os parâmetros em azul utilizarão os valores das tabelas abaixo.';
      End;
    End;
  End;

  FreeAndNil(Lista);

  end; { PreencheTela }

Function TFrmPassoAPassoMT.OrdernaTabela(Lista:TStringList;
                                         sNomeCampo,sValorCampo : String):TStringList;
Var
  I : Integer;
begin
  For I:=1 To 499 Do Begin
    If CdsLocal.FieldByName(sNomeCampo+'['+IntToStr(I)+']').AsString = '' Then Break;
    Lista.Add(CdsLocal.FieldByName(sNomeCampo+'['+IntToStr(I)+']').AsString +'='+
              CdsLocal.FieldByName(sValorCampo+'['+IntToStr(I)+']').AsString);
  End; { For I:= }
  Lista := OrdenaLista(Lista);
  Result := Lista;
end;

//******************************************************************************
// Ordena uma Lista
Function OrdenaLista(Lista:TStringList):TStringList;
Var
 I,Z:Integer;
 GuardaItem:String;
Begin
// Inicia Ordenacao
  For I:= 0 To (Lista.Count-1) Do Begin
    For Z := 0 To ((Lista.Count-(I+1))-1) Do Begin
// Caso o Proximo Item maior que o atual
      If Lista.Strings[Z] > Lista.Strings[Z+1] Then Begin
// Guarda o Item
        GuardaItem         := Lista.Strings[Z];
// Puxa o Proximo
        Lista.Strings[Z]   := Lista.Strings[Z+1];
// Adianta o Atual
        Lista.Strings[Z+1] := GuardaItem;
      End;
    End;
  End;
// Gera Resultado
  Result :=Lista;
End;



end.