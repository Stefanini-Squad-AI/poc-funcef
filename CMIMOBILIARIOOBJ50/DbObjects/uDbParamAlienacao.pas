{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/08/2002                             }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172601/14640
Nº KINTANA..: 2019131
Data........: 11/10/2013
Responsável.: Felipe A. Santos
Descrição...: Foi criado os campos PathETLProducao e PathETLHOM para cadastrar
              o caminho do ETL.
-------------------------------------------------------------------------------}
unit uDbParamAlienacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamAlienacao = class(TCmDbObject)

  private
    FIdrecprojecao: TCmDbField;
    FFlgpartpdes: TCmDbField;
    FFlgparim: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgpartpim: TCmDbField;
    FFlgparcon: TCmDbField;
    FFlgpartdim: TCmDbField;
    FIdrecperdas: TCmDbField;
    FFlgpartdtpim: TCmDbField;
    FIdrecjuros: TCmDbField;
    FIdrecsinal: TCmDbField;
    FFlgnumproposta: TCmDbField;
    FFlgdiario: TCmDbField;
    FFlgpartdcon: TCmDbField;
    FIdrecamortizacao: TCmDbField;
    FIdrecamortextra: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdrecavista: TCmDbField;
    FFlgintegraativo: TCmDbField;
    FIdreccorrecao: TCmDbField;
    FFlgintegracontab: TCmDbField;
    FFlgintegracapcar: TCmDbField;
    FAnoCompetencia: TCmDbField;
    FMesCompetencia: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdEmpresa: TCmDbField;
    FIdPrograma: TCmDbField;
    FFlgLogoRelat: TCmDbField;
    FIdOperAtualJuros: TCmDbField;
    FIdOperAtualMulta: TCmDbField;
    FIdOperAtualCM: TCmDbField;
    FIdOperProvPer: TCmDbField;

    FIDRegraMulta: TCmDbField;
    FFlgCMJurDiario: TCmDbField;
    FFLGTIPODATAPROG: TCmDbField;
    FIDOperAtualRes: TCMDbField;
    FFLGATUALDATAPROG: TcmDbField;
    FIDOperAbonoJuros: TCMDbField;
    FIDOperAbonoMulta: TCMDbField;
    FIDOperAbonoCM: TCMDbField;
    FIdOperAtMultAC: TCmDbField;
    FIdrecjurosAC: TCmDbField;
    FIdOperProvPerAC: TCmDbField;
    FIdOperAtJurAC: TCmDbField;
    FIdreccorrAC: TCmDbField;
    FIdOperAtCMAC: TCmDbField;

    FFLGINDMESANTERIOR: TCmDbField;
    FIDRECAMORTAC: TCmDbField;
    FCodAlteradorCPMF: TCmDbField;
    FCodAlteradorAdRes: TCmDbField;
    FIDOperAbonoResN: TCmDbField;
    FIDOperAbonoResA: TCmDbField; // Daniel - 22698

// Felipe de Oliveira SOl 65636
    FFLGAUTCOD : TCmDbField;
    FFLGVALCOD : TCmDbField;
// Felipe de Oliveira SOl 65636

    FPathETLHom: TCmDbField; // Felipe A. Santos
    FPathETLProducao: TCmDbField; // Felipe A. Santos

    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetFlgdiario(const Value: TCmDbField);
    procedure SetFlgintegraativo(const Value: TCmDbField);
    procedure SetFlgnumproposta(const Value: TCmDbField);
    procedure SetFlgparcon(const Value: TCmDbField);
    procedure SetFlgparim(const Value: TCmDbField);
    procedure SetFlgpartdcon(const Value: TCmDbField);
    procedure SetFlgpartdim(const Value: TCmDbField);
    procedure SetFlgpartdtpim(const Value: TCmDbField);
    procedure SetFlgpartpdes(const Value: TCmDbField);
    procedure SetFlgpartpim(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrecamortextra(const Value: TCmDbField);
    procedure SetIdrecamortizacao(const Value: TCmDbField);
    procedure SetIdrecavista(const Value: TCmDbField);
    procedure SetIdreccorrecao(const Value: TCmDbField);
    procedure SetIdrecjuros(const Value: TCmDbField);
    procedure SetIdrecperdas(const Value: TCmDbField);
    procedure SetIdrecprojecao(const Value: TCmDbField);
    procedure SetIdrecsinal(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetFlgintegracapcar(const Value: TCmDbField);
    procedure SetFlgintegracontab(const Value: TCmDbField);
    procedure SetAnoCompetencia(const Value: TCmDbField);
    procedure SetMesCompetencia(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);
    procedure SetIdPrograma(const Value: TCmDbField);
    procedure SetFlgLogoRelat(const Value: TCmDbField);
    procedure SetIdOperAtualCM(const Value: TCmDbField);
    procedure SetIdOperAtualJuros(const Value: TCmDbField);
    procedure SetIdOperAtualMulta(const Value: TCmDbField);
    procedure SetIdOperProvPer(const Value: TCmDbField);

    procedure SetIDRegraMulta(const Value: TCmDbField);
    procedure SetFlgCMJurDiario(const Value: TCmDbField);
    procedure SetFLGTIPODATAPROG(const Value: TCmDbField);
    procedure SetIDOperAtualRes(const Value: TCMDbField);
    procedure SetFLGATUALDATAPROG(const Value: TcmDbField);
    procedure SetIDOperAbonoCM(const Value: TCMDbField);
    procedure SetIDOperAbonoJuros(const Value: TCMDbField);
    procedure SetIDOperAbonoMulta(const Value: TCMDbField);
    procedure SetIdOperAtCMAC(const Value: TCmDbField);
    procedure SetIdOperAtJurAC(const Value: TCmDbField);
    procedure SetIdOperAtMultAC(const Value: TCmDbField);
    procedure SetIdOperProvPerAC(const Value: TCmDbField);
    procedure SetIdreccorrAC(const Value: TCmDbField);
    procedure SetIdrecjurosAC(const Value: TCmDbField);

    procedure SetFLGINDMESANTERIOR(const Value: TCmDbField);
    procedure SetIDRECAMORTAC(const Value: TCmDbField);
    procedure SetCodAlteradorAdRes(const Value: TCmDbField);
    procedure SetCodAlteradorCPMF(const Value: TCmDbField);
    procedure SetIDOperAbonoResA(const Value: TCmDbField);
    procedure SetIDOperAbonoResN(const Value: TCmDbField); // Daniel - 22698

// Felipe de Oliveira SOl 65636
    procedure setFlgAutCod(const Value: TCmDbField);
    procedure setFlgValCod(const Value: TCmDbField);
// Felipe de Oliveira SOl 65636


    procedure SetPathETLHom(const Value: TCmDbField); // Felipe A. Santos
    procedure SetPathETLProducao(const Value: TCmDbField); // Felipe A. Santos

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Idrecsinal: TCmDbField read FIdrecsinal write SetIdrecsinal;
     Property Idrecprojecao: TCmDbField read FIdrecprojecao write SetIdrecprojecao;
     Property Idrecperdas: TCmDbField read FIdrecperdas write SetIdrecperdas;
     Property Idrecjuros: TCmDbField read FIdrecjuros write SetIdrecjuros;
     Property Idreccorrecao: TCmDbField read FIdreccorrecao write SetIdreccorrecao;
     Property Idrecavista: TCmDbField read FIdrecavista write SetIdrecavista;
     Property Idrecamortizacao: TCmDbField read FIdrecamortizacao write SetIdrecamortizacao;
     Property Idrecamortextra: TCmDbField read FIdrecamortextra write SetIdrecamortextra;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgpartpim: TCmDbField read FFlgpartpim write SetFlgpartpim;
     Property Flgpartpdes: TCmDbField read FFlgpartpdes write SetFlgpartpdes;
     Property Flgpartdtpim: TCmDbField read FFlgpartdtpim write SetFlgpartdtpim;
     Property Flgpartdim: TCmDbField read FFlgpartdim write SetFlgpartdim;
     Property Flgpartdcon: TCmDbField read FFlgpartdcon write SetFlgpartdcon;
     Property Flgparim: TCmDbField read FFlgparim write SetFlgparim;
     Property Flgparcon: TCmDbField read FFlgparcon write SetFlgparcon;
     Property Flgnumproposta: TCmDbField read FFlgnumproposta write SetFlgnumproposta;
     Property Flgintegraativo: TCmDbField read FFlgintegraativo write SetFlgintegraativo;
     Property Flgintegracontab: TCmDbField read FFlgintegracontab write SetFlgintegracontab;
     Property Flgintegracapcar: TCmDbField read FFlgintegracapcar write SetFlgintegracapcar;
     Property Flgdiario: TCmDbField read FFlgdiario write SetFlgdiario;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property MesCompetencia: TCmDbField read FMesCompetencia write SetMesCompetencia;
     Property AnoCompetencia: TCmDbField read FAnoCompetencia write SetAnoCompetencia;
     Property IdPrograma: TCmDbField read FIdPrograma write SetIdPrograma;
     Property IdEmpresa: TCmDbField read FIdEmpresa write SetIdEmpresa;
     Property CodCentroCusto: TCmDbField read FCodCentroCusto write SetCodCentroCusto;
     Property FlgLogoRelat: TCmDbField read FFlgLogoRelat write SetFlgLogoRelat;
     Property IdOperAtualCM: TCmDbField read FIdOperAtualCM write SetIdOperAtualCM;
     Property IdOperAtualJuros: TCmDbField read FIdOperAtualJuros write SetIdOperAtualJuros;
     Property IdOperAtualMulta: TCmDbField read FIdOperAtualMulta write SetIdOperAtualMulta;
     Property IdOperProvPer: TCmDbField read FIdOperProvPer write SetIdOperProvPer;

     property IDRegraMulta: TCmDbField read FIDRegraMulta write SetIDRegraMulta;

     // André Pontes - 04/07/2005 - pendência 19325
     property FlgCMJurDiario: TCmDbField read FFlgCMJurDiario write SetFlgCMJurDiario;
     // FIM André Pontes - 04/07/2005 - pendência 19325

     // Marchetti - Pendencia 19325
     property IDOperAtualRes : TCMDbField read FIDOperAtualRes write SetIDOperAtualRes;
     // Fim Marchetti - Pendencia 19325

     property FLGTIPODATAPROG: TCmDbField read FFLGTIPODATAPROG write SetFLGTIPODATAPROG;

     property FLGATUALDATAPROG: TcmDbField read FFLGATUALDATAPROG write SetFLGATUALDATAPROG;

     // Daniel - 22698
     property FLGINDMESANTERIOR: TCmDbField read FFLGINDMESANTERIOR write SetFLGINDMESANTERIOR;


     property IDOperAbonoMulta : TCMDbField read FIDOperAbonoMulta write SetIDOperAbonoMulta;
     property IDOperAbonoJuros : TCMDbField read FIDOperAbonoJuros write SetIDOperAbonoJuros;
     property IDOperAbonoCM    : TCMDbField read FIDOperAbonoCM write SetIDOperAbonoCM;


     Property IdOperAtCMAC: TCmDbField read FIdOperAtCMAC write SetIdOperAtCMAC;
     Property IdOperAtJurAC: TCmDbField read FIdOperAtJurAC write SetIdOperAtJurAC;
     Property IdOperAtMultAC: TCmDbField read FIdOperAtMultAC write SetIdOperAtMultAC;
     Property IdOperProvPerAC: TCmDbField read FIdOperProvPerAC write SetIdOperProvPerAC;
     Property IdrecjurosAC: TCmDbField read FIdrecjurosAC write SetIdrecjurosAC;
     Property IdreccorrAC: TCmDbField read FIdreccorrAC write SetIdreccorrAC;

     Property IDRECAMORTAC: TCmDbField read FIDRECAMORTAC write SetIDRECAMORTAC;

     property CodAlteradorCPMF: TCmDbField read FCodAlteradorCPMF write SetCodAlteradorCPMF;
     property CodAlteradorAdRes: TCmDbField read FCodAlteradorAdRes write SetCodAlteradorAdRes;
     property IDOperAbonoResN: TCmDbField read FIDOperAbonoResN write SetIDOperAbonoResN;
     property IDOperAbonoResA: TCmDbField read FIDOperAbonoResA write SetIDOperAbonoResA;

//Felipe de Oliveira sol65636
     property FLGAUTCOD : TCmDbField read FFLGAUTCOD write SetFlgAutCod;
     property FLGVALCOD : TCmDbField read FFLGVALCOD write SetFlgValCod;
//Felipe de Oliveira sol65636

     property PathETLProducao : TCmDbField read FPathETLProducao write SetPathETLProducao;
     property PathETLHom : TCmDbField read FPathETLHom write SetPathETLHom;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamAlienacao }

constructor TDbParamAlienacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;

   ErrorIfNoRowsAffected := False;

   TableName := 'PARAMALIENACAO';

   fUnidnegoc        := CreateCmDbField('UNIDNEGOC',        ftfloat,  False, False, False, True, '');
   fIdrecsinal       := CreateCmDbField('IDRECSINAL',       ftfloat,  False, False, False, True, '');
   fIdrecprojecao    := CreateCmDbField('IDRECPROJECAO',    ftfloat,  False, False, False, True, '');
   fIdrecperdas      := CreateCmDbField('IDRECPERDAS',      ftfloat,  False, False, False, True, '');
   fIdrecjuros       := CreateCmDbField('IDRECJUROS',       ftfloat,  False, False, False, True, '');
   fIdreccorrecao    := CreateCmDbField('IDRECCORRECAO',    ftfloat,  False, False, False, True, '');
   fIdrecavista      := CreateCmDbField('IDRECAVISTA',      ftfloat,  False, False, False, True, '');
   fIdrecamortizacao := CreateCmDbField('IDRECAMORTIZACAO', ftfloat,  False, False, False, True, '');
   fIdrecamortextra  := CreateCmDbField('IDRECAMORTEXTRA',  ftfloat,  False, False, False, True, '');
   fIdpessoa         := CreateCmDbField('IDPESSOA',         ftfloat,  True,  True,  False, True, '');
   fFlgpartpim       := CreateCmDbField('FLGPARTPIM',       ftString, False, False, False, True, '');
   fFlgpartpdes      := CreateCmDbField('FLGPARTPDES',      ftString, False, False, False, True, '');
   fFlgpartdtpim     := CreateCmDbField('FLGPARTDTPIM',     ftString, False, False, False, True, '');
   fFlgpartdim       := CreateCmDbField('FLGPARTDIM',       ftString, False, False, False, True, '');
   fFlgpartdcon      := CreateCmDbField('FLGPARTDCON',      ftString, False, False, False, True, '');
   fFlgparim         := CreateCmDbField('FLGPARIM',         ftString, False, False, False, True, '');
   fFlgparcon        := CreateCmDbField('FLGPARCON',        ftString, False, False, False, True, '');
   fFlgnumproposta   := CreateCmDbField('FLGNUMPROPOSTA',   ftString, False, False, False, True, '');
   fFlgintegraativo  := CreateCmDbField('FLGINTEGRAATIVO',  ftString, False, False, False, True, '');
   fFlgintegracontab := CreateCmDbField('FLGINTEGRACONTAB', ftString, False, False, False, True, '');
   fFlgintegracapcar := CreateCmDbField('FLGINTEGRACAPCAR', ftString, False, False, False, True, '');
   fFlgdiario        := CreateCmDbField('FLGDIARIO',        ftString, False, False, False, True, '');
   fCodcentrorespon  := CreateCmDbField('CODCENTRORESPON',  ftString, False, False, False, True, '');
   fMesCompetencia   := CreateCmDbField('MESCOMPETENCIA',   ftfloat,  False, False, False, True, '');
   fAnoCompetencia   := CreateCmDbField('ANOCOMPETENCIA',   ftfloat,  False, False, False, True, '');
   fIdPrograma       := CreateCmDbField('IDPROGRAMA',       ftfloat,  False, False, False, True, '');
   fIdEmpresa        := CreateCmDbField('IDEMPRESA',        ftfloat,  False, False, False, True, '');
   fCodCentroCusto   := CreateCmDbField('CODCENTROCUSTO',   ftString, False, False, False, True, '');
   fFlgLogoRelat     := CreateCmDbField('FLGLOGORELAT',     ftString, False, False, False, True, '');
   fIdOperAtualCM    := CreateCmDbField('IDOPERATUALCM',    ftfloat,  False, False, False, True, '');
   fIdOperAtualJuros := CreateCmDbField('IDOPERATUALJUROS', ftfloat,  False, False, False, True, '');
   fIdOperAtualMulta := CreateCmDbField('IDOPERATUALMULTA', ftfloat,  False, False, False, True, '');
   fIdOperProvPer    := CreateCmDbField('IDOPERPROVPER',    ftfloat,  False, False, False, True, '');
   fIDRegraMulta     := CreateCmDbField('IDREGRAMULTA',     ftfloat,  False, False, False, True, '');

   // André Pontes - 04/07/2005 - pendência 19325
   fFlgCMJurDiario   := CreateCmDbField('FLGCMJURDIARIO',   ftfloat,  False, False, False, False, '');
   // FIM André Pontes - 04/07/2005 - pendência 19325

   // Marchetti - Pendencia 19325
   fIDOperAtualRes   := CreateCmDbField('IDOPERATUALRES', ftFloat, False, False, False, True, '' );
   // Fim Marchetti - Pendencia 19325


   fFLGTIPODATAPROG  := CreateCmDbField('FLGTIPODATAPROG',     ftString, False, False, False, True, '');

   // Daniel - 22698
   FFLGINDMESANTERIOR := CreateCmDbField('FLGINDMESANTERIOR',  ftFloat,  False, False, False, False, '');

   fFLGATUALDATAPROG := CreateCmDbField('FLGATUALDATAPROG', ftInteger, False, False, False, False, '' );

   fIdOperAbonoMulta := CreateCmDbField('IDOPERABONOMULTA', ftfloat,  False, False, False, True, '');
   fIdOperAbonoJuros := CreateCmDbField('IDOPERABONOJUROS', ftfloat,  False, False, False, True, '');
   fIdOperAbonoCM    := CreateCmDbField('IDOPERABONOCM'   , ftfloat,  False, False, False, True, '');


   fIdOperAtCMAC     := CreateCmDbField('IDOPERATCMAC',    ftfloat,  False, False, False, True, '');
   fIdOperAtJurAC    := CreateCmDbField('IDOPERATJURAC',   ftfloat,  False, False, False, True, '');
   fIdOperAtMultAC   := CreateCmDbField('IDOPERATMULTAC',  ftfloat,  False, False, False, True, '');
   fIdOperProvPerAC  := CreateCmDbField('IDOPERPROVPERAC', ftfloat,  False, False, False, True, '');
   fIdrecjurosAC     := CreateCmDbField('IDRECJUROSAC',    ftfloat,  False, False, False, True, '');
   fIdreccorrAC      := CreateCmDbField('IDRECCORRAC',     ftfloat,  False, False, False, True, '');

   fIDRECAMORTAC     := CreateCmDbField('IDRECAMORTAC',    ftfloat,  False, False, False, True, '');

   FCodAlteradorCPMF   := CreateCmDbField('CODALTERADORCPMF',  ftfloat,  False, False, False, True, '');
   FCodAlteradorAdRes  := CreateCmDbField('CODALTERADORADRES', ftfloat,  False, False, False, True, '');
   FIDOperAbonoResN    := CreateCmDbField('IDOPERABONORESN',   ftfloat,  False, False, False, True, '');
   FIDOperAbonoResA    := CreateCmDbField('IDOPERABONORESA',   ftfloat,  False, False, False, True, '');

// Felipe de Oliveira SOl 65636
   FFLGAUTCOD := CreateCmDbField('FLGAUTCOD',ftString,  False, False, False, False,'');
   FFLGVALCOD := CreateCmDbField('FLGVALCOD',ftString,  False, False, False, False,'');
// Felipe de Oliveira SOl 65636

   // Felipe A. Santos
   FPathETLHom := CreateCmDbField('PATHETLHOM',ftString,  False, False, False, False,'');
   FPathETLProducao := CreateCmDbField('PATHETLPRODUCAO',ftString,  False, False, False, False,'');
   // Felipe A. Santos - fim
end;



function TDbParamAlienacao.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbParamAlienacao.SetAnoCompetencia(const Value: TCmDbField);
begin
  FAnoCompetencia := Value;
end;

procedure TDbParamAlienacao.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbParamAlienacao.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbParamAlienacao.SetFlgdiario(const Value: TCmDbField);
begin
  FFlgdiario := Value;
end;

procedure TDbParamAlienacao.SetFlgintegraativo(const Value: TCmDbField);
begin
  FFlgintegraativo := Value;
end;

procedure TDbParamAlienacao.SetFlgintegracapcar(const Value: TCmDbField);
begin
  FFlgintegracapcar := Value;
end;

procedure TDbParamAlienacao.SetFlgintegracontab(const Value: TCmDbField);
begin
  FFlgintegracontab := Value;
end;

procedure TDbParamAlienacao.SetFlgLogoRelat(const Value: TCmDbField);
begin
  FFlgLogoRelat := Value;
end;

procedure TDbParamAlienacao.SetFlgnumproposta(const Value: TCmDbField);
begin
  FFlgnumproposta := Value;
end;

procedure TDbParamAlienacao.SetFlgparcon(const Value: TCmDbField);
begin
  FFlgparcon := Value;
end;

procedure TDbParamAlienacao.SetFlgparim(const Value: TCmDbField);
begin
  FFlgparim := Value;
end;

procedure TDbParamAlienacao.SetFlgpartdcon(const Value: TCmDbField);
begin
  FFlgpartdcon := Value;
end;

procedure TDbParamAlienacao.SetFlgpartdim(const Value: TCmDbField);
begin
  FFlgpartdim := Value;
end;

procedure TDbParamAlienacao.SetFlgpartdtpim(const Value: TCmDbField);
begin
  FFlgpartdtpim := Value;
end;

procedure TDbParamAlienacao.SetFlgpartpdes(const Value: TCmDbField);
begin
  FFlgpartpdes := Value;
end;

procedure TDbParamAlienacao.SetFlgpartpim(const Value: TCmDbField);
begin
  FFlgpartpim := Value;
end;

procedure TDbParamAlienacao.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

procedure TDbParamAlienacao.SetIdOperAtualCM(const Value: TCmDbField);
begin
  FIdOperAtualCM := Value;
end;

procedure TDbParamAlienacao.SetIdOperAtualJuros(const Value: TCmDbField);
begin
  FIdOperAtualJuros := Value;
end;

procedure TDbParamAlienacao.SetIdOperAtualMulta(const Value: TCmDbField);
begin
  FIdOperAtualMulta := Value;
end;

procedure TDbParamAlienacao.SetIdOperProvPer(const Value: TCmDbField);
begin
  FIdOperProvPer := Value;
end;

procedure TDbParamAlienacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamAlienacao.SetIdPrograma(const Value: TCmDbField);
begin
  FIdPrograma := Value;
end;

procedure TDbParamAlienacao.SetIdrecamortextra(const Value: TCmDbField);
begin
  FIdrecamortextra := Value;
end;

procedure TDbParamAlienacao.SetIdrecamortizacao(const Value: TCmDbField);
begin
  FIdrecamortizacao := Value;
end;

procedure TDbParamAlienacao.SetIdrecavista(const Value: TCmDbField);
begin
  FIdrecavista := Value;
end;

procedure TDbParamAlienacao.SetIdreccorrecao(const Value: TCmDbField);
begin
  FIdreccorrecao := Value;
end;

procedure TDbParamAlienacao.SetIdrecjuros(const Value: TCmDbField);
begin
  FIdrecjuros := Value;
end;

procedure TDbParamAlienacao.SetIdrecperdas(const Value: TCmDbField);
begin
  FIdrecperdas := Value;
end;

procedure TDbParamAlienacao.SetIdrecprojecao(const Value: TCmDbField);
begin
  FIdrecprojecao := Value;
end;

procedure TDbParamAlienacao.SetIdrecsinal(const Value: TCmDbField);
begin
  FIdrecsinal := Value;
end;

procedure TDbParamAlienacao.SetMesCompetencia(const Value: TCmDbField);
begin
  FMesCompetencia := Value;
end;

procedure TDbParamAlienacao.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbParamAlienacao.SetIDRegraMulta(const Value: TCmDbField);
begin
  FIDRegraMulta := Value;
end;

procedure TDbParamAlienacao.SetFlgCMJurDiario(const Value: TCmDbField);
begin
  FFlgCMJurDiario := Value;
end;

procedure TDbParamAlienacao.SetFLGTIPODATAPROG(const Value: TCmDbField);
begin
  FFLGTIPODATAPROG := Value;
end;

procedure TDbParamAlienacao.SetIDOperAtualRes(const Value: TCMDbField);
begin
   FIDOperAtualRes := Value;
end;

procedure TDbParamAlienacao.SetFLGATUALDATAPROG(const Value: TcmDbField);
begin
  FFLGATUALDATAPROG := Value;
end;

procedure TDbParamAlienacao.SetIDOperAbonoCM(const Value: TCMDbField);
begin
  FIDOperAbonoCM := Value;
end;

procedure TDbParamAlienacao.SetIDOperAbonoJuros(const Value: TCMDbField);
begin
  FIDOperAbonoJuros := Value;
end;

procedure TDbParamAlienacao.SetIDOperAbonoMulta(const Value: TCMDbField);
begin
  FIDOperAbonoMulta := Value;
end;

procedure TDbParamAlienacao.SetIdOperAtCMAC(const Value: TCmDbField);
begin
  FIdOperAtCMAC := Value;
end;

procedure TDbParamAlienacao.SetIdOperAtJurAC(const Value: TCmDbField);
begin
  FIdOperAtJurAC := Value;
end;

procedure TDbParamAlienacao.SetIdOperAtMultAC(const Value: TCmDbField);
begin
  FIdOperAtMultAC := Value;
end;

procedure TDbParamAlienacao.SetIdOperProvPerAC(const Value: TCmDbField);
begin
  FIdOperProvPerAC := Value;
end;

procedure TDbParamAlienacao.SetIdreccorrAC(const Value: TCmDbField);
begin
  FIdreccorrAC := Value;
end;

procedure TDbParamAlienacao.SetIdrecjurosAC(const Value: TCmDbField);
begin
  FIdrecjurosAC := Value;
end;

procedure TDbParamAlienacao.SetFLGINDMESANTERIOR(const Value: TCmDbField);
begin
  FFLGINDMESANTERIOR := Value;
end;

procedure TDbParamAlienacao.SetIDRECAMORTAC(const Value: TCmDbField);
begin
  FIDRECAMORTAC := Value;
end;

procedure TDbParamAlienacao.SetCodAlteradorAdRes(const Value: TCmDbField);
begin
  FCodAlteradorAdRes := Value;
end;

procedure TDbParamAlienacao.SetCodAlteradorCPMF(const Value: TCmDbField);
begin
  FCodAlteradorCPMF := Value;
end;

procedure TDbParamAlienacao.SetIDOperAbonoResA(const Value: TCmDbField);
begin
  FIDOperAbonoResA := Value;
end;

procedure TDbParamAlienacao.SetIDOperAbonoResN(const Value: TCmDbField);
begin
  FIDOperAbonoResN := Value;
end;

// Felipe de Oliveira SOl 65636
procedure TDbParamAlienacao.setFlgAutCod(const Value: TCmDbField);
begin
   FFLGAUTCOD := Value;
end;
procedure TDbParamAlienacao.setFlgValCod(const Value: TCmDbField);
begin
   FFLGVALCOD := Value;
end;
// Felipe de Oliveira SOl 65636

// Felipe A. Santos
procedure TDbParamAlienacao.SetPathETLHom(const Value: TCmDbField);
begin
  FPathETLHom := Value;
end;

procedure TDbParamAlienacao.SetPathETLProducao(const Value: TCmDbField);
begin
  FPathETLProducao := Value;
end;
// Felipe A. Santos

end.



