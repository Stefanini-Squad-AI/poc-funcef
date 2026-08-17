{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 16/03/2005                                 }
{                                                       }
{*******************************************************}

unit uCtrlCriaSubConta;

interface

uses SysUtils, Controls, DbClient, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate,
  uCtrlCustomRH, uDbFuncionario, uCtrlSubConta, uDbSubConta, uCtrlListTerceirosRH;

type
  TCtrlCriaSubConta = class(TCtrlCustomRH)
  protected
    FCtrlSubConta: TCtrlSubConta;
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
  private
    FDbFuncionario: TDbFuncionario;
    FDbSubConta: TDbSubConta;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function CriarSubConta(const IAppCliente: OleVariant; ListaIdPessoa: string;
      ColocaMatricula: integer): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCriaSubConta }

constructor TCtrlCriaSubConta.Create;
begin
  inherited;
  FDbFuncionario := TDbFuncionario.Create(Self);
  FDbSubConta := TDbSubConta.Create(Self);

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
  FCtrlSubConta := TCtrlSubConta.Create;
end;

destructor TCtrlCriaSubConta.Destroy;
begin
  FDbFuncionario.Free;
  FDbSubConta.Free;
  FCtrlSubConta.Free;
  FCtrlListTerceirosRH.Free;
  inherited;
end;

procedure TCtrlCriaSubConta.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlSubConta.InitializeAs(Self);
  FCtrlSubConta.OpenTransaction := false;
end;

procedure TCtrlCriaSubConta.DoChangeDataBase;
begin
  inherited;
  FDbFuncionario.DataBaseName := DataBaseName;
  FDbSubConta.DataBaseName := DataBaseName;
end;

function TCtrlCriaSubConta.CriarSubConta(const IAppCliente: OleVariant;
  ListaIdPessoa: string; ColocaMatricula: integer): boolean;
var
  _CdsTitular, _CdsSubConta: TClientDataSet;
  iNaoAlter, iIncluidos: integer;
  dSubConta: double;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.CriarSubConta(IAppCliente,
      ListaIdPessoa, ColocaMatricula);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;

    _CdsTitular := TClientDataSet.Create(nil);
    _CdsSubConta := TClientDataSet.Create(nil);
    try
      iNaoAlter := 0;
      iIncluidos := 0;

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarCriarSubConta_CB(CMTranslate('Selecionando Pessoas...'), 0, false);
      except
      end;

      _CdsTitular.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  F.IDPESSOA, F.MATRICULA, F.IDEMPRESA, F.CODSUBCONTA, P.NOME' +CR_LF+
        'FROM' +CR_LF+
        '  FUNCIONARIO F, PESSOA P' +CR_LF+
        'WHERE' +CR_LF+
        QuebrarListaFiltro(2,'(F.IDPESSOA ',ListaIdPessoa,50)+' AND' +CR_LF+
        '  (F.IDPESSOA = P.IDPESSOA)');

      dSubConta := FCtrlSubConta.LeUltimoRegSubConta(_CdsTitular.FieldByName('IDEMPRESA').asInteger);

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarCriarSubConta_CB(CMTranslate('Processando...'), _CdsTitular.RecordCount, false);
      except
      end;

      try
        StartTransaction;

        while not(_CdsTitular.EOF) do
        begin
          if not(_CdsTitular.FieldByName('CODSUBCONTA').IsNull) then
          begin
            _CdsSubConta.Data := GetDataPacket(
              'SELECT' +CR_LF+
              '  *' +CR_LF+
              'FROM' +CR_LF+
              '  SUBCONTA' +CR_LF+
              'WHERE' +CR_LF+
              '  (CODSUBCONTA = ' +_CdsTitular.FieldByName('CODSUBCONTA').asString+ ') AND' +CR_LF+
              '  (IDPESSOA    = ' +_CdsTitular.FieldByName('IDEMPRESA').asString+ ')');
                                             
            if not(_CdsSubConta.IsEmpty) then
            begin
              // Calcular o Número Total de Não Alterados
              Inc(iNaoAlter);
              _CdsTitular.Next;
              
              // Enviar mensagem ao cliente
              try
                IAppCliente.ProcessarCriarSubConta_CB('', 0, true);
              except
              end;

              Continue;
            end;
          end;

          // Fazer a inclusão da subconta e atualização da Pessoa
          dSubConta := dSubConta + 1;
          FDbSubConta.CodSubConta.asFloat := dSubConta;
          FDbSubConta.IdPessoa.asInteger := _CdsTitular.FieldByName('IDEMPRESA').asInteger;
          FDbSubConta.NomeSubConta.asString := _CdsTitular.FieldByName('NOME').asString;
          FDbSubConta.CodCorresp.asString := IFF(ColocaMatricula = 1, '',
            _CdsTitular.FieldByName('MATRICULA').asString);

          Inc(iIncluidos);

          FDbFuncionario.IdPessoa.asFloat := _CdsTitular.FieldByName('IDPESSOA').asFloat;
          FDbFuncionario.LoadFromDb;
          FDbFuncionario.CodSubConta.asFloat := dSubConta;

          // Aplicar no Banco
          Result := FDbSubConta.Insert;
          if (Result) then
          begin
            Result := FDbFuncionario.Update;
            if not(Result) then
              raise Exception.Create(FDbFuncionario.MessageInfo);
          end
          else
            raise Exception.Create(FDbSubConta.MessageInfo);

          _CdsTitular.Next;

          // Enviar mensagem ao cliente
          try
            IAppCliente.ProcessarCriarSubConta_CB('', 0, true);
          except
          end;
        end;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarCriarSubConta_CB(CMTranslate('Gravando...'), 0, false);
        except
        end;

        Commit;

        if (iIncluidos = 0) then
          MessageInfo := CMTranslate('Nenhuma Sub-Conta Incluída/Alterada.')
        else
          MessageInfo := CMTranslate('Processo executado com sucesso.') +CR_LF+
            IntToStr(iIncluidos) +CMTranslate(' Incluídos/Alterados') +CR_LF+
            IntToStr(iNaoAlter) +CMTranslate(' Inalterados');
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo :=
            CMTranslate('Processo Abortado.') +CR_LF+
            CMTranslate('Um erro ocorreu ao tentar criar a Sub-Conta para o Empregado: ') +CR_LF+
            _CdsTitular.FieldByName('NOME').asString +CR_LF+CR_LF+
            CMTranslate('Erro:') +CR_LF+ E.Message;
        end;
      end;
    finally
      _CdsSubConta.Free;
      _CdsTitular.Free;
    end;  
  end;
end;

end.
