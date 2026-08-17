//*****************************************************************************
//Data	    : 22/02/2006
//Código    : Al_1
//Motivo(S) : Implementação da CdsAdmFdoInvest e suas funções
//*****************************************************************************


unit uCtrlPessoaAdmFdoInvest;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, uSistema,
     CmEventosCadastro, uCMTypes, uCtrlPessoa, uDbAdmFdoInvest;

Type TCtrlPessoaAdmFdoInvest = Class(TCtrlPessoa)
     private
       FDbAdmFdoInvest    : TDbAdmFdoInvest;
       //AL_1
       FCdsAdmFdoInvest   : TClientDataSet;

       procedure SetDbAdmFdoInvest(const Value: TDbAdmFdoInvest);
       procedure SetCdsAdmFdoInvest(const Value: TClientDataSet);

     protected
       procedure DoChangeDatabase; Override;
       procedure OnCreateAppServer; override;
       function  ProcessaOutros(Operacao:TOperacao; var Mensagem:string): Boolean; Override;

     public
       Constructor Create;  Override;
       Destructor  Destroy; Override;

       property DbAAdmFdoInvest : TDbAdmFdoInvest read FDbAdmFdoInvest  write SetDbAdmFdoInvest;
       //AL_1
       property CdsAdmFdoInvest : TClientDataSet read FCdsAdmFdoInvest write SetCdsAdmFdoInvest;

       function SelecionaAdmFdoInvest(const rIdPessoa: Double): OleVariant;

     end;

implementation

var sSql : String;

{ TCtrlPessoaAvalista }

constructor TCtrlPessoaAdmFdoInvest.Create;
begin
  inherited;
  FDbAdmFdoInvest := TDbAdmFdoInvest.Create( Self );
end;

destructor TCtrlPessoaAdmFdoInvest.Destroy;
begin
  FreeAndNil( FDbAdmFdoInvest );
   //AL_1
   if IsAppServer then
      FreeAndNil(FCdsAdmFdoInvest);

  inherited;
end;

procedure TCtrlPessoaAdmFdoInvest.DoChangeDatabase;
begin
  inherited;
   FDbAdmFdoInvest.DataBaseName := DataBaseName;
end;

procedure TCtrlPessoaAdmFdoInvest.OnCreateAppServer;
begin
  inherited;
   //AL_1
   FCdsAdmFdoInvest  := TClientDataSet.Create(nil);
end;

function TCtrlPessoaAdmFdoInvest.ProcessaOutros(Operacao: TOperacao; var Mensagem: string): Boolean;
begin
   // Exclui o registro do Subtipo para deleção
   if ( Operacao = opApagar ) Then
      cdsSubTipo.Delete;

   // Aplica alterações no subtipo
   Result := ApplyCds(CdsSubTipo , FDbAdmFdoInvest, [_DbPessoa.Idpessoa], [FDbAdmFdoInvest.IdAdmFdoInvest] );
   if not Result then Mensagem := FDbAdmFdoInvest.MessageInfo;
end;

function TCtrlPessoaAdmFdoInvest.SelecionaAdmFdoInvest(const rIdPessoa: Double): OleVariant;
begin
   FDbAdmFdoInvest.IdAdmFdoInvest.AsFloat := rIdPessoa;
   Result := GetDataPacket( FDbAdmFdoInvest.SSqlSelect );
end;

procedure TCtrlPessoaAdmFdoInvest.SetCdsAdmFdoInvest(
  const Value: TClientDataSet);
begin
  FCdsAdmFdoInvest := Value;
end;

procedure TCtrlPessoaAdmFdoInvest.SetDbAdmFdoInvest( const Value: TDbAdmFdoInvest);
begin
  FDbAdmFdoInvest := Value;
end;

end.
