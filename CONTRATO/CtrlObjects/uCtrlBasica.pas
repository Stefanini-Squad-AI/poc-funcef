unit uCtrlBasica;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes;

type
   TCtrl = Class(TCmControlObject)

   private

   public
      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrl }

constructor TCtrl.Create;
begin
  inherited;

end;

procedure TCtrl.OnCreateAppServer;
begin
  inherited;

end;

destructor TCtrl.Destroy;
begin
  inherited;

end;

procedure TCtrl.AfterInitialize;
begin
  inherited;

end;

procedure TCtrl.DoChangeDataBase;
begin
  inherited;

end;

end.
