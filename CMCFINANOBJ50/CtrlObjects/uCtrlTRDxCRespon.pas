// Atualizado por: André Tavares - 18/03/2004 pendência 15702 - listar somente os tiporecebdesmb ativos

unit uCtrlTRDxCRespon;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbTRDxCRespon, DB, uDataBase, DbClient
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlTRDxCRespon = Class(TCmControlObject)

   private
      FDbTRDxCRespon  : TDbTRDxCRespon;
      FCdsTRDxCRespon : TClientDataSet;

   public
      property CdsTRDxCRespon : TClientDataSet  read FCdsTRDxCRespon write FCdsTRDxCRespon;

      constructor Create; override;
      destructor Destroy; override;

      function AplicaAtualTRDxCRespon : Boolean;
      function ListTRDxCRDispon(rIDPessoa: Double; sCentroRespon: String): OleVariant;
      function ListTRDxCRSelec(rIDPessoa: Double;  sCentroRespon: String): OleVariant;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlTRDxCRespon }

constructor TCtrlTRDxCRespon.Create;
begin
   inherited;
   FDbTRDxCRespon:=TDbTRDxCRespon.Create(Self);
end;

destructor TCtrlTRDxCRespon.Destroy;
begin
   FDbTRDxCRespon.Free;
   if IsAppServer then FCdsTRDxCRespon.Free;
   inherited;
end;

procedure TCtrlTRDxCRespon.OnCreateAppServer;
begin
   inherited;
   FCdsTRDxCRespon:=TClientDataSet.Create(nil);
end;

procedure TCtrlTRDxCRespon.DoChangeDataBase;
begin
   inherited;
   FDbTRDxCRespon.DataBaseName:=DataBaseName;
end;

function TCtrlTRDxCRespon.AplicaAtualTRDxCRespon: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualTRDxCRespon(FCdsTRDxCRespon.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result:=ApplyCds(FCdsTRDxCRespon,FDbTRDxCRespon,[],[]);

          if not Result then
           begin
              MessageInfo:=FDbTRDxCRespon.MessageInfo;
              Rollback;
           end
          else
           Commit;

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

{ListTRDxCRDispon(IDPessoa: Double;sCentroRespon: String): OleVariant

 Descrição:
 Retorna uma Lista Todos os Tipos de Recebimento/Desembolso ainda NÃO associados
 ao Centro de Responsabilidade fornecido a função : sCentroRespon}

function TCtrlTRDxCRespon.ListTRDxCRDispon(rIDPessoa: Double;
  sCentroRespon: String): OleVariant;
var
   sSql    : String;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ListTRDxCRDispon(rIDPessoa,sCentroRespon);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       sSql:='SELECT '+
             '   CODTIPRECDES, '+
             '   DESCRICAO, '+
             '   RECPAG '+
             'FROM TipoRecebDesemb TRD '+
             'WHERE (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
             '      (TRD.ANASINT = ''A'') AND '+
             '      NOT Exists(SELECT '+
             '                    CODCENTRORESPON '+
             '                 FROM '+
             '                    TRDXCRESPON T '+
             '                 WHERE '+
             '                    (T.CODTIPRECDES=TRD.CODTIPRECDES) AND '+
             '                    (T.RECPAG=TRD.RECPAG) AND '+
             '                    (T.IDPESSOA= '+FloatToStr(rIDPessoa)+') '+
             // início - André Tavares - 18/03/2004 pendência 15702
             ' AND TRD.ATIVO = ''S''                                      ';
             // fim - André Tavares - 18/03/2004 pendência 15702
       if Trim(sCentroRespon)<> '' then
          sSql:=sSql+'      AND   (RTrim(T.CODCENTRORESPON)= '+Trim(sCentroRespon)+') ';
       sSql:=sSql+') ORDER BY RECPAG,DESCRICAO ';
       Result:=GetDataPacket(sSql);
    end;
end;

{ListTRDxCRSelec(IDPessoa: Double;sCentroRespon: String): OleVariant

 Descrição:
 Retorna uma Lista Todos os Tipos de Recebimento/Desembolso associados ao Centro
 de Responsabilidade fornecido a função : sCentroRespon}

function TCtrlTRDxCRespon.ListTRDxCRSelec(rIDPessoa: Double;
  sCentroRespon: String): OleVariant;
var
   sSql    : String;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ListTRDxCRSelec(rIDPessoa,sCentroRespon);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       sSql:='SELECT '+
             '   TXC.CODCENTRORESPON, '+
             '   TXC.CODTIPRECDES, '+
             '   TRD.DESCRICAO, '+
             '   TXC.RECPAG, '+
             '   TXC.IDPESSOA '+
             'FROM TRDxCRespon TXC, TipoRecebDesemb TRD '+
             'WHERE (TXC.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
             '      (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
             '      (TXC.CODTIPRECDES = TRD.CODTIPRECDES) AND '+
             '      (TXC.RECPAG = TRD.RECPAG) ';
       if Trim(sCentroRespon)<>'' then
          sSql:=sSql+'  AND (RTrim(TXC.CODCENTRORESPON)= '''+Trim(sCentroRespon)+''') ';

       sSql:=sSql+'ORDER BY RECPAG,DESCRICAO ';
       Result:=GetDataPacket(sSql);
    end;
end;

end.
