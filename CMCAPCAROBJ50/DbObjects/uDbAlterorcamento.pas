{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Goncalves             }
{ Atualizado Em: 11/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbAlterorcamento;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject; 

Type
  TDbAlterorcamento = class(TCmDbObject)

  private
     FVlrsolicitado: TCmDbField;
     FPeriodoorigem: TCmDbField;
     FPeriododestino: TCmDbField;
     FObsalterorcamen: TCmDbField;
     FNumalteracao: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdcontaorigem: TCmDbField;
     FIdcontadestino: TCmDbField;
     FIdalterorcamento: TCmDbField;
     FFlgtipoalter: TCmDbField;
     FExercicioorigem: TCmDbField;
     FExerciciodestino: TCmDbField;
     FDatareferencia: TCmDbField;

     Procedure SetVlrsolicitado(const Value: TCmDbField);
     Procedure SetPeriodoorigem(const Value: TCmDbField);
     Procedure SetPeriododestino(const Value: TCmDbField);
     Procedure SetObsalterorcamen(const Value: TCmDbField);
     Procedure SetNumalteracao(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdcontaorigem(const Value: TCmDbField);
     Procedure SetIdcontadestino(const Value: TCmDbField);
     Procedure SetIdalterorcamento(const Value: TCmDbField);
     Procedure SetFlgtipoalter(const Value: TCmDbField);
     Procedure SetExercicioorigem(const Value: TCmDbField);
     Procedure SetExerciciodestino(const Value: TCmDbField);
     Procedure SetDatareferencia(const Value: TCmDbField);

  public

     Property Vlrsolicitado   : TCmDbField
                               Read FVlrsolicitado    Write SetVlrsolicitado;
     Property Periodoorigem   : TCmDbField
                               Read FPeriodoorigem    Write SetPeriodoorigem;
     Property Periododestino  : TCmDbField
                               Read FPeriododestino   Write SetPeriododestino;
     Property Obsalterorcamen : TCmDbField
                               Read FObsalterorcamen  Write SetObsalterorcamen;
     Property Numalteracao    : TCmDbField
                               Read FNumalteracao     Write SetNumalteracao;
     Property Idplanoorcamen  : TCmDbField
                               Read FIdplanoorcamen   Write SetIdplanoorcamen;
     Property Idpessoa        : TCmDbField
                               Read FIdpessoa         Write SetIdpessoa;
     Property Idcontaorigem   : TCmDbField
                               Read FIdcontaorigem    Write SetIdcontaorigem;
     Property Idcontadestino  : TCmDbField
                               Read FIdcontadestino   Write SetIdcontadestino;
     Property Idalterorcamento: TCmDbField
                               Read FIdalterorcamento Write SetIdalterorcamento;
     Property Flgtipoalter    : TCmDbField
                               Read FFlgtipoalter     Write SetFlgtipoalter;
     Property Exercicioorigem : TCmDbField
                               Read FExercicioorigem  Write SetExercicioorigem;
     Property Exerciciodestino: TCmDbField
                               Read FExerciciodestino Write SetExerciciodestino;
     Property Datareferencia  : TCmDbField
                               Read FDatareferencia   Write SetDatareferencia;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAlterorcamento }

constructor TDbAlterorcamento.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALTERORCAMENTO';

   fVlrsolicitado    := CreateCmDbField('VLRSOLICITADO'   ,ftfloat   ,False,
                        False,False,True,'');
   fPeriodoorigem    := CreateCmDbField('PERIODOORIGEM'   ,ftfloat   ,False,
                        False,False,True,'');
   fPeriododestino   := CreateCmDbField('PERIODODESTINO'  ,ftfloat   ,False,
                        False,False,True,'');
   fObsalterorcamen  := CreateCmDbField('OBSALTERORCAMEN' ,ftString  ,False,
                        False,False,True,'');
   fNumalteracao     := CreateCmDbField('NUMALTERACAO'    ,ftfloat   ,True ,
                        False,False,True,'');
   fIdplanoorcamen   := CreateCmDbField('IDPLANOORCAMEN'  ,ftfloat   ,False,
                        False,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA'        ,ftfloat   ,False,
                        False,False,True,'');
   fIdcontaorigem    := CreateCmDbField('IDCONTAORIGEM'   ,ftString  ,False,
                        False,False,True,'');
   fIdcontadestino   := CreateCmDbField('IDCONTADESTINO'  ,ftString  ,False,
                        False,False,True,'');
   fIdalterorcamento := CreateCmDbField('IDALTERORCAMENTO',ftfloat   ,True ,
                        True ,False,True,'');
   fFlgtipoalter     := CreateCmDbField('FLGTIPOALTER'    ,ftString  ,False,
                        False,False,True,'');
   fExercicioorigem  := CreateCmDbField('EXERCICIOORIGEM' ,ftfloat   ,False,
                        False,False,True,'');
   fExerciciodestino := CreateCmDbField('EXERCICIODESTINO',ftfloat   ,False,
                        False,False,True,'');
   fDatareferencia   := CreateCmDbField('DATAREFERENCIA'  ,ftDateTime,False,
                        False,False,True,'');
end;

function TDbAlterorcamento.Insert: Boolean;
begin

   fIdalterorcamento.AsFloat := GetSequence('ALTERORCAMENTO');
   Result := Inherited Insert;

end;

function TDbAlterorcamento.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TdbAlterorcamento.SetVlrsolicitado(const Value: TCmDbField);
Begin

  FVlrsolicitado := Value;
End;

Procedure TdbAlterorcamento.SetPeriodoorigem(const Value: TCmDbField);
Begin

  FPeriodoorigem := Value;
End;

Procedure TdbAlterorcamento.SetPeriododestino(const Value: TCmDbField);
Begin

  FPeriododestino := Value;
End;

Procedure TdbAlterorcamento.SetObsalterorcamen(const Value: TCmDbField);
Begin

  FObsalterorcamen := Value;
End;

Procedure TdbAlterorcamento.SetNumalteracao(const Value: TCmDbField);
Begin

  FNumalteracao := Value;
End;

Procedure TdbAlterorcamento.SetIdplanoorcamen(const Value: TCmDbField);
Begin

  FIdplanoorcamen := Value;
End;

Procedure TdbAlterorcamento.SetIdpessoa(const Value: TCmDbField);
Begin

  FIdpessoa := Value;
End;

Procedure TdbAlterorcamento.SetIdcontaorigem(const Value: TCmDbField);
Begin

  FIdcontaorigem := Value;
End;

Procedure TdbAlterorcamento.SetIdcontadestino(const Value: TCmDbField);
Begin

  FIdcontadestino := Value;
End;

Procedure TdbAlterorcamento.SetIdalterorcamento(const Value: TCmDbField);
Begin

  FIdalterorcamento := Value;
End;

Procedure TdbAlterorcamento.SetFlgtipoalter(const Value: TCmDbField);
Begin

  FFlgtipoalter := Value;
End;

Procedure TdbAlterorcamento.SetExercicioorigem(const Value: TCmDbField);
Begin

  FExercicioorigem := Value;
End;

Procedure TdbAlterorcamento.SetExerciciodestino(const Value: TCmDbField);
Begin

  FExerciciodestino := Value;
End;

Procedure TdbAlterorcamento.SetDatareferencia(const Value: TCmDbField);
Begin

  FDatareferencia := Value;
End;

end.



