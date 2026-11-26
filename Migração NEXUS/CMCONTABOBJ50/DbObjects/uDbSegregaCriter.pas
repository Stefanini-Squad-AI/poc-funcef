{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbSegregaCriter;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSegregaCriter = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FFlgtiposegrega: TCmDbField;
    FTipcodigo: TCmDbField;
    FHitcodhist: TCmDbField;
    FOrdem: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgtipocotacao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgtipocotacao(const Value: TCmDbField);
    procedure SetFlgtiposegrega(const Value: TCmDbField);
    procedure SetHitcodhist(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);

  public

     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Hitcodhist: TCmDbField read FHitcodhist write SetHitcodhist;
     Property Flgtiposegrega: TCmDbField read FFlgtiposegrega write SetFlgtiposegrega;
     Property Flgtipocotacao: TCmDbField read FFlgtipocotacao write SetFlgtipocotacao;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSegregaCriter }

constructor TDbSegregaCriter.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGREGACRITER';

   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,True,'');
   fIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fHitcodhist := CreateCmDbField('HITCODHIST',ftString,False,False,False,True,'');
   fFlgtiposegrega := CreateCmDbField('FLGTIPOSEGREGA',ftString,False,False,False,True,'');
   fFlgtipocotacao := CreateCmDbField('FLGTIPOCOTACAO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbSegregaCriter.Insert: Boolean;
begin

   fIdsegregacriter.AsFloat := GetSequence('SEGREGACRITER');
   Result := Inherited Insert;

end;


procedure TDbSegregaCriter.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSegregaCriter.SetFlgtipocotacao(const Value: TCmDbField);
begin
  FFlgtipocotacao := Value;
end;

procedure TDbSegregaCriter.SetFlgtiposegrega(const Value: TCmDbField);
begin
  FFlgtiposegrega := Value;
end;

procedure TDbSegregaCriter.SetHitcodhist(const Value: TCmDbField);
begin
  FHitcodhist := Value;
end;

procedure TDbSegregaCriter.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbSegregaCriter.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbSegregaCriter.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

procedure TDbSegregaCriter.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

end.



