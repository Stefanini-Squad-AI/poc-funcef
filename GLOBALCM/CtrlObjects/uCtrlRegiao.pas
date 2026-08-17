unit uCtrlRegiao;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbRegiao, uCMTypes;

Type

  TCtrlRegiao = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    FcdsRegiao: TClientDataSet;
    FDbRegiao: TDbRegiao;
    procedure SetcdsRegiao(const Value: TClientDataSet);
    procedure SetDbRegiao(const Value: TDbRegiao);
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------

  Public
    property cdsRegiao: TClientDataSet read FcdsRegiao write SetcdsRegiao;
    property DbRegiao: TDbRegiao read FDbRegiao write SetDbRegiao;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    function  ListaRegiao(const IdRegiao: Integer = -1; const IdPessoa: integer = -1): OleVariant;
  End;

implementation

{ TCtrlRegiao }

constructor TCtrlRegiao.Create;
begin
  inherited;
  //amf:07.12.2005 - Instancia os DbObjects
  FdbRegiao := TDbRegiao.Create (self);

  // Instancia os ClientDataSets deste CtrlObject
  FcdsRegiao := TClientDataSet.Create (nil);
end;

destructor TCtrlRegiao.Destroy;
begin
  FreeAndNil(FdbRegiao);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil(FcdsRegiao);
  end;
  inherited;

end;

procedure TCtrlRegiao.DoChangeDataBase;
begin
  inherited;
  // Atribui o DataBase a propriedade DataBaseName do DbObject
  FdbRegiao.DataBaseName := DataBaseName;
end;

Function  TCtrlRegiao.ListaRegiao(const IdRegiao: Integer = -1; const IdPessoa: integer = -1)
: OleVariant;
var sSql: String;
begin
   sSql := 'SELECT  ' + #13 +
           '   IDREGIAO, DESCREGIAO, IDPESSOA ' + #13 +
           'FROM REGIAO ' + #13 +
          ' WHERE 1 = 1 ';

   if IdRegiao <> -1 then
     sSql := sSql + 'AND IDREGIAO = ' + IntToStr (IdRegiao);

   if IdPessoa <> -1 then
     sSql := sSql + 'AND IDPESSOA = ' + IntToStr (IdPessoa);

   Result := GetDataPacket (sSql);
end;

procedure TCtrlRegiao.SetcdsRegiao(const Value: TClientDataSet);
begin
  FcdsRegiao := Value;
end;

procedure TCtrlRegiao.SetDbRegiao(const Value: TDbRegiao);
begin
  FDbRegiao := Value;
end;

end.
 