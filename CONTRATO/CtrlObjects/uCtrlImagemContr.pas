// andre tavares - pendência 17275 - cadastra também os anexos do contrato 
unit uCtrlImagemContr;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbImagens, uDbImagensContrato, classes, dbtables,
     uCmSqlParams;

type
   TCtrlImagemContr = Class(TCmControlObject)

   private
      FDbImagens      : TDbImagens;
      FDbAnexos       : TDbImagens; // andre tavares - pendência 17275 
      FDbImagensContr : TDbImagensContrato;
      FDbAnexosContr  : TDbImagensContrato;
      FCdsImagens     : TCMClientDataSet;
      FCaminho        : string; // andre tavares - pendência 17275
      FCdsAnexos      :  TCMClientDataSet; // andre tavares - pendência 17275
    procedure SetCaminho(const Value: string);
    procedure SetCdsAnexos(const Value: TCMClientDataSet);
   public
     property Caminho: string read FCaminho write SetCaminho; // andre tavares - pendência 17275
     property CdsAnexos: TCMClientDataSet read FCdsAnexos write SetCdsAnexos; // andre tavares - pendência 17275
     property CdsImagens: TCMClientDataSet read FCdsImagens  write FCdsImagens;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualImagemContr: Boolean;
      function ExcluiImagemContr: Boolean;
      function ListImagensContr(rIDContrato: Double): OleVariant;
      function BuscaUltimoNumeroPagina(rIDContrato: Double): Double;
      function ListaAnexos(rIDContrato: Double): OleVariant;// andre tavares - pendência 17275
      function ListaContrato(rIDContrato: Double): OleVariant; // andre tavares - pendência 17275
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
      procedure AfterApplyCdsRecord (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override; // andre tavares - pendência 17275
   end;

implementation

{ TCtrlImagemContr }

constructor TCtrlImagemContr.Create;
begin
   inherited;
   FDbImagens:=TDbImagens.Create(Self);
   FDbAnexos := TDbImagens.Create(Self); // andre tavares - pendência 17275
   FDbImagensContr:=TDbImagensContrato.Create(Self);
   FDbAnexosContr:=TDbImagensContrato.Create(Self);
end;

procedure TCtrlImagemContr.OnCreateAppServer;
begin
   inherited;
   FCdsImagens:=TCMClientDataSet.Create(nil);
   FCdsAnexos := TCMClientDataSet.Create(nil); // andre tavares - pendência 17275
end;

procedure TCtrlImagemContr.AfterInitialize;
begin
   inherited;
end;

destructor TCtrlImagemContr.Destroy;
begin
   inherited;
   if IsAppServer then
   begin
     FCdsImagens.Free;
     FCdsAnexos.Free; // andre tavares - pendência 17275
   end;
end;

procedure TCtrlImagemContr.DoChangeDataBase;
begin
   inherited;
   FDbImagens.DataBaseName:=DataBaseName;
   FDbAnexos.DataBaseName:=DataBaseName;
   FDbImagensContr.DataBaseName:=DataBaseName;
   FDbAnexosContr.DataBaseName:=DataBaseName;
end;


function TCtrlImagemContr.AplicaAtualImagemContr: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualImagemContr(FCdsImagens.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          result := true;
          if (trim(FCdsImagens.FieldByName('EXTENSAO').asString) <> '') then // andre tavares - pendência 17275
            Result:=ApplyCds(FCdsImagens,FDbImagens,[],[]);
          if not(Result) then
           begin
             MessageInfo:=FDbImagens.MessageInfo;
             Rollback;
           end;
          if (trim(FCdsAnexos.FieldByName('EXTENSAO').asString) <> '') then // andre tavares - pendência 17275
            Result:= result and ApplyCds(FCdsAnexos,FDbImagens,[],[]); // andre tavares - pendência 17275
          if not(Result) then
           begin
             MessageInfo:=FDbAnexos.MessageInfo;
             Rollback;
           end;

          if result then
           begin
              if trim(FCdsImagens.FieldByName('EXTENSAO').asString) <> '' then // andre tavares - pendência 17275
                Result:=ApplyCds(FCdsImagens,FDbImagensContr,[], []);

              if trim(FCdsAnexos.FieldByName('EXTENSAO').asString) <> '' then // andre tavares - pendência 17275
                Result:=ApplyCds(FCdsAnexos, FDbImagensContr, [], []);

              if not(Result) then
               begin
                  MessageInfo:=FDbImagensContr.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlImagemContr.ExcluiImagemContr: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluiImagemContr(FCdsImagens.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsImagens,FDbImagensContr,[],[]);
          Result:= result and ApplyCds(FCdsAnexos,FDbAnexosContr,[],[]); // andre tavares - pendência 17275
          if not(Result) then
           begin
              MessageInfo:=FDbImagensContr.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:=ApplyCds(FCdsImagens,FDbImagens,[],[]);
              Result:= result and ApplyCds(FCdsAnexos,FDbImagens,[],[]); // andre tavares - pendência 17275
              if not(Result) then
               begin
                  MessageInfo:=FDbImagens.MessageInfo;
                  Rollback;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;


function TCtrlImagemContr.ListImagensContr(rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   IC.IDIMAGEM, '+
         '   IC.IDCONTRATO, '+
         '   IC.PAGINA, '+
         '   IC.EXTENSAO, '+
         '   NVL(IC.FLGTIPO, ''I'') AS FLGTIPO, '+ // andre tavares - pendência 17275
         '   IC.NOMEARQUIVO, '+
         '   I.IMAGEM, '+
         '   I.DESCRIMAGEM '+
         'FROM '+
         '   IMAGENSCONTRATO IC, '+
         '   IMAGENS I '+
         'WHERE '+
         '  (IC.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '  (IC.IDIMAGEM = I.IDIMAGEM) '+
         '  AND NVL(IC.FLGTIPO, ''I'') = ''I'' '+ // andre tavares - pendência 17275
         'ORDER BY IC.PAGINA ';
   Result:=GetDataPacket(sSql);
end;


function TCtrlImagemContr.BuscaUltimoNumeroPagina(
  rIDContrato: Double): Double;
var
   sSql   : String;
begin
   sSql:='SELECT '+
         '   MAX(PAGINA) AS PAGINA '+
         'FROM '+
         '   IMAGENSCONTRATO '+
         'WHERE '+
         '  (IDCONTRATO = '+FloatToStr(rIDContrato)+') ';
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket(sSql);
      Result:=FieldByName('PAGINA').AsFloat;
   finally
      Free;
   end;
end;



procedure TCtrlImagemContr.SetCaminho(const Value: string);
begin
  FCaminho := Value;
end;

function TCtrlImagemContr.ListaAnexos(rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   IC.IDIMAGEM, '+
         '   IC.IDCONTRATO, '+
         '   IC.PAGINA, '+
         '   IC.EXTENSAO, '+
         '   NVL(IC.FLGTIPO, ''I'') AS FLGTIPO, '+ // andre tavares - pendência 17275
         '   IC.NOMEARQUIVO, '+
         '   I.IMAGEM, '+
         '   I.DESCRIMAGEM '+
         'FROM '+
         '   IMAGENSCONTRATO IC, '+
         '   IMAGENS I '+
         'WHERE '+
         '  (IC.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
         '  (IC.IDIMAGEM = I.IDIMAGEM) '+
         '  AND NVL(IC.FLGTIPO, ''I'') = ''A'' '+ // andre tavares - pendência 17275
         'ORDER BY IC.PAGINA ';
   Result:=GetDataPacket(sSql);
end;

procedure TCtrlImagemContr.SetCdsAnexos(const Value: TCMClientDataSet);
begin
  FCdsAnexos := Value;
end;

function TCtrlImagemContr.ListaContrato(rIDContrato: Double): OleVariant;
begin
  result := GetDataPacket('SELECT IDCONTRATO, NOMECONTRATO FROM CONTRATOCONTR WHERE IDCONTRATO = '+ floatToStr(rIDContrato));
end;


procedure TCtrlImagemContr.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
begin
  inherited;
  if AnsiUpperCase(sTableName) = 'IMAGENS' then begin
    if CdsState in [usModified, usInserted] then begin
      aCds.Edit;
      aCds.FieldByName('IDIMAGEM').AsInteger := FDbImagens.Idimagem.AsInteger;
      aCds.Post;
    end;
  end;
end;

end.
