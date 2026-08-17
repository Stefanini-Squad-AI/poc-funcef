unit DRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDmRegra = class(TDataModule)
    QryBuscaRegra: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//------------------------------------------------------------------------------
// Funcoes Publicas

// Busca os Dados de Uma Regra
  Function BuscaDadosRegra(IdRegra:Integer):Boolean;

var
  DmRegra: TDmRegra;

implementation

{$R *.DFM}


//******************************************************************************
// Busca os Dados de Uma Regra (Posiciona a QryBuscaRegra)
Function BuscaDadosRegra(IdRegra:Integer):Boolean;
Begin
  Result := False;

// Testa Dados
  If IdRegra = 0 Then Exit;

// Pepara os Dados, Preenche Parametro da Consulta e Abre
  With DmRegra.QryBuscaRegra Do Begin
    Close;
    ParamByName('IDREGRA').AsInteger := IdRegra;
    Open;

// Caso Retorne dados Seta Resultado Positivo
    If Not IsEmpty Then Begin
      Result := True;
    End;
  End;

End;

end.
