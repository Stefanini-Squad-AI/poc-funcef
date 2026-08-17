unit FExecutaQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ComCtrls, Grids, DBGrids;

type
  TfrmExecutaQuery = class(TForm)
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    QryConsulta: TQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    dsConsulta: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QryConsultaEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure executaQuery;
  public
    { Public declarations }
  end;

var
  frmExecutaQuery: TfrmExecutaQuery;

implementation

uses uCalculoTabuaServico;

{$R *.DFM}

procedure TfrmExecutaQuery.BitBtn1Click(Sender: TObject);
begin
  if Trim(Memo1.Text) = '' then
    MessageDlg('Informe alguma consulta.', mtWarning, [mbOk], 0);

  QryConsulta.Close;
  QryConsulta.SQL.Clear;
  QryConsulta.SQL.AddStrings(Memo1.Lines);
  if pos('SELECT', AnsiUpperCase(Memo1.Text)) > 0 then
   begin
     PageControl1.ActivePageIndex := 1;
     QryConsulta.Open;
   end
  else
    executaQuery;
end;

procedure TfrmExecutaQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryConsulta.Close;
end;

procedure TfrmExecutaQuery.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmExecutaQuery.executaQuery;
var
  lstConsultas: TStrings;
  i: Integer;
begin
  Try
    lstConsultas := TStringList.Create;

    ExtractStrings([';'], [' '], PChar(Memo1.Lines.Text), lstConsultas);

    for i := 0 to lstConsultas.Count - 1 do
     begin
       QryConsulta.SQL.Clear;
       QryConsulta.SQL.Add(lstConsultas.Strings[i]);
       Try
         QryConsulta.ExecSQL;
       Except on E: Exception do
        begin
          MessageDlg('Erro ao executar a consulta: ' + E.Message, mtWarning, [mbOk], 0);
          Continue;
        end;  
       End;
     end;
  Finally
    FreeAndNil(lstConsultas);
  End;
end;

procedure TfrmExecutaQuery.QryConsultaEditError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort; 
end;

procedure TfrmExecutaQuery.FormDblClick(Sender: TObject);
begin
  inicializaTabuaPensao(5);
  Tabua_Servico[10][0].sNO_VARIAVEL[0]:= 'R';
end;

end.
