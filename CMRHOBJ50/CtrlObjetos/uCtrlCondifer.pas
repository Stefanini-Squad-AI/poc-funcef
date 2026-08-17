unit uCtrlCondifer;

// Alterações:
{ --------------------------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/01/2015
 Sol........: 229873.16665
 Kintana....: 570016
 Descrição..: Criação da Control.
--------------------------------------------------------------------------------------------------}


interface

uses Classes, Db, Controls, SysUtils, uSistema, uCmDbObject, uCmControlObject,
  uCMClientDataSet, uCtrlCustomRH, uDbCondifer, uDbAgenteRiscoXCondifer, uCMTypes;

type
    TCtrlCondifer = class(TCtrlCustomRH)
    private
      FCdsCondifer : TCMClientDataSet;
      sSQL : string;
      FDbCondifer : TDbCondifer;
      FCdsArxCondifer: TCMClientDataSet;
      FDbArXCondifer: TDbAgenteRiscoXCondifer;
    protected
      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;
    public
      constructor Create; override;
      destructor Destroy; override;

      function ListCondifer(IdPessoa : Double) : OleVariant;
      function ListTipCond : OleVariant;
      function ListGeral(IdPessoa : Double) : OleVariant;
      function ListAgenteRiscoXCondifer(IdPessoa : Double) : OleVariant;
      function ListPPRAAgenteRisco : OleVariant;
      function GetSequenceCondifer : Integer;
      function Gravar : boolean;

      property CdsCondifer : TCMClientDataSet read FCdsCondifer write FCdsCondifer;
      property CdsArxCondifer : TCMClientDataSet read FCdsArxCondifer write FCdsArxCondifer;
    end;

implementation

{ TCtrlCondifer }

constructor TCtrlCondifer.Create;
begin
  inherited;
  FDbCondifer := TDbCondifer.Create(Self);
  FDbArXCondifer := TDbAgenteRiscoXCondifer.Create(Self);
end;

procedure TCtrlCondifer.DoChangeDataBase;
begin
  inherited;
  FDbCondifer.DataBaseName := DataBaseName;
  FDbArXCondifer.DataBaseName := DataBaseName;
end;

function TCtrlCondifer.GetSequenceCondifer: Integer;
begin
  sSQL := 'SELECT SEQCONDIFER.NEXTVAL AS IDCONDIFER FROM DUAL';

  _Cds.Data := GetDataPacket(sSQL);
  Result := _Cds.FieldByName('IDCONDIFER').AsInteger;
end;

function TCtrlCondifer.ListAgenteRiscoXCondifer(
  IdPessoa: Double): OleVariant;
begin
  sSQL := 'SELECT ARXC.*, ' +
          '       DECODE(ARXC.UTILEPI, 0, ''Não Aplicável'', ' +
          '                            1, ''Eficaz'', ' +
          '                            2, ''Não Eficaz'') AS UTILEPI2, ' +
          '       DECODE(ARXC.UTILEPC, 0, ''Não Aplicável'', ' +
          '                            1, ''Eficaz'', ' +
          '                            2, ''Não Eficaz'') AS UTILEPC2, ' +
          '       A.DESCRICAO ' + 
          '  FROM AGENTERISCOXCONDIFER ARXC, CONDIFER C, PPRAAGENTERISCO A ' +
          ' WHERE C.IDPESSOA = ' + FloatToStr(IdPessoa) +
          '   AND C.IDCONDIFER = ARXC.IDCONDIFER ' + 
          '   AND ARXC.IDAGENTERISCO = A.IDAGENTERISCO(+)';

  Result := GetDataPacket(sSQL);
end;

function TCtrlCondifer.ListCondifer(IdPessoa: Double): OleVariant;
begin
   sSQL := ' SELECT C.IDCONDIFER, ' +
           '        C.IDPESSOA, ' +
           '        C.IDTIPCONDICAO, ' +
           '        C.DTINICIOCONDIF, ' +
           '        C.DTFIMCONDIF, ' +
           '        C.FLGMOTIVIMPLEMEPI, ' +
           '        C.FLGCONDEPI, ' +
           '        C.FLGPRAZO, ' +
           '        C.FLGPROGAMB, ' +
           '        C.FLGHIGI, ' +
           '        T.DESCRICAO ' +
           '   FROM CONDIFER C, TIPCONDICAO T ' +
           '  WHERE C.IDPESSOA = ' + FloatToStr(IdPessoa) +
           '    AND C.IDTIPCONDICAO = T.IDTIPCONDICAO';

   Result := GetDataPacket(sSQL);
end;

function TCtrlCondifer.ListGeral(IdPessoa: Double): OleVariant;
begin
  sSQL := 'SELECT F.IDPESSOA, ' +
          '       F.MATRICULA, ' +
          '       P.NOME, ' +
          '       SF.DESCRICAO, ' +
          '       C.TITULO, ' +
          '       F.DATAADMISSAO ' +
          '  FROM PESSOA P, ' +
          '       CARGO C, ' +
          '       FUNCIONARIO F, ' +
          '       SITFUNC SF ' +
          ' WHERE ( F.IDPESSOA = ' + FloatToStr(IdPessoa) + ') ' +
          '   AND ( F.IDPESSOA = P.IDPESSOA )  ' +
          '   AND ( F.IDCARGO = C.IDCARGO(+) )  ' +
          '   AND ( F.IDSITFUNC = SF.IDSITFUNC(+) )';
          
  Result := GetDataPacket(sSQL);
end;

function TCtrlCondifer.ListPPRAAgenteRisco: OleVariant;
begin
 sSQL := 'SELECT IDAGENTERISCO, ' +
         '       DESCRICAO, ' +
         '(CASE WHEN INDTIPO = 1 THEN ''Químico'' ' +
         '      WHEN INDTIPO = 2 THEN ''Biológico'' ' +
         '      WHEN INDTIPO = 3 THEN ''Físico'' ' +
         '      WHEN INDTIPO = 4 THEN ''Ergonômico'' ' +
         '      WHEN INDTIPO = 5 THEN ''Mecânico''  END) AS TIPO, ' +
         '      IDAGENTERISCO ' +
         '  FROM PPRAAGENTERISCO';

 Result := GetDataPacket(sSQL);

end;

function TCtrlCondifer.ListTipCond: OleVariant;
begin
  sSQL := 'SELECT * FROM TIPCONDICAO';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlCondifer.OnCreateAppServer;
begin
  inherited;
  FCdsCondifer := TCMClientDataSet.Create(nil);
  FCdsArxCondifer := TCMClientDataSet.Create(nil);
end;

function TCtrlCondifer.Gravar : boolean;
begin
   if (ConnectionSide = cnsClient) then
   begin
      Result := Connection.AppServer.Gravar(FCdsCondifer.Data, FCdsArxCondifer.Data);
      if not(Result) then
        MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
     try
       StartTransaction;

       Result := ApplyCds(CdsCondifer, FDbCondifer, [], []);
       if not(Result) then
          raise Exception.Create(FDbCondifer.MessageInfo);

       Result := ApplyCds(CdsArxCondifer, FDbArXCondifer, [], []);
       if not(Result) then
          raise Exception.Create(FDbArXCondifer.MessageInfo);

       Commit;
     except
       on e : exception do
       begin
         Rollback;
         Result := False;
         MessageInfo := e.Message;
       end;
     end;
   end;
end;

destructor TCtrlCondifer.Destroy;
begin
  FreeAndNil(FDbCondifer);
  FreeAndNil(FDbArXCondifer);

  if (IsAppServer) then
  begin
    FreeAndNil(FCdsCondifer);
    FreeAndNil(FCdsArxCondifer);
  end;
  
  inherited;

end;

end.
