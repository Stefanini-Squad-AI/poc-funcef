{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbResultSimulaBenef;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbResultSimulaBenef = class(TCmDbObject)

  private
    FIdresult: TCmDbField;
    FIdregra: TCmDbField;
    FFlgativo: TCmDbField;
    FNomepararegra: TCmDbField;
    FFlgvisivel: TCmDbField;
    FTitulo: TCmDbField;
    FFormato: TCmDbField;
    FTipodado: TCmDbField;
    FCampo: TCmDbField;
    FFlgquerypreenche: TCmDbField;
    FValordefault: TCmDbField;
    FQuerypreenche: TCmDbField;
    FOrigemdado: TCmDbField;
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgvisivel(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdresult(const Value: TCmDbField);
    procedure SetNomepararegra(const Value: TCmDbField);
    procedure SetTitulo(const Value: TCmDbField);
    procedure SetFormato(const Value: TCmDbField);
    procedure SetTipodado(const Value: TCmDbField);
    procedure SetCampo(const Value: TCmDbField);
    procedure SetFlgquerypreenche(const Value: TCmDbField);
    procedure SetOrigemdado(const Value: TCmDbField);
    procedure SetQuerypreenche(const Value: TCmDbField);
    procedure SetValordefault(const Value: TCmDbField);

  public

     Property Titulo: TCmDbField read FTitulo write SetTitulo;
     Property Nomepararegra: TCmDbField read FNomepararegra write SetNomepararegra;
     Property Idresult: TCmDbField read FIdresult write SetIdresult;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Flgvisivel: TCmDbField read FFlgvisivel write SetFlgvisivel;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Tipodado: TCmDbField read FTipodado write SetTipodado;
     Property Formato: TCmDbField read FFormato write SetFormato;
     Property Origemdado: TCmDbField read FOrigemdado write SetOrigemdado;
     Property Flgquerypreenche: TCmDbField read FFlgquerypreenche write SetFlgquerypreenche;
     Property Querypreenche: TCmDbField read FQuerypreenche write SetQuerypreenche;
     Property Campo: TCmDbField read FCampo write SetCampo;
     Property Valordefault: TCmDbField read FValordefault write SetValordefault;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbResultSimulaBenef }

constructor TDbResultSimulaBenef.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESULTSIMULABENEF';

   fIdresult := CreateCmDbField('IDRESULT',ftfloat,True,True,False,False,'Id. Result');
   fTitulo := CreateCmDbField('TITULO',ftString,True,False,False,False,'Título');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False,False,False,'Ativo');
   fNomepararegra := CreateCmDbField('NOMEPARAREGRA',ftString,False,False,False,False,'Nome para Regra');
   fFlgvisivel := CreateCmDbField('FLGVISIVEL',ftfloat,True,False,False,False,'Visível');
   fTipodado := CreateCmDbField('TIPODADO',ftString,True,False,False,False,'Tipo de Dado');
   fFormato := CreateCmDbField('FORMATO',ftString,False,False,False,False,'Formato');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'Id. Regra');
   fOrigemdado := CreateCmDbField('ORIGEMDADO',ftString,False,False,False,False,'Formato');
   fFlgquerypreenche := CreateCmDbField('FLGQUERYPREENCHE',ftfloat,False,False,False,False,'Utiliza Query Própria');
   fQuerypreenche := CreateCmDbField('QUERYPREENCHE',ftBlob,False,False,False,False,'Query de Preenchimento');
   fCampo := CreateCmDbField('CAMPO',ftString,False,False,False,False,'Campo');
   fValordefault := CreateCmDbField('VALORDEFAULT',ftString,False,False,False,False,'Conteúdo Fixo');
end;

function TDbResultSimulaBenef.Insert: Boolean;
begin

   fIdresult.AsFloat := GetSequence('RESULTSIMULABENEF');
   Result := Inherited Insert;

end;


procedure TDbResultSimulaBenef.SetCampo(const Value: TCmDbField);
begin
  FCampo := Value;
end;

procedure TDbResultSimulaBenef.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbResultSimulaBenef.SetFlgquerypreenche(
  const Value: TCmDbField);
begin
  FFlgquerypreenche := Value;
end;

procedure TDbResultSimulaBenef.SetFlgvisivel(const Value: TCmDbField);
begin
  FFlgvisivel := Value;
end;

procedure TDbResultSimulaBenef.SetFormato(const Value: TCmDbField);
begin
  FFormato := Value;
end;

procedure TDbResultSimulaBenef.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbResultSimulaBenef.SetIdresult(const Value: TCmDbField);
begin
  FIdresult := Value;
end;

procedure TDbResultSimulaBenef.SetNomepararegra(const Value: TCmDbField);
begin
  FNomepararegra := Value;
end;

procedure TDbResultSimulaBenef.SetOrigemdado(const Value: TCmDbField);
begin
  FOrigemdado := Value;
end;

procedure TDbResultSimulaBenef.SetQuerypreenche(const Value: TCmDbField);
begin
  FQuerypreenche := Value;
end;

procedure TDbResultSimulaBenef.SetTipodado(const Value: TCmDbField);
begin
  FTipodado := Value;
end;

procedure TDbResultSimulaBenef.SetTitulo(const Value: TCmDbField);
begin
  FTitulo := Value;
end;

procedure TDbResultSimulaBenef.SetValordefault(const Value: TCmDbField);
begin
  FValordefault := Value;
end;

end.



