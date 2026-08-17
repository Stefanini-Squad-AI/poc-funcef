unit uCtrlPessoaCartorio;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PESSOA - CARTORIO ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  27/09/2002
//      Data de Término :  27/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaCartorio -  Abre o registro de um Cartorio
// -----------------------------------------------------------------------------

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbCartorio;

Type TCtrlPessoaCartorio = Class(TCtrlPessoa)
     private

     protected
       DbCartorio : TDbCartorio;
       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaCartorio(const rIdPessoa: Double): OleVariant;

     end;

implementation

{ TCtrlPessoaCartorio }

constructor TCtrlPessoaCartorio.Create;
begin
  inherited;
  DbCartorio := TDbCartorio.Create( Self );
end;

destructor TCtrlPessoaCartorio.Destroy;
begin
  FreeAndNil( DbCartorio );
  inherited;
end;

procedure TCtrlPessoaCartorio.DoChangeDatabase;
begin
  inherited;
  DbCartorio.DataBaseName := DataBaseName;
end;

function TCtrlPessoaCartorio.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , DbCartorio, [_DbPessoa.Idpessoa], [DbCartorio.IdCartorio] );
   if not Result then Mensagem := DbCartorio.MessageInfo;
end;

function TCtrlPessoaCartorio.SelecionaCartorio(const rIdPessoa: Double): OleVariant;
begin
   DbCartorio.IdCartorio.AsFloat := rIdPessoa;
   Result := GetDataPacket( DbCartorio.SSqlSelect );
end;

end.
