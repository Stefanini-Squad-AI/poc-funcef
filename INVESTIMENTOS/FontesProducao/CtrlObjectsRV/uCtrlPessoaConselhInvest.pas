//*****************************************************************************
// Data	     : 14/03/2006
// Código    :
// Pendencia : 20704
// SOL       : 36184
// Motivo(S) : Implementação da CdsConselhInvest e suas funções
//*****************************************************************************


unit uCtrlPessoaConselhInvest;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbConselhInvest;

Type TCtrlPessoaConselhInvest = Class(TCtrlPessoa)
     private
       FDbConselhInvest    : TDbConselhInvest;
       FCdsConselhInvest   : TClientDataSet;

       procedure SetDbConselhInvest(const Value: TDbConselhInvest);
       procedure SetCdsConselhInvest(const Value: TClientDataSet);

     protected
       procedure DoChangeDatabase; Override;
       procedure OnCreateAppServer; override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;

       property DbAConselhInvest : TDbConselhInvest read FDbConselhInvest  write SetDbConselhInvest;
       property CdsConselhInvest : TClientDataSet   read FCdsConselhInvest write SetCdsConselhInvest;
       function SelecionaConselhInvest(const rIdPessoa: Double): OleVariant;

     end;

implementation

var sSql : String;

{ TCtrlPessoaConselhInvest }

constructor TCtrlPessoaConselhInvest.Create;
begin
  inherited;
  FDbConselhInvest := TDbConselhInvest.Create( Self );
end;

destructor TCtrlPessoaConselhInvest.Destroy;
begin
  FreeAndNil( FDbConselhInvest );
   if IsAppServer then
      FreeAndNil(FCdsConselhInvest);

  inherited;
end;

procedure TCtrlPessoaConselhInvest.DoChangeDatabase;
begin
  inherited;
   FDbConselhInvest.DataBaseName := DataBaseName;
end;

procedure TCtrlPessoaConselhInvest.OnCreateAppServer;
begin
  inherited;
   FCdsConselhInvest  := TClientDataSet.Create(nil);
end;

function TCtrlPessoaConselhInvest.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then
      cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , FDbConselhInvest, [_DbPessoa.Idpessoa], [FDbConselhInvest.IdConselhInvest] );
   if not Result then Mensagem := FDbConselhInvest.MessageInfo;
end;

function TCtrlPessoaConselhInvest.SelecionaConselhInvest(const rIdPessoa: Double): OleVariant;
begin
   FDbConselhInvest.IdConselhInvest.AsFloat := rIdPessoa;
   Result := GetDataPacket( FDbConselhInvest.SSqlSelect );
end;

procedure TCtrlPessoaConselhInvest.SetCdsConselhInvest(
  const Value: TClientDataSet);
begin
  FCdsConselhInvest := Value;
end;

procedure TCtrlPessoaConselhInvest.SetDbConselhInvest( const Value: TDbConselhInvest);
begin
  FDbConselhInvest := Value;
end;

end.
