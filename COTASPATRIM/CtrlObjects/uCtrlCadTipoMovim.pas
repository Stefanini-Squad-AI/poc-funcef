{ --------------------------------------------------------------------------------------------------
Data      : 22/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : 23104
Descrição : CTRL do Cadastro de Tipo Movimento.
---------------------------------------------------------------------------------------------------}

unit uCtrlCadTipoMovim;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes,
     Dialogs, uCtrlPadroes, udbCptipomovim;

type
   TCtrlCadTipoMovim = Class(TCmControlObject)
   private

     _dbCptipomovim: TDbCptipomovim;

   public
     _Cds: TCMClientDataSet;
     _CdsCarrega: TCMClientDataSet;

      Function CarregaMovim: OleVariant;
      Function GravaDadosMovimenta: Boolean;
      function VerificaNome( iIdCpTipoMovim : integer; sNome : String  ): Boolean;
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

constructor TCtrlCadTipoMovim.Create;
begin
  inherited;
    _dbCptipomovim:= TDbCptipomovim.Create(self);
    _Cds:= TCMClientDataSet.Create(nil);
    _CdsCarrega:= TCMClientDataSet.Create(nil);
end;

destructor TCtrlCadTipoMovim.Destroy;
begin
    _dbCptipomovim.Free;

  if IsAppServer then
     _Cds.Free;
     _CdsCarrega.Free;
  inherited;
end;

procedure TCtrlCadTipoMovim.DoChangeDataBase;
begin
  inherited;
  _dbCptipomovim.DataBaseName := databasename;

end;

procedure TCtrlCadTipoMovim.OnCreateAppServer;
begin
  inherited;
  
end;

function TCtrlCadTipoMovim.GravaDadosMovimenta: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDadosMovimenta;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(_Cds, _dbCptipomovim, [],[]);

          if not(Result) then
              Raise Exception.Create(_dbCptipomovim.MessageInfo);

           Commit;
           Result:= True;
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;


function TCtrlCadTipoMovim.CarregaMovim: OleVariant;
begin
  Result := GetDataPacket(
   'SELECT ' +
   ' DECODE(FLGTPMOVIM, ''T'', ''Transferência'', ''C'', ''Cotização'', ''R'', ''Rentabilidade'', ''Outra operação'' ) as DESCFLGTPMOVIM, ' +
   ' IDCPTIPOMOVIM, NOME, DESCRICAO, ' +
   ' DECODE( FLGTPMOVIM, ''O'', '''', FLGENTSAI ) as FLGENTSAI, ' +
   ' DECODE( TIPOUNIDADE, ''Q'', ''Quantidade de cotas'', ''Valor financeiro'' ) as DESCTIPOUNIDADE, ' +
   ' FLGTPMOVIM, TIPOUNIDADE, NOMEPARAREGRA ' +
   'FROM CPTIPOMOVIM ORDER BY NOME ' );
end;

function TCtrlCadTipoMovim.VerificaNome( iIdCpTipoMovim : integer; sNome : String ): Boolean;
begin
  _CdsCarrega.Data := GetDataPacket(
   ' SELECT * '+
   ' FROM CPTIPOMOVIM WHERE UPPER(NOME) = ' + UpperCase(QuotedStr(sNome)) +
   ' AND IDCPTIPOMOVIM <> ' + IntToStr( iIdCpTipoMovim ) );
  Result:= _CdsCarrega.IsEmpty;
end;



end.
