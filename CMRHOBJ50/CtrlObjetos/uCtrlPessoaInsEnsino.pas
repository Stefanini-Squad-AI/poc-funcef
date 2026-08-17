//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da control
//Responsável: Felipe A. Santos
//Descrição: criação da ctrl para gerenciar os negócios das instituições de ensino.
//******************************************************************************

unit uCtrlPessoaInsEnsino;

interface

uses uCtrlCustomRH, SysUtils, uCMTypes, uDbInstituicaoEnsino;

type
   TCtrlPessoaInsEnsino = class(TCtrlCustomPessoaRH)
   private
     sSQL : string;
     FDbInstituicaoEnsino : TDbInstituicaoEnsino;

   protected
     procedure DoChangeDatabase; override;
     function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; override;
   public
     constructor Create; override;
     destructor Destroy; override;
     function ListInsEnsino(IdPessoa : Double) : OleVariant;
     function VerificaEstagiario(Idpessoa: String): OleVariant;
   end;

implementation

{ TCtrlPessoaInsEnsino }

constructor TCtrlPessoaInsEnsino.Create;
begin
  inherited;
  FDbInstituicaoEnsino := TDbInstituicaoEnsino.Create(Self);
end;

destructor TCtrlPessoaInsEnsino.Destroy;
begin
  FreeAndNil(FDbInstituicaoEnsino);
  inherited;

end;

procedure TCtrlPessoaInsEnsino.DoChangeDatabase;
begin
  inherited;
  FDbInstituicaoEnsino.DataBaseName := DataBaseName;
end;

function TCtrlPessoaInsEnsino.ListInsEnsino(IdPessoa: Double): OleVariant;
begin
  sSQL := 'SELECT * FROM INSTITUICAOENSINO WHERE IDPESSOA = ' + FloatToStr(IdPessoa);
  Result := GetDataPacket(sSQL);
end;

function TCtrlPessoaInsEnsino.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
  try
     if (Operacao = opApagar) then
     begin
       CdsSubTipo.Delete;
       Result := ApplyCds(CdsSubTipo, FDbInstituicaoEnsino, [] , []);

       if not(Result) then
          raise Exception.Create(FDbInstituicaoEnsino.MessageInfo);
     end
     else
     begin
       Result := ApplyCds(CdsSubTipo, FDbInstituicaoEnsino, [_DbPessoa.Idpessoa], [FDbInstituicaoEnsino.IdPessoa]);

       if not(Result) then
          raise Exception.Create(FDbInstituicaoEnsino.MessageInfo);
     end;
  except
    on e : exception do
    begin
      Result := False;

      if Pos('FK_ESTAGIARIO_IE', e.Message) > 0 then
         Mensagem := 'Não é possível excluir a Instituição de Ensino, pois está vinculada a um estagiário.'
      else
         Mensagem := e.Message;
    end;
  end;
end;

//Início -  Willam Santana SOL 229871.16137 PPM 407073
function TCtrlPessoaInsEnsino.VerificaEstagiario(Idpessoa: String): OleVariant;
begin

  sSQL := 'SELECT 1 FROM ESTAGIARIO E, INSTITUICAOENSINO I WHERE E.IDINSTITUICAOENSINO = I.IDINSTITUICAOENSINO  ' +
          ' AND I.IDPESSOA = ' + QuotedStr(Idpessoa);
  Result := GetDataPacket(sSQL);
 
end;
//Término -  Willam Santana SOL 229871.16137 PPM 407073

end.
