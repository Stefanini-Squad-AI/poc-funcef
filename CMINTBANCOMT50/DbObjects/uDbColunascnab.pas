{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2008                             }
{                                                       }
{*******************************************************}

unit uDbColunascnab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbColunascnab = class(TCmDbObject)

  private
    FAlinhamento: TCmDbField;
    FIdlinhascnab: TCmDbField;
    FValorfixo: TCmDbField;
    FDesccolunascnab: TCmDbField;
    FTotalizador: TCmDbField;
    FPosfim: TCmDbField;
    FCharcompl: TCmDbField;
    FPosini: TCmDbField;
    FIdcolunascnab: TCmDbField;
    FNomecampobd: TCmDbField;
    procedure SetAlinhamento(const Value: TCmDbField);
    procedure SetCharcompl(const Value: TCmDbField);
    procedure SetDesccolunascnab(const Value: TCmDbField);
    procedure SetIdcolunascnab(const Value: TCmDbField);
    procedure SetIdlinhascnab(const Value: TCmDbField);
    procedure SetNomecampobd(const Value: TCmDbField);
    procedure SetPosfim(const Value: TCmDbField);
    procedure SetPosini(const Value: TCmDbField);
    procedure SetTotalizador(const Value: TCmDbField);
    procedure SetValorfixo(const Value: TCmDbField);

  public

     Property Valorfixo: TCmDbField read FValorfixo write SetValorfixo;
     Property Totalizador: TCmDbField read FTotalizador write SetTotalizador;
     Property Posini: TCmDbField read FPosini write SetPosini;
     Property Posfim: TCmDbField read FPosfim write SetPosfim;
     Property Nomecampobd: TCmDbField read FNomecampobd write SetNomecampobd;
     Property Idlinhascnab: TCmDbField read FIdlinhascnab write SetIdlinhascnab;
     Property Idcolunascnab: TCmDbField read FIdcolunascnab write SetIdcolunascnab;
     Property Desccolunascnab: TCmDbField read FDesccolunascnab write SetDesccolunascnab;
     Property Charcompl: TCmDbField read FCharcompl write SetCharcompl;
     Property Alinhamento: TCmDbField read FAlinhamento write SetAlinhamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbColunascnab }

constructor TDbColunascnab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COLUNASCNAB';

   fValorfixo := CreateCmDbField('VALORFIXO',ftfloat,False,False,False,True,'');
   fTotalizador := CreateCmDbField('TOTALIZADOR',ftString,False,False,False,True,'');
   fPosini := CreateCmDbField('POSINI',ftfloat,False,False,False,True,'');
   fPosfim := CreateCmDbField('POSFIM',ftfloat,False,False,False,True,'');
   fNomecampobd := CreateCmDbField('NOMECAMPOBD',ftString,False,False,False,True,'');
   fIdlinhascnab := CreateCmDbField('IDLINHASCNAB',ftfloat,False,False,False,True,'');
   fIdcolunascnab := CreateCmDbField('IDCOLUNASCNAB',ftfloat,True,True,False,True,'');
   fDesccolunascnab := CreateCmDbField('DESCCOLUNASCNAB',ftString,False,False,False,True,'');
   fCharcompl := CreateCmDbField('CHARCOMPL',ftString,False,False,False,True,'');
   fAlinhamento := CreateCmDbField('ALINHAMENTO',ftString,False,False,False,True,'');
end;

function TDbColunascnab.Insert: Boolean;
begin

   fIdcolunascnab.AsFloat := GetSequence('COLUNASCNAB');
   Result := Inherited Insert;

end;


procedure TDbColunascnab.SetAlinhamento(const Value: TCmDbField);
begin
  FAlinhamento := Value;
end;

procedure TDbColunascnab.SetCharcompl(const Value: TCmDbField);
begin
  FCharcompl := Value;
end;

procedure TDbColunascnab.SetDesccolunascnab(const Value: TCmDbField);
begin
  FDesccolunascnab := Value;
end;

procedure TDbColunascnab.SetIdcolunascnab(const Value: TCmDbField);
begin
  FIdcolunascnab := Value;
end;

procedure TDbColunascnab.SetIdlinhascnab(const Value: TCmDbField);
begin
  FIdlinhascnab := Value;
end;

procedure TDbColunascnab.SetNomecampobd(const Value: TCmDbField);
begin
  FNomecampobd := Value;
end;

procedure TDbColunascnab.SetPosfim(const Value: TCmDbField);
begin
  FPosfim := Value;
end;

procedure TDbColunascnab.SetPosini(const Value: TCmDbField);
begin
  FPosini := Value;
end;

procedure TDbColunascnab.SetTotalizador(const Value: TCmDbField);
begin
  FTotalizador := Value;
end;

procedure TDbColunascnab.SetValorfixo(const Value: TCmDbField);
begin
  FValorfixo := Value;
end;

end.



