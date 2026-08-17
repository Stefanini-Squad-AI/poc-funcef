{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 15/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbAplicacoes;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAplicacoes = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FCodlancaplic: TCmDbField;
    FPercustorend: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FMoedacota: TCmDbField;
    FDataprevresgate: TCmDbField;
    FNumcotas: TCmDbField;
    FTipoaplicacao: TCmDbField;
    FPrazoresgate: TCmDbField;
    FPlncodigo: TCmDbField;
    FValor: TCmDbField;
    FContaaplicacao: TCmDbField;
    FDatalancamento: TCmDbField;
    FCodportador: TCmDbField;
    FPercusto: TCmDbField;
    FAplicresgatejuros: TCmDbField;
    FJurosprevistos: TCmDbField;
  public

     Property Valor: TCmDbField read FValor write FValor;
     Property Tipoaplicacao: TCmDbField read FTipoaplicacao write FTipoaplicacao;
     Property Prazoresgate: TCmDbField read FPrazoresgate write FPrazoresgate;
     Property Plncodigo: TCmDbField read FPlncodigo write FPlncodigo;
     Property Percustorend: TCmDbField read FPercustorend write FPercustorend;
     Property Percusto: TCmDbField read FPercusto write FPercusto;
     Property Numcotas: TCmDbField read FNumcotas write FNumcotas;
     Property Moedacota: TCmDbField read FMoedacota write FMoedacota;
     Property Jurosprevistos: TCmDbField read FJurosprevistos write FJurosprevistos;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Dataprevresgate: TCmDbField read FDataprevresgate write FDataprevresgate;
     Property Datalancamento: TCmDbField read FDatalancamento write FDatalancamento;
     Property Contaaplicacao: TCmDbField read FContaaplicacao write FContaaplicacao;
     Property Codportador: TCmDbField read FCodportador write FCodportador;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write FCodlancfinanc;
     Property Codlancaplic: TCmDbField read FCodlancaplic write FCodlancaplic;
     Property Aplicresgatejuros: TCmDbField read FAplicresgatejuros write FAplicresgatejuros;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAplicacoes }

constructor TDbAplicacoes.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'APLICACOES';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fTipoaplicacao := CreateCmDbField('TIPOAPLICACAO',ftfloat,False,False,False,True,'');
   fPrazoresgate := CreateCmDbField('PRAZORESGATE',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPercustorend := CreateCmDbField('PERCUSTOREND',ftfloat,False,False,False,True,'');
   fPercusto := CreateCmDbField('PERCUSTO',ftfloat,False,False,False,True,'');
   fNumcotas := CreateCmDbField('NUMCOTAS',ftfloat,False,False,False,True,'');
   fMoedacota := CreateCmDbField('MOEDACOTA',ftfloat,False,False,False,True,'');
   fJurosprevistos := CreateCmDbField('JUROSPREVISTOS',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fDataprevresgate := CreateCmDbField('DATAPREVRESGATE',ftDateTime,False,False,False,True,'');
   fDatalancamento := CreateCmDbField('DATALANCAMENTO',ftDateTime,False,False,False,True,'');
   fContaaplicacao := CreateCmDbField('CONTAAPLICACAO',ftfloat,False,False,False,True,'');
   fCodportador := CreateCmDbField('CODPORTADOR',ftfloat,False,False,False,True,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,False,False,False,True,'');
   fCodlancaplic := CreateCmDbField('CODLANCAPLIC',ftfloat,True,True,False,True,'');
   fAplicresgatejuros := CreateCmDbField('APLICRESGATEJUROS',ftString,False,False,False,True,'');
end;

function TDbAplicacoes.Insert: Boolean;
begin
   fCodlancaplic.AsFloat := GetSequence('APLICACOES');
   Result:=Inherited Insert;
end;

function TDbAplicacoes.LoadFromDB: Boolean;
begin
   Result:=Inherited LoadFromDB;
end;

end.



