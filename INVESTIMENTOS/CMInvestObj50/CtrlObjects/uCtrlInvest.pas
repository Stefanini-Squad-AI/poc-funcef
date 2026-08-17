unit uCtrlInvest;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMMath,
     uCMFileUtils, uCMTypes;

type
   TCtrlInvest = Class(TCmControlObject)
   private

   public
      // ------------------- Metodos da Control --------------------------------
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;
      // ------------------- Propriedades da Control ---------------------------



      // ------------------- Metodos de Listagem -------------------------------



      // ------------------- Metodos de Update ---------------------------------



      // ------------------- Metodos de Processamento --------------------------



      // ------------------- Metodos de Diversos -------------------------------


   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  Override;
   end;

implementation

{ TCtrlInvRF }

procedure TCtrlInvest.DoChangeDataBase;
begin
   inherited;
   //FDbObject.DataBaseName := DataBaseName;
end;

procedure TCtrlInvest.AfterInitialize;
begin
   inherited;
   //CtrlObject.InitializeAs(Padroes);
end;

// ------------------- Metodos da Públicos -------------------------------------
// ------------------- Metodos da Control --------------------------------------
constructor TCtrlInvest.Create;
begin
   inherited;
   //FDbObject := TDbObject.Create(Self);
   //CtrlObject := TCtrlObject.Create;
   //CtrlObject.InitializeAs(Padroes);
   //UnitdeFuncoes := TUnitdeFoncoes.Create;

end;

destructor TCtrlInvest.Destroy;
begin
   inherited;
   //FreeAndNil(FDbObject);
   //if IsAppServer then
   //   FreeAndNil(FCds);

end;

procedure TCtrlInvest.OnCreateAppServer;
begin
   inherited;
   //FCds := TClientDataSet.Create(nil);

end;

// ------------------- Propriedades da Control ---------------------------------



// ------------------- Metodos de Listagem -------------------------------------



// ------------------- Metodos de Update ---------------------------------------



// ------------------- Metodos de Processamento --------------------------------



// ------------------- Metodos de Diversos -------------------------------------




end.

