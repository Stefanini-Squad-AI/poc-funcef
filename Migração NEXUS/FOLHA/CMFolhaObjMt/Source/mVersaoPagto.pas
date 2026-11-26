unit mVersaoPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, StdCtrls, CheckLst;

type
  TmolVersaoPagto = class(TFrame)

    lstVersao     : TCheckListBox;
    sqlVersaoPagto: TCMSqlParams;
    cdsVersaoPagto: TCMClientDataSet;


  private // Private declarations

    FAno          : Integer;
    FMes          : Integer;
    FIDFundacao   : Integer;

    vIDVersao     : array of Integer;
    FListaVersoes : TStringList;

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure SetAno(const Value: Integer);
    procedure SetMes(const Value: Integer);
    procedure SetIDFundacao(const Value: Integer);

    function  PegaVersoes   : String;
    function  ListaVersoes  : TStringList;


  public  // Public declarations

    property Mes          : Integer     read FMes write SetMes;
    property Ano          : Integer     read FAno write SetAno;
    property IDFundacao   : Integer     read FIDFundacao write SetIDFundacao;
    property Versoes      : String      read PegaVersoes;
    property Lista        : TStringList read ListaVersoes;

    procedure Preenche;


  end;



implementation
{$R *.DFM}



{ TmolVersaoPagto }



function TmolVersaoPagto.PegaVersoes: String;
var
   i        : Integer;
   sVersoes : String;
begin
   inherited;

   // concatena a String de Versaos
   for i := 0 to (lstVersao.Items.Count - 1) do
   begin
      if lstVersao.Checked[i] then
      begin
         if sVersoes <> '' then sVersoes := sVersoes + ', ';
         sVersoes := sVersoes + IntToStr(vIDVersao[i]);
      end;
   end;

   Result := sVersoes;
end;



function TmolVersaoPagto.ListaVersoes: TStringList;
var
  i : Integer;
begin
   inherited;

   FListaVersoes.Clear;

   // concatena a String de Versaos
   for i := 0 to (lstVersao.Items.Count - 1) do
   begin
      if lstVersao.Checked[i] then
      begin
        FListaVersoes.Add(IntToStr(vIDVersao[i]));
      end;
   end;

   Result := FListaVersoes;
end;



procedure TmolVersaoPagto.Preenche;
var
  sSQL    : String;
  sMesAno : String;
  i       : Integer;
begin
  sMesAno := QuotedStr(FormatFloat('0000', Ano) + '/' + FormatFloat('00', Mes));

  sSQL    :=
  'SELECT '                                                         + #13 +
  '  IDHSTFOLHABENEF, HISTORICO AS DESCR, '                         + #13 +
  '  IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '             + #13 +
  'FROM '                                                           + #13 +
  '  HSTFOLHABENEF '                                                + #13 +
  'WHERE '                                                          + #13 +
  '      FLGESTADO     <> 2 '                                       + #13 +
  '  AND IDFUNDACAO     = ' + FormatFloat('#0', IDFundacao)         + #13 +
  '  AND MESREFERENCIA  = ' + sMesAno                               + #13 +
  'ORDER BY '                                                       + #13 +
  '  IDHSTFOLHABENEF DESC ';

  // Abre a tabela de versões
  sqlVersaoPagto.SQL.Clear;
  sqlVersaoPagto.SQL.Text := sSQL;
  sqlVersaoPagto.Open;

  // Limpa a Listbox
  lstVersao.Clear;

  // Inicializa o vetor
  i := 0;
  SetLength(vIDVersao, i);

  // Preenche a Listbox e o vetor...
  while not(cdsVersaoPagto.EOF) do
  begin
    lstVersao.Items.Add(cdsVersaoPagto.FieldByName('DESCRICAO').AsString);

    inc(i);
    SetLength(vIDVersao, i);

    vIDVersao[i - 1] := cdsVersaoPagto.FieldByName('IDHSTFOLHABENEF').AsInteger;

    cdsVersaoPagto.Next;
  end;

  cdsVersaoPagto.Close;
end;



procedure TmolVersaoPagto.SetAno(const Value: Integer);
begin
  FAno := Value;
end;

procedure TmolVersaoPagto.SetIDFundacao(const Value: Integer);
begin
  FIDFundacao := Value;
end;

procedure TmolVersaoPagto.SetMes(const Value: Integer);
begin
  FMes := Value;
end;



constructor TmolVersaoPagto.Create(AOwner: TComponent);
begin
  inherited;
  FListaVersoes := TStringList.Create;
end;



destructor TmolVersaoPagto.Destroy;
begin
  FreeAndNil(FListaVersoes);
  inherited;
end;



end.
