{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}
{ Alterações
**********************************************************************
Analista.: Edilaine Ferraresi
SOL......: 180961
Kintana..: 1677063
Data.....: 29/05/2012
Rotina...: Create
Descrição: permitir alteração do ano de vigência do informe
**********************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 05/01/2012
Rotina...: várias.
Descrição: Foi adicionado o campo AnoVigencia na tabela informa então esta
           classe foi alterada para adicionar este campo.
**********************************************************************}
unit uDbInforme;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbInforme = class(TCmDbObject)

  private
    FCodinforme: TCmDbField;
    FFlgbase: TCmDbField;
    FCoddirf: TCmDbField;
    FIdinforme: TCmDbField;
    FFlgnatureza: TCmDbField;
    FFlgirrf: TCmDbField;
    FNomeinforme: TCmDbField;
    FAnoVigencia: TCmDbField;//Vinicius Maciel -  SOL 168331 - KTN 1482898
    procedure SetCoddirf(const Value: TCmDbField);
    procedure SetCodinforme(const Value: TCmDbField);
    procedure SetFlgbase(const Value: TCmDbField);
    procedure SetFlgirrf(const Value: TCmDbField);
    procedure SetFlgnatureza(const Value: TCmDbField);
    procedure SetIdinforme(const Value: TCmDbField);
    procedure SetNomeinforme(const Value: TCmDbField);
    procedure SetAnoVigencia(const Value: TCmDbField);//Vinicius Maciel -  SOL 168331 - KTN 1482898

  public

     Property Nomeinforme: TCmDbField read FNomeinforme write SetNomeinforme;
     Property Idinforme: TCmDbField read FIdinforme write SetIdinforme;
     Property Flgnatureza: TCmDbField read FFlgnatureza write SetFlgnatureza;
     Property Flgirrf: TCmDbField read FFlgirrf write SetFlgirrf;
     Property Flgbase: TCmDbField read FFlgbase write SetFlgbase;
     Property Codinforme: TCmDbField read FCodinforme write SetCodinforme;
     Property Coddirf: TCmDbField read FCoddirf write SetCoddirf;
     Property AnoVigencia: TCmDbField read FAnoVigencia write SetAnoVigencia;//Vinicius Maciel -  SOL 168331 - KTN 1482898
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbInforme }

constructor TDbInforme.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INFORME';

   fNomeinforme := CreateCmDbField('NOMEINFORME',ftString,False,False,False,True,'');
   fIdinforme := CreateCmDbField('IDINFORME',ftfloat,True,True,False,True,'');
   fFlgnatureza := CreateCmDbField('FLGNATUREZA',ftString,False,False,False,True,'');
   fFlgirrf := CreateCmDbField('FLGIRRF',ftString,False,False,False,True,'');
   fFlgbase := CreateCmDbField('FLGBASE',ftString,False,False,False,True,'');
   fCodinforme := CreateCmDbField('CODINFORME',ftfloat,False,False,False,True,'');
   fCoddirf := CreateCmDbField('CODDIRF',ftfloat,False,False,False,True,'');
   fAnoVigencia := CreateCmDbField('AnoVigencia',ftString,true,true,False,True,'');//Vinicius Maciel -  SOL 168331 - KTN 1482898

   _UpdateKeyFields := true;   // Edilaine - SOL 180961 / KTN 1677063
end;

function TDbInforme.Insert: Boolean;
begin

   fIdinforme.AsFloat := GetSequence('INFORME');
   Result := Inherited Insert;

end;

function TDbInforme.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;
//Vinicius Maciel -  SOL 168331 - KTN 1482898
procedure TDbInforme.SetAnoVigencia(const Value: TCmDbField);
begin
  FAnoVigencia := Value;
end;
//Vinicius Maciel -  SOL 168331 - KTN 1482898 - FIM

procedure TDbInforme.SetCoddirf(const Value: TCmDbField);
begin
  FCoddirf := Value;
end;

procedure TDbInforme.SetCodinforme(const Value: TCmDbField);
begin
  FCodinforme := Value;
end;

procedure TDbInforme.SetFlgbase(const Value: TCmDbField);
begin
  FFlgbase := Value;
end;

procedure TDbInforme.SetFlgirrf(const Value: TCmDbField);
begin
  FFlgirrf := Value;
end;

procedure TDbInforme.SetFlgnatureza(const Value: TCmDbField);
begin
  FFlgnatureza := Value;
end;

procedure TDbInforme.SetIdinforme(const Value: TCmDbField);
begin
  FIdinforme := Value;
end;

procedure TDbInforme.SetNomeinforme(const Value: TCmDbField);
begin
  FNomeinforme := Value;
end;

end.



