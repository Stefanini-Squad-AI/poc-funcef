unit uCtrlCampoDeParaCR;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils,
   Provider, ComCtrls, DBTables,
   uDbCampoDeParaCR,
   {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type

   TCtrlCampoDeParaCR = Class(TCmControlObject)

   private
      dbCampoDeParaCR   : TDbCampoDeParaCR;
      FCdsCampoDeParaCR : TClientDataSet;

      procedure SetcdsCampoDeParaCR(const Value: TClientDataSet);


   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   public

      constructor Create; override;
      destructor Destroy; override;

      property cdsCampoDeParaCR: TClientDataSet read FCdsCampoDeParaCR write SetCdsCampoDeParaCR;

      function ListaCampoDeParaCR(IDTabela: Double): OleVariant;


   end;



implementation




constructor TCtrlCampoDeParaCR.Create;
begin
   inherited;
   dbCampoDeParaCR  := TDbCampoDeParaCR.Create(Self);
end;



destructor TCtrlCampoDeParaCR.Destroy;
begin
   inherited;

   dbCampoDeParaCR.Free;
   if isAppServer then FCdsCampoDeParaCR.Free;
end;



procedure TCtrlCampoDeParaCR.DoChangeDataBase;
begin
   inherited;
   dbCampoDeParaCR.DataBaseName := DataBaseName;
end;


procedure TCtrlCampoDeParaCR.SetCdsCampoDeParaCR(const Value: TClientDataSet);
begin
   FCdsCampoDeParaCR := Value;
end;



procedure TCtrlCampoDeParaCR.OnCreateAppServer;
begin
   inherited;

   FCdsCAmpoDeParaCR := TClientDataSet.Create(nil);
end;



function TCtrlCampoDeParaCR.ListaCampoDeParaCR(IDTabela: Double): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                  + #13 +
   '   IDCAMPODEPARACR, '     + #13 +
   '   IDTABELADEPARACR, '    + #13 +
   '   NOMECAMPO '            + #13 +
   'FROM '                    + #13 +
   '   CAMPODEPARACR '        + #13;

   if (IDTabela > 0) then sSQL := sSQL +
   'WHERE ' + #13 +
   '   IDTABELADEPARACR = ' + FormatFloat('#0', IDTabela) + #13;

   sSQL := sSQL +
   'ORDER BY ' + #13 +
   '   NOMECAMPO ';

   Result := GetDataPacket(sSQL);
end;



end.
