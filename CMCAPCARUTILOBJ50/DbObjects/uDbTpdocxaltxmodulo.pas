{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/10/2003                             }
{                                                       }
{*******************************************************}

unit uDbTpdocxaltxmodulo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTpdocxaltxmodulo = class(TCmDbObject)

  private
     FTipodoc         : TCmDbField;
     FCODALTJUROS    : TCmDbField;
     FCODALTDESC    : TCmDbField;
     FCODALTABAT   : TCmDbField;
     FCODALTOUTROS :  TCmDbField;
     FIdtpdocxaltxmod : TCmDbField;
     FIdmodulo        : TCmDbField;
     Procedure SetTipodoc(const Value: TCmDbField);
     Procedure SetCODALTJUROS(const Value: TCmDbField);
     Procedure SetCODALTDESC(const Value: TCmDbField);
     Procedure SetCODALTABAT(const Value: TCmDbField);
     Procedure SetCODALTOUTROS(const Value: TCmDbField);
     Procedure SetIdtpdocxaltxmod(const Value: TCmDbField);

     Procedure SetIdmodulo(const Value: TCmDbField);

  public

     Property Tipodoc         : TCmDbField read FTipodoc write SetTipodoc;
     Property CODALTJUROS    : TCmDbField read FCODALTJUROS write SetCODALTJUROS;
     Property CODALTDESC    : TCmDbField read FCODALTDESC write SetCODALTDESC;
     Property CODALTABAT   : TCmDbField read FCODALTABAT write SetCODALTABAT;
     Property CODALTOUTROS   : TCmDbField read FCODALTOUTROS write SetCODALTOUTROS;

     Property Idtpdocxaltxmod : TCmDbField read FIdtpdocxaltxmod write SetIdtpdocxaltxmod;
     Property Idmodulo        : TCmDbField read FIdmodulo write SetIdmodulo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTpdocxaltxmodulo }

constructor TDbTpdocxaltxmodulo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TPDOCXALTXMODULO';

  fTipodoc         := CreateCmDbField('TIPODOC',ftfloat,False,False,False,True,'');
  fCODALTJUROS    := CreateCmDbField('CODALTJUROS',ftfloat,False,False,False,True,'');
  fCODALTDESC    := CreateCmDbField('CODALTDESC',ftfloat,False,False,False,True,'');
  fCODALTABAT   := CreateCmDbField('CODALTABAT',ftfloat,False,False,False,True,'');
  fCODALTOUTROS   := CreateCmDbField('CODALTOUTROS',ftfloat,False,False,False,True,'');

  fIdtpdocxaltxmod := CreateCmDbField('IDTPDOCXALTXMOD',ftfloat,True,True,False,True,'');
  fIdmodulo        := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'');
end;

function TDbTpdocxaltxmodulo.Insert: Boolean;
begin
  fIdtpdocxaltxmod.AsFloat := GetSequence('TPDOCXALTXMODULO');
  Result := Inherited Insert;
end;


procedure TDbTpdocxaltxmodulo.SetIdmodulo(const Value: TCmDbField);
begin
  fIdmodulo := Value;
end;

procedure TDbTpdocxaltxmodulo.SetIdtpdocxaltxmod(const Value: TCmDbField);
begin
  fIdtpdocxaltxmod := Value;
end;

procedure TDbTpdocxaltxmodulo.SetCODALTABAT(const Value: TCmDbField);
begin
  fCODALTABAT := Value
end;

procedure TDbTpdocxaltxmodulo.SetCODALTDESC(const Value: TCmDbField);
begin
  fCODALTDESC := Value;
end;

procedure TDbTpdocxaltxmodulo.SetCODALTJUROS(const Value: TCmDbField);
begin
  fCODALTJUROS := Value;
end;

procedure TDbTpdocxaltxmodulo.SetTipodoc(const Value: TCmDbField);
begin
  fTipodoc := Value;
end;

procedure TDbTpdocxaltxmodulo.SetCODALTOUTROS(const Value: TCmDbField);
begin
  fCODALTOUTROS := Value;
end;

end.



