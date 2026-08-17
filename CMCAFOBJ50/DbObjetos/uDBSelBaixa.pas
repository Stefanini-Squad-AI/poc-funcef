{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 12/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBSelBaixa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSelBaixa = class(TCmDbObject)

  private
    FSbxdata: TCmDbField;
    FSbxtermo: TCmDbField;
    FIdselbaixa: TCmDbField;
    FIdgrupo: TCmDbField;
    FSbxflgexecutado: TCmDbField;
    FIdresponsavel: TCmDbField;
    FIddestinobaixa: TCmDbField;
    FSbxdtaexecutado: TCmDbField;
    FIdconjunto: TCmDbField;
    FSbtipomov: TCmDbField;
    FSbxprocesso: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIddestinobaixa(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdselbaixa(const Value: TCmDbField);
    procedure SetSbtipomov(const Value: TCmDbField);
    procedure SetSbxdata(const Value: TCmDbField);
    procedure SetSbxdtaexecutado(const Value: TCmDbField);
    procedure SetSbxflgexecutado(const Value: TCmDbField);
    procedure SetSbxprocesso(const Value: TCmDbField);
    procedure SetSbxtermo(const Value: TCmDbField);

  public

     Property Sbxtermo: TCmDbField read FSbxtermo write SetSbxtermo;
     Property Sbxprocesso: TCmDbField read FSbxprocesso write SetSbxprocesso;
     Property Sbxflgexecutado: TCmDbField read FSbxflgexecutado write SetSbxflgexecutado;
     Property Sbxdtaexecutado: TCmDbField read FSbxdtaexecutado write SetSbxdtaexecutado;
     Property Sbxdata: TCmDbField read FSbxdata write SetSbxdata;
     Property Sbtipomov: TCmDbField read FSbtipomov write SetSbtipomov;
     Property Idselbaixa: TCmDbField read FIdselbaixa write SetIdselbaixa;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Iddestinobaixa: TCmDbField read FIddestinobaixa write SetIddestinobaixa;
     Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSelBaixa }

constructor TDBSelBaixa.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SELBAIXA';

   fSbxtermo := CreateCmDbField('SBXTERMO',ftfloat,False,False,False,True,'');
   fSbxprocesso := CreateCmDbField('SBXPROCESSO',ftString,False,False,False,True,'');
   fSbxflgexecutado := CreateCmDbField('SBXFLGEXECUTADO',ftfloat,False,False,False,True,'');
   fSbxdtaexecutado := CreateCmDbField('SBXDTAEXECUTADO',ftDateTime,False,False,False,True,'');
   fSbxdata := CreateCmDbField('SBXDATA',ftDateTime,False,False,False,True,'');
   fSbtipomov := CreateCmDbField('SBTIPOMOV',ftfloat,True,False,False,False,'');
   fIdselbaixa := CreateCmDbField('IDSELBAIXA',ftfloat,True,True,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIddestinobaixa := CreateCmDbField('IDDESTINOBAIXA',ftfloat,False,False,False,True,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,False,False,False,True,'');
end;

function TDBSelBaixa.Insert: Boolean;
begin
   fIdselbaixa.AsFloat := GetSequence('SELBAIXA');
   Result := Inherited Insert;
end;

procedure TDBSelBaixa.SetIdconjunto(const Value: TCmDbField);
begin
  FIdconjunto := Value;
end;

procedure TDBSelBaixa.SetIddestinobaixa(const Value: TCmDbField);
begin
  FIddestinobaixa := Value;
end;

procedure TDBSelBaixa.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBSelBaixa.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSelBaixa.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDBSelBaixa.SetIdselbaixa(const Value: TCmDbField);
begin
  FIdselbaixa := Value;
end;

procedure TDBSelBaixa.SetSbtipomov(const Value: TCmDbField);
begin
  FSbtipomov := Value;
end;

procedure TDBSelBaixa.SetSbxdata(const Value: TCmDbField);
begin
  FSbxdata := Value;
end;

procedure TDBSelBaixa.SetSbxdtaexecutado(const Value: TCmDbField);
begin
  FSbxdtaexecutado := Value;
end;

procedure TDBSelBaixa.SetSbxflgexecutado(const Value: TCmDbField);
begin
  FSbxflgexecutado := Value;
end;

procedure TDBSelBaixa.SetSbxprocesso(const Value: TCmDbField);
begin
  FSbxprocesso := Value;
end;

procedure TDBSelBaixa.SetSbxtermo(const Value: TCmDbField);
begin
  FSbxtermo := Value;
end;

end.



