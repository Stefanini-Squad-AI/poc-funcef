unit uCtrlCampoDePara;

interface

Uses DB, uDataBase, uDbCampoDePara, uCmControlObject, dbclient, sysutils,Provider,
      ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlCampoDePara = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbCampoDePara  : TDbCAmpoDePara;

      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsCampoDePara : TClientDataSet;

      procedure SetcdsCampoDePara(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property cdsCampoDePara: TClientDataSet Read FCdsCampoDePara Write SetCdsCampoDePara;

      {Esta função tem o Objetivo de retornar registros da tabela campo De-Para}
      Function ListCampoDePara(dTabela :Double):OleVariant;

    End;


implementation

{ TCtrlCampoDePara }

constructor TCtrlCampoDePara.Create;
begin
  inherited;
  _dbCampoDePara  := TDbCampoDePara.Create(Self);
end;

destructor TCtrlCampoDePara.Destroy;
begin
  inherited;

  _dbCampoDePara.Free;
  if isAppServer then FCdsCampoDePara.Free;

end;



procedure TCtrlCampoDePara.DoChangeDataBase;
begin
  inherited;
  _dbCampoDePara.DataBaseName := DataBaseName;

end;


procedure TCtrlCampoDePara.SetCdsCampoDePara(const Value: TClientDataSet);
begin
  FCdsCampoDePara := Value;
end;



procedure TCtrlCampoDePara.OnCreateAppServer;
begin
  inherited;
  FCdsCAmpoDePara := TClientDataSet.Create(nil);

end;

function TCtrlCampoDePara.ListCampoDePara(dTabela: Double): OleVariant;
var
  sSql, sFiltro, sOrdem :string;

begin
          sSql := 'SELECT '+
                  '    IDCAMPODEPARA, IDTABELADEPARA, NOMECAMPOCONTA '+
                  'FROM ' +
                  '    CAMPODEPARA ';

      //----------------------------------------------------------
      sfiltro := '';
      If (dTabela <> 0) Then
         sfiltro :=   'WHERE (IDTABELADEPARA = ' + FloatToStr(dTabela) + ') ';
     //----------------------------------------------------------

     sOrdem := 'ORDER BY  NOMECAMPOCONTA ';

     sSql := Ssql + sFiltro + sOrdem;

     Result := GetDataPacket(sSql);

end;
end.
