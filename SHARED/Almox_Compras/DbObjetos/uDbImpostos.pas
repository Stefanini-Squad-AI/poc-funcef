{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ Analista Responsável: Igor Maffei Libonati Maia       }
{ Atualizado Em: 10/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbImpostos;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbImpostos = class(TCmDbObject)

  private
    FIdPais: TCmDbField;
    FPercBaseImp: TCmDbField;
    FIdPessoa: TCmDbField;
    FCodEstado: TCmDbField;
    FCodTipoCustAgreg: TCmDbField;
    FCodProduto: TCmDbField;
    FPercImposto: TCmDbField;
    procedure SetCodEstado(const Value: TCmDbField);
    procedure SetCodProduto(const Value: TCmDbField);
    procedure SetCodTipoCustAgreg(const Value: TCmDbField);
    procedure SetIdPais(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetPercBaseImp(const Value: TCmDbField);
    procedure SetPercImposto(const Value: TCmDbField);

  public

     Property PercImposto      : TCmDbField read FPercImposto write SetPercImposto;
     Property PercBaseImp      : TCmDbField read FPercBaseImp write SetPercBaseImp;
     Property IdPessoa         : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdPais           : TCmDbField read FIdPais write SetIdPais;
     Property CodTipoCustAgreg : TCmDbField read FCodTipoCustAgreg write SetCodTipoCustAgreg;
     Property CodProduto       : TCmDbField read FCodProduto write SetCodProduto;
     Property CodEstado        : TCmDbField read FCodEstado write SetCodEstado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     Function Delete :Boolean; Override;     
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbImpostos }

constructor TDbImpostos.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'IMPOSTOSXPRODUTOS';

  _UpdateKeyFields := True;

 fPercimposto      := CreateCmDbField('PERCIMPOSTO',ftfloat,True,False,False,True,'Percentual');
 fPercbaseimp      := CreateCmDbField('PERCBASEIMP',ftfloat,True,False,False,True,'Base de Cáculo');
 fIdpessoa         := CreateCmDbField('IDPESSOA',ftfloat,False,True);
 fIdpais           := CreateCmDbField('IDPAIS',ftfloat,False,True);
 fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,True,False,True,'Imposto');
 fCodproduto       := CreateCmDbField('CODPRODUTO',ftString,False,True);
 fCodestado        := CreateCmDbField('CODESTADO',ftString,False,True);
end;

function TDbImpostos.Delete: Boolean;
begin
   Result := Inherited Delete;
end;

function TDbImpostos.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbImpostos.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;

end;

procedure TDbImpostos.SetCodEstado(const Value: TCmDbField);
begin
  FCodEstado := Value;
end;

procedure TDbImpostos.SetCodProduto(const Value: TCmDbField);
begin
  FCodProduto := Value;
end;

procedure TDbImpostos.SetCodTipoCustAgreg(const Value: TCmDbField);
begin
  FCodTipoCustAgreg := Value;
end;

procedure TDbImpostos.SetIdPais(const Value: TCmDbField);
begin
  FIdPais := Value;
end;

procedure TDbImpostos.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbImpostos.SetPercBaseImp(const Value: TCmDbField);
begin
  FPercBaseImp := Value;
end;

procedure TDbImpostos.SetPercImposto(const Value: TCmDbField);
begin
  FPercImposto := Value;
end;

function TDbImpostos.Update: Boolean;
begin
   FCodProduto.AsString := Copy(FCodProduto.AsString +'       ',1,6);
   FCodEstado.AsString  := Copy(FCodEstado.AsString +'       ',1,3);

   Result := Inherited Update;
end;

end.



