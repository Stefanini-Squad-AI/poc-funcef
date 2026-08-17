{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/04/2007                             }
{                                                       }
{*******************************************************}

unit uDBParcelamento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBParcelamento = class(TCmDbObject)

  private
    FDescopcoes: TCmDbField;
    FPercseguro: TCmDbField;
    FSdodevedor: TCmDbField;
    FVlrdividapatro: TCmDbField;
    FVlrsalbase: TCmDbField;
    FIdparcelamento: TCmDbField;
    FTpcompracarencia: TCmDbField;
    FIdcalculoregra: TCmDbField;
    FIdpessoa: TCmDbField;
    FSeqproposta: TCmDbField;
    FDatacancelamento: TCmDbField;
    FVlrdividapart: TCmDbField;
    FParcpagas: TCmDbField;
    FParcgeradas: TCmDbField;
    FSitparcelamento: TCmDbField;
    FDatainicio: TCmDbField;
    FPercentual: TCmDbField;
    FVlrprimprestacao: TCmDbField;
    FIdpessjur: TCmDbField;
    FIdplanoprev: TCmDbField;
    FMotivocancel: TCmDbField;
    FFlgdescfolha: TCmDbField;
    FNumparcelas: TCmDbField;
    procedure SetDatacancelamento(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDescopcoes(const Value: TCmDbField);
    procedure SetFlgdescfolha(const Value: TCmDbField);
    procedure SetIdcalculoregra(const Value: TCmDbField);
    procedure SetIdparcelamento(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetMotivocancel(const Value: TCmDbField);
    procedure SetNumparcelas(const Value: TCmDbField);
    procedure SetParcgeradas(const Value: TCmDbField);
    procedure SetParcpagas(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPercseguro(const Value: TCmDbField);
    procedure SetSdodevedor(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetSitparcelamento(const Value: TCmDbField);
    procedure SetTpcompracarencia(const Value: TCmDbField);
    procedure SetVlrdividapart(const Value: TCmDbField);
    procedure SetVlrdividapatro(const Value: TCmDbField);
    procedure SetVlrprimprestacao(const Value: TCmDbField);
    procedure SetVlrsalbase(const Value: TCmDbField);

  public

     Property Vlrsalbase: TCmDbField read FVlrsalbase write SetVlrsalbase;
     Property Vlrprimprestacao: TCmDbField read FVlrprimprestacao write SetVlrprimprestacao;
     Property Vlrdividapatro: TCmDbField read FVlrdividapatro write SetVlrdividapatro;
     Property Vlrdividapart: TCmDbField read FVlrdividapart write SetVlrdividapart;
     Property Tpcompracarencia: TCmDbField read FTpcompracarencia write SetTpcompracarencia;
     Property Sitparcelamento: TCmDbField read FSitparcelamento write SetSitparcelamento;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Sdodevedor: TCmDbField read FSdodevedor write SetSdodevedor;
     Property Percseguro: TCmDbField read FPercseguro write SetPercseguro;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Parcpagas: TCmDbField read FParcpagas write SetParcpagas;
     Property Parcgeradas: TCmDbField read FParcgeradas write SetParcgeradas;
     Property Numparcelas: TCmDbField read FNumparcelas write SetNumparcelas;
     Property Motivocancel: TCmDbField read FMotivocancel write SetMotivocancel;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idparcelamento: TCmDbField read FIdparcelamento write SetIdparcelamento;
     Property Idcalculoregra: TCmDbField read FIdcalculoregra write SetIdcalculoregra;
     Property Flgdescfolha: TCmDbField read FFlgdescfolha write SetFlgdescfolha;
     Property Descopcoes: TCmDbField read FDescopcoes write SetDescopcoes;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datacancelamento: TCmDbField read FDatacancelamento write SetDatacancelamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBParcelamento }

constructor TDBParcelamento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARCELAMENTO';

   fVlrsalbase := CreateCmDbField('VLRSALBASE',ftfloat,False,False,False,True,'');
   fVlrprimprestacao := CreateCmDbField('VLRPRIMPRESTACAO',ftfloat,False,False,False,True,'');
   fVlrdividapatro := CreateCmDbField('VLRDIVIDAPATRO',ftfloat,False,False,False,True,'');
   fVlrdividapart := CreateCmDbField('VLRDIVIDAPART',ftfloat,False,False,False,True,'');
   fTpcompracarencia := CreateCmDbField('TPCOMPRACARENCIA',ftfloat,False,False,False,True,'');
   fSitparcelamento := CreateCmDbField('SITPARCELAMENTO',ftfloat,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,False,False,True,'');
   fSdodevedor := CreateCmDbField('SDODEVEDOR',ftfloat,False,False,False,True,'');
   fPercseguro := CreateCmDbField('PERCSEGURO',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fParcpagas := CreateCmDbField('PARCPAGAS',ftfloat,False,False,False,True,'');
   fParcgeradas := CreateCmDbField('PARCGERADAS',ftfloat,False,False,False,True,'');
   fNumparcelas := CreateCmDbField('NUMPARCELAS',ftfloat,False,False,False,True,'');
   fMotivocancel := CreateCmDbField('MOTIVOCANCEL',ftString,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,False,False,True,'');
   fIdparcelamento := CreateCmDbField('IDPARCELAMENTO',ftfloat,True,True,False,True,'');
   fIdcalculoregra := CreateCmDbField('IDCALCULOREGRA',ftfloat,False,False,False,True,'');
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftfloat,False,False,False,True,'');
   fDescopcoes := CreateCmDbField('DESCOPCOES',ftString,False,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   fDatacancelamento := CreateCmDbField('DATACANCELAMENTO',ftDateTime,False,False,False,True,'');
end;

function TDBParcelamento.Insert: Boolean;
begin

   fIdparcelamento.AsFloat := GetSequence('PARCELAMENTO');
   Result := Inherited Insert;

end;


procedure TDBParcelamento.SetDatacancelamento(const Value: TCmDbField);
begin
  FDatacancelamento := Value;
end;

procedure TDBParcelamento.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDBParcelamento.SetDescopcoes(const Value: TCmDbField);
begin
  FDescopcoes := Value;
end;

procedure TDBParcelamento.SetFlgdescfolha(const Value: TCmDbField);
begin
  FFlgdescfolha := Value;
end;

procedure TDBParcelamento.SetIdcalculoregra(const Value: TCmDbField);
begin
  FIdcalculoregra := Value;
end;

procedure TDBParcelamento.SetIdparcelamento(const Value: TCmDbField);
begin
  FIdparcelamento := Value;
end;

procedure TDBParcelamento.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDBParcelamento.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBParcelamento.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBParcelamento.SetMotivocancel(const Value: TCmDbField);
begin
  FMotivocancel := Value;
end;

procedure TDBParcelamento.SetNumparcelas(const Value: TCmDbField);
begin
  FNumparcelas := Value;
end;

procedure TDBParcelamento.SetParcgeradas(const Value: TCmDbField);
begin
  FParcgeradas := Value;
end;

procedure TDBParcelamento.SetParcpagas(const Value: TCmDbField);
begin
  FParcpagas := Value;
end;

procedure TDBParcelamento.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDBParcelamento.SetPercseguro(const Value: TCmDbField);
begin
  FPercseguro := Value;
end;

procedure TDBParcelamento.SetSdodevedor(const Value: TCmDbField);
begin
  FSdodevedor := Value;
end;

procedure TDBParcelamento.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDBParcelamento.SetSitparcelamento(const Value: TCmDbField);
begin
  FSitparcelamento := Value;
end;

procedure TDBParcelamento.SetTpcompracarencia(const Value: TCmDbField);
begin
  FTpcompracarencia := Value;
end;

procedure TDBParcelamento.SetVlrdividapart(const Value: TCmDbField);
begin
  FVlrdividapart := Value;
end;

procedure TDBParcelamento.SetVlrdividapatro(const Value: TCmDbField);
begin
  FVlrdividapatro := Value;
end;

procedure TDBParcelamento.SetVlrprimprestacao(const Value: TCmDbField);
begin
  FVlrprimprestacao := Value;
end;

procedure TDBParcelamento.SetVlrsalbase(const Value: TCmDbField);
begin
  FVlrsalbase := Value;
end;

end.



