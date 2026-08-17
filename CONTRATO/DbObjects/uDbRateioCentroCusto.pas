{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/03/2004                             }
{                                                       }
{*******************************************************}

{
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

unit uDbRateioCentroCusto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRateioCentroCusto = class(TCmDbObject)

  private
    FIdrateioccusto: TCmDbField;
    FIdcontrato: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIditem: TCmDbField;
    FIdempresa: TCmDbField;
    FIdobjeto: TCmDbField;
    FIdplanoprev: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPercrateiocontr: TCmDbField;
    FIdpatro: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdpessoa: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdprograma: TCmDbField;
    FIDContaOrcamen: TCmDbField;
    FIDPlanoOrcamen: TCmDbField;
    FIDDespesaOrc: TCmDbField;
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
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetIDContaOrcamen(const Value: TCmDbField);
    procedure SetIDPlanoOrcamen(const Value: TCmDbField);
    procedure SetIDDespesaOrc(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
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
     property IDPlanoOrcamen: TCmDbField read FIDPlanoOrcamen write SetIDPlanoOrcamen;
     property IDContaOrcamen: TCmDbField read FIDContaOrcamen write SetIDContaOrcamen;

     // Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     property IDDespesaOrc : TCmDbField read FIDDespesaOrc write SetIDDespesaOrc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRateioCentroCusto }

constructor TDbRateioCentroCusto.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RATEIOCENTROCUSTO';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
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
   fIDPlanoOrcamen := CreateCmDbField('IDPLANOORCAMEN',ftInteger,False,False,False,True,'');
   fIDContaOrcamen := CreateCmDbField('IDCONTAORCAMEN',ftString,False,False,False,True,'');

   // Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   FIDDespesaOrc   := CreateCmDbField('IDDESPESAORC',ftFloat,False,False,False,True,'');

end;

function TDbRateioCentroCusto.Insert: Boolean;
begin
   fIdrateioccusto.AsFloat := GetSequence('RATEIOCENTROCUSTO');
   Result := Inherited Insert;
end;


procedure TDbRateioCentroCusto.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRateioCentroCusto.SetIDContaOrcamen(const Value: TCmDbField);
begin
  FIDContaOrcamen := Value;
end;

procedure TDbRateioCentroCusto.SetIdcontrato(const Value: TCmDbField);
begin
  FIdcontrato := Value;
end;

procedure TDbRateioCentroCusto.SetIDDespesaOrc(const Value: TCmDbField);
begin
  FIDDespesaOrc := Value;
end;

procedure TDbRateioCentroCusto.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRateioCentroCusto.SetIditem(const Value: TCmDbField);
begin
  FIditem := Value;
end;

procedure TDbRateioCentroCusto.SetIdobjeto(const Value: TCmDbField);
begin
  FIdobjeto := Value;
end;

procedure TDbRateioCentroCusto.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRateioCentroCusto.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRateioCentroCusto.SetIDPlanoOrcamen(const Value: TCmDbField);
begin
  FIDPlanoOrcamen := Value;
end;

procedure TDbRateioCentroCusto.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRateioCentroCusto.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbRateioCentroCusto.SetIdrateioccusto(const Value: TCmDbField);
begin
  FIdrateioccusto := Value;
end;

procedure TDbRateioCentroCusto.SetPercrateiocontr(const Value: TCmDbField);
begin
  FPercrateiocontr := Value;
end;

procedure TDbRateioCentroCusto.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbRateioCentroCusto.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbRateioCentroCusto.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



