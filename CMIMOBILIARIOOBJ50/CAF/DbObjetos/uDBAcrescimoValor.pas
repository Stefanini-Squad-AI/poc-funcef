{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBAcrescimoValor;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBAcrescimoValor = class(TCmDbObject)

  private
    FDepgerb: TCmDbField;
    FIdmovimentacao: TCmDbField;
    FValfis: TCmDbField;
    FDeplanc: TCmDbField;
    FDepger: TCmDbField;
    FValgerb: TCmDbField;
    FIdbem: TCmDbField;
    FCmbem: TCmDbField;
    FValorg: TCmDbField;
    FValipc90: TCmDbField;
    FTaxadep: TCmDbField;
    FValger: TCmDbField;
    FDepfis: TCmDbField;
    FDataultdep: TCmDbField;
    FFlgdeprec: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdacrescimo: TCmDbField;
    FDepipc90: TCmDbField;
    FCmdep: TCmDbField;
    FDataacrescimo: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDataacrescimo(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetDepfis(const Value: TCmDbField);
    procedure SetDepger(const Value: TCmDbField);
    procedure SetDepgerb(const Value: TCmDbField);
    procedure SetDepipc90(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetFlgdeprec(const Value: TCmDbField);
    procedure SetIdacrescimo(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetValfis(const Value: TCmDbField);
    procedure SetValger(const Value: TCmDbField);
    procedure SetValgerb(const Value: TCmDbField);
    procedure SetValipc90(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Valipc90: TCmDbField read FValipc90 write SetValipc90;
     Property Valgerb: TCmDbField read FValgerb write SetValgerb;
     Property Valger: TCmDbField read FValger write SetValger;
     Property Valfis: TCmDbField read FValfis write SetValfis;
     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Idacrescimo: TCmDbField read FIdacrescimo write SetIdacrescimo;
     Property Flgdeprec: TCmDbField read FFlgdeprec write SetFlgdeprec;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Depipc90: TCmDbField read FDepipc90 write SetDepipc90;
     Property Depgerb: TCmDbField read FDepgerb write SetDepgerb;
     Property Depger: TCmDbField read FDepger write SetDepger;
     Property Depfis: TCmDbField read FDepfis write SetDepfis;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Dataacrescimo: TCmDbField read FDataacrescimo write SetDataacrescimo;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBAcrescimoValor }

constructor TDBAcrescimoValor.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ACRESCIMOVALOR';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fValipc90 := CreateCmDbField('VALIPC90',ftfloat,False,False,False,False,'');
   fValgerb := CreateCmDbField('VALGERB',ftfloat,False,False,False,False,'');
   fValger := CreateCmDbField('VALGER',ftfloat,False,False,False,False,'');
   fValfis := CreateCmDbField('VALFIS',ftfloat,False,False,False,False,'');
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,True,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,False,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,False,False,True,'');
   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,True,'');
   fFlgdeprec := CreateCmDbField('FLGDEPREC',ftfloat,True,False,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fDepipc90 := CreateCmDbField('DEPIPC90',ftfloat,False,False,False,False,'');
   fDepgerb := CreateCmDbField('DEPGERB',ftfloat,False,False,False,False,'');
   fDepger := CreateCmDbField('DEPGER',ftfloat,False,False,False,False,'');
   fDepfis := CreateCmDbField('DEPFIS',ftfloat,False,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataacrescimo := CreateCmDbField('DATAACRESCIMO',ftDateTime,True,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBAcrescimoValor.Insert: Boolean;
begin
   fIdacrescimo.AsFloat := GetSequence('ACRESCIMOVALOR');
   Result := Inherited Insert;
end;

function TDBAcrescimoValor.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBAcrescimoValor.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBAcrescimoValor.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBAcrescimoValor.SetDataacrescimo(const Value: TCmDbField);
begin
  FDataacrescimo := Value;
end;

procedure TDBAcrescimoValor.SetDataultdep(const Value: TCmDbField);
begin
  FDataultdep := Value;
end;

procedure TDBAcrescimoValor.SetDepfis(const Value: TCmDbField);
begin
  FDepfis := Value;
end;

procedure TDBAcrescimoValor.SetDepger(const Value: TCmDbField);
begin
  FDepger := Value;
end;

procedure TDBAcrescimoValor.SetDepgerb(const Value: TCmDbField);
begin
  FDepgerb := Value;
end;

procedure TDBAcrescimoValor.SetDepipc90(const Value: TCmDbField);
begin
  FDepipc90 := Value;
end;

procedure TDBAcrescimoValor.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBAcrescimoValor.SetFlgdeprec(const Value: TCmDbField);
begin
  FFlgdeprec := Value;
end;

procedure TDBAcrescimoValor.SetIdacrescimo(const Value: TCmDbField);
begin
  FIdacrescimo := Value;
end;

procedure TDBAcrescimoValor.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBAcrescimoValor.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBAcrescimoValor.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBAcrescimoValor.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

procedure TDBAcrescimoValor.SetValfis(const Value: TCmDbField);
begin
  FValfis := Value;
end;

procedure TDBAcrescimoValor.SetValger(const Value: TCmDbField);
begin
  FValger := Value;
end;

procedure TDBAcrescimoValor.SetValgerb(const Value: TCmDbField);
begin
  FValgerb := Value;
end;

procedure TDBAcrescimoValor.SetValipc90(const Value: TCmDbField);
begin
  FValipc90 := Value;
end;

procedure TDBAcrescimoValor.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



