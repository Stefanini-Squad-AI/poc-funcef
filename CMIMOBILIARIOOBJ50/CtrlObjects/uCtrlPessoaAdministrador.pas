unit uCtrlPessoaAdministrador;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PESSOA - ADMINISTRADOR ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  27/09/2002
//      Data de Término :  27/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaAdministrador -  Abre o registro de um Administrador
// -----------------------------------------------------------------------------

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbAdminImovel;

Type TCtrlPessoaAdministrador = Class(TCtrlPessoa)
     private

     protected
       DbAdministrador : TDbAdminImovel;
       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaAdministrador(const rIdPessoa: Double): OleVariant;

     end;

implementation

{ TCtrlPessoaAdministrador }

constructor TCtrlPessoaAdministrador.Create;
begin
  inherited;
  DbAdministrador := TDbAdminImovel.Create( Self );
end;

destructor TCtrlPessoaAdministrador.Destroy;
begin
  FreeAndNil( DbAdministrador );
  inherited;
end;

procedure TCtrlPessoaAdministrador.DoChangeDatabase;
begin
  inherited;
  DbAdministrador.DataBaseName := DataBaseName;
end;

function TCtrlPessoaAdministrador.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , DbAdministrador, [_DbPessoa.Idpessoa], [DbAdministrador.IdAdminimovel] );
   if not Result then Mensagem := DbAdministrador.MessageInfo;
end;

function TCtrlPessoaAdministrador.SelecionaAdministrador(const rIdPessoa: Double): OleVariant;
begin
   DbAdministrador.IdAdminimovel.AsFloat := rIdPessoa;
   Result := GetDataPacket( DbAdministrador.SSqlSelect );
end;

end.
