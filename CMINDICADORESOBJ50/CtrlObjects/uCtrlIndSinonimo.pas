// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE SINÔNIMO DE INDICADORES
//
//      Módulo          :  Indicadores
//      Autor           :  Marcio Motta
//      Data de Início  :  02/04/2004
//      Data de Término :  02/04/2004
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaSinonimo  -  Insere, Altera e Exclui Sinônimo
//      LookupSinonimo -  Abre um ou mais Sinônimos
// -----------------------------------------------------------------------------

unit uCtrlIndSinonimo;

interface

uses
  SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes, uDbIndSinonimo, DBClient, Db;

type TCtrlIndSinonimo = class(TCMControlObject)

     private
       FCdsIndSinonimo : TCMClientDataSet;
       FDbIndSinonimo  : TDbIndSinonimo;

       procedure SetCdsIndSinonimo (const Value: TCMClientDataSet);
       procedure SetDbIndSinonimo (const Value: TDbiNDsINONIMO);

     protected
       procedure AfterInitialize; Override;
       procedure OnCreateAppServer; Override;
       procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;


     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbIndSinonimo  : TDbIndSinonimo   read FDbIndSinonimo  write SetDbIndSinonimo;
       property CdsIndSinonimo : TCMClientDataSet read FCdsIndSinonimo write SetCdsIndSinonimo;

       function GravaIndSinonimo : Boolean;
       function LookupIndSinonimo(const iIdSinonimo:Integer = -1; const sSinonimo:String = '') : OLEVariant;

     published

end;

implementation

{ TCtrlGrpApuracao }

constructor TCtrlIndSinonimo.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbIndSinonimo := TDBIndSinonimo.Create( Self );
end;

destructor TCtrlIndSinonimo.Destroy;
begin
  FDbIndSinonimo.Free;

  if isAppServer then FCdsIndSinonimo.Free;
  inherited;
end;

procedure TCtrlIndSinonimo.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsIndSinonimo := TCMClientDataSet.Create( nil );
end;

procedure TCtrlIndSinonimo.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbIndSinonimo.DataBaseName := DataBaseName;
end;

function TCtrlIndSinonimo.GravaIndSinonimo: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaIndSinonimo( CdsIndSinonimo.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsIndSinonimo, DbIndSinonimo, [], [] );
      if not Result then raise Exception.Create( DbIndSinonimo.MessageInfo );
      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlIndSinonimo.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
var cdsTemp : TCMClientDataSet;
    sSql : String;
begin
  inherited;
  if CdsState in [usModified, usInserted] then begin
     try
        cdsTemp := TCMClientDataSet.Create( nil );
        sSql := 'SELECT * FROM INDSINONIMO '+#13+
                ' WHERE UPPER (SINONIMO) = UPPER(' + QuotedStr(aCds.FieldByName('SINONIMO').AsString)+ ')';
        cdsTemp.Data := GetDataPacket( sSql );
        if (cdsTemp.RecordCount > 0) then begin
           if  (CdsState = usInserted) or
              ((CdsState = usModified) and (cdsTemp.FieldByName('IDSINONIMO').AsInteger <> aCds.FieldByName('IDSINONIMO').AsInteger) ) then begin
              Accept      := False;
              MessageInfo := aCds.FieldByName('SINONIMO').AsString + ': Sinônimo Duplicado';
           end;
        end;
     finally
        FreeAndNil( cdsTemp );
     end;
  end;
end;



function TCtrlIndSinonimo.LookupIndSinonimo(const iIdSinonimo: Integer = -1; const sSinonimo:String = ''): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := '';
  if iIdSinonimo > 0  then sParam := sParam + ' AND IO.IDSINONIMO = ' + IntToStr(iIdSinonimo);
  if sSinonimo  <> '' then sParam := sParam + ' AND IO.SINONIMO = ' + QuotedStr(sSinonimo);

  // Define Sql
  sSql := 'SELECT IO.IDSINONIMO, IO.SINONIMO, '     +#13+
          '       IO.IDINDICADOR, II.DESCRICAO'     +#13+
          '  FROM INDSINONIMO IO, INDINDICADOR II ' +#13+
          ' WHERE 1=1 '                             +#13+
          '   AND IO.IDINDICADOR = II.IDINDICADOR ' +#13+
          sParam                                    +#13+
          'ORDER BY IO.SINONIMO';

  // Busca os dados do Sql
  Result := GetDataPacket( sSql );
end;

procedure TCtrlIndSinonimo.SetCdsIndSinonimo(const Value: TCMClientDataSet);
begin
  FCdsIndSinonimo := Value;
end;

procedure TCtrlIndSinonimo.SetDbIndSinonimo(const Value: TDbIndSinonimo);
begin
  FDbIndSinonimo := Value;
end;


end.
