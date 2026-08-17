{ --------------------------------------------------------------------------------------------------
Data      : 18/08/2006
Autor     : Marcus Santos Oliveira
Pendencia : Falta Cadastrar pendencia
Descrição : CTRL do Cadastro de Tipo de Entrada.
---------------------------------------------------------------------------------------------------}

unit uCtrlCadTipoEntrada;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes,
     Dialogs, uCtrlPadroes, uDBCptpEntrada;

type
   TCtrlCadTipoEntrada = Class(TCmControlObject)
   private

     _dbcpCptpentrada: TDbCptpentrada;

   public
     _Cds: TCMClientDataSet;
     _CdsCarrega: TCMClientDataSet;

      Function CarregaEntrada: OleVariant;
      Function GravaDadosEntrada: Boolean;
      function VerificaNome( iIdCpTpEntrada : integer; sNome : string ): Boolean;
      constructor Create; override;
      destructor Destroy; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

constructor TCtrlCadTipoEntrada.Create;
begin
  inherited;
  _dbcpCptpentrada:= TDbCptpentrada.Create(self);
  _Cds:= TCMClientDataSet.Create(nil);
  _CdsCarrega:= TCMClientDataSet.Create(nil);
end;

destructor TCtrlCadTipoEntrada.Destroy;
begin
  _dbcpCptpentrada.Free;
end;

procedure TCtrlCadTipoEntrada.DoChangeDataBase;
begin
  inherited;
  _dbcpCptpentrada.DataBaseName := databasename;
end;

function TCtrlCadTipoEntrada.GravaDadosEntrada: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result:=Connection.AppServer.GravaDadosEntrada;
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(_Cds, _dbcpCptpentrada, [],[]);

          if not( Result ) then
              Raise Exception.Create(_dbcpCptpentrada.MessageInfo);

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


function TCtrlCadTipoEntrada.CarregaEntrada: OleVariant;
begin
  Result:=GetDataPacket(
   ' SELECT                                                        ' +
   ' DECODE                                                        ' +
   '   (TIPOUNIDADE, ''V'', ''Valor financeiro'',                  ' +
   '    ''Quantidade de cotas'') AS DESCTIPOUNIDADE,               ' +
   '    IDCPTPENTRADA, TIPOUNIDADE, NOME, DESCRICAO, NOMEPARAREGRA ' +
   ' FROM                                                          ' +
   '    CPTPENTRADA                                                ' +
   ' ORDER BY NOME');
end;

function TCtrlCadTipoEntrada.VerificaNome( iIdCpTpEntrada : integer; sNome : string ): Boolean;
begin
  _CdsCarrega.Data := GetDataPacket(
   'SELECT * '+
   'FROM CPTPENTRADA WHERE UPPER(NOME) = ' + UpperCase( QuotedStr( sNome ) ) +
   'AND IDCPTPENTRADA <> ' + IntToStr( iIdCpTpEntrada ) );
  Result:= _CdsCarrega.IsEmpty;
end;



end.
