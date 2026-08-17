{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbProcxArt;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbProcxArt = class(TCmDbObject)

  private
    FDataNecessidade: TCmDbField;
    FQtdePedida: TCmDbField;
    FCodMedida: TCmDbField;
    FCodProcesso: TCmDbField;
    FIdProcxArt: TCmDbField;
    FStatus: TCmDbField;
    FCodArtigo: TCmDbField;
    FIdprodVari: TCmDbField;
    FJustificativa: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetDataNecessidade(const Value: TCmDbField);
    procedure SetIdProcxArt(const Value: TCmDbField);
    procedure SetIdprodVari(const Value: TCmDbField);
    procedure SetJustificativa(const Value: TCmDbField);
    procedure SetQtdePedida(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);

  public

     Property Status          : TCmDbField read FStatus write SetStatus;
     Property QtdePedida      : TCmDbField read FQtdePedida write SetQtdePedida;
     Property Justificativa   : TCmDbField read FJustificativa write SetJustificativa;
     Property IdprodVari      : TCmDbField read FIdprodVari write SetIdprodVari;
     Property IdProcxArt      : TCmDbField read FIdProcxArt write SetIdProcxArt;
     Property DataNecessidade : TCmDbField read FDataNecessidade write SetDataNecessidade;
     Property CodProcesso     : TCmDbField read FCodProcesso write SetCodProcesso;
     Property CodMedida       : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo       : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbProcxArt }

constructor TDbProcxArt.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

   TableName := 'PROCXART';

   fStatus          := CreateCmDbField('STATUS',ftString,False,False,False,True,'');
   fQtdepedida      := CreateCmDbField('QTDEPEDIDA',ftfloat,False,False,False,True,'');
   fJustificativa   := CreateCmDbField('JUSTIFICATIVA',ftString,False,False,False,True,'');
   fIdprodvari      := CreateCmDbField('IDPRODVARI',ftfloat,False,False,False,True,'');
   fIdprocxart      := CreateCmDbField('IDPROCXART',ftfloat,True,True,False,True,'');
   fDatanecessidade := CreateCmDbField('DATANECESSIDADE',ftDateTime,False,False,False,True,'');
   fCodprocesso     := CreateCmDbField('CODPROCESSO',ftfloat,True,True,False,True,'');
   fCodmedida       := CreateCmDbField('CODMEDIDA',ftString,False,False,False,True,'');
   fCodartigo       := CreateCmDbField('CODARTIGO',ftString,False,False,False,True,'');
end;

function TDbProcxArt.Insert: Boolean;
begin

   fIdprocxart.AsFloat := GetSequence('PROCXART');
   Result := Inherited Insert;

end;

function TDbProcxArt.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbProcxArt.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbProcxArt.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbProcxArt.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbProcxArt.SetDataNecessidade(const Value: TCmDbField);
begin
  FDataNecessidade := Value;
end;

procedure TDbProcxArt.SetIdProcxArt(const Value: TCmDbField);
begin
  FIdProcxArt := Value;
end;

procedure TDbProcxArt.SetIdprodVari(const Value: TCmDbField);
begin
  FIdprodVari := Value;
end;

procedure TDbProcxArt.SetJustificativa(const Value: TCmDbField);
begin
  FJustificativa := Value;
end;

procedure TDbProcxArt.SetQtdePedida(const Value: TCmDbField);
begin
  FQtdePedida := Value;
end;

procedure TDbProcxArt.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

end.



