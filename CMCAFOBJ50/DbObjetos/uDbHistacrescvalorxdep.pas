{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 23/12/2010                             }
{ SOL: 142551 KTN: 911676                               }
{*******************************************************}

unit uDbHistacrescvalorxdep;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistacrescvalorxdep = class(TCmDbObject)

  private
     FVidautil: TCmDbField;
     Fuserinclusao: TCmDbField;
     Fdtinclusao: TCmDbField;
     FTaxadep: TCmDbField;
     FMoecodigo: TCmDbField;
     FIdseldepreciacao: TCmDbField;
     FIdacrescimoxdep: TCmDbField;
     FIdacrescimo: TCmDbField;
     FFlgdepsuspensa: TCmDbField;
     FFlgdeprec: TCmDbField;
     FDeplanc: TCmDbField;
     FDataultdep: TCmDbField;
     FDataultcm: TCmDbField;
     FDatainiciodep: TCmDbField;
     FDatafimdep: TCmDbField;
     FCmdep: TCmDbField;

     procedure SetVidautil(const Value: TCmDbField);
     procedure Setuserinclusao(const Value: TCmDbField);
     procedure Setdtinclusao(const Value: TCmDbField);
     procedure SetTaxadep(const Value: TCmDbField);
     procedure SetMoecodigo(const Value: TCmDbField);
     procedure SetIdseldepreciacao(const Value: TCmDbField);
     procedure SetIdacrescimoxdep(const Value: TCmDbField);
     procedure SetIdacrescimo(const Value: TCmDbField);
     procedure SetFlgdepsuspensa(const Value: TCmDbField);
     procedure SetFlgdeprec(const Value: TCmDbField);
     procedure SetDeplanc(const Value: TCmDbField);
     procedure SetDataultdep(const Value: TCmDbField);
     procedure SetDataultcm(const Value: TCmDbField);
     procedure SetDatainiciodep(const Value: TCmDbField);
     procedure SetDatafimdep(const Value: TCmDbField);
     procedure SetCmdep(const Value: TCmDbField);

  public

     Property Vidautil: TCmDbField read FVidautil write SetVidautil;
     Property Userinclusao: TCmDbField read FUserinclusao write SetUserinclusao;
     Property Dtinclusao: TCmDbField read FDtinclusao write SetDtinclusao;
     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idseldepreciacao: TCmDbField read FIdseldepreciacao write SetIdseldepreciacao;
     Property Idacrescimoxdep: TCmDbField read FIdacrescimoxdep write SetIdacrescimoxdep;
     Property Idacrescimo: TCmDbField read FIdacrescimo write SetIdacrescimo;
     Property Flgdepsuspensa: TCmDbField read FFlgdepsuspensa write SetFlgdepsuspensa;
     Property Flgdeprec: TCmDbField read FFlgdeprec write SetFlgdeprec;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Dataultcm: TCmDbField read FDataultcm write SetDataultcm;
     Property Datainiciodep: TCmDbField read FDatainiciodep write SetDatainiciodep;
     Property Datafimdep: TCmDbField read FDatafimdep write SetDatafimdep;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHistacrescvalorxdep }

constructor TDbHistacrescvalorxdep.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTACRESCVALORXDEP';

   fVidautil := CreateCmDbField('VIDAUTIL',ftfloat,False,False,False,True,'');
   fuserinclusao := CreateCmDbField('USERINCLUSAO',ftString,False,False,False,True,'');
   fdtinclusao := CreateCmDbField('DTINCLUSAO',ftDateTime,False,False,False,True,'',-1,True);
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdseldepreciacao := CreateCmDbField('IDSELDEPRECIACAO',ftfloat,True,True,False,True,'');
   fIdacrescimoxdep := CreateCmDbField('IDACRESCIMOXDEP',ftfloat,True,True,False,True,'');
   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,True,'');
   fFlgdepsuspensa := CreateCmDbField('FLGDEPSUSPENSA',ftfloat,False,False,False,True,'');
   fFlgdeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,True,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,True,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
   fDatainiciodep := CreateCmDbField('DATAINICIODEP',ftDateTime,False,False,False,True,'');
   fDatafimdep := CreateCmDbField('DATAFIMDEP',ftDateTime,False,False,False,True,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,True,'');
end;

function TDbHistacrescvalorxdep.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbHistacrescvalorxdep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbHistacrescvalorxdep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDbHistacrescvalorxdep.SetDatafimdep(const Value: TCmDbField);
begin
  FDatafimdep := Value;
end;

procedure TDbHistacrescvalorxdep.SetDatainiciodep(const Value: TCmDbField);
begin
  FDatainiciodep := Value;
end;

procedure TDbHistacrescvalorxdep.SetDataultcm(const Value: TCmDbField);
begin
  FDataultcm := Value;
end;

procedure TDbHistacrescvalorxdep.SetDataultdep(const Value: TCmDbField);
begin
  FDataultdep := Value;
end;

procedure TDbHistacrescvalorxdep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDbHistacrescvalorxdep.Setdtinclusao(const Value: TCmDbField);
begin
  Fdtinclusao := Value;
end;

procedure TDbHistacrescvalorxdep.SetFlgdeprec(const Value: TCmDbField);
begin
  FFlgdeprec := Value;
end;

procedure TDbHistacrescvalorxdep.SetFlgdepsuspensa(const Value: TCmDbField);
begin
  FFlgdepsuspensa := Value;
end;

procedure TDbHistacrescvalorxdep.SetIdacrescimo(const Value: TCmDbField);
begin
  FIdacrescimo := Value;
end;

procedure TDbHistacrescvalorxdep.SetIdacrescimoxdep( const Value: TCmDbField);
begin
  FIdacrescimoxdep := Value;
end;

procedure TDbHistacrescvalorxdep.SetIdseldepreciacao(const Value: TCmDbField);
begin
  FIdseldepreciacao := Value;
end;

procedure TDbHistacrescvalorxdep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbHistacrescvalorxdep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

procedure TDbHistacrescvalorxdep.Setuserinclusao(const Value: TCmDbField);
begin
  FUserinclusao := Value;
end;

procedure TDbHistacrescvalorxdep.SetVidautil(const Value: TCmDbField);
begin
  FVidautil := Value;
end;

end.



