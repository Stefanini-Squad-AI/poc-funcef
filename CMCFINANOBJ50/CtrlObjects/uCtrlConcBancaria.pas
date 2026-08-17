unit uCtrlConcBancaria;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uCtrlFinanc, uDbMovimFinanc, uCtrlPadroes
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlConcBancaria = Class(TCmControlObject)
   private
      CtrlFinanc          : TCtrlFinanc;
      CtrlPadroes         : TCtrlPadroes;
      F_rIDPessoa         : Double;
      F_rIDModulo         : Double;
      F_rIDUsuario        : Double;
      F_bUsaPlanoPatro    : Boolean;
      FcdsExtrato         : TCMClientDataSet;
      FDbExtrato          : TDbMovimFinanc;
   public
      property cdsExtrato: TCMClientDataSet read FcdsExtrato write FcdsExtrato;
      property  DbExtrato: TDbMovimFinanc   read FDbExtrato  write FDbExtrato;

      property IDPessoa: Double write F_rIDPessoa;
      property IDModulo: Double write F_rIDModulo;
      property IDUsuario: Double write F_rIDUsuario;
      property UsaPlanoPatro: Boolean write F_bUsaPlanoPatro;
      
      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function CalculaSaldos(var rSaldoConcDiaAnt,
                                 rSaldoAntesConc,
                                 rSaldoOMAntesConc,
                                 rSaldoConc,
                                 rSaldoOMConc : Double;
                                 rCodPortador: Double;
                                 dDataLimite: TDateTime): Boolean;
      function Concilia(rCodPortador: Double; dDataExtrato: TDateTime): Boolean;
      function AplicaMarcacoes: Boolean;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

{ TCtrlConcBancaria }

implementation

constructor TCtrlConcBancaria.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin

   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   FDbExtrato:=TDbMovimFinanc.Create(Self);

   CtrlFinanc:=TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);
   CtrlPadroes:=TCtrlPadroes.Create;
end;

destructor TCtrlConcBancaria.Destroy;
begin
   FDbExtrato.Free;
   CtrlFinanc.Free;
   CtrlPadroes.Free;
   if IsAppServer then FcdsExtrato.Free;
   inherited;
end;

procedure TCtrlConcBancaria.DoChangeDataBase;
begin
   inherited;
   FDbExtrato.DataBaseName:=DataBaseName;
end;

procedure TCtrlConcBancaria.AfterInitialize;
begin
   inherited;
   CtrlFinanc.InitializeAs(Self);
   CtrlPadroes.InitializeAs(Self);
end;

procedure TCtrlConcBancaria.OnCreateAppServer;
begin
   inherited;
   FcdsExtrato:=TCMClientDataSet.Create(nil);
end;

function TCtrlConcBancaria.CalculaSaldos(var rSaldoConcDiaAnt,
  rSaldoAntesConc, rSaldoOMAntesConc, rSaldoConc, rSaldoOMConc: Double;
  rCodPortador: Double; dDataLimite: TDateTime): Boolean;
var
   rSaldoOMAux : Double;
begin
   Result:=True;
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.CalculaSaldos(rSaldoConcDiaAnt,rSaldoAntesConc,rSaldoOMAntesConc,
                                                  rSaldoConc,rSaldoOMConc,rCodPortador,dDataLimite);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       rSaldoConcDiaAnt:=0;
       rSaldoAntesConc:=0;
       rSaldoOMAntesConc:=0;
       rSaldoConc:=0;
       rSaldoOMConc:=0;

       try
          CtrlFinanc.CalculaSaldoFinanc(rCodPortador,dDataLimite,'X'',''I','L',
                                        rSaldoAntesConc,rSaldoOMAntesConc);

          CtrlFinanc.CalculaSaldoFinanc(rCodPortador,dDataLimite,'X'',''P'',''I','L',
                                        rSaldoConc,rSaldoOMConc);

          CtrlFinanc.CalculaSaldoFinanc(rCodPortador,(dDataLimite-1),'X'',''P'',''I','L',
                                        rSaldoConcDiaAnt,rSaldoOMAux);
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;

function TCtrlConcBancaria.AplicaMarcacoes: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.AplicaMarcacoes(F_rIDPessoa,
                                                    F_rIDModulo,
                                                    F_rIDUsuario,
                                                    F_bUsaPlanoPatro,
                                                    FcdsExtrato.Data);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FcdsExtrato,FDbExtrato,[],[]);

          if not(Result) then
           begin
              Result:=False;
              MessageInfo:=FDbExtrato.MessageInfo;
              Rollback;
           end
          else
           Commit;
           
       except
          on E:Exception do
          begin
             Result:=False;
             MessageInfo:=E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlConcBancaria.Concilia(rCodPortador: Double;
  dDataExtrato: TDateTime): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.Concilia(rCodPortador,dDataExtrato,F_rIDPessoa,
                                             F_rIDModulo,F_rIDUsuario,
                                             F_bUsaPlanoPatro,FcdsExtrato.Data);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=CtrlFinanc.ConciliaConta(rCodPortador,dDataExtrato);

          if not(Result) then
           begin
              Result:=False;
              MessageInfo:=CtrlFinanc.MessageInfo;
              Rollback;
           end
          else
           begin
              //Grava LOG
              Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                   'Conciliação Bancária',False);
              if not(Result) then
               begin
                  MessageInfo:=CtrlPadroes.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;

       except
          on E:Exception do
          begin
             Result:=False;
             MessageInfo:=E.Message;
             Rollback;
          end;
       end;
    end;
end;

end.
