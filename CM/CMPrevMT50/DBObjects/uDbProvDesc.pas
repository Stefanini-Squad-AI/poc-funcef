{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/12/2005                             }
{                                                       }
{*******************************************************}

unit uDbProvDesc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbProvdesc = class(TCmDbObject)

  private
    FNumprioridade: TCmDbField;
    FFlgconsolida: TCmDbField;
    FFlgsalbenefretro: TCmDbField;
    FFlgirrf: TCmDbField;
    FFlgirrfacjud: TCmDbField;
    FFlgsalref: TCmDbField;
    FFlgcompoesalpart: TCmDbField;
    FFlgferias: TCmDbField;
    FFlgobrigafavorec: TCmDbField;
    FFlgmargemconsig: TCmDbField;
    FFlgsalpartretro: TCmDbField;
    FFlgconstafolha: TCmDbField;
    FCodprovdesc: TCmDbField;
    FFlgincidesalpart: TCmDbField;
    FFlgsalfamilia: TCmDbField;
    FDescricao: TCmDbField;
    FFlgrais: TCmDbField;
    FFlgcompoesalbenef: TCmDbField;
    FIdregraferias: TCmDbField;
    FFlgcompoeremtotal: TCmDbField;
    FFlgfgts: TCmDbField;
    FIdgruporubrica: TCmDbField;
    FIdbenefsalar: TCmDbField;
    FFlgagrupa: TCmDbField;
    FFlginss: TCmDbField;
    FFlginterno: TCmDbField;
    FIdregra13: TCmDbField;
    FTipobasedesconto: TCmDbField;
    FIdprovento: TCmDbField;
    FFlgrublegal: TCmDbField;
    FFlgdescpensao: TCmDbField;
    FFlgestadorub: TCmDbField;
    FIdfundacao: TCmDbField;
    FFlguso: TCmDbField;
    FIdregra: TCmDbField;
    FNumprioridadefb: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FCodirrfdarf: TCmDbField;
    FIdregrarescisao: TCmDbField;
    FFlgrescisao: TCmDbField;
    FFlgexcjud: TCmDbField;
    FCodfontepagadora: TCmDbField;
    FDescparcial: TCmDbField;
    FIdinforme: TCmDbField;
    FPrazo: TCmDbField;
    FIdmodulo: TCmDbField;
    FFlgatrasodevol: TCmDbField;
    FFlgtprubrica: TCmDbField;
    FFlgincidecontrib: TCmDbField;
    FFlgdecimoterceiro: TCmDbField;
    FFlgprorata: TCmDbField;
    FFlgadiantferias: TCmDbField;
    FCodrubclt: TCmDbField;
    FFlgdesconto: TCmDbField;
    FFlgsalpartatuaria: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FFlgespecial: TCmDbField;
    FDescrprovdesc: TCmDbField;
    procedure SetCodfontepagadora(const Value: TCmDbField);
    procedure SetCodirrfdarf(const Value: TCmDbField);
    procedure SetCodprovdesc(const Value: TCmDbField);
    procedure SetCodrubclt(const Value: TCmDbField);
    procedure SetDescparcial(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetDescrprovdesc(const Value: TCmDbField);
    procedure SetFlgadiantferias(const Value: TCmDbField);
    procedure SetFlgagrupa(const Value: TCmDbField);
    procedure SetFlgatrasodevol(const Value: TCmDbField);
    procedure SetFlgcompoeremtotal(const Value: TCmDbField);
    procedure SetFlgcompoesalbenef(const Value: TCmDbField);
    procedure SetFlgcompoesalpart(const Value: TCmDbField);
    procedure SetFlgconsolida(const Value: TCmDbField);
    procedure SetFlgconstafolha(const Value: TCmDbField);
    procedure SetFlgdecimoterceiro(const Value: TCmDbField);
    procedure SetFlgdesconto(const Value: TCmDbField);
    procedure SetFlgdescpensao(const Value: TCmDbField);
    procedure SetFlgespecial(const Value: TCmDbField);
    procedure SetFlgestadorub(const Value: TCmDbField);
    procedure SetFlgexcjud(const Value: TCmDbField);
    procedure SetFlgferias(const Value: TCmDbField);
    procedure SetFlgfgts(const Value: TCmDbField);
    procedure SetFlgincidecontrib(const Value: TCmDbField);
    procedure SetFlgincidesalpart(const Value: TCmDbField);
    procedure SetFlginss(const Value: TCmDbField);
    procedure SetFlginterno(const Value: TCmDbField);
    procedure SetFlgirrf(const Value: TCmDbField);
    procedure SetFlgirrfacjud(const Value: TCmDbField);
    procedure SetFlgmargemconsig(const Value: TCmDbField);
    procedure SetFlgobrigafavorec(const Value: TCmDbField);
    procedure SetFlgprorata(const Value: TCmDbField);
    procedure SetFlgrais(const Value: TCmDbField);
    procedure SetFlgrescisao(const Value: TCmDbField);
    procedure SetFlgrublegal(const Value: TCmDbField);
    procedure SetFlgsalbenefretro(const Value: TCmDbField);
    procedure SetFlgsalfamilia(const Value: TCmDbField);
    procedure SetFlgsalpartatuaria(const Value: TCmDbField);
    procedure SetFlgsalpartretro(const Value: TCmDbField);
    procedure SetFlgsalref(const Value: TCmDbField);
    procedure SetFlgtprubrica(const Value: TCmDbField);
    procedure SetFlguso(const Value: TCmDbField);
    procedure SetIdbenefsalar(const Value: TCmDbField);
    procedure SetIdfundacao(const Value: TCmDbField);
    procedure SetIdgruporubrica(const Value: TCmDbField);
    procedure SetIdinforme(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdprovento(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdregra13(const Value: TCmDbField);
    procedure SetIdregraferias(const Value: TCmDbField);
    procedure SetIdregrarescisao(const Value: TCmDbField);
    procedure SetNumprioridade(const Value: TCmDbField);
    procedure SetNumprioridadefb(const Value: TCmDbField);
    procedure SetPrazo(const Value: TCmDbField);
    procedure SetTipobasedesconto(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipobasedesconto: TCmDbField read FTipobasedesconto write SetTipobasedesconto;
     Property Prazo: TCmDbField read FPrazo write SetPrazo;
     Property Numprioridadefb: TCmDbField read FNumprioridadefb write SetNumprioridadefb;
     Property Numprioridade: TCmDbField read FNumprioridade write SetNumprioridade;
     Property Idregra13: TCmDbField read FIdregra13 write SetIdregra13;
     Property Idregrarescisao: TCmDbField read FIdregrarescisao write SetIdregrarescisao;
     Property Idregraferias: TCmDbField read FIdregraferias write SetIdregraferias;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idprovento: TCmDbField read FIdprovento write SetIdprovento;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idinforme: TCmDbField read FIdinforme write SetIdinforme;
     Property Idgruporubrica: TCmDbField read FIdgruporubrica write SetIdgruporubrica;
     Property Idfundacao: TCmDbField read FIdfundacao write SetIdfundacao;
     Property Idbenefsalar: TCmDbField read FIdbenefsalar write SetIdbenefsalar;
     Property Flguso: TCmDbField read FFlguso write SetFlguso;
     Property Flgtprubrica: TCmDbField read FFlgtprubrica write SetFlgtprubrica;
     Property Flgsalref: TCmDbField read FFlgsalref write SetFlgsalref;
     Property Flgsalpartretro: TCmDbField read FFlgsalpartretro write SetFlgsalpartretro;
     Property Flgsalpartatuaria: TCmDbField read FFlgsalpartatuaria write SetFlgsalpartatuaria;
     Property Flgsalfamilia: TCmDbField read FFlgsalfamilia write SetFlgsalfamilia;
     Property Flgsalbenefretro: TCmDbField read FFlgsalbenefretro write SetFlgsalbenefretro;
     Property Flgrublegal: TCmDbField read FFlgrublegal write SetFlgrublegal;
     Property Flgrescisao: TCmDbField read FFlgrescisao write SetFlgrescisao;
     Property Flgrais: TCmDbField read FFlgrais write SetFlgrais;
     Property Flgprorata: TCmDbField read FFlgprorata write SetFlgprorata;
     Property Flgobrigafavorec: TCmDbField read FFlgobrigafavorec write SetFlgobrigafavorec;
     Property Flgmargemconsig: TCmDbField read FFlgmargemconsig write SetFlgmargemconsig;
     Property Flgirrfacjud: TCmDbField read FFlgirrfacjud write SetFlgirrfacjud;
     Property Flgirrf: TCmDbField read FFlgirrf write SetFlgirrf;
     Property Flginterno: TCmDbField read FFlginterno write SetFlginterno;
     Property Flginss: TCmDbField read FFlginss write SetFlginss;
     Property Flgincidesalpart: TCmDbField read FFlgincidesalpart write SetFlgincidesalpart;
     Property Flgincidecontrib: TCmDbField read FFlgincidecontrib write SetFlgincidecontrib;
     Property Flgfgts: TCmDbField read FFlgfgts write SetFlgfgts;
     Property Flgferias: TCmDbField read FFlgferias write SetFlgferias;
     Property Flgexcjud: TCmDbField read FFlgexcjud write SetFlgexcjud;
     Property Flgestadorub: TCmDbField read FFlgestadorub write SetFlgestadorub;
     Property Flgespecial: TCmDbField read FFlgespecial write SetFlgespecial;
     Property Flgdescpensao: TCmDbField read FFlgdescpensao write SetFlgdescpensao;
     Property Flgdesconto: TCmDbField read FFlgdesconto write SetFlgdesconto;
     Property Flgdecimoterceiro: TCmDbField read FFlgdecimoterceiro write SetFlgdecimoterceiro;
     Property Flgconstafolha: TCmDbField read FFlgconstafolha write SetFlgconstafolha;
     Property Flgconsolida: TCmDbField read FFlgconsolida write SetFlgconsolida;
     Property Flgcompoesalpart: TCmDbField read FFlgcompoesalpart write SetFlgcompoesalpart;
     Property Flgcompoesalbenef: TCmDbField read FFlgcompoesalbenef write SetFlgcompoesalbenef;
     Property Flgcompoeremtotal: TCmDbField read FFlgcompoeremtotal write SetFlgcompoeremtotal;
     Property Flgatrasodevol: TCmDbField read FFlgatrasodevol write SetFlgatrasodevol;
     Property Flgagrupa: TCmDbField read FFlgagrupa write SetFlgagrupa;
     Property Flgadiantferias: TCmDbField read FFlgadiantferias write SetFlgadiantferias;
     Property Descrprovdesc: TCmDbField read FDescrprovdesc write SetDescrprovdesc;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Descparcial: TCmDbField read FDescparcial write SetDescparcial;
     Property Codrubclt: TCmDbField read FCodrubclt write SetCodrubclt;
     Property Codprovdesc: TCmDbField read FCodprovdesc write SetCodprovdesc;
     Property Codirrfdarf: TCmDbField read FCodirrfdarf write SetCodirrfdarf;
     Property Codfontepagadora: TCmDbField read FCodfontepagadora write SetCodfontepagadora;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbProvdesc }

constructor TDbProvdesc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROVDESC';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'TRGUSERINCLUSAO');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'TRGDTINCLUSAO');
   fTipobasedesconto := CreateCmDbField('TIPOBASEDESCONTO',ftfloat,False,False,False,True,'TIPOBASEDESCONTO');
   fPrazo := CreateCmDbField('PRAZO',ftfloat,False,False,False,True,'PRAZO');
   fNumprioridadefb := CreateCmDbField('NUMPRIORIDADEFB',ftfloat,False,False,False,True,'NUMPRIORIDADEFB');
   fNumprioridade := CreateCmDbField('NUMPRIORIDADE',ftfloat,False,False,False,True,'NUMPRIORIDADE');
   fIdregra13 := CreateCmDbField('IDREGRA13',ftfloat,False,False,False,True,'IDREGRA13');
   fIdregrarescisao := CreateCmDbField('IDREGRARESCISAO',ftfloat,False,False,False,True,'IDREGRARESCISAO');
   fIdregraferias := CreateCmDbField('IDREGRAFERIAS',ftfloat,False,False,False,True,'IDREGRAFERIAS');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'IDREGRA');
   fIdprovento := CreateCmDbField('IDPROVENTO',ftfloat,True,True,False,True,'IDPROVENTO');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'IDMODULO');
   fIdinforme := CreateCmDbField('IDINFORME',ftfloat,False,False,False,True,'IDINFORME');
   fIdgruporubrica := CreateCmDbField('IDGRUPORUBRICA',ftString,False,False,False,True,'IDGRUPORUBRICA');
   fIdfundacao := CreateCmDbField('IDFUNDACAO',ftfloat,False,False,False,True,'IDFUNDACAO');
   fIdbenefsalar := CreateCmDbField('IDBENEFSALAR',ftfloat,False,False,False,True,'IDBENEFSALAR');
   fFlguso := CreateCmDbField('FLGUSO',ftString,False,False,False,True,'FLGUSO');
   fFlgtprubrica := CreateCmDbField('FLGTPRUBRICA',ftString,False,False,False,True,'FLGTPRUBRICA');
   fFlgsalref := CreateCmDbField('FLGSALREF',ftfloat,False,False,False,True,'FLGSALREF');
   fFlgsalpartretro := CreateCmDbField('FLGSALPARTRETRO',ftfloat,False,False,False,True,'FLGSALPARTRETRO');
   fFlgsalpartatuaria := CreateCmDbField('FLGSALPARTATUARIA',ftfloat,False,False,False,True,'FLGSALPARTATUARIA');
   fFlgsalfamilia := CreateCmDbField('FLGSALFAMILIA',ftfloat,False,False,False,True,'FLGSALFAMILIA');
   fFlgsalbenefretro := CreateCmDbField('FLGSALBENEFRETRO',ftfloat,False,False,False,True,'FLGSALBENEFRETRO');
   fFlgrublegal := CreateCmDbField('FLGRUBLEGAL',ftfloat,False,False,False,True,'FLGRUBLEGAL');
   fFlgrescisao := CreateCmDbField('FLGRESCISAO',ftfloat,False,False,False,True,'FLGRESCISAO');
   fFlgrais := CreateCmDbField('FLGRAIS',ftfloat,False,False,False,True,'FLGRAIS');
   fFlgprorata := CreateCmDbField('FLGPRORATA',ftfloat,False,False,False,True,'FLGPRORATA');
   fFlgobrigafavorec := CreateCmDbField('FLGOBRIGAFAVOREC',ftfloat,False,False,False,True,'FLGOBRIGAFAVOREC');
   fFlgmargemconsig := CreateCmDbField('FLGMARGEMCONSIG',ftfloat,False,False,False,True,'FLGMARGEMCONSIG');
   fFlgirrfacjud := CreateCmDbField('FLGIRRFACJUD',ftfloat,False,False,False,True,'FLGIRRFACJUD');
   fFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,False,False,False,True,'FLGIRRF');
   fFlginterno := CreateCmDbField('FLGINTERNO',ftfloat,False,False,False,True,'FLGINTERNO');
   fFlginss := CreateCmDbField('FLGINSS',ftfloat,False,False,False,True,'FLGINSS');
   fFlgincidesalpart := CreateCmDbField('FLGINCIDESALPART',ftfloat,False,False,False,True,'FLGINCIDESALPART');
   fFlgincidecontrib := CreateCmDbField('FLGINCIDECONTRIB',ftfloat,False,False,False,True,'FLGINCIDECONTRIB');
   fFlgfgts := CreateCmDbField('FLGFGTS',ftfloat,False,False,False,True,'FLGFGTS');
   fFlgferias := CreateCmDbField('FLGFERIAS',ftfloat,False,False,False,True,'FLGFERIAS');
   fFlgexcjud := CreateCmDbField('FLGEXCJUD',ftfloat,True,False,False,True,'FLGEXCJUD');
   fFlgestadorub := CreateCmDbField('FLGESTADORUB',ftString,False,False,False,True,'FLGESTADORUB');
   fFlgespecial := CreateCmDbField('FLGESPECIAL',ftfloat,False,False,False,True,'FLGESPECIAL');
   fFlgdescpensao := CreateCmDbField('FLGDESCPENSAO',ftfloat,False,False,False,True,'FLGDESCPENSAO');
   fFlgdesconto := CreateCmDbField('FLGDESCONTO',ftfloat,False,False,False,True,'FLGDESCONTO');
   fFlgdecimoterceiro := CreateCmDbField('FLGDECIMOTERCEIRO',ftfloat,False,False,False,True,'FLGDECIMOTERCEIRO');
   fFlgconstafolha := CreateCmDbField('FLGCONSTAFOLHA',ftfloat,False,False,False,True,'FLGCONSTAFOLHA');
   fFlgconsolida := CreateCmDbField('FLGCONSOLIDA',ftfloat,False,False,False,True,'FLGCONSOLIDA');
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,False,False,False,True,'FLGCOMPOESALPART');
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,False,False,False,True,'FLGCOMPOESALBENEF');
   fFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,False,False,False,True,'FLGCOMPOEREMTOTAL');
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,False,False,False,True,'FLGATRASODEVOL');
   fFlgagrupa := CreateCmDbField('FLGAGRUPA',ftfloat,False,False,False,True,'FLGAGRUPA');
   fFlgadiantferias := CreateCmDbField('FLGADIANTFERIAS',ftString,False,False,False,True,'FLGADIANTFERIAS');
   fDescrprovdesc := CreateCmDbField('DESCRPROVDESC',ftString,False,False,False,True,'DESCRPROVDESC');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'DESCRICAO');
   fDescparcial := CreateCmDbField('DESCPARCIAL',ftfloat,False,False,False,True,'DESCPARCIAL');
   fCodrubclt := CreateCmDbField('CODRUBCLT',ftString,False,False,False,True,'CODRUBCLT');
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,False,False,False,True,'CODPROVDESC');
   fCodirrfdarf := CreateCmDbField('CODIRRFDARF',ftString,False,False,False,True,'CODIRRFDARF');
   fCodfontepagadora := CreateCmDbField('CODFONTEPAGADORA',ftfloat,False,False,False,True,'CODFONTEPAGADORA');
end;

function TDbProvdesc.Insert: Boolean;
begin

   fTrguserinclusao.AsFloat := GetSequence('TRGUSERINCLUSAO');
   fTrgdtinclusao.AsFloat := GetSequence('TRGDTINCLUSAO');
   fTipobasedesconto.AsFloat := GetSequence('TIPOBASEDESCONTO');
   fPrazo.AsFloat := GetSequence('PRAZO');
   fNumprioridadefb.AsFloat := GetSequence('NUMPRIORIDADEFB');
   fNumprioridade.AsFloat := GetSequence('NUMPRIORIDADE');
   fIdregra13.AsFloat := GetSequence('IDREGRA13');
   fIdregrarescisao.AsFloat := GetSequence('IDREGRARESCISAO');
   fIdregraferias.AsFloat := GetSequence('IDREGRAFERIAS');
   fIdregra.AsFloat := GetSequence('IDREGRA');
   fIdprovento.AsFloat := GetSequence('IDPROVENTO');
   fIdmodulo.AsFloat := GetSequence('IDMODULO');
   fIdinforme.AsFloat := GetSequence('IDINFORME');
   fIdgruporubrica.AsFloat := GetSequence('IDGRUPORUBRICA');
   fIdfundacao.AsFloat := GetSequence('IDFUNDACAO');
   fIdbenefsalar.AsFloat := GetSequence('IDBENEFSALAR');
   fFlguso.AsFloat := GetSequence('FLGUSO');
   fFlgtprubrica.AsFloat := GetSequence('FLGTPRUBRICA');
   fFlgsalref.AsFloat := GetSequence('FLGSALREF');
   fFlgsalpartretro.AsFloat := GetSequence('FLGSALPARTRETRO');
   fFlgsalpartatuaria.AsFloat := GetSequence('FLGSALPARTATUARIA');
   fFlgsalfamilia.AsFloat := GetSequence('FLGSALFAMILIA');
   fFlgsalbenefretro.AsFloat := GetSequence('FLGSALBENEFRETRO');
   fFlgrublegal.AsFloat := GetSequence('FLGRUBLEGAL');
   fFlgrescisao.AsFloat := GetSequence('FLGRESCISAO');
   fFlgrais.AsFloat := GetSequence('FLGRAIS');
   fFlgprorata.AsFloat := GetSequence('FLGPRORATA');
   fFlgobrigafavorec.AsFloat := GetSequence('FLGOBRIGAFAVOREC');
   fFlgmargemconsig.AsFloat := GetSequence('FLGMARGEMCONSIG');
   fFlgirrfacjud.AsFloat := GetSequence('FLGIRRFACJUD');
   fFlgirrf.AsFloat := GetSequence('FLGIRRF');
   fFlginterno.AsFloat := GetSequence('FLGINTERNO');
   fFlginss.AsFloat := GetSequence('FLGINSS');
   fFlgincidesalpart.AsFloat := GetSequence('FLGINCIDESALPART');
   fFlgincidecontrib.AsFloat := GetSequence('FLGINCIDECONTRIB');
   fFlgfgts.AsFloat := GetSequence('FLGFGTS');
   fFlgferias.AsFloat := GetSequence('FLGFERIAS');
   fFlgexcjud.AsFloat := GetSequence('FLGEXCJUD');
   fFlgestadorub.AsFloat := GetSequence('FLGESTADORUB');
   fFlgespecial.AsFloat := GetSequence('FLGESPECIAL');
   fFlgdescpensao.AsFloat := GetSequence('FLGDESCPENSAO');
   fFlgdesconto.AsFloat := GetSequence('FLGDESCONTO');
   fFlgdecimoterceiro.AsFloat := GetSequence('FLGDECIMOTERCEIRO');
   fFlgconstafolha.AsFloat := GetSequence('FLGCONSTAFOLHA');
   fFlgconsolida.AsFloat := GetSequence('FLGCONSOLIDA');
   fFlgcompoesalpart.AsFloat := GetSequence('FLGCOMPOESALPART');
   fFlgcompoesalbenef.AsFloat := GetSequence('FLGCOMPOESALBENEF');
   fFlgcompoeremtotal.AsFloat := GetSequence('FLGCOMPOEREMTOTAL');
   fFlgatrasodevol.AsFloat := GetSequence('FLGATRASODEVOL');
   fFlgagrupa.AsFloat := GetSequence('FLGAGRUPA');
   fFlgadiantferias.AsFloat := GetSequence('FLGADIANTFERIAS');
   fDescrprovdesc.AsFloat := GetSequence('DESCRPROVDESC');
   fDescricao.AsFloat := GetSequence('DESCRICAO');
   fDescparcial.AsFloat := GetSequence('DESCPARCIAL');
   fCodrubclt.AsFloat := GetSequence('CODRUBCLT');
   fCodprovdesc.AsFloat := GetSequence('CODPROVDESC');
   fCodirrfdarf.AsFloat := GetSequence('CODIRRFDARF');
   fCodfontepagadora.AsFloat := GetSequence('CODFONTEPAGADORA');
   Result := Inherited Insert;

end;


procedure TDbProvdesc.SetCodfontepagadora(const Value: TCmDbField);
begin
  FCodfontepagadora := Value;
end;

procedure TDbProvdesc.SetCodirrfdarf(const Value: TCmDbField);
begin
  FCodirrfdarf := Value;
end;

procedure TDbProvdesc.SetCodprovdesc(const Value: TCmDbField);
begin
  FCodprovdesc := Value;
end;

procedure TDbProvdesc.SetCodrubclt(const Value: TCmDbField);
begin
  FCodrubclt := Value;
end;

procedure TDbProvdesc.SetDescparcial(const Value: TCmDbField);
begin
  FDescparcial := Value;
end;

procedure TDbProvdesc.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbProvdesc.SetDescrprovdesc(const Value: TCmDbField);
begin
  FDescrprovdesc := Value;
end;

procedure TDbProvdesc.SetFlgadiantferias(const Value: TCmDbField);
begin
  FFlgadiantferias := Value;
end;

procedure TDbProvdesc.SetFlgagrupa(const Value: TCmDbField);
begin
  FFlgagrupa := Value;
end;

procedure TDbProvdesc.SetFlgatrasodevol(const Value: TCmDbField);
begin
  FFlgatrasodevol := Value;
end;

procedure TDbProvdesc.SetFlgcompoeremtotal(const Value: TCmDbField);
begin
  FFlgcompoeremtotal := Value;
end;

procedure TDbProvdesc.SetFlgcompoesalbenef(const Value: TCmDbField);
begin
  FFlgcompoesalbenef := Value;
end;

procedure TDbProvdesc.SetFlgcompoesalpart(const Value: TCmDbField);
begin
  FFlgcompoesalpart := Value;
end;

procedure TDbProvdesc.SetFlgconsolida(const Value: TCmDbField);
begin
  FFlgconsolida := Value;
end;

procedure TDbProvdesc.SetFlgconstafolha(const Value: TCmDbField);
begin
  FFlgconstafolha := Value;
end;

procedure TDbProvdesc.SetFlgdecimoterceiro(const Value: TCmDbField);
begin
  FFlgdecimoterceiro := Value;
end;

procedure TDbProvdesc.SetFlgdesconto(const Value: TCmDbField);
begin
  FFlgdesconto := Value;
end;

procedure TDbProvdesc.SetFlgdescpensao(const Value: TCmDbField);
begin
  FFlgdescpensao := Value;
end;

procedure TDbProvdesc.SetFlgespecial(const Value: TCmDbField);
begin
  FFlgespecial := Value;
end;

procedure TDbProvdesc.SetFlgestadorub(const Value: TCmDbField);
begin
  FFlgestadorub := Value;
end;

procedure TDbProvdesc.SetFlgexcjud(const Value: TCmDbField);
begin
  FFlgexcjud := Value;
end;

procedure TDbProvdesc.SetFlgferias(const Value: TCmDbField);
begin
  FFlgferias := Value;
end;

procedure TDbProvdesc.SetFlgfgts(const Value: TCmDbField);
begin
  FFlgfgts := Value;
end;

procedure TDbProvdesc.SetFlgincidecontrib(const Value: TCmDbField);
begin
  FFlgincidecontrib := Value;
end;

procedure TDbProvdesc.SetFlgincidesalpart(const Value: TCmDbField);
begin
  FFlgincidesalpart := Value;
end;

procedure TDbProvdesc.SetFlginss(const Value: TCmDbField);
begin
  FFlginss := Value;
end;

procedure TDbProvdesc.SetFlginterno(const Value: TCmDbField);
begin
  FFlginterno := Value;
end;

procedure TDbProvdesc.SetFlgirrf(const Value: TCmDbField);
begin
  FFlgirrf := Value;
end;

procedure TDbProvdesc.SetFlgirrfacjud(const Value: TCmDbField);
begin
  FFlgirrfacjud := Value;
end;

procedure TDbProvdesc.SetFlgmargemconsig(const Value: TCmDbField);
begin
  FFlgmargemconsig := Value;
end;

procedure TDbProvdesc.SetFlgobrigafavorec(const Value: TCmDbField);
begin
  FFlgobrigafavorec := Value;
end;

procedure TDbProvdesc.SetFlgprorata(const Value: TCmDbField);
begin
  FFlgprorata := Value;
end;

procedure TDbProvdesc.SetFlgrais(const Value: TCmDbField);
begin
  FFlgrais := Value;
end;

procedure TDbProvdesc.SetFlgrescisao(const Value: TCmDbField);
begin
  FFlgrescisao := Value;
end;

procedure TDbProvdesc.SetFlgrublegal(const Value: TCmDbField);
begin
  FFlgrublegal := Value;
end;

procedure TDbProvdesc.SetFlgsalbenefretro(const Value: TCmDbField);
begin
  FFlgsalbenefretro := Value;
end;

procedure TDbProvdesc.SetFlgsalfamilia(const Value: TCmDbField);
begin
  FFlgsalfamilia := Value;
end;

procedure TDbProvdesc.SetFlgsalpartatuaria(const Value: TCmDbField);
begin
  FFlgsalpartatuaria := Value;
end;

procedure TDbProvdesc.SetFlgsalpartretro(const Value: TCmDbField);
begin
  FFlgsalpartretro := Value;
end;

procedure TDbProvdesc.SetFlgsalref(const Value: TCmDbField);
begin
  FFlgsalref := Value;
end;

procedure TDbProvdesc.SetFlgtprubrica(const Value: TCmDbField);
begin
  FFlgtprubrica := Value;
end;

procedure TDbProvdesc.SetFlguso(const Value: TCmDbField);
begin
  FFlguso := Value;
end;

procedure TDbProvdesc.SetIdbenefsalar(const Value: TCmDbField);
begin
  FIdbenefsalar := Value;
end;

procedure TDbProvdesc.SetIdfundacao(const Value: TCmDbField);
begin
  FIdfundacao := Value;
end;

procedure TDbProvdesc.SetIdgruporubrica(const Value: TCmDbField);
begin
  FIdgruporubrica := Value;
end;

procedure TDbProvdesc.SetIdinforme(const Value: TCmDbField);
begin
  FIdinforme := Value;
end;

procedure TDbProvdesc.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbProvdesc.SetIdprovento(const Value: TCmDbField);
begin
  FIdprovento := Value;
end;

procedure TDbProvdesc.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbProvdesc.SetIdregra13(const Value: TCmDbField);
begin
  FIdregra13 := Value;
end;

procedure TDbProvdesc.SetIdregraferias(const Value: TCmDbField);
begin
  FIdregraferias := Value;
end;

procedure TDbProvdesc.SetIdregrarescisao(const Value: TCmDbField);
begin
  FIdregrarescisao := Value;
end;

procedure TDbProvdesc.SetNumprioridade(const Value: TCmDbField);
begin
  FNumprioridade := Value;
end;

procedure TDbProvdesc.SetNumprioridadefb(const Value: TCmDbField);
begin
  FNumprioridadefb := Value;
end;

procedure TDbProvdesc.SetPrazo(const Value: TCmDbField);
begin
  FPrazo := Value;
end;

procedure TDbProvdesc.SetTipobasedesconto(const Value: TCmDbField);
begin
  FTipobasedesconto := Value;
end;

procedure TDbProvdesc.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbProvdesc.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



