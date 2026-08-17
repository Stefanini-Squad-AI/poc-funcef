{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 12/03/2002                             }
{                                                       }
{*******************************************************}

{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Inclusão do Grupo Da Contas [ Orçamento ]
-------------------------------------------------------------------------------------------------- }

unit uDbAltxccxprgxconta;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAltxccxprgxconta = class(TCmDbObject)

  private
    FIdaltxccxprgxconta: TCmDbField;
    FIdempresa: TCmDbField;
    FPlano: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FCodalterador: TCmDbField;
    FPlaconta: TCmDbField;
    FIdprograma: TCmDbField;
    FIdGrupoOrcamen: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdaltxccxprgxconta(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetIdGrupoOrcamen(const Value: TCmDbField);

  public

     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idaltxccxprgxconta: TCmDbField read FIdaltxccxprgxconta write SetIdaltxccxprgxconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;

     //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
     Property IdGrupoOrcamen : TCmDbField read FIdGrupoOrcamen write SetIdGrupoOrcamen;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAltxccxprgxconta }

constructor TDbAltxccxprgxconta.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALTXCCXPRGXCONTA';

   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdaltxccxprgxconta := CreateCmDbField('IDALTXCCXPRGXCONTA',ftfloat,True,True,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'');

   //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
   FIdGrupoOrcamen    := CreateCmDbField('IDGRUPOORCAMEN',ftFloat,False,False,False,True,'');

end;

function TDbAltxccxprgxconta.Insert: Boolean;
begin

   fIdaltxccxprgxconta.AsFloat := GetSequence('ALTXCCXPRGXCONTA');
   Result := Inherited Insert;

end;

function TDbAltxccxprgxconta.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbAltxccxprgxconta.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbAltxccxprgxconta.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbAltxccxprgxconta.SetIdaltxccxprgxconta(
  const Value: TCmDbField);
begin
  FIdaltxccxprgxconta := Value;
end;

procedure TDbAltxccxprgxconta.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbAltxccxprgxconta.SetIdGrupoOrcamen(const Value: TCmDbField);
begin
  FIdGrupoOrcamen := Value;
end;

procedure TDbAltxccxprgxconta.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbAltxccxprgxconta.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbAltxccxprgxconta.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

end.
