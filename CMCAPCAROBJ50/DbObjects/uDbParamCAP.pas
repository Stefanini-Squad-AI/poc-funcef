{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Fábio Barros da Silva           }
{ Atualizado Em: 29/07/2002                             }
{                22/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamCAP;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamCAP = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FFlghist: TCmDbField;
    FFlgexcluicontab: TCmDbField;
    FFlgdocto: TCmDbField;
    FCodaltmulta: TCmDbField;
    FFlgstatusfinanc: TCmDbField;
    FFlgtrdxccxconta: TCmDbField;
    FCodalteradorabat: TCmDbField;
    FFlgcorrigedocauto: TCmDbField;
    FFlgforn: TCmDbField;
    FDd90: TCmDbField;
    FDd120: TCmDbField;
    FFlgexcluiplanil: TCmDbField;
    FIntegracontab: TCmDbField;
    FFlglancafloat: TCmDbField;
    FFlgemitelancbaix: TCmDbField;
    FImpgenerica: TCmDbField;
    FCodalteradordesc: TCmDbField;
    FCodaltjurossimples: TCmDbField;
    FFlgcompltipofat: TCmDbField;
    FFlgtrdximpostos: TCmDbField;
    FLocalemischeque: TCmDbField;
    FFlgestexcfinanc: TCmDbField;
    FOrigemcm: TCmDbField;
    FFlgobrigformapgto: TCmDbField;
    FLancafinanc: TCmDbField;
    FFlgcontabemischq: TCmDbField;
    FIdimpressora: TCmDbField;
    FDd150: TCmDbField;
    FMascaradesemb: TCmDbField;
    FDd30: TCmDbField;
    FCodalteradorjuros: TCmDbField;
    FPlanocontabchq: TCmDbField;
    FIdramofornecedor: TCmDbField;
    FFlgdtprog: TCmDbField;
    FHistpadfinan: TCmDbField;
    FCodalteradortarif: TCmDbField;
    FNumdiasvencto: TCmDbField;
    FDd60: TCmDbField;
    FFlgcontrolacheque: TCmDbField;
    FCodadforne: TCmDbField;
    FCodaltcorrecao: TCmDbField;
    FFlgvalidaccbaixa: TCmDbField;
    FIdtipocliadianto: TCmDbField;
    FIdreports: TCmDbField;
    FFlgdestinase: TCmDbField;
    FRecpag: TCmDbField;
    FCodportforma: TCmDbField;
    FMascaranodocum: TCmDbField;
    FCodaltjuroscomposto: TCmDbField;
    FFlgvalor: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FCodtipdoccpmf: TCmDbField;
    FDd180: TCmDbField;
    FPlacontacontabchq: TCmDbField;
    FFlglocal: TCmDbField;
    FFLGModAdDocPG: TCmDbField;
    FFLGBAIXACHQ: TCmDbField;
    FFLGSLIPAUTO: TCmDbField;
    FFLGOPAUTO: TCmDbField;
    FFLGRADLOTE: TCmDbField;
    FFLGACESSLANCDOC: TCmDbField; //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
    procedure SetCodadforne(const Value: TCmDbField);
    procedure SetCodaltcorrecao(const Value: TCmDbField);
    procedure SetCodalteradorabat(const Value: TCmDbField);
    procedure SetCodalteradordesc(const Value: TCmDbField);
    procedure SetCodalteradorjuros(const Value: TCmDbField);
    procedure SetCodalteradortarif(const Value: TCmDbField);
    procedure SetCodaltjuroscomposto(const Value: TCmDbField);
    procedure SetCodaltjurossimples(const Value: TCmDbField);
    procedure SetCodaltmulta(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodtipdoccpmf(const Value: TCmDbField);
    procedure SetDd120(const Value: TCmDbField);
    procedure SetDd150(const Value: TCmDbField);
    procedure SetDd180(const Value: TCmDbField);
    procedure SetDd30(const Value: TCmDbField);
    procedure SetDd60(const Value: TCmDbField);
    procedure SetDd90(const Value: TCmDbField);
    procedure SetFlgcompltipofat(const Value: TCmDbField);
    procedure SetFlgcontabemischq(const Value: TCmDbField);
    procedure SetFlgcontrolacheque(const Value: TCmDbField);
    procedure SetFlgcorrigedocauto(const Value: TCmDbField);
    procedure SetFlgdestinase(const Value: TCmDbField);
    procedure SetFlgdocto(const Value: TCmDbField);
    procedure SetFlgdtprog(const Value: TCmDbField);
    procedure SetFlgemitelancbaix(const Value: TCmDbField);
    procedure SetFlgestexcfinanc(const Value: TCmDbField);
    procedure SetFlgexcluicontab(const Value: TCmDbField);
    procedure SetFlgexcluiplanil(const Value: TCmDbField);
    procedure SetFlgforn(const Value: TCmDbField);
    procedure SetFlghist(const Value: TCmDbField);
    procedure SetFlglancafloat(const Value: TCmDbField);
    procedure SetFlglocal(const Value: TCmDbField);
    procedure SetFlgobrigformapgto(const Value: TCmDbField);
    procedure SetFlgstatusfinanc(const Value: TCmDbField);
    procedure SetFlgtrdxccxconta(const Value: TCmDbField);
    procedure SetFlgtrdximpostos(const Value: TCmDbField);
    procedure SetFlgvalidaccbaixa(const Value: TCmDbField);
    procedure SetFlgvalor(const Value: TCmDbField);
    procedure SetHistpadfinan(const Value: TCmDbField);
    procedure SetIdimpressora(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdramofornecedor(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetIdtipocliadianto(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetImpgenerica(const Value: TCmDbField);
    procedure SetIntegracontab(const Value: TCmDbField);
    procedure SetLancafinanc(const Value: TCmDbField);
    procedure SetLocalemischeque(const Value: TCmDbField);
    procedure SetMascaradesemb(const Value: TCmDbField);
    procedure SetMascaranodocum(const Value: TCmDbField);
    procedure SetNumdiasvencto(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
    procedure SetPlacontacontabchq(const Value: TCmDbField);
    procedure SetPlanocontabchq(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetFLGModAdDocPG(const Value: TCmDbField);
    procedure SetFLGBAIXACHQ(const Value: TCmDbField);
    procedure SetFLGOPAUTO(const Value: TCmDbField);
    procedure SetFLGRADLOTE(const Value: TCmDbField);
    procedure SetFLGSLIPAUTO(const Value: TCmDbField);
    procedure SetFLGACESSLANCDOC(const Value: TCmDbField); //Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Planocontabchq: TCmDbField read FPlanocontabchq write SetPlanocontabchq;
     Property Placontacontabchq: TCmDbField read FPlacontacontabchq write SetPlacontacontabchq;
     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Numdiasvencto: TCmDbField read FNumdiasvencto write SetNumdiasvencto;
     Property Mascaranodocum: TCmDbField read FMascaranodocum write SetMascaranodocum;
     Property Mascaradesemb: TCmDbField read FMascaradesemb write SetMascaradesemb;
     Property Localemischeque: TCmDbField read FLocalemischeque write SetLocalemischeque;
     Property Lancafinanc: TCmDbField read FLancafinanc write SetLancafinanc;
     Property Integracontab: TCmDbField read FIntegracontab write SetIntegracontab;
     Property Impgenerica: TCmDbField read FImpgenerica write SetImpgenerica;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idtipocliadianto: TCmDbField read FIdtipocliadianto write SetIdtipocliadianto;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idramofornecedor: TCmDbField read FIdramofornecedor write SetIdramofornecedor;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idimpressora: TCmDbField read FIdimpressora write SetIdimpressora;
     Property Histpadfinan: TCmDbField read FHistpadfinan write SetHistpadfinan;
     Property Flgvalor: TCmDbField read FFlgvalor write SetFlgvalor;
     Property Flgvalidaccbaixa: TCmDbField read FFlgvalidaccbaixa write SetFlgvalidaccbaixa;
     Property Flgtrdximpostos: TCmDbField read FFlgtrdximpostos write SetFlgtrdximpostos;
     Property Flgtrdxccxconta: TCmDbField read FFlgtrdxccxconta write SetFlgtrdxccxconta;
     Property Flgstatusfinanc: TCmDbField read FFlgstatusfinanc write SetFlgstatusfinanc;
     Property Flgobrigformapgto: TCmDbField read FFlgobrigformapgto write SetFlgobrigformapgto;
     Property Flglocal: TCmDbField read FFlglocal write SetFlglocal;
     Property Flglancafloat: TCmDbField read FFlglancafloat write SetFlglancafloat;
     Property Flghist: TCmDbField read FFlghist write SetFlghist;
     Property Flgforn: TCmDbField read FFlgforn write SetFlgforn;
     Property Flgexcluiplanil: TCmDbField read FFlgexcluiplanil write SetFlgexcluiplanil;
     Property Flgexcluicontab: TCmDbField read FFlgexcluicontab write SetFlgexcluicontab;
     Property Flgestexcfinanc: TCmDbField read FFlgestexcfinanc write SetFlgestexcfinanc;
     Property Flgemitelancbaix: TCmDbField read FFlgemitelancbaix write SetFlgemitelancbaix;
     Property Flgdtprog: TCmDbField read FFlgdtprog write SetFlgdtprog;
     Property Flgdocto: TCmDbField read FFlgdocto write SetFlgdocto;
     Property Flgdestinase: TCmDbField read FFlgdestinase write SetFlgdestinase;
     Property Flgcorrigedocauto: TCmDbField read FFlgcorrigedocauto write SetFlgcorrigedocauto;
     Property Flgcontrolacheque: TCmDbField read FFlgcontrolacheque write SetFlgcontrolacheque;
     Property Flgcontabemischq: TCmDbField read FFlgcontabemischq write SetFlgcontabemischq;
     Property Flgcompltipofat: TCmDbField read FFlgcompltipofat write SetFlgcompltipofat;
     Property Dd90: TCmDbField read FDd90 write SetDd90;
     Property Dd60: TCmDbField read FDd60 write SetDd60;
     Property Dd30: TCmDbField read FDd30 write SetDd30;
     Property Dd180: TCmDbField read FDd180 write SetDd180;
     Property Dd150: TCmDbField read FDd150 write SetDd150;
     Property Dd120: TCmDbField read FDd120 write SetDd120;
     Property Codtipdoccpmf: TCmDbField read FCodtipdoccpmf write SetCodtipdoccpmf;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codaltmulta: TCmDbField read FCodaltmulta write SetCodaltmulta;
     Property Codaltjurossimples: TCmDbField read FCodaltjurossimples write SetCodaltjurossimples;
     Property Codaltjuroscomposto: TCmDbField read FCodaltjuroscomposto write SetCodaltjuroscomposto;
     Property Codalteradortarif: TCmDbField read FCodalteradortarif write SetCodalteradortarif;
     Property Codalteradorjuros: TCmDbField read FCodalteradorjuros write SetCodalteradorjuros;
     Property Codalteradordesc: TCmDbField read FCodalteradordesc write SetCodalteradordesc;
     Property Codalteradorabat: TCmDbField read FCodalteradorabat write SetCodalteradorabat;
     Property Codaltcorrecao: TCmDbField read FCodaltcorrecao write SetCodaltcorrecao;
     Property Codadforne: TCmDbField read FCodadforne write SetCodadforne;
     Property flgModAdDocPG: TCmDbField read FFLGModAdDocPG write SetFLGModAdDocPG;
     Property FLGSLIPAUTO: TCmDbField read FFLGSLIPAUTO write SetFLGSLIPAUTO;
     Property FLGBAIXACHQ: TCmDbField read FFLGBAIXACHQ write SetFLGBAIXACHQ;
     Property FLGOPAUTO: TCmDbField read FFLGOPAUTO write SetFLGOPAUTO;
     Property FLGRADLOTE: TCmDbField read FFLGRADLOTE write SetFLGRADLOTE;
     Property FLGACESSLANCDOC: TCmDbField read FFLGACESSLANCDOC write SetFLGACESSLANCDOC;//Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamCAP }

constructor TDbParamCAP.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCAP';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,True,False,True,'');
   fPlanocontabchq := CreateCmDbField('PLANOCONTABCHQ',ftfloat,False,False,False,True,'');
   fPlacontacontabchq := CreateCmDbField('PLACONTACONTABCHQ',ftString,False,False,False,True,'');
   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'');
   fNumdiasvencto := CreateCmDbField('NUMDIASVENCTO',ftfloat,False,False,False,True,'');
   fMascaranodocum := CreateCmDbField('MASCARANODOCUM',ftString,False,False,False,True,'');
   fMascaradesemb := CreateCmDbField('MASCARADESEMB',ftString,False,False,False,True,'');
   fLocalemischeque := CreateCmDbField('LOCALEMISCHEQUE',ftString,True,False,False,True,'');
   fLancafinanc := CreateCmDbField('LANCAFINANC',ftString,False,False,False,True,'');
   fIntegracontab := CreateCmDbField('INTEGRACONTAB',ftString,False,False,False,True,'');
   fImpgenerica := CreateCmDbField('IMPGENERICA',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'');
   fIdtipocliadianto := CreateCmDbField('IDTIPOCLIADIANTO',ftfloat,False,False,False,True,'');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIdramofornecedor := CreateCmDbField('IDRAMOFORNECEDOR',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdimpressora := CreateCmDbField('IDIMPRESSORA',ftfloat,False,False,False,True,'');
   fHistpadfinan := CreateCmDbField('HISTPADFINAN',ftfloat,False,False,False,True,'');
   fFlgvalor := CreateCmDbField('FLGVALOR',ftfloat,False,False,False,True,'');
   fFlgvalidaccbaixa := CreateCmDbField('FLGVALIDACCBAIXA',ftString,False,False,False,True,'');
   fFlgtrdximpostos := CreateCmDbField('FLGTRDXIMPOSTOS',ftString,False,False,False,True,'');
   fFlgtrdxccxconta := CreateCmDbField('FLGTRDXCCXCONTA',ftString,False,False,False,True,'');
   fFlgstatusfinanc := CreateCmDbField('FLGSTATUSFINANC',ftString,False,False,False,True,'');
   fFlgobrigformapgto := CreateCmDbField('FLGOBRIGFORMAPGTO',ftString,False,False,False,True,'');
   fFlglocal := CreateCmDbField('FLGLOCAL',ftfloat,False,False,False,True,'');
   fFlglancafloat := CreateCmDbField('FLGLANCAFLOAT',ftString,False,False,False,True,'');
   fFlghist := CreateCmDbField('FLGHIST',ftfloat,False,False,False,True,'');
   fFlgforn := CreateCmDbField('FLGFORN',ftfloat,False,False,False,True,'');
   fFlgexcluiplanil := CreateCmDbField('FLGEXCLUIPLANIL',ftString,False,False,False,True,'');
   fFlgexcluicontab := CreateCmDbField('FLGEXCLUICONTAB',ftString,False,False,False,True,'');
   fFlgestexcfinanc := CreateCmDbField('FLGESTEXCFINANC',ftString,False,False,False,True,'');
   fFlgemitelancbaix := CreateCmDbField('FLGEMITELANCBAIX',ftString,False,False,False,True,'');
   fFlgdtprog := CreateCmDbField('FLGDTPROG',ftfloat,False,False,False,True,'');
   fFlgdocto := CreateCmDbField('FLGDOCTO',ftfloat,False,False,False,True,'');
   fFlgdestinase := CreateCmDbField('FLGDESTINASE',ftfloat,False,False,False,True,'');
   fFlgcorrigedocauto := CreateCmDbField('FLGCORRIGEDOCAUTO',ftString,False,False,False,True,'');
   fFlgcontrolacheque := CreateCmDbField('FLGCONTROLACHEQUE',ftString,False,False,False,True,'');
   fFlgcontabemischq := CreateCmDbField('FLGCONTABEMISCHQ',ftString,False,False,False,True,'');
   fFlgcompltipofat := CreateCmDbField('FLGCOMPLTIPOFAT',ftString,False,False,False,True,'');
   fDd90 := CreateCmDbField('DD90',ftfloat,False,False,False,True,'');
   fDd60 := CreateCmDbField('DD60',ftfloat,False,False,False,True,'');
   fDd30 := CreateCmDbField('DD30',ftfloat,False,False,False,True,'');
   fDd180 := CreateCmDbField('DD180',ftfloat,False,False,False,True,'');
   fDd150 := CreateCmDbField('DD150',ftfloat,False,False,False,True,'');
   fDd120 := CreateCmDbField('DD120',ftfloat,False,False,False,True,'');
   fCodtipdoccpmf := CreateCmDbField('CODTIPDOCCPMF',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodaltmulta := CreateCmDbField('CODALTMULTA',ftfloat,False,False,False,True,'');
   fCodaltjurossimples := CreateCmDbField('CODALTJUROSSIMPLES',ftfloat,False,False,False,True,'');
   fCodaltjuroscomposto := CreateCmDbField('CODALTJUROSCOMPOSTO',ftfloat,False,False,False,True,'');
   fCodalteradortarif := CreateCmDbField('CODALTERADORTARIF',ftfloat,False,False,False,True,'');
   fCodalteradorjuros := CreateCmDbField('CODALTERADORJUROS',ftfloat,False,False,False,True,'');
   fCodalteradordesc := CreateCmDbField('CODALTERADORDESC',ftfloat,False,False,False,True,'');
   fCodalteradorabat := CreateCmDbField('CODALTERADORABAT',ftfloat,False,False,False,True,'');
   fCodaltcorrecao := CreateCmDbField('CODALTCORRECAO',ftfloat,False,False,False,True,'');
   fCodadforne := CreateCmDbField('CODADFORNE',ftfloat,False,False,False,True,'');
   flgModAdDocPG := CreateCmDbField('FLGMODADDOCPG',ftString,False,False,False,True,'');
   FLGSLIPAUTO := CreateCmDbField('FLGSLIPAUTO',ftString,False,False,False,True,'');
   FLGBAIXACHQ := CreateCmDbField('FLGBAIXACHQ',ftString,False,False,False,True,'');
   FLGOPAUTO := CreateCmDbField('FLGOPAUTO',ftString,False,False,False,True,'');
   FLGRADLOTE := CreateCmDbField('FLGRADLOTE',ftfloat,False,False,False,True,'');
   FLGACESSLANCDOC := CreateCmDbField('FLGACESSLANCDOC',ftString,False,False,False,True,'');
   //Linha Acima Bruno Bastos - Pend. 14399 e 14400 - 14/08/2003
end;

function TDbParamCAP.Insert: Boolean;
begin

   //fIdpessoa.AsFloat := GetSequence('PARAMCAP');
   Result := Inherited Insert;

end;


procedure TDbParamCAP.SetCodadforne(const Value: TCmDbField);
begin
  FCodadforne := Value;
end;

procedure TDbParamCAP.SetCodaltcorrecao(const Value: TCmDbField);
begin
  FCodaltcorrecao := Value;
end;

procedure TDbParamCAP.SetCodalteradorabat(const Value: TCmDbField);
begin
  FCodalteradorabat := Value;
end;

procedure TDbParamCAP.SetCodalteradordesc(const Value: TCmDbField);
begin
  FCodalteradordesc := Value;
end;

procedure TDbParamCAP.SetCodalteradorjuros(const Value: TCmDbField);
begin
  FCodalteradorjuros := Value;
end;

procedure TDbParamCAP.SetCodalteradortarif(const Value: TCmDbField);
begin
  FCodalteradortarif := Value;
end;

procedure TDbParamCAP.SetCodaltjuroscomposto(const Value: TCmDbField);
begin
  FCodaltjuroscomposto := Value;
end;

procedure TDbParamCAP.SetCodaltjurossimples(const Value: TCmDbField);
begin
  FCodaltjurossimples := Value;
end;

procedure TDbParamCAP.SetCodaltmulta(const Value: TCmDbField);
begin
  FCodaltmulta := Value;
end;

procedure TDbParamCAP.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbParamCAP.SetCodtipdoccpmf(const Value: TCmDbField);
begin
  FCodtipdoccpmf := Value;
end;

procedure TDbParamCAP.SetDd120(const Value: TCmDbField);
begin
  FDd120 := Value;
end;

procedure TDbParamCAP.SetDd150(const Value: TCmDbField);
begin
  FDd150 := Value;
end;

procedure TDbParamCAP.SetDd180(const Value: TCmDbField);
begin
  FDd180 := Value;
end;

procedure TDbParamCAP.SetDd30(const Value: TCmDbField);
begin
  FDd30 := Value;
end;

procedure TDbParamCAP.SetDd60(const Value: TCmDbField);
begin
  FDd60 := Value;
end;

procedure TDbParamCAP.SetDd90(const Value: TCmDbField);
begin
  FDd90 := Value;
end;

procedure TDbParamCAP.SetFLGBAIXACHQ(const Value: TCmDbField);
begin
  FFLGBAIXACHQ := Value;
end;

procedure TDbParamCAP.SetFlgcompltipofat(const Value: TCmDbField);
begin
  FFlgcompltipofat := Value;
end;

procedure TDbParamCAP.SetFlgcontabemischq(const Value: TCmDbField);
begin
  FFlgcontabemischq := Value;
end;

procedure TDbParamCAP.SetFlgcontrolacheque(const Value: TCmDbField);
begin
  FFlgcontrolacheque := Value;
end;

procedure TDbParamCAP.SetFlgcorrigedocauto(const Value: TCmDbField);
begin
  FFlgcorrigedocauto := Value;
end;

procedure TDbParamCAP.SetFlgdestinase(const Value: TCmDbField);
begin
  FFlgdestinase := Value;
end;

procedure TDbParamCAP.SetFlgdocto(const Value: TCmDbField);
begin
  FFlgdocto := Value;
end;

procedure TDbParamCAP.SetFlgdtprog(const Value: TCmDbField);
begin
  FFlgdtprog := Value;
end;

procedure TDbParamCAP.SetFlgemitelancbaix(const Value: TCmDbField);
begin
  FFlgemitelancbaix := Value;
end;

procedure TDbParamCAP.SetFlgestexcfinanc(const Value: TCmDbField);
begin
  FFlgestexcfinanc := Value;
end;

procedure TDbParamCAP.SetFlgexcluicontab(const Value: TCmDbField);
begin
  FFlgexcluicontab := Value;
end;

procedure TDbParamCAP.SetFlgexcluiplanil(const Value: TCmDbField);
begin
  FFlgexcluiplanil := Value;
end;

procedure TDbParamCAP.SetFlgforn(const Value: TCmDbField);
begin
  FFlgforn := Value;
end;

procedure TDbParamCAP.SetFlghist(const Value: TCmDbField);
begin
  FFlghist := Value;
end;

procedure TDbParamCAP.SetFlglancafloat(const Value: TCmDbField);
begin
  FFlglancafloat := Value;
end;

procedure TDbParamCAP.SetFlglocal(const Value: TCmDbField);
begin
  FFlglocal := Value;
end;

procedure TDbParamCAP.SetFLGModAdDocPG(const Value: TCmDbField);
begin
  FFLGModAdDocPG := Value;
end;

procedure TDbParamCAP.SetFlgobrigformapgto(const Value: TCmDbField);
begin
  FFlgobrigformapgto := Value;
end;

procedure TDbParamCAP.SetFLGOPAUTO(const Value: TCmDbField);
begin
  FFLGOPAUTO := Value;
end;

procedure TDbParamCAP.SetFLGRADLOTE(const Value: TCmDbField);
begin
  FFLGRADLOTE := Value;
end;


procedure TDbParamCAP.SetFLGACESSLANCDOC(const Value: TCmDbField);
begin
  FFLGACESSLANCDOC := Value;
end;

procedure TDbParamCAP.SetFLGSLIPAUTO(const Value: TCmDbField);
begin
  FFLGSLIPAUTO := Value;
end;

procedure TDbParamCAP.SetFlgstatusfinanc(const Value: TCmDbField);
begin
  FFlgstatusfinanc := Value;
end;

procedure TDbParamCAP.SetFlgtrdxccxconta(const Value: TCmDbField);
begin
  FFlgtrdxccxconta := Value;
end;

procedure TDbParamCAP.SetFlgtrdximpostos(const Value: TCmDbField);
begin
  FFlgtrdximpostos := Value;
end;

procedure TDbParamCAP.SetFlgvalidaccbaixa(const Value: TCmDbField);
begin
  FFlgvalidaccbaixa := Value;
end;

procedure TDbParamCAP.SetFlgvalor(const Value: TCmDbField);
begin
  FFlgvalor := Value;
end;

procedure TDbParamCAP.SetHistpadfinan(const Value: TCmDbField);
begin
  FHistpadfinan := Value;
end;

procedure TDbParamCAP.SetIdimpressora(const Value: TCmDbField);
begin
  FIdimpressora := Value;
end;

procedure TDbParamCAP.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamCAP.SetIdramofornecedor(const Value: TCmDbField);
begin
  FIdramofornecedor := Value;
end;

procedure TDbParamCAP.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbParamCAP.SetIdtipocliadianto(const Value: TCmDbField);
begin
  FIdtipocliadianto := Value;
end;

procedure TDbParamCAP.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbParamCAP.SetImpgenerica(const Value: TCmDbField);
begin
  FImpgenerica := Value;
end;

procedure TDbParamCAP.SetIntegracontab(const Value: TCmDbField);
begin
  FIntegracontab := Value;
end;

procedure TDbParamCAP.SetLancafinanc(const Value: TCmDbField);
begin
  FLancafinanc := Value;
end;

procedure TDbParamCAP.SetLocalemischeque(const Value: TCmDbField);
begin
  FLocalemischeque := Value;
end;

procedure TDbParamCAP.SetMascaradesemb(const Value: TCmDbField);
begin
  FMascaradesemb := Value;
end;

procedure TDbParamCAP.SetMascaranodocum(const Value: TCmDbField);
begin
  FMascaranodocum := Value;
end;

procedure TDbParamCAP.SetNumdiasvencto(const Value: TCmDbField);
begin
  FNumdiasvencto := Value;
end;

procedure TDbParamCAP.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbParamCAP.SetPlacontacontabchq(const Value: TCmDbField);
begin
  FPlacontacontabchq := Value;
end;

procedure TDbParamCAP.SetPlanocontabchq(const Value: TCmDbField);
begin
  FPlanocontabchq := Value;
end;

procedure TDbParamCAP.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



