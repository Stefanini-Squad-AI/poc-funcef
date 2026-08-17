//******************************************************************************
// Alterações:
//------------------------------------------------------------------------------
// 12/07/2006 - ClaudioR
//        Importar tabua de serviço e de pensão para os cálculos atuarias
// 27/06/2006 - Alexandre Ramos
//        Possibilidade de se utilizar um arquivo CDS para alimentar a regra
// 07/02/2006 - Alexandre Ramos
//        Possibilidade de se utilizar um arquivo CDS para alimentar a regra
// 07/11/00 - Alexandre Ramos
//   Novo LayOut e Tipo de Pesquisa:
//        Digitando o Numero da regra ele Busca Automáticamente
// 08/11/00 - Alexandre Ramos
//   Possibilidade de se guardar o SQL executado no Tipo de regra,
//   com Botao Direito do Mouse no memo de SQL entre outras opcoes de Texto
//******************************************************************************
unit fExecutaRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, uSistema, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  URegra, Menus, uRegraMT, uTiposRegraMT, ShellAPI, ComCtrls,RichEdit,
  wwriched, Grids, Wwdbigrd, Wwdbgrid, DBClient, fTelaAut;

type
  TfrmExecutaRegra = class(TfrmSairAjuda)
    Panel2: TPanel;
    Label9: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TEdit;
    btnConsultar: TBitBtn;
    btnDebugar: TBitBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    Label6: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    chkErroRegra: TCheckBox;
    edtResultRegra: TEdit;
    MontaSelect1: TMontaSelect;
    Qry: TwwQuery;
    btnLimpar: TBitBtn;
    Bevel1: TBevel;
    EdCalculo: TEdit;
    QryRegra: TwwQuery;
    QryRegraIDREGRA: TFloatField;
    QryRegraNOMEREGRA: TStringField;
    QryRegraIDTIPOREGRA: TFloatField;
    QryRegraSQLREGRA: TMemoField;
    QryRegraDESCREGRA: TStringField;
    UpdateSQL1: TUpdateSQL;
    edtTipo: TPanel;
    edtNome: TPanel;
    PopMnuOpcoes: TPopupMenu;
    GravarSQLdaRegra: TMenuItem;
    QryAux: TwwQuery;
    Label1: TLabel;
    Panel3: TPanel;
    BtOkRegra: TSpeedButton;
    BtErroRegra: TSpeedButton;
    ChkBxGravaCalculo: TCheckBox;
    N1: TMenuItem;
    Copiar1: TMenuItem;
    Colar1: TMenuItem;
    Apagar1: TMenuItem;
    N2: TMenuItem;
    SelecionarTudo1: TMenuItem;
    ChkBxCarregaRegra: TCheckBox;
    btnExecutar: TBitBtn;
    ChkBx3C: TCheckBox;
    RegraMT: TRegraMT;
    Regra: TRegra;
    PgCtrlDados: TPageControl;
    TbsSQL: TTabSheet;
    TbsCDS: TTabSheet;
    memSql: TMemo;
    Editor: TwwDBRichEdit;
    SpeedButton1: TSpeedButton;
    DbGrdCds: TwwDBGrid;
    PnlArquivo: TPanel;
    FileOpen: TOpenDialog;
    DsCdsDados: TDataSource;
    CdsDados: TClientDataSet;
    BtnApagaArquivo: TSpeedButton;
    ChkCarregaTabua: TCheckBox;
    procedure btnConsultarClick(Sender: TObject);
    function AbreQry : Boolean;
    procedure btnExecutarClick(Sender: TObject);
    procedure btnDebugarClick(Sender: TObject);
    procedure TrataErros(sender:tobject;e:exception);
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure EdCalculoChange(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GravarSQLdaRegraClick(Sender: TObject);
    procedure memSqlKeyPress(Sender: TObject; var Key: Char);
    procedure Apagar1Click(Sender: TObject);
    procedure Colar1Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure SelecionarTudo1Click(Sender: TObject);
    procedure EditorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PgCtrlDadosChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ChkBx3CClick(Sender: TObject);
    procedure BtnApagaArquivoClick(Sender: TObject);
    procedure ChkCarregaTabuaClick(Sender: TObject);
  private
    { Private declarations }
    IdTipoRegra:String;

    Procedure UpdateCursorPos;
    Function  EhPalavraReservada(Palavra : String): Boolean;

  public
    { Public declarations }
  end;

var
  FrmExecutaRegra: TfrmExecutaRegra;

implementation

uses uMensErro, UBiblioteca, FMostraPassos, Clipbrd, FCarregaTabua;

{$R *.DFM}

procedure TfrmExecutaRegra.btnConsultarClick(Sender: TObject);
begin
  inherited;

  MontaSelect1.Executar;
  edtNumero.Text  := '';
  edtNome.Caption := '';
  edtTipo.Caption := '';
  memSql.Text     := '';

  if MontaSelect1.RetornouValor then begin
    edtNumero.Text  := MontaSelect1.ValoresChave[0];
    edtNome.Caption := ' '+MontaSelect1.ValoresChave[1];
    edtTipo.Caption := ' '+MontaSelect1.ValoresChave[2];
    memSql.Text     := MontaSelect1.ValoresChave[3];
    IdTipoRegra     := MontaSelect1.ValoresChave[4];
  end;

end;

function TfrmExecutaRegra.AbreQry : Boolean;
begin
  Result := True;
  with Qry do begin
    Close;
    Sql.Clear;
    Sql.Add(memSql.Text);
    try
      { Caso esteja executando em 3 camadas, não precisa }
      { abrir a Query, pois o componente irá abrir.      }
      If ChkBx3C.Checked = False Then Begin
        Open;
      End;
    except
      On E:Exception do begin
        Result := false;
        MsgDlg('Erro da execução da consulta de entrada.'+#13+
               'Mensagem : '+#13+
               E.Message  ,'Erro',mtError,[mbOk],0);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmExecutaRegra.btnExecutarClick(Sender: TObject);
begin
  { Acerta Botoes }
  BtOkRegra.Visible   := False;
  BtErroRegra.Visible := False;

  inherited;
  { Caso Campo Vazio sai Fora }
  If Trim(edtNumero.Text) = '' Then Exit;

  { Caso SQL Vazio Sai Fora }
  If PgCtrlDados.ActivePage = TbsSQL Then If Trim(memSql.Text) = '' Then Exit;

  { * }
  If AbreQry then begin
    { Executa Regra em 2 Camadas }
    If ChkBx3C.Checked = False Then Begin
      Regra.RuleNumber      := EdtNumero.Text;
      Regra.IdEmpresa       := Sistema.IdEmpresa;
      Regra.IdCalculo       := 0;
      Regra.FlgGravaCalculo := ChkBxGravaCalculo.Checked;
      Regra.FlgReloadRule   := ChkBxCarregaRegra.Checked;
      //Regra.ExibeMensagens  := True;

      If Sistema.TipoEmpresa = 'P' Then Begin
        Regra.TipoCliente      := uregra.tcFundacao;
      End Else Begin
        Regra.TipoCliente      := uregra.tcOutros;
      End;

      { Importa tabua de serviço e pensão }
      If FrmCarregaTabua <> Nil Then
         RegraMT.CarregaTabuasServico( FrmCarregaTabua.iTabMasculino,
                                       FrmCarregaTabua.iTabFeminino,
                                       FrmCarregaTabua.iTabPensao );

      Regra.Execute; { Executa a Regra }

      edtResultRegra.Text := Regra.Result;
      { Acerta Botoes que indicam Erro ou nao na execucao da Regra }
      BtOkRegra.Visible   := Not Regra.Error;
      BtErroRegra.Visible :=     Regra.Error;
      EdCalculo.Text      := IntToStr(Regra.IdCalculo);
    End Else Begin

      If PgCtrlDados.ActivePage = TbsSQL Then Begin
        Qry.Open;
        If Qry.IsEmpty Then Begin
          MsgDlg('Consulta de entrada não possui registros.',
                 'Mensagem do Regra', mtError, [MbOk], 0);
          Exit;
        End;
        { Fecha Query de entrada, será aberta pelo componente }
        Qry.Close;
      End;

      { Executa Regra em 3 Camadas }
      RegraMT.IdCalculo    := 0;
      RegraMT.RuleNumber   := EdtNumero.Text;
      RegraMT.IdEmpresa    := Sistema.IdEmpresa;
      RegraMT.GravaCalculo := ChkBxGravaCalculo.Checked;
      RegraMT.ReloadRule   := ChkBxCarregaRegra.Checked;

      If Sistema.TipoEmpresa = 'P' Then Begin
        RegraMT.TipoCliente      := tcFundacao;
      End Else Begin
        RegraMT.TipoCliente      := tcOutros;
      End;

      RegraMT.PassoaPasso  := False;

      If PgCtrlDados.ActivePage = TbsSQL Then
        RegraMT.CopiaDataSet                 { Copia o dataset (Qry) para o Regra }
      Else
        RegraMT.CopiaData( CdsDados.Data );  { Copia o dados (DATA) para o Regra }

      { Importa tabua de serviço e pensão }
      If FrmCarregaTabua <> Nil Then
         RegraMT.CarregaTabuasServico( FrmCarregaTabua.iTabMasculino,
                                       FrmCarregaTabua.iTabFeminino,
                                       FrmCarregaTabua.iTabPensao );
                                       
      RegraMT.Execute;       { Executa a Regra }

      EdtResultRegra.Text := RegraMT.Result;
      { Acerta Botoes que indicam Erro ou nao na execucao da Regra }
      BtOkRegra.Visible   := Not RegraMT.Error;
      BtErroRegra.Visible :=     RegraMT.Error;
      EdCalculo.Text      := IntToStr(RegraMT.IdCalculo);
    End;
  End;
end;

procedure TfrmExecutaRegra.btnDebugarClick(Sender: TObject);
begin
  { Acerta Botoes }
  BtOkRegra.Visible   := False;
  BtErroRegra.Visible := False;

  inherited;
  { Caso Campo Vazio sai Fora }
  If Trim(edtNumero.Text) = '' Then Exit;

  { Caso SQL Vazio Sai Fora }
  If PgCtrlDados.ActivePage = TbsSQL Then If Trim(memSql.Text) = '' Then Exit;

  { * }
  If AbreQry then begin
    { Executa Regra em 2 Camadas }
    If ChkBx3C.Checked = False Then Begin
      Regra.IdCalculo := 0;
      Regra.RuleName  := EdtNumero.Text;
      Regra.IdEmpresa := Sistema.IdEmpresa;
      Regra.FlgGravaCalculo := ChkBxGravaCalculo.Checked;
      Regra.FlgReloadRule   := ChkBxCarregaRegra.Checked;
      If Sistema.TipoEmpresa = 'P' Then Begin
        Regra.TipoCliente      := uregra.tcFundacao;
      End Else Begin
        Regra.TipoCliente      := uregra.tcOutros;
      End;

      Regra.PassoaPasso; { Debuga a Regra }

      edtResultRegra.Text := Regra.Result;
      { Acerta Botoes que indicam Erro ou nao na execucao da Regra }
      BtOkRegra.Visible   := Not Regra.Error;
      BtErroRegra.Visible :=     Regra.Error;
      EdCalculo.Text      := IntToStr(Regra.IdCalculo);
    End Else Begin
      If PgCtrlDados.ActivePage = TbsSQL Then Begin
        Qry.Open;
        If Qry.IsEmpty Then Begin
          MsgDlg('Consulta de entrada não possui registros.',
                 'Mensagem do Regra', mtError, [MbOk], 0);
          Exit;
        End;
        { Fecha Query de entrada, será aberta pelo componente }
        Qry.Close;
      End;

      { Executa Regra em 3 Camadas }
      RegraMT.RuleNumber   := EdtNumero.Text;
      RegraMT.IdEmpresa    := Sistema.IdEmpresa;
      Regra.IdCalculo      := 0;
      RegraMT.GravaCalculo := ChkBxGravaCalculo.Checked;
      RegraMT.ReloadRule   := ChkBxCarregaRegra.Checked;

      If Sistema.TipoEmpresa = 'P' Then Begin
        RegraMT.TipoCliente      := tcFundacao;
      End Else Begin
        RegraMT.TipoCliente      := tcOutros;
      End;

      { Debuga a Regra }
      RegraMT.PassoaPasso  := True;

      If PgCtrlDados.ActivePage = TbsSQL Then
        RegraMT.CopiaDataSet                 { Copia o dataset (Qry) para o Regra }
      Else
        RegraMT.CopiaData( CdsDados.Data );  { Copia o dados (DATA) para o Regra }

      RegraMT.Execute;

      EdtResultRegra.Text := RegraMT.Result;

      { Acerta Botoes que indicam Erro ou nao na execucao da Regra }
      BtOkRegra.Visible   := Not RegraMT.Error;
      BtErroRegra.Visible :=     RegraMT.Error;
      EdCalculo.Text      := IntToStr(RegraMT.IdCalculo);
    End;
  End;

  MostraPassos := False;
end;

procedure TfrmExecutaRegra.trataerros(sender:tobject;e:exception);
begin
  MsgDlg('Erro durante a execução da regra com a mensagem: '+ e.message,'Atenção',mterror,[mbok],0);
  Screen.Cursor:=CrDefault;
end;

procedure TfrmExecutaRegra.FormShow(Sender: TObject);
begin
  inherited;
  QryRegra.Open;
  edtNumero.SetFocus;

  TbsCDS.TabVisible      := False;
  PgCtrlDados.ActivePage := TbsSQL

end;

procedure TfrmExecutaRegra.btnLimparClick(Sender: TObject);
begin
  // Acerta Botoes
  BtOkRegra.Visible   := False;
  BtErroRegra.Visible := False;

  inherited;

  { 2C }
  Regra.Free;

  Regra := TRegra.Create(Self);

  Regra.DatabaseName   := 'BaseDados';
  Regra.DataRef        := '';
  Regra.DistinctFields := '';
  Regra.GrpHipotese    := '';
  Regra.IdCalculo      := 0;
  Regra.IdEmpresa      := 0;
  Regra.ParamOut       := '';
  Regra.QueryIn        := Qry;
  Regra.QueryOut       := Nil;
  Regra.RuleName       := '';
  Regra.TabBiometrica  := '';

  { 3C }
  RegraMT.Free;
  RegraMT := TRegraMT.Create( Self );

  RegraMT.DatabaseName     := 'BaseDados';
  RegraMT.QueryIn          := Qry;
  RegraMT.IdCalculo        := 0;
  RegraMT.RuleNumber       := '0';
  RegraMT.IdEmpresa        := Sistema.IdEmpresa;
  RegraMT.GravaCalculo     := False;
  RegraMT.ReloadRule       := False;

  { Tela }
  EdCalculo.Text := '';


end;

procedure TfrmExecutaRegra.EdCalculoChange(Sender: TObject);
begin
  inherited;
  try
    Regra.IdCalculo := StrtoInt(edCalculo.Text);
  except
    Regra.IdCalculo := 0;
  end;
end;

procedure TfrmExecutaRegra.edtNumeroExit(Sender: TObject);
begin
  inherited;
  // Caso Campo Vazio sai Fora
  If Trim(edtNumero.Text) = '' Then Exit;

  If bbtnSair.Focused Then Exit;

  // Limpa Campos da Tela
  edtNome.Caption := '';
  edtTipo.Caption := '';
  memSql.Text     := '';

  CdsDados.Close;
  PnlArquivo.Caption := '';

  // Procura e Preenche a tela com os dados da Regra caso exista.
  If FazQuery( QryRegra,'SELECT R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA ' +
                        'FROM   REGRA R, TIPOREGRA T                           '+
                        'WHERE  R.IDTIPOREGRA = T.IDTIPOREGRA    AND           '+
                        'IDREGRA = '+edtNumero.Text )
  Then Begin
    edtNome.Caption:= ' '+Qryregra.FieldByName('NOMEREGRA').AsString;
    edtTipo.Caption:= ' '+Qryregra.FieldByName('DESCREGRA').AsString;
    memSql.Text    := Qryregra.FieldByName('SQLREGRA').AsString;
    IdTipoRegra    := Qryregra.FieldByName('IDTIPOREGRA').AsString;
  End Else Begin
    ShowMessage('Regra não Encontrada!');
    EdtNumero.SetFocus;
    QryRegra.Close;
    QryRegra.Open;
  End;

  // Esconde os Botoes de Controle de Erro
  BtOkRegra.Visible   := False;
  BtErroRegra.Visible := False;
end;



procedure TfrmExecutaRegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryRegra.Close;

end;

//******************************************************************************
// Grava o SQL da Regra no Tipo de Regra
procedure TfrmExecutaRegra.GravarSQLdaRegraClick(Sender: TObject);
begin
  inherited;
  // Caso SQL Vazio Sai Fora
  If Trim(memSql.Text) =   '' Then Exit;

  // Guarda o SQL no Tipo de Regra
  If QryRegra.Locate('IDREGRA',StrToInt(edtNumero.Text),[]) Then Begin
    QryRegra.Edit;
    QryRegra.FieldByName('SQLREGRA').AsString := memSql.Lines.GetText;
    QryRegra.ApplyUpdates;
    QryRegra.CommitUpdates;
    // Reabre a Query de Regra
    QryRegra.Close;
    QryRegra.Open;
  End;

end;

//******************************************************************************
// Transforma Teclas Digitadas em maiusculo
procedure TfrmExecutaRegra.memSqlKeyPress(Sender: TObject; var Key: Char);
Var
  Tecla:String;
begin
  inherited;
  // Transforma Teclas para Maiusculo
  Tecla:=' ';
  Tecla[1]:=Key;
  Tecla   :=AnsiUpperCase(Tecla);
  Key     :=Tecla[1];
end;

procedure TfrmExecutaRegra.Apagar1Click(Sender: TObject);
begin
  inherited;
  memSql.Clear;
end;

procedure TfrmExecutaRegra.Colar1Click(Sender: TObject);
begin
  inherited;
  // Caso tenha texto no Clipboard, Copia
  memSQL.PasteFromClipboard;
end;

procedure TfrmExecutaRegra.Copiar1Click(Sender: TObject);
begin
  inherited;
  // Copia Texto para o Clipboard
  MemSQL.CopyToClipboard;
end;

procedure TfrmExecutaRegra.SelecionarTudo1Click(Sender: TObject);
begin
  inherited;
  memSql.SelectAll;
end;

(******************************************************************************)

procedure TfrmExecutaRegra.UpdateCursorPos;
var
  CharPos: TPoint;
  I, W, X,
  CaractersToCursorPos, CaractersBeforeLine, LinesBeforeCursor  : Integer;
  Palavra : String;
  Texto : WideString;
begin
  { Guarda dados }
  LinesBeforeCursor := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0, Editor.SelStart);
  W := 1;
  X := 1;
  Texto := Trim(Editor.Lines.GetText);
  { Volta até achar inicio da palavra digitada e a modifica }
  CaractersToCursorPos := (Editor.SelStart+LinesBeforeCursor);

  If (Copy(Editor.Text,(CaractersToCursorPos-1),1) = ' ') Then Exit;

  For  I := (CaractersToCursorPos) DownTo 0 Do Begin
    X := I;
    If (Copy(Editor.Text,I,1) = ' ') Or (I = 0) Or
       (Copy(Editor.Text,I,1) = #13)
    Then Begin
      Palavra := Copy(Editor.Text, X, W);

      If EhPalavraReservada(Trim(Palavra)) Then Begin
        Editor.SelStart  := (X-LinesBeforeCursor);
        Editor.SelLength := (Length( Palavra ));
        Editor.SelAttributes.Color := clRed;
      End Else Begin
        Editor.DefAttributes.Color := clBlack;
        Editor.SelAttributes.Color := clBlack;
      End;

      Editor.SelStart := (CaractersToCursorPos);
      Exit;
    End Else Begin
      Inc(W);
    End;
  End;
  Editor.SelAttributes.Color := clBlack;
end;



function TfrmExecutaRegra.EhPalavraReservada(Palavra: String): Boolean;
Var
  VetPalavraReservada : Array[0..30] Of String;
  I : Integer;
begin
  Result := False;
  { Preenche vetor com as palavras reservadas }
  VetPalavraReservada[0] := 'SELECT'; VetPalavraReservada[1] := 'FROM';
  VetPalavraReservada[2] := 'WHERE';  VetPalavraReservada[3] := 'ORDER';
  VetPalavraReservada[4] := 'BY';     VetPalavraReservada[5] := 'GROUP';
  VetPalavraReservada[6] := 'IN';     VetPalavraReservada[7] := 'EXPLAIN';
  VetPalavraReservada[8] := 'AND';

  For I := 0 To 30 Do Begin
    If VetPalavraReservada[I] = UpperCase(Palavra) Then Begin
      Result := True;
      Exit;
    End;
  End;
end;

(******************************************************************************)

procedure TfrmExecutaRegra.EditorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If (Not (ssShift In Shift)) And (Not (ssAlt In Shift)) And (Not (ssCtrl In Shift)) Then Begin
      UpdateCursorPos;
  End;
end;

procedure TfrmExecutaRegra.PgCtrlDadosChange(Sender: TObject);
begin
  inherited;

  If PgCtrlDados.ActivePage = TbsSQL Then Begin
    memSql.SetFocus;
  End Else Begin

  End;

end;

procedure TfrmExecutaRegra.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  If FileOpen.Execute Then Begin

    CdsDados.LoadFromFile( FileOpen.FileName );

    PnlArquivo.Caption := ' '+FileOpen.FileName;
    
  End;

end;

procedure TfrmExecutaRegra.ChkBx3CClick(Sender: TObject);
begin
  inherited;

  TbsCDS.TabVisible := ChkBx3C.Checked;

end;

procedure TfrmExecutaRegra.BtnApagaArquivoClick(Sender: TObject);
begin
  inherited;

  CdsDados.Close;
  PnlArquivo.Caption := '';

end;

procedure TfrmExecutaRegra.ChkCarregaTabuaClick(Sender: TObject);
begin
   inherited;
   AbrirFormModal(FrmCarregaTabua, tFrmCarregaTabua);
end;

end.     