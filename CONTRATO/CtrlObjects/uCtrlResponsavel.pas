{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Classe de controle do Cadastro de Proprietarios UH  }
{                                                       }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 07/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlResponsavel;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, CmEventosCadastro,
     uCtrlPessoa,uDbResponsavel,uCMTypes;

Type
  TCtrlResponsavel = Class(TCtrlPessoa)
  private
     FDbResponsavel: TDbResponsavel;
  protected
    {**
      Metodo a ser sobrescrito para atribuição do DataBaseName as classes de controle
      adicionais criadas na classe herdada para o subtipo
    **}
    procedure DoChangeDataBase; Override;
    {**
      Método a ser sobrescrito para processamento dos CLientDataSets adicionais ao
      pessoa e do subtipo.
      O parâmetro operação indica a operação de opInserir, opAlterar, opApagar
    **}
    function ProcessaOutros(Operacao: TOperacao; Var Mensagem: String): Boolean; Override;
    function ExecAppServer(Operacao: TOperacao): Boolean; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function ListResponsavel(rIDResponsavel: Double): OleVariant;
    function ListResponsavelXPessoa: OleVariant;
  end;

implementation

{ TCtrlResponsavel }

constructor TCtrlResponsavel.Create;
begin
   inherited;
   FDbResponsavel:=TDbResponsavel.Create(Self);
end;

destructor TCtrlResponsavel.Destroy;
begin
   inherited;
   FDbResponsavel.Free;
end;

procedure TCtrlResponsavel.DoChangeDataBase;
begin
   inherited;
   FDbResponsavel.DatabaseName:=DataBaseName;
end;

function TCtrlResponsavel.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   if (Operacao = opApagar) then CdsSubTipo.Delete;

   Result:=ApplyCds(CdsSubTipo,FDbResponsavel,[_DbPessoa.Idpessoa],[FDbResponsavel.IDRESPONSAVEL]);
   if not(Result) then Mensagem := FDbResponsavel.MessageInfo;
end;

function TCtrlResponsavel.ExecAppServer(Operacao: TOperacao): Boolean;
begin
  Result := Connection.AppServer.ProcessaPessoaHotel(Integer(Operacao),
            CdsPessoa.Data, CdsPessoafisica.Data,
            CdsDocpessoa.Data, CdsSubTipo.Data, CdsEndpess.Data, CdsTelendpess.Data,
            CdsContatopess.Data, CdsTelcontato.Data, CdsContaBancaria.Data,
            CdsImagensPessoa.Data, CdsImagensDOC.Data);
end;

function TCtrlResponsavel.ListResponsavel(
  rIDResponsavel: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT * FROM RESPONSAVEL ';
   if (rIDResponsavel<>0) then
       sSql:=sSql+'WHERE (IDRESPONSAVEL = '+FloatToStr(rIDResponsavel)+') ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlResponsavel.ListResponsavelXPessoa: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   P.NOME, '+
         '   P.FLGRESPONSAVEL, '+
         '   P.IDPESSOA, '+
         '   R.IDRESPONSAVEL '+
         'FROM '+
         '   PESSOA P, '+
         '   RESPONSAVEL R '+
         'WHERE '+
         '      (R.IDRESPONSAVEL=P.IDPESSOA) '+
         '  AND (R.FLGCONTRATO = 1) '+
         'ORDER BY NOME ';
   Result:=GetDataPacket(sSql);
end;

end.


