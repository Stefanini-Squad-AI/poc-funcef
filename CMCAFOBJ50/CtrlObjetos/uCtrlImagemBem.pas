{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: (dfm)
Nº SIG...........: 125120     
Data da Alteração: 09/11/2022
Responsável......: Leandro Pocebon
Descrição........: Inclusão da aba anexos.
--------------------------------------------------------------------------------}
unit uCtrlImagemBem;

interface         

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbImagens, uDbImagensBem, classes, dbtables,
     uCmSqlParams;

type
   TCtrlImagemBem = Class(TCmControlObject)

   private
      FDbImagens      : TDbImagens;
      FDbAnexos       : TDbImagens;  
      FDbImagensBem : TDbImagensBem;
      FDbAnexosBem  : TDbImagensBem;
      FCdsImagens     : TCMClientDataSet;
      FCaminho        : string;  
      FCdsAnexos      :  TCMClientDataSet;
    procedure SetCaminho(const Value: string);
    procedure SetCdsAnexos(const Value: TCMClientDataSet);
   public
     property Caminho: string read FCaminho write SetCaminho;  
     property CdsAnexos: TCMClientDataSet read FCdsAnexos write SetCdsAnexos;  
     property CdsImagens: TCMClientDataSet read FCdsImagens  write FCdsImagens;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualImagemBem: Boolean;
      function ExcluiImagemBem: Boolean;
      function ListImagensBem(rIDBem: Double): OleVariant;
      function ListaAnexos(rIDBem: Double): OleVariant;
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
      procedure AfterApplyCdsRecord (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;  
   end;

implementation

{ TCtrlImagemBem }

constructor TCtrlImagemBem.Create;
begin
   inherited;
   FDbImagens:=TDbImagens.Create(Self);
   FDbAnexos := TDbImagens.Create(Self);  
   FDbImagensBem:=TDbImagensBem.Create(Self);
   FDbAnexosBem:=TDbImagensBem.Create(Self);
end;

procedure TCtrlImagemBem.OnCreateAppServer;
begin
   inherited;
   FCdsImagens:=TCMClientDataSet.Create(nil);
   FCdsAnexos := TCMClientDataSet.Create(nil);
end;

procedure TCtrlImagemBem.AfterInitialize;
begin
   inherited;
end;

destructor TCtrlImagemBem.Destroy;
begin
   inherited;
   if IsAppServer then
   begin
     FCdsImagens.Free;
     FCdsAnexos.Free;  
   end;
end;

procedure TCtrlImagemBem.DoChangeDataBase;
begin
   inherited;
   FDbImagens.DataBaseName:=DataBaseName;
   FDbAnexos.DataBaseName:=DataBaseName;
   FDbImagensBem.DataBaseName:=DataBaseName;
   FDbAnexosBem.DataBaseName:=DataBaseName;
end;


function TCtrlImagemBem.AplicaAtualImagemBem: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualImagemBem(FCdsImagens.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result := true;
          Result:= result and ApplyCds(FCdsAnexos ,FDbImagens,[],[]);
          if not(Result) then
           begin
             MessageInfo:=FDbAnexos.MessageInfo;
             Rollback;
           end;

          if result then
           begin
              Result:=ApplyCds(FCdsAnexos, FDbAnexosBem, [], []);
              if not(Result) then
               begin
                  MessageInfo:=FDbImagensBem.MessageInfo;
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

function TCtrlImagemBem.ExcluiImagemBem: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.ExcluiImagemBem(FCdsImagens.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result := true;
          Result:= ApplyCds(FCdsAnexos,FDbAnexosBem,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbImagensBem.MessageInfo;
              Rollback;
           end
          else
           begin
              Result:= ApplyCds(FCdsAnexos,FDbImagens,[],[]);
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


function TCtrlImagemBem.ListImagensBem(rIDBem: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   IB.IDIMAGEM, '+
         '   IB.IDBEM, '+
         '   IB.NOMEARQUIVO, '+
         '   I.IMAGEM, '+
         '   I.DESCRIMAGEM '+
         'FROM '+
         '   IMAGENSBEM IB, '+
         '   IMAGENS I '+
         'WHERE '+
         '  (IB.IDBEM = '+FloatToStr(rIDBem)+') AND '+
         '  (IB.IDIMAGEM = I.IDIMAGEM) '+
         'ORDER BY I.DESCRIMAGEM ';
   Result:=GetDataPacket(sSql);
end;

procedure TCtrlImagemBem.SetCaminho(const Value: string);
begin
  FCaminho := Value;
end;

function TCtrlImagemBem.ListaAnexos(rIDBem: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   IB.IDIMAGEM, '+
         '   IB.IDBEM, '+
         '   IB.NOMEARQUIVO, '+
         '   I.IMAGEM, '+
         '   I.DESCRIMAGEM '+
         'FROM '+
         '   IMAGENSBEM IB, '+
         '   IMAGENS I '+
         'WHERE '+
         '  (IB.IDBEM = '+FloatToStr(rIDBem)+') AND '+
         '  (IB.IDIMAGEM = I.IDIMAGEM) '+
         'ORDER BY I.DESCRIMAGEM ';
   Result:=GetDataPacket(sSql);
end;

procedure TCtrlImagemBem.SetCdsAnexos(const Value: TCMClientDataSet);
begin
  FCdsAnexos := Value;
end;


procedure TCtrlImagemBem.AfterApplyCdsRecord(aCds: TClientDataSet;
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
