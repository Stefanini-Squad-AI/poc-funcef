{-------------------------------------------------------------------------------
 N. Solicitação: WO3701
 Dt Alteração..: 09/10/2023
 Responsável...: Everson Cunha
 Descrição.....: Inclusão do campo FLAGATIVO.
--------------------------------------------------------------------------------
 N. SIG........: 115585
 Dt Alteração..: 18/11/2017
 Responsável...: Cássio Rovaroto
 Descrição.....: Retirada do campo FLGMAODEOBRA.
--------------------------------------------------------------------------------
 N. SIG........: 23656.58467
 Dt Alteração..: 14/11/2017
 Responsável...: Cássio Rovaroto
 Descrição.....: Inclusão do campo FLGMAODEOBRA.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 10/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbObjetosxitemcontr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbObjetosxitemcontr = class(TCmDbObject)

  private
    FNummedicoes: TCmDbField;
    FToleranciamenosobjeto: TCmDbField;
    FObservacao: TCmDbField;
    FFlgresmenabat: TCmDbField;
    FIdpessoa: TCmDbField;
    FToleranciamaisobjeto: TCmDbField;
    FIdobjeto: TCmDbField;
    FMoecodigo: TCmDbField;
    FDataultgeracao: TCmDbField;
    FValorunitarioobjeto: TCmDbField;
    FNumparcelas: TCmDbField;
    FQtdeitem: TCmDbField;
    FIditemabatcorr: TCmDbField;
    FDatabaseitem: TCmDbField;
    FDatainiciocobr: TCmDbField;
    FAtuacao: TCmDbField;
    FIdcontrato: TCmDbField;
    FFrequencia: TCmDbField;
    FTipotoleranciaobjeto: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdobjabatcorr: TCmDbField;
    FCodmedida: TCmDbField;
    FDataultvenc: TCmDbField;
    FIdprograma: TCmDbField;
    FUnidnegoc: TCmDbField;
    FValortotalobjeto: TCmDbField;
    FIdpatro: TCmDbField;
    FIditem: TCmDbField;
    FIntervalo: TCmDbField;
    FIdResponsavel: TCmDbField;
    FIdFormOrcado: TCmDbField;
    FFlgMaoDeObra: TCmDbField;
    FFlgAtivo: TCmDbField;
    procedure SetIdFormOrcado(const Value: TCmDbField);
  public
     Property Valorunitarioobjeto: TCmDbField read FValorunitarioobjeto write FValorunitarioobjeto;
     Property Valortotalobjeto: TCmDbField read FValortotalobjeto write FValortotalobjeto;
     Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
     Property Toleranciamenosobjeto: TCmDbField read FToleranciamenosobjeto write FToleranciamenosobjeto;
     Property Toleranciamaisobjeto: TCmDbField read FToleranciamaisobjeto write FToleranciamaisobjeto;
     Property Tipotoleranciaobjeto: TCmDbField read FTipotoleranciaobjeto write FTipotoleranciaobjeto;
     Property Qtdeitem: TCmDbField read FQtdeitem write FQtdeitem;
     Property Observacao: TCmDbField read FObservacao write FObservacao;
     Property Numparcelas: TCmDbField read FNumparcelas write FNumparcelas;
     Property Nummedicoes: TCmDbField read FNummedicoes write FNummedicoes;
     Property Moecodigo: TCmDbField read FMoecodigo write FMoecodigo;
     Property Intervalo: TCmDbField read FIntervalo write FIntervalo;
     Property Idprograma: TCmDbField read FIdprograma write FIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write FIdpatro;
     Property Idobjeto: TCmDbField read FIdobjeto write FIdobjeto;
     Property Idobjabatcorr: TCmDbField read FIdobjabatcorr write FIdobjabatcorr;
     Property Iditemabatcorr: TCmDbField read FIditemabatcorr write FIditemabatcorr;
     Property Iditem: TCmDbField read FIditem write FIditem;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;
     Property Frequencia: TCmDbField read FFrequencia write FFrequencia;
     Property Flgresmenabat: TCmDbField read FFlgresmenabat write FFlgresmenabat;
     Property Dataultvenc: TCmDbField read FDataultvenc write FDataultvenc;
     Property Dataultgeracao: TCmDbField read FDataultgeracao write FDataultgeracao;
     Property Datainiciocobr: TCmDbField read FDatainiciocobr write FDatainiciocobr;
     Property Databaseitem: TCmDbField read FDatabaseitem write FDatabaseitem;
     Property Codmedida: TCmDbField read FCodmedida write FCodmedida;
     Property Atuacao: TCmDbField read FAtuacao write FAtuacao;
     Property IdResponsavel : TCmDbField read FIdResponsavel write FIdResponsavel;
     property IdFormOrcado : TCmDbField read FIdFormOrcado write SetIdFormOrcado;
     //Cássio Rovaroto SIG nº 23656.58467
     property FlgMaoDeObra: TCmDbField read FFlgMaoDeObra write FFlgMaoDeObra;
     property FlgAtivo: TCmDbField read FFlgAtivo write FFlgAtivo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbObjetosxitemcontr }

constructor TDbObjetosxitemcontr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  _UpdateKeyFields      := True;  

  TableName := 'OBJETOSXITEMCONTR';

   fValorunitarioobjeto := CreateCmDbField('VALORUNITARIOOBJETO',ftfloat,False,False,False,True,'');
   fValortotalobjeto := CreateCmDbField('VALORTOTALOBJETO',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fToleranciamenosobjeto := CreateCmDbField('TOLERANCIAMENOSOBJETO',ftfloat,False,False,False,True,'');
   fToleranciamaisobjeto := CreateCmDbField('TOLERANCIAMAISOBJETO',ftfloat,False,False,False,True,'');
   fTipotoleranciaobjeto := CreateCmDbField('TIPOTOLERANCIAOBJETO',ftString,False,False,False,True,'');
   fQtdeitem := CreateCmDbField('QTDEITEM',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNumparcelas := CreateCmDbField('NUMPARCELAS',ftfloat,False,False,False,True,'');
   fNummedicoes := CreateCmDbField('NUMMEDICOES',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIntervalo := CreateCmDbField('INTERVALO',ftfloat,False,False,False,False,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,True,False,True,'');
   fIdobjabatcorr := CreateCmDbField('IDOBJABATCORR',ftfloat,False,False,False,True,'');
   fIditemabatcorr := CreateCmDbField('IDITEMABATCORR',ftfloat,False,False,False,True,'');
   fIditem := CreateCmDbField('IDITEM',ftfloat,True,True,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'');
   fFrequencia := CreateCmDbField('FREQUENCIA',ftString,False,False,False,True,'');
   fFlgresmenabat := CreateCmDbField('FLGRESMENABAT',ftString,False,False,False,True,'');
   fDataultvenc := CreateCmDbField('DATAULTVENC',ftDateTime,False,False,False,True,'');
   fDataultgeracao := CreateCmDbField('DATAULTGERACAO',ftDateTime,False,False,False,True,'');
   fDatainiciocobr := CreateCmDbField('DATAINICIOCOBR',ftDateTime,False,False,False,True,'');
   fDatabaseitem := CreateCmDbField('DATABASEITEM',ftDateTime,False,False,False,True,'');
   fCodmedida := CreateCmDbField('CODMEDIDA',ftString,False,False,False,True,'');
   fAtuacao := CreateCmDbField('ATUACAO',ftString,False,False,False,True,'');
   fIdResponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdFormOrcado := CreateCmDbField('IDFORMORCADO',ftfloat,False,False,False,True,'');  
   //FFlgMaoDeObra := CreateCmDbField('FLGMAODEOBRA', ftString, False, False, False, False, ''); //Cássio Rovaroto - SIG nº 23656.58467 //Cássio Rovaroto - SIG nº 115585
   FFlgAtivo := CreateCmDbField('FLGATIVO', ftString, False, False, False, False, '');
end;

function TDbObjetosxitemcontr.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbObjetosxitemcontr.SetIdFormOrcado(const Value: TCmDbField);
begin
  FIdFormOrcado := Value;
end;

end.



