{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 7/11/2002                              }
{                                                       }
{*******************************************************}

unit uDbParamcontab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamcontab = class(TCmDbObject)

  private
    FPacfdocoboscrisc: TCmDbField;
    FPacreduzp: TCmDbField;
    FPacreduzd: TCmDbField;
    FPacobrigadata: TCmDbField;
    FPactipoperimptxt: TCmDbField;
    FPaccontranatur: TCmDbField;
    FPacresemat: TCmDbField;
    FPacredupi: TCmDbField;
    FPacdefitecn: TCmDbField;
    FPacconresult: TCmDbField;
    FPacreduzc: TCmDbField;
   // Fplanocontabcli: TCmDbField;
   // Fplanocredcli: TCmDbField;
    Fcontacontabcli : TCmDbField;
    Fcontacredcli : TCmDbField;
    FPacencer: TCmDbField;
    FPaccontacustotel: TCmDbField;
    FPacrevedefitecn: TCmDbField;
    FPacredupf: TCmDbField;
    FPacresecont: TCmDbField;
    FPaccorrespond: TCmDbField;
    FPacpagina: TCmDbField;
    FPacdiames: TCmDbField;
    FPacreduaf: TCmDbField;
    FPacnumdoc: TCmDbField;
    FPactipoperresult: TCmDbField;
    FPacvalidaproc: TCmDbField;
    FFlgpermitezero: TCmDbField;
    FCaminhofidelio: TCmDbField;
    FPacmoedageren2: TCmDbField;
    FPacreduri: TCmDbField;
    FPacformdefitecn: TCmDbField;
    FPacredudf: TCmDbField;
    FPacreduef: TCmDbField;
    FPactotplanerro: TCmDbField;
    FPacdebcreplanerro: TCmDbField;
    FIdpessoa: TCmDbField;
    FPacreduai: TCmDbField;
    FPacindice: TCmDbField;
    FPacultdat: TCmDbField;
    FPacmoedaoficial: TCmDbField;
    FPacreduci: TCmDbField;
    FPacdatabloq: TCmDbField;
    FPacmoedageren1: TCmDbField;
    FPacestorna: TCmDbField;
    FPacprogprev: TCmDbField;
    FIdultreferencia: TCmDbField;
    FPacmoedagerencial: TCmDbField;
    FPaccodred: TCmDbField;
    FPacdefitecna: TCmDbField;
    FPachistdefsup: TCmDbField;
    FPacsubgrp2: TCmDbField;
    FPacreduza: TCmDbField;
    FPacreduei: TCmDbField;
    FPacfdocoboscrisca: TCmDbField;
    FFlgtipofechamento: TCmDbField;
    FPacreseconta: TCmDbField;
    FPacformsupetecn: TCmDbField;
    FPacordemsubconta: TCmDbField;
    FPacreducf: TCmDbField;
    FPacexercicioatual: TCmDbField;
    FPacreduoi: TCmDbField;
    FPacdobrada: TCmDbField;
    FPacperdaganho: TCmDbField;
    FPacredudi: TCmDbField;
    FPacredurf: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FPacsubgrp1: TCmDbField;
    FPactotais: TCmDbField;
    FPactipopermoeda: TCmDbField;
    FPacsubgrp3: TCmDbField;
    FPacplncodigo :TCmDbField;
    FPacreduof: TCmDbField;
    FPacperccustotel: TCmDbField;
    FPacrevesupetecn: TCmDbField;
    FPacobrigahist: TCmDbField;
    FPacreduzr: TCmDbField;
    FPacmoedacotas: TCmDbField;
    FPacatsal: TCmDbField;
    FPacsubgrp4: TCmDbField;
    FPacreduzo: TCmDbField;
    FPactipoperlanc: TCmDbField;
    FPlano: TCmDbField;
    FPacativproj: TCmDbField;
    FPacmantem: TCmDbField;
    FFlghistcaixaalta: TCmDbField;
    FDataultfecha: TCmDbField;
    FPactipooper: TCmDbField;
    FPacreduze: TCmDbField;
    FPacpesqplalanc: TCmDbField;
    FPacdebcre: TCmDbField;
    FPacpernullatualiz: TCmDbField;
    procedure SetCaminhofidelio(const Value: TCmDbField);
   // procedure SetPlanoContabCli(const Value: TCmDbField);
   // procedure SetPlanoCredCli(const Value: TCmDbField);
    procedure SetContacontabcli(const Value: TCmDbField);
    procedure SetPacplncodigo(const Value: TCmDbField);
    procedure SetPacpesqplalanc(const Value: TCmDbField);
    procedure SetContacredcli(const Value: TCmDbField);
    procedure SetDataultfecha(const Value: TCmDbField);
    procedure SetFlghistcaixaalta(const Value: TCmDbField);
    procedure SetFlgpermitezero(const Value: TCmDbField);
    procedure SetFlgtipofechamento(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdultreferencia(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPacativproj(const Value: TCmDbField);
    procedure SetPacatsal(const Value: TCmDbField);
    procedure SetPaccodred(const Value: TCmDbField);
    procedure SetPacconresult(const Value: TCmDbField);
    procedure SetPaccontacustotel(const Value: TCmDbField);
    procedure SetPaccontranatur(const Value: TCmDbField);
    procedure SetPaccorrespond(const Value: TCmDbField);
    procedure SetPacdatabloq(const Value: TCmDbField);
    procedure SetPacdebcre(const Value: TCmDbField);
    procedure SetPacdebcreplanerro(const Value: TCmDbField);
    procedure SetPacdefitecn(const Value: TCmDbField);
    procedure SetPacdefitecna(const Value: TCmDbField);
    procedure SetPacdiames(const Value: TCmDbField);
    procedure SetPacdobrada(const Value: TCmDbField);
    procedure SetPacencer(const Value: TCmDbField);
    procedure SetPacestorna(const Value: TCmDbField);
    procedure SetPacexercicioatual(const Value: TCmDbField);
    procedure SetPacfdocoboscrisc(const Value: TCmDbField);
    procedure SetPacfdocoboscrisca(const Value: TCmDbField);
    procedure SetPacformdefitecn(const Value: TCmDbField);
    procedure SetPacformsupetecn(const Value: TCmDbField);
    procedure SetPachistdefsup(const Value: TCmDbField);
    procedure SetPacindice(const Value: TCmDbField);
    procedure SetPacmantem(const Value: TCmDbField);
    procedure SetPacmoedacotas(const Value: TCmDbField);
    procedure SetPacmoedageren1(const Value: TCmDbField);
    procedure SetPacmoedageren2(const Value: TCmDbField);
    procedure SetPacmoedagerencial(const Value: TCmDbField);
    procedure SetPacmoedaoficial(const Value: TCmDbField);
    procedure SetPacnumdoc(const Value: TCmDbField);
    procedure SetPacobrigadata(const Value: TCmDbField);
    procedure SetPacobrigahist(const Value: TCmDbField);
    procedure SetPacordemsubconta(const Value: TCmDbField);
    procedure SetPacpagina(const Value: TCmDbField);
    procedure SetPacperccustotel(const Value: TCmDbField);
    procedure SetPacperdaganho(const Value: TCmDbField);
    procedure SetPacpernullatualiz(const Value: TCmDbField);
    procedure SetPacprogprev(const Value: TCmDbField);
    procedure SetPacreduaf(const Value: TCmDbField);
    procedure SetPacreduai(const Value: TCmDbField);
    procedure SetPacreducf(const Value: TCmDbField);
    procedure SetPacreduci(const Value: TCmDbField);
    procedure SetPacredudf(const Value: TCmDbField);
    procedure SetPacredudi(const Value: TCmDbField);
    procedure SetPacreduef(const Value: TCmDbField);
    procedure SetPacreduei(const Value: TCmDbField);
    procedure SetPacreduof(const Value: TCmDbField);
    procedure SetPacreduoi(const Value: TCmDbField);
    procedure SetPacredupf(const Value: TCmDbField);
    procedure SetPacredupi(const Value: TCmDbField);
    procedure SetPacredurf(const Value: TCmDbField);
    procedure SetPacreduri(const Value: TCmDbField);
    procedure SetPacreduza(const Value: TCmDbField);
    procedure SetPacreduzc(const Value: TCmDbField);
    procedure SetPacreduzd(const Value: TCmDbField);
    procedure SetPacreduze(const Value: TCmDbField);
    procedure SetPacreduzo(const Value: TCmDbField);
    procedure SetPacreduzp(const Value: TCmDbField);
    procedure SetPacreduzr(const Value: TCmDbField);
    procedure SetPacresecont(const Value: TCmDbField);
    procedure SetPacreseconta(const Value: TCmDbField);
    procedure SetPacresemat(const Value: TCmDbField);
    procedure SetPacrevedefitecn(const Value: TCmDbField);
    procedure SetPacrevesupetecn(const Value: TCmDbField);
    procedure SetPacsubgrp1(const Value: TCmDbField);
    procedure SetPacsubgrp2(const Value: TCmDbField);
    procedure SetPacsubgrp3(const Value: TCmDbField);
    procedure SetPacsubgrp4(const Value: TCmDbField);
    procedure SetPactipooper(const Value: TCmDbField);
    procedure SetPactipoperimptxt(const Value: TCmDbField);
    procedure SetPactipoperlanc(const Value: TCmDbField);
    procedure SetPactipopermoeda(const Value: TCmDbField);
    procedure SetPactipoperresult(const Value: TCmDbField);
    procedure SetPactotais(const Value: TCmDbField);
    procedure SetPactotplanerro(const Value: TCmDbField);
    procedure SetPacultdat(const Value: TCmDbField);
    procedure SetPacvalidaproc(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);

  public

     Property Plano: TCmDbField read FPlano write SetPlano;
    // Property PlanoContabCli: TCmDbField read FPlanoContabCli write SetPlanoContabCli;
    // Property PlanoCredCli: TCmDbField read FPlanoCredCli write SetPlanoCredCli;
     Property PacPlnCodigo: TCmDbField read FPacPlnCodigo write SetPacPlnCodigo;
     Property PacPesqplalanc: TCmDbField read FPacPesqplalanc write SetPacPesqplalanc;
     Property ContaContabCli: TCmDbField read FContaContabCli write SetContaContabCli;
     Property ContaCredcli: TCmDbField read FContaCredcli write SetContaCredCli;
     Property Pacvalidaproc: TCmDbField read FPacvalidaproc write SetPacvalidaproc;
     Property Pacultdat: TCmDbField read FPacultdat write SetPacultdat;
     Property Pactotplanerro: TCmDbField read FPactotplanerro write SetPactotplanerro;
     Property Pactotais: TCmDbField read FPactotais write SetPactotais;
     Property Pactipoperresult: TCmDbField read FPactipoperresult write SetPactipoperresult;
     Property Pactipopermoeda: TCmDbField read FPactipopermoeda write SetPactipopermoeda;
     Property Pactipoperlanc: TCmDbField read FPactipoperlanc write SetPactipoperlanc;
     Property Pactipoperimptxt: TCmDbField read FPactipoperimptxt write SetPactipoperimptxt;
     Property Pactipooper: TCmDbField read FPactipooper write SetPactipooper;
     Property Pacsubgrp4: TCmDbField read FPacsubgrp4 write SetPacsubgrp4;
     Property Pacsubgrp3: TCmDbField read FPacsubgrp3 write SetPacsubgrp3;
     Property Pacsubgrp2: TCmDbField read FPacsubgrp2 write SetPacsubgrp2;
     Property Pacsubgrp1: TCmDbField read FPacsubgrp1 write SetPacsubgrp1;
     Property Pacrevesupetecn: TCmDbField read FPacrevesupetecn write SetPacrevesupetecn;
     Property Pacrevedefitecn: TCmDbField read FPacrevedefitecn write SetPacrevedefitecn;
     Property Pacresemat: TCmDbField read FPacresemat write SetPacresemat;
     Property Pacreseconta: TCmDbField read FPacreseconta write SetPacreseconta;
     Property Pacresecont: TCmDbField read FPacresecont write SetPacresecont;
     Property Pacreduzr: TCmDbField read FPacreduzr write SetPacreduzr;
     Property Pacreduzp: TCmDbField read FPacreduzp write SetPacreduzp;
     Property Pacreduzo: TCmDbField read FPacreduzo write SetPacreduzo;
     Property Pacreduze: TCmDbField read FPacreduze write SetPacreduze;
     Property Pacreduzd: TCmDbField read FPacreduzd write SetPacreduzd;
     Property Pacreduzc: TCmDbField read FPacreduzc write SetPacreduzc;
     Property Pacreduza: TCmDbField read FPacreduza write SetPacreduza;
     Property Pacreduri: TCmDbField read FPacreduri write SetPacreduri;
     Property Pacredurf: TCmDbField read FPacredurf write SetPacredurf;
     Property Pacredupi: TCmDbField read FPacredupi write SetPacredupi;
     Property Pacredupf: TCmDbField read FPacredupf write SetPacredupf;
     Property Pacreduoi: TCmDbField read FPacreduoi write SetPacreduoi;
     Property Pacreduof: TCmDbField read FPacreduof write SetPacreduof;
     Property Pacreduei: TCmDbField read FPacreduei write SetPacreduei;
     Property Pacreduef: TCmDbField read FPacreduef write SetPacreduef;
     Property Pacredudi: TCmDbField read FPacredudi write SetPacredudi;
     Property Pacredudf: TCmDbField read FPacredudf write SetPacredudf;
     Property Pacreduci: TCmDbField read FPacreduci write SetPacreduci;
     Property Pacreducf: TCmDbField read FPacreducf write SetPacreducf;
     Property Pacreduai: TCmDbField read FPacreduai write SetPacreduai;
     Property Pacreduaf: TCmDbField read FPacreduaf write SetPacreduaf;
     Property Pacprogprev: TCmDbField read FPacprogprev write SetPacprogprev;
     Property Pacpernullatualiz: TCmDbField read FPacpernullatualiz write SetPacpernullatualiz;
     Property Pacperdaganho: TCmDbField read FPacperdaganho write SetPacperdaganho;
     Property Pacperccustotel: TCmDbField read FPacperccustotel write SetPacperccustotel;
     Property Pacpagina: TCmDbField read FPacpagina write SetPacpagina;
     Property Pacordemsubconta: TCmDbField read FPacordemsubconta write SetPacordemsubconta;
     Property Pacobrigahist: TCmDbField read FPacobrigahist write SetPacobrigahist;
     Property Pacobrigadata: TCmDbField read FPacobrigadata write SetPacobrigadata;
     Property Pacnumdoc: TCmDbField read FPacnumdoc write SetPacnumdoc;
     Property Pacmoedaoficial: TCmDbField read FPacmoedaoficial write SetPacmoedaoficial;
     Property Pacmoedageren2: TCmDbField read FPacmoedageren2 write SetPacmoedageren2;
     Property Pacmoedageren1: TCmDbField read FPacmoedageren1 write SetPacmoedageren1;
     Property Pacmoedagerencial: TCmDbField read FPacmoedagerencial write SetPacmoedagerencial;
     Property Pacmoedacotas: TCmDbField read FPacmoedacotas write SetPacmoedacotas;
     Property Pacmantem: TCmDbField read FPacmantem write SetPacmantem;
     Property Pacindice: TCmDbField read FPacindice write SetPacindice;
     Property Pachistdefsup: TCmDbField read FPachistdefsup write SetPachistdefsup;
     Property Pacformsupetecn: TCmDbField read FPacformsupetecn write SetPacformsupetecn;
     Property Pacformdefitecn: TCmDbField read FPacformdefitecn write SetPacformdefitecn;
     Property Pacfdocoboscrisca: TCmDbField read FPacfdocoboscrisca write SetPacfdocoboscrisca;
     Property Pacfdocoboscrisc: TCmDbField read FPacfdocoboscrisc write SetPacfdocoboscrisc;
     Property Pacexercicioatual: TCmDbField read FPacexercicioatual write SetPacexercicioatual;
     Property Pacestorna: TCmDbField read FPacestorna write SetPacestorna;
     Property Pacencer: TCmDbField read FPacencer write SetPacencer;
     Property Pacdobrada: TCmDbField read FPacdobrada write SetPacdobrada;
     Property Pacdiames: TCmDbField read FPacdiames write SetPacdiames;
     Property Pacdefitecna: TCmDbField read FPacdefitecna write SetPacdefitecna;
     Property Pacdefitecn: TCmDbField read FPacdefitecn write SetPacdefitecn;
     Property Pacdebcreplanerro: TCmDbField read FPacdebcreplanerro write SetPacdebcreplanerro;
     Property Pacdebcre: TCmDbField read FPacdebcre write SetPacdebcre;
     Property Pacdatabloq: TCmDbField read FPacdatabloq write SetPacdatabloq;
     Property Paccorrespond: TCmDbField read FPaccorrespond write SetPaccorrespond;
     Property Paccontranatur: TCmDbField read FPaccontranatur write SetPaccontranatur;
     Property Paccontacustotel: TCmDbField read FPaccontacustotel write SetPaccontacustotel;
     Property Pacconresult: TCmDbField read FPacconresult write SetPacconresult;
     Property Paccodred: TCmDbField read FPaccodred write SetPaccodred;
     Property Pacatsal: TCmDbField read FPacatsal write SetPacatsal;
     Property Pacativproj: TCmDbField read FPacativproj write SetPacativproj;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idultreferencia: TCmDbField read FIdultreferencia write SetIdultreferencia;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgtipofechamento: TCmDbField read FFlgtipofechamento write SetFlgtipofechamento;
     Property Flgpermitezero: TCmDbField read FFlgpermitezero write SetFlgpermitezero;
     Property Flghistcaixaalta: TCmDbField read FFlghistcaixaalta write SetFlghistcaixaalta;
     Property Dataultfecha: TCmDbField read FDataultfecha write SetDataultfecha;
     Property Caminhofidelio: TCmDbField read FCaminhofidelio write SetCaminhofidelio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbParamcontab }

constructor TDbParamcontab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCONTAB';

   fPlano             := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPacpesqplalanc    := CreateCmDbField('PACPESQPLALANC',ftString,False,False,False,True,'');
   fContacontabcli    := CreateCmDbField('CONTACONTABCLI',ftString,False,False,False,True,'');
   fContacredcli      := CreateCmDbField('CONTACREDCLI',ftString,False,False,False,True,'');
   fPacvalidaproc     := CreateCmDbField('PACVALIDAPROC',ftString,False,False,False,True,'');
   fPacultdat         := CreateCmDbField('PACULTDAT',ftDateTime,False,False,False,True,'');
   fPactotplanerro    := CreateCmDbField('PACTOTPLANERRO',ftfloat,False,False,False,True,'');
   fPactotais         := CreateCmDbField('PACTOTAIS',ftString,True,False,False,True,'');
   fPactipoperresult  := CreateCmDbField('PACTIPOPERRESULT',ftString,False,False,False,True,'');
   fPactipopermoeda   := CreateCmDbField('PACTIPOPERMOEDA',ftString,False,False,False,True,'');
   fPactipoperlanc    := CreateCmDbField('PACTIPOPERLANC',ftString,False,False,False,True,'');
   fPactipoperimptxt  := CreateCmDbField('PACTIPOPERIMPTXT',ftString,False,False,False,True,'');
   fPactipooper       := CreateCmDbField('PACTIPOOPER',ftString,False,False,False,True,'');
   fPacsubgrp4        := CreateCmDbField('PACSUBGRP4',ftString,False,False,False,True,'');
   fPacsubgrp3        := CreateCmDbField('PACSUBGRP3',ftString,False,False,False,True,'');
   fPacsubgrp2        := CreateCmDbField('PACSUBGRP2',ftString,False,False,False,True,'');
   fPacsubgrp1        := CreateCmDbField('PACSUBGRP1',ftString,False,False,False,True,'');
   fPacrevesupetecn   := CreateCmDbField('PACREVESUPETECN',ftString,False,False,False,True,'');
   fPacrevedefitecn   := CreateCmDbField('PACREVEDEFITECN',ftString,False,False,False,True,'');
   fPacresemat        := CreateCmDbField('PACRESEMAT',ftString,False,False,False,True,'');
   fPacreseconta      := CreateCmDbField('PACRESECONTA',ftString,False,False,False,True,'');
   fPacresecont       := CreateCmDbField('PACRESECONT',ftString,False,False,False,True,'');
   fPacplncodigo      := CreateCmDbField('PACPLNCODIGO',ftfloat,False,False,False,True,'');
   fPacreduzr         := CreateCmDbField('PACREDUZR',ftfloat,True,False,False,True,'');
   fPacreduzp         := CreateCmDbField('PACREDUZP',ftfloat,True,False,False,True,'');
   fPacreduzo         := CreateCmDbField('PACREDUZO',ftfloat,True,False,False,True,'');
   fPacreduze         := CreateCmDbField('PACREDUZE',ftfloat,False,False,False,True,'');
   fPacreduzd         := CreateCmDbField('PACREDUZD',ftfloat,True,False,False,True,'');
   fPacreduzc         := CreateCmDbField('PACREDUZC',ftfloat,True,False,False,True,'');
   fPacreduza         := CreateCmDbField('PACREDUZA',ftfloat,True,False,False,True,'');
   fPacreduri         := CreateCmDbField('PACREDURI',ftfloat,True,False,False,True,'');
   fPacredurf         := CreateCmDbField('PACREDURF',ftfloat,True,False,False,True,'');
   fPacredupi         := CreateCmDbField('PACREDUPI',ftfloat,True,False,False,True,'');
   fPacredupf         := CreateCmDbField('PACREDUPF',ftfloat,True,False,False,True,'');
   fPacreduoi         := CreateCmDbField('PACREDUOI',ftfloat,True,False,False,True,'');
   fPacreduof         := CreateCmDbField('PACREDUOF',ftfloat,True,False,False,True,'');
   fPacreduei         := CreateCmDbField('PACREDUEI',ftfloat,False,False,False,True,'');
   fPacreduef         := CreateCmDbField('PACREDUEF',ftfloat,False,False,False,True,'');
   fPacredudi         := CreateCmDbField('PACREDUDI',ftfloat,True,False,False,True,'');
   fPacredudf         := CreateCmDbField('PACREDUDF',ftfloat,True,False,False,True,'');
   fPacreduci         := CreateCmDbField('PACREDUCI',ftfloat,True,False,False,True,'');
   fPacreducf         := CreateCmDbField('PACREDUCF',ftfloat,True,False,False,True,'');
   fPacreduai         := CreateCmDbField('PACREDUAI',ftfloat,True,False,False,True,'');
   fPacreduaf         := CreateCmDbField('PACREDUAF',ftfloat,True,False,False,True,'');
   fPacprogprev       := CreateCmDbField('PACPROGPREV',ftString,False,False,False,True,'');
   fPacpernullatualiz := CreateCmDbField('PACPERNULLATUALIZ',ftfloat,False,False,False,True,'');
   fPacperdaganho     := CreateCmDbField('PACPERDAGANHO',ftString,False,False,False,True,'');
   fPacperccustotel   := CreateCmDbField('PACPERCCUSTOTEL',ftfloat,False,False,False,True,'');
   fPacpagina         := CreateCmDbField('PACPAGINA',ftfloat,False,False,False,True,'');
   fPacordemsubconta  := CreateCmDbField('PACORDEMSUBCONTA',ftString,False,False,False,True,'');
   fPacobrigahist     := CreateCmDbField('PACOBRIGAHIST',ftString,False,False,False,True,'');
   fPacobrigadata     := CreateCmDbField('PACOBRIGADATA',ftString,False,False,False,True,'');
   fPacnumdoc         := CreateCmDbField('PACNUMDOC',ftString,False,False,False,True,'');
   fPacmoedaoficial   := CreateCmDbField('PACMOEDAOFICIAL',ftfloat,False,False,False,True,'');
   fPacmoedageren2    := CreateCmDbField('PACMOEDAGEREN2',ftfloat,False,False,False,True,'');
   fPacmoedageren1    := CreateCmDbField('PACMOEDAGEREN1',ftfloat,False,False,False,True,'');
   fPacmoedagerencial := CreateCmDbField('PACMOEDAGERENCIAL',ftfloat,False,False,False,True,'');
   fPacmoedacotas     := CreateCmDbField('PACMOEDACOTAS',ftfloat,False,False,False,True,'');
   fPacmantem         := CreateCmDbField('PACMANTEM',ftString,True,False,False,True,'');
   fPacindice         := CreateCmDbField('PACINDICE',ftString,False,False,False,True,'');
   fPachistdefsup     := CreateCmDbField('PACHISTDEFSUP',ftString,False,False,False,True,'');
   fPacformsupetecn   := CreateCmDbField('PACFORMSUPETECN',ftString,False,False,False,True,'');
   fPacformdefitecn   := CreateCmDbField('PACFORMDEFITECN',ftString,False,False,False,True,'');
   fPacfdocoboscrisca := CreateCmDbField('PACFDOCOBOSCRISCA',ftString,False,False,False,True,'');
   fPacfdocoboscrisc  := CreateCmDbField('PACFDOCOBOSCRISC',ftString,False,False,False,True,'');
   fPacexercicioatual := CreateCmDbField('PACEXERCICIOATUAL',ftfloat,False,False,False,True,'');
   fPacestorna        := CreateCmDbField('PACESTORNA',ftString,False,False,False,True,'');
   fPacencer          := CreateCmDbField('PACENCER',ftString,False,False,False,True,'');
   fPacdobrada        := CreateCmDbField('PACDOBRADA',ftString,False,False,False,True,'');
   fPacdiames         := CreateCmDbField('PACDIAMES',ftString,True,False,False,True,'');
   fPacdefitecna      := CreateCmDbField('PACDEFITECNA',ftString,False,False,False,True,'');
   fPacdefitecn       := CreateCmDbField('PACDEFITECN',ftString,False,False,False,True,'');
   fPacdebcreplanerro := CreateCmDbField('PACDEBCREPLANERRO',ftfloat,False,False,False,True,'');
   fPacdebcre         := CreateCmDbField('PACDEBCRE',ftString,True,False,False,True,'');
   fPacdatabloq       := CreateCmDbField('PACDATABLOQ',ftDateTime,False,False,False,True,'');
   fPaccorrespond     := CreateCmDbField('PACCORRESPOND',ftString,False,False,False,True,'');
   fPaccontranatur    := CreateCmDbField('PACCONTRANATUR',ftString,False,False,False,True,'');
   fPaccontacustotel  := CreateCmDbField('PACCONTACUSTOTEL',ftString,False,False,False,True,'');
   fPacconresult      := CreateCmDbField('PACCONRESULT',ftString,False,False,False,True,'');
   fPaccodred         := CreateCmDbField('PACCODRED',ftString,True,False,False,True,'');
   fPacatsal          := CreateCmDbField('PACATSAL',ftString,False,False,False,True,'');
   fPacativproj       := CreateCmDbField('PACATIVPROJ',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'');
   fIdultreferencia   := CreateCmDbField('IDULTREFERENCIA',ftfloat,False,False,False,True,'');
   fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fFlgtipofechamento := CreateCmDbField('FLGTIPOFECHAMENTO',ftString,False,False,False,True,'');
   fFlgpermitezero    := CreateCmDbField('FLGPERMITEZERO',ftString,False,False,False,True,'');
   fFlghistcaixaalta  := CreateCmDbField('FLGHISTCAIXAALTA',ftString,False,False,False,True,'');
   fDataultfecha      := CreateCmDbField('DATAULTFECHA',ftDateTime,False,False,False,True,'');
   fCaminhofidelio    := CreateCmDbField('CAMINHOFIDELIO',ftString,False,False,False,True,'');
end;

function TDbParamcontab.Insert: Boolean;
begin

  // fIdpessoa.AsFloat := GetSequence('PARAMCONTAB');
   Result := Inherited Insert;

end;

function TDbParamcontab.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbParamcontab.SetCaminhofidelio(const Value: TCmDbField);
begin
  FCaminhofidelio := Value;
end;

procedure TDbParamcontab.SetContacontabcli(const Value: TCmDbField);
begin
   FContacontabcli := Value;
end;

procedure TDbParamcontab.SetContacredcli(const Value: TCmDbField);
begin
   FContacredcli  := Value;
end;

procedure TDbParamcontab.SetDataultfecha(const Value: TCmDbField);
begin
  FDataultfecha := Value;
end;

procedure TDbParamcontab.SetFlghistcaixaalta(const Value: TCmDbField);
begin
  FFlghistcaixaalta := Value;
end;

procedure TDbParamcontab.SetFlgpermitezero(const Value: TCmDbField);
begin
  FFlgpermitezero := Value;
end;

procedure TDbParamcontab.SetFlgtipofechamento(const Value: TCmDbField);
begin
  FFlgtipofechamento := Value;
end;

procedure TDbParamcontab.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamcontab.SetIdultreferencia(const Value: TCmDbField);
begin
  FIdultreferencia := Value;
end;

procedure TDbParamcontab.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbParamcontab.SetPacativproj(const Value: TCmDbField);
begin
  FPacativproj := Value;
end;

procedure TDbParamcontab.SetPacatsal(const Value: TCmDbField);
begin
  FPacatsal := Value;
end;

procedure TDbParamcontab.SetPaccodred(const Value: TCmDbField);
begin
  FPaccodred := Value;
end;

procedure TDbParamcontab.SetPacconresult(const Value: TCmDbField);
begin
  FPacconresult := Value;
end;

procedure TDbParamcontab.SetPaccontacustotel(const Value: TCmDbField);
begin
  FPaccontacustotel := Value;
end;

procedure TDbParamcontab.SetPaccontranatur(const Value: TCmDbField);
begin
  FPaccontranatur := Value;
end;

procedure TDbParamcontab.SetPaccorrespond(const Value: TCmDbField);
begin
  FPaccorrespond := Value;
end;

procedure TDbParamcontab.SetPacdatabloq(const Value: TCmDbField);
begin
  FPacdatabloq := Value;
end;

procedure TDbParamcontab.SetPacdebcre(const Value: TCmDbField);
begin
  FPacdebcre := Value;
end;

procedure TDbParamcontab.SetPacdebcreplanerro(const Value: TCmDbField);
begin
  FPacdebcreplanerro := Value;
end;

procedure TDbParamcontab.SetPacdefitecn(const Value: TCmDbField);
begin
  FPacdefitecn := Value;
end;

procedure TDbParamcontab.SetPacdefitecna(const Value: TCmDbField);
begin
  FPacdefitecna := Value;
end;

procedure TDbParamcontab.SetPacdiames(const Value: TCmDbField);
begin
  FPacdiames := Value;
end;

procedure TDbParamcontab.SetPacdobrada(const Value: TCmDbField);
begin
  FPacdobrada := Value;
end;

procedure TDbParamcontab.SetPacencer(const Value: TCmDbField);
begin
  FPacencer := Value;
end;

procedure TDbParamcontab.SetPacestorna(const Value: TCmDbField);
begin
  FPacestorna := Value;
end;

procedure TDbParamcontab.SetPacexercicioatual(const Value: TCmDbField);
begin
  FPacexercicioatual := Value;
end;

procedure TDbParamcontab.SetPacfdocoboscrisc(const Value: TCmDbField);
begin
  FPacfdocoboscrisc := Value;
end;

procedure TDbParamcontab.SetPacfdocoboscrisca(const Value: TCmDbField);
begin
  FPacfdocoboscrisca := Value;
end;

procedure TDbParamcontab.SetPacformdefitecn(const Value: TCmDbField);
begin
  FPacformdefitecn := Value;
end;

procedure TDbParamcontab.SetPacformsupetecn(const Value: TCmDbField);
begin
  FPacformsupetecn := Value;
end;

procedure TDbParamcontab.SetPachistdefsup(const Value: TCmDbField);
begin
  FPachistdefsup := Value;
end;

procedure TDbParamcontab.SetPacindice(const Value: TCmDbField);
begin
  FPacindice := Value;
end;

procedure TDbParamcontab.SetPacmantem(const Value: TCmDbField);
begin
  FPacmantem := Value;
end;

procedure TDbParamcontab.SetPacmoedacotas(const Value: TCmDbField);
begin
  FPacmoedacotas := Value;
end;

procedure TDbParamcontab.SetPacmoedageren1(const Value: TCmDbField);
begin
  FPacmoedageren1 := Value;
end;

procedure TDbParamcontab.SetPacmoedageren2(const Value: TCmDbField);
begin
  FPacmoedageren2 := Value;
end;

procedure TDbParamcontab.SetPacmoedagerencial(const Value: TCmDbField);
begin
  FPacmoedagerencial := Value;
end;

procedure TDbParamcontab.SetPacmoedaoficial(const Value: TCmDbField);
begin
  FPacmoedaoficial := Value;
end;

procedure TDbParamcontab.SetPacnumdoc(const Value: TCmDbField);
begin
  FPacnumdoc := Value;
end;

procedure TDbParamcontab.SetPacobrigadata(const Value: TCmDbField);
begin
  FPacobrigadata := Value;
end;

procedure TDbParamcontab.SetPacobrigahist(const Value: TCmDbField);
begin
  FPacobrigahist := Value;
end;

procedure TDbParamcontab.SetPacordemsubconta(const Value: TCmDbField);
begin
  FPacordemsubconta := Value;
end;

procedure TDbParamcontab.SetPacpagina(const Value: TCmDbField);
begin
  FPacpagina := Value;
end;

procedure TDbParamcontab.SetPacperccustotel(const Value: TCmDbField);
begin
  FPacperccustotel := Value;
end;

procedure TDbParamcontab.SetPacperdaganho(const Value: TCmDbField);
begin
  FPacperdaganho := Value;
end;

procedure TDbParamcontab.SetPacpernullatualiz(const Value: TCmDbField);
begin
  FPacpernullatualiz := Value;
end;

procedure TDbParamcontab.SetPacpesqplalanc(const Value: TCmDbField);
begin
   FPacpesqplalanc := Value;
end;

procedure TDbParamcontab.SetPacplncodigo(const Value: TCmDbField);
begin
   FPacplncodigo := Value;
end;

procedure TDbParamcontab.SetPacprogprev(const Value: TCmDbField);
begin
  FPacprogprev := Value;
end;

procedure TDbParamcontab.SetPacreduaf(const Value: TCmDbField);
begin
  FPacreduaf := Value;
end;

procedure TDbParamcontab.SetPacreduai(const Value: TCmDbField);
begin
  FPacreduai := Value;
end;

procedure TDbParamcontab.SetPacreducf(const Value: TCmDbField);
begin
  FPacreducf := Value;
end;

procedure TDbParamcontab.SetPacreduci(const Value: TCmDbField);
begin
  FPacreduci := Value;
end;

procedure TDbParamcontab.SetPacredudf(const Value: TCmDbField);
begin
  FPacredudf := Value;
end;

procedure TDbParamcontab.SetPacredudi(const Value: TCmDbField);
begin
  FPacredudi := Value;
end;

procedure TDbParamcontab.SetPacreduef(const Value: TCmDbField);
begin
  FPacreduef := Value;
end;

procedure TDbParamcontab.SetPacreduei(const Value: TCmDbField);
begin
  FPacreduei := Value;
end;

procedure TDbParamcontab.SetPacreduof(const Value: TCmDbField);
begin
  FPacreduof := Value;
end;

procedure TDbParamcontab.SetPacreduoi(const Value: TCmDbField);
begin
  FPacreduoi := Value;
end;

procedure TDbParamcontab.SetPacredupf(const Value: TCmDbField);
begin
  FPacredupf := Value;
end;

procedure TDbParamcontab.SetPacredupi(const Value: TCmDbField);
begin
  FPacredupi := Value;
end;

procedure TDbParamcontab.SetPacredurf(const Value: TCmDbField);
begin
  FPacredurf := Value;
end;

procedure TDbParamcontab.SetPacreduri(const Value: TCmDbField);
begin
  FPacreduri := Value;
end;

procedure TDbParamcontab.SetPacreduza(const Value: TCmDbField);
begin
  FPacreduza := Value;
end;

procedure TDbParamcontab.SetPacreduzc(const Value: TCmDbField);
begin
  FPacreduzc := Value;
end;

procedure TDbParamcontab.SetPacreduzd(const Value: TCmDbField);
begin
  FPacreduzd := Value;
end;

procedure TDbParamcontab.SetPacreduze(const Value: TCmDbField);
begin
  FPacreduze := Value;
end;

procedure TDbParamcontab.SetPacreduzo(const Value: TCmDbField);
begin
  FPacreduzo := Value;
end;

procedure TDbParamcontab.SetPacreduzp(const Value: TCmDbField);
begin
  FPacreduzp := Value;
end;

procedure TDbParamcontab.SetPacreduzr(const Value: TCmDbField);
begin
  FPacreduzr := Value;
end;

procedure TDbParamcontab.SetPacresecont(const Value: TCmDbField);
begin
  FPacresecont := Value;
end;

procedure TDbParamcontab.SetPacreseconta(const Value: TCmDbField);
begin
  FPacreseconta := Value;
end;

procedure TDbParamcontab.SetPacresemat(const Value: TCmDbField);
begin
  FPacresemat := Value;
end;

procedure TDbParamcontab.SetPacrevedefitecn(const Value: TCmDbField);
begin
  FPacrevedefitecn := Value;
end;

procedure TDbParamcontab.SetPacrevesupetecn(const Value: TCmDbField);
begin
  FPacrevesupetecn := Value;
end;

procedure TDbParamcontab.SetPacsubgrp1(const Value: TCmDbField);
begin
  FPacsubgrp1 := Value;
end;

procedure TDbParamcontab.SetPacsubgrp2(const Value: TCmDbField);
begin
  FPacsubgrp2 := Value;
end;

procedure TDbParamcontab.SetPacsubgrp3(const Value: TCmDbField);
begin
  FPacsubgrp3 := Value;
end;

procedure TDbParamcontab.SetPacsubgrp4(const Value: TCmDbField);
begin
  FPacsubgrp4 := Value;
end;

procedure TDbParamcontab.SetPactipooper(const Value: TCmDbField);
begin
  FPactipooper := Value;
end;

procedure TDbParamcontab.SetPactipoperimptxt(const Value: TCmDbField);
begin
  FPactipoperimptxt := Value;
end;

procedure TDbParamcontab.SetPactipoperlanc(const Value: TCmDbField);
begin
  FPactipoperlanc := Value;
end;

procedure TDbParamcontab.SetPactipopermoeda(const Value: TCmDbField);
begin
  FPactipopermoeda := Value;
end;

procedure TDbParamcontab.SetPactipoperresult(const Value: TCmDbField);
begin
  FPactipoperresult := Value;
end;

procedure TDbParamcontab.SetPactotais(const Value: TCmDbField);
begin
  FPactotais := Value;
end;

procedure TDbParamcontab.SetPactotplanerro(const Value: TCmDbField);
begin
  FPactotplanerro := Value;
end;

procedure TDbParamcontab.SetPacultdat(const Value: TCmDbField);
begin
  FPacultdat := Value;
end;

procedure TDbParamcontab.SetPacvalidaproc(const Value: TCmDbField);
begin
  FPacvalidaproc := Value;
end;

procedure TDbParamcontab.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;
 {
procedure TDbParamcontab.SetPlanoContabCli(const Value: TCmDbField);
begin
   FPlanoContabCli := Value;
end;

procedure TDbParamcontab.SetPlanoCredCli(const Value: TCmDbField);
begin
   FPlanoCredCli := Value;

end;
     }

end.



