{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAcertaCustoProcJur;

interface

uses SysUtils, Forms, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uDbProcessoTrab;

type
  TCtrlAcertaCustoProcJur = class(TCmControlObject)
  protected
    procedure DoChangeDataBase; override;
  private
    FDb: TDbProcessoTrab;

    function GravarAcertos(Cds: TCMClientDataSet): boolean;

    function ListProcessos: OleVariant;
    function ListObjetos(NumProcTrab: real): OleVariant;
    function ListHonorarios(NumProcTrab: real): OleVariant;
    function ListEtapas(NumProcTrab: real): OleVariant;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ProcessarAcerto(IncluirHonorarios, IncluirDespesasJud: boolean): boolean;
  end;

implementation

uses uCMTypes, uFuncoesUteis;

{ TCtrlAcertaCustoProcJur }

constructor TCtrlAcertaCustoProcJur.Create;
begin
  inherited;
  FDb := TDbProcessoTrab.Create(Self);
end;

destructor TCtrlAcertaCustoProcJur.Destroy;
begin
  FDb.Free;
  inherited;
end;

procedure TCtrlAcertaCustoProcJur.DoChangeDataBase;
begin
  inherited;
  FDb.DatabaseName := DataBaseName;
end;

function TCtrlAcertaCustoProcJur.ListProcessos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR+LF+
    '  FLGSITPROC, NUMPROCTRAB, CUSTOPROC, DESPESAPROC'+CR+LF+
    'FROM'+CR+LF+
    '  PROCESSOTRAB');
end;

function TCtrlAcertaCustoProcJur.ListObjetos(NumProcTrab: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR+LF+
    '  (ROUND(VALORRECL * PERCPROB) / 100) AS VALORESPERADO, VALORSENTENCA'+CR_LF+
    'FROM'+CR+LF+
    '  OBJPROCTRAB'+CR+LF+
    'WHERE'+CR+LF+
    '  (NUMPROCTRAB = '+FloatToStr(NumProcTrab)+')');
end;

function TCtrlAcertaCustoProcJur.ListHonorarios(NumProcTrab: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR+LF+
    '  VALORHONOR'+CR+LF+
    'FROM'+CR+LF+
    '  HONORARIOS'+CR+LF+
    'WHERE'+CR+LF+
    '  (NUMPROCTRAB = '+FloatToStr(NumProcTrab)+')');
end;

function TCtrlAcertaCustoProcJur.ListEtapas(NumProcTrab: real): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR+LF+
    '  VALORREC'+CR+LF+
    'FROM'+CR+LF+
    '  ETAPAPROCTRAB'+CR+LF+
    'WHERE'+CR+LF+
    '  (NUMPROCTRAB = '+FloatToStr(NumProcTrab)+')');
end;

function TCtrlAcertaCustoProcJur.ProcessarAcerto(IncluirHonorarios,
  IncluirDespesasJud: boolean): boolean;
var
  rTotCusto, rTotDespe: double;
  iTotAcert, iPos: integer;
  bErro: boolean;
  _CdsProcesso, _CdsObjeto, _CdsHonorario, _CdsEtapa: TCMClientDataSet;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarAcerto(IncluirHonorarios, IncluirDespesasJud);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _CdsProcesso := TCMClientDataSet.Create(nil);
    _CdsObjeto := TCMClientDataSet.Create(nil);
    _CdsHonorario := TCMClientDataSet.Create(nil);
    _CdsEtapa := TCMClientDataSet.Create(nil);

    DoProgresso([0, 0, 'Obtendo processos...']);
    _CdsProcesso.Data := ListProcessos;

    iPos := 0;
    iTotAcert := 0;
    DoProgresso([_CdsProcesso.RecordCount, 0, 'Obtendo processos...']);
    try
      while not(_CdsProcesso.EOF) do
      begin
        DoProgresso([0, 0, 'Processando... (Processo '+
          _CdsProcesso.FieldByName('NumProcTrab').asString +')']);
        rTotCusto := 0;
        rTotDespe := 0;

        _CdsObjeto.Data := ListObjetos(_CdsProcesso.FieldByName('NumProcTrab').asFloat);
        while not(_CdsObjeto.EOF) do
        begin
          if (_CdsProcesso.FieldByName('FLGSITPROC').asFloat = 0) then
            rTotCusto := rTotCusto + _CdsObjeto.FieldByName('VALORESPERADO').asFloat
          else
            rTotCusto := rTotCusto + _CdsObjeto.FieldByName('VALORSENTENCA').asFloat;
          _CdsObjeto.Next;
        end;

        if (IncluirHonorarios) then
        begin
          _CdsHonorario.Data := ListHonorarios(_CdsProcesso.FieldByName('NumProcTrab').asFloat);
          while not(_CdsHonorario.EOF) do
          begin
            rTotDespe := rTotDespe + _CdsHonorario.FieldByName('VALORHONOR').asFloat;
            _CdsHonorario.Next;
          end;
        end;

        if (IncluirDespesasJud) then
        begin
          _CdsEtapa.Data := ListEtapas(_CdsProcesso.FieldByName('NumProcTrab').asFloat);
          while not(_CdsEtapa.EOF) do
          begin
            rTotDespe := rTotDespe + _CdsEtapa.FieldByName('VALORREC').asFloat;
            _CdsEtapa.Next;
          end;
        end;

        if (rTotCusto <> _CdsProcesso.FieldByName('CUSTOPROC').asFloat) or
           (rTotDespe <> _CdsProcesso.FieldByName('DESPESAPROC').asFloat) then
        begin
          _CdsProcesso.Edit;
          _CdsProcesso.FieldByName('CUSTOPROC').asFloat := rTotCusto;
          _CdsProcesso.FieldByName('DESPESAPROC').asFloat := rTotDespe;
          _CdsProcesso.Post;
          Inc(iTotAcert);
        end;

        Inc(iPos);
        DoProgresso([0, iPos, '']);
        _CdsProcesso.Next;
      end;

      bErro := not(GravarAcertos(_CdsProcesso));
    except
      on E: Exception do
      begin
        bErro := true;
        MessageInfo := E.Message;
      end;
    end;

    if (bErro) then
      MessageInfo := 'O erro abaixo foi gerado durante o processo:'+CR_LF+CR_LF+MessageInfo
    else
    begin
      DoProgresso([0, 0, '', iTotAcert]);
      MessageInfo := 'Procedimento Concluído com sucesso.';
    end;
  end;
end;

function TCtrlAcertaCustoProcJur.GravarAcertos(Cds: TCMClientDataSet): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(Cds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      Result := true;
      Cds.StatusFilter := [usModified];
      Cds.First;
      StartTransaction;
      while not(Cds.EOF) do
      begin
        Result := ExecSQL(
          'UPDATE PROCESSOTRAB SET'+CR_LF+
          '  CUSTOPROC='+Float2String(Cds.FieldByName('CUSTOPROC').asFloat)+','+CR_LF+
          '  DESPESAPROC='+Float2String(Cds.FieldByName('DESPESAPROC').asFloat)+CR_LF+
          'WHERE (NUMPROCTRAB = '+Cds.FieldByName('NUMPROCTRAB').asString+')');
        if not(Result) then
          break;
        Cds.Next;
      end;

      if (Result) then
        Commit
      else
        Rollback;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
