{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbEventoImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

Type
  TDbEventoImovel = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FEvivlrajustado: TCmDbField;
    FEvivlranterior: TCmDbField;
    FEvipercent: TCmDbField;
    FIdimovel: TCmDbField;
    FEvidata: TCmDbField;
    FEvidataprox: TCmDbField;
    FIdcontratoloja: TCmDbField;
    FEvicabecalho: TCmDbField;
    FFlgtipoevento: TCmDbField;
    FEviindicereajuste: TCmDbField;
    FEvidescricao: TCmDbField;
    FIdeventoimovel: TCmDbField;
    procedure SetEvicabecalho(const Value: TCmDbField);
    procedure SetEvidata(const Value: TCmDbField);
    procedure SetEvidataprox(const Value: TCmDbField);
    procedure SetEvidescricao(const Value: TCmDbField);
    procedure SetEviindicereajuste(const Value: TCmDbField);
    procedure SetEvipercent(const Value: TCmDbField);
    procedure SetEvivlrajustado(const Value: TCmDbField);
    procedure SetEvivlranterior(const Value: TCmDbField);
    procedure SetFlgtipoevento(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdcontratoloja(const Value: TCmDbField);
    procedure SetIdeventoimovel(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Ideventoimovel: TCmDbField read FIdeventoimovel write SetIdeventoimovel;
     Property Idcontratoloja: TCmDbField read FIdcontratoloja write SetIdcontratoloja;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Flgtipoevento: TCmDbField read FFlgtipoevento write SetFlgtipoevento;
     Property Evivlranterior: TCmDbField read FEvivlranterior write SetEvivlranterior;
     Property Evivlrajustado: TCmDbField read FEvivlrajustado write SetEvivlrajustado;
     Property Evipercent: TCmDbField read FEvipercent write SetEvipercent;
     Property Eviindicereajuste: TCmDbField read FEviindicereajuste write SetEviindicereajuste;
     Property Evidescricao: TCmDbField read FEvidescricao write SetEvidescricao;
     Property Evidataprox: TCmDbField read FEvidataprox write SetEvidataprox;
     Property Evidata: TCmDbField read FEvidata write SetEvidata;
     Property Evicabecalho: TCmDbField read FEvicabecalho write SetEvicabecalho;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEventoImovel }

constructor TDbEventoImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EVENTOIMOVEL';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'ID do Imovel');
   fIdeventoimovel := CreateCmDbField('IDEVENTOIMOVEL',ftfloat,True,True,False,True,'');
   fIdcontratoloja := CreateCmDbField('IDCONTRATOLOJA',ftfloat,False,False,False,True,'ID do Contrato da Loja');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'ID do Contrato do Imovel');
   fFlgtipoevento := CreateCmDbField('FLGTIPOEVENTO',ftString,False,False,False,True,'');
   fEvivlranterior := CreateCmDbField('EVIVLRANTERIOR',ftfloat,False,False,False,True,'Valor do Aluguel Anterior');
   fEvivlrajustado := CreateCmDbField('EVIVLRAJUSTADO',ftfloat,False,False,False,True,'Valor do Aluguel Reajustado');
   fEvipercent := CreateCmDbField('EVIPERCENT',ftfloat,False,False,False,True,'Perc. de Reajuste do Aluguel');
   fEviindicereajuste := CreateCmDbField('EVIINDICEREAJUSTE',ftfloat,False,False,False,True,'Indice de Reajuste do Aluguel');
   fEvidescricao := CreateCmDbField('EVIDESCRICAO',ftString,False,False,False,True,'Descrição do Evento');
   fEvidataprox := CreateCmDbField('EVIDATAPROX',ftDateTime,False,False,False,True,'');
   fEvidata := CreateCmDbField('EVIDATA',ftDateTime,True,False,False,True,'Data do Evento');
   fEvicabecalho := CreateCmDbField('EVICABECALHO',ftString,True,False,False,True,'Cabeçalho do Evento');
end;

function TDbEventoImovel.Insert: Boolean;
begin

   fIdeventoimovel.AsFloat := GetSequence('EVENTOIMOVEL');
   Result := Inherited Insert;

end;


procedure TDbEventoImovel.SetEvicabecalho(const Value: TCmDbField);
begin
  FEvicabecalho := Value;
end;

procedure TDbEventoImovel.SetEvidata(const Value: TCmDbField);
begin
  FEvidata := Value;
end;

procedure TDbEventoImovel.SetEvidataprox(const Value: TCmDbField);
begin
  FEvidataprox := Value;
end;

procedure TDbEventoImovel.SetEvidescricao(const Value: TCmDbField);
begin
  FEvidescricao := Value;
end;

procedure TDbEventoImovel.SetEviindicereajuste(const Value: TCmDbField);
begin
  FEviindicereajuste := Value;
end;

procedure TDbEventoImovel.SetEvipercent(const Value: TCmDbField);
begin
  FEvipercent := Value;
end;

procedure TDbEventoImovel.SetEvivlrajustado(const Value: TCmDbField);
begin
  FEvivlrajustado := Value;
end;

procedure TDbEventoImovel.SetEvivlranterior(const Value: TCmDbField);
begin
  FEvivlranterior := Value;
end;

procedure TDbEventoImovel.SetFlgtipoevento(const Value: TCmDbField);
begin
  FFlgtipoevento := Value;
end;

procedure TDbEventoImovel.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbEventoImovel.SetIdcontratoloja(const Value: TCmDbField);
begin
  FIdcontratoloja := Value;
end;

procedure TDbEventoImovel.SetIdeventoimovel(const Value: TCmDbField);
begin
  FIdeventoimovel := Value;
end;

procedure TDbEventoImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbEventoImovel.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



