{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbWebPessoa;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbWebPessoa = class(TCmDbObject)

  private
    FFlgbolsavalores: TCmDbField;
    FFlgcandidato: TCmDbField;
    FFlgaverbadora: TCmDbField;
    FFlgestrangeiro: TCmDbField;
    FFlgbenefprocuh: TCmDbField;
    FFlgelegivel: TCmDbField;
    FFlgadminimovel: TCmDbField;
    FFlgdependente: TCmDbField;
    FFlgagencia: TCmDbField;
    FIddocumento: TCmDbField;
    FFlgcanalrepresent: TCmDbField;
    FFlgusuario: TCmDbField;
    FFlgresponsavel: TCmDbField;
    FFlgsindicato: TCmDbField;
    FFlginstfin: TCmDbField;
    FFlglocatario: TCmDbField;
    FNome: TCmDbField;
    FFlgautarquia: TCmDbField;
    FFlgcotista: TCmDbField;
    FFlghospede: TCmDbField;
    FFlgempemitit: TCmDbField;
    FFlgadminfundo: TCmDbField;
    FFlgadministradora: TCmDbField;
    FIdendcorresp: TCmDbField;
    FFlgcliente: TCmDbField;
    FIdendcomercial: TCmDbField;
    FIdendcobranca: TCmDbField;
    FFlgprodutor: TCmDbField;
    FHomepage: TCmDbField;
    FFlghotel: TCmDbField;
    FFlgterceiro: TCmDbField;
    FFlgcontato: TCmDbField;
    FFlgoutro: TCmDbField;
    FFlginvalido: TCmDbField;
    FFlgconcierge: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgproprietariouh: TCmDbField;
    FFlgfundacao: TCmDbField;
    FRazaosocial: TCmDbField;
    FFlgvendedor: TCmDbField;
    FMascaracc: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdmodulorespon: TCmDbField;
    FFlgcorretoravalor: TCmDbField;
    FNumdocumento: TCmDbField;
    FFlgbolsa: TCmDbField;
    FFlgoperadormanut: TCmDbField;
    FFlgavalista: TCmDbField;
    FIdendentrega: TCmDbField;
    FMascaraagencia: TCmDbField;
    FFlgagenciaviagem: TCmDbField;
    FFlgvalidacc: TCmDbField;
    FFlgemissor: TCmDbField;
    FSeqtransmissao: TCmDbField;
    FFlgcustodiante: TCmDbField;
    FEmail: TCmDbField;
    FIdimagem: TCmDbField;
    FIdendresidencial: TCmDbField;
    FFlgfilialpessoa: TCmDbField;
    FFlgbanco: TCmDbField;
    FFlggestorfundo: TCmDbField;
    FTipo: TCmDbField;
    FFlgrepresentante: TCmDbField;
    FFlgpatrocinadora: TCmDbField;
    FFlggestorcarteira: TCmDbField;
    FFlgpagador: TCmDbField;
    FFlgfornserv: TCmDbField;
    FFlgfuncionario: TCmDbField;
    FIdWebLogAlteracao: TCmDbField;
    procedure SetEmail(const Value: TCmDbField);
    procedure SetFlgadminfundo(const Value: TCmDbField);
    procedure SetFlgadminimovel(const Value: TCmDbField);
    procedure SetFlgadministradora(const Value: TCmDbField);
    procedure SetFlgagencia(const Value: TCmDbField);
    procedure SetFlgagenciaviagem(const Value: TCmDbField);
    procedure SetFlgautarquia(const Value: TCmDbField);
    procedure SetFlgavalista(const Value: TCmDbField);
    procedure SetFlgaverbadora(const Value: TCmDbField);
    procedure SetFlgbanco(const Value: TCmDbField);
    procedure SetFlgbenefprocuh(const Value: TCmDbField);
    procedure SetFlgbolsa(const Value: TCmDbField);
    procedure SetFlgbolsavalores(const Value: TCmDbField);
    procedure SetFlgcanalrepresent(const Value: TCmDbField);
    procedure SetFlgcandidato(const Value: TCmDbField);
    procedure SetFlgcliente(const Value: TCmDbField);
    procedure SetFlgconcierge(const Value: TCmDbField);
    procedure SetFlgcontato(const Value: TCmDbField);
    procedure SetFlgcorretoravalor(const Value: TCmDbField);
    procedure SetFlgcotista(const Value: TCmDbField);
    procedure SetFlgcustodiante(const Value: TCmDbField);
    procedure SetFlgdependente(const Value: TCmDbField);
    procedure SetFlgelegivel(const Value: TCmDbField);
    procedure SetFlgemissor(const Value: TCmDbField);
    procedure SetFlgempemitit(const Value: TCmDbField);
    procedure SetFlgestrangeiro(const Value: TCmDbField);
    procedure SetFlgfilialpessoa(const Value: TCmDbField);
    procedure SetFlgfornserv(const Value: TCmDbField);
    procedure SetFlgfuncionario(const Value: TCmDbField);
    procedure SetFlgfundacao(const Value: TCmDbField);
    procedure SetFlggestorcarteira(const Value: TCmDbField);
    procedure SetFlggestorfundo(const Value: TCmDbField);
    procedure SetFlghospede(const Value: TCmDbField);
    procedure SetFlghotel(const Value: TCmDbField);
    procedure SetFlginstfin(const Value: TCmDbField);
    procedure SetFlginvalido(const Value: TCmDbField);
    procedure SetFlglocatario(const Value: TCmDbField);
    procedure SetFlgoperadormanut(const Value: TCmDbField);
    procedure SetFlgoutro(const Value: TCmDbField);
    procedure SetFlgpagador(const Value: TCmDbField);
    procedure SetFlgpatrocinadora(const Value: TCmDbField);
    procedure SetFlgprodutor(const Value: TCmDbField);
    procedure SetFlgproprietariouh(const Value: TCmDbField);
    procedure SetFlgrepresentante(const Value: TCmDbField);
    procedure SetFlgresponsavel(const Value: TCmDbField);
    procedure SetFlgsindicato(const Value: TCmDbField);
    procedure SetFlgterceiro(const Value: TCmDbField);
    procedure SetFlgusuario(const Value: TCmDbField);
    procedure SetFlgvalidacc(const Value: TCmDbField);
    procedure SetFlgvendedor(const Value: TCmDbField);
    procedure SetHomepage(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdendcobranca(const Value: TCmDbField);
    procedure SetIdendcomercial(const Value: TCmDbField);
    procedure SetIdendcorresp(const Value: TCmDbField);
    procedure SetIdendentrega(const Value: TCmDbField);
    procedure SetIdendresidencial(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetIdmodulorespon(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMascaraagencia(const Value: TCmDbField);
    procedure SetMascaracc(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumdocumento(const Value: TCmDbField);
    procedure SetRazaosocial(const Value: TCmDbField);
    procedure SetSeqtransmissao(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetIdWebLogAlteracao(const Value: TCmDbField);

  public

     Property IdWebLogAlteracao: TCmDbField read FIdWebLogAlteracao write SetIdWebLogAlteracao;
     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Seqtransmissao: TCmDbField read FSeqtransmissao write SetSeqtransmissao;
     Property Razaosocial: TCmDbField read FRazaosocial write SetRazaosocial;
     Property Numdocumento: TCmDbField read FNumdocumento write SetNumdocumento;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Mascaracc: TCmDbField read FMascaracc write SetMascaracc;
     Property Mascaraagencia: TCmDbField read FMascaraagencia write SetMascaraagencia;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulorespon: TCmDbField read FIdmodulorespon write SetIdmodulorespon;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idendresidencial: TCmDbField read FIdendresidencial write SetIdendresidencial;
     Property Idendentrega: TCmDbField read FIdendentrega write SetIdendentrega;
     Property Idendcorresp: TCmDbField read FIdendcorresp write SetIdendcorresp;
     Property Idendcomercial: TCmDbField read FIdendcomercial write SetIdendcomercial;
     Property Idendcobranca: TCmDbField read FIdendcobranca write SetIdendcobranca;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Homepage: TCmDbField read FHomepage write SetHomepage;
     Property Flgvendedor: TCmDbField read FFlgvendedor write SetFlgvendedor;
     Property Flgvalidacc: TCmDbField read FFlgvalidacc write SetFlgvalidacc;
     Property Flgusuario: TCmDbField read FFlgusuario write SetFlgusuario;
     Property Flgterceiro: TCmDbField read FFlgterceiro write SetFlgterceiro;
     Property Flgsindicato: TCmDbField read FFlgsindicato write SetFlgsindicato;
     Property Flgresponsavel: TCmDbField read FFlgresponsavel write SetFlgresponsavel;
     Property Flgrepresentante: TCmDbField read FFlgrepresentante write SetFlgrepresentante;
     Property Flgproprietariouh: TCmDbField read FFlgproprietariouh write SetFlgproprietariouh;
     Property Flgprodutor: TCmDbField read FFlgprodutor write SetFlgprodutor;
     Property Flgpatrocinadora: TCmDbField read FFlgpatrocinadora write SetFlgpatrocinadora;
     Property Flgpagador: TCmDbField read FFlgpagador write SetFlgpagador;
     Property Flgoutro: TCmDbField read FFlgoutro write SetFlgoutro;
     Property Flgoperadormanut: TCmDbField read FFlgoperadormanut write SetFlgoperadormanut;
     Property Flglocatario: TCmDbField read FFlglocatario write SetFlglocatario;
     Property Flginvalido: TCmDbField read FFlginvalido write SetFlginvalido;
     Property Flginstfin: TCmDbField read FFlginstfin write SetFlginstfin;
     Property Flghotel: TCmDbField read FFlghotel write SetFlghotel;
     Property Flghospede: TCmDbField read FFlghospede write SetFlghospede;
     Property Flggestorfundo: TCmDbField read FFlggestorfundo write SetFlggestorfundo;
     Property Flggestorcarteira: TCmDbField read FFlggestorcarteira write SetFlggestorcarteira;
     Property Flgfundacao: TCmDbField read FFlgfundacao write SetFlgfundacao;
     Property Flgfuncionario: TCmDbField read FFlgfuncionario write SetFlgfuncionario;
     Property Flgfornserv: TCmDbField read FFlgfornserv write SetFlgfornserv;
     Property Flgfilialpessoa: TCmDbField read FFlgfilialpessoa write SetFlgfilialpessoa;
     Property Flgestrangeiro: TCmDbField read FFlgestrangeiro write SetFlgestrangeiro;
     Property Flgempemitit: TCmDbField read FFlgempemitit write SetFlgempemitit;
     Property Flgemissor: TCmDbField read FFlgemissor write SetFlgemissor;
     Property Flgelegivel: TCmDbField read FFlgelegivel write SetFlgelegivel;
     Property Flgdependente: TCmDbField read FFlgdependente write SetFlgdependente;
     Property Flgcustodiante: TCmDbField read FFlgcustodiante write SetFlgcustodiante;
     Property Flgcotista: TCmDbField read FFlgcotista write SetFlgcotista;
     Property Flgcorretoravalor: TCmDbField read FFlgcorretoravalor write SetFlgcorretoravalor;
     Property Flgcontato: TCmDbField read FFlgcontato write SetFlgcontato;
     Property Flgconcierge: TCmDbField read FFlgconcierge write SetFlgconcierge;
     Property Flgcliente: TCmDbField read FFlgcliente write SetFlgcliente;
     Property Flgcandidato: TCmDbField read FFlgcandidato write SetFlgcandidato;
     Property Flgcanalrepresent: TCmDbField read FFlgcanalrepresent write SetFlgcanalrepresent;
     Property Flgbolsavalores: TCmDbField read FFlgbolsavalores write SetFlgbolsavalores;
     Property Flgbolsa: TCmDbField read FFlgbolsa write SetFlgbolsa;
     Property Flgbenefprocuh: TCmDbField read FFlgbenefprocuh write SetFlgbenefprocuh;
     Property Flgbanco: TCmDbField read FFlgbanco write SetFlgbanco;
     Property Flgaverbadora: TCmDbField read FFlgaverbadora write SetFlgaverbadora;
     Property Flgavalista: TCmDbField read FFlgavalista write SetFlgavalista;
     Property Flgautarquia: TCmDbField read FFlgautarquia write SetFlgautarquia;
     Property Flgagenciaviagem: TCmDbField read FFlgagenciaviagem write SetFlgagenciaviagem;
     Property Flgagencia: TCmDbField read FFlgagencia write SetFlgagencia;
     Property Flgadministradora: TCmDbField read FFlgadministradora write SetFlgadministradora;
     Property Flgadminimovel: TCmDbField read FFlgadminimovel write SetFlgadminimovel;
     Property Flgadminfundo: TCmDbField read FFlgadminfundo write SetFlgadminfundo;
     Property Email: TCmDbField read FEmail write SetEmail;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbWebPessoa }

constructor TDbWebPessoa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBPESSOA';

   fIdWebLogAlteracao := CreateCmDbField('IDWEBLOGALTERACAO',ftFloat,True,True,False,True,'Id. Alteracao');
   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'');
   fSeqtransmissao := CreateCmDbField('SEQTRANSMISSAO',ftfloat,False,False,False,True,'');
   fRazaosocial := CreateCmDbField('RAZAOSOCIAL',ftString,False,False,False,True,'');
   fNumdocumento := CreateCmDbField('NUMDOCUMENTO',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fMascaracc := CreateCmDbField('MASCARACC',ftString,False,False,False,True,'');
   fMascaraagencia := CreateCmDbField('MASCARAAGENCIA',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id.Pessoa');
   fIdmodulorespon := CreateCmDbField('IDMODULORESPON',ftfloat,False,False,False,True,'');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdendresidencial := CreateCmDbField('IDENDRESIDENCIAL',ftfloat,False,False,False,True,'');
   fIdendentrega := CreateCmDbField('IDENDENTREGA',ftfloat,False,False,False,True,'');
   fIdendcorresp := CreateCmDbField('IDENDCORRESP',ftfloat,False,False,False,True,'');
   fIdendcomercial := CreateCmDbField('IDENDCOMERCIAL',ftfloat,False,False,False,True,'');
   fIdendcobranca := CreateCmDbField('IDENDCOBRANCA',ftfloat,False,False,False,True,'');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'');
   fHomepage := CreateCmDbField('HOMEPAGE',ftString,False,False,False,True,'');
   fFlgvendedor := CreateCmDbField('FLGVENDEDOR',ftfloat,False,False,False,True,'');
   fFlgvalidacc := CreateCmDbField('FLGVALIDACC',ftString,False,False,False,True,'');
   fFlgusuario := CreateCmDbField('FLGUSUARIO',ftfloat,False,False,False,True,'');
   fFlgterceiro := CreateCmDbField('FLGTERCEIRO',ftfloat,False,False,False,True,'');
   fFlgsindicato := CreateCmDbField('FLGSINDICATO',ftfloat,False,False,False,True,'');
   fFlgresponsavel := CreateCmDbField('FLGRESPONSAVEL',ftfloat,False,False,False,True,'');
   fFlgrepresentante := CreateCmDbField('FLGREPRESENTANTE',ftfloat,False,False,False,True,'');
   fFlgproprietariouh := CreateCmDbField('FLGPROPRIETARIOUH',ftfloat,False,False,False,True,'');
   fFlgprodutor := CreateCmDbField('FLGPRODUTOR',ftfloat,False,False,False,True,'');
   fFlgpatrocinadora := CreateCmDbField('FLGPATROCINADORA',ftfloat,False,False,False,True,'');
   fFlgpagador := CreateCmDbField('FLGPAGADOR',ftfloat,False,False,False,True,'');
   fFlgoutro := CreateCmDbField('FLGOUTRO',ftfloat,False,False,False,True,'');
   fFlgoperadormanut := CreateCmDbField('FLGOPERADORMANUT',ftfloat,False,False,False,True,'');
   fFlglocatario := CreateCmDbField('FLGLOCATARIO',ftfloat,False,False,False,True,'');
   fFlginvalido := CreateCmDbField('FLGINVALIDO',ftfloat,False,False,False,True,'');
   fFlginstfin := CreateCmDbField('FLGINSTFIN',ftfloat,False,False,False,True,'');
   fFlghotel := CreateCmDbField('FLGHOTEL',ftfloat,False,False,False,True,'');
   fFlghospede := CreateCmDbField('FLGHOSPEDE',ftfloat,False,False,False,True,'');
   fFlggestorfundo := CreateCmDbField('FLGGESTORFUNDO',ftfloat,False,False,False,True,'');
   fFlggestorcarteira := CreateCmDbField('FLGGESTORCARTEIRA',ftfloat,False,False,False,True,'');
   fFlgfundacao := CreateCmDbField('FLGFUNDACAO',ftfloat,False,False,False,True,'');
   fFlgfuncionario := CreateCmDbField('FLGFUNCIONARIO',ftfloat,False,False,False,True,'');
   fFlgfornserv := CreateCmDbField('FLGFORNSERV',ftfloat,False,False,False,True,'');
   fFlgfilialpessoa := CreateCmDbField('FLGFILIALPESSOA',ftfloat,False,False,False,True,'');
   fFlgestrangeiro := CreateCmDbField('FLGESTRANGEIRO',ftfloat,False,False,False,True,'');
   fFlgempemitit := CreateCmDbField('FLGEMPEMITIT',ftfloat,False,False,False,True,'');
   fFlgemissor := CreateCmDbField('FLGEMISSOR',ftfloat,False,False,False,True,'');
   fFlgelegivel := CreateCmDbField('FLGELEGIVEL',ftfloat,False,False,False,True,'');
   fFlgdependente := CreateCmDbField('FLGDEPENDENTE',ftfloat,False,False,False,True,'');
   fFlgcustodiante := CreateCmDbField('FLGCUSTODIANTE',ftfloat,False,False,False,True,'');
   fFlgcotista := CreateCmDbField('FLGCOTISTA',ftfloat,False,False,False,True,'');
   fFlgcorretoravalor := CreateCmDbField('FLGCORRETORAVALOR',ftfloat,False,False,False,True,'');
   fFlgcontato := CreateCmDbField('FLGCONTATO',ftfloat,False,False,False,True,'');
   fFlgconcierge := CreateCmDbField('FLGCONCIERGE',ftfloat,False,False,False,True,'');
   fFlgcliente := CreateCmDbField('FLGCLIENTE',ftfloat,False,False,False,True,'');
   fFlgcandidato := CreateCmDbField('FLGCANDIDATO',ftfloat,False,False,False,True,'');
   fFlgcanalrepresent := CreateCmDbField('FLGCANALREPRESENT',ftfloat,False,False,False,True,'');
   fFlgbolsavalores := CreateCmDbField('FLGBOLSAVALORES',ftfloat,False,False,False,True,'');
   fFlgbolsa := CreateCmDbField('FLGBOLSA',ftfloat,False,False,False,True,'');
   fFlgbenefprocuh := CreateCmDbField('FLGBENEFPROCUH',ftfloat,False,False,False,True,'');
   fFlgbanco := CreateCmDbField('FLGBANCO',ftfloat,False,False,False,True,'');
   fFlgaverbadora := CreateCmDbField('FLGAVERBADORA',ftfloat,False,False,False,True,'');
   fFlgavalista := CreateCmDbField('FLGAVALISTA',ftfloat,False,False,False,True,'');
   fFlgautarquia := CreateCmDbField('FLGAUTARQUIA',ftfloat,False,False,False,True,'');
   fFlgagenciaviagem := CreateCmDbField('FLGAGENCIAVIAGEM',ftfloat,False,False,False,True,'');
   fFlgagencia := CreateCmDbField('FLGAGENCIA',ftfloat,False,False,False,True,'');
   fFlgadministradora := CreateCmDbField('FLGADMINISTRADORA',ftfloat,False,False,False,True,'');
   fFlgadminimovel := CreateCmDbField('FLGADMINIMOVEL',ftfloat,False,False,False,True,'');
   fFlgadminfundo := CreateCmDbField('FLGADMINFUNDO',ftfloat,False,False,False,True,'');
   fEmail := CreateCmDbField('EMAIL',ftString,False,False,False,True,'');
end;

procedure TDbWebPessoa.SetEmail(const Value: TCmDbField);
begin
  FEmail := Value;
end;

procedure TDbWebPessoa.SetFlgadminfundo(const Value: TCmDbField);
begin
  FFlgadminfundo := Value;
end;

procedure TDbWebPessoa.SetFlgadminimovel(const Value: TCmDbField);
begin
  FFlgadminimovel := Value;
end;

procedure TDbWebPessoa.SetFlgadministradora(const Value: TCmDbField);
begin
  FFlgadministradora := Value;
end;

procedure TDbWebPessoa.SetFlgagencia(const Value: TCmDbField);
begin
  FFlgagencia := Value;
end;

procedure TDbWebPessoa.SetFlgagenciaviagem(const Value: TCmDbField);
begin
  FFlgagenciaviagem := Value;
end;

procedure TDbWebPessoa.SetFlgautarquia(const Value: TCmDbField);
begin
  FFlgautarquia := Value;
end;

procedure TDbWebPessoa.SetFlgavalista(const Value: TCmDbField);
begin
  FFlgavalista := Value;
end;

procedure TDbWebPessoa.SetFlgaverbadora(const Value: TCmDbField);
begin
  FFlgaverbadora := Value;
end;

procedure TDbWebPessoa.SetFlgbanco(const Value: TCmDbField);
begin
  FFlgbanco := Value;
end;

procedure TDbWebPessoa.SetFlgbenefprocuh(const Value: TCmDbField);
begin
  FFlgbenefprocuh := Value;
end;

procedure TDbWebPessoa.SetFlgbolsa(const Value: TCmDbField);
begin
  FFlgbolsa := Value;
end;

procedure TDbWebPessoa.SetFlgbolsavalores(const Value: TCmDbField);
begin
  FFlgbolsavalores := Value;
end;

procedure TDbWebPessoa.SetFlgcanalrepresent(const Value: TCmDbField);
begin
  FFlgcanalrepresent := Value;
end;

procedure TDbWebPessoa.SetFlgcandidato(const Value: TCmDbField);
begin
  FFlgcandidato := Value;
end;

procedure TDbWebPessoa.SetFlgcliente(const Value: TCmDbField);
begin
  FFlgcliente := Value;
end;

procedure TDbWebPessoa.SetFlgconcierge(const Value: TCmDbField);
begin
  FFlgconcierge := Value;
end;

procedure TDbWebPessoa.SetFlgcontato(const Value: TCmDbField);
begin
  FFlgcontato := Value;
end;

procedure TDbWebPessoa.SetFlgcorretoravalor(const Value: TCmDbField);
begin
  FFlgcorretoravalor := Value;
end;

procedure TDbWebPessoa.SetFlgcotista(const Value: TCmDbField);
begin
  FFlgcotista := Value;
end;

procedure TDbWebPessoa.SetFlgcustodiante(const Value: TCmDbField);
begin
  FFlgcustodiante := Value;
end;

procedure TDbWebPessoa.SetFlgdependente(const Value: TCmDbField);
begin
  FFlgdependente := Value;
end;

procedure TDbWebPessoa.SetFlgelegivel(const Value: TCmDbField);
begin
  FFlgelegivel := Value;
end;

procedure TDbWebPessoa.SetFlgemissor(const Value: TCmDbField);
begin
  FFlgemissor := Value;
end;

procedure TDbWebPessoa.SetFlgempemitit(const Value: TCmDbField);
begin
  FFlgempemitit := Value;
end;

procedure TDbWebPessoa.SetFlgestrangeiro(const Value: TCmDbField);
begin
  FFlgestrangeiro := Value;
end;

procedure TDbWebPessoa.SetFlgfilialpessoa(const Value: TCmDbField);
begin
  FFlgfilialpessoa := Value;
end;

procedure TDbWebPessoa.SetFlgfornserv(const Value: TCmDbField);
begin
  FFlgfornserv := Value;
end;

procedure TDbWebPessoa.SetFlgfuncionario(const Value: TCmDbField);
begin
  FFlgfuncionario := Value;
end;

procedure TDbWebPessoa.SetFlgfundacao(const Value: TCmDbField);
begin
  FFlgfundacao := Value;
end;

procedure TDbWebPessoa.SetFlggestorcarteira(const Value: TCmDbField);
begin
  FFlggestorcarteira := Value;
end;

procedure TDbWebPessoa.SetFlggestorfundo(const Value: TCmDbField);
begin
  FFlggestorfundo := Value;
end;

procedure TDbWebPessoa.SetFlghospede(const Value: TCmDbField);
begin
  FFlghospede := Value;
end;

procedure TDbWebPessoa.SetFlghotel(const Value: TCmDbField);
begin
  FFlghotel := Value;
end;

procedure TDbWebPessoa.SetFlginstfin(const Value: TCmDbField);
begin
  FFlginstfin := Value;
end;

procedure TDbWebPessoa.SetFlginvalido(const Value: TCmDbField);
begin
  FFlginvalido := Value;
end;

procedure TDbWebPessoa.SetFlglocatario(const Value: TCmDbField);
begin
  FFlglocatario := Value;
end;

procedure TDbWebPessoa.SetFlgoperadormanut(const Value: TCmDbField);
begin
  FFlgoperadormanut := Value;
end;

procedure TDbWebPessoa.SetFlgoutro(const Value: TCmDbField);
begin
  FFlgoutro := Value;
end;

procedure TDbWebPessoa.SetFlgpagador(const Value: TCmDbField);
begin
  FFlgpagador := Value;
end;

procedure TDbWebPessoa.SetFlgpatrocinadora(const Value: TCmDbField);
begin
  FFlgpatrocinadora := Value;
end;

procedure TDbWebPessoa.SetFlgprodutor(const Value: TCmDbField);
begin
  FFlgprodutor := Value;
end;

procedure TDbWebPessoa.SetFlgproprietariouh(const Value: TCmDbField);
begin
  FFlgproprietariouh := Value;
end;

procedure TDbWebPessoa.SetFlgrepresentante(const Value: TCmDbField);
begin
  FFlgrepresentante := Value;
end;

procedure TDbWebPessoa.SetFlgresponsavel(const Value: TCmDbField);
begin
  FFlgresponsavel := Value;
end;

procedure TDbWebPessoa.SetFlgsindicato(const Value: TCmDbField);
begin
  FFlgsindicato := Value;
end;

procedure TDbWebPessoa.SetFlgterceiro(const Value: TCmDbField);
begin
  FFlgterceiro := Value;
end;

procedure TDbWebPessoa.SetFlgusuario(const Value: TCmDbField);
begin
  FFlgusuario := Value;
end;

procedure TDbWebPessoa.SetFlgvalidacc(const Value: TCmDbField);
begin
  FFlgvalidacc := Value;
end;

procedure TDbWebPessoa.SetFlgvendedor(const Value: TCmDbField);
begin
  FFlgvendedor := Value;
end;

procedure TDbWebPessoa.SetHomepage(const Value: TCmDbField);
begin
  FHomepage := Value;
end;

procedure TDbWebPessoa.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbWebPessoa.SetIdendcobranca(const Value: TCmDbField);
begin
  FIdendcobranca := Value;
end;

procedure TDbWebPessoa.SetIdendcomercial(const Value: TCmDbField);
begin
  FIdendcomercial := Value;
end;

procedure TDbWebPessoa.SetIdendcorresp(const Value: TCmDbField);
begin
  FIdendcorresp := Value;
end;

procedure TDbWebPessoa.SetIdendentrega(const Value: TCmDbField);
begin
  FIdendentrega := Value;
end;

procedure TDbWebPessoa.SetIdendresidencial(const Value: TCmDbField);
begin
  FIdendresidencial := Value;
end;

procedure TDbWebPessoa.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbWebPessoa.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDbWebPessoa.SetIdmodulorespon(const Value: TCmDbField);
begin
  FIdmodulorespon := Value;
end;

procedure TDbWebPessoa.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbWebPessoa.SetIdWebLogAlteracao(const Value: TCmDbField);
begin
  FIdWebLogAlteracao := Value;
end;

procedure TDbWebPessoa.SetMascaraagencia(const Value: TCmDbField);
begin
  FMascaraagencia := Value;
end;

procedure TDbWebPessoa.SetMascaracc(const Value: TCmDbField);
begin
  FMascaracc := Value;
end;

procedure TDbWebPessoa.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbWebPessoa.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDbWebPessoa.SetRazaosocial(const Value: TCmDbField);
begin
  FRazaosocial := Value;
end;

procedure TDbWebPessoa.SetSeqtransmissao(const Value: TCmDbField);
begin
  FSeqtransmissao := Value;
end;

procedure TDbWebPessoa.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

end.



