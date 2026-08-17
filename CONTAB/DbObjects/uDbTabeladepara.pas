{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 19/08/2002                             }
{                                                       }
{*******************************************************}

{===============================================================================
Analista.....: Ricardo Alves
SOL..........: 124343
KINTANA......: 630539
Data.........: 06/10/2009
Descrição....: Modificação do processamento do De/Para de plano de contas para que o 
  processamento das tabelas de configuração levem em consideração os três novos
  campos de indicação de período do cadastro de De/Para.
}

unit uDbTabeladepara;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTabeladepara = class(TCmDbObject)

  private
    FIdtabelaref: TCmDbField;
    FIdtabeladepara: TCmDbField;
    FNometabela: TCmDbField;
    FNomecampoplano: TCmDbField;

    // Ricardo A. SOL 124343 KTN 630539
    FAnoDePara: TCmDbField;
    FMesDePara: TCmDbField;
    FDataDePara: TCmDbField;

    procedure SetIdtabeladepara(const Value: TCmDbField);
    procedure SetIdtabelaref(const Value: TCmDbField);
    procedure SetNomecampoplano(const Value: TCmDbField);
    procedure SetNometabela(const Value: TCmDbField);

    // Ricardo A. SOL 124343 KTN 630539
    procedure SetAnoDePara(const Value: TCmDbField);
    procedure SetMesDePara(const Value: TCmDbField);
    procedure SetDataDePara(const Value: TCmDbField);

  public

     Property Nometabela: TCmDbField read FNometabela write SetNometabela;
     Property Nomecampoplano: TCmDbField read FNomecampoplano write SetNomecampoplano;
     Property Idtabelaref: TCmDbField read FIdtabelaref write SetIdtabelaref;
     Property Idtabeladepara: TCmDbField read FIdtabeladepara write SetIdtabeladepara;

     // Ricardo A. SOL 124343 KTN 630539
     property AnoDePara: TCmDbField read FAnoDePara write SetAnoDePara;
     property MesDePara: TCmDbField read FMesDePara write SetMesDePara;
     property DataDePara: TCmDbField read FDataDePara write SetDataDePara;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTabeladepara }

constructor TDbTabeladepara.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABELADEPARA';

   fNometabela     := CreateCmDbField('NOMETABELA',ftString,False,False,False,True,'');
   fNomecampoplano := CreateCmDbField('NOMECAMPOPLANO',ftString,False,False,False,True,'');
   fIdtabelaref    := CreateCmDbField('IDTABELAREF',ftfloat,False,False,False,True,'');
   fIdtabeladepara := CreateCmDbField('IDTABELADEPARA',ftfloat,True,True,False,True,'');

   // Ricardo A. SOL 124343 KTN 630539
   FDataDePara   := CreateCmDbField('DATADEPARA',ftString,False,False,False,True,'');
   FAnoDePara    := CreateCmDbField('ANODEPARA',ftString,False,False,False,True,'');
   FMesDePara    := CreateCmDbField('MESDEPARA',ftString,False,False,False,True,'');

end;

function TDbTabeladepara.Insert: Boolean;
begin

   fIdtabeladepara.AsFloat := GetSequence('TABELADEPARA');
   Result := Inherited Insert;

end;


procedure TDbTabeladepara.SetAnoDePara(const Value: TCmDbField);
begin
  FAnoDePara := Value;
end;

procedure TDbTabeladepara.SetDataDePara(const Value: TCmDbField);
begin
  FDataDePara := Value;
end;

procedure TDbTabeladepara.SetIdtabeladepara(const Value: TCmDbField);
begin
  FIdtabeladepara := Value;
end;

procedure TDbTabeladepara.SetIdtabelaref(const Value: TCmDbField);
begin
  FIdtabelaref := Value;
end;

procedure TDbTabeladepara.SetMesDePara(const Value: TCmDbField);
begin
  FMesDePara := Value;
end;

procedure TDbTabeladepara.SetNomecampoplano(const Value: TCmDbField);
begin
  FNomecampoplano := Value;
end;

procedure TDbTabeladepara.SetNometabela(const Value: TCmDbField);
begin
  FNometabela := Value;
end;

end.



