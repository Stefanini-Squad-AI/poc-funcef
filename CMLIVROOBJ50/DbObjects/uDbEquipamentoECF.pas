{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbEquipamentoECF;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbEquipamentoECF = class(TCmDbObject)

  private
    FNumseriefabri: TCmDbField;
    FidMaquinaECF: TCmDbField;
    FDescmaquina: TCmDbField;
    FCodigoecf: TCmDbField;

    procedure SetNumseriefabri(const Value: TCmDbField);
    procedure SetIdMaquinaECF(const Value: TCmDbField);
    procedure SetDescmaquina(const Value: TCmDbField);
    procedure SetCodigoecf(const Value: TCmDbField);

  protected
    function GetSqlSelect: String; Override;
  public

     Property Numseriefabri: TCmDbField read FNumseriefabri write SetNumseriefabri;
     Property IdMaquinaECF: TCmDbField  read FidMaquinaECF  write SetIdMaquinaECF;
     Property Descmaquina: TCmDbField   read FDescmaquina   write SetDescmaquina;
     Property Codigoecf: TCmDbField     read FCodigoecf     write SetCodigoecf;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbEquipamentoECF }

constructor TDbEquipamentoECF.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MAQUINAECF';

   fNumseriefabri := CreateCmDbField('NUMSERIEFABRI',ftString,True,False,False,True,'');
   FidMaquinaECF := CreateCmDbField('IDMAQUINAECF',ftfloat,False,True,False,True,'');
   fDescmaquina := CreateCmDbField('DESCMAQUINA',ftString,True,False,False,True,'');
   fCodigoecf := CreateCmDbField('CODIGOECF',ftString,True,False,False,True,'');
end;

function TDbEquipamentoECF.GetSqlSelect: String;
begin
  If FidMaquinaECF.AsFloat = -1 Then
    Result := 'SELECT IDMAQUINAECF, CODIGOECF, '+
              '       NUMSERIEFABRI, DESCMAQUINA '+
              '  FROM MAQUINAECF '+
              ' ORDER BY CODIGOECF'
  Else
    Result := inherited GetSqlSelect;
end;

function TDbEquipamentoECF.Insert: Boolean;
begin

   FidMaquinaECF.AsFloat := GetSequence('MAQUINAECF');
   Result := Inherited Insert;
end;

function TDbEquipamentoECF.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbEquipamentoECF.SetCodigoecf(const Value: TCmDbField);
begin
  FCodigoecf := Value;
end;

procedure TDbEquipamentoECF.SetDescmaquina(const Value: TCmDbField);
begin
  FDescmaquina := Value;
end;

procedure TDbEquipamentoECF.SetIdMaquinaECF(const Value: TCmDbField);
begin
  FidMaquinaECF := Value;
end;

procedure TDbEquipamentoECF.SetNumseriefabri(const Value: TCmDbField);
begin
  FNumseriefabri := Value;
end;

end.



