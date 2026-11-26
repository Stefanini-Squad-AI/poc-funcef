{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbConfigreportscm;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbConfigreportscm = class(TCmDbObject)

  private
    FIdreports: TCmDbField;
    FDescricao: TCmDbField;
    FOrigemcm: TCmDbField;
    FIdpessoa: TCmDbField;
    FTemplate: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
    procedure SetTemplate(const Value: TCmDbField);

  public

     Property Template: TCmDbField read FTemplate write SetTemplate;
     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbConfigreportscm }

constructor TDbConfigreportscm.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFIGREPORTSCM';

  fTemplate := CreateCmDbField('TEMPLATE',ftBlob,False,False,False,True,'');
  fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,True, True,False, False,'');
  fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False, True,False, False,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
  fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

procedure TDbConfigreportscm.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbConfigreportscm.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbConfigreportscm.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbConfigreportscm.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbConfigreportscm.SetTemplate(const Value: TCmDbField);
begin
  FTemplate := Value;
end;

end.



