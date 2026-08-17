{****************************************************}
{                                                    }
{ CM Soluções Informática                            }
{ ** Todos os Direitos Reservados                    }
{ Gerada pelo "CM Bussines Object Builder"           }
{ Analista Responsável: Sergio Fernandes de Almeida  }
{ Atualizado Em: 03/04/2003                          }
{                                                    }
{****************************************************}

unit uDBBensPendentes;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBBensPendentes = class(TCmDbObject)

  private
    FIdconjunto: TCmDbField;
    FIdbenspendentes: TCmDbField;
    FDesbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FDtainclusao: TCmDbField;
    FControle: TCmDbField;
    FIdmodulo: TCmDbField;
    FIditensrecdev: TCmDbField;
    FNumserie: TCmDbField;
    FPlaca: TCmDbField;
    FComplnota: TCmDbField;
    FIdfornserv: TCmDbField;
    FDtanota: TCmDbField;
    FIdclassebem: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdsituacao: TCmDbField;
    FValorg: TCmDbField;
    FIdnota: TCmDbField;
    procedure SetComplnota(const Value: TCmDbField);
    procedure SetControle(const Value: TCmDbField);
    procedure SetDesbem(const Value: TCmDbField);
    procedure SetDtainclusao(const Value: TCmDbField);
    procedure SetDtanota(const Value: TCmDbField);
    procedure SetIdbenspendentes(const Value: TCmDbField);
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIdfornserv(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIditensrecdev(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdnota(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsituacao(const Value: TCmDbField);
    procedure SetNumserie(const Value: TCmDbField);
    procedure SetPlaca(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Placa: TCmDbField read FPlaca write SetPlaca;
     Property Numserie: TCmDbField read FNumserie write SetNumserie;
     Property Idsituacao: TCmDbField read FIdsituacao write SetIdsituacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idnota: TCmDbField read FIdnota write SetIdnota;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Iditensrecdev: TCmDbField read FIditensrecdev write SetIditensrecdev;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idfornserv: TCmDbField read FIdfornserv write SetIdfornserv;
     Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;
     Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;
     Property Idbenspendentes: TCmDbField read FIdbenspendentes write SetIdbenspendentes;
     Property Dtanota: TCmDbField read FDtanota write SetDtanota;
     Property Dtainclusao: TCmDbField read FDtainclusao write SetDtainclusao;
     Property Desbem: TCmDbField read FDesbem write SetDesbem;
     Property Controle: TCmDbField read FControle write SetControle;
     Property Complnota: TCmDbField read FComplnota write SetComplnota;

     Constructor Create(Aowner : TCmCustomCdbObject); Override;

     Function Insert : Boolean; Override;
  End;

implementation

{ TDBBensPendentes }

constructor TDBBensPendentes.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'BENSPENDENTES';

   fControle := CreateCmDbField('CONTROLE',ftString,False,False,False,True,'');
   fComplnota := CreateCmDbField('COMPLNOTA',ftString,False,False,False,True,'');
   fDtanota := CreateCmDbField('DTANOTA',ftDateTime,False,False,False,True,'');
   fDtainclusao := CreateCmDbField('DTAINCLUSAO',ftDateTime,False,False,False,True,'');
   fDesbem := CreateCmDbField('DESBEM',ftString,False,False,False,True,'');
   fIdsituacao := CreateCmDbField('IDSITUACAO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdnota := CreateCmDbField('IDNOTA',ftString,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIditensrecdev := CreateCmDbField('IDITENSRECDEV',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdfornserv := CreateCmDbField('IDFORNSERV',ftfloat,False,False,False,True,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,False,False,False,True,'');
   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,False,False,False,True,'');
   fIdbenspendentes := CreateCmDbField('IDBENSPENDENTES',ftfloat,True,True,False,True,'');
   fNumserie := CreateCmDbField('NUMSERIE',ftString,False,False,False,True,'');
   fPlaca := CreateCmDbField('PLACA',ftfloat,False,False,False,True,'');
   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
end;

function TDBBensPendentes.Insert: Boolean;
begin
   fIdbenspendentes.AsFloat := GetSequence('BENSPENDENTES');
   Result := Inherited Insert;
end;


procedure TDBBensPendentes.SetComplnota(const Value: TCmDbField);
begin
  FComplnota := Value;
end;

procedure TDBBensPendentes.SetControle(const Value: TCmDbField);
begin
  FControle := Value;
end;

procedure TDBBensPendentes.SetDesbem(const Value: TCmDbField);
begin
  FDesbem := Value;
end;

procedure TDBBensPendentes.SetDtainclusao(const Value: TCmDbField);
begin
  FDtainclusao := Value;
end;

procedure TDBBensPendentes.SetDtanota(const Value: TCmDbField);
begin
  FDtanota := Value;
end;

procedure TDBBensPendentes.SetIdbenspendentes(const Value: TCmDbField);
begin
  FIdbenspendentes := Value;
end;

procedure TDBBensPendentes.SetIdclassebem(const Value: TCmDbField);
begin
  FIdclassebem := Value;
end;

procedure TDBBensPendentes.SetIdconjunto(const Value: TCmDbField);
begin
  FIdconjunto := Value;
end;

procedure TDBBensPendentes.SetIdfornserv(const Value: TCmDbField);
begin
  FIdfornserv := Value;
end;

procedure TDBBensPendentes.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBBensPendentes.SetIditensrecdev(const Value: TCmDbField);
begin
  FIditensrecdev := Value;
end;

procedure TDBBensPendentes.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDBBensPendentes.SetIdnota(const Value: TCmDbField);
begin
  FIdnota := Value;
end;

procedure TDBBensPendentes.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBBensPendentes.SetIdsituacao(const Value: TCmDbField);
begin
  FIdsituacao := Value;
end;

procedure TDBBensPendentes.SetNumserie(const Value: TCmDbField);
begin
  FNumserie := Value;
end;

procedure TDBBensPendentes.SetPlaca(const Value: TCmDbField);
begin
  FPlaca := Value;
end;

procedure TDBBensPendentes.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.






