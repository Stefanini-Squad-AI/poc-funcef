unit uCtrlPessoaAdvogadoAlex;

interface

Uses
   SysUtils, Classes, DbClient, uCmControlObject, uSistema,
   CmEventosCadastro, uCtrlPessoa, uDbAdvogadoAlex, uCmTypes;

Type
  {A classe de controle do SubTipo a ser implementado deve
   herdar da classe de controle do pessoa}
  TCtrlPessoaAdvogadoAlex = Class(TCtrlPessoa)
  private

    // alex movido
    {Classe de persistência do subtipo de pessoa}
    _DbAdvogadoAlex: TdbAdvogadoAlex;
    FCdsAdvogadoAlex: TClientDataSet;
    procedure SetDbAdvogadoAlex(const Value: TDbAdvogadoAlex);
    procedure SetCdsAdvogadoAlex(const Value: TClientDataSet);

  protected
    {Metodo a ser sobrescrito para atribuição do DataBaseName das
    classes de controle adicionais criadas na classe herdada para
    o subtipo}
    procedure DoChangeDataBase; Override;
    {Método a ser sobrescrito para processamento dos
    CLientDataSets adicionais ao pessoa e do subtipo.
    O parâmetro operação indica a operação de opInserir,
    opAlterar, opApagar}
    function ProcessaOutros(Operacao: TOperacao;
             Var Mensagem: String): Boolean; Override;

  public
    Constructor Create; Override;
    Destructor Destroy; Override;

   // alex novo
    property DbAdvogadoAlex: TDbAdvogadoAlex read _DbAdvogadoAlex write SetDbAdvogadoAlex;
    property CdsAdvogadoAlex: TClientDataSet read FCdsAdvogadoAlex write SetCdsAdvogadoAlex;

    {Método a ser implementado para seleção do registro a ser
    manipulado pela tela do pessoa.
    Essa função é atribuída diretamente ao Cds.Data do form de
    pessoa }
    function SelAdvogadoAlex(rIdpessoa: Double): OleVariant;
  End;

implementation

{ TCtrlPessoaAdvogadoAlex }

constructor TCtrlPessoaAdvogadoAlex.Create;
begin
  inherited;
  _DbAdvogadoAlex := TdbAdvogadoAlex.Create (self);
  FCdsAdvogadoAlex := TClientDataSet.Create (nil)
end;


destructor TCtrlPessoaAdvogadoAlex.Destroy;
begin
  _DbAdvogadoAlex.Free;
  FCdsAdvogadoAlex.free;
  inherited;

end;

procedure TCtrlPessoaAdvogadoAlex.DoChangeDataBase;
begin
  inherited;
  _DbAdvogadoAlex.DataBaseName := DataBaseName;
end;

function TCtrlPessoaAdvogadoAlex.ProcessaOutros(Operacao: TOperacao;
  var Mensagem: String): Boolean;
begin
   If ( Operacao = opApagar ) Then CdsSubTipo.Delete;

   Result := ApplyCds(CdsSubTipo , _DbAdvogadoAlex,
           [_DbPessoa.Idpessoa], [_DbAdvogadoAlex.Idpessoa] );

   If Not Result Then Mensagem := _DbAdvogadoAlex.MessageInfo;
end;


function TCtrlPessoaAdvogadoAlex.SelAdvogadoAlex(rIdpessoa: Double):
 OleVariant;
begin
   _DbAdvogadoAlex.Idpessoa.AsFloat := rIdpessoa;
   Result := GetDataPacket(_DbAdvogadoAlex.SSqlSelect);
end;

procedure TCtrlPessoaAdvogadoAlex.SetCdsAdvogadoAlex(
  const Value: TClientDataSet);
begin
  FCdsAdvogadoAlex := Value;
end;

procedure TCtrlPessoaAdvogadoAlex.SetDbAdvogadoAlex(
  const Value: TDbAdvogadoAlex);
begin
  _DbAdvogadoAlex := Value;
end;

end.
