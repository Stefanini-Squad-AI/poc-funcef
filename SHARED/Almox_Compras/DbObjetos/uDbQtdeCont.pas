{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbQtdeCont;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbQtdeCont = class(TCmDbObject)

  private
    FCodMedida: TCmDbField;
    FCodArtigo: TCmDbField;
    FQtdeRecontagem: TCmDbField;
    FIdInventario: TCmDbField;
    FQtdeContada: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetIdInventario(const Value: TCmDbField);
    procedure SetQtdeContada(const Value: TCmDbField);
    procedure SetQtdeRecontagem(const Value: TCmDbField);

  public

     Property QtdeRecontagem  : TCmDbField read FQtdeRecontagem write SetQtdeRecontagem;
     Property QtdeContada     : TCmDbField read FQtdeContada write SetQtdeContada;
     Property IdInventario    : TCmDbField read FIdInventario write SetIdInventario;
     Property CodMedida       : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo       : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbQtdeCont }

constructor TDbQtdeCont.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'QTDECONT';

   fQtderecontagem := CreateCmDbField('QTDERECONTAGEM',ftfloat,False,False,False,True,'');
   fQtdecontada := CreateCmDbField('QTDECONTADA',ftfloat,False,False,False,False,'');
   fIdinventario := CreateCmDbField('IDINVENTARIO',ftfloat,True,True,False,True,'');
   fCodmedida := CreateCmDbField('CODMEDIDA',ftString,True,True,False,True,'');
   fCodartigo := CreateCmDbField('CODARTIGO',ftString,True,True,False,True,'');
end;

function TDbQtdeCont.Insert: Boolean;
begin

   fIdinventario.AsFloat := GetSequence('QTDECONT');
   Result := Inherited Insert;

end;

function TDbQtdeCont.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbQtdeCont.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbQtdeCont.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbQtdeCont.SetIdInventario(const Value: TCmDbField);
begin
  FIdInventario := Value;
end;

procedure TDbQtdeCont.SetQtdeContada(const Value: TCmDbField);
begin
  FQtdeContada := Value;
end;

procedure TDbQtdeCont.SetQtdeRecontagem(const Value: TCmDbField);
begin
  FQtdeRecontagem := Value;
end;

end.



