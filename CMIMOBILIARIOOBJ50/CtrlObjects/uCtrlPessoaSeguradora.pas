unit uCtrlPessoaSeguradora;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PESSOA - SEGURADORA ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  27/09/2002
//      Data de Término :  27/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaSeguradora -  Abre o registro de uma Seguradora
// -----------------------------------------------------------------------------

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbSeguradora;

Type TCtrlPessoaSeguradora = Class(TCtrlPessoa)
     private

     protected
       DbSeguradora : TDbSeguradora;
       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaSeguradora(const rIdPessoa: Double): OleVariant;

     end;

implementation

{ TCtrlPessoaSeguradora }

constructor TCtrlPessoaSeguradora.Create;
begin
  inherited;
  DbSeguradora := TDbSeguradora.Create( Self );
end;

destructor TCtrlPessoaSeguradora.Destroy;
begin
  FreeAndNil( DbSeguradora );
  inherited;
end;

procedure TCtrlPessoaSeguradora.DoChangeDatabase;
begin
  inherited;
  DbSeguradora.DataBaseName := DataBaseName;
end;

function TCtrlPessoaSeguradora.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , DbSeguradora, [_DbPessoa.Idpessoa], [DbSeguradora.IdSeguradora] );
   if not Result then Mensagem := DbSeguradora.MessageInfo;
end;

function TCtrlPessoaSeguradora.SelecionaSeguradora(const rIdPessoa: Double): OleVariant;
begin
   DbSeguradora.IdSeguradora.AsFloat := rIdPessoa;
   Result := GetDataPacket( DbSeguradora.SSqlSelect );
end;

end.
