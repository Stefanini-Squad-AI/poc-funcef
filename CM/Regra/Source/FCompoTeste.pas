unit FCompoTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables;

type
//******************************************************************************
// TIPOS DEFINIDOS PELO DESENVOLVEDOR

// Tipo Procedure para Evento "OnGetResult" da Classe TCompoTeste
  TOnGetResult = Procedure(Sender:TObject) Of Object;

//******************************************************************************
// COMOPOENTE CRIADO PARA TESTES
  TCompoTeste = Class(TComponent)

// Objetos de Controle
    FQueryIn:TQuery;

  private      { Private declarations }

//-----------------------------------------------------------------------------
// Variaveis de Controle
    FResultado:String;

    FOnGetResult : TOnGetResult; // Evento OnResult


//-----------------------------------------------------------------------------
// Procedimentos Protegidos do Objeto
    Procedure SetResultado(Str:String);
    Procedure SetQueryIn(QueryIn:TQuery);


//-----------------------------------------------------------------------------
// Funcoes Privadas do Objeto
    Function GetResultado:String;

  protected    { Protected declarations }


  public       { Public declarations }

//-----------------------------------------------------------------------------
// Procedimentos Publicos do Objeto
    Procedure Executar;


  published    { Published declarations }

//-----------------------------------------------------------------------------
// Propriedades do Objeto
    Property Resultado:String   Read GetResultado Write SetResultado;

    Property QueryIn  :TQuery   Read FQueryIn   Write SetQueryIn;

//------------------------------------------------------------------------------
// Evento OnGetResult
    Property OnGetResult:TOnGetResult Read FOnGetResult Write FOnGetResult;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TCompoTeste]);
end;

//******************************************************************************
// Metodos do Componente Teste

//******************************************************************************
// Seta Query de Entrada
Procedure TCompoTeste.SetQueryIn(QueryIn:TQuery);
Begin
// Caso parametro vazio
  If QueryIn = NIL Then Begin
// limpa variavel e sai fora
    FQueryIn := NIL;
    Exit;
  End;
// Atribui Parametro a Variavel
  FQueryIn := QueryIn;
End;

//******************************************************************************
// Executa procedimento
Procedure TCompoTeste.Executar;
Var
  X1:String;
Begin
  With FQueryIn Do Begin
// Caso a query não esteja aberta
    If Not Active Then Begin
// Caso esteja em tempo de projeto Igora a mensagem
      If Not (csDesigning in ComponentState) Then Begin
// Mostra mensagem em tempo de execucao
        MessageDlg('Query de entrada deve estar ativa !!!',MtError,[mbOk],0);
        Exit;
      End;
    End;

// Loop Principal
    While Not Eof Do Begin
      X1:=Fields[0].AsString;

// Seta Reultado para o Evento
      SetResultado(Fields[0].AsString);

// Dispara o Evento Antes de Pular para o Proximo Registro
      If Assigned(FOnGetResult) Then Begin
        FOnGetResult(self);
      End;
// Proximo Registro
      Next;
    End;
  End;

End;

//******************************************************************************
// Pega o Resultado para o evento OnGetResult
Function TCompoTeste.GetResultado:String;
Begin
// Pega Resultado
  Result := FResultado;
End;

//******************************************************************************
// Preenche o Resultado para o evento OnGetResult
Procedure TCompoTeste.SetResultado(Str:String);
Begin
// Seta Resultado
  FResultado:=Str;
End;

end.
