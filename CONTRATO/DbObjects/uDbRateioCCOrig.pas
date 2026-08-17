{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbRateioCCOrig;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRateioCCOrig = class(TCmDbObject)

  private
    FCodcentrocusto: TCmDbField;
    FIdcontrato: TCmDbField;
    FIdrateioccusto: TCmDbField;
    FIdempresa: TCmDbField;
    FIdobjeto: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPercrateiocontr: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdpatro: TCmDbField;
    FIdpessoa: TCmDbField;
    FIditem: TCmDbField;
    FIdprograma: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdcontrato(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIditem(const Value: TCmDbField);
    procedure SetIdobjeto(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdrateioccusto(const Value: TCmDbField);
    procedure SetPercrateiocontr(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Percrateiocontr: TCmDbField read FPercrateiocontr write SetPercrateiocontr;
     Property Idrateioccusto: TCmDbField read FIdrateioccusto write SetIdrateioccusto;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idobjeto: TCmDbField read FIdobjeto write SetIdobjeto;
     Property Iditem: TCmDbField read FIditem write SetIditem;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcontrato: TCmDbField read FIdcontrato write SetIdcontrato;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRateioCCOrig }

constructor TDbRateioCCOrig.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RATEIOCCORIG';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPercrateiocontr := CreateCmDbField('PERCRATEIOCONTR',ftfloat,True,False,False,True,'');
   fIdrateioccusto := CreateCmDbField('IDRATEIOCCUSTO',ftfloat,True,True,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,False,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,True,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,False,False,True,'');
end;

function TDbRateioCCOrig.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbRateioCCOrig.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRateioCCOrig.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbRateioCCOrig.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRateioCCOrig.SetIditem(const Value: TCmDbField);
begin
  FIditem := Value;
end;

procedure TDbRateioCCOrig.SetIdobjeto(const Value: TCmDbField);
begin
  FIdobjeto := Value;
end;

procedure TDbRateioCCOrig.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRateioCCOrig.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRateioCCOrig.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRateioCCOrig.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbRateioCCOrig.SetIdrateioccusto(const Value: TCmDbField);
begin
  FIdrateioccusto := Value;
end;

procedure TDbRateioCCOrig.SetPercrateiocontr(const Value: TCmDbField);
begin
  FPercrateiocontr := Value;
end;

procedure TDbRateioCCOrig.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



