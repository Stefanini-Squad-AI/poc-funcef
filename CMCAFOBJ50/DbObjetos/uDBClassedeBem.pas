{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 12/03/2002                             }
{                                                       }
{*******************************************************}


{-------------------------------------------------------------------------------
 ----------------------------- Alterações --------------------------------------
 -------------------------------------------------------------------------------
N. SIG..........   : 48344
Data da Alteração: : 17/12/2018
Responsável:       : Everson Cunha
Descrição.......   : Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------}


unit uDBClassedeBem;

interface

Uses uCmDbObject, DB, uCmCustomCdbObject;

Type
  TDBClassedeBem = class(TCmDbObject)

  private
    FAnasint: TCmDbField;
    FIdclassebem: TCmDbField;
    FDescricao: TCmDbField;
    FMascaraidopcional: TCmDbField;
    FCodhierarq: TCmDbField;
    FFlgInventarioTI: TCmDbField;
    procedure SetAnasint(const Value: TCmDbField);
    procedure SetCodhierarq(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetMascaraidopcional(const Value: TCmDbField);
    procedure SetFlgInventarioTI(const Value: TCmDbField);

  public
     Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;
     Property Codhierarq: TCmDbField read FCodhierarq write SetCodhierarq;
     Property Anasint: TCmDbField read FAnasint write SetAnasint;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Mascaraidopcional: TCmDbField read FMascaraidopcional write SetMascaraidopcional;
     Property FlgInventarioTI: TCmDbField read FFlgInventarioTI write SetFlgInventarioTI;       //Everson Cunha - SIG48344

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBClassedeBem }

constructor TDBClassedeBem.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CLASSEDEBEM';

   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,True,True,False,False,'');
   fCodhierarq := CreateCmDbField('CODHIERARQ',ftString,True,False,False,False,'');
   fAnasint := CreateCmDbField('ANASINT',ftString,True,False,False,False,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,False,'');
   fMascaraidopcional := CreateCmDbField('MASCARAIDOPCIONAL',ftString,False,False,False,False,'');
   FFlgInventarioTI := CreateCmDbField('FLGINVENTARIOTI',ftString,False,False,False,False,'');     //Everson Cunha - SIG48344
end;

function TDBClassedeBem.Insert: Boolean;
begin
   fIdclassebem.AsFloat := GetSequence('CLASSEDEBEM');
   Result := Inherited Insert;
end;

function TDBClassedeBem.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBClassedeBem.SetAnasint(const Value: TCmDbField);
begin
   FAnasint := Value;
end;

procedure TDBClassedeBem.SetCodhierarq(const Value: TCmDbField);
begin
   FCodhierarq := Value;
end;

procedure TDBClassedeBem.SetDescricao(const Value: TCmDbField);
begin
   FDescricao := Value;
end;

procedure TDBClassedeBem.SetFlgInventarioTI(const Value: TCmDbField);
begin
  FFlgInventarioTI := Value;
end;

procedure TDBClassedeBem.SetIdclassebem(const Value: TCmDbField);
begin
   FIdclassebem := Value;
end;

procedure TDBClassedeBem.SetMascaraidopcional(const Value: TCmDbField);
begin
   FMascaraidopcional := Value;
end;

end.



