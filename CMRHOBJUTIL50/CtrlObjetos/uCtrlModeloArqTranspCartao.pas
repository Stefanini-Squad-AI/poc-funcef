unit uCtrlModeloArqTranspCartao;

interface

uses Classes, SysUtils, Controls, DB, DBClient, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlModeloArqTransp;

type
  TCtrlModeloArqTranspCartao = class(TCtrlModeloArqTransp)
  protected
    FArquivo_CadUsuarios: TStringList;

    FNumReg_CadUsuarios: word; // Quantidade de pessoas por estabelecimento para
                              // o arquivo de inclusão de usuários
    FNumReg_Pedido: word; // Quantidade de pessoas por estabelecimento para o arquivo de pedidos

    FCadUsuarios: integer; // Indica se o arquivo da Cadastro de Usuários não será
                           // gerado (0), somente para os que foram admitidos no mês (1) ou
                           // será gerado para todas as pessoas (2)

    function GetNumReg(ContarUsuarios_a_Cadastrar: boolean): integer;

    procedure IniciarProcessoArquivo; override;
    procedure IniciarProcessoEstab; override;

    function GetArquivo_CadUsuarios: string; virtual;
  public
    constructor Create(const GerarAP: boolean; const CadUsuarios: integer); reintroduce;
    destructor  Destroy; override;

    property Arquivo_CadUsuarios: string read GetArquivo_CadUsuarios;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlModeloArqTranspCartao }

constructor TCtrlModeloArqTranspCartao.Create(const GerarAP: boolean;
  const CadUsuarios: integer);
begin
  inherited Create(GerarAP, false);
  FArquivo_CadUsuarios := TStringList.Create;

  FCadUsuarios := CadUsuarios;
end;

destructor TCtrlModeloArqTranspCartao.Destroy;
begin
  FArquivo_CadUsuarios.Free;
  inherited;
end;

function TCtrlModeloArqTranspCartao.GetNumReg(ContarUsuarios_a_Cadastrar: boolean): integer;

{-->}function PodeGerarDetalhe: boolean;
     begin
       if (FCdsPrincipal.FieldByName('NUM_DIAS_TRAB').asInteger = 0) then
       begin
         Result := false;
         exit;
       end;

       // Se for para contar as pessoas que farão parte do arquivo de cadastro,
       // verificar se a pessoa atual foi admitida dentro do período (referente
       // à opção na tela) ou se deve incluir todas as pessoas selecionadas pela
       // Query Principal
       if (ContarUsuarios_a_Cadastrar) then
       begin
         Result := (FCadUsuarios = 2) or
           ((FCadUsuarios = 1) and (VerificaCodigoEm(FListaAdmitidos, FIdPessoa, ',') >= 1));
       end
       // Se for para contar as pessoas que farão parte do arquivo de pedidos,
       // sempre considerar que a pessoa deve entrar na contagem
       else
         Result := true;
{-->}end;

begin
  Result := 0;
  FListaIdPessoa := '';
  FCdsPrincipal.First;
  repeat
    FIdPessoa := FCdsPrincipal.FieldByName('IDPESSOA').asString;

    // Verificar se a pessoa atual deve entrar no arquivo
    if (PodeGerarDetalhe) and (VerificaCodigoEm(FListaIdPessoa, FIdPessoa, ',') < 1) then
    begin
      if (FListaIdPessoa = '') then
        FListaIdPessoa := FListaIdPessoa + FIdPessoa
      else
        FListaIdPessoa := FListaIdPessoa +','+ FIdPessoa;
      Inc(Result);
    end;
    FCdsPrincipal.Next;
  until (FCdsPrincipal.EOF);
end;

procedure TCtrlModeloArqTranspCartao.IniciarProcessoArquivo;
begin
  inherited;
  FFiltroCdsPrincipal := 'TIPOLINHA = ''C''';
  FArquivo_CadUsuarios.Clear;
end;

procedure TCtrlModeloArqTranspCartao.IniciarProcessoEstab;
begin
  inherited;
  if (FCadUsuarios = 1) then
    MontarListaAdmitidos;

  // Obter o número de pessoas que serão cadastradas como usuários
  if (FCadUsuarios > 0) then
    FNumReg_CadUsuarios := GetNumReg(true);

  // Obter o número de pessoas que irão gerar pedidos
  FNumReg_Pedido := GetNumReg(false);
end;

function TCtrlModeloArqTranspCartao.GetArquivo_CadUsuarios: string;
begin
  Result := FArquivo_CadUsuarios.Text;
end;

end.
