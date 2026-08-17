{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/05/2006                             }
{                                                       }
{*******************************************************}

unit uDbHistfundoinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistfundoinvest = class(TCmDbObject)

  private
    FIdcategoriafundo: TCmDbField;
    FPzoamortizacao: TCmDbField;
    FStaprovisionair: TCmDbField;
    FMoecorcota: TCmDbField;
    FDatainiciofundo: TCmDbField;
    FCodfuncetip: TCmDbField;
    FQtddecvalor: TCmDbField;
    FPzoliqresg: TCmDbField;
    FStaexclusivo: TCmDbField;
    FDatainiaplic: TCmDbField;
    FMoecodigo: TCmDbField;
    FStaprovisionaiof: TCmDbField;
    FPerctxperform: TCmDbField;
    FPerctxadm: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FQtdtotintegraliza: TCmDbField;
    FIdadmfdoinvest: TCmDbField;
    FStafundo: TCmDbField;
    FVlrcotainicial: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FStavercota: TCmDbField;
    FIdtipofundoinvest: TCmDbField;
    FIdclassifanbid: TCmDbField;
    FContrcetip: TCmDbField;
    FIdgestorcarteira: TCmDbField;
    FPzocotaplic: TCmDbField;
    FDtainiproc: TCmDbField;
    FDtavigencia: TCmDbField;
    FIdcarteiraspc: TCmDbField;
    FPzocotresg: TCmDbField;
    FDatacotizacao: TCmDbField;
    FPzocarencia: TCmDbField;
    FIdregra: TCmDbField;
    FCnpjfundo: TCmDbField;
    FDescfundoinvest: TCmDbField;
    FIdfundoinvest: TCmDbField;
    FPzoaniversario: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FPzoliqaplic: TCmDbField;
    FQtddecqtd: TCmDbField;
    procedure SetCnpjfundo(const Value: TCmDbField);
    procedure SetCodfuncetip(const Value: TCmDbField);
    procedure SetContrcetip(const Value: TCmDbField);
    procedure SetDatacotizacao(const Value: TCmDbField);
    procedure SetDatainiaplic(const Value: TCmDbField);
    procedure SetDatainiciofundo(const Value: TCmDbField);
    procedure SetDescfundoinvest(const Value: TCmDbField);
    procedure SetDtainiproc(const Value: TCmDbField);
    procedure SetDtavigencia(const Value: TCmDbField);
    procedure SetIdadmfdoinvest(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcarteiraspc(const Value: TCmDbField);
    procedure SetIdcategoriafundo(const Value: TCmDbField);
    procedure SetIdclassifanbid(const Value: TCmDbField);
    procedure SetIdfundoinvest(const Value: TCmDbField);
    procedure SetIdgestorcarteira(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdtipofundoinvest(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetMoecorcota(const Value: TCmDbField);
    procedure SetPerctxadm(const Value: TCmDbField);
    procedure SetPerctxperform(const Value: TCmDbField);
    procedure SetPzoamortizacao(const Value: TCmDbField);
    procedure SetPzoaniversario(const Value: TCmDbField);
    procedure SetPzocarencia(const Value: TCmDbField);
    procedure SetPzocotaplic(const Value: TCmDbField);
    procedure SetPzocotresg(const Value: TCmDbField);
    procedure SetPzoliqaplic(const Value: TCmDbField);
    procedure SetPzoliqresg(const Value: TCmDbField);
    procedure SetQtddecqtd(const Value: TCmDbField);
    procedure SetQtddecvalor(const Value: TCmDbField);
    procedure SetQtdtotintegraliza(const Value: TCmDbField);
    procedure SetStaexclusivo(const Value: TCmDbField);
    procedure SetStafundo(const Value: TCmDbField);
    procedure SetStaprovisionaiof(const Value: TCmDbField);
    procedure SetStaprovisionair(const Value: TCmDbField);
    procedure SetStavercota(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrcotainicial(const Value: TCmDbField);

  public

     Property Vlrcotainicial: TCmDbField read FVlrcotainicial write SetVlrcotainicial;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Stavercota: TCmDbField read FStavercota write SetStavercota;
     Property Staprovisionair: TCmDbField read FStaprovisionair write SetStaprovisionair;
     Property Staprovisionaiof: TCmDbField read FStaprovisionaiof write SetStaprovisionaiof;
     Property Stafundo: TCmDbField read FStafundo write SetStafundo;
     Property Staexclusivo: TCmDbField read FStaexclusivo write SetStaexclusivo;
     Property Qtdtotintegraliza: TCmDbField read FQtdtotintegraliza write SetQtdtotintegraliza;
     Property Qtddecvalor: TCmDbField read FQtddecvalor write SetQtddecvalor;
     Property Qtddecqtd: TCmDbField read FQtddecqtd write SetQtddecqtd;
     Property Pzoliqresg: TCmDbField read FPzoliqresg write SetPzoliqresg;
     Property Pzoliqaplic: TCmDbField read FPzoliqaplic write SetPzoliqaplic;
     Property Pzocotresg: TCmDbField read FPzocotresg write SetPzocotresg;
     Property Pzocotaplic: TCmDbField read FPzocotaplic write SetPzocotaplic;
     Property Pzocarencia: TCmDbField read FPzocarencia write SetPzocarencia;
     Property Pzoaniversario: TCmDbField read FPzoaniversario write SetPzoaniversario;
     Property Pzoamortizacao: TCmDbField read FPzoamortizacao write SetPzoamortizacao;
     Property Perctxperform: TCmDbField read FPerctxperform write SetPerctxperform;
     Property Perctxadm: TCmDbField read FPerctxadm write SetPerctxadm;
     Property Moecorcota: TCmDbField read FMoecorcota write SetMoecorcota;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idtipofundoinvest: TCmDbField read FIdtipofundoinvest write SetIdtipofundoinvest;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idgestorcarteira: TCmDbField read FIdgestorcarteira write SetIdgestorcarteira;
     Property Idfundoinvest: TCmDbField read FIdfundoinvest write SetIdfundoinvest;
     Property Idclassifanbid: TCmDbField read FIdclassifanbid write SetIdclassifanbid;
     Property Idcategoriafundo: TCmDbField read FIdcategoriafundo write SetIdcategoriafundo;
     Property Idcarteiraspc: TCmDbField read FIdcarteiraspc write SetIdcarteiraspc;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idadmfdoinvest: TCmDbField read FIdadmfdoinvest write SetIdadmfdoinvest;
     Property Dtavigencia: TCmDbField read FDtavigencia write SetDtavigencia;
     Property Dtainiproc: TCmDbField read FDtainiproc write SetDtainiproc;
     Property Descfundoinvest: TCmDbField read FDescfundoinvest write SetDescfundoinvest;
     Property Datainiciofundo: TCmDbField read FDatainiciofundo write SetDatainiciofundo;
     Property Datainiaplic: TCmDbField read FDatainiaplic write SetDatainiaplic;
     Property Datacotizacao: TCmDbField read FDatacotizacao write SetDatacotizacao;
     Property Contrcetip: TCmDbField read FContrcetip write SetContrcetip;
     Property Codfuncetip: TCmDbField read FCodfuncetip write SetCodfuncetip;
     Property Cnpjfundo: TCmDbField read FCnpjfundo write SetCnpjfundo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistfundoinvest }

constructor TDbHistfundoinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTFUNDOINVEST';

   fVlrcotainicial := CreateCmDbField('VLRCOTAINICIAL',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fStavercota := CreateCmDbField('STAVERCOTA',ftString,False,False,False,True,'');
   fStaprovisionair := CreateCmDbField('STAPROVISIONAIR',ftString,False,False,False,True,'');
   fStaprovisionaiof := CreateCmDbField('STAPROVISIONAIOF',ftString,False,False,False,True,'');
   fStafundo := CreateCmDbField('STAFUNDO',ftString,False,False,False,True,'');
   fStaexclusivo := CreateCmDbField('STAEXCLUSIVO',ftString,False,False,False,True,'');
   fQtdtotintegraliza := CreateCmDbField('QTDTOTINTEGRALIZA',ftfloat,False,False,False,True,'');
   fQtddecvalor := CreateCmDbField('QTDDECVALOR',ftfloat,False,False,False,True,'');
   fQtddecqtd := CreateCmDbField('QTDDECQTD',ftfloat,False,False,False,True,'');
   fPzoliqresg := CreateCmDbField('PZOLIQRESG',ftfloat,False,False,False,True,'');
   fPzoliqaplic := CreateCmDbField('PZOLIQAPLIC',ftfloat,False,False,False,True,'');
   fPzocotresg := CreateCmDbField('PZOCOTRESG',ftfloat,False,False,False,True,'');
   fPzocotaplic := CreateCmDbField('PZOCOTAPLIC',ftfloat,False,False,False,True,'');
   fPzocarencia := CreateCmDbField('PZOCARENCIA',ftfloat,False,False,False,True,'');
   fPzoaniversario := CreateCmDbField('PZOANIVERSARIO',ftfloat,False,False,False,True,'');
   fPzoamortizacao := CreateCmDbField('PZOAMORTIZACAO',ftfloat,False,False,False,True,'');
   fPerctxperform := CreateCmDbField('PERCTXPERFORM',ftfloat,False,False,False,True,'');
   fPerctxadm := CreateCmDbField('PERCTXADM',ftfloat,False,False,False,True,'');
   fMoecorcota := CreateCmDbField('MOECORCOTA',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdtipofundoinvest := CreateCmDbField('IDTIPOFUNDOINVEST',ftfloat,False,False,False,True,'');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'');
   fIdgestorcarteira := CreateCmDbField('IDGESTORCARTEIRA',ftfloat,False,False,False,True,'');
   fIdfundoinvest := CreateCmDbField('IDFUNDOINVEST',ftfloat,True,True,False,True,'');
   fIdclassifanbid := CreateCmDbField('IDCLASSIFANBID',ftfloat,False,False,False,True,'');
   fIdcategoriafundo := CreateCmDbField('IDCATEGORIAFUNDO',ftfloat,False,False,False,True,'');
   fIdcarteiraspc := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fIdadmfdoinvest := CreateCmDbField('IDADMFDOINVEST',ftfloat,False,False,False,True,'');
   fDtavigencia := CreateCmDbField('DTAVIGENCIA',ftDateTime,True,True,False,True,'');
   fDtainiproc := CreateCmDbField('DTAINIPROC',ftDateTime,False,False,False,True,'');
   fDescfundoinvest := CreateCmDbField('DESCFUNDOINVEST',ftString,False,False,False,True,'');
   fDatainiciofundo := CreateCmDbField('DATAINICIOFUNDO',ftDateTime,False,False,False,True,'');
   fDatainiaplic := CreateCmDbField('DATAINIAPLIC',ftDateTime,False,False,False,True,'');
   fDatacotizacao := CreateCmDbField('DATACOTIZACAO',ftDateTime,False,False,False,True,'');
   fContrcetip := CreateCmDbField('CONTRCETIP',ftString,False,False,False,True,'');
   fCodfuncetip := CreateCmDbField('CODFUNCETIP',ftString,False,False,False,True,'');
   fCnpjfundo := CreateCmDbField('CNPJFUNDO',ftString,False,False,False,True,'');
end;

function TDbHistfundoinvest.Insert: Boolean;
begin

   fIdfundoinvest.AsFloat := GetSequence('HISTFUNDOINVEST');
   Result := Inherited Insert;

end;


procedure TDbHistfundoinvest.SetCnpjfundo(const Value: TCmDbField);
begin
  FCnpjfundo := Value;
end;

procedure TDbHistfundoinvest.SetCodfuncetip(const Value: TCmDbField);
begin
  FCodfuncetip := Value;
end;

procedure TDbHistfundoinvest.SetContrcetip(const Value: TCmDbField);
begin
  FContrcetip := Value;
end;

procedure TDbHistfundoinvest.SetDatacotizacao(const Value: TCmDbField);
begin
  FDatacotizacao := Value;
end;

procedure TDbHistfundoinvest.SetDatainiaplic(const Value: TCmDbField);
begin
  FDatainiaplic := Value;
end;

procedure TDbHistfundoinvest.SetDatainiciofundo(const Value: TCmDbField);
begin
  FDatainiciofundo := Value;
end;

procedure TDbHistfundoinvest.SetDescfundoinvest(const Value: TCmDbField);
begin
  FDescfundoinvest := Value;
end;

procedure TDbHistfundoinvest.SetDtainiproc(const Value: TCmDbField);
begin
  FDtainiproc := Value;
end;

procedure TDbHistfundoinvest.SetDtavigencia(const Value: TCmDbField);
begin
  FDtavigencia := Value;
end;

procedure TDbHistfundoinvest.SetIdadmfdoinvest(const Value: TCmDbField);
begin
  FIdadmfdoinvest := Value;
end;

procedure TDbHistfundoinvest.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistfundoinvest.SetIdcarteiraspc(const Value: TCmDbField);
begin
  FIdcarteiraspc := Value;
end;

procedure TDbHistfundoinvest.SetIdcategoriafundo(const Value: TCmDbField);
begin
  FIdcategoriafundo := Value;
end;

procedure TDbHistfundoinvest.SetIdclassifanbid(const Value: TCmDbField);
begin
  FIdclassifanbid := Value;
end;

procedure TDbHistfundoinvest.SetIdfundoinvest(const Value: TCmDbField);
begin
  FIdfundoinvest := Value;
end;

procedure TDbHistfundoinvest.SetIdgestorcarteira(const Value: TCmDbField);
begin
  FIdgestorcarteira := Value;
end;

procedure TDbHistfundoinvest.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbHistfundoinvest.SetIdtipofundoinvest(const Value: TCmDbField);
begin
  FIdtipofundoinvest := Value;
end;

procedure TDbHistfundoinvest.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbHistfundoinvest.SetMoecorcota(const Value: TCmDbField);
begin
  FMoecorcota := Value;
end;

procedure TDbHistfundoinvest.SetPerctxadm(const Value: TCmDbField);
begin
  FPerctxadm := Value;
end;

procedure TDbHistfundoinvest.SetPerctxperform(const Value: TCmDbField);
begin
  FPerctxperform := Value;
end;

procedure TDbHistfundoinvest.SetPzoamortizacao(const Value: TCmDbField);
begin
  FPzoamortizacao := Value;
end;

procedure TDbHistfundoinvest.SetPzoaniversario(const Value: TCmDbField);
begin
  FPzoaniversario := Value;
end;

procedure TDbHistfundoinvest.SetPzocarencia(const Value: TCmDbField);
begin
  FPzocarencia := Value;
end;

procedure TDbHistfundoinvest.SetPzocotaplic(const Value: TCmDbField);
begin
  FPzocotaplic := Value;
end;

procedure TDbHistfundoinvest.SetPzocotresg(const Value: TCmDbField);
begin
  FPzocotresg := Value;
end;

procedure TDbHistfundoinvest.SetPzoliqaplic(const Value: TCmDbField);
begin
  FPzoliqaplic := Value;
end;

procedure TDbHistfundoinvest.SetPzoliqresg(const Value: TCmDbField);
begin
  FPzoliqresg := Value;
end;

procedure TDbHistfundoinvest.SetQtddecqtd(const Value: TCmDbField);
begin
  FQtddecqtd := Value;
end;

procedure TDbHistfundoinvest.SetQtddecvalor(const Value: TCmDbField);
begin
  FQtddecvalor := Value;
end;

procedure TDbHistfundoinvest.SetQtdtotintegraliza(const Value: TCmDbField);
begin
  FQtdtotintegraliza := Value;
end;

procedure TDbHistfundoinvest.SetStaexclusivo(const Value: TCmDbField);
begin
  FStaexclusivo := Value;
end;

procedure TDbHistfundoinvest.SetStafundo(const Value: TCmDbField);
begin
  FStafundo := Value;
end;

procedure TDbHistfundoinvest.SetStaprovisionaiof(const Value: TCmDbField);
begin
  FStaprovisionaiof := Value;
end;

procedure TDbHistfundoinvest.SetStaprovisionair(const Value: TCmDbField);
begin
  FStaprovisionair := Value;
end;

procedure TDbHistfundoinvest.SetStavercota(const Value: TCmDbField);
begin
  FStavercota := Value;
end;

procedure TDbHistfundoinvest.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHistfundoinvest.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbHistfundoinvest.SetVlrcotainicial(const Value: TCmDbField);
begin
  FVlrcotainicial := Value;
end;

end.



