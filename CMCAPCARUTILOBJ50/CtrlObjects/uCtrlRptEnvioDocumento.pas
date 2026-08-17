unit uCtrlRptEnvioDocumento;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
     uDbEnvioDocumento, uModulo, uSistema, DBClient;



type TCtrlRptEnvioDocumento = class(TCMControlObject)

   private
    FDbEnvioDocumento: TDbEnvioDocumento;
    procedure SetDbEnvioDocumento(const Value: TDbEnvioDocumento);
   protected
      procedure AfterInitialize;   override;
      procedure OnCreateAppServer; override;
   public
      constructor Create;  override;
      destructor  Destroy; override;

      property DbEnvioDocumento    : TDbEnvioDocumento read FDbEnvioDocumento write SetDbEnvioDocumento;

      function GravaFazEnvioDocumento (_CdsDocumento: OleVariant) : Boolean;

      function GravaDesfazEnvioDocumento (_CdsDocumento: OleVariant) : Boolean;

      function ListaEnviodocumento: OleVariant;
   published

end;

implementation

{ TCtrlRptEnvioDocumento }

procedure TCtrlRptEnvioDocumento.AfterInitialize;
begin
  inherited;
  FDbEnvioDocumento.DataBaseName := DataBaseName;

end;

constructor TCtrlRptEnvioDocumento.Create;
begin
  inherited;
  FDbEnvioDocumento := TDbEnviodocumento.Create(self);

end;

destructor TCtrlRptEnvioDocumento.Destroy;
begin
  FreeAndNil (FDbEnvioDocumento);
  inherited;

end;

function TCtrlRptEnvioDocumento.GravaDesfazEnvioDocumento(
  _CdsDocumento: OleVariant): Boolean;
var
  sSQL, sSQL2 : String;
  CDSDoc : TClientDataSet;
  iIdEnvioDoc : Integer;
  bSelecionado : boolean;

begin
  CDSDoc:= TClientDataSet.Create(nil);
  CDSDoc.Data:= _CdsDocumento;
  bSelecionado:= False;
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
  if ConnectionSide = cnsClient then
    begin
      Result := Connection.AppServer.GravaDesfazEnvioDocumento(_CdsDocumento);
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    begin
      try
         if not InTransaction then
           StartTransaction;

         CDSDoc.First;
         while not(CDSDoc.Eof) do begin
           if CDSDoc.FieldByName('SELECIONADO').AsString = '1' then
             begin
               if CDSDoc.FieldByName('IDENVIODOCUMENTO').AsString = '' then
                 begin
                   FDbEnvioDocumento.MessageInfo:= 'É necessário estar enviado para desfazer o envio.';
                   raise Exception.Create(FDbEnvioDocumento.MessageInfo);
                 end;

               iIdEnvioDoc:= CDSDoc.FieldByName('IDENVIODOCUMENTO').AsInteger;

               sSQL:= 'UPDATE DOCUMENTO SET IDENVIODOCUMENTO = NULL' +
                 ' WHERE CODDOCUMENTO = ' + CDSDoc.FieldByName('CODDOCUMENTO').AsString;

               if CDSDoc.FieldByName('NODOCUMENTO').AsString <> '' then
                 sSQL:= sSQL + ' AND NODOCUMENTO = ' + CDSDoc.FieldByName('NODOCUMENTO').AsString
               else
                 sSQL:= sSQL + ' AND NODOCUMENTO IS NULL ';

               sSQL:= sSQL + ' AND IDENVIODOCUMENTO = ' + IntToStr(iIdEnvioDoc);

               ExecSQL(sSQL);

               //Cria e executa a query que insere os valores na tabela ENVIODOCUMENTO
               sSQL2:= 'DELETE FROM ENVIODOCUMENTO ' +
                      ' WHERE IDENVIODOCUMENTO = ' + IntToStr(iIdEnvioDoc);

               ExecSQL(sSQL2);

               bSelecionado:= True;
             end;
           CDSDoc.Next;
         end;

         if bSelecionado then
           begin
             Result:= True;
             Commit;
           end
         else
           begin
             MessageInfo:= 'É preciso selecionar um registro para Desfazer o envio !!!';
             Result:= False;
             Rollback;
           end;

      except
         on E : Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
       end;
    end;
end;

function TCtrlRptEnvioDocumento.GravaFazEnvioDocumento(
  _CdsDocumento: OleVariant): Boolean;
var
  sSQL: String;
  CDSDoc : TClientDataSet;
  bSelecionado : Boolean;

begin
  CDSDoc:= TClientDataSet.Create(nil);
  CDSDoc.Data:= _CdsDocumento;
  bSelecionado := False;
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
  if ConnectionSide = cnsClient then
    begin
      Result := Connection.AppServer.GravaFazEnvioDocumento(_CdsDocumento);
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    begin
      try
         if not InTransaction then
           StartTransaction;

         CDSDoc.First;
         while not(CDSDoc.Eof) do begin
           if CDSDoc.FieldByName('SELECIONADO').AsString = '1' then
             begin
               if CDSDoc.FieldByName('IDENVIODOCUMENTO').AsString <> '' then
                 begin
                   FDbEnvioDocumento.MessageInfo:= 'Documento já enviado.';
                   raise Exception.Create(FDbEnvioDocumento.MessageInfo);
                 end;

               FDbEnvioDocumento.Idusuario.AsInteger := Sistema.IdUsuario;
               if not FDbEnvioDocumento.Insert then
                 raise  Exception.Create(FDbEnvioDocumento.MessageInfo);

               FDbEnvioDocumento.Idenviodocumento.AsInteger;

               sSQL:= 'UPDATE DOCUMENTO SET IDENVIODOCUMENTO = ' + IntToStr(FDbEnvioDocumento.Idenviodocumento.AsInteger) +
                       ' WHERE CODDOCUMENTO = ' + CDSDoc.FieldByName('CODDOCUMENTO').AsString ;

               if CDSDoc.FieldByName('NODOCUMENTO').AsString <> '' then
                 sSQL:= sSQL + ' AND NODOCUMENTO = ' + CDSDoc.FieldByName('NODOCUMENTO').AsString
               else
                 sSQL:= sSQL + ' AND NODOCUMENTO IS NULL ';

               ExecSQL(sSQL);

               bSelecionado:= True;
             end;
           CDSDoc.Next;
         end;

         if bSelecionado then
           begin
             Result:= True;
             Commit;
           end
         else
           begin
             MessageInfo:= 'É preciso selecionar um registro para fazer o envio !!!';
             Result:= False;
             Rollback;
           end;

      except
         on E : Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlRptEnvioDocumento.ListaEnviodocumento: OleVariant;
begin
  result := GetDataPacket ('select * from enviodocumento');
end;

procedure TCtrlRptEnvioDocumento.OnCreateAppServer;
begin
  inherited;
  // será necessário apenas se tivermos um cds como propriedade
end;

procedure TCtrlRptEnvioDocumento.SetDbEnvioDocumento(
  const Value: TDbEnvioDocumento);
begin
  FDbEnvioDocumento := Value;
end;

end.
