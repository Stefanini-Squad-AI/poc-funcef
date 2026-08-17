unit UDinamico;

interface

type
  PData = ^Tdata;
  TData = record
    idcontrato : longint;
    idobjeto   : longint;
    iditem     : longint;
    Contraparte: string[60];
    Processo   : string[60];
    TipodeContrato:string[1];
    Assinatura,Base,PrevEncer: TdateTime;
    VlrBase    :Real;
    Descricao  : string;
    Observacao : string;
    Aviso      : longint;
    TipoItem   : string[2];
    Encerrado  : boolean;
    EmAviso    : boolean;
  end;
  PCampo = ^TCampo;
  TCampo  = record
    index      : longint;
    Dados      : TData;
    prior      : PCampo;
    next       : PCampo;
  end;
  
  TField_GWF = class(TObject)
  private
     FCampo,FLast :  PCampo;
     FTotal   : longint;
     { Private declarations }
     procedure Clean(campo_ :PCampo);
     procedure SyncIndex(campo_ :PCampo);
  public
     { Public declarations }
     property Total : longint read Ftotal;
     procedure ClearAll;
     procedure Inicializa;
     Constructor Create;
     Destructor Destroy;override;
     function Novo(dados : TData):PCampo;
     function  ReadDados(index : longint):TData;
     function  CleanByIndex(index:longint):boolean;
     procedure RefreshCampo(index:longint;dados : TData);
  end;
 
implementation

uses SysUtils;
 
Destructor TField_GWF.Destroy;
begin
   ClearAll;
   inherited Destroy;
end;

constructor TField_GWF.Create;
begin
   inherited Create;
   Inicializa;
end;

procedure TField_GWF.ClearAll;
begin
   clean(FCampo);
   fcampo := nil;
   flast := nil;
end;

function TField_GWF.Novo(dados : TData):PCampo;
var
   campo_temp : PCampo;
begin
   if FCampo = nil then
    begin
       new(FCampo);
       FTotal := 1;
       FCampo.index := FTotal;
       FCampo.dados := dados;
       FCampo.next  := nil;
       FCampo.prior := nil;
       FLast := FCampo;
       result := FCampo;
    end
   else
    begin
       new(campo_temp);
       inc(FTotal);
       campo_temp.index := FTotal;
       campo_temp.dados := dados;
       campo_temp.next  := nil;
       campo_temp.prior := FLast;
       FLast.next := campo_temp;
       FLast := campo_temp;
       result := Campo_temp;
    end;
end;
 
function TField_GWF.ReadDados(index : longint):Tdata;
var
   campo_temp : PCampo;
   tmpdata : tdata;
begin
   tmpdata.idcontrato := 0;
   tmpdata.idobjeto   := 0;
   tmpdata.iditem     := 0;
   campo_temp := FCampo;
   if (campo_temp.next = nil) or (campo_temp = nil) then
       result := tmpdata
   else
    begin
       if index <= ftotal then
        begin
           while (campo_temp.index < index) do
              if campo_temp.next <> nil then campo_temp := campo_temp.next;

           if campo_temp.index = index then
              result := campo_temp.dados
           else
              result := tmpdata;
        end;
    end;
end;

procedure TField_GWF.RefreshCampo(index:longint;dados : tdata);
var
   campo_temp : PCampo;
begin
   if index <= ftotal then
    begin
       campo_temp := FCampo;
       while (campo_temp.index < index) do
          if campo_temp.next <> nil then campo_temp := campo_temp.next;

       if campo_temp.index = index then campo_temp.dados := dados;
    end;
end;
 
procedure TField_GWF.Inicializa;
begin
   FTotal := 0;
   Fcampo :=  nil;
   FLast  := nil;
end;

procedure TField_GWF.SyncIndex(campo_ :PCampo);
begin
   if campo_ <> nil then
    begin
       dec(campo_.index);
       if campo_.next <> nil then SyncIndex(campo_.next);
    end;
end;

function TField_GWF.CleanByIndex(index:longint):boolean;
var
   campo_temp,
   anterior : PCampo;
begin
  Result := true;
  if index = 1 then
   begin
      if fcampo.next <> nil then
       begin
          campo_temp := fcampo.next;
          campo_temp.prior := nil;
          dispose(fcampo);
          fcampo := campo_temp;
          SyncIndex(fcampo);
          flast := fcampo;
          dec(ftotal);
       end
      else
       begin
          dispose(Fcampo);
          Fcampo := nil;
       end;
      Result := true;
   end
  else
   begin
      if index <= FTotal then
       begin
           campo_temp := FCampo;
           anterior   := FCampo;
           while (campo_temp.index < index) do
           begin
              anterior   := campo_temp;
              campo_temp := campo_temp.next;
           end;

           if campo_temp.index = index then
            begin
               Dec( FTotal );
               anterior.next := campo_temp.next;
               if campo_temp.next <> nil then
                  SyncIndex(campo_temp.next)
               else
                  flast := anterior;
                Dispose(campo_temp);
                result := true;
            end
       end
      else
       result := false;
   end;
end;
procedure TField_GWF.Clean(campo_ :PCampo);
begin
   if campo_ <> nil then
    begin
       if campo_.next <> nil then Clean(campo_.next);
       if campo_.prior <> nil then campo_.prior.next := nil;
       Dispose(campo_);
       dec(ftotal);
    end;
end;

end.
