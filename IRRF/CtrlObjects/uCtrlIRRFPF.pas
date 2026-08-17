{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/03/2002                             }
{                                                       }
{*******************************************************}

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : Várias
Data      : 28/09/2006
Autor     : André Pontes
Pendência : 18950
Descrição : Implementação de rotinas para manutenção da tabela REGRESSIVA de IR
---------------------------------------------------------------------------------------------------}

unit uCtrlIRRFPF;

interface

uses
   sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uSistema, DbClient,
   uDbIRRF, uDbIRRFRegressiva,    
   {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


  type
    TCtrlIRRFPF = Class(TCmControlObject)

    private

      FDbIRRFPF            : TDbIRRF;
      FDbIRRFRegressiva    : TDbIRRFRegressiva;
      FCdsIRRFPF           : TClientDataSet;
      FCdsIRRFRegressiva   : TClientDataSet;

      procedure SetDbIRRFPF(const Value: TDbIRRF);
      procedure SetDbIRRFRegressiva(const Value: TDbIRRFRegressiva);

      procedure SetCdsIRRFPF(const Value: TClientDataSet);
      procedure SetCdsIRRFRegressiva(const Value: TClientDataSet);


    protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


    public

      constructor Create; override;
      destructor Destroy; override;

      property CdsIRRFPF         : TClientDataSet     read FCdsIRRFPF            write SetCdsIRRFPF;
      property CdsIRRFRegressiva : TClientDataSet     read FCdsIRRFRegressiva    write SetCdsIRRFRegressiva;
      property DbIRRFPF          : TDbIRRFRegressiva  read FDbIRRFRegressiva     write setDbIRRFRegressiva;
      property DbIRRFRegressiva  : TDbIRRF            read FDbIRRFPF             write setDbIRRFPF;

      function GravarIRRFPF         : Boolean;
      function GravaTabIRRegressiva : Boolean;

      function ProcurarIRRFPF(IDIRRF : Integer) : OleVariant;
      function ProcuraIRRFRegressiva(const IDIRRF: Integer): OleVariant;

      
    protected


    end;



implementation

{ TCtrlIRRFPF }



constructor TCtrlIRRFPF.Create;
begin
   inherited;

   FDbIRRFPF         := TDbIRRF.create(self);
   FDbIRRFRegressiva := TDbIRRFRegressiva.create(self);
end;



destructor TCtrlIRRFPF.Destroy;
begin
   FDbIRRFPF.Free;
   FDbIRRFRegressiva.Free;

   if isAppServer then
   begin
      FCdsIRRFPF.free;
   end;

   inherited;
end;



procedure TCtrlIRRFPF.DoChangeDataBase;
begin
   inherited;
   DbIRRFPF.DataBaseName         := DataBaseName;
   DbIRRFRegressiva.DataBaseName := DataBaseName;
end;



function TCtrlIRRFPF.GravarIRRFPF: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarIRRFPF(FCdsIRRFPF.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai
           Result := ApplyCds(FCdsIRRFPF,FDbIRRFPF,[],[], true);
           Msg    := FDbIRRFPF.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;


function TCtrlIRRFPF.ProcurarIRRFPF(IDIRRF : Integer) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM IRRF '+
          ' WHERE IDIRRF = '+IntToStr(IDIRRF);
  Result := GetDataPacket(Ssql);
end;



function TCtrlIRRFPF.ProcuraIRRFRegressiva(const IDIRRF: Integer): OleVariant;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                                                         + #13 +
   '   IRR.IDIRRF, IRR.DATAVIGENCIA, IRR.PRAZOACUM, IRR.ALIQUOTA '   + #13 +
   'FROM '                                                           + #13 +
   '   IRRFREGRESSIVA IRR '                                          + #13 +
   'WHERE '                                                          + #13 +
   '   IRR.IDIRRF = ' + IntToStr(IDIRRF);

   Result := GetDataPacket(Ssql);
end;



procedure TCtrlIRRFPF.OnCreateAppServer;
begin
   inherited;

   FcdsIRRFPF           := TClientDataSet.Create(nil);
   FcdsIRRFRegressiva   := TClientDataSet.Create(nil);
end;



function TCtrlIRRFPF.GravaTabIRRegressiva: Boolean;
var
   Msg : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaTabIRRegressiva(FCdsIRRFRegressiva.data);
      if not(Result) then
      begin
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         Result   := ApplyCds(FCdsIRRFRegressiva, FDbIRRFRegressiva, [],[], True);
         Msg      := FDbIRRFRegressiva.MessageInfo;
         if not(Result) then
         begin
            raise Exception.Create(Msg);
         end;
      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



procedure TCtrlIRRFPF.SetCdsIRRFRegressiva(const Value: TClientDataSet);
begin
   FCdsIRRFRegressiva := Value;
end;



procedure TCtrlIRRFPF.SetDbIRRFRegressiva(const Value: TDbIRRFRegressiva);
begin
   FDbIRRFRegressiva := Value;
end;



procedure TCtrlIRRFPF.SetCdsIRRFPF(const Value: TClientDataSet);
begin
   FCdsIRRFPF := Value;
end;




procedure TCtrlIRRFPF.SetDbIRRFPF(const Value: TDbIRRF);
begin
   FDbIRRFPF := Value;
end;



end.

