{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 22/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBItensInvBens;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBItensInvBens = class(TCmDbObject)

  private
    FIiblocalatual: TCmDbField;
    FIiblocalnovo: TCmDbField;
    FIibflgplaca: TCmDbField;
    FIibflgsitfisica: TCmDbField;
    FIibplaca: TCmDbField;
    FIibconjuntoatual: TCmDbField;
    FIdempresa: TCmDbField;
    FIibidbem: TCmDbField;
    FIdinventariobens: TCmDbField;
    FIibconjuntonovo: TCmDbField;
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdinventariobens(const Value: TCmDbField);
    procedure SetIibconjuntoatual(const Value: TCmDbField);
    procedure SetIibconjuntonovo(const Value: TCmDbField);
    procedure SetIibflgplaca(const Value: TCmDbField);
    procedure SetIibflgsitfisica(const Value: TCmDbField);
    procedure SetIibidbem(const Value: TCmDbField);
    procedure SetIiblocalatual(const Value: TCmDbField);
    procedure SetIiblocalnovo(const Value: TCmDbField);
    procedure SetIibplaca(const Value: TCmDbField);

  public

     Property Iibplaca: TCmDbField read FIibplaca write SetIibplaca;
     Property Iiblocalnovo: TCmDbField read FIiblocalnovo write SetIiblocalnovo;
     Property Iiblocalatual: TCmDbField read FIiblocalatual write SetIiblocalatual;
     Property Iibidbem: TCmDbField read FIibidbem write SetIibidbem;
     Property Iibflgsitfisica: TCmDbField read FIibflgsitfisica write SetIibflgsitfisica;
     Property Iibflgplaca: TCmDbField read FIibflgplaca write SetIibflgplaca;
     Property Iibconjuntonovo: TCmDbField read FIibconjuntonovo write SetIibconjuntonovo;
     Property Iibconjuntoatual: TCmDbField read FIibconjuntoatual write SetIibconjuntoatual;
     Property Idinventariobens: TCmDbField read FIdinventariobens write SetIdinventariobens;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBItensInvBens }

constructor TDBItensInvBens.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ITENSINVBENS';

   fIdinventariobens := CreateCmDbField('IDINVENTARIOBENS',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');
   fIibplaca := CreateCmDbField('IIBPLACA',ftfloat,True,True,False,False,'');
   fIiblocalnovo := CreateCmDbField('IIBLOCALNOVO',ftfloat,False,False,False,True,'');
   fIiblocalatual := CreateCmDbField('IIBLOCALATUAL',ftfloat,False,False,False,True,'');
   fIibidbem := CreateCmDbField('IIBIDBEM',ftfloat,True,True,False,True,'');
   fIibconjuntonovo := CreateCmDbField('IIBCONJUNTONOVO',ftfloat,False,False,False,True,'');
   fIibconjuntoatual := CreateCmDbField('IIBCONJUNTOATUAL',ftfloat,False,False,False,True,'');
   fIibflgsitfisica := CreateCmDbField('IIBFLGSITFISICA',ftfloat,True,False,False,False,'');
   fIibflgplaca := CreateCmDbField('IIBFLGPLACA',ftfloat,True,False,False,False,'');
end;

function TDBItensInvBens.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBItensInvBens.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBItensInvBens.SetIdinventariobens(const Value: TCmDbField);
begin
  FIdinventariobens := Value;
end;

procedure TDBItensInvBens.SetIibconjuntoatual(const Value: TCmDbField);
begin
  FIibconjuntoatual := Value;
end;

procedure TDBItensInvBens.SetIibconjuntonovo(const Value: TCmDbField);
begin
  FIibconjuntonovo := Value;
end;

procedure TDBItensInvBens.SetIibflgplaca(const Value: TCmDbField);
begin
  FIibflgplaca := Value;
end;

procedure TDBItensInvBens.SetIibflgsitfisica(const Value: TCmDbField);
begin
  FIibflgsitfisica := Value;
end;

procedure TDBItensInvBens.SetIibidbem(const Value: TCmDbField);
begin
  FIibidbem := Value;
end;

procedure TDBItensInvBens.SetIiblocalatual(const Value: TCmDbField);
begin
  FIiblocalatual := Value;
end;

procedure TDBItensInvBens.SetIiblocalnovo(const Value: TCmDbField);
begin
  FIiblocalnovo := Value;
end;

procedure TDBItensInvBens.SetIibplaca(const Value: TCmDbField);
begin
  FIibplaca := Value;
end;

end.

