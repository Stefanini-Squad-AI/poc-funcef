{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Gonçalves             }
{ Atualizado Em: 05/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbSaldoorcadoant;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSaldoorcadoant = class(TCmDbObject)

  private
     FVlrrealizado: TCmDbField;
     FVlrorcado: TCmDbField;
     FTrguserinclusao: TCmDbField;
     FTrgdtinclusao: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdcontaorcamen: TCmDbField;
     FExercicio: TCmDbField;

     Procedure SetVlrrealizado(const Value: TCmDbField);
     Procedure SetVlrorcado(const Value: TCmDbField);
     Procedure SetTrguserinclusao(const Value: TCmDbField);
     Procedure SetTrgdtinclusao(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdcontaorcamen(const Value: TCmDbField);
     Procedure SetExercicio(const Value: TCmDbField);
  public

     Property Vlrrealizado   : TCmDbField read FVlrrealizado
                                          write SetVlrrealizado;
     Property Vlrorcado      : TCmDbField read FVlrorcado
                                          write SetVlrorcado;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao
                                          write SetTrguserinclusao;
     Property Trgdtinclusao  : TCmDbField read FTrgdtinclusao
                                          write SetTrgdtinclusao;
     Property Idplanoorcamen : TCmDbField read FIdplanoorcamen
                                          write SetIdplanoorcamen;
     Property Idpessoa       : TCmDbField read FIdpessoa
                                          write SetIdpessoa;
     Property Idcontaorcamen : TCmDbField read FIdcontaorcamen
                                          write SetIdcontaorcamen;
     Property Exercicio      : TCmDbField read FExercicio
                                          write SetExercicio;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSaldoorcadoant }

constructor TDbSaldoorcadoant.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SALDOORCADOANT';

  fVlrrealizado    := CreateCmDbField('VLRREALIZADO'   ,ftfloat   ,False,False,
                                                                 False,True,'');
  fVlrorcado       := CreateCmDbField('VLRORCADO'      ,ftfloat   ,False,False,
                                                                 False,True,'');
  fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString  ,False,False,
                                                                 False,True,'');
  fTrgdtinclusao   := CreateCmDbField('TRGDTINCLUSAO'  ,ftDateTime,False,False,
                                                                 False,True,'');
  fIdplanoorcamen  := CreateCmDbField('IDPLANOORCAMEN' ,ftfloat   ,True ,True ,
                                                                 False,True,'');
  fIdpessoa        := CreateCmDbField('IDPESSOA'       ,ftfloat   ,True ,True ,
                                                                 False,True,'');
  fIdcontaorcamen  := CreateCmDbField('IDCONTAORCAMEN' ,ftString  ,True ,True ,
                                                                 False,True,'');
  fExercicio       := CreateCmDbField('EXERCICIO'      ,ftfloat   ,True ,True ,
                                                                 False,True,'');
end;

function TDbSaldoorcadoant.Insert: Boolean;
begin

   fIdplanoorcamen.AsFloat := GetSequence('SALDOORCADOANT');
   fIdpessoa.AsFloat := GetSequence('SALDOORCADOANT');
   fExercicio.AsFloat := GetSequence('SALDOORCADOANT');
   Result := Inherited Insert;

end;

function TDbSaldoorcadoant.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TDbSaldoorcadoant.SetVlrrealizado(const Value: TCmDbField);
begin
  FVlrrealizado := Value;
end;

Procedure TDbSaldoorcadoant.SetVlrorcado(const Value: TCmDbField);
begin
  FVlrorcado := Value;
end;

Procedure TDbSaldoorcadoant.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

Procedure TDbSaldoorcadoant.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

Procedure TDbSaldoorcadoant.SetIdplanoorcamen(const Value: TCmDbField);
begin
  FIdplanoorcamen := Value;
end;

Procedure TDbSaldoorcadoant.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

Procedure TDbSaldoorcadoant.SetIdcontaorcamen(const Value: TCmDbField);
begin
  FIdcontaorcamen := Value;
end;

Procedure TDbSaldoorcadoant.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;

end.



