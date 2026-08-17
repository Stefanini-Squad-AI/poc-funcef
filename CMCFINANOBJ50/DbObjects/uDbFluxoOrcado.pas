{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

{ --------------------------------------------------------------------------------------------------
Rotina......: propertys, create, GetIdRateio
Nº SOL......: 210181-15348
Nº KINTANA..: 2051446
Data........: 12/11/2013
Responsável.: Edilaine Ferraresi
Descrição...: Identificação pre-rateio
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroBeforeConfirma, VerificaPreenchimento
Nº SOL......: 162240
Nº KINTANA..: 1378222
Data........: 12/11/2011
Responsável.: Otacilio Aquino
Descrição...: Ajustar a Rotina de fluxo de caixa
---------------------------------------------------------------------------------------------------}
{Rotina.............: TDbFluxoOrcado.Create
N. Sol.............: 115673
N. Kintana.........: 542579
Data...............: 06/07/2009
Responsável........: Marilza Colpani
Descrição..........: Alteração de parâmetros, de: TRUE para: FALSE
}

unit uDbFluxoOrcado;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbFluxoOrcado = class(TCmDbObject)

  private
    FValoroutramoeda: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdpessoa: TCmDbField;
    FDataprogramada: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdplanoprev: TCmDbField;
    FValor: TCmDbField;
    FLotetransmissao: TCmDbField;
    FCodtipdoc: TCmDbField;
    FPrazo: TCmDbField;
    FIdpatro: TCmDbField;
    FIdfluxoorcado: TCmDbField;
    FFlgsimulaativo: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FRecpag: TCmDbField;
    FIdempresa: TCmDbField;
    FIdprograma: TCmDbField;
    FMoecodigo: TCmDbField;
    FObservacao:TCMDbField;
    FCodLinhaFluxo:TCMDbField; //Marilza
    //FFlgFluxoOrcado: TCmDbField; //Marilza  - flag que será usada para a busca
    // Kintana 1378222  SOL 115673 Otacilio
    FCodRel:TCMDbField;
    FIdRateio: TCmDbField;
    procedure SetIdRateio(const Value: TCmDbField);
  public

     Property Valoroutramoeda: TCmDbField read FValoroutramoeda write FValoroutramoeda;
     Property Valor: TCmDbField read FValor write FValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Prazo: TCmDbField read FPrazo write FPrazo;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write FLotetransmissao;
     Property Idprograma: TCmDbField read FIdprograma write FIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write FIdpatro;
     Property Idfluxoorcado: TCmDbField read FIdfluxoorcado write FIdfluxoorcado;
     Property Idempresa: TCmDbField read FIdempresa write FIdempresa;
     Property Flgsimulaativo: TCmDbField read FFlgsimulaativo write FFlgsimulaativo;
     Property Dataprogramada: TCmDbField read FDataprogramada write FDataprogramada;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
     Property Codtipdoc: TCmDbField read FCodtipdoc write FCodtipdoc;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
     Property Observacao: TCmDbField read FObservacao write FObservacao;
     Property CodLinhaFluxo: TCmDbField read FCodLinhaFluxo write FCodLinhaFluxo;  //Marilza
     //Property FlgFluxoOrcado: TCmDbField read FFlgFluxoOrcado write FFlgFluxoOrcado; //Marilza  - flag que será usada para a busca
     Property CodRel: TCmDbField read FCodRel write FCodRel; // Kintana 1378222  SOL 115673 Otacilio
     Property IdRateio: TCmDbField read FIdRateio write SetIdRateio;    // Edilaine - SOL 210181-15348 / KTN 2051446

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function GetIdRateio : double;  // Edilaine - SOL 210181-15348 / KTN 2051446
     Function GetCodigo   : double;  // Edilaine - SOL 210181-15348 / KTN 2051446

  End;

implementation

{ TDbFluxoOrcado }

constructor TDbFluxoOrcado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FLUXOORCADO';

   fValoroutramoeda := CreateCmDbField('VALOROUTRAMOEDA',ftfloat,False,False,False,False,'');
   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,True,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,false,False,False,True,''); // Marilza Colpani - SOL:115673/KTN:542579 - 3º parametro era TRUE
   fPrazo := CreateCmDbField('PRAZO',ftString,True,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdfluxoorcado := CreateCmDbField('IDFLUXOORCADO',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgsimulaativo := CreateCmDbField('FLGSIMULAATIVO',ftString,False,False,False,True,'');
   fDataprogramada := CreateCmDbField('DATAPROGRAMADA',ftDateTime,True,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,false,False,False,True,''); // Marilza Colpani - SOL:115673/KTN:542579 - 3º parametro era TRUE
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,True,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   FCodLinhaFluxo := CreateCmDbField('CODLINHAFLUXO',ftFloat,False,False,False,True,'');  //Marilza
   //FFlgFluxoOrcado := CreateCmDbField('FLGFLUXOORCADO',ftString,False,False,False,True,''); //Marilza  - flag que será usada para a busca
   FCodRel := CreateCmDbField('CODREL',ftFloat,False,False,False,True,'');// Kintana 1378222  SOL 115673 Otacilio
   FIdRateio := CreateCmDbField('IDENTIFICADORDERATEIO',ftFloat,False,False,False,True,'');  // Edilaine - SOL 210181-15348 / KTN 2051446
end;

function TDbFluxoOrcado.GetCodigo: double;
begin
  Result := GetSequence('FLUXOORCADO');  // Edilaine - SOL 210181-15348 / KTN 2051446
end;

function TDbFluxoOrcado.GetIdRateio: double;
begin
  Result := GetSequence('IDENTIFICADORDERATEIO');     // Edilaine - SOL 210181-15348 / KTN 2051446
end;

function TDbFluxoOrcado.Insert: Boolean;
begin
   if fIdfluxoorcado.AsFloat <= 0 then        // Edilaine - SOL 210181-15348 / KTN 2051446
      fIdfluxoorcado.AsFloat := GetSequence('FLUXOORCADO');
   Result := Inherited Insert;
end;

function TDbFluxoOrcado.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;


procedure TDbFluxoOrcado.SetIdRateio(const Value: TCmDbField);
begin
  FIdRateio := Value;
end;

end.
