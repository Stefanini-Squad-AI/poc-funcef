{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlNatuRendimento;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbNatuRendimento, DB, uDataBase, uSistema, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlNatuRendimento = Class(TCmControlObject)

    private
    FDbNaturendimento: TDbNatuRendimento;

    FCdsNaturendimento: TClientDataSet;

    procedure SetDbNaturendimento(const Value: TDbNaturendimento);
    procedure SetCdsNaturendimento(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsNaturendimento: TClientDataSet   read FCdsNaturendimento  write SetCdsNaturendimento;
      property DbNaturendimento: TDbNaturendimento read FDbNaturendimento   write setDbNaturendimento;

      {Grava Alterações das Naturezas de rendimento no Banco de Dados}
      Function GravarNaturendimento : Boolean;
      {Procura a natureza de rendimento especificada}
      function ProcurarNaturendimento(CodNatureza : string) : OleVariant;
      {Lista da Naturezas de Rendimento disponíveis}
      function ListNaturendimento : OleVariant;
     {Lista da Naturezas de Rendimento sem os codigos 5952,5960,5979,5987}
      function ListNaturendimento_Filtrada : OleVariant;
      {Pega o CodForma da natureza}
      function GetCodForma(CodNatureza : string) : OleVariant;
      function ListNaturendimento_Especifica: OleVariant; // p. 16296

    protected

    End;

implementation

{ TCtrlNatuRendimento }




constructor TCtrlNatuRendimento.Create;
begin
  inherited;
  FDbNaturendimento   := TDbNaturendimento.create(self);
end;

destructor TCtrlNatuRendimento.Destroy;
begin
  FDbNaturendimento.Free;
  if isAppServer then
    Begin
      FCdsNaturendimento.free;
    end;
  inherited;
end;

procedure TCtrlNatuRendimento.DoChangeDataBase;
begin
  inherited;
  DbNaturendimento.DataBaseName   := DataBaseName;
end;




procedure TCtrlNatuRendimento.SetCdsNaturendimento(
  const Value: TClientDataSet);
begin
  FCdsNaturendimento := Value;
end;

procedure TCtrlNatuRendimento.SetDbNaturendimento(
        const Value: TDbNaturendimento);
begin
  FDbNaturendimento := Value;
end;

function TCtrlNatuRendimento.GravarNaturendimento: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaNaturendimento(FCdsNaturendimento.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai
           Result := ApplyCds(FCdsNaturendimento,FDbNaturendimento,[],[] );
           Msg    := FDbNaturendimento.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;


function TCtrlNatuRendimento.ProcurarNaturendimento(CodNatureza : string) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM NATURENDIMENTO '+
          ' WHERE CODNATUREZA = '+quotedStr(CodNatureza);
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlNatuRendimento.OnCreateAppServer;
begin
  inherited;
  FcdsNaturendimento := TClientDataSet.Create(nil);
end;

function TCtrlNatuRendimento.ListNaturendimento: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODNATUREZA,DESCRICAO '+
          '       , CODNATUREZA || '' - '' || DESCRICAO AS CODDESC ' + //Cássio Rovaroto - SIG nº 122397
          '  FROM NATURENDIMENTO '+
          ' ORDER BY CODNATUREZA';
  Result := GetDataPacket(Ssql);
end;

function TCtrlNatuRendimento.ListNaturendimento_Filtrada: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODNATUREZA,DESCRICAO '+
          '  FROM NATURENDIMENTO '+
          '  WHERE CODNATUREZA NOT IN (''5952'',''5960'',''5979'',''5987'') '+
          ' ORDER BY CODNATUREZA';
  Result := GetDataPacket(Ssql);
end;



function TCtrlNatuRendimento.ListNaturendimento_Especifica: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODNATUREZA,DESCRICAO '+
          '  FROM NATURENDIMENTO '+
          '  WHERE CODNATUREZA IN (''5952'',''5960'',''5979'',''5987'') '+
          ' ORDER BY CODNATUREZA';
  Result := GetDataPacket(Ssql);
end;


function TCtrlNatuRendimento.GetCodForma(CodNatureza: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODFORMA '+
          '  FROM NATURENDIMENTO '+
          ' WHERE (CODNATUREZA = '+quotedStr(CodNatureza)+') '+
          '   AND (CODFORMA IS NOT NULL) ';
  Result := GetDataPacket(Ssql);
end;

end.

