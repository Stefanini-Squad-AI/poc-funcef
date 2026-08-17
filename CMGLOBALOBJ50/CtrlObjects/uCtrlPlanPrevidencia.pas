// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 26/08/2006
Pendencia : 22217
Descrição : Criado o Ctrl
---------------------------------------------------------------------------------------------------}

unit uCtrlPlanPrevidencia;

interface

uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbPlanPrevidencia;

type
   TCtrlPlanPrevidencia = class(TCmControlObject)

   protected
      procedure DoChangeDataBase; override;


   private
      //--------------------------------------------------------------------------------------------
      //    Classes de Persistência
      //--------------------------------------------------------------------------------------------

      _DbPlanPrevidencia : TDBPlanPrevidencia;
      Fcds               : TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
   public

      property cds: TClientDataSet read Fcds write Setcds;

      //--------------------------------------------------------------------------------------------
      //    Métodos
      //--------------------------------------------------------------------------------------------

      constructor Create;  override;
      destructor  Destroy; override;

      //--------------------------------------------------------------------------------------------
      //    Metodos da Regra de Negócio
      //--------------------------------------------------------------------------------------------

      function  ListaPlanPrev(IDPlanoPrev: Double = 0): OleVariant;
      function  Gravar: Boolean;
  end;

implementation

{$IFNDEF VERSAO0505}
uses
   uCmTypes;
{$ENDIF}



function TCtrlPlanPrevidencia.Gravar: Boolean;
var
   sMsg: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.Gravar(Fcds.Data);

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
        StartTransaction;
        Result := ApplyCds(Fcds, _DBPlanPrevidencia, [], [] );
        sMsg   := _DBPlanPrevidencia.MessageInfo;

        if not(Result) then Raise Exception.Create(sMsg);

        Commit;
      except
         on E:Exception do
         begin
            Rollback;
            Result       := False;
            MessageInfo  := E.Message;
         end;
      end;
   end;
end;



constructor TCtrlPlanPrevidencia.Create;
begin
   inherited;
   _DBPlanPrevidencia := TDBPlanPrevidencia.Create(Self);
   FCds               := TClientDataSet.Create( nil );
end;



destructor TCtrlPlanPrevidencia.Destroy;
begin
   if Fcds.Active then Fcds.Close;

   Fcds := nil;
   Fcds.Free;

   _DBPlanPrevidencia.Free;

   inherited;
end;



procedure TCtrlPlanPrevidencia.DoChangeDataBase;
begin
   inherited;
   _DBPlanPrevidencia.DataBaseName := DatabaseName;
end;



function TCtrlPlanPrevidencia.ListaPlanPrev(IDPlanoPrev: Double = 0): OleVariant;
var
  sSQL, sParam: String;
begin

  sParam := '';
  if IDPlanoPrev <> 0  then sParam := sParam + '  AND ( IDPLANOPREV =  ' + FormatFloat('#0', IDPlanoPrev) + ' ) ' + #13;

  sSQL   := 'SELECT * '      + #13 +
            'FROM PLANPREV'  + #13 +
            'WHERE 1=1 '     + #13 +
            sParam           + #13 +
            'ORDER BY NOME ';

  Result := GetDataPacket(sSQL);
end;



procedure TCtrlPlanPrevidencia.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;



end.
