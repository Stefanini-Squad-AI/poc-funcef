{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/05/2006                             }
{                                                       }
{*******************************************************}

unit uDbFundoinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFundoinvest = class(TCmDbObject)

  private
    FStafundo: TCmDbField;
    FPzoamortizacao: TCmDbField;
    FPzocotresg: TCmDbField;
    FCodisin: TCmDbField;
    FDatacotizacao: TCmDbField;
    FIdclassifanbid: TCmDbField;
    FDatainiciofundo: TCmDbField;
    FDtainiproc: TCmDbField;
    FPerctxadm: TCmDbField;
    FStaexclusivo: TCmDbField;
    FContrcetip: TCmDbField;
    FPerctxperform: TCmDbField;
    FIdgestorcarteira: TCmDbField;
    FMoecodigo: TCmDbField;
    FQtddecqtd: TCmDbField;
    FVlrcotainicial: TCmDbField;
    FQtdtotintegraliza: TCmDbField;
    FIdtipofundoinvest: TCmDbField;
    FIdadmfdoinvest: TCmDbField;
    FPzoaniversario: TCmDbField;
    FIdcategoriafundo: TCmDbField;
    FPzocotaplic: TCmDbField;
    FPzocarencia: TCmDbField;
    FIdfundoinvest: TCmDbField;
    FMoecorcota: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FQtddecvalor: TCmDbField;
    FStaprovisionaiof: TCmDbField;
    FPzoliqaplic: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FDtavigencia: TCmDbField;
    FIdcustodiante: TCmDbField;
    FStaprovisionair: TCmDbField;
    FIdregra: TCmDbField;
    FIdtipocota: TCmDbField;
    FStavercota: TCmDbField;
    FCodfuncetip: TCmDbField;
    FCodanbid: TCmDbField;
    FPzoliqresg: TCmDbField;
    FCnpjfundo: TCmDbField;
    FIdcarteiraspc: TCmDbField;
    FDescfundoinvest: TCmDbField;
    FDatainiaplic: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetCnpjfundo(const Value: TCmDbField);
    procedure SetCodanbid(const Value: TCmDbField);
    procedure SetCodfuncetip(const Value: TCmDbField);
    procedure SetCodisin(const Value: TCmDbField);
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
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetIdfundoinvest(const Value: TCmDbField);
    procedure SetIdgestorcarteira(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdtipocota(const Value: TCmDbField);
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
     Property Idtipocota: TCmDbField read FIdtipocota write SetIdtipocota;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idgestorcarteira: TCmDbField read FIdgestorcarteira write SetIdgestorcarteira;
     Property Idfundoinvest: TCmDbField read FIdfundoinvest write SetIdfundoinvest;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
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
     Property Codisin: TCmDbField read FCodisin write SetCodisin;
     Property Codfuncetip: TCmDbField read FCodfuncetip write SetCodfuncetip;
     Property Codanbid: TCmDbField read FCodanbid write SetCodanbid;
     Property Cnpjfundo: TCmDbField read FCnpjfundo write SetCnpjfundo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFundoinvest }

constructor TDbFundoinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FUNDOINVEST';

   fVlrcotainicial := CreateCmDbField('VLRCOTAINICIAL',ftfloat,False,False,False,True,'Valor da Cota Inicial');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fStavercota := CreateCmDbField('STAVERCOTA',ftString,False,False,False,True,'Status de Cotas');
   fStaprovisionair := CreateCmDbField('STAPROVISIONAIR',ftString,False,False,False,True,'Provisiona IR');
   fStaprovisionaiof := CreateCmDbField('STAPROVISIONAIOF',ftString,False,False,False,True,'Provisiona IOF');
   fStafundo := CreateCmDbField('STAFUNDO',ftString,False,False,False,True,'Status');
   fStaexclusivo := CreateCmDbField('STAEXCLUSIVO',ftString,False,False,False,True,'Exclusivo');
   fQtdtotintegraliza := CreateCmDbField('QTDTOTINTEGRALIZA',ftfloat,False,False,False,True,'Quantidade a Integralizar');
   fQtddecvalor := CreateCmDbField('QTDDECVALOR',ftfloat,False,False,False,True,'Casas Decimais Cotas');
   fQtddecqtd := CreateCmDbField('QTDDECQTD',ftfloat,False,False,False,True,'Casas Decimais Quantidade');
   fPzoliqresg := CreateCmDbField('PZOLIQRESG',ftfloat,False,False,False,True,'Pz. de Liquidação da Resg.');
   fPzoliqaplic := CreateCmDbField('PZOLIQAPLIC',ftfloat,False,False,False,True,'Pz. de Liquidação da Apl.');
   fPzocotresg := CreateCmDbField('PZOCOTRESG',ftfloat,False,False,False,True,'Pz. de Cotização da Resg.');
   fPzocotaplic := CreateCmDbField('PZOCOTAPLIC',ftfloat,False,False,False,True,'Pz. de Cotização da Apl.');
   fPzocarencia := CreateCmDbField('PZOCARENCIA',ftfloat,False,False,False,True,'Prazo de Carência');
   fPzoaniversario := CreateCmDbField('PZOANIVERSARIO',ftfloat,False,False,False,True,'Prazo de Aniversário');
   fPzoamortizacao := CreateCmDbField('PZOAMORTIZACAO',ftfloat,False,False,False,True,'Prazo de Amortização');
   fPerctxperform := CreateCmDbField('PERCTXPERFORM',ftfloat,False,False,False,True,'% da Tx. de Performance');
   fPerctxadm := CreateCmDbField('PERCTXADM',ftfloat,False,False,False,True,'% da Taxa de ADM.');
   fMoecorcota := CreateCmDbField('MOECORCOTA',ftfloat,False,False,False,True,'Moeda Corretora');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'Moeda');
   fIdtipofundoinvest := CreateCmDbField('IDTIPOFUNDOINVEST',ftfloat,False,False,False,True,'Indentificador Tipo de Fundo');
   fIdtipocota := CreateCmDbField('IDTIPOCOTA',ftfloat,False,False,False,True,'Indentificador Tipo de Cota');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'Indentificador Regra');
   fIdgestorcarteira := CreateCmDbField('IDGESTORCARTEIRA',ftfloat,False,False,False,True,'Indentificador Gestor');
   fIdfundoinvest := CreateCmDbField('IDFUNDOINVEST',ftfloat,True,True,False,True,'Indentificador Fundo');
   fIdcustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'Indentificador Custodiante');
   fIdclassifanbid := CreateCmDbField('IDCLASSIFANBID',ftfloat,False,False,False,True,'Indentificador CLassif. ANBID');
   fIdcategoriafundo := CreateCmDbField('IDCATEGORIAFUNDO',ftfloat,False,False,False,True,'Indentificador Categoria');
   fIdcarteiraspc := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'Indentifcador Carteira SPC');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'Indentificador Carteira');
   fIdadmfdoinvest := CreateCmDbField('IDADMFDOINVEST',ftfloat,False,False,False,True,'Indentificador do Adm.');
   fDtavigencia := CreateCmDbField('DTAVIGENCIA',ftDateTime,False,False,False,True,'Data de Vigência');
   fDtainiproc := CreateCmDbField('DTAINIPROC',ftDateTime,False,False,False,True,'Início do Processo do Fundo');
   fDescfundoinvest := CreateCmDbField('DESCFUNDOINVEST',ftString,False,False,False,True,'Descrição do Fundo');
   fDatainiciofundo := CreateCmDbField('DATAINICIOFUNDO',ftDateTime,False,False,False,True,'Data do Início do Fundo');
   fDatainiaplic := CreateCmDbField('DATAINIAPLIC',ftDateTime,False,False,False,True,'Data do Início da Aplicação');
   fDatacotizacao := CreateCmDbField('DATACOTIZACAO',ftDateTime,False,False,False,True,'Data da Cotização');
   fContrcetip := CreateCmDbField('CONTRCETIP',ftString,False,False,False,True,'Contraparte CETIP');
   fCodisin := CreateCmDbField('CODISIN',ftfloat,False,False,False,True,'Código ISIN');
   fCodfuncetip := CreateCmDbField('CODFUNCETIP',ftString,False,False,False,True,'Código CETIP');
   fCodanbid := CreateCmDbField('CODANBID',ftfloat,False,False,False,True,'Código ANBID');
   fCnpjfundo := CreateCmDbField('CNPJFUNDO',ftString,False,False,False,True,'CNPJ');
end;

function TDbFundoinvest.Insert: Boolean;
begin

   fIdfundoinvest.AsFloat := GetSequence('FUNDOINVEST');
   Result := Inherited Insert;

end;


procedure TDbFundoinvest.SetCnpjfundo(const Value: TCmDbField);
begin
  FCnpjfundo := Value;
end;

procedure TDbFundoinvest.SetCodanbid(const Value: TCmDbField);
begin
  FCodanbid := Value;
end;

procedure TDbFundoinvest.SetCodfuncetip(const Value: TCmDbField);
begin
  FCodfuncetip := Value;
end;

procedure TDbFundoinvest.SetCodisin(const Value: TCmDbField);
begin
  FCodisin := Value;
end;

procedure TDbFundoinvest.SetContrcetip(const Value: TCmDbField);
begin
  FContrcetip := Value;
end;

procedure TDbFundoinvest.SetDatacotizacao(const Value: TCmDbField);
begin
  FDatacotizacao := Value;
end;

procedure TDbFundoinvest.SetDatainiaplic(const Value: TCmDbField);
begin
  FDatainiaplic := Value;
end;

procedure TDbFundoinvest.SetDatainiciofundo(const Value: TCmDbField);
begin
  FDatainiciofundo := Value;
end;

procedure TDbFundoinvest.SetDescfundoinvest(const Value: TCmDbField);
begin
  FDescfundoinvest := Value;
end;

procedure TDbFundoinvest.SetDtainiproc(const Value: TCmDbField);
begin
  FDtainiproc := Value;
end;

procedure TDbFundoinvest.SetDtavigencia(const Value: TCmDbField);
begin
  FDtavigencia := Value;
end;

procedure TDbFundoinvest.SetIdadmfdoinvest(const Value: TCmDbField);
begin
  FIdadmfdoinvest := Value;
end;

procedure TDbFundoinvest.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbFundoinvest.SetIdcarteiraspc(const Value: TCmDbField);
begin
  FIdcarteiraspc := Value;
end;

procedure TDbFundoinvest.SetIdcategoriafundo(const Value: TCmDbField);
begin
  FIdcategoriafundo := Value;
end;

procedure TDbFundoinvest.SetIdclassifanbid(const Value: TCmDbField);
begin
  FIdclassifanbid := Value;
end;

procedure TDbFundoinvest.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbFundoinvest.SetIdfundoinvest(const Value: TCmDbField);
begin
  FIdfundoinvest := Value;
end;

procedure TDbFundoinvest.SetIdgestorcarteira(const Value: TCmDbField);
begin
  FIdgestorcarteira := Value;
end;

procedure TDbFundoinvest.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbFundoinvest.SetIdtipocota(const Value: TCmDbField);
begin
  FIdtipocota := Value;
end;

procedure TDbFundoinvest.SetIdtipofundoinvest(const Value: TCmDbField);
begin
  FIdtipofundoinvest := Value;
end;

procedure TDbFundoinvest.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbFundoinvest.SetMoecorcota(const Value: TCmDbField);
begin
  FMoecorcota := Value;
end;

procedure TDbFundoinvest.SetPerctxadm(const Value: TCmDbField);
begin
  FPerctxadm := Value;
end;

procedure TDbFundoinvest.SetPerctxperform(const Value: TCmDbField);
begin
  FPerctxperform := Value;
end;

procedure TDbFundoinvest.SetPzoamortizacao(const Value: TCmDbField);
begin
  FPzoamortizacao := Value;
end;

procedure TDbFundoinvest.SetPzoaniversario(const Value: TCmDbField);
begin
  FPzoaniversario := Value;
end;

procedure TDbFundoinvest.SetPzocarencia(const Value: TCmDbField);
begin
  FPzocarencia := Value;
end;

procedure TDbFundoinvest.SetPzocotaplic(const Value: TCmDbField);
begin
  FPzocotaplic := Value;
end;

procedure TDbFundoinvest.SetPzocotresg(const Value: TCmDbField);
begin
  FPzocotresg := Value;
end;

procedure TDbFundoinvest.SetPzoliqaplic(const Value: TCmDbField);
begin
  FPzoliqaplic := Value;
end;

procedure TDbFundoinvest.SetPzoliqresg(const Value: TCmDbField);
begin
  FPzoliqresg := Value;
end;

procedure TDbFundoinvest.SetQtddecqtd(const Value: TCmDbField);
begin
  FQtddecqtd := Value;
end;

procedure TDbFundoinvest.SetQtddecvalor(const Value: TCmDbField);
begin
  FQtddecvalor := Value;
end;

procedure TDbFundoinvest.SetQtdtotintegraliza(const Value: TCmDbField);
begin
  FQtdtotintegraliza := Value;
end;

procedure TDbFundoinvest.SetStaexclusivo(const Value: TCmDbField);
begin
  FStaexclusivo := Value;
end;

procedure TDbFundoinvest.SetStafundo(const Value: TCmDbField);
begin
  FStafundo := Value;
end;

procedure TDbFundoinvest.SetStaprovisionaiof(const Value: TCmDbField);
begin
  FStaprovisionaiof := Value;
end;

procedure TDbFundoinvest.SetStaprovisionair(const Value: TCmDbField);
begin
  FStaprovisionair := Value;
end;

procedure TDbFundoinvest.SetStavercota(const Value: TCmDbField);
begin
  FStavercota := Value;
end;

procedure TDbFundoinvest.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbFundoinvest.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbFundoinvest.SetVlrcotainicial(const Value: TCmDbField);
begin
  FVlrcotainicial := Value;
end;

end.



