//------------------------------------------------------------------
// Sistema  .: -
// Objetivo .: Testes no Componente REGRA
// Form     .: FrmTestesRegra/ FTestesRegra
// Data     .: 27/10/2000
// Autor    .: Alexandre Ramos
//------------------------------------------------------------------
unit FTestesRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, ExtCtrls,
  Grids, DBGrids;

type
  TFrmTestesRegra = class(TForm)
    EdRegra: TEdit;
    Label1: TLabel;
    QryRegra: TwwQuery;
    DsRegra: TwwDataSource;
    DbLkcRegra: TwwDBLookupCombo;
    Label2: TLabel;
    MemoQuery: TMemo;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    EdLoops: TEdit;
    Label4: TLabel;
    BtExec: TBitBtn;
    BitBtn1: TBitBtn;
    PnlMem: TPanel;
    QryExecute: TwwQuery;
    Timer1: TTimer;
    PnlInicio: TPanel;
    PnlFim: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtExecClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdRegraExit(Sender: TObject);
    procedure DbLkcRegraExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure QryRegraAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    NumRegra:String;
    
  end;

var
  FrmTestesRegra: TFrmTestesRegra;

implementation

{$R *.DFM}


Uses URegra;


procedure TFrmTestesRegra.FormShow(Sender: TObject);
begin
  QryRegra.Open;
end;

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
  I:Integer;
  Regra:TRegra;
begin
  Try
// Cria Objetos Locais
    Regra := TRegra.Create(Self);

// Preenche Dados da regra a ser Testada
    Regra.RuleName  := NumRegra;
    QryExecute.Sql.Clear;
    QryExecute.Sql.Add(MemoQuery.Text);
    QryExecute.Open;
    Regra.QueryIn   := QryExecute;

// Preecnhe tamanho da Memoria
   Mem.dwLength:= SizeOf(TMemoryStatus);
   GlobalMemoryStatus(Mem);
   PnlInicio.Caption := ' Inicio .: '+FormatFloat('#,###" KB"', Mem.dwAvailPhys  Div 1024);
   PnlInicio.Update;

// Loop para verificar evolução da memória
    For I := 1 to StrToInt(EdLoops.Text) Do Begin
// Executa Regra
      Regra.Execute;
// Mostra Numero de Loops Executador
      EdLoops.Text := IntToStr(I);
// Processa as Mensagens do SO
      Application.ProcessMessages;
    End;

  Finally
    Regra.Free;
    GlobalMemoryStatus(Mem);
    PnlFim.Caption := ' Final .: '+FormatFloat('#,###" KB"', Mem.dwAvailPhys  Div 1024);
    PnlFim.Update;
  End;
end;

procedure TFrmTestesRegra.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTestesRegra.EdRegraExit(Sender: TObject);
begin
  If Trim(EdRegra.Text) = '' Then Exit;

// Procura e Preecnhe Combo com a descricao da Regra
  QryRegra.Locate('IDREGRA',StrToInt(EdRegra.Text),[]);
  DbLkcRegra.LookupValue:= EdRegra.Text;
  DbLkcRegra.RefreshDisplay;
  DbLkcRegra.PerformSearch;

// Preenche Numero da Regra que será executada
  NumRegra := EdRegra.Text;

end;

procedure TFrmTestesRegra.DbLkcRegraExit(Sender: TObject);
begin
// Preenche Numero da Regra que será executada
  NumRegra     := DbLkcRegra.LookupValue;
  EdRegra.Text := DbLkcRegra.LookupValue;
end;


procedure TFrmTestesRegra.Timer1Timer(Sender: TObject);
Var
  Mem : TMemoryStatus;
begin
  Mem.dwLength:= SizeOf(TMemoryStatus);
  GlobalMemoryStatus(Mem);
  PnlMem.Caption := ' Memória Disponivel '+FormatFloat('#,###" KB"', Mem.dwAvailPhys  Div 1024);
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



end.
