unit uCtrlCampoDeParaCC;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils,
   Provider, ComCtrls, DBTables,
   uDbCampoDeParaCC,
   {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type

   TCtrlCampoDeParaCC = Class(TCmControlObject)

   private
      dbCampoDeParaCC   : TDbCampoDeParaCC;
      FCdsCampoDeParaCC : TClientDataSet;

      procedure SetCdsCampoDeParaCC(const Value: TClientDataSet);


   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   public

      constructor Create; override;
      destructor Destroy; override;

      property cdsCampoDeParaCC: TClientDataSet read FCdsCampoDeParaCC write SetCdsCampoDeParaCC;

      function ListaCampoDeParaCC(IDTabela: Double): OleVariant;


   end;



implementation




constructor TCtrlCampoDeParaCC.Create;
begin
   inherited;
   dbCampoDeParaCC  := TDbCampoDeParaCC.Create(Self);
end;



destructor TCtrlCampoDeParaCC.Destroy;
begin
   inherited;

   dbCampoDeParaCC.Free;
   if isAppServer then FCdsCampoDeParaCC.Free;
end;



procedure TCtrlCampoDeParaCC.DoChangeDataBase;
begin
   inherited;
   dbCampoDeParaCC.DataBaseName := DataBaseName;
end;


procedure TCtrlCampoDeParaCC.SetCdsCampoDeParaCC(const Value: TClientDataSet);
begin
   FCdsCampoDeParaCC := Value;
end;



procedure TCtrlCampoDeParaCC.OnCreateAppServer;
begin
   inherited;

   FCdsCAmpoDeParaCC := TClientDataSet.Create(nil);
end;



function TCtrlCampoDeParaCC.ListaCampoDeParaCC(IDTabela: Double): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                  + #13 +
   '   IDCAMPODEPARACC, '     + #13 +
   '   IDTABELADEPARACC, '    + #13 +
   '   NOMECAMPO '            + #13 +
   'FROM '                    + #13 +
   '   CAMPODEPARACC '        + #13;

   if (IDTabela > 0) then sSQL := sSQL +
   'WHERE ' + #13 +
   '   IDTABELADEPARACC = ' + FormatFloat('#0', IDTabela) + #13;

   sSQL := sSQL +
   'ORDER BY ' + #13 +
   '   NOMECAMPO ';

   Result := GetDataPacket(sSQL);
end;



end.
