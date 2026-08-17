{-------------------------------------------------------------------------------------------------
Nº SIG......: 32242
Data........: 27/10/2016
Responsavel.: Peterson Victor
Descrição...: Alteração da query
Rotinas.....: ListTRDxCRDispon, ListTRDxCRSelec
--------------------------------------------------------------------------------------------------}

unit uCtrlTRDxCRespon;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbTRDxCRespon, DB, uDataBase, DbClient, uCMTypes;

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
       {
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
             ' AND TRD.ATIVO = ''S''                                      ';
       }


       sSql:= ' SELECT CODTIPRECDES, DESCRICAO, RECPAG ' +
              ' FROM TIPORECEBDESEMB TRD ' +
              ' WHERE TRD.IDPESSOA = ' + FloatToStr(rIDPessoa) +
              '       AND NVL(TRD.ANASINT, ''A'') = ''A''' +
              '       AND NVL(TRD.ATIVO, ''S'') = ''S''' +
              '       AND NOT EXISTS (SELECT 1 '  +
              '                       FROM TRDXCRESPON T  ' +
              '                       WHERE T.CODTIPRECDES = TRD.CODTIPRECDES ' +
              '                             AND T.RECPAG = TRD.RECPAG ' +
              '                             AND T.IDPESSOA = TRD.IDPESSOA ';

       if Trim(sCentroRespon) <> '' then
          sSql:= sSql + ' AND TRIM(T.CODCENTRORESPON) = ' + Trim(sCentroRespon);

       sSql:=sSql+') ORDER BY RECPAG,DESCRICAO ';


       Result:=GetDataPacket(sSql);
    end;
end;



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
             {
             'FROM TRDxCRespon TXC, TipoRecebDesemb TRD '+
             'WHERE (TXC.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
             '      (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
             '      (TXC.CODTIPRECDES = TRD.CODTIPRECDES) AND '+
             '      (TXC.RECPAG = TRD.RECPAG) ';
             }

             ' FROM TRDXCRESPON TXC ' +
             ' JOIN TIPORECEBDESEMB TRD ON TXC.CODTIPRECDES = TRD.CODTIPRECDES AND TXC.RECPAG = TRD.RECPAG AND TXC.IDPESSOA = TRD.IDPESSOA ' +
             ' WHERE TRD.IDPESSOA = ' + FloatToStr(rIDPessoa);

       if Trim(sCentroRespon)<>'' then
          sSql:= sSql + '  AND (RTrim(TXC.CODCENTRORESPON)= ''' + Trim(sCentroRespon) + ''') ';

       sSql:=sSql+'ORDER BY RECPAG,DESCRICAO ';
       Result:=GetDataPacket(sSql);
    end;
end;



end.
