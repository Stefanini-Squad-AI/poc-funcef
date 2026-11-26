{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Gonçalves             }
{ Atualizado Em: 31/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbValorescenario;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbValorescenario = class(TCmDbObject)

  private
     FVlrorccenario: TCmDbField;
     FTrguserinclusao: TCmDbField;
     FTrgdtinclusao: TCmDbField;
     FPeriodo: TCmDbField;
     FPercutilrateio: TCmDbField;
     FIdvalorescenario: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdcriterioratorc: TCmDbField;
     FIdcontaorcamen: TCmDbField;
     FIdcenarioorcamen: TCmDbField;
     FExercicio: TCmDbField;

     Procedure SetVlrorccenario(const Value: TCmDbField);
     Procedure SetTrguserinclusao(const Value: TCmDbField);
     Procedure SetTrgdtinclusao(const Value: TCmDbField);
     Procedure SetPeriodo(const Value: TCmDbField);
     Procedure SetPercutilrateio(const Value: TCmDbField);
     Procedure SetIdvalorescenario(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdcriterioratorc(const Value: TCmDbField);
     Procedure SetIdcontaorcamen(const Value: TCmDbField);
     Procedure SetIdcenarioorcamen(const Value: TCmDbField);
     Procedure SetExercicio(const Value: TCmDbField);
  public

     Property Vlrorccenario   : TCmDbField
                               read FVlrorccenario    write SetVlrorccenario;
     Property Trguserinclusao : TCmDbField
                               read FTrguserinclusao  write SetTrguserinclusao;
     Property Trgdtinclusao   : TCmDbField
                               read FTrgdtinclusao    write SetTrgdtinclusao;
     Property Periodo         : TCmDbField
                               read FPeriodo          write SetPeriodo;
     Property Percutilrateio  : TCmDbField
                               read FPercutilrateio   write SetPercutilrateio;
     Property Idvalorescenario: TCmDbField
                               read FIdvalorescenario write SetIdvalorescenario;
     Property Idplanoorcamen  : TCmDbField
                               read FIdplanoorcamen   write SetIdplanoorcamen;
     Property Idpessoa        : TCmDbField
                               read FIdpessoa         write SetIdpessoa;
     Property Idcriterioratorc: TCmDbField
                               read FIdcriterioratorc write SetIdcriterioratorc;
     Property Idcontaorcamen  : TCmDbField
                               read FIdcontaorcamen   write SetIdcontaorcamen;
     Property Idcenarioorcamen: TCmDbField
                               read FIdcenarioorcamen write SetIdcenarioorcamen;
     Property Exercicio       : TCmDbField
                               read FExercicio        write SetExercicio;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbValorescenario }

constructor TDbValorescenario.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'VALORESCENARIO';

  fVlrorccenario    := CreateCmDbField('VLRORCCENARIO'   ,ftfloat   ,False,
                                       False,False,True,'');
  fTrguserinclusao  := CreateCmDbField('TRGUSERINCLUSAO' ,ftString  ,False,
                                       False,False,True,'');
  fTrgdtinclusao    := CreateCmDbField('TRGDTINCLUSAO'   ,ftDateTime,False,
                                       False,False,True,'');
  fPeriodo          := CreateCmDbField('PERIODO'         ,ftfloat   ,False,
                                       False,False,True,'');
  fPercutilrateio   := CreateCmDbField('PERCUTILRATEIO'  ,ftfloat   ,False,
                                       False,False,True,'');
  fIdvalorescenario := CreateCmDbField('IDVALORESCENARIO',ftfloat   ,True ,
                                       True ,False,True,'');
  fIdplanoorcamen   := CreateCmDbField('IDPLANOORCAMEN'  ,ftfloat   ,False,
                                       False,False,True,'');
  fIdpessoa         := CreateCmDbField('IDPESSOA'        ,ftfloat   ,False,
                                       False,False,True,'');
  fIdcriterioratorc := CreateCmDbField('IDCRITERIORATORC',ftfloat   ,False,
                                       False,False,True,'');
  fIdcontaorcamen   := CreateCmDbField('IDCONTAORCAMEN'  ,ftString  ,False,
                                       False,False,True,'');
  fIdcenarioorcamen := CreateCmDbField('IDCENARIOORCAMEN',ftfloat   ,False,
                                       False,False,True,'');
  fExercicio        := CreateCmDbField('EXERCICIO'       ,ftfloat   ,False,
                                       False,False,True,'');
end;

function TDbValorescenario.Insert: Boolean;
begin
   fIdvalorescenario.AsFloat := GetSequence('VALORESCENARIO');
   Result := Inherited Insert;
end;

function TDbValorescenario.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbValorescenario.SetVlrorccenario(const Value: TCmDbField);
begin
  FVlrorccenario := Value;
end;

procedure TDbValorescenario.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbValorescenario.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbValorescenario.SetPeriodo(const Value: TCmDbField);
begin
  FVlrorccenario := Value;
end;

procedure TDbValorescenario.SetPercutilrateio(const Value: TCmDbField);
begin
  FPeriodo := Value;
end;

procedure TDbValorescenario.SetIdvalorescenario(const Value: TCmDbField);
begin
  FIdvalorescenario := Value;
end;

procedure TDbValorescenario.SetIdplanoorcamen(const Value: TCmDbField);
begin
  FIdplanoorcamen := Value;
end;

procedure TDbValorescenario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbValorescenario.SetIdcriterioratorc(const Value: TCmDbField);
begin
  FIdcriterioratorc := Value;
end;

procedure TDbValorescenario.SetIdcontaorcamen(const Value: TCmDbField);
begin
  FIdcontaorcamen := Value;
end;

procedure TDbValorescenario.SetIdcenarioorcamen(const Value: TCmDbField);
begin
  FIdcenarioorcamen := Value;
end;

procedure TDbValorescenario.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;

end.



