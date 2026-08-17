unit uCtrlDocrecxcomp;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils,wwQuery, provider,
  uDbDocrecxcomp, uCMTypes, uFuncoesOrcamento;

Type
  TCtrlDocrecxcomp = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbDocrecxcomp: TdbDocrecxcomp;
    FCdsDocrecxcomp: TClientDataSet;
    procedure SetCdsDocrecxcomp(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsDocrecxcomp: TClientDataSet
                               read FCdsDocrecxcomp write SetCdsDocrecxcomp;

      function AplicaOperacaoDocRecXComp : Boolean;
      function Procurar(CodDocumento:Double): OleVariant;
      procedure InsDocumentos(idreservaorcamen, coddocumento,
        vlrreembolso: double);
      procedure AltDocumentos(idreservaorcamen, coddocumento,
        vlrreembolso: double);

  end;

implementation


procedure TCtrlDocrecxcomp.DoChangeDataBase;
begin
  inherited;
  _dbDocrecxcomp.DatabaseName := DataBaseName;
end;

procedure TCtrlDocrecxcomp.OnCreateAppServer;
begin
  inherited;
  FCdsDocrecxcomp := TClientDataSet.Create(nil);
end;

constructor TCtrlDocrecxcomp.Create;
begin
  inherited;
  _dbDocrecxcomp := TdbDocrecxcomp.Create(self);
end;

destructor TCtrlDocrecxcomp.Destroy;
begin
  inherited;
  _dbDocrecxcomp.Free;
  if isAppServer then begin
    FreeCds([FCdsDocrecxcomp]);
  end;
end;

function TCtrlDocrecxcomp.AplicaOperacaoDocRecXComp: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result :=
           Connection.AppServer.AplicaOperacaoDocRecXComp(FCdsDocrecxcomp.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsDocrecxcomp,_DbDocrecxcomp,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbDocrecxcomp.MessageInfo;
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


function TCtrlDocrecxcomp.Procurar(CodDocumento:Double): OleVariant;
begin
   _DbDocrecxcomp.CodDocumento.AsFloat := CodDocumento;
   Result := GetDataPacket(_DbDocrecxcomp.SSqlSelect);
end;

procedure TCtrlDocrecxcomp.SetCdsDocrecxcomp(
  const Value: TClientDataSet);
begin
  FCdsDocrecxcomp := Value;
end;

procedure TCtrlDocrecxcomp.InsDocumentos(idreservaorcamen, coddocumento,
  vlrreembolso: double);
var sSql: string;
begin
  sSql := 'INSERT INTO DOCRECXCOMP(IDRESERVAORCAMEN,CODDOCUMENTO, ' +
          'VLRREEMBOLSO) VALUES (' + TrocaVPP(FloatToStr(idreservaorcamen)) +
          ',' + FloatToStr(coddocumento) + ',' +
          TrocaVPP(FloatToStr(vlrreembolso)) + ')';
  ExecSQL(sSql);
end;

procedure TCtrlDocrecxcomp.AltDocumentos(idreservaorcamen, coddocumento,
  vlrreembolso: double);
var sSql: string;
begin
  sSql := 'UPDATE DOCRECXCOMP SET ' +
          'VLRREEMBOLSO   = VLRREEMBOLSO + ' +
          TrocaVPP(FloatToStr(vlrreembolso)) +
          ' WHERE (IDRESERVAORCAMEN = ' +
          TrocaVPP(FloatToStr(idreservaorcamen)) +
          ') AND (CODDOCUMENTO = ' + TrocaVPP(FloatToStr(coddocumento)) + ')';
  ExecSQL(sSql);
end;

end.


