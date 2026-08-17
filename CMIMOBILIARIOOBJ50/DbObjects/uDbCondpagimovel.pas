{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbCondpagimovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCondpagimovel = class(TCmDbObject)

  private
    FAtrasomulta: TCmDbField;
    FAtrasoindcorrec: TCmDbField;
    FMesrefreajuste: TCmDbField;
    FFlgcmmensal: TCmDbField;
    FTipocondpag: TCmDbField;
    FIdcondpagimovel: TCmDbField;
    FIdformacalcimob: TCmDbField;
    FPeriodotaxa: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FPeriodo: TCmDbField;
    FDataini: TCmDbField;
    FDatacarencia: TCmDbField;
    FPrazo: TCmDbField;
    FDatavencimento: TCmDbField;
    FIdcondinicial: TCmDbField;
    FFlgsinal: TCmDbField;
    FDatafim: TCmDbField;
    FTaxajuros: TCmDbField;
    FIndcorrecao: TCmDbField;
    FIdindcorrproj: TCmDbField;
    FFlgreajmensal: TCmDbField;
    FAtrasotxjuros: TCmDbField;
    FFormacalculo: TCmDbField;
    FVlrfinanc: TCmDbField;
    FIdrepactua: TCmDbField;
    FNumparcelas: TCmDbField;
    FPerindproj: TCmDbField;
    FPeriodoreajuste: TCmDbField;
    FDatainiamortiz: TCmDbField;
    FFlgjurcarencia: TCmDbField;
    procedure SetAtrasoindcorrec(const Value: TCmDbField);
    procedure SetAtrasomulta(const Value: TCmDbField);
    procedure SetAtrasotxjuros(const Value: TCmDbField);
    procedure SetDatacarencia(const Value: TCmDbField);
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDataini(const Value: TCmDbField);
    procedure SetDatainiamortiz(const Value: TCmDbField);
    procedure SetDatavencimento(const Value: TCmDbField);
    procedure SetFlgcmmensal(const Value: TCmDbField);
    procedure SetFlgjurcarencia(const Value: TCmDbField);
    procedure SetFlgreajmensal(const Value: TCmDbField);
    procedure SetFlgsinal(const Value: TCmDbField);
    procedure SetFormacalculo(const Value: TCmDbField);
    procedure SetIdcondinicial(const Value: TCmDbField);
    procedure SetIdcondpagimovel(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdformacalcimob(const Value: TCmDbField);
    procedure SetIdindcorrproj(const Value: TCmDbField);
    procedure SetIdrepactua(const Value: TCmDbField);
    procedure SetIndcorrecao(const Value: TCmDbField);
    procedure SetMesrefreajuste(const Value: TCmDbField);
    procedure SetNumparcelas(const Value: TCmDbField);
    procedure SetPerindproj(const Value: TCmDbField);
    procedure SetPeriodo(const Value: TCmDbField);
    procedure SetPeriodoreajuste(const Value: TCmDbField);
    procedure SetPeriodotaxa(const Value: TCmDbField);
    procedure SetPrazo(const Value: TCmDbField);
    procedure SetTaxajuros(const Value: TCmDbField);
    procedure SetTipocondpag(const Value: TCmDbField);
    procedure SetVlrfinanc(const Value: TCmDbField);

  public

     Property Vlrfinanc: TCmDbField read FVlrfinanc write SetVlrfinanc;
     Property Tipocondpag: TCmDbField read FTipocondpag write SetTipocondpag;
     Property Taxajuros: TCmDbField read FTaxajuros write SetTaxajuros;
     Property Prazo: TCmDbField read FPrazo write SetPrazo;
     Property Periodotaxa: TCmDbField read FPeriodotaxa write SetPeriodotaxa;
     Property Periodoreajuste: TCmDbField read FPeriodoreajuste write SetPeriodoreajuste;
     Property Periodo: TCmDbField read FPeriodo write SetPeriodo;
     Property Perindproj: TCmDbField read FPerindproj write SetPerindproj;
     Property Numparcelas: TCmDbField read FNumparcelas write SetNumparcelas;
     Property Mesrefreajuste: TCmDbField read FMesrefreajuste write SetMesrefreajuste;
     Property Indcorrecao: TCmDbField read FIndcorrecao write SetIndcorrecao;
     Property Idrepactua: TCmDbField read FIdrepactua write SetIdrepactua;
     Property Idindcorrproj: TCmDbField read FIdindcorrproj write SetIdindcorrproj;
     Property Idformacalcimob: TCmDbField read FIdformacalcimob write SetIdformacalcimob;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idcondpagimovel: TCmDbField read FIdcondpagimovel write SetIdcondpagimovel;
     Property Idcondinicial: TCmDbField read FIdcondinicial write SetIdcondinicial;
     Property Formacalculo: TCmDbField read FFormacalculo write SetFormacalculo;
     Property Flgsinal: TCmDbField read FFlgsinal write SetFlgsinal;
     Property Flgreajmensal: TCmDbField read FFlgreajmensal write SetFlgreajmensal;
     Property Flgjurcarencia: TCmDbField read FFlgjurcarencia write SetFlgjurcarencia;
     Property Flgcmmensal: TCmDbField read FFlgcmmensal write SetFlgcmmensal;
     Property Datavencimento: TCmDbField read FDatavencimento write SetDatavencimento;
     Property Datainiamortiz: TCmDbField read FDatainiamortiz write SetDatainiamortiz;
     Property Dataini: TCmDbField read FDataini write SetDataini;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;
     Property Datacarencia: TCmDbField read FDatacarencia write SetDatacarencia;
     Property Atrasotxjuros: TCmDbField read FAtrasotxjuros write SetAtrasotxjuros;
     Property Atrasomulta: TCmDbField read FAtrasomulta write SetAtrasomulta;
     Property Atrasoindcorrec: TCmDbField read FAtrasoindcorrec write SetAtrasoindcorrec;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCondpagimovel }

constructor TDbCondpagimovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONDPAGIMOVEL';

   fVlrfinanc := CreateCmDbField('VLRFINANC',ftfloat,False,False,False,True,'');
   fTipocondpag := CreateCmDbField('TIPOCONDPAG',ftString,False,False,False,True,'');
   fTaxajuros := CreateCmDbField('TAXAJUROS',ftfloat,False,False,False,True,'');
   fPrazo := CreateCmDbField('PRAZO',ftString,False,False,False,True,'');
   fPeriodotaxa := CreateCmDbField('PERIODOTAXA',ftString,False,False,False,True,'');
   fPeriodoreajuste := CreateCmDbField('PERIODOREAJUSTE',ftfloat,False,False,False,True,'');
   fPeriodo := CreateCmDbField('PERIODO',ftfloat,False,False,False,True,'');
   fPerindproj := CreateCmDbField('PERINDPROJ',ftfloat,False,False,False,True,'');
   fNumparcelas := CreateCmDbField('NUMPARCELAS',ftfloat,False,False,False,True,'');
   fMesrefreajuste := CreateCmDbField('MESREFREAJUSTE',ftfloat,False,False,False,True,'');
   fIndcorrecao := CreateCmDbField('INDCORRECAO',ftfloat,False,False,False,True,'');
   fIdrepactua := CreateCmDbField('IDREPACTUA',ftfloat,False,False,False,True,'');
   fIdindcorrproj := CreateCmDbField('IDINDCORRPROJ',ftfloat,False,False,False,True,'');
   fIdformacalcimob := CreateCmDbField('IDFORMACALCIMOB',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'');
   fIdcondpagimovel := CreateCmDbField('IDCONDPAGIMOVEL',ftfloat,True,True,False,True,'');
   fIdcondinicial := CreateCmDbField('IDCONDINICIAL',ftfloat,False,False,False,True,'');
   fFormacalculo := CreateCmDbField('FORMACALCULO',ftfloat,False,False,False,True,'');
   fFlgsinal := CreateCmDbField('FLGSINAL',ftString,False,False,False,True,'');
   fFlgreajmensal := CreateCmDbField('FLGREAJMENSAL',ftString,False,False,False,True,'');
   fFlgjurcarencia := CreateCmDbField('FLGJURCARENCIA',ftString,False,False,False,True,'');
   fFlgcmmensal := CreateCmDbField('FLGCMMENSAL',ftString,False,False,False,True,'');
   fDatavencimento := CreateCmDbField('DATAVENCIMENTO',ftDateTime,False,False,False,True,'');
   fDatainiamortiz := CreateCmDbField('DATAINIAMORTIZ',ftDateTime,False,False,False,True,'');
   fDataini := CreateCmDbField('DATAINI',ftDateTime,False,False,False,True,'');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
   fDatacarencia := CreateCmDbField('DATACARENCIA',ftDateTime,False,False,False,True,'');
   fAtrasotxjuros := CreateCmDbField('ATRASOTXJUROS',ftfloat,False,False,False,True,'');
   fAtrasomulta := CreateCmDbField('ATRASOMULTA',ftfloat,False,False,False,True,'');
   fAtrasoindcorrec := CreateCmDbField('ATRASOINDCORREC',ftfloat,False,False,False,True,'');
end;

function TDbCondpagimovel.Insert: Boolean;
begin

   fIdcondpagimovel.AsFloat := GetSequence('CONDPAGIMOVEL');
   Result := Inherited Insert;

end;


procedure TDbCondpagimovel.SetAtrasoindcorrec(const Value: TCmDbField);
begin
  FAtrasoindcorrec := Value;
end;

procedure TDbCondpagimovel.SetAtrasomulta(const Value: TCmDbField);
begin
  FAtrasomulta := Value;
end;

procedure TDbCondpagimovel.SetAtrasotxjuros(const Value: TCmDbField);
begin
  FAtrasotxjuros := Value;
end;

procedure TDbCondpagimovel.SetDatacarencia(const Value: TCmDbField);
begin
  FDatacarencia := Value;
end;

procedure TDbCondpagimovel.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbCondpagimovel.SetDataini(const Value: TCmDbField);
begin
  FDataini := Value;
end;

procedure TDbCondpagimovel.SetDatainiamortiz(const Value: TCmDbField);
begin
  FDatainiamortiz := Value;
end;

procedure TDbCondpagimovel.SetDatavencimento(const Value: TCmDbField);
begin
  FDatavencimento := Value;
end;

procedure TDbCondpagimovel.SetFlgcmmensal(const Value: TCmDbField);
begin
  FFlgcmmensal := Value;
end;

procedure TDbCondpagimovel.SetFlgjurcarencia(const Value: TCmDbField);
begin
  FFlgjurcarencia := Value;
end;

procedure TDbCondpagimovel.SetFlgreajmensal(const Value: TCmDbField);
begin
  FFlgreajmensal := Value;
end;

procedure TDbCondpagimovel.SetFlgsinal(const Value: TCmDbField);
begin
  FFlgsinal := Value;
end;

procedure TDbCondpagimovel.SetFormacalculo(const Value: TCmDbField);
begin
  FFormacalculo := Value;
end;

procedure TDbCondpagimovel.SetIdcondinicial(const Value: TCmDbField);
begin
  FIdcondinicial := Value;
end;

procedure TDbCondpagimovel.SetIdcondpagimovel(const Value: TCmDbField);
begin
  FIdcondpagimovel := Value;
end;

procedure TDbCondpagimovel.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbCondpagimovel.SetIdformacalcimob(const Value: TCmDbField);
begin
  FIdformacalcimob := Value;
end;

procedure TDbCondpagimovel.SetIdindcorrproj(const Value: TCmDbField);
begin
  FIdindcorrproj := Value;
end;

procedure TDbCondpagimovel.SetIdrepactua(const Value: TCmDbField);
begin
  FIdrepactua := Value;
end;

procedure TDbCondpagimovel.SetIndcorrecao(const Value: TCmDbField);
begin
  FIndcorrecao := Value;
end;

procedure TDbCondpagimovel.SetMesrefreajuste(const Value: TCmDbField);
begin
  FMesrefreajuste := Value;
end;

procedure TDbCondpagimovel.SetNumparcelas(const Value: TCmDbField);
begin
  FNumparcelas := Value;
end;

procedure TDbCondpagimovel.SetPerindproj(const Value: TCmDbField);
begin
  FPerindproj := Value;
end;

procedure TDbCondpagimovel.SetPeriodo(const Value: TCmDbField);
begin
  FPeriodo := Value;
end;

procedure TDbCondpagimovel.SetPeriodoreajuste(const Value: TCmDbField);
begin
  FPeriodoreajuste := Value;
end;

procedure TDbCondpagimovel.SetPeriodotaxa(const Value: TCmDbField);
begin
  FPeriodotaxa := Value;
end;

procedure TDbCondpagimovel.SetPrazo(const Value: TCmDbField);
begin
  FPrazo := Value;
end;


procedure TDbCondpagimovel.SetTaxajuros(const Value: TCmDbField);
begin
  FTaxajuros := Value;
end;

procedure TDbCondpagimovel.SetTipocondpag(const Value: TCmDbField);
begin
  FTipocondpag := Value;
end;

procedure TDbCondpagimovel.SetVlrfinanc(const Value: TCmDbField);
begin
  FVlrfinanc := Value;
end;

end.



