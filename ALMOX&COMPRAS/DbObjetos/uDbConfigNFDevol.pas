{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 18/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbConfigNFDevol;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConfigNFDevol = class(TCmDbObject)

  private
    FColuna: TCmDbField;
    FIdCampoNFDevol: TCmDbField;
    FIdTemplNFDevol: TCmDbField;
    FLinha: TCmDbField;
    FTamanho: TCmDbField;
    FFlgAlinhamento: TCmDbField;
    FIdConfigNFDevol: TCmDbField;
    procedure SetColuna(const Value: TCmDbField);
    procedure SetFlgAlinhamento(const Value: TCmDbField);
    procedure SetIdCampoNFDevol(const Value: TCmDbField);
    procedure SetIdConfigNFDevol(const Value: TCmDbField);
    procedure SetIdTemplNFDevol(const Value: TCmDbField);
    procedure SetLinha(const Value: TCmDbField);
    procedure SetTamanho(const Value: TCmDbField);

  public
     Property Tamanho         : TCmDbField read FTamanho write SetTamanho;
     Property Linha           : TCmDbField read FLinha write SetLinha;
     Property IdTemplNFDevol  : TCmDbField read FIdTemplNFDevol write SetIdTemplNFDevol;
     Property IdConfigNFDevol : TCmDbField read FIdConfigNFDevol write SetIdConfigNFDevol;
     Property IdCampoNFDevol  : TCmDbField read FIdCampoNFDevol write SetIdCampoNFDevol;
     Property FlgAlinhamento  : TCmDbField read FFlgAlinhamento write SetFlgAlinhamento;
     Property Coluna          : TCmDbField read FColuna write SetColuna;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConfigNFDevol }

constructor TDbConfigNFDevol.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFIGNFDEVOL';

   fTamanho         := CreateCmDbField('TAMANHO',ftfloat,False,False,False,True,'');
   fLinha           := CreateCmDbField('LINHA',ftfloat,False,False,False,True,'');
   fIdtemplnfdevol  := CreateCmDbField('IDTEMPLNFDEVOL',ftfloat,True,False,False,True,'');
   fIdconfignfdevol := CreateCmDbField('IDCONFIGNFDEVOL',ftfloat,True,True,False,True,'');
   fIdcamponfdevol  := CreateCmDbField('IDCAMPONFDEVOL',ftfloat,False,False,False,True,'');
   fFlgalinhamento  := CreateCmDbField('FLGALINHAMENTO',ftString,False,False,False,True,'');
   fColuna          := CreateCmDbField('COLUNA',ftfloat,False,False,False,True,'');
end;

function TDbConfigNFDevol.Insert: Boolean;
begin

   fIdconfignfdevol.AsFloat := GetSequence('CONFIGNFDEVOL');
   Result := Inherited Insert;

end;


procedure TDbConfigNFDevol.SetColuna(const Value: TCmDbField);
begin
  FColuna := Value;
end;

procedure TDbConfigNFDevol.SetFlgAlinhamento(const Value: TCmDbField);
begin
  FFlgAlinhamento := Value;
end;

procedure TDbConfigNFDevol.SetIdCampoNFDevol(const Value: TCmDbField);
begin
  FIdCampoNFDevol := Value;
end;

procedure TDbConfigNFDevol.SetIdConfigNFDevol(const Value: TCmDbField);
begin
  FIdConfigNFDevol := Value;
end;

procedure TDbConfigNFDevol.SetIdTemplNFDevol(const Value: TCmDbField);
begin
  FIdTemplNFDevol := Value;
end;

procedure TDbConfigNFDevol.SetLinha(const Value: TCmDbField);
begin
  FLinha := Value;
end;

procedure TDbConfigNFDevol.SetTamanho(const Value: TCmDbField);
begin
  FTamanho := Value;
end;

end.



