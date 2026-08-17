{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbPlanilha;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPlanilha = class(TCmDbObject)

  private
    FPlnefetivado: TCmDbField;
    FPerexercicio: TCmDbField;
    FPlntotcregeren2: TCmDbField;
    FPlndatdia: TCmDbField;
    FPancodigo: TCmDbField;
    FPlntotdebhist: TCmDbField;
    FPlnemuso: TCmDbField;
    FPlntotcrehist: TCmDbField;
    FPlnnumlan: TCmDbField;
    FPlncodigo: TCmDbField;
    FPlntotcre: TCmDbField;
    FPlntotdebgeren1: TCmDbField;
    FPlntotdeboficial: TCmDbField;
    FPlntotcregeren1: TCmDbField;
    FPernumero: TCmDbField;
    FIdmodulo: TCmDbField;
    FPlntotdebgeren2: TCmDbField;
    FPlntotdeb: TCmDbField;
    FIdpessoa: TCmDbField;
    FPlntotdebger: TCmDbField;
    FPlntotcreoficial: TCmDbField;
    FLotetransmissao: TCmDbField;
    FPlnreferencia: TCmDbField;
    FPlnplanestorno: TCmDbField;
    FPlntotcreger: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FTipcodigo: TCmDbField;
    FPlnplanil: TCmDbField;
    FIdLoteExportaCTB: TCmDbField;
    FNumLanSegrega: TCmDbField;
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetLotetransmissao(const Value: TCmDbField);
    procedure SetPancodigo(const Value: TCmDbField);
    procedure SetPerexercicio(const Value: TCmDbField);
    procedure SetPernumero(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetPlndatdia(const Value: TCmDbField);
    procedure SetPlnefetivado(const Value: TCmDbField);
    procedure SetPlnemuso(const Value: TCmDbField);
    procedure SetPlnnumlan(const Value: TCmDbField);
    procedure SetPlnplanestorno(const Value: TCmDbField);
    procedure SetPlnplanil(const Value: TCmDbField);
    procedure SetPlnreferencia(const Value: TCmDbField);
    procedure SetPlntotcre(const Value: TCmDbField);
    procedure SetPlntotcreger(const Value: TCmDbField);
    procedure SetPlntotcregeren1(const Value: TCmDbField);
    procedure SetPlntotcregeren2(const Value: TCmDbField);
    procedure SetPlntotcrehist(const Value: TCmDbField);
    procedure SetPlntotcreoficial(const Value: TCmDbField);
    procedure SetPlntotdeb(const Value: TCmDbField);
    procedure SetPlntotdebger(const Value: TCmDbField);
    procedure SetPlntotdebgeren1(const Value: TCmDbField);
    procedure SetPlntotdebgeren2(const Value: TCmDbField);
    procedure SetPlntotdebhist(const Value: TCmDbField);
    procedure SetPlntotdeboficial(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetIdLoteExportaCTB(const Value: TCmDbField);
    procedure SetNumLanSegrega(const Value: TCmDbField);

  public

     // Alex 01/02/07 23897 - Armazena o Total de Lançamentos da MEMOCALCSEGREGA
     // plara gerar o novo lacnumlan nela
     Property NumLanSegrega : TCmDbField read FNumLanSegrega write SetNumLanSegrega;

     Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
     Property Plntotdeboficial: TCmDbField read FPlntotdeboficial write SetPlntotdeboficial;
     Property Plntotdebhist: TCmDbField read FPlntotdebhist write SetPlntotdebhist;
     Property Plntotdebgeren2: TCmDbField read FPlntotdebgeren2 write SetPlntotdebgeren2;
     Property Plntotdebgeren1: TCmDbField read FPlntotdebgeren1 write SetPlntotdebgeren1;
     Property Plntotdebger: TCmDbField read FPlntotdebger write SetPlntotdebger;
     Property Plntotdeb: TCmDbField read FPlntotdeb write SetPlntotdeb;
     Property Plntotcreoficial: TCmDbField read FPlntotcreoficial write SetPlntotcreoficial;
     Property Plntotcrehist: TCmDbField read FPlntotcrehist write SetPlntotcrehist;
     Property Plntotcregeren2: TCmDbField read FPlntotcregeren2 write SetPlntotcregeren2;
     Property Plntotcregeren1: TCmDbField read FPlntotcregeren1 write SetPlntotcregeren1;
     Property Plntotcreger: TCmDbField read FPlntotcreger write SetPlntotcreger;
     Property Plntotcre: TCmDbField read FPlntotcre write SetPlntotcre;
     Property Plnreferencia: TCmDbField read FPlnreferencia write SetPlnreferencia;
     Property Plnplanil: TCmDbField read FPlnplanil write SetPlnplanil;
     Property Plnplanestorno: TCmDbField read FPlnplanestorno write SetPlnplanestorno;
     Property Plnnumlan: TCmDbField read FPlnnumlan write SetPlnnumlan;
     Property Plnemuso: TCmDbField read FPlnemuso write SetPlnemuso;
     Property Plnefetivado: TCmDbField read FPlnefetivado write SetPlnefetivado;
     Property Plndatdia: TCmDbField read FPlndatdia write SetPlndatdia;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Pernumero: TCmDbField read FPernumero write SetPernumero;
     Property Perexercicio: TCmDbField read FPerexercicio write SetPerexercicio;
     Property Pancodigo: TCmDbField read FPancodigo write SetPancodigo;
     Property Lotetransmissao: TCmDbField read FLotetransmissao write SetLotetransmissao;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property IdLoteExportaCTB: TCmDbField read FIdLoteExportaCTB write SetIdLoteExportaCTB;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanilha }

constructor TDbPlanilha.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANILHA';

   // Alex 01/02/07 23897 - Armazena o Total de Lançamentos da MEMOCALCSEGREGA
   // plara gerar o novo lacnumlan nela
   FNumLanSegrega := CreateCmDbField('NUMLANSEGREGA',ftfloat,False,False,False,false);

   fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True);
   fPlntotdeboficial := CreateCmDbField('PLNTOTDEBOFICIAL',ftfloat,False,False,False,False,'',2);
   fPlntotdebhist := CreateCmDbField('PLNTOTDEBHIST',ftfloat,False,False,False,False,'',2);
   fPlntotdebgeren2 := CreateCmDbField('PLNTOTDEBGEREN2',ftfloat,False,False,False,False,'',2);
   fPlntotdebgeren1 := CreateCmDbField('PLNTOTDEBGEREN1',ftfloat,False,False,False,False,'',2);
   fPlntotdebger := CreateCmDbField('PLNTOTDEBGER',ftfloat,False,False,False,False,'',2);
   fPlntotdeb := CreateCmDbField('PLNTOTDEB',ftfloat,False,False,False,False,'',2);
   fPlntotcreoficial := CreateCmDbField('PLNTOTCREOFICIAL',ftfloat,False,False,False,False,'',2);
   fPlntotcrehist := CreateCmDbField('PLNTOTCREHIST',ftfloat,False,False,False,False,'',2);
   fPlntotcregeren2 := CreateCmDbField('PLNTOTCREGEREN2',ftfloat,False,False,False,False,'',2);
   fPlntotcregeren1 := CreateCmDbField('PLNTOTCREGEREN1',ftfloat,False,False,False,False,'',2);
   fPlntotcreger := CreateCmDbField('PLNTOTCREGER',ftfloat,False,False,False,False,'',2);
   fPlntotcre := CreateCmDbField('PLNTOTCRE',ftfloat,False,False,False,False,'',2);
   fPlnreferencia := CreateCmDbField('PLNREFERENCIA',ftfloat,False,False,False,True);
   fPlnplanil := CreateCmDbField('PLNPLANIL',ftfloat,False,False,False,True);
   fPlnplanestorno := CreateCmDbField('PLNPLANESTORNO',ftfloat,False,False,False,True);
   fPlnnumlan := CreateCmDbField('PLNNUMLAN',ftfloat,False,False,False,false);
   fPlnemuso := CreateCmDbField('PLNEMUSO',ftfloat,False,False,False,True);
   fPlnefetivado := CreateCmDbField('PLNEFETIVADO',ftString,False,False,False,True);
   fPlndatdia := CreateCmDbField('PLNDATDIA',ftDateTime,True,False,False,True);
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,True,True,False,True);

   // SOL 129666 KTN 713177 Ricardo A.
   fPernumero := CreateCmDbField('PERNUMERO',ftfloat,False,False,False,False);
   // FIM SOL 129666 KTN 713177 Ricardo A.

   fPerexercicio := CreateCmDbField('PEREXERCICIO',ftfloat,True,False,False,True);
   fPancodigo := CreateCmDbField('PANCODIGO',ftfloat,False,False,False,True);
   fLotetransmissao := CreateCmDbField('LOTETRANSMISSAO',ftfloat,False,False,False,True);
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True);
   FIdLoteExportaCTB := CreateCmDbField('IDLOTEEXPORTACTB',ftfloat,False,False,False,True);
end;

function TDbPlanilha.Insert: Boolean;
begin

   fPlncodigo.AsFloat := GetSequence('PLANILHA');
   Result := Inherited Insert;

end;

function TDbPlanilha.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPlanilha.SetIdLoteExportaCTB(const Value: TCmDbField);
begin
  FIdLoteExportaCTB := Value;
end;

procedure TDbPlanilha.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbPlanilha.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanilha.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbPlanilha.SetLotetransmissao(const Value: TCmDbField);
begin
  FLotetransmissao := Value;
end;

procedure TDbPlanilha.SetNumLanSegrega(const Value: TCmDbField);
begin
  FNumLanSegrega := Value;
end;

procedure TDbPlanilha.SetPancodigo(const Value: TCmDbField);
begin
  FPancodigo := Value;
end;

procedure TDbPlanilha.SetPerexercicio(const Value: TCmDbField);
begin
  FPerexercicio := Value;
end;

procedure TDbPlanilha.SetPernumero(const Value: TCmDbField);
begin
  FPernumero := Value;
end;

procedure TDbPlanilha.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbPlanilha.SetPlndatdia(const Value: TCmDbField);
begin
  FPlndatdia := Value;
end;

procedure TDbPlanilha.SetPlnefetivado(const Value: TCmDbField);
begin
  FPlnefetivado := Value;
end;

procedure TDbPlanilha.SetPlnemuso(const Value: TCmDbField);
begin
  FPlnemuso := Value;
end;

procedure TDbPlanilha.SetPlnnumlan(const Value: TCmDbField);
begin
  FPlnnumlan := Value;
end;

procedure TDbPlanilha.SetPlnplanestorno(const Value: TCmDbField);
begin
  FPlnplanestorno := Value;
end;

procedure TDbPlanilha.SetPlnplanil(const Value: TCmDbField);
begin
  FPlnplanil := Value;
end;

procedure TDbPlanilha.SetPlnreferencia(const Value: TCmDbField);
begin
  FPlnreferencia := Value;
end;

procedure TDbPlanilha.SetPlntotcre(const Value: TCmDbField);
begin
  FPlntotcre := Value;
end;

procedure TDbPlanilha.SetPlntotcreger(const Value: TCmDbField);
begin
  FPlntotcreger := Value;
end;

procedure TDbPlanilha.SetPlntotcregeren1(const Value: TCmDbField);
begin
  FPlntotcregeren1 := Value;
end;

procedure TDbPlanilha.SetPlntotcregeren2(const Value: TCmDbField);
begin
  FPlntotcregeren2 := Value;
end;

procedure TDbPlanilha.SetPlntotcrehist(const Value: TCmDbField);
begin
  FPlntotcrehist := Value;
end;

procedure TDbPlanilha.SetPlntotcreoficial(const Value: TCmDbField);
begin
  FPlntotcreoficial := Value;
end;

procedure TDbPlanilha.SetPlntotdeb(const Value: TCmDbField);
begin
  FPlntotdeb := Value;
end;

procedure TDbPlanilha.SetPlntotdebger(const Value: TCmDbField);
begin
  FPlntotdebger := Value;
end;

procedure TDbPlanilha.SetPlntotdebgeren1(const Value: TCmDbField);
begin
  FPlntotdebgeren1 := Value;
end;

procedure TDbPlanilha.SetPlntotdebgeren2(const Value: TCmDbField);
begin
  FPlntotdebgeren2 := Value;
end;

procedure TDbPlanilha.SetPlntotdebhist(const Value: TCmDbField);
begin
  FPlntotdebhist := Value;
end;

procedure TDbPlanilha.SetPlntotdeboficial(const Value: TCmDbField);
begin
  FPlntotdeboficial := Value;
end;

procedure TDbPlanilha.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

end.



