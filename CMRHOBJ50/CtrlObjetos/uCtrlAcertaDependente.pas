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

uses SysUtils, Controls, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbDepentit, uDbPessoaFisica;

type
  TCtrlAcertaDependente = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
  private
    FDbDepentit: TDbDepentit;
    FDbPessoaFisica: TDbPessoaFisica;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function Processar(ListaIdPessoa: string; DataBase: TDate): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAcertaDependente }

constructor TCtrlAcertaDependente.Create;
begin
  inherited;
  FDbDepentit := TDbDepentit.Create(Self);
  FDbPessoaFisica := TDbPessoaFisica.Create(Self);

  FDbDepentit.ErrorIfNoRowsAffected := true;
  FDbPessoaFisica.ErrorIfNoRowsAffected := true;
end;

destructor TCtrlAcertaDependente.Destroy;
begin
  FDbPessoaFisica.Free;
  FDbDepentit.Free;
  inherited;
end;

procedure TCtrlAcertaDependente.DoChangeDataBase;
begin
  inherited;
  FDbDepentit.DataBaseName := DataBaseName;
  FDbPessoaFisica.DataBaseName := DataBaseName;
end;

function TCtrlAcertaDependente.Processar(ListaIdPessoa: string; DataBase: TDate): boolean;
var
  sMsg: string;
  _CdsTitular, _CdsTitularAlt, _CdsDependente: TCMClientDataSet;
  iNumErros, iNumDepTotal, iNumDepIRRF, iNumDepSalFam, Idade, FlgSal: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Processar(ListaIdPessoa);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
      
    _CdsTitular := TCMClientDataSet.Create(nil);
    _CdsTitularAlt := TCMClientDataSet.Create(nil);
    _CdsDependente := TCMClientDataSet.Create(nil);

    iNumErros := 0;

    _CdsTitular.Data := GetDataPacket(
      'SELECT *' +CR_LF+
      'FROM   PESSOAFISICA' +CR_LF+
      'WHERE  (IDPESSOA ' +IFF(Pos(',', ListaIdPessoa) > 0,
      'IN (' +ListaIdPessoa+ ')', '= ' +ListaIdPessoa)+ ')');
    _CdsTitularAlt.Data := _CdsTitular.Data;

    while not(_CdsTitular.EOF) do
    begin
      iNumDepTotal := 0;
      iNumDepIRRF := 0;
      iNumDepSalFam := 0;

      _CdsDependente.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  PF.DATANASC, D.*' +CR_LF+
        'FROM' +CR_LF+
        '  PESSOAFISICA PF, DEPENTIT D' +CR_LF+
        'WHERE' +CR_LF+
        '  (D.IDTITULAR      = ' +_CdsTitular.FieldByName('IDPESSOA').asString+ ') AND' +CR_LF+
        '  (D.IDDEPENDENCIA <> ''PRP'') AND'+CR_LF+
        '  (D.IDPESSOA       = PF.IDPESSOA)');

      while not(_CdsDependente.EOF) do
      begin
        // Calcular o Número Total de Dependentes
        Inc(iNumDepTotal);
        // Calcular o Número de Dependentes para IRRF
        if (_CdsDependente.FieldByName('FLGCONTAIMPOSTOR').asInteger = 1) then
        begin
          if (not _CdsDependente.FieldByName('FIMIMPOSTOR').IsNull) and
             (_CdsDependente.FieldByName('FIMIMPOSTOR').asDateTime <= DataBase) then
          begin
              _CdsDependente.Edit;
              _CdsDependente.FieldByName('FLGCONTAIMPOSTOR').asInteger := 0;
              _CdsDependente.Post;
          end
          else
            Inc(iNumDepIRRF);
        end;

        // Calcular o Número de Dependentes para Salário Família
        // Caso seja filho, verificar se a idade é inferior a 14 anos e atualizar o campo
        // que indica que ele consta para Salário Família de acordo com a Data Base informada
        if (_CdsDependente.FieldByName('IDDEPENDENCIA').asString = 'FIL') then
        begin
          if not(_CdsDependente.FieldByName('DATANASC').IsNull) then
          begin
            Idade := Round(Int((DataBase + 1 -
              _CdsDependente.FieldByName('DATANASC').asDateTime) / 365.25));

            if (Idade < 14) then
              FlgSal := 1
            else
              FlgSal := 0;

            if (FlgSal <> _CdsDependente.FieldByName('FLGCONTASALARIOF').asInteger) then
            begin
              _CdsDependente.Edit;
              _CdsDependente.FieldByName('FLGCONTASALARIOF').asInteger := FlgSal;
              _CdsDependente.Post;
            end;

            if (FlgSal = 1) then
              iNumDepSalFam := iNumDepSalFam + 1;
          end;
        end;
        _CdsDependente.Next;
      end;

      // Fazer a atualização das quantidades para a Pessoa
      if ((_CdsTitular.FieldByName('NUMDEPTOT').asInteger <> iNumDepTotal) or
          (_CdsTitular.FieldByName('NUMDEPIRRF').asInteger <> iNumDepIRRF) or
          (_CdsTitular.FieldByName('NUMDEPSALF').asInteger <> iNumDepSalFam)) and
         (_CdsTitularAlt.Locate('IDPESSOA', _CdsTitular.FieldByName('IDPESSOA').asString, [])) then
      begin
        _CdsTitularAlt.Edit;
        _CdsTitularAlt.FieldByName('NUMDEPTOT').asInteger := iNumDepTotal;
        _CdsTitularAlt.FieldByName('NUMDEPIRRF').asInteger := iNumDepIRRF;
        _CdsTitularAlt.FieldByName('NUMDEPSALF').asInteger := iNumDepSalFam;
        _CdsTitularAlt.Post;
      end;

      // Aplico as alterações no Banco
      try
        StartTransaction;

        Result := ApplyCds(_CdsDependente, FDbDepentit, [], []);

        if (Result) then
        begin
          Result := ApplyCds(_CdsTitularAlt, FDbPessoaFisica, [], []);
          if not(Result) then
          begin
            MessageInfo := FDbPessoaFisica.MessageInfo;
            Rollback;
          end
          else
            Commit;
        end
        else
        begin
          MessageInfo := FDbDepentit.MessageInfo;
          Rollback;
        end;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;

      if (Result) then
        sMsg :=
          '[Ok] Código da Pessoa: ' +_CdsTitular.FieldByName('IDPESSOA').asString +CR_LF+
          'Anterior:' +CR_LF+
          'Quantidades: Total: ' +_CdsTitular.FieldByName('NUMDEPTOT').asString +' - '+
          'I. Renda: ' +_CdsTitular.FieldByName('NUMDEPIRRF').asString +' - '+
          'Sal. Fam.: ' +_CdsTitular.FieldByName('NUMDEPSALF').asString +CR_LF+
          'Alterado:' +CR_LF+
          'Quantidades: Total: ' +IntToStr(iNumDepTotal) +' - '+
          'I. Renda: ' +IntToStr(iNumDepIRRF) +' - '+
          'Sal. Fam.: ' +IntToStr(iNumDepSalFam)
      else
      begin
        Inc(iNumErros);
        sMsg :=
          '[Erro] Código da Pessoa: '+_CdsTitularAlt.FieldByName('IDPESSOA').asString+CR_LF+
          'Descrição:'+CR_LF+MessageInfo;
      end;

      DoProgresso([sMsg +CR_LF+ Replicate('-', 120) +CR_LF]);

      _CdsTitular.Next;
    end;

    if (iNumErros > 0) then
    begin
      if (iNumErros = _CdsTitular.RecordCount) then
        MessageInfo := 'Nenhuma linha foi executada.'
      else
        MessageInfo := 'Processo executado com '+IntToStr(iNumErros)+' erros.';
    end
    else
      MessageInfo := 'Processo executado com sucesso.';

    _CdsDependente.Free;
    _CdsTitularAlt.Free;
    _CdsTitular.Free;
  end;
end;

end.
