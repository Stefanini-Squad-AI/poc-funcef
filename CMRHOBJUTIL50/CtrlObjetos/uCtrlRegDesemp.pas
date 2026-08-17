{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 09/10/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlRegDesemp;

interface

uses Controls, Db, SysUtils, uCmDbObject, uCmControlObject, IvDictio, 
  uCMClientDataSet, uCtrlCustomRH, uDbHstAval, uDbHstDesemp;

type
  TCtrlRegDesemp = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbHstAval: TDbHstAval;
    FDbHstDesemp: TDbHstDesemp;
    FCdsHstAval: TCMClientDataSet;
    FCdsHstDesemp: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHstDesemp(IdPessoa: double = 0; CodTipoAval: double = 0;
      NumSeq: integer = 0): OleVariant;
    function ListRegDesemp(IdPessoa: double; CodTipoAval, NumSeq: integer;
      CodGrpFunc: string): OleVariant;
    function ListRegDesempPotencial(IdPessoa: double; CodGrpFunc: string;
      DataInicial, DataFinal: TDate): OleVariant;

    function GravarRegDesemp: boolean;
    function ExcluirRegDesemp: boolean;

    property CdsHstAval: TCMClientDataSet read FCdsHstAval write FCdsHstAval;
    property CdsHstDesemp: TCMClientDataSet read FCdsHstDesemp write FCdsHstDesemp;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlRegDesemp }

constructor TCtrlRegDesemp.Create;
begin
  inherited;
  FDbHstDesemp := TDbHstDesemp.Create(Self);
  FDbHstAval := TDbHstAval.Create(Self);
end;

destructor TCtrlRegDesemp.Destroy;
begin
  FDbHstDesemp.Free;
  FDbHstAval.Free;
  if (IsAppServer) then
  begin
    FCdsHstAval.Free;
    FCdsHstDesemp.Free;
  end;
  inherited;
end;

procedure TCtrlRegDesemp.OnCreateAppServer;
begin
  inherited;
  FCdsHstAval := TCMClientDataSet.Create(nil);
  FCdsHstDesemp := TCMClientDataSet.Create(nil);
end;

procedure TCtrlRegDesemp.DoChangeDataBase;
begin
  inherited;
  FDbHstAval.DataBaseName := DataBaseName;
  FDbHstDesemp.DataBaseName := DataBaseName;
end;

function TCtrlRegDesemp.ListHstDesemp(IdPessoa, CodTipoAval: double; NumSeq: integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdPessoa = -1) then
    sSQL := CR_LF+ 'WHERE' +CR_LF+ '  (1 = 2)'
  else
  if (IdPessoa > 0) or (CodTipoAval > 0) or (NumSeq > 0) then
  begin
    sSQL := CR_LF+ 'WHERE' +CR_LF;

    if (IdPessoa > 0) then
      sSQL := sSQL + '  (IDPESSOA    = ' +FloatToStr(IdPessoa)+ ')'+
        IFF((CodTipoAval>0) or (NumSeq>0), ' AND' +CR_LF, '') +CR_LF;

    if (CodTipoAval > 0) then
      sSQL := sSQL + '  (CODTIPOAVAL = ' +FloatToStr(CodTipoAval)+ ')'+
        IFF(NumSeq>0, ' AND' +CR_LF, '');

    if (NumSeq > 0) then
      sSQL := sSQL + '  (NUMSEQ      = ' +IntToStr(NumSeq)+ ')';
  end;    

  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  HSTDESEMP'+
    sSQL);
end;

function TCtrlRegDesemp.ListRegDesemp(IdPessoa: double; CodTipoAval, NumSeq: integer;
  CodGrpFunc: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  H.IDPESSOA, H.CODTIPOAVAL, H.IDFATORAVAL, H.NUMSEQ, H.GRAU, FA.DESCRFATORAVAL,'+CR_LF+
    '  NVL(PG.PESO,0) AS PESO, ROUND(NVL(PG.PESO,0) * H.GRAU,0) AS NOTA'+CR_LF+
    'FROM'+CR_LF+
    '  HSTDESEMP H, FATORAVAL FA,'+CR_LF+
    '  (SELECT IDFATORAVAL, PESO'+CR_LF+
    '   FROM   PESOFATGRP'+CR_LF+
    '   WHERE  (CODGRPFUNC = ' +QuotedStr(CodGrpFunc)+ ')) PG'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (H.CODTIPOAVAL = ' +IntToStr(CodTipoAval)+ ') AND'+CR_LF+
    '  (H.NUMSEQ      = ' +IntToStr(NumSeq)+ ') AND'+CR_LF+
    '  (H.IDFATORAVAL = FA.IDFATORAVAL(+)) AND'+CR_LF+
    '  (H.IDFATORAVAL = PG.IDFATORAVAL(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(FA.DESCRFATORAVAL)');
end;

function TCtrlRegDesemp.ListRegDesempPotencial(IdPessoa: double; CodGrpFunc: string;
  DataInicial, DataFinal: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  HA.DATAREAL, HA.AVALIACAO, SUM(NVL(PG.PESO,0) * HD.GRAU) AS POTENCIAL'+CR_LF+
    'FROM'+CR_LF+
    '  HSTAVAL HA, HSTDESEMP HD, TIPOAVAL TA, PESOFATGRP PG'+CR_LF+
    'WHERE'+CR_LF+
    '  (TA.FLGTIPOAVAL < 2) AND'+CR_LF+
    '  (PG.CODGRPFUNC  = ' +QuotedStr(CodGrpFunc)+ ') AND'+CR_LF+
    '  (HA.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
    '  (HA.DATAREAL BETWEEN TO_DATE(' +QuotedStr(DateToStr(DataInicial))+ ', ''DD/MM/YYYY'') AND'+CR_LF+
    '                       TO_DATE(' +QuotedStr(DateToStr(DataFinal))+ ', ''DD/MM/YYYY'')) AND'+CR_LF+
    '  (HA.CODTIPOAVAL = TA.CODTIPOAVAL) AND'+CR_LF+
    '  (HA.IDPESSOA    = HD.IDPESSOA(+)) AND'+CR_LF+
    '  (HA.CODTIPOAVAL = HD.CODTIPOAVAL(+)) AND'+CR_LF+
    '  (HA.NUMSEQ      = HD.NUMSEQ(+)) AND'+CR_LF+
    '  (HD.IDFATORAVAL = PG.IDFATORAVAL(+))'+CR_LF+
    'GROUP BY'+CR_LF+
    '  HA.DATAREAL, HA.AVALIACAO'+CR_LF+
    'ORDER BY'+CR_LF+
    '  HA.DATAREAL');
end;

function TCtrlRegDesemp.GravarRegDesemp: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarRegDesemp(FCdsHstAval.Data, FCdsHstDesemp.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHstAval, FDbHstAval, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsHstDesemp, FDbHstDesemp, [], []);
        if not(Result) then
          raise Exception.Create(FDbHstDesemp.MessageInfo);
      end
      else
        raise Exception.Create(FDbHstAval.MessageInfo);

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

function TCtrlRegDesemp.ExcluirRegDesemp: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirRegDesemp(FCdsHstAval.Data, FCdsHstDesemp.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsHstDesemp, FDbHstDesemp, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsHstAval, FDbHstAval, [], []);
        if not(Result) then
          raise Exception.Create(FDbHstAval.MessageInfo);
      end
      else
        raise Exception.Create(FDbHstDesemp.MessageInfo);

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

end.
