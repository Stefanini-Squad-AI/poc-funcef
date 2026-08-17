{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebCampo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebCampo = class(TCmDbObject)

  private
    FIdcampopai: TCmDbField;
    FIdpagina: TCmDbField;
    FDesccampo: TCmDbField;
    FIdcampo: TCmDbField;
    FFlgsemprehab: TCmDbField;
    procedure SetDesccampo(const Value: TCmDbField);
    procedure SetIdcampo(const Value: TCmDbField);
    procedure SetIdcampopai(const Value: TCmDbField);
    procedure SetIdpagina(const Value: TCmDbField);
    procedure SetFlgsemprehab(const Value: TCmDbField);

  public

     Property Idpagina: TCmDbField read FIdpagina write SetIdpagina;
     Property Idcampopai: TCmDbField read FIdcampopai write SetIdcampopai;
     Property Idcampo: TCmDbField read FIdcampo write SetIdcampo;
     Property Desccampo: TCmDbField read FDesccampo write SetDesccampo;
     Property Flgsemprehab: TCmDbField read FFlgsemprehab write SetFlgsemprehab;

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

  End;

implementation

{ TDbWebCampo }

constructor TDbWebCampo.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBCAMPO';

   fIdpagina := CreateCmDbField('IDPAGINA',ftfloat,True,False,False,False,'Código da Página');
   fIdcampopai := CreateCmDbField('IDCAMPOPAI',ftfloat,False,False,False,True,'Campo-Pai');
   fIdcampo := CreateCmDbField('IDCAMPO',ftfloat,True,True,False,False,'Código do Campo');
   fDesccampo := CreateCmDbField('DESCCAMPO',ftString,True,False,False,False,'Descrição do Campo');
   fFlgsemprehab := CreateCmDbField('FLGSEMPREHAB',ftString,True,False,False,False,'Sempre habilitado?');
end;

procedure TDbWebCampo.SetDesccampo(const Value: TCmDbField);
begin
  FDesccampo := Value;
end;

procedure TDbWebCampo.SetFlgsemprehab(const Value: TCmDbField);
begin
  FFlgsemprehab := Value;
end;

procedure TDbWebCampo.SetIdcampo(const Value: TCmDbField);
begin
  FIdcampo := Value;
end;

procedure TDbWebCampo.SetIdcampopai(const Value: TCmDbField);
begin
  FIdcampopai := Value;
end;

procedure TDbWebCampo.SetIdpagina(const Value: TCmDbField);
begin
  FIdpagina := Value;
end;

end.



