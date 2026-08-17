unit uCtrlImpNF;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes;

type
   TCtrlImpNF = Class(TCmControlObject)
   private

   public
      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function GeraTotalNota: Real;
      function GeraTotalImposto(rIDPessoa, rIDContrato, rCodAlterador, rIDParcela: Double;
                                dDataVencParc: TDateTime; var rAliquota: Double): Real;

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlNotaFiscal }

constructor TCtrlImpNF.Create;
begin
   inherited;

end;

procedure TCtrlImpNF.OnCreateAppServer;
begin
   inherited;

end;

destructor TCtrlImpNF.Destroy;
begin
   inherited;

end;

procedure TCtrlImpNF.AfterInitialize;
begin
   inherited;

end;

procedure TCtrlImpNF.DoChangeDataBase;
begin
   inherited;

end;

end.
