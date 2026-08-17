unit uCtrlPessoaResponsavel;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PESSOA - RESPONSAVEL ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  27/09/2002
//      Data de Término :  27/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaResponsavel -  Abre o registro de um Responsavel
// -----------------------------------------------------------------------------

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbResponsavel;

Type TCtrlPessoaResponsavel = Class(TCtrlPessoa)
     private

     protected
       DbResponsavel : TDbResponsavel;
       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaResponsavel(const rIdPessoa: Double): OleVariant;

     end;

implementation

{ TCtrlPessoaResponsavel }

constructor TCtrlPessoaResponsavel.Create;
begin
  inherited;
  DbResponsavel := TDbResponsavel.Create( Self );
end;

destructor TCtrlPessoaResponsavel.Destroy;
begin
  FreeAndNil( DbResponsavel );
  inherited;
end;

procedure TCtrlPessoaResponsavel.DoChangeDatabase;
begin
  inherited;
  DbResponsavel.DataBaseName := DataBaseName;
end;

function TCtrlPessoaResponsavel.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , DbResponsavel, [_DbPessoa.Idpessoa], [DbResponsavel.IdResponsavel] );
   if not Result then Mensagem := DbResponsavel.MessageInfo;
end;

function TCtrlPessoaResponsavel.SelecionaResponsavel(const rIdPessoa: Double): OleVariant;
begin
   DbResponsavel.IdResponsavel.AsFloat := rIdPessoa;
   Result := GetDataPacket( DbResponsavel.SSqlSelect );
end;

end.
