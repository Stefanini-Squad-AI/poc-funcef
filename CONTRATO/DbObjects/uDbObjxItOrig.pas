{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/06/2003                             }
{                                                       }
{*******************************************************}

unit uDbObjxItOrig;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbObjxItOrig = class(TCmDbObject)

  private
    FToleranciamaisobjeto: TCmDbField;
    FIdcontrato: TCmDbField;
    FDataultgeracao: TCmDbField;
    FObservacao: TCmDbField;
    FCodmedida: TCmDbField;
    FIdpessoa: TCmDbField;
    FDataultvenc: TCmDbField;
    FMoecodigo: TCmDbField;
    FValortotalobjeto: TCmDbField;
    FDatabaseitem: TCmDbField;
    FIdobjeto: TCmDbField;
    FIdpatro: TCmDbField;
    FQtdeitem: TCmDbField;
    FFrequencia: TCmDbField;
    FValorunitarioobjeto: TCmDbField;
    FNumparcelas: TCmDbField;
    FToleranciamenosobjeto: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdprograma: TCmDbField;
    FNummedicoes: TCmDbField;
    FDatainiciocobr: TCmDbField;
    FTipotoleranciaobjeto: TCmDbField;
    FIntervalo: TCmDbField;
    FIditem: TCmDbField;
    FIdResponsavel: TCmDbField;
    procedure SetCodmedida(const Value: TCmDbField);
    procedure SetDatabaseitem(const Value: TCmDbField);
    procedure SetDatainiciocobr(const Value: TCmDbField);
    procedure SetDataultgeracao(const Value: TCmDbField);
    procedure SetDataultvenc(const Value: TCmDbField);
    procedure SetFrequencia(const Value: TCmDbField);
    procedure SetIdcontrato(const Value: TCmDbField);
    procedure SetIditem(const Value: TCmDbField);
    procedure SetIdobjeto(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIntervalo(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNummedicoes(const Value: TCmDbField);
    procedure SetNumparcelas(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetQtdeitem(const Value: TCmDbField);
    procedure SetTipotoleranciaobjeto(const Value: TCmDbField);
    procedure SetToleranciamaisobjeto(const Value: TCmDbField);
    procedure SetToleranciamenosobjeto(const Value: TCmDbField);
    procedure SetValortotalobjeto(const Value: TCmDbField);
    procedure SetValorunitarioobjeto(const Value: TCmDbField);

  public

     Property Valorunitarioobjeto: TCmDbField read FValorunitarioobjeto write SetValorunitarioobjeto;
     Property Valortotalobjeto: TCmDbField read FValortotalobjeto write SetValortotalobjeto;
     Property Toleranciamenosobjeto: TCmDbField read FToleranciamenosobjeto write SetToleranciamenosobjeto;
     Property Toleranciamaisobjeto: TCmDbField read FToleranciamaisobjeto write SetToleranciamaisobjeto;
     Property Tipotoleranciaobjeto: TCmDbField read FTipotoleranciaobjeto write SetTipotoleranciaobjeto;
     Property Qtdeitem: TCmDbField read FQtdeitem write SetQtdeitem;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Numparcelas: TCmDbField read FNumparcelas write SetNumparcelas;
     Property Nummedicoes: TCmDbField read FNummedicoes write SetNummedicoes;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Intervalo: TCmDbField read FIntervalo write SetIntervalo;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idobjeto: TCmDbField read FIdobjeto write SetIdobjeto;
     Property Iditem: TCmDbField read FIditem write SetIditem;
     Property Idcontrato: TCmDbField read FIdcontrato write SetIdcontrato;
     Property Frequencia: TCmDbField read FFrequencia write SetFrequencia;
     Property Dataultvenc: TCmDbField read FDataultvenc write SetDataultvenc;
     Property Dataultgeracao: TCmDbField read FDataultgeracao write SetDataultgeracao;
     Property Datainiciocobr: TCmDbField read FDatainiciocobr write SetDatainiciocobr;
     Property Databaseitem: TCmDbField read FDatabaseitem write SetDatabaseitem;
     Property Codmedida: TCmDbField read FCodmedida write SetCodmedida;
     Property IdResponsavel : TCmDbField read FIdResponsavel write FIdResponsavel;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbObjxItOrig }

constructor TDbObjxItOrig.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OBJXITORIG';

   fValorunitarioobjeto := CreateCmDbField('VALORUNITARIOOBJETO',ftfloat,False,False,False,True,'');
   fValortotalobjeto := CreateCmDbField('VALORTOTALOBJETO',ftfloat,False,False,False,True,'');
   fToleranciamenosobjeto := CreateCmDbField('TOLERANCIAMENOSOBJETO',ftfloat,False,False,False,True,'');
   fToleranciamaisobjeto := CreateCmDbField('TOLERANCIAMAISOBJETO',ftfloat,False,False,False,True,'');
   fTipotoleranciaobjeto := CreateCmDbField('TIPOTOLERANCIAOBJETO',ftString,False,False,False,True,'');
   fQtdeitem := CreateCmDbField('QTDEITEM',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNumparcelas := CreateCmDbField('NUMPARCELAS',ftfloat,False,False,False,True,'');
   fNummedicoes := CreateCmDbField('NUMMEDICOES',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIntervalo := CreateCmDbField('INTERVALO',ftfloat,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,True,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,True,True,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'');
   fFrequencia := CreateCmDbField('FREQUENCIA',ftString,False,False,False,True,'');
   fDataultvenc := CreateCmDbField('DATAULTVENC',ftDateTime,False,False,False,True,'');
   fDataultgeracao := CreateCmDbField('DATAULTGERACAO',ftDateTime,False,False,False,True,'');
   fDatainiciocobr := CreateCmDbField('DATAINICIOCOBR',ftDateTime,False,False,False,True,'');
   fDatabaseitem := CreateCmDbField('DATABASEITEM',ftDateTime,False,False,False,True,'');
   fCodmedida := CreateCmDbField('CODMEDIDA',ftString,False,False,False,True,'');
   fIdResponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
end;

function TDbObjxItOrig.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbObjxItOrig.SetCodmedida(const Value: TCmDbField);
begin
  FCodmedida := Value;
end;

procedure TDbObjxItOrig.SetDatabaseitem(const Value: TCmDbField);
begin
  FDatabaseitem := Value;
end;

procedure TDbObjxItOrig.SetDatainiciocobr(const Value: TCmDbField);
begin
  FDatainiciocobr := Value;
end;

procedure TDbObjxItOrig.SetDataultgeracao(const Value: TCmDbField);
begin
  FDataultgeracao := Value;
end;

procedure TDbObjxItOrig.SetDataultvenc(const Value: TCmDbField);
begin
  FDataultvenc := Value;
end;

procedure TDbObjxItOrig.SetFrequencia(const Value: TCmDbField);
begin
  FFrequencia := Value;
end;

procedure TDbObjxItOrig.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbObjxItOrig.SetIditem(const Value: TCmDbField);
begin
  FIditem := Value;
end;

procedure TDbObjxItOrig.SetIdobjeto(const Value: TCmDbField);
begin
  FIdobjeto := Value;
end;

procedure TDbObjxItOrig.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbObjxItOrig.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbObjxItOrig.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbObjxItOrig.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbObjxItOrig.SetIntervalo(const Value: TCmDbField);
begin
  FIntervalo := Value;
end;

procedure TDbObjxItOrig.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbObjxItOrig.SetNummedicoes(const Value: TCmDbField);
begin
  FNummedicoes := Value;
end;

procedure TDbObjxItOrig.SetNumparcelas(const Value: TCmDbField);
begin
  FNumparcelas := Value;
end;

procedure TDbObjxItOrig.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbObjxItOrig.SetQtdeitem(const Value: TCmDbField);
begin
  FQtdeitem := Value;
end;

procedure TDbObjxItOrig.SetTipotoleranciaobjeto(const Value: TCmDbField);
begin
  FTipotoleranciaobjeto := Value;
end;

procedure TDbObjxItOrig.SetToleranciamaisobjeto(const Value: TCmDbField);
begin
  FToleranciamaisobjeto := Value;
end;

procedure TDbObjxItOrig.SetToleranciamenosobjeto(const Value: TCmDbField);
begin
  FToleranciamenosobjeto := Value;
end;

procedure TDbObjxItOrig.SetValortotalobjeto(const Value: TCmDbField);
begin
  FValortotalobjeto := Value;
end;

procedure TDbObjxItOrig.SetValorunitarioobjeto(const Value: TCmDbField);
begin
  FValorunitarioobjeto := Value;
end;

end.



