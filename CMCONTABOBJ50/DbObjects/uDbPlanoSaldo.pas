{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlanosaldo;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPlanosaldo = class(TCmDbObject)

  private
    FPlscreditohist: TCmDbField;
    FPlscreditocor: TCmDbField;
    FIdplanosaldo: TCmDbField;
    FCodsubconta: TCmDbField;
    FPlaconta: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FPlsorcadodebito: TCmDbField;
    FIdpatro: TCmDbField;
    FIdplanoprev: TCmDbField;
    FPlsdebitogeren1: TCmDbField;
    FPlsdebitogeren2: TCmDbField;
    FPlstipo: TCmDbField;
    FPlano: TCmDbField;
    FPlscreditogeren1: TCmDbField;
    FPlsdebitocorrente: TCmDbField;
    FPlsorcadocredito: TCmDbField;
    FIdpessoa: TCmDbField;
    FPlscreditogeren2: TCmDbField;
    FPlsdebitoger: TCmDbField;
    FPlsdebitohist: TCmDbField;
    FPernumero: TCmDbField;
    FPlsdebitooficial: TCmDbField;
    FIdempresa: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPerexercicio: TCmDbField;
    FPlscreditooficial: TCmDbField;
    FPlscreditoger: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdplanosaldo(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlscreditocor(const Value: TCmDbField);
    procedure SetPlscreditoger(const Value: TCmDbField);
    procedure SetPlscreditogeren1(const Value: TCmDbField);
    procedure SetPlscreditogeren2(const Value: TCmDbField);
    procedure SetPlscreditohist(const Value: TCmDbField);
    procedure SetPlscreditooficial(const Value: TCmDbField);
    procedure SetPlsdebitocorrente(const Value: TCmDbField);
    procedure SetPlsdebitoger(const Value: TCmDbField);
    procedure SetPlsdebitogeren1(const Value: TCmDbField);
    procedure SetPlsdebitogeren2(const Value: TCmDbField);
    procedure SetPlsdebitohist(const Value: TCmDbField);
    procedure SetPlsdebitooficial(const Value: TCmDbField);
    procedure SetPlsorcadocredito(const Value: TCmDbField);
    procedure SetPlsorcadodebito(const Value: TCmDbField);
    procedure SetPlstipo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plstipo: TCmDbField read FPlstipo write SetPlstipo;
     Property Plsorcadodebito: TCmDbField read FPlsorcadodebito write SetPlsorcadodebito;
     Property Plsorcadocredito: TCmDbField read FPlsorcadocredito write SetPlsorcadocredito;
     Property Plsdebitooficial: TCmDbField read FPlsdebitooficial write SetPlsdebitooficial;
     Property Plsdebitohist: TCmDbField read FPlsdebitohist write SetPlsdebitohist;
     Property Plsdebitogeren2: TCmDbField read FPlsdebitogeren2 write SetPlsdebitogeren2;
     Property Plsdebitogeren1: TCmDbField read FPlsdebitogeren1 write SetPlsdebitogeren1;
     Property Plsdebitoger: TCmDbField read FPlsdebitoger write SetPlsdebitoger;
     Property Plsdebitocorrente: TCmDbField read FPlsdebitocorrente write SetPlsdebitocorrente;
     Property Plscreditooficial: TCmDbField read FPlscreditooficial write SetPlscreditooficial;
     Property Plscreditohist: TCmDbField read FPlscreditohist write SetPlscreditohist;
     Property Plscreditogeren2: TCmDbField read FPlscreditogeren2 write SetPlscreditogeren2;
     Property Plscreditogeren1: TCmDbField read FPlscreditogeren1 write SetPlscreditogeren1;
     Property Plscreditoger: TCmDbField read FPlscreditoger write SetPlscreditoger;
     Property Plscreditocor: TCmDbField read FPlscreditocor write SetPlscreditocor;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idplanosaldo: TCmDbField read FIdplanosaldo write SetIdplanosaldo;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanosaldo }

constructor TDbPlanosaldo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOSALDO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlstipo := CreateCmDbField('PLSTIPO',ftString,False,False,False,True,'');
   fPlsorcadodebito := CreateCmDbField('PLSORCADODEBITO',ftfloat,False,False,False,False,'');
   fPlsorcadocredito := CreateCmDbField('PLSORCADOCREDITO',ftfloat,False,False,False,False,'');
   fPlsdebitooficial := CreateCmDbField('PLSDEBITOOFICIAL',ftfloat,False,False,False,False,'');
   fPlsdebitohist := CreateCmDbField('PLSDEBITOHIST',ftfloat,False,False,False,False,'');
   fPlsdebitogeren2 := CreateCmDbField('PLSDEBITOGEREN2',ftfloat,False,False,False,False,'');
   fPlsdebitogeren1 := CreateCmDbField('PLSDEBITOGEREN1',ftfloat,False,False,False,False,'');
   fPlsdebitoger := CreateCmDbField('PLSDEBITOGER',ftfloat,False,False,False,False,'');
   fPlsdebitocorrente := CreateCmDbField('PLSDEBITOCORRENTE',ftfloat,False,False,False,False,'');
   fPlscreditooficial := CreateCmDbField('PLSCREDITOOFICIAL',ftfloat,False,False,False,False,'');
   fPlscreditohist := CreateCmDbField('PLSCREDITOHIST',ftfloat,False,False,False,False,'');
   fPlscreditogeren2 := CreateCmDbField('PLSCREDITOGEREN2',ftfloat,False,False,False,False,'');
   fPlscreditogeren1 := CreateCmDbField('PLSCREDITOGEREN1',ftfloat,False,False,False,False,'');
   fPlscreditoger := CreateCmDbField('PLSCREDITOGER',ftfloat,False,False,False,False,'');
   fPlscreditocor := CreateCmDbField('PLSCREDITOCOR',ftfloat,False,False,False,False,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,True,'');
   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdplanosaldo := CreateCmDbField('IDPLANOSALDO',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat, True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDbPlanosaldo.Insert: Boolean;
begin

   fIdplanosaldo.AsFloat := GetSequence('PLANOSALDO');
   Result := Inherited Insert;

end;

function TDbPlanosaldo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPlanosaldo.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbPlanosaldo.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbPlanosaldo.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbPlanosaldo.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbPlanosaldo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanosaldo.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPlanosaldo.SetIdplanosaldo(const Value: TCmDbField);
begin
  FIdplanosaldo := Value;
end;

procedure TDbPlanosaldo.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbPlanosaldo.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbPlanosaldo.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbPlanosaldo.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbPlanosaldo.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPlanosaldo.SetPlscreditocor(const Value: TCmDbField);
begin
  FPlscreditocor := Value;
end;

procedure TDbPlanosaldo.SetPlscreditoger(const Value: TCmDbField);
begin
  FPlscreditoger := Value;
end;

procedure TDbPlanosaldo.SetPlscreditogeren1(const Value: TCmDbField);
begin
  FPlscreditogeren1 := Value;
end;

procedure TDbPlanosaldo.SetPlscreditogeren2(const Value: TCmDbField);
begin
  FPlscreditogeren2 := Value;
end;

procedure TDbPlanosaldo.SetPlscreditohist(const Value: TCmDbField);
begin
  FPlscreditohist := Value;
end;

procedure TDbPlanosaldo.SetPlscreditooficial(const Value: TCmDbField);
begin
  FPlscreditooficial := Value;
end;

procedure TDbPlanosaldo.SetPlsdebitocorrente(const Value: TCmDbField);
begin
  FPlsdebitocorrente := Value;
end;

procedure TDbPlanosaldo.SetPlsdebitoger(const Value: TCmDbField);
begin
  FPlsdebitoger := Value;
end;

procedure TDbPlanosaldo.SetPlsdebitogeren1(const Value: TCmDbField);
begin
  FPlsdebitogeren1 := Value;
end;

procedure TDbPlanosaldo.SetPlsdebitogeren2(const Value: TCmDbField);
begin
  FPlsdebitogeren2 := Value;
end;

procedure TDbPlanosaldo.SetPlsdebitohist(const Value: TCmDbField);
begin
  FPlsdebitohist := Value;
end;

procedure TDbPlanosaldo.SetPlsdebitooficial(const Value: TCmDbField);
begin
  FPlsdebitooficial := Value;
end;

procedure TDbPlanosaldo.SetPlsorcadocredito(const Value: TCmDbField);
begin
  FPlsorcadocredito := Value;
end;

procedure TDbPlanosaldo.SetPlsorcadodebito(const Value: TCmDbField);
begin
  FPlsorcadodebito := Value;
end;

procedure TDbPlanosaldo.SetPlstipo(const Value: TCmDbField);
begin
  FPlstipo := Value;
end;

procedure TDbPlanosaldo.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



