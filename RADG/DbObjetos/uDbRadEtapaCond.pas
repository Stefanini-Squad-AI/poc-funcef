{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbRadEtapaCond;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadEtapaCond = class(TCmDbObject)

  private
    FIdradetapacond: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdradetapa: TCmDbField;
    FCodtipdoc: TCmDbField;
    FVlrinicial: TCmDbField;
    FNumetapadest: TCmDbField;
    FUnidnegoc: TCmDbField;
    FVlrfinal: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FCodgrupoprod: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodgrupoprod(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetIdradetapa(const Value: TCmDbField);
    procedure SetIdradetapacond(const Value: TCmDbField);
    procedure SetNumetapadest(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrfinal(const Value: TCmDbField);
    procedure SetVlrinicial(const Value: TCmDbField);

  public

     Property Vlrinicial: TCmDbField read FVlrinicial write SetVlrinicial;
     Property Vlrfinal: TCmDbField read FVlrfinal write SetVlrfinal;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Numetapadest: TCmDbField read FNumetapadest write SetNumetapadest;
     Property Idradetapacond: TCmDbField read FIdradetapacond write SetIdradetapacond;
     Property Idradetapa: TCmDbField read FIdradetapa write SetIdradetapa;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codgrupoprod: TCmDbField read FCodgrupoprod write SetCodgrupoprod;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadEtapaCond }

constructor TDbRadEtapaCond.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADETAPACOND';

   fVlrinicial := CreateCmDbField('VLRINICIAL',ftfloat,False,False,False,True,'Valor Inicial');
   fVlrfinal := CreateCmDbField('VLRFINAL',ftfloat,False,False,False,True,'Valor Final');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'Atividade x Projeto');
   fNumetapadest := CreateCmDbField('NUMETAPADEST',ftfloat,True,False,False,False,'Número da Etapa de Destino');
   fIdradetapacond := CreateCmDbField('IDRADETAPACOND',ftfloat,True,True,False,True,'Id. Condição');
   fIdradetapa := CreateCmDbField('IDRADETAPA',ftfloat,True,False,False,True,'Id. Etapa');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'Cod. Tipo de Documento');
   fCodgrupoprod := CreateCmDbField('CODGRUPOPROD',ftString,False,False,False,True,'Cod. Grupo de Produtos');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'Cod. Centro de Responsabilidade');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'Cod. Centro de Custo');
end;

function TDbRadEtapaCond.Insert: Boolean;
begin

   fIdradetapacond.AsFloat := GetSequence('RADETAPACOND');
   Result := Inherited Insert;

end;


procedure TDbRadEtapaCond.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRadEtapaCond.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbRadEtapaCond.SetCodgrupoprod(const Value: TCmDbField);
begin
  FCodgrupoprod := Value;
end;

procedure TDbRadEtapaCond.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbRadEtapaCond.SetIdradetapa(const Value: TCmDbField);
begin
  FIdradetapa := Value;
end;

procedure TDbRadEtapaCond.SetIdradetapacond(const Value: TCmDbField);
begin
  FIdradetapacond := Value;
end;

procedure TDbRadEtapaCond.SetNumetapadest(const Value: TCmDbField);
begin
  FNumetapadest := Value;
end;

procedure TDbRadEtapaCond.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbRadEtapaCond.SetVlrfinal(const Value: TCmDbField);
begin
  FVlrfinal := Value;
end;

procedure TDbRadEtapaCond.SetVlrinicial(const Value: TCmDbField);
begin
  FVlrinicial := Value;
end;

end.



