{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlDiaExtra;

interface

uses SysUtils, DB, Controls, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uDbDiaExtraTrab;

type
  TCtrlDiaExtra = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbDiaExtraTrab;
    FCds: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListDiasExtra(ListaIdPessoa: string = ''; DiaTrabInicial: TDate = 0;
      DiaTrabFinal: TDate = 0): OleVariant;

    function Gravar: boolean;
    function LancamentoColetivo(const IAppCliente: OleVariant; ListaIdFunc: string;
      DataRef: TDate): boolean;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;
//variants;

{ TCtrlDiaExtra }

constructor TCtrlDiaExtra.Create;
begin
  inherited;
  FDb := TDbDiaExtraTrab.Create(Self);
end;

destructor TCtrlDiaExtra.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlDiaExtra.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlDiaExtra.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlDiaExtra.ListDiasExtra(ListaIdPessoa: string; DiaTrabInicial,
  DiaTrabFinal: TDate): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (ListaIdPessoa = '-1') or (DiaTrabInicial = -1) or (DiaTrabFinal = -1) then
    sSQL := 'WHERE (1 = 2)'
  else
  begin
    if (ListaIdPessoa <> '') then
      if (Pos(',', ListaIdPessoa) > 0) then
        sSQL := '  (IDPESSOA IN ('+ListaIdPessoa+'))'
      else
        sSQL := '  (IDPESSOA  = ' +ListaIdPessoa+ ')';

    if (DiaTrabInicial > 0) then
    begin
      if (sSQL <> '') then
        sSQL := sSQL + ' AND'+CR_LF
      else
        sSQL := sSQL + CR_LF;

      if (DiaTrabFinal > 0) then
      begin
        sSQL := sSQL + '  (DIATRAB  >= TO_DATE('+QuotedStr(DateToStr(DiaTrabInicial))+
          ',''DD/MM/YYYY'')) AND' + CR_LF;
        sSQL := sSQL + '  (DIATRAB  <= TO_DATE('+QuotedStr(DateToStr(DiaTrabFinal))+
          ',''DD/MM/YYYY''))' + CR_LF;
      end
      else
        sSQL := sSQL + '  (DIATRAB   = TO_DATE('+QuotedStr(DateToStr(DiaTrabInicial))+
          ',''DD/MM/YYYY''))'+CR_LF;
    end;

    if (sSQL <> '') then
      sSQL := 'WHERE'+sSQL;
  end;

  Result := GetDataPacket(
    'SELECT'+IFF(sSQL='WHERE (1 = 2)',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDPESSOA, DIATRAB'+CR_LF+
    'FROM'+CR_LF+
    '  DIAEXTRATRAB'+CR_LF+
    sSQL);
end;

function TCtrlDiaExtra.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarDiaExtra(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, FDb, [], []);
      if not(Result) then
        raise Exception.Create(FDb.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlDiaExtra.LancamentoColetivo(const IAppCliente: OleVariant; ListaIdFunc: string;
  DataRef: TDate): boolean;
var
  sIdFunc: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.LancamentoColetivo(IAppCliente, ListaIdFunc, DataRef);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := true;
      
      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarAcertoDependente_CB(('Lançando Dias Extras...'));
      except
      end;

      StartTransaction;

      while (ListaIdFunc <> '') do
      begin
        ExtraiString(ListaIdFunc, sIdFunc, ',');
        Result := ExecSQL(
          'INSERT INTO DIAEXTRATRAB (IDPESSOA,DIATRAB) VALUES (' +
          sIdFunc+ ',TO_DATE(' +QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''))');
        if not(Result) then
          raise Exception.Create(MessageInfo);

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarAcertoDependente_CB('');
        except
        end;
      end;

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarAcertoDependente_CB(('Gravando...'));
      except
      end;

      Commit;

      MessageInfo := ('Processo executado com sucesso.');
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
