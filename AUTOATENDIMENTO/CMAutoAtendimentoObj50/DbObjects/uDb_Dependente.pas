{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/07/2002                             }
{                                                       }
{*******************************************************}

unit uDb_Dependente;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDb_Dependente = class(TCmDbObject)

  private
    FTrguserinclusao: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgdesignado: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdsitdependente: TCmDbField;
    procedure SetFlgdesignado(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsitdependente(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Idsitdependente: TCmDbField read FIdsitdependente write SetIdsitdependente;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgdesignado: TCmDbField read FFlgdesignado write SetFlgdesignado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDb_Dependente }

constructor TDb_Dependente.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEPENDENTE';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdsitdependente := CreateCmDbField('IDSITDEPENDENTE',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
   fFlgdesignado := CreateCmDbField('FLGDESIGNADO',ftfloat,False,False,False,True,'');     
end;

procedure TDb_Dependente.SetFlgdesignado(const Value: TCmDbField);
begin
  FFlgdesignado := Value;
end;

procedure TDb_Dependente.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDb_Dependente.SetIdsitdependente(const Value: TCmDbField);
begin
  FIdsitdependente := Value;
end;

procedure TDb_Dependente.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDb_Dependente.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



