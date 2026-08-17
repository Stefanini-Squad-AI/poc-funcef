{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ Analista Responsável: Igor Maffei Libonati Maia       }
{ Atualizado Em: 10/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbArtigo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbArtigo = class(TCmDbObject)

  private
    FCodArtigo: TCmDbField;
    FCodTamanho: TCmDbField;
    FValUltCompra: TCmDbField;
    FExisTeft: TCmDbField;
    FFlgBloqueado: TCmDbField;
    FCodProduto: TCmDbField;
    FCodCor: TCmDbField;
    FCodTipoArtigo: TCmDbField;
    FFlgAtivo: TCmDbField;
    FCodBarra: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodCor(const Value: TCmDbField);
    procedure SetCodProduto(const Value: TCmDbField);
    procedure SetCodTamanho(const Value: TCmDbField);
    procedure SetCodTipoArtigo(const Value: TCmDbField);
    procedure SetExisTeft(const Value: TCmDbField);
    procedure SetFlgBloqueado(const Value: TCmDbField);
    procedure SetValUltCompra(const Value: TCmDbField);
    procedure SetFlgAtivo(const Value: TCmDbField);
    procedure SetCodBarra(const Value: TCmDbField);

  public
     Property ValUltCompra  : TCmDbField read FValUltCompra write SetValUltCompra;
     Property FlgBloqueado  : TCmDbField read FFlgBloqueado write SetFlgBloqueado;
     Property ExisTeft      : TCmDbField read FExisTeft write SetExisTeft;
     Property CodTipoArtigo : TCmDbField read FCodTipoArtigo write SetCodTipoArtigo;
     Property CodTamanho    : TCmDbField read FCodTamanho write SetCodTamanho;
     Property CodProduto    : TCmDbField read FCodProduto write SetCodProduto;
     Property CodCor        : TCmDbField read FCodCor write SetCodCor;
     Property CodArtigo     : TCmDbField read FCodArtigo write SetCodArtigo;
     Property FlgAtivo      : TCmDbField read FFlgAtivo write SetFlgAtivo;
     Property CodBarra      : TCmDbField read FCodBarra write SetCodBarra;
     //
     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbArtigo }

constructor TDbArtigo.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ARTIGO';

  fCodartigo     := CreateCmDbField('CODARTIGO'    ,ftString,True,True);
  fValultcompra  := CreateCmDbField('VALULTCOMPRA' ,ftfloat ,False,False);
  fFlgbloqueado  := CreateCmDbField('FLGBLOQUEADO' ,ftString,False,False);
  fExisteft      := CreateCmDbField('EXISTEFT'     ,ftString,False,False);
  fCodtipoartigo := CreateCmDbField('CODTIPOARTIGO',ftString,False,False);
  fCodtamanho    := CreateCmDbField('CODTAMANHO'   ,ftString,False,False);
  fCodproduto    := CreateCmDbField('CODPRODUTO'   ,ftString,False,False);
  fCodcor        := CreateCmDbField('CODCOR'       ,ftString,False,False);
  FFlgAtivo      := CreateCmDbField('FLGATIVO'     ,ftString,True,False);
  FCodBarra      := CreateCmDbField('CODBARRA'     ,ftString,False,False);
end;

function TDbArtigo.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbArtigo.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;

end;

procedure TDbArtigo.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbArtigo.SetCodBarra(const Value: TCmDbField);
begin
  FCodBarra := Value;
end;

procedure TDbArtigo.SetCodCor(const Value: TCmDbField);
begin
  FCodCor := Value;
end;

procedure TDbArtigo.SetCodProduto(const Value: TCmDbField);
begin
  FCodProduto := Value;
end;

procedure TDbArtigo.SetCodTamanho(const Value: TCmDbField);
begin
  FCodTamanho := Value;
end;

procedure TDbArtigo.SetCodTipoArtigo(const Value: TCmDbField);
begin
  FCodTipoArtigo := Value;
end;

procedure TDbArtigo.SetExisTeft(const Value: TCmDbField);
begin
  FExisTeft := Value;
end;

procedure TDbArtigo.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;

procedure TDbArtigo.SetFlgBloqueado(const Value: TCmDbField);
begin
  FFlgBloqueado := Value;
end;

procedure TDbArtigo.SetValUltCompra(const Value: TCmDbField);
begin
  FValUltCompra := Value;
end;


end.



