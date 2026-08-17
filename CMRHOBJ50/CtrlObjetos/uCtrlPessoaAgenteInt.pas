//******************************************************************************
//Rotina......: VerificaEstagiario
//Nº SIG......: 59723
//Responsável.: André Imakawa
//Descrição...: Join da verificação do IDAGENTEINT esta sendo feita pelo campo
//              errado.
//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da control
//Responsável: Felipe A. Santos
//Descrição: criação da ctrl para gerenciar os negócios dos agentes de integração.
//******************************************************************************

unit uCtrlPessoaAgenteInt;

interface

uses uCtrlCustomRH, uCMTypes, SysUtils, uDbAgenteIntegracao;

type

    TCtrlPessoaAgenteInt = class(TCtrlCustomPessoaRH)
    private
     sSQL : string;
     FDbAgenteInt : TDbAgenteIntegracao;
    protected
     procedure DoChangeDatabase; override;
     function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; override;
    public
      constructor Create; override;
      destructor Destroy; override;

      function VerificaEstagiario(Idpessoa: String): OleVariant;
      function ListAgenteInt(Idpessoa : Double) : OleVariant;
    end;

implementation

{ TCtrlPessoaAgenteInt }

constructor TCtrlPessoaAgenteInt.Create;
begin
  inherited;
  FDbAgenteInt := TDbAgenteIntegracao.Create(Self);
end;

destructor TCtrlPessoaAgenteInt.Destroy;
begin
  FreeAndNil(FDbAgenteInt);
  inherited;

end;

procedure TCtrlPessoaAgenteInt.DoChangeDatabase;
begin
  inherited;
  FDbAgenteInt.DataBaseName := DataBaseName;
end;

function TCtrlPessoaAgenteInt.ListAgenteInt(Idpessoa: Double): OleVariant;
begin
  sSQL := 'SELECT * FROM AGENTEINT WHERE IDPESSOA = ' + FloatToStr(Idpessoa);
  Result := GetDataPacket(sSQL);
end;

function TCtrlPessoaAgenteInt.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
  try
     if (Operacao = opApagar) then
     begin
       CdsSubTipo.Delete;
       Result := ApplyCds(CdsSubTipo, FDbAgenteInt, [] , []);

       if not(Result) then
          raise Exception.Create(FDbAgenteInt.MessageInfo);
     end
     else
     begin
       Result := ApplyCds(CdsSubTipo, FDbAgenteInt, [_DbPessoa.Idpessoa], [FDbAgenteInt.IdPessoa]);

       if not(Result) then
          raise Exception.Create(FDbAgenteInt.MessageInfo);
     end;
  except
    on e : exception do
    begin
      Result := False;

      if Pos('FK_ESTAGIARIO_AI', e.Message) > 0 then
         Mensagem := 'Não é possível excluir o Agente de Integração, pois está vinculada a um estagiário.'
      else
         Mensagem := e.Message;
    end;
  end;
end;

//Início -  Willam Santana SOL 229871.16137 PPM 407073
function TCtrlPessoaAgenteInt.VerificaEstagiario(Idpessoa: String): OleVariant;
begin

  //sSQL := 'SELECT 1 FROM ESTAGIARIO E, AGENTEINT A WHERE E.IDESTAGIARIO = A.IDAGENTEINT  ' + // Andre Imakawa - SIG 59723
  sSQL := 'SELECT 1 FROM ESTAGIARIO E, AGENTEINT A WHERE E.IDAGENTEINT = A.IDAGENTEINT  ' +    // Andre Imakawa - SIG 59723
          ' AND A.IDPESSOA = ' + QuotedStr(Idpessoa);
  Result := GetDataPacket(sSQL);
 
end;
//Término -  Willam Santana SOL 229871.16137 PPM 407073

end.
