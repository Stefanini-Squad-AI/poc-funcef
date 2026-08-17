{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/08/2004                             }
{                                                       }
{*******************************************************}

unit uDbLoteexportactb;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLoteexportactb = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FDesclote: TCmDbField;
    FIdloteexportactb: TCmDbField;
    FDatalote: TCmDbField;
    FTipoLote: TCmDbField;
    FNumLote: TCmDbField;
    procedure SetDatalote(const Value: TCmDbField);
    procedure SetDesclote(const Value: TCmDbField);
    procedure SetIdloteexportactb(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetTipoLote(const Value: TCmDbField);
    procedure SetNumLote(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idloteexportactb: TCmDbField read FIdloteexportactb write SetIdloteexportactb;
     Property Desclote: TCmDbField read FDesclote write SetDesclote;
     Property Datalote: TCmDbField read FDatalote write SetDatalote;
     Property TipoLote: TCmDbField read FTipoLote write SetTipoLote;
     Property NumLote : TCmDbField read FNumLote  write SetNumLote;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLoteexportactb }

constructor TDbLoteexportactb.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOTEEXPORTACTB';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdloteexportactb := CreateCmDbField('IDLOTEEXPORTACTB',ftfloat,True,True,False,True,'');
   fDesclote := CreateCmDbField('DESCLOTE',ftString,False,False,False,True,'');
   fDatalote := CreateCmDbField('DATALOTE',ftDateTime,False,False,False,True,'');
   fTipoLote := CreateCmDbField('TIPOLOTE',ftString,False,False,False,True,'');
   fNumLote  := CreateCmDbField('NUMLOTE',ftfloat,False,False,False,True,'');
end;

function TDbLoteexportactb.Insert: Boolean;
begin

   fIdloteexportactb.AsFloat := GetSequence('LOTEEXPORTACTB');
   Result := Inherited Insert;

end;


procedure TDbLoteexportactb.SetDatalote(const Value: TCmDbField);
begin
  FDatalote := Value;
end;

procedure TDbLoteexportactb.SetDesclote(const Value: TCmDbField);
begin
  FDesclote := Value;
end;

procedure TDbLoteexportactb.SetIdloteexportactb(const Value: TCmDbField);
begin
  FIdloteexportactb := Value;
end;

procedure TDbLoteexportactb.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbLoteexportactb.SetNumLote(const Value: TCmDbField);
begin
  FNumLote := Value;
end;

procedure TDbLoteexportactb.SetTipoLote(const Value: TCmDbField);
begin
  FTipoLote := Value;
end;

end.



