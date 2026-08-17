{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 03/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbParcelaRealContr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParcelaRealContr = class(TCmDbObject)

  private
    FDataemissnf: TCmDbField;
    FQtdeparcela: TCmDbField;
    FIdparcelamedicao: TCmDbField;
    FValorobjparcela: TCmDbField;
    FIdpessoa: TCmDbField;
    FDatavencparcela: TCmDbField;
    FDatarealparcela: TCmDbField;
    FNumnotafiscal: TCmDbField;
    FIdmedicao: TCmDbField;
    FCoddocumento: TCmDbField;
    FVlrmoedacorrente: TCmDbField;
    FIdparcela: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdcontrato: TCmDbField;
    FObservacao: TCmDbField;
    FIditem: TCmDbField;
    FIdobjeto: TCmDbField;
    FIDParcelaAux: Double;
    FHistoricoCompl: TCmDbField;
    FIdReservaOrcamen: TCmDbField;
    FFlgEstornado: TCmDbField;

  public
     Property Vlrmoedacorrente: TCmDbField read FVlrmoedacorrente write FVlrmoedacorrente;
     Property Valorobjparcela: TCmDbField read FValorobjparcela write FValorobjparcela;
     Property Qtdeparcela: TCmDbField read FQtdeparcela write FQtdeparcela;
     Property Plncodigo: TCmDbField read FPlncodigo write FPlncodigo;
     Property Observacao: TCmDbField read FObservacao write FObservacao;
     Property HistoricoCompl: TCmDbField read FHistoricoCompl write FHistoricoCompl;
     Property Numnotafiscal: TCmDbField read FNumnotafiscal write FNumnotafiscal;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idparcelamedicao: TCmDbField read FIdparcelamedicao write FIdparcelamedicao;
     Property Idparcela: TCmDbField read FIdparcela write FIdparcela;
     Property Idobjeto: TCmDbField read FIdobjeto write FIdobjeto;
     Property Idmedicao: TCmDbField read FIdmedicao write FIdmedicao;
     Property Iditem: TCmDbField read FIditem write FIditem;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;
     Property Datavencparcela: TCmDbField read FDatavencparcela write FDatavencparcela;
     Property Datarealparcela: TCmDbField read FDatarealparcela write FDatarealparcela;
     Property Dataemissnf: TCmDbField read FDataemissnf write FDataemissnf;
     Property Coddocumento: TCmDbField read FCoddocumento write FCoddocumento;
     Property IDParcelaAux: Double read FIDParcelaAux write FIDParcelaAux;
     Property IdReservaOrcamen: TCmDbField read FIdReservaOrcamen write FIdReservaOrcamen;

     // Marchetti - Pendencia 16957
     Property FlgEstornado: TCmDbField read FFlgEstornado write FFlgEstornado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParcelaRealContr }

constructor TDbParcelaRealContr.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   FIDParcelaAux:=0;
   ErrorIfNoRowsAffected := False;

   TableName := 'PARCELAREALCONTR';

   fVlrmoedacorrente := CreateCmDbField('VLRMOEDACORRENTE',ftfloat,False,False,False,True,'');
   fValorobjparcela := CreateCmDbField('VALOROBJPARCELA',ftfloat,False,False,False,True,'');
   fQtdeparcela := CreateCmDbField('QTDEPARCELA',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fHistoricoCompl := CreateCmDbField('HISTORICOCOMPL',ftString,False,False,False,True,'');   
   fNumnotafiscal := CreateCmDbField('NUMNOTAFISCAL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdparcelamedicao := CreateCmDbField('IDPARCELAMEDICAO',ftfloat,False,False,False,True,'');
   fIdparcela := CreateCmDbField('IDPARCELA',ftfloat,True,True,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,False,False,False,True,'');
   fIdmedicao := CreateCmDbField('IDMEDICAO',ftfloat,False,False,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,False,False,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,False,False,False,True,'');
   fDatavencparcela := CreateCmDbField('DATAVENCPARCELA',ftDateTime,True,False,False,True,'');
   fDatarealparcela := CreateCmDbField('DATAREALPARCELA',ftDateTime,False,False,False,True,'');
   fDataemissnf := CreateCmDbField('DATAEMISSNF',ftDateTime,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fIdReservaOrcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,False,False,False,True,'');

   // Marchetti - Pendencia 16957
   fFlgEstornado := CreateCmDbField('FLGESTORNADO',ftfloat,False,False,False,True,'');

end;

function TDbParcelaRealContr.Insert: Boolean;
begin
   if (FIDParcelaAux <> 0) then
      fIdparcela.AsFloat := FIDParcelaAux
   else
      fIdparcela.AsFloat := GetSequence('PARCELAREALCONTR');
      
   Result := Inherited Insert;

   FIDParcelaAux := 0;
end;

end.



