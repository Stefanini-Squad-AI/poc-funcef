//------------------------------------------------------------------------------
// Sistema  .: -
// Objetivo .: Testes no Componente REGRA
// Form     .: FrmTestesRegra/ FTestesRegra
// Data     .: 27/10/2000
// Autor    .: Alexandre Ramos  **--> Serious Developer ..
//------------------------------------------------------------------------------
unit FTestesRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, ExtCtrls,
  Grids, DBGrids, Menus, ComCtrls, DBClient, uCMClientDataSet, uRegraMT;

type

//******************************************************************************
// Formulario de Testes de Regra
  TFrmTestesRegra = class(TForm)
    QryRegra: TwwQuery;
    DsRegra: TwwDataSource;
    QryExecute: TwwQuery;
    Timer1: TTimer;
    MnLista: TPopupMenu;
    Excluir1: TMenuItem;
    LimparTodas1: TMenuItem;
    N1: TMenuItem;
    QryAux: TwwQuery;
    UpdRegra: TUpdateSQL;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    BtAddLista: TSpeedButton;
    EdRegra: TEdit;
    DbLkcRegra: TwwDBLookupCombo;
    MemoQuery: TMemo;
    EdLoops: TEdit;
    LsBxRegra: TListBox;
    pnlBottom: TPanel;
    BtExec: TBitBtn;
    BtSair: TBitBtn;
    grpMemoria: TGroupBox;
    Label6: TLabel;
    PnlTotalMem: TPanel;
    PnlMem: TPanel;
    PnlInicio: TPanel;
    PnlFim: TPanel;
    grpTempo: TGroupBox;
    pnlInicioHora: TPanel;
    pnlFimHora: TPanel;
    ChkBx3C: TCheckBox;
    cdsRegra: TCMClientDataSet;
    Label7: TLabel;
    lblResultado: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtExecClick(Sender: TObject);
    procedure EdRegraExit(Sender: TObject);
    procedure DbLkcRegraExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure QryRegraAfterScroll(DataSet: TDataSet);
    procedure BtAddListaClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure LimparTodas1Click(Sender: TObject);
    procedure EdRegraKeyPress(Sender: TObject; var Key: Char);
    procedure BtSairClick(Sender: TObject);
  private

  public
    { Public declarations }
    NumRegra:String;
    TimerMem : TMemoryStatus;

  end;
var
  FrmTestesRegra: TFrmTestesRegra;

implementation

{$R *.DFM}


Uses URegra, UBiblioteca, FMostraPassos, uSistema;


procedure TFrmTestesRegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryRegra.Close;
end;


//******************************************************************************
// Executa os Testes
procedure TFrmTestesRegra.BtExecClick(Sender: TObject);
Var
  Mem : TMemoryStatus;
  J,I:Integer;
  Regra:TRegra;
  RegraMT: TRegraMT;
  HeapStatus : THeapStatus;
begin
  lblResultado.Caption := '';
  Label4.Caption:= 'Numero de Loops '+EdLoops.Text;


  Try
    // Limpa Dados
    Pnlinicio.Caption:='';
    PnlFim.Caption   :='';
    PnlinicioHora.Caption:='';
    PnlFimHora.Caption   :='';
    // Preecnhe tamanho da Memoria
    Mem.dwLength:= SizeOf(TMemoryStatus);
    GlobalMemoryStatus(Mem);
    PnlInicio.Caption := 'Inicio .: '+FormatFloat('#,###" KB"', Mem.dwAvailPageFile  Div 1024);
    PnlInicioHora.Caption := 'Inicio .: ' + FormatDateTime( 'hh:mm:ss', Now );
    PnlInicio.Update;
    PnlInicioHora.Update;

    { Grava No Log }
    GlobalMemoryStatus(Mem);

    // Cria Objetos Locais
    Regra   := TRegra.Create(Self);

    { Grava No Log }
    GlobalMemoryStatus(Mem);
    HeapStatus := GetHeapStatus;

    QryExecute.Close;
    QryExecute.Sql.Clear;
    QryExecute.Sql.Add(MemoQuery.Text);
    
    If Not ChkBx3C.Checked then
      QryExecute.Open;

    if ChkBx3C.Checked then begin
      RegraMT := TRegraMT.Create(Self);
      RegraMT.RuleNumber   := NumRegra;
      RegraMT.QueryIn      := QryExecute;
      RegraMT.CopiaDataSet;  { Copia o dataset para o Regra }
      RegraMT.IdEmpresa    := Sistema.IdEmpresa;
      RegraMT.DatabaseName := 'BaseDados';
    end;

    if not ChkBx3C.Checked then begin
      Regra.RuleName     := NumRegra;
      Regra.QueryIn      := QryExecute;
      Regra.DatabaseName := 'BaseDados';
    end;

    // Loop para verificar evolução da memória
    For I := 1 to StrToInt(EdLoops.Text) Do Begin
      If LsBxRegra.Items.Count > 0 Then Begin
        For J := 0 To (LsBxRegra.Items.Count-1) Do Begin
          try

            // Pega Nova Regra
            if not ChkBx3C.Checked then
              Regra.RuleName  := LsBxRegra.Items[J]
            else
              RegraMT.RuleNumber  := LsBxRegra.Items[J];

            // Executa Varias Regras
            Try
              if not ChkBx3C.Checked then
              begin
                Regra.Execute;
                lblResultado.Caption := Regra.Result;
              end
              else
              begin
                RegraMT.Execute;
                lblResultado.Caption := RegraMT.Result;
              end;
            Except
              if not ChkBx3C.Checked then
                ShowMessage( 'Erro na Regra ' + Regra.RuleName )
              else
                ShowMessage( 'Erro na Regra ' + RegraMT.RuleNumber );
              Exit;
            End;

          finally
            if not ChkBx3C.Checked then RegraMT.Free;
          end;

        End;
      End Else Begin
        // Executa Unica Regra
        if not ChkBx3C.Checked then
        begin
          Regra.Execute;
          lblResultado.Caption := Regra.Result;
        end else begin
          RegraMT.Execute;
          lblResultado.Caption := RegraMT.Result;
        end;
        // Mostra Numero de Loops Executador
        EdLoops.Text := IntToStr(I);
      End;
      // Processa as Mensagens do SO
      Application.ProcessMessages;
      // Mostra Numero de Loops Executador
      EdLoops.Text := IntToStr(I);
    End;

    { Grava No Log }
    GlobalMemoryStatus(Mem);
  Finally
    GlobalMemoryStatus(Mem);
    PnlFim.Caption := ' Final .: '+FormatFloat('#,###" KB"', Mem.dwAvailPageFile  Div 1024);
    PnlFimHora.Caption := 'Final  .: ' + FormatDateTime( 'hh:mm:ss', Now );
    PnlFim.Update;
    PnlFimHora.Update;

    Regra.Free;
    Regra := NIL;
    RegraMT.Free;
    RegraMT := NIL;
    { Grava No Log }
    GlobalMemoryStatus(Mem);
    HeapStatus := GetHeapStatus;

  End;
  Label4.Caption:= 'Numero de Loops ';
  Beep;
end;

procedure TFrmTestesRegra.EdRegraExit(Sender: TObject);
begin
  If Trim(EdRegra.Text) = '' Then Begin
    FazQuery( QryRegra,'SELECT R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA ' +
                       'FROM   REGRA R, TIPOREGRA T            '+
                       'WHERE  R.IDTIPOREGRA = T.IDTIPOREGRA   ');
    Exit;
  End;

  { Procura e Preecnhe Combo com a descricao da Regra } 
  If FazQuery( QryRegra,'SELECT R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA ' +
                        'FROM   REGRA R, TIPOREGRA T                           '+
                        'WHERE  R.IDTIPOREGRA = T.IDTIPOREGRA    AND           '+
                        'IDREGRA = '+QuotedStr(EdRegra.Text) )
  Then Begin
    DbLkcRegra.LookupValue := EdRegra.Text;
    DbLkcRegra.RefreshDisplay;
    DbLkcRegra.PerformSearch;

    { Preenche Numero da Regra que será executada }
    NumRegra := EdRegra.Text;
  End;
  
  DbLkcRegra.Text := QryRegra.FieldByName('NOMEREGRA').AsString;
end;

procedure TFrmTestesRegra.DbLkcRegraExit(Sender: TObject);
begin
// Preenche Numero da Regra que será executada
  NumRegra     := DbLkcRegra.LookupValue;
  EdRegra.Text := DbLkcRegra.LookupValue;
end;


procedure TFrmTestesRegra.Timer1Timer(Sender: TObject);
begin
  TimerMem.dwLength:= SizeOf(TMemoryStatus);
  GlobalMemoryStatus(TimerMem);
  PnlTotalMem.Caption := ' Memória Total '+FormatFloat('#,###" KB"', TimerMem.dwTotalPageFile  Div 1024);
  PnlMem.Caption      := ' Memória Disponivel '+FormatFloat('#,###" KB"', TimerMem.dwAvailPageFile  Div 1024);
  PnlMem.Update;
// Processa as Mensagens do SO
  Application.ProcessMessages;
end;


procedure TFrmTestesRegra.QryRegraAfterScroll(DataSet: TDataSet);
begin
  // Procura e Preecnhe memo com o SQL da Regra
  MemoQuery.Lines.Clear;
  MemoQuery.Lines.Add(QryRegra.FieldByName('SQLREGRA').AsString) ;
end;


procedure TFrmTestesRegra.BtAddListaClick(Sender: TObject);
begin
  LsBxRegra.Items.Add(EdRegra.Text);
  EdRegra.SelectAll;
end;

procedure TFrmTestesRegra.Excluir1Click(Sender: TObject);
begin
  LsBxRegra.Items.Delete(LsBxRegra.ItemIndex);
end;

procedure TFrmTestesRegra.LimparTodas1Click(Sender: TObject);
begin
  LsBxRegra.Clear;
end;

procedure TFrmTestesRegra.EdRegraKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = '+' Then Begin
    Key := #0;
    BtAddListaClick(Self);
  End;
end;

procedure TFrmTestesRegra.BtSairClick(Sender: TObject);
begin
  Close;
end;

end.