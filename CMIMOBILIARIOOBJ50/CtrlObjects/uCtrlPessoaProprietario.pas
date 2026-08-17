unit uCtrlPessoaProprietario;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PESSOA - PROPRIETARIO ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  27/09/2002
//      Data de Término :  27/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaProprietario -  Abre o registro de um Proprietario
// -----------------------------------------------------------------------------

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbProprietariouh;

Type TCtrlPessoaProprietario = Class(TCtrlPessoa)
     private

     protected
       DbProprietario : TDbProprietariouh;
       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaProprietario(const rIdPessoa: Double): OleVariant;

     end;

implementation

{ TCtrlPessoaProprietario }

constructor TCtrlPessoaProprietario.Create;
begin
  inherited;
  DbProprietario := TDbProprietariouh.Create( Self );
end;

destructor TCtrlPessoaProprietario.Destroy;
begin
  FreeAndNil( DbProprietario );
  inherited;
end;

procedure TCtrlPessoaProprietario.DoChangeDatabase;
begin
  inherited;
  DbProprietario.DataBaseName := DataBaseName;
end;

function TCtrlPessoaProprietario.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , DbProprietario, [_DbPessoa.Idpessoa], [DbProprietario.IdProprietariouh] );
   if not Result then Mensagem := DbProprietario.MessageInfo;
end;

function TCtrlPessoaProprietario.SelecionaProprietario(const rIdPessoa: Double): OleVariant;
begin
   DbProprietario.IdProprietariouh.AsFloat := rIdPessoa;
   Result := GetDataPacket( DbProprietario.SSqlSelect );
end;

end.
