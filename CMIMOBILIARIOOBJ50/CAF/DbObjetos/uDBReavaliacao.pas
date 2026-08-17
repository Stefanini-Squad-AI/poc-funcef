{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavaliacao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBReavaliacao = class(TCmDbObject)

  private
    FTaxadep: TCmDbField;
    FIdbem: TCmDbField;
    FFlgultreaval: TCmDbField;
    FValipc90: TCmDbField;
    FDepger: TCmDbField;
    FDatareavaliacao: TCmDbField;
    FCmbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FDepgerb: TCmDbField;
    FValfis: TCmDbField;
    FDeplanc: TCmDbField;
    FValorg: TCmDbField;
    FDataultdep: TCmDbField;
    FIdmovimentacao: TCmDbField;
    FIdreavaliacao: TCmDbField;
    FFlgdeprec: TCmDbField;
    FValgerb: TCmDbField;
    FDepfis: TCmDbField;
    FDepipc90: TCmDbField;
    FCmdep: TCmDbField;
    FValger: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDatareavaliacao(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetDepfis(const Value: TCmDbField);
    procedure SetDepger(const Value: TCmDbField);
    procedure SetDepgerb(const Value: TCmDbField);
    procedure SetDepipc90(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetFlgdeprec(const Value: TCmDbField);
    procedure SetFlgultreaval(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdreavaliacao(const Value: TCmDbField);
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
     Property Idreavaliacao: TCmDbField read FIdreavaliacao write SetIdreavaliacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Flgultreaval: TCmDbField read FFlgultreaval write SetFlgultreaval;
     Property Flgdeprec: TCmDbField read FFlgdeprec write SetFlgdeprec;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Depipc90: TCmDbField read FDepipc90 write SetDepipc90;
     Property Depgerb: TCmDbField read FDepgerb write SetDepgerb;
     Property Depger: TCmDbField read FDepger write SetDepger;
     Property Depfis: TCmDbField read FDepfis write SetDepfis;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Datareavaliacao: TCmDbField read FDatareavaliacao write SetDatareavaliacao;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBReavaliacao }

constructor TDBReavaliacao.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'REAVALIACAO';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fValipc90 := CreateCmDbField('VALIPC90',ftfloat,False,False,False,False,'');
   fValgerb := CreateCmDbField('VALGERB',ftfloat,False,False,False,False,'');
   fValger := CreateCmDbField('VALGER',ftfloat,False,False,False,False,'');
   fValfis := CreateCmDbField('VALFIS',ftfloat,False,False,False,False,'');
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,True,False,False,False,'');
   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,False,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,False,False,True,'');
   fFlgultreaval := CreateCmDbField('FLGULTREAVAL',ftfloat,False,False,False,False,'');
   fFlgdeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fDepipc90 := CreateCmDbField('DEPIPC90',ftfloat,False,False,False,False,'');
   fDepgerb := CreateCmDbField('DEPGERB',ftfloat,False,False,False,False,'');
   fDepger := CreateCmDbField('DEPGER',ftfloat,False,False,False,False,'');
   fDepfis := CreateCmDbField('DEPFIS',ftfloat,False,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDatareavaliacao := CreateCmDbField('DATAREAVALIACAO',ftDateTime,True,False,False,True,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBReavaliacao.Insert: Boolean;
begin
   fIdreavaliacao.AsFloat := GetSequence('REAVALIACAO');
   Result := Inherited Insert;
end;

function TDBReavaliacao.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBReavaliacao.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBReavaliacao.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBReavaliacao.SetDatareavaliacao(const Value: TCmDbField);
begin
  FDatareavaliacao := Value;
end;

procedure TDBReavaliacao.SetDataultdep(const Value: TCmDbField);
begin
  FDataultdep := Value;
end;

procedure TDBReavaliacao.SetDepfis(const Value: TCmDbField);
begin
  FDepfis := Value;
end;

procedure TDBReavaliacao.SetDepger(const Value: TCmDbField);
begin
  FDepger := Value;
end;

procedure TDBReavaliacao.SetDepgerb(const Value: TCmDbField);
begin
  FDepgerb := Value;
end;

procedure TDBReavaliacao.SetDepipc90(const Value: TCmDbField);
begin
  FDepipc90 := Value;
end;

procedure TDBReavaliacao.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBReavaliacao.SetFlgdeprec(const Value: TCmDbField);
begin
  FFlgdeprec := Value;
end;

procedure TDBReavaliacao.SetFlgultreaval(const Value: TCmDbField);
begin
  FFlgultreaval := Value;
end;

procedure TDBReavaliacao.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBReavaliacao.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBReavaliacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBReavaliacao.SetIdreavaliacao(const Value: TCmDbField);
begin
  FIdreavaliacao := Value;
end;

procedure TDBReavaliacao.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

procedure TDBReavaliacao.SetValfis(const Value: TCmDbField);
begin
  FValfis := Value;
end;

procedure TDBReavaliacao.SetValger(const Value: TCmDbField);
begin
  FValger := Value;
end;

procedure TDBReavaliacao.SetValgerb(const Value: TCmDbField);
begin
  FValgerb := Value;
end;

procedure TDBReavaliacao.SetValipc90(const Value: TCmDbField);
begin
  FValipc90 := Value;
end;

procedure TDBReavaliacao.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



