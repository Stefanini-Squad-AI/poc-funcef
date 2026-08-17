{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/09/2005                             }
{                                                       }
{*******************************************************}

unit uDbCollayoutimport;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCollayoutimport = class(TCmDbObject)

  private
    FNomecoluna: TCmDbField;
    FIdcollayoutimport: TCmDbField;
    FTamcoluna: TCmDbField;
    FTipocoluna: TCmDbField;
    FIdlayoutimport: TCmDbField;
    FDesccoluna: TCmDbField;
    FColTabDestino: TCmDbField;
    FLinha: TCmDbField;
    procedure SetDesccoluna(const Value: TCmDbField);
    procedure SetIdcollayoutimport(const Value: TCmDbField);
    procedure SetIdlayoutimport(const Value: TCmDbField);
    procedure SetNomecoluna(const Value: TCmDbField);
    procedure SetTamcoluna(const Value: TCmDbField);
    procedure SetTipocoluna(const Value: TCmDbField);
    procedure SetColTabDestino(const Value: TCmDbField);
    procedure SetLinha(const Value: TCmDbField);

  public

     Property Tipocoluna: TCmDbField read FTipocoluna write SetTipocoluna;
     Property Tamcoluna: TCmDbField read FTamcoluna write SetTamcoluna;
     Property Nomecoluna: TCmDbField read FNomecoluna write SetNomecoluna;
     Property Idlayoutimport: TCmDbField read FIdlayoutimport write SetIdlayoutimport;
     Property Idcollayoutimport: TCmDbField read FIdcollayoutimport write SetIdcollayoutimport;
     Property Desccoluna: TCmDbField read FDesccoluna write SetDesccoluna;
     Property ColTabDestino: TCmDbField read FColTabDestino write SetColTabDestino;
     Property Linha: TCmDbField read FLinha write SetLinha;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCollayoutimport }

constructor TDbCollayoutimport.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COLLAYOUTIMPORT';

  fTipocoluna := CreateCmDbField('TIPOCOLUNA',ftString,False,False,False,True,'');
  fTamcoluna := CreateCmDbField('TAMCOLUNA',ftfloat,False,False,False,True,'');
  fNomecoluna := CreateCmDbField('NOMECOLUNA',ftString,False,False,False,True,'');
  fIdlayoutimport := CreateCmDbField('IDLAYOUTIMPORT',ftfloat,True,True,False,True,'');
  fIdcollayoutimport := CreateCmDbField('IDCOLLAYOUTIMPORT',ftfloat,True,True,False,True,'');
  fDesccoluna := CreateCmDbField('DESCCOLUNA',ftString,False,False,False,True,'');
  fColTabDestino := CreateCmDbField('COLTABDESTINO',ftString,False,False,False,True,'');
  fLinha := CreateCmDbField('LINHA',ftfloat,False,False,False,True,'');
end;

function TDbCollayoutimport.Insert: Boolean;
begin

   fIdcollayoutimport.AsFloat := GetSequence('COLLAYOUTIMPORT');
   Result := Inherited Insert;

end;


procedure TDbCollayoutimport.SetColTabDestino(const Value: TCmDbField);
begin
  FColTabDestino := Value;
end;

procedure TDbCollayoutimport.SetDesccoluna(const Value: TCmDbField);
begin
  FDesccoluna := Value;
end;

procedure TDbCollayoutimport.SetIdcollayoutimport(const Value: TCmDbField);
begin
  FIdcollayoutimport := Value;
end;

procedure TDbCollayoutimport.SetIdlayoutimport(const Value: TCmDbField);
begin
  FIdlayoutimport := Value;
end;

procedure TDbCollayoutimport.SetLinha(const Value: TCmDbField);
begin
  FLinha := Value;
end;

procedure TDbCollayoutimport.SetNomecoluna(const Value: TCmDbField);
begin
  FNomecoluna := Value;
end;

procedure TDbCollayoutimport.SetTamcoluna(const Value: TCmDbField);
begin
  FTamcoluna := Value;
end;

procedure TDbCollayoutimport.SetTipocoluna(const Value: TCmDbField);
begin
  FTipocoluna := Value;
end;

end.



