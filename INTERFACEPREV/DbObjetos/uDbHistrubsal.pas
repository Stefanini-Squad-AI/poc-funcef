{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbHistrubsal;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbHistrubsal = class(TCmDbObject)

  private
    FFlgcompoeremtotal: TCmDbField;
    FFlgcompoesalbenef: TCmDbField;
    FValorrecebido: TCmDbField;
    FIdpessjur: TCmDbField;
    FIdpatro: TCmDbField;
    FFlgsrb: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdregracalculo: TCmDbField;
    FValorintegral: TCmDbField;
    FReferencia: TCmDbField;
    FSeqhistfunc: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdtitular: TCmDbField;
    FSeqrubrica: TCmDbField;
    FDatapagamento: TCmDbField;
    FMes: TCmDbField;
    FFlgtipodesc: TCmDbField;
    FFlgconcessao: TCmDbField;
    FIdrubrica: TCmDbField;
    FIdmotivo: TCmDbField;
    FCodprovdesc: TCmDbField;
    FCodportforma: TCmDbField;
    FFlgirrf: TCmDbField;
    FFlgcompoesalpart: TCmDbField;
    FValorprovento: TCmDbField;
    FIdpessoa: TCmDbField;
    FMescobranca: TCmDbField;
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodprovdesc(const Value: TCmDbField);
    procedure SetDatapagamento(const Value: TCmDbField);
    procedure SetFlgcompoeremtotal(const Value: TCmDbField);
    procedure SetFlgcompoesalbenef(const Value: TCmDbField);
    procedure SetFlgcompoesalpart(const Value: TCmDbField);
    procedure SetFlgconcessao(const Value: TCmDbField);
    procedure SetFlgirrf(const Value: TCmDbField);
    procedure SetFlgsrb(const Value: TCmDbField);
    procedure SetFlgtipodesc(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmotivo(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetMes(const Value: TCmDbField);
    procedure SetMescobranca(const Value: TCmDbField);
    procedure SetReferencia(const Value: TCmDbField);
    procedure SetSeqhistfunc(const Value: TCmDbField);
    procedure SetSeqrubrica(const Value: TCmDbField);
    procedure SetValorintegral(const Value: TCmDbField);
    procedure SetValorprovento(const Value: TCmDbField);
    procedure SetValorrecebido(const Value: TCmDbField);

  public

     Property Valorrecebido: TCmDbField read FValorrecebido write SetValorrecebido;
     Property Valorprovento: TCmDbField read FValorprovento write SetValorprovento;
     Property Valorintegral: TCmDbField read FValorintegral write SetValorintegral;
     Property Seqrubrica: TCmDbField read FSeqrubrica write SetSeqrubrica;
     Property Seqhistfunc: TCmDbField read FSeqhistfunc write SetSeqhistfunc;
     Property Referencia: TCmDbField read FReferencia write SetReferencia;
     Property Mescobranca: TCmDbField read FMescobranca write SetMescobranca;
     Property Mes: TCmDbField read FMes write SetMes;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idmotivo: TCmDbField read FIdmotivo write SetIdmotivo;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Flgtipodesc: TCmDbField read FFlgtipodesc write SetFlgtipodesc;
     Property Flgsrb: TCmDbField read FFlgsrb write SetFlgsrb;
     Property Flgirrf: TCmDbField read FFlgirrf write SetFlgirrf;
     Property Flgconcessao: TCmDbField read FFlgconcessao write SetFlgconcessao;
     Property Flgcompoesalpart: TCmDbField read FFlgcompoesalpart write SetFlgcompoesalpart;
     Property Flgcompoesalbenef: TCmDbField read FFlgcompoesalbenef write SetFlgcompoesalbenef;
     Property Flgcompoeremtotal: TCmDbField read FFlgcompoeremtotal write SetFlgcompoeremtotal;
     Property Datapagamento: TCmDbField read FDatapagamento write SetDatapagamento;
     Property Codprovdesc: TCmDbField read FCodprovdesc write SetCodprovdesc;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistrubsal }

constructor TDbHistrubsal.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTRUBSAL';

   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,False,False,False,True,'');
   fValorprovento := CreateCmDbField('VALORPROVENTO',ftfloat,False,False,False,True,'');
   fValorintegral := CreateCmDbField('VALORINTEGRAL',ftfloat,False,False,False,True,'');
   fSeqrubrica := CreateCmDbField('SEQRUBRICA',ftfloat,True,True,False,True,'');
   fSeqhistfunc := CreateCmDbField('SEQHISTFUNC',ftfloat,False,False,False,True,'');
   fReferencia := CreateCmDbField('REFERENCIA',ftString,True,True,False,True,'');
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,True,True,False,True,'');
   fMes := CreateCmDbField('MES',ftString,True,True,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,False,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,True,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,False,False,False,True,'');
   fFlgsrb := CreateCmDbField('FLGSRB',ftfloat,False,False,False,True,'');
   fFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,False,False,False,True,'');
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,False,False,False,True,'');
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,False,False,False,True,'');
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,False,False,False,True,'');
   fFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,False,False,False,True,'');
   fDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,False,False,False,True,'');
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,True,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
end;

function TDbHistrubsal.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbHistrubsal.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbHistrubsal.SetCodprovdesc(const Value: TCmDbField);
begin
  FCodprovdesc := Value;
end;

procedure TDbHistrubsal.SetDatapagamento(const Value: TCmDbField);
begin
  FDatapagamento := Value;
end;

procedure TDbHistrubsal.SetFlgcompoeremtotal(const Value: TCmDbField);
begin
  FFlgcompoeremtotal := Value;
end;

procedure TDbHistrubsal.SetFlgcompoesalbenef(const Value: TCmDbField);
begin
  FFlgcompoesalbenef := Value;
end;

procedure TDbHistrubsal.SetFlgcompoesalpart(const Value: TCmDbField);
begin
  FFlgcompoesalpart := Value;
end;

procedure TDbHistrubsal.SetFlgconcessao(const Value: TCmDbField);
begin
  FFlgconcessao := Value;
end;

procedure TDbHistrubsal.SetFlgirrf(const Value: TCmDbField);
begin
  FFlgirrf := Value;
end;

procedure TDbHistrubsal.SetFlgsrb(const Value: TCmDbField);
begin
  FFlgsrb := Value;
end;

procedure TDbHistrubsal.SetFlgtipodesc(const Value: TCmDbField);
begin
  FFlgtipodesc := Value;
end;

procedure TDbHistrubsal.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbHistrubsal.SetIdmotivo(const Value: TCmDbField);
begin
  FIdmotivo := Value;
end;

procedure TDbHistrubsal.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbHistrubsal.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbHistrubsal.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbHistrubsal.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHistrubsal.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDbHistrubsal.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDbHistrubsal.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbHistrubsal.SetMes(const Value: TCmDbField);
begin
  FMes := Value;
end;

procedure TDbHistrubsal.SetMescobranca(const Value: TCmDbField);
begin
  FMescobranca := Value;
end;

procedure TDbHistrubsal.SetReferencia(const Value: TCmDbField);
begin
  FReferencia := Value;
end;

procedure TDbHistrubsal.SetSeqhistfunc(const Value: TCmDbField);
begin
  FSeqhistfunc := Value;
end;

procedure TDbHistrubsal.SetSeqrubrica(const Value: TCmDbField);
begin
  FSeqrubrica := Value;
end;

procedure TDbHistrubsal.SetValorintegral(const Value: TCmDbField);
begin
  FValorintegral := Value;
end;

procedure TDbHistrubsal.SetValorprovento(const Value: TCmDbField);
begin
  FValorprovento := Value;
end;

procedure TDbHistrubsal.SetValorrecebido(const Value: TCmDbField);
begin
  FValorrecebido := Value;
end;

end.



