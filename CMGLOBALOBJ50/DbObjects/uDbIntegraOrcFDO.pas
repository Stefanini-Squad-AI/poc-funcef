unit uDbIntegraOrcFDO;

// Alterações:
{--------------------------------------------------------------------------------------------------
Nº SIG......: 94320
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web
-----------------------------------------------------------------------------------------------------}

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbIntegraOrcFDO = class(TCmDbObject)
   private
    FModulos: TCmDbField;
    FUrlEnvio: TCmDbField;
    FUrlConsulta: TCmDbField;
    FUserConsulta: TCmDbField;
    FIdPessoa: TCmDbField;
    FUserEnvio: TCmDbField;
    FPassConsulta: TCmDbField;
    FPassEnvio: TCmDbField;
    FFlgIntegraOrcWEB: TCmDbField;
    procedure SetModulos(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetPassConsulta(const Value: TCmDbField);
    procedure SetPassEnvio(const Value: TCmDbField);
    procedure SetUrlConsulta(const Value: TCmDbField);
    procedure SetUrlEnvio(const Value: TCmDbField);
    procedure SetUserConsulta(const Value: TCmDbField);
    procedure SetUserEnvio(const Value: TCmDbField);
    procedure SetFlgIntegraOrcWEB(const Value: TCmDbField);

   protected

   public
     property IDPESSOA     : TCmDbField read FIdPessoa     write SetIdPessoa;
     property URLCONSULTA  : TCmDbField read FUrlConsulta  write SetUrlConsulta;
     property USERCONSULTA : TCmDbField read FUserConsulta write SetUserConsulta;
     property PASSCONSULTA : TCmDbField read FPassConsulta write SetPassConsulta;
     property URLENVIO     : TCmDbField read FUrlEnvio     write SetUrlEnvio;
     property USERENVIO    : TCmDbField read FUserEnvio    write SetUserEnvio;
     property PASSENVIO    : TCmDbField read FPassEnvio    write SetPassEnvio;
     Property MODULOS      : TCmDbField read FModulos      write SetModulos;
     property FLGINTEGRAORCWEB : TCmDbField read FFlgIntegraOrcWEB   write SetFlgIntegraOrcWEB;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     function Update :Boolean; Override;
   end;

implementation

{ TDbCampodeparaCC }

constructor TDbIntegraOrcFDO.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMINTEGRAORC';

  FIdPessoa        := CreateCmDbField('IDPESSOA',ftFloat,true,true,False,True,'');
  FUrlConsulta     := CreateCmDbField('URLCONSULTA',ftString,false,false,False,True,'');
  FUserConsulta    := CreateCmDbField('USERCONSULTA',ftString,false,false,False,True,'');
  FPassConsulta    := CreateCmDbField('PASSCONSULTA',ftString,false,false,False,True,'');
  FUrlEnvio        := CreateCmDbField('URLENVIO',ftString,false,false,False,True,'');
  FUserEnvio       := CreateCmDbField('USERENVIO',ftString,false,false,False,True,'');
  FPassEnvio       := CreateCmDbField('PASSENVIO',ftString,false,false,False,True,'');
  FModulos         := CreateCmDbField('MODULOS',ftString,false,false,False,True,'');
  FlgIntegraOrcWEB := CreateCmDbField('FLGINTEGRAORCWEB',ftFloat,false,false,False,True,'');
end;


function TDbIntegraOrcFDO.Update: Boolean;
begin
  Result := Inherited Update;
end;

procedure TDbIntegraOrcFDO.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbIntegraOrcFDO.SetModulos(const Value: TCmDbField);
begin
  FModulos := Value;
end;

procedure TDbIntegraOrcFDO.SetPassConsulta(const Value: TCmDbField);
begin
  FPassConsulta := Value;
end;

procedure TDbIntegraOrcFDO.SetPassEnvio(const Value: TCmDbField);
begin
  FPassEnvio := Value;
end;

procedure TDbIntegraOrcFDO.SetUrlConsulta(const Value: TCmDbField);
begin
  FUrlConsulta := Value;
end;

procedure TDbIntegraOrcFDO.SetUrlEnvio(const Value: TCmDbField);
begin
  FUrlEnvio := Value;
end;

procedure TDbIntegraOrcFDO.SetUserConsulta(const Value: TCmDbField);
begin
  FUserConsulta := Value;
end;

procedure TDbIntegraOrcFDO.SetUserEnvio(const Value: TCmDbField);
begin
  FUserEnvio := Value;
end;

procedure TDbIntegraOrcFDO.SetFlgIntegraOrcWEB(const Value: TCmDbField);
begin
  FFlgIntegraOrcWEB := Value;
end;

end.
 