{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 11/05/2004                             }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: (dfm)
Nº SIG...........: 125120     
Data da Alteração: 09/11/2022
Responsável......: Leandro Pocebon
Descrição........: Inclusão da aba anexos.
--------------------------------------------------------------------------------}
unit uDBImagemBem;

interface 

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBImagemBem = class(TCmDbObject)

  private
    FIdimagem: TCmDbField;
    FImagem: TCmDbField;
    FDescrimagem: TCmDbField;
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetImagem(const Value: TCmDbField);
    procedure SetDescrimagem(const Value: TCmDbField);

  public
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Imagem: TCmDbField read FImagem write SetImagem;
     Property Descrimagem: TCmDbField read FDescrimagem write SetDescrimagem;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBImagemBem }

constructor TDBImagemBem.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'IMAGENS';

   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,True,True,False,True,'');
   fImagem := CreateCmDbField('IMAGEM',ftBlob,False,False,False,True,'');
   fDescrImagem := CreateCmDbField('DESCRIMAGEM',ftString,False,False,False,True,'');
end;

function TDBImagemBem.Insert: Boolean;
begin
   fIdimagem.AsFloat := GetSequence('IMAGENS');
   Result := Inherited Insert;
end;

procedure TDBImagemBem.SetDescrimagem(const Value: TCmDbField);
begin
   FDescrimagem := Value;
end;

procedure TDBImagemBem.SetIdimagem(const Value: TCmDbField);
begin
   FIdimagem := Value;
end;

procedure TDBImagemBem.SetImagem(const Value: TCmDbField);
begin
   FImagem := Value;
end;

end.

