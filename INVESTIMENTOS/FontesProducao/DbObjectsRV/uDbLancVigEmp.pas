{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 12/11/2010                             }
{                                                       }
{*******************************************************}

unit uDbLancVigEmp;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancVigEmp = class(TCmDbObject)

  private
    FTipolanc: TCmDbField;
    FDatavigente: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdlancvigemp: TCmDbField;
    procedure SetDatavigente(const Value: TCmDbField);
    procedure SetIdlancvigemp(const Value: TCmDbField);
    procedure SetTipolanc(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipolanc: TCmDbField read FTipolanc write SetTipolanc;
     Property Idlancvigemp: TCmDbField read FIdlancvigemp write SetIdlancvigemp;
     Property Datavigente: TCmDbField read FDatavigente write SetDatavigente;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancVigEmp }

constructor TDbLancVigEmp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCVIGEMP';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftString,False,False,False,True,'');
   fTipolanc := CreateCmDbField('TIPOLANC',ftString,False,False,False,True,'');
   fIdlancvigemp := CreateCmDbField('IDLANCVIGEMP',ftfloat,True,True,False,True,'');
   fDatavigente := CreateCmDbField('DATAVIGENTE',ftDateTime,True,True,False,True,'');
end;

function TDbLancVigEmp.Insert: Boolean;
begin

   fIdlancvigemp.AsFloat := GetSequence('LANCVIGEMP');
   Result := Inherited Insert;

end;


procedure TDbLancVigEmp.SetDatavigente(const Value: TCmDbField);
begin
  FDatavigente := Value;
end;

procedure TDbLancVigEmp.SetIdlancvigemp(const Value: TCmDbField);
begin
  FIdlancvigemp := Value;
end;

procedure TDbLancVigEmp.SetTipolanc(const Value: TCmDbField);
begin
  FTipolanc := Value;
end;

procedure TDbLancVigEmp.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbLancVigEmp.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



