unit uCtrlPessoaAvalista;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PESSOA - AVALISTA ( MT )
//
//      Módulo          :  AdminImob
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  26/09/2002
//      Data de Término :  26/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      SelecionaAvalista -  Abre o registro de um Avalista
// -----------------------------------------------------------------------------

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbAvalista;

Type TCtrlPessoaAvalista = Class(TCtrlPessoa)
     private

     protected
       DbAvalista : TDbAvalista;
       procedure DoChangeDatabase; Override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;
       function    SelecionaAvalista(const rIdPessoa: Double): OleVariant;

     end;

implementation

{ TCtrlPessoaAvalista }

constructor TCtrlPessoaAvalista.Create;
begin
  inherited;
  DbAvalista := TDbAvalista.Create( Self );
end;

destructor TCtrlPessoaAvalista.Destroy;
begin
  FreeAndNil( DbAvalista );
  inherited;
end;

procedure TCtrlPessoaAvalista.DoChangeDatabase;
begin
  inherited;
  DbAvalista.DataBaseName := DataBaseName;
end;

function TCtrlPessoaAvalista.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , DbAvalista, [_DbPessoa.Idpessoa], [DbAvalista.IdAvalista] );
   if not Result then Mensagem := DbAvalista.MessageInfo;
end;

function TCtrlPessoaAvalista.SelecionaAvalista(const rIdPessoa: Double): OleVariant;
begin
   DbAvalista.IdAvalista.AsFloat := rIdPessoa;
   Result := GetDataPacket( DbAvalista.SSqlSelect );
end;

end.
