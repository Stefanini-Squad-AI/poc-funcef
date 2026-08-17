unit uCtrlTiposAplic;

interface

uses sysutils, uCmControlObject, uCmDbObject, uDbTiposAplic, DB, uDataBase, DbClient,
     uCMClientDataSet {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlTiposAplic = Class(TCmControlObject)

   private
      FDbTiposAplic  : TDbTiposAplic;
      FCdsTiposAplic : TCMClientDataSet;

   public
      property CdsTiposAplic : TCMClientDataSet read FCdsTiposAplic write FCdsTiposAplic;

      constructor Create; override;
      destructor Destroy; override;

      function AplicaAtualTiposAplic: Boolean;
      function ListTipoAplicacao(rIDPessoa, rTipoAplicacao: Double): OleVariant;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlTiposAplic }

constructor TCtrlTiposAplic.Create;
begin
   inherited;
   FDbTiposAplic:=TDbTiposAplic.Create(Self);
end;

destructor TCtrlTiposAplic.Destroy;
begin
   FDbTiposAplic.Free;
   if IsAppServer then FCdsTiposAplic.Free;
   inherited;
end;

procedure TCtrlTiposAplic.OnCreateAppServer;
begin
   inherited;
   FCdsTiposAplic:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlTiposAplic.DoChangeDataBase;
begin
   inherited;
   FDbTiposAplic.DataBaseName:=DataBaseName;
end;

function TCtrlTiposAplic.AplicaAtualTiposAplic: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualTiposAplic(FCdsTiposAplic.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FCdsTiposAplic,FDbTiposAplic,[],[]);

          if not Result then
           begin
              MessageInfo := FDbTiposAplic.MessageInfo;
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

{ListTipoAplicacao(rIDPessoa, rTipoAplicacao: Double): OleVariant

 Descrição:
 Retorna uma Lista dos Tipos de Aplicação 

 Parâmetros:
 IDPessoa       : Identificador do Pessoa (Empresa). Se <= 0 retorna todas as Empresas
 rTipoAplicacao : Identificador do Tipo de Aplicaçãoo. Se <= 0 retorna todos os tipos}

function TCtrlTiposAplic.ListTipoAplicacao(rIDPessoa, rTipoAplicacao: Double): OleVariant;
var
   sSql    : String;
   sFiltro : String;
begin
   sSql:='SELECT '+
         '   TIPOAPLICACAO, '+    
         '   DESCRICAO, '+
         '   IDCONTAORCCUS, '+
         '   UNIDNEGOC, '+
         '   IDPLANOORCAMEN, '+
         '   IDPESSOA, '+
         '   IDCONTAORCREC, '+
         '   MOECODIGO, '+
         '   FIXAVARIAVEL, '+
         '   CODCENTRORESPON, '+
         '   IDEMPRESA, '+
         '   TIPORESGATE, '+
         '   TXJUROSPREV, '+
         '   CODCENTROCUSTO, '+
         '   PRAZORESGATEPREV, '+
         '   RECPAG, '+
         '   TIPOAPLICSUBST, '+
         '   CODTIPRECDES, '+
         '   PERCUSTO, '+
         '   PERCUSTOREND, '+
         '   FLGREAPLICA, '+
         '   CODCORRESP  '+
         'FROM TIPOAPLICACAO ';

   sFiltro:='';
   if (rIDPessoa<>0) then
       sFiltro:='WHERE (IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rTipoAplicacao<>0) then
    if (sFiltro='') then
       sFiltro:='WHERE (TIPOAPLICACAO = '+FloatToStr(rTipoAplicacao)+') '
    else
       sFiltro:=sFiltro+'AND (TIPOAPLICACAO = '+FloatToStr(rTipoAplicacao)+') ';

   sSql:=sSql+sFiltro+' ORDER BY DESCRICAO ';

   Result:=GetDataPacket(sSql);
end;


end.
