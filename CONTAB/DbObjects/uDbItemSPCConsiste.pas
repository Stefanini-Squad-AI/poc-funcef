{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/05/2004                             }
{                                                       }
{*******************************************************}

unit uDbItemSPCConsiste;
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 14/03/2005
  Pendência    : 18814
  Solução      : Prever saldo de movimentações e saldo atual
                 Novo campo: FLGSALDOOUMOVIM
------------------------------------------------------------------------------}

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbItemSPCConsiste = class(TCmDbObject)

  private
    FIdspcconsiste: TCmDbField;
    FPlano: TCmDbField;
    FIditemspcconsiste: TCmDbField;
    FPlaconta: TCmDbField;
    FFlgsaldooumovim: TCmDbField;
    FDtspcconsiste: TCmDbField;
    procedure SetIditemspcconsiste(const Value: TCmDbField);
    procedure SetIdspcconsiste(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetFlgsaldooumovim(const Value: TCmDbField);
    procedure SetDtspcconsiste(const Value: TCmDbField);

  public

     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idspcconsiste: TCmDbField read FIdspcconsiste write SetIdspcconsiste;
     Property Iditemspcconsiste: TCmDbField read FIditemspcconsiste write SetIditemspcconsiste;
     // Alex 14/03/05
     Property Flgsaldooumovim: TCmDbField read FFlgsaldooumovim write SetFlgsaldooumovim;
     //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Início
     //Criação do campos DTSPCCONSISTE
     Property Dtspcconsiste: TCmDbField read FDtspcconsiste write SetDtspcconsiste;
     //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Fim
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbItemSPCConsiste }

constructor TDbItemSPCConsiste.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMSPCCONSISTE';

   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True,'Plano');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,True,False,False,True,'Conta');
   fIdspcconsiste := CreateCmDbField('IDSPCCONSISTE',ftfloat,True,False,False,True,'Regra de Consistência');
   fIditemspcconsiste := CreateCmDbField('IDITEMSPCCONSISTE',ftfloat,True,True,False,True,'Identificador');
   // Início -  Rodolpho da Silva - P: 19812 - 25/07/2005
   //  Não é possível eixar este campo como Required, pois o mesmo é compartilhado em outra tela
   //Alex 14/03/05 18804
   //FFlgsaldooumovim := CreateCmDbField('FLGSALDOOUMOVIM',ftString,True,False,False,True,'Saldo ou Movimento');
   FFlgsaldooumovim := CreateCmDbField('FLGSALDOOUMOVIM',ftString,False,False,False,True,'Saldo ou Movimento');
   // Fim -  Rodolpho da Silva - P: 19812 - 25/07/2005
   //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Início
   FDtspcconsiste := CreateCmDbField('DTSPCCONSISTE', ftDate, True, False, False, False, '',-1, True);
   //Cássio - SOL Nº 43993 KINTANA Nº 523266 - Fim
end;

function TDbItemSPCConsiste.Insert: Boolean;
begin

   fIditemspcconsiste.AsFloat := GetSequence('ITEMSPCCONSISTE');
   Result := Inherited Insert;

end;


procedure TDbItemSPCConsiste.SetDtspcconsiste(const Value: TCmDbField);
begin
  FDtspcconsiste := Value;
end;

procedure TDbItemSPCConsiste.SetFlgsaldooumovim(const Value: TCmDbField);
begin
  FFlgsaldooumovim := Value;
end;

procedure TDbItemSPCConsiste.SetIditemspcconsiste(const Value: TCmDbField);
begin
  FIditemspcconsiste := Value;
end;

procedure TDbItemSPCConsiste.SetIdspcconsiste(const Value: TCmDbField);
begin
  FIdspcconsiste := Value;
end;

procedure TDbItemSPCConsiste.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbItemSPCConsiste.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

end.



