unit uCtrlPeriodoOrcamen;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, uDbPeriodoOrcamen, uCMTypes;

Type
  TCtrlPeriodoOrcamen = class(TCmControlObject)

  Protected

    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;

  Private

    _dbPeriodoOrcamen  : TDbPeriodoOrcamen;
    FCdsPeriodoOrcamen : TClientDataSet;
    procedure SetCdsPeriodoOrcamen(const Value: TClientDataSet);

  Public

      Constructor Create;  Override;
      Destructor  Destroy; Override;

      property CdsPeriodoOrcamen : TClientDataSet read FCdsPeriodoOrcamen write SetCdsPeriodoOrcamen;

      function AplicaOperacaoPeriodoOrcamen : Boolean;
      function Procurar( idPeriodoOrcamen,
                         pExercicio,
                         pPeriodo          : Integer ) : OleVariant;
      Function ListaPeriodoOrc(idEmpresa : Double; iExercicio:Integer) : OleVariant;
      Function InicioFimPeriodo(exercicio, periodo, idpessoa: integer) : OleVariant;
      Function Exercicios(idpessoa: integer) : OleVariant;
      Procedure EncerraExercicio(idpessoa, exercicio: integer);
  end;

implementation
//************************************************
Procedure TCtrlPeriodoOrcamen.OnCreateAppServer;
Begin
  Inherited;

  FCdsPeriodoOrcamen := TClientDataSet.Create(nil);
End;
//************************************************
procedure TCtrlPeriodoOrcamen.DoChangeDataBase;
begin
  inherited;
  _dbPeriodoOrcamen.DatabaseName := DataBaseName;
end;
//************************************************
constructor TCtrlPeriodoOrcamen.Create;
begin
  inherited;
  _dbPeriodoOrcamen := TdbPeriodoOrcamen.Create( Self );
end;
//************************************************
destructor TCtrlPeriodoOrcamen.Destroy;
begin
  inherited;
  _dbPeriodoOrcamen.Free;

  If ( isAppServer ) Then Begin

    FCdsPeriodoOrcamen.Free;
  End;
end;
//************************************************
function TCtrlPeriodoOrcamen.AplicaOperacaoPeriodoOrcamen: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoPeriodoOrcamen(FCdsPeriodoOrcamen.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsPeriodoOrcamen,_DbPeriodoOrcamen,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbPeriodoOrcamen.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;


function TCtrlPeriodoOrcamen.Procurar( idPeriodoOrcamen,
                                        pExercicio,
                                        pPeriodo          : Integer ) : OleVariant;
begin
   _DbPeriodoOrcamen.IdPessoa.AsFloat    := idPeriodoOrcamen;
   _DbPeriodoOrcamen.Exercicio.AsInteger := pExercicio;
   _DbPeriodoOrcamen.Periodo.AsInteger   := pPeriodo;

   Result := GetDataPacket(_DbPeriodoOrcamen.SSqlSelect);
end;

procedure TCtrlPeriodoOrcamen.SetCdsPeriodoOrcamen(
  const Value: TClientDataSet);
begin
  FCdsPeriodoOrcamen := Value;
end;

function TCtrlPeriodoOrcamen.ListaPeriodoOrc(idEmpresa : Double; iExercicio:Integer) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT EXERCICIO, PERIODO, IDPESSOA, DATAINIPERIODO, '+
           '       DATAFIMPERIODO, NOMEPERIODO, FLGBLOQUEADO,    '+
           '       EXERCICIO||''/''||NOMEPERIODO AS NOMEEXERC           '+
           'FROM PERIODOORCAMEN                                  '+
           'WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')         ';
   if iExercicio <> 0 then
      sSql := sSql + '   AND (EXERCICIO = '+IntToStr(iExercicio)+') ';
   sSql := sSql + 'ORDER BY EXERCICIO, PERIODO ';
   Result := GetDataPacket(sSql);
end;


Function TCtrlPeriodoOrcamen.InicioFimPeriodo(exercicio, periodo, idpessoa: integer) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT ' +
           'DATAINIPERIODO, DATAFIMPERIODO ' +
           'FROM ' +
           'PERIODOORCAMEN ' +
           'WHERE ' +
           '(IDPESSOA = ' + IntToStr(idpessoa) + ') AND ' +
           '(EXERCICIO = ' + IntToStr(exercicio) + ') AND ' +
           '(PERIODO = ' + IntToStr(periodo) + ')';
   Result := GetDataPacket(sSql);
end;

Function TCtrlPeriodoOrcamen.Exercicios(idpessoa: integer) : OleVariant;
var sSQl : String;
begin
  sSql := 'SELECT DISTINCT ' +
          'EXERCICIO ' +
          'FROM ' +
          'PERIODOORCAMEN ' +
          'WHERE ' +
          'IDPESSOA = ' + IntToStr(idpessoa) +
          ' ORDER BY ' +
          'EXERCICIO';
   Result := GetDataPacket(sSql);
end;

Procedure TCtrlPeriodoOrcamen.EncerraExercicio(idpessoa, exercicio: integer);
var sSQl : String;
begin
  sSql := 'UPDATE ' +
          'PERIODOORCAMEN ' +
          'SET ' +
          'FLGBLOQUEADO = ''S'' ' +
          'WHERE ' +
          '(EXERCICIO = ' + IntToStr(exercicio) + ') AND ' +
          '(IDPESSOA = ' + IntToStr(idpessoa) + ')';
   ExecSql(sSql);
end;

end.


