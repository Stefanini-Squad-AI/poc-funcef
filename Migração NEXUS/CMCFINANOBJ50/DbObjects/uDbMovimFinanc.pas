{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 04/02/2002                             }
{                                                       }
{*******************************************************}

{========================================================================================
 Data      : 30/11/2006
 Autor     : Rodolpho da Silva
 Pendência : 23874
 Descrição : Implementar no objeto de persistência a referência do campo FLGESTORNADO
========================================================================================}


unit uDbMovimFinanc;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbMovimFinanc = class(TCmDbObject)

  private
    FCodlanctransf: TCmDbField;
    FIdmodulo: TCmDbField;
    FDatalancfinan: TCmDbField;
    FDatadispfinanc: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FEntradasaida: TCmDbField;
    FValoroutramoeda: TCmDbField;
    FLotetransmissao: TCmDbField;
    FIdpessoa: TCmDbField;
    FNumchqbordero: TCmDbField;
    FHistorico: TCmDbField;
    FStatusconcilia: TCmDbField;
    FHistpadfinan: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FDataconciliacao: TCmDbField;
    FValorlancfinan: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdnflivro: TCmDbField;
    FPlncodigo: TCmDbField;
    FCodportador: TCmDbField;
    FFlgEstornado: TCmDbField;
    
  public

     Property Valoroutramoeda: TCmDbField read FValoroutramoeda write FValoroutramoeda;
     Property Valorlancfinan: TCmDbField read FValorlancfinan write FValorlancfinan;
     Property Statusconcilia: TCmDbField read FStatusconcilia write FStatusconcilia;
     Property Plncodigo: TCmDbField read FPlncodigo write FPlncodigo;
     Property Numchqbordero: TCmDbField read FNumchqbordero write FNumchqbordero;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write FLotetransmissao;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write FIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idnflivro: TCmDbField read FIdnflivro write FIdnflivro;
     Property Idmodulo: TCmDbField read FIdmodulo write FIdmodulo;
     Property Histpadfinan: TCmDbField read FHistpadfinan write FHistpadfinan;
     Property Historico: TCmDbField read FHistorico write FHistorico;
     Property Entradasaida: TCmDbField read FEntradasaida write FEntradasaida;
     Property Datalancfinan: TCmDbField read FDatalancfinan write FDatalancfinan;
     Property Datadispfinanc: TCmDbField read FDatadispfinanc write FDatadispfinanc;
     Property Dataconciliacao: TCmDbField read FDataconciliacao write FDataconciliacao;
     Property Codportador: TCmDbField read FCodportador write FCodportador;
     Property Codlanctransf: TCmDbField read FCodlanctransf write FCodlanctransf;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write FCodlancfinanc;
     Property FlgEstornado: TCmDbField read FFlgEstornado write FFlgEstornado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;


  End;




implementation
{ TDbMovimFinanc }




constructor TDbMovimFinanc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MOVIMFINANC';

   fValoroutramoeda := CreateCmDbField('VALOROUTRAMOEDA',ftfloat,False,False,False,False,'');
   fValorlancfinan := CreateCmDbField('VALORLANCFINAN',ftfloat,False,False,False,False,'');
   fStatusconcilia := CreateCmDbField('STATUSCONCILIA',ftString,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fNumchqbordero := CreateCmDbField('NUMCHQBORDERO',ftString,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdnflivro := CreateCmDbField('IDNFLIVRO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fHistpadfinan := CreateCmDbField('HISTPADFINAN',ftfloat,False,False,False,True,'');
   fHistorico := CreateCmDbField('HISTORICO',ftString,False,False,False,True,'');
   fEntradasaida := CreateCmDbField('ENTRADASAIDA',ftString,False,False,False,True,'');
   fDatalancfinan := CreateCmDbField('DATALANCFINAN',ftDateTime,False,False,False,True,'');
   fDatadispfinanc := CreateCmDbField('DATADISPFINANC',ftDateTime,False,False,False,True,'');
   fDataconciliacao := CreateCmDbField('DATACONCILIACAO',ftDateTime,False,False,False,True,'');
   fCodportador := CreateCmDbField('CODPORTADOR',ftfloat,False,False,False,True,'');
   fCodlanctransf := CreateCmDbField('CODLANCTRANSF',ftfloat,False,False,False,True,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,True,True,False,True,'');

   FFlgEstornado := CreateCmDbField('FLGESTORNADO',ftString,False,False,False,True,'');
end;



function TDbMovimFinanc.Insert: Boolean;
begin
   fCodlancfinanc.AsFloat := GetSequence('MOVIMFINANC');
   Result := Inherited Insert;
end;



function TDbMovimFinanc.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;



end.
