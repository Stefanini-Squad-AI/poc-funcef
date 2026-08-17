{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 30/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAcertaDependente;

interface

uses Db, SysUtils, Controls, DbClient, uCmDbObject, uCmControlObject, IvDictio, 
  uCtrlCustomRH;

const
  GRAVANDO_DADOS = '-1';

type
  TCtrlAcertaDependente = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
  private
    FIAppCliente: OleVariant;
    FCdsTitular: TClientDataSet;
    FCdsDependente: TClientDataSet;

    function ListTitulares(const ListaIdPessoa: string): OleVariant;
    function ListDependentes(const ListaIdPessoa: string): OleVariant;

    function AplicarAlteracoes: boolean;
    function AplicarAlteracoes_Dependentes: boolean;
    function AplicarAlteracoes_Titulares: boolean;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function Processar(const IAppCliente: OleVariant; ListaIdPessoa: string;
      DataBase: TDateTime): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAcertaDependente }

constructor TCtrlAcertaDependente.Create;
begin
  inherited;
end;

destructor TCtrlAcertaDependente.Destroy;
begin
  inherited;
end;

procedure TCtrlAcertaDependente.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlAcertaDependente.ListTitulares(const ListaIdPessoa: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  F.MATRICULA, PF.IDPESSOA, PF.NUMDEPTOT, PF.NUMDEPIRRF, PF.NUMDEPSALF' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOAFISICA PF, FUNCIONARIO F' +CR_LF+
    'WHERE' +CR_LF+
    QuebrarListaFiltro(2,'(F.IDPESSOA',ListaIdPessoa, 50) +' AND' +CR_LF+
    '  (F.IDPESSOA  = PF.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  MATRICULA');
end;

function TCtrlAcertaDependente.ListDependentes(const ListaIdPessoa: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  D.IDPESSOA, D.IDTITULAR, D.IDDEPENDENCIA, D.FLGCONTAIMPOSTOR,' +CR_LF+
    '  D.FLGCONTASALARIOF, D.FIMIMPOSTOR, PF.DATANASC' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOAFISICA PF, DEPENTIT D' +CR_LF+
    'WHERE' +CR_LF+
    QuebrarListaFiltro(2,'(D.IDTITULAR  ',ListaIdPessoa, 50)+' AND' +CR_LF+
    '  (D.IDDEPENDENCIA <> ''PRP'') AND' +CR_LF+
    '  (D.IDPESSOA       = PF.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  IDTITULAR');
end;

function TCtrlAcertaDependente.Processar(const IAppCliente: OleVariant;
  ListaIdPessoa: string; DataBase: TDateTime): boolean;
var
  sMsg: string;
  iNumDepTotal, iNumDepIRRF, iNumDepSalFam, Idade, FlgSal: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarAcertoDependente(IAppCliente,
      ListaIdPessoa, DataBase);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    FIAppCliente := IAppCliente;

    FCdsTitular := TClientDataSet.Create(nil);
    FCdsDependente := TClientDataSet.Create(nil);
    try
      FCdsTitular.Data := ListTitulares(ListaIdPessoa);
      FCdsDependente.Data := ListDependentes(ListaIdPessoa);
      FCdsDependente.Filter := '';
      FCdsDependente.Filtered := true;

      while not(FCdsTitular.EOF) do
      begin
        iNumDepTotal := 0;
        iNumDepIRRF := 0;
        iNumDepSalFam := 0;

        FCdsDependente.Filter := 'IDTITULAR = ' + FCdsTitular.FieldByName('IDPESSOA').asString;
        while not(FCdsDependente.EOF) do
        begin
          // Calcular o Número Total de Dependentes
          Inc(iNumDepTotal);
          // Calcular o Número de Dependentes para IRRF
          if (FCdsDependente.FieldByName('FLGCONTAIMPOSTOR').asInteger = 1) then
          begin
            if not(FCdsDependente.FieldByName('FIMIMPOSTOR').IsNull) and
                  (FCdsDependente.FieldByName('FIMIMPOSTOR').asDateTime <= DataBase) then
            begin
              FCdsDependente.Edit;
              FCdsDependente.FieldByName('FLGCONTAIMPOSTOR').asInteger := 0;
              FCdsDependente.Post;
            end
            else
              Inc(iNumDepIRRF);
          end;

          // Calcular o Número de Dependentes para Salário Família
          // Caso seja filho, verificar se a idade é inferior a 14 anos e atualizar o campo
          // que indica que ele consta para Salário Família de acordo com a Data Base informada
          if (FCdsDependente.FieldByName('IDDEPENDENCIA').asString = 'FIL') then
          begin
            if not(FCdsDependente.FieldByName('DATANASC').IsNull) then
            begin
              Idade := Round(Int((DataBase + 1 -
                FCdsDependente.FieldByName('DATANASC').asDateTime) / 365.25));

              if (Idade < 14) then
                FlgSal := 1
              else
                FlgSal := 0;

              if (FlgSal <> FCdsDependente.FieldByName('FLGCONTASALARIOF').asInteger) then
              begin
                FCdsDependente.Edit;
                FCdsDependente.FieldByName('FLGCONTASALARIOF').asInteger := FlgSal;
                FCdsDependente.Post;
              end;

              if (FlgSal = 1) then
                iNumDepSalFam := iNumDepSalFam + 1;
            end;
          end;
          FCdsDependente.Next;
        end;

        // Fazer a atualização das quantidades para a Pessoa
        if ((FCdsTitular.FieldByName('NUMDEPTOT').asInteger <> iNumDepTotal) or
            (FCdsTitular.FieldByName('NUMDEPIRRF').asInteger <> iNumDepIRRF) or
            (FCdsTitular.FieldByName('NUMDEPSALF').asInteger <> iNumDepSalFam)) then
        begin
          sMsg :=
            ('[Ok] Matrícula: ') +FCdsTitular.FieldByName('MATRICULA').asString +CR_LF+
            ('Anterior:') +CR_LF+
            ('  Quantidades: Total: ') +FCdsTitular.FieldByName('NUMDEPTOT').asString +' - '+
            ('I. Renda: ') +FCdsTitular.FieldByName('NUMDEPIRRF').asString +' - '+
            ('Sal. Fam.: ') +FCdsTitular.FieldByName('NUMDEPSALF').asString +CR_LF+
            ('Alterado:') +CR_LF+
            ('  Quantidades: Total: ') +IntToStr(iNumDepTotal) +' - '+
            ('I. Renda: ') +IntToStr(iNumDepIRRF) +' - '+
            ('Sal. Fam.: ') +IntToStr(iNumDepSalFam);

          FCdsTitular.Edit;
          FCdsTitular.FieldByName('NUMDEPTOT').asInteger := iNumDepTotal;
          FCdsTitular.FieldByName('NUMDEPIRRF').asInteger := iNumDepIRRF;
          FCdsTitular.FieldByName('NUMDEPSALF').asInteger := iNumDepSalFam;
          FCdsTitular.Post;
        end
        else
          sMsg :=
            ('[Aviso] Matrícula: ') +FCdsTitular.FieldByName('MATRICULA').asString +CR_LF+
            ('Nada a ser feito. As Quantidades já estão Corretas.');

        // Enviar mensagem ao cliente
        try
          FIAppCliente.ProcessarAcertoDependente_CB(sMsg +CR_LF+ Replicate('-', 115) +CR_LF);
        except
        end;

        FCdsTitular.Next;
      end;

      Result := AplicarAlteracoes;
    except
      on E: Exception do
        MessageInfo := E.Message;
    end;

    if (Result) then
      MessageInfo := ('Processo executado com sucesso.')
    else
      MessageInfo := ('Nenhuma linha foi executada.') +CR_LF+CR_LF+
                     ('Ocorreu o erro abaixo:') +CR_LF+CR_LF+ MessageInfo;

    FCdsDependente.Free;
    FCdsTitular.Free;
  end;
end;

function TCtrlAcertaDependente.AplicarAlteracoes_Titulares: boolean;
begin
  Result := true;
  if (FCdsTitular.ChangeCount = 0) then
    exit;

  try
    FCdsTitular.StatusFilter := [usModified];
    FCdsTitular.First;
    while not(FCdsTitular.EOF) do
    begin
      // Tem que verificar se é um registro que foi alterado porque mesmo passando
      // StatusFilter = usModified o Cds traz os registros setados como usUnmodified
      // equivalentes aos usModified.
      if (FCdsTitular.UpdateStatus = usModified) then
      begin
        Result := ExecSQL(
          'UPDATE PESSOAFISICA SET' +CR_LF+
          '  NUMDEPTOT  = ' +IntToStr(FCdsTitular.FieldByName('NUMDEPTOT').asInteger) +','+CR_LF+
          '  NUMDEPIRRF = ' +IntToStr(FCdsTitular.FieldByName('NUMDEPIRRF').asInteger) +','+CR_LF+
          '  NUMDEPSALF = ' +IntToStr(FCdsTitular.FieldByName('NUMDEPSALF').asInteger) +CR_LF+
          'WHERE' +CR_LF+
          '  (IDPESSOA = ' +FCdsTitular.FieldByName('IDPESSOA').asString+ ')');

        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;
      FCdsTitular.Next;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlAcertaDependente.AplicarAlteracoes_Dependentes: boolean;
begin
  Result := true;
  if (FCdsDependente.ChangeCount = 0) then
    exit;

  try
    FCdsDependente.Filtered := false;
    FCdsDependente.StatusFilter := [usModified];
    FCdsDependente.First;
    while not(FCdsDependente.EOF) do
    begin
      // Tem que verificar se é um registro que foi alterado porque mesmo passando
      // StatusFilter = usModified o Cds traz os registros setados como usUnmodified
      // equivalentes aos usModified.
      if (FCdsDependente.UpdateStatus = usModified) then
      begin
        Result := ExecSQL(
          'UPDATE DEPENTIT SET' +CR_LF+
          '  FLGCONTAIMPOSTOR = ' +IntToStr(FCdsDependente.FieldByName('FLGCONTAIMPOSTOR').asInteger) +','+CR_LF+
          '  FLGCONTASALARIOF = ' +IntToStr(FCdsDependente.FieldByName('FLGCONTASALARIOF').asInteger) +CR_LF+
          'WHERE' +CR_LF+
          '  (IDPESSOA  = ' +FCdsDependente.FieldByName('IDPESSOA').asString+ ') AND' +CR_LF+
          '  (IDTITULAR = ' +FCdsDependente.FieldByName('IDTITULAR').asString+ ')');

        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;
      FCdsDependente.Next;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlAcertaDependente.AplicarAlteracoes: boolean;
begin
  // Enviar mensagem ao cliente
  try
    FIAppCliente.ProcessarAcertoDependente_CB(GRAVANDO_DADOS);
  except
  end;

  try
    StartTransaction;

    Result := AplicarAlteracoes_Titulares;
    if (Result) then
      Result := AplicarAlteracoes_Dependentes;

    if not(Result) then
      raise Exception.Create(MessageInfo);

    Commit;

    Result := true;
  except
    on E: Exception do
    begin
      Rollback;
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

end.
