{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2002                             }
{ Atualizado Em: 22.05.2003 - Flavio Dias               }
{*******************************************************}

unit uDbRadtipoprocesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadtipoprocesso = class(TCmDbObject)

  private
    FNumdiasprevisto: TCmDbField;
    FObsproc: TCmDbField;
    FFlgcentcust: TCmDbField;
    FIdgrupoprocesso: TCmDbField;
    FIdreferencia: TCmDbField;
    FIdtipoprocesso: TCmDbField;
    FDescricao: TCmDbField;
    FFlggrupprod: TCmDbField;
    FIdgrpconsulta: TCmDbField;
    FNome: TCmDbField;
    FIdgrpgestor: TCmDbField;
    FFlgcentrespon: TCmDbField;
    FIdgrpcriaprocesso: TCmDbField;
    FFlgunidnegoc: TCmDbField;
    FGraugrupprod: TCmDbField;
    FFlgvalor: TCmDbField;
    FValMinimo : TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgcentcust(const Value: TCmDbField);
    procedure SetFlgcentrespon(const Value: TCmDbField);
    procedure SetFlggrupprod(const Value: TCmDbField);
    procedure SetFlgunidnegoc(const Value: TCmDbField);
    procedure SetFlgvalor(const Value: TCmDbField);
    procedure SetGraugrupprod(const Value: TCmDbField);
    procedure SetValMinimo(const Value: TCmDbField);
    procedure SetIdgrpconsulta(const Value: TCmDbField);
    procedure SetIdgrpcriaprocesso(const Value: TCmDbField);
    procedure SetIdgrpgestor(const Value: TCmDbField);
    procedure SetIdgrupoprocesso(const Value: TCmDbField);
    procedure SetIdreferencia(const Value: TCmDbField);
    procedure SetIdtipoprocesso(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumdiasprevisto(const Value: TCmDbField);
    procedure SetObsproc(const Value: TCmDbField);

  public

     Property Obsproc: TCmDbField read FObsproc write SetObsproc;
     Property Numdiasprevisto: TCmDbField read FNumdiasprevisto write SetNumdiasprevisto;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idtipoprocesso: TCmDbField read FIdtipoprocesso write SetIdtipoprocesso;
     Property Idreferencia: TCmDbField read FIdreferencia write SetIdreferencia;
     Property Idgrupoprocesso: TCmDbField read FIdgrupoprocesso write SetIdgrupoprocesso;
     Property Idgrpgestor: TCmDbField read FIdgrpgestor write SetIdgrpgestor;
     Property Idgrpcriaprocesso: TCmDbField read FIdgrpcriaprocesso write SetIdgrpcriaprocesso;
     Property Idgrpconsulta: TCmDbField read FIdgrpconsulta write SetIdgrpconsulta;
     Property Graugrupprod: TCmDbField read FGraugrupprod write SetGraugrupprod;
     Property ValMinimo: TCmDbField read FValMinimo write SetValMinimo;     
     Property Flgvalor: TCmDbField read FFlgvalor write SetFlgvalor;
     Property Flgunidnegoc: TCmDbField read FFlgunidnegoc write SetFlgunidnegoc;
     Property Flggrupprod: TCmDbField read FFlggrupprod write SetFlggrupprod;
     Property Flgcentrespon: TCmDbField read FFlgcentrespon write SetFlgcentrespon;
     Property Flgcentcust: TCmDbField read FFlgcentcust write SetFlgcentcust;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadtipoprocesso }

constructor TDbRadtipoprocesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADTIPOPROCESSO';

   fObsproc           := CreateCmDbField('OBSPROC',ftString,False,False,False,True,'');
   fNumdiasprevisto   := CreateCmDbField('NUMDIASPREVISTO',ftfloat,False,False,False,False,'');
   fNome              := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fIdtipoprocesso    := CreateCmDbField('IDTIPOPROCESSO',ftfloat,True,True,False,True,'');
   fIdreferencia      := CreateCmDbField('IDREFERENCIA',ftfloat,False,False,False,True,'');
   fIdgrupoprocesso   := CreateCmDbField('IDGRUPOPROCESSO',ftfloat,False,False,False,True,'');
   fIdgrpgestor       := CreateCmDbField('IDGRPGESTOR',ftfloat,False,False,False,True,'');
   fIdgrpcriaprocesso := CreateCmDbField('IDGRPCRIAPROCESSO',ftfloat,False,False,False,True,'');
   fIdgrpconsulta     := CreateCmDbField('IDGRPCONSULTA',ftfloat,False,False,False,True,'');
   fGraugrupprod      := CreateCmDbField('GRAUGRUPPROD',ftfloat,False,False,False,False,'');
   fValMinimo         := CreateCmDbField('VALMINIMO',ftfloat,False,False,False,False,'');
   fFlgvalor          := CreateCmDbField('FLGVALOR',ftString,False,False,False,True,'');
   fFlgunidnegoc      := CreateCmDbField('FLGUNIDNEGOC',ftString,False,False,False,True,'');
   fFlggrupprod       := CreateCmDbField('FLGGRUPPROD',ftString,False,False,False,True,'');
   fFlgcentrespon     := CreateCmDbField('FLGCENTRESPON',ftString,False,False,False,True,'');
   fFlgcentcust       := CreateCmDbField('FLGCENTCUST',ftString,False,False,False,True,'');
   fDescricao         := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbRadtipoprocesso.Insert: Boolean;
begin

   fIdtipoprocesso.AsFloat := GetSequence('RADTIPOPROCESSO');
   Result := Inherited Insert;

end;


procedure TDbRadtipoprocesso.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbRadtipoprocesso.SetFlgcentcust(const Value: TCmDbField);
begin
  FFlgcentcust := Value;
end;

procedure TDbRadtipoprocesso.SetFlgcentrespon(const Value: TCmDbField);
begin
  FFlgcentrespon := Value;
end;

procedure TDbRadtipoprocesso.SetFlggrupprod(const Value: TCmDbField);
begin
  FFlggrupprod := Value;
end;

procedure TDbRadtipoprocesso.SetFlgunidnegoc(const Value: TCmDbField);
begin
  FFlgunidnegoc := Value;
end;

procedure TDbRadtipoprocesso.SetFlgvalor(const Value: TCmDbField);
begin
  FFlgvalor := Value;
end;

procedure TDbRadtipoprocesso.SetGraugrupprod(const Value: TCmDbField);
begin
  FGraugrupprod := Value;
end;

procedure TDbRadtipoprocesso.SetValMinimo(const Value: TCmDbField);
begin
  FValMinimo := Value;
end;

procedure TDbRadtipoprocesso.SetIdgrpconsulta(const Value: TCmDbField);
begin
  FIdgrpconsulta := Value;
end;

procedure TDbRadtipoprocesso.SetIdgrpcriaprocesso(const Value: TCmDbField);
begin
  FIdgrpcriaprocesso := Value;
end;

procedure TDbRadtipoprocesso.SetIdgrpgestor(const Value: TCmDbField);
begin
  FIdgrpgestor := Value;
end;

procedure TDbRadtipoprocesso.SetIdgrupoprocesso(const Value: TCmDbField);
begin
  FIdgrupoprocesso := Value;
end;

procedure TDbRadtipoprocesso.SetIdreferencia(const Value: TCmDbField);
begin
  FIdreferencia := Value;
end;

procedure TDbRadtipoprocesso.SetIdtipoprocesso(const Value: TCmDbField);
begin
  FIdtipoprocesso := Value;
end;

procedure TDbRadtipoprocesso.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbRadtipoprocesso.SetNumdiasprevisto(const Value: TCmDbField);
begin
  FNumdiasprevisto := Value;
end;

procedure TDbRadtipoprocesso.SetObsproc(const Value: TCmDbField);
begin
  FObsproc := Value;
end;

end.



